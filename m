Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8010737BCF6
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 14:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79EB6EB97;
	Wed, 12 May 2021 12:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6446EB98;
 Wed, 12 May 2021 12:51:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7E7361454;
 Wed, 12 May 2021 12:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620823907;
 bh=VpLsYBUyxDPAUDeiKOZVygRyVEGODhV1GMIGsuEHRw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d4ErpNmWuXPXwpYmM0WD3X3ndNvX6sdaPHNGfQox7AganJxqVD8ocW4BEWnv4nmKn
 XJTJvPp6CoXKohvw2txq7Ia6t/6Duy85XYaH/SZss+4lvjGHh1A4W8cBE2HCEdW1ee
 28A2w8PErov9IzB9E6gHlP5wEmnyox03kNDKNZPVItCOsZbxIwMWlQHfwQQJ2Xe+7F
 NTY9V12DhSzXMyj49d1frFU3PmSdOTt1aqVQpo2jziGcr9mQw+9kYpS64xhA9Hnmto
 jmeXAwbSkKb2RT1erWYvNYfiRiE3lArGVMEqCqnhfDdLkvviVtfgCdVp1XDan0twvu
 t9JgY28eMeI7A==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1lgoL3-0018nT-IX; Wed, 12 May 2021 14:51:45 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 32/40] docs: gpu: Use ASCII subset instead of UTF-8
 alternate symbols
Date: Wed, 12 May 2021 14:50:36 +0200
Message-Id: <2edfac4e4081d531f039cbebd9545789ebdcca6c.1620823573.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620823573.git.mchehab+huawei@kernel.org>
References: <cover.1620823573.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The conversion tools used during DocBook/LaTeX/Markdown->ReST conversion
and some automatic rules which exists on certain text editors like
LibreOffice turned ASCII characters into some UTF-8 alternatives that
are better displayed on html and PDF.

While it is OK to use UTF-8 characters in Linux, it is better to
use the ASCII subset instead of using an UTF-8 equivalent character
as it makes life easier for tools like grep, and are easier to edit
with the some commonly used text/source code editors.

Also, Sphinx already do such conversion automatically outside literal blocks:
   https://docutils.sourceforge.io/docs/user/smartquotes.html

So, replace the occurences of the following UTF-8 characters:

	- U+2019 ('’'): RIGHT SINGLE QUOTATION MARK

Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/gpu/i915.rst       | 2 +-
 Documentation/gpu/komeda-kms.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 486c720f3890..2cbf54460b48 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -361,7 +361,7 @@ Locking Guidelines
 	  real bad.
 
 #. Do not nest different lru/memory manager locks within each other.
-   Take them in turn to update memory allocations, relying on the object’s
+   Take them in turn to update memory allocations, relying on the object's
    dma_resv ww_mutex to serialize against other operations.
 
 #. The suggestion for lru/memory managers locks is that they are small
diff --git a/Documentation/gpu/komeda-kms.rst b/Documentation/gpu/komeda-kms.rst
index eb693c857e2d..c2067678e92c 100644
--- a/Documentation/gpu/komeda-kms.rst
+++ b/Documentation/gpu/komeda-kms.rst
@@ -324,7 +324,7 @@ the control-abilites of device.
 
 We have &komeda_dev, &komeda_pipeline, &komeda_component. Now fill devices with
 pipelines. Since komeda is not for D71 only but also intended for later products,
-of course we’d better share as much as possible between different products. To
+of course we'd better share as much as possible between different products. To
 achieve this, split the komeda device into two layers: CORE and CHIP.
 
 -   CORE: for common features and capabilities handling.
-- 
2.30.2

