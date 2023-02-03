Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E4C68949A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 11:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322DF10E735;
	Fri,  3 Feb 2023 10:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC5810E735;
 Fri,  3 Feb 2023 10:02:46 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id m2so4733704plg.4;
 Fri, 03 Feb 2023 02:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qkWGtLYvayKN703HCl0JMt6iGHIHxr57/oh7Oq4+1w=;
 b=CjqBewy3gcGmReNeU0w+GPmiJvC0WCkFKlywd0p2UyqeTnW6NEGQYBP5lUGWg0C7Cz
 SGnXepk9eVCAtVJviTMMSywzQNHUfau2lwG+7PwF3XO8kE8Hn3jkWYDwqpsT4aLuO7c3
 FfCLw+O4V06Wkg0e1UY50V8GOZe3It2BGlyhjxPq0cU8T4dHLw/5bDSiZ5Bu/oIxv/PD
 uITon58JWxVCIaptAAb19fcP5URnmDf7ON5MpqBa0cQgoKpf9FqToSDC+PQjCuJzlTkj
 VICtolL+GqtltJq5/nQGjjnjG0crJWIxRa9tKit009UUOlfwA2C+3EiP31+1kwoPeAjZ
 CmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1qkWGtLYvayKN703HCl0JMt6iGHIHxr57/oh7Oq4+1w=;
 b=QsRKzN248PxfR5UTlzb7SdoM+wp0AaCXaODgFNB8mbcJ369asSJPc9MJtbCenaqOuU
 0izR7R/jwpVZm2T6/vtqcxpU/dCjor+SjAayozC6gXbMrDB5x7A7myh8EOxtNY+MdGdd
 tr34IkEE/0uYTXL+Vpal9NR1IPLrwdNwcN27IQM2k0X3+RwP0A6HmSmct2yPdaXDKRLA
 zy4+ku43Gn5SiFOKh9Kk2ERWjQfqN8z5w9pVWgf+yr72AhHW37CnOtc4y5HqdOcZ5VVr
 okksKSEDZlrv1iI65IjSyTNzou9iAEDiq0lFcAhyKUrC/4zKaS2XMbznw83cC7XVXOZs
 +ASw==
X-Gm-Message-State: AO0yUKXUfC6moqhaezjCPvfd8NFJJBnvd1gDPu+drhbWd8WO/nDicRTx
 /rGb0zGP8kK8UPH1Evnt7qQ=
X-Google-Smtp-Source: AK7set+TY8YewT7QpLDSyIye4tTcIX+xyOgTtQnxf8cYJX2y7CHy2FUZyUr8czgco+Qgz8WleDPpNA==
X-Received: by 2002:a17:903:1cb:b0:196:cea:487a with SMTP id
 e11-20020a17090301cb00b001960cea487amr12244038plh.53.1675418566245; 
 Fri, 03 Feb 2023 02:02:46 -0800 (PST)
Received: from debian.me (subs09b-223-255-225-232.three.co.id.
 [223.255.225.232]) by smtp.gmail.com with ESMTPSA id
 t1-20020a1709027fc100b00192a96f4916sm1169971plb.259.2023.02.03.02.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 02:02:45 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 943FF1054A4; Fri,  3 Feb 2023 17:02:41 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Intel Graphics Development List <intel-gfx@lists.freedesktop.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH 1/3] drm/i915/doc: Escape wildcard in method names
Date: Fri,  3 Feb 2023 17:02:13 +0700
Message-Id: <20230203100215.31852-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203100215.31852-1-bagasdotme@gmail.com>
References: <20230203100215.31852-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2692; i=bagasdotme@gmail.com;
 h=from:subject; bh=N5hMks1GtbHQ4KjQuMm3ct/vgc6qjkdSsj8Qt7muNd4=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDMl3bi/T9n/L4m1z50o+N2Nmf+60zI1M4f2PbZftbaz7oLF+
 2tpfHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZhIQikjw61trnfPyZYL61RXMb20TP
 gY4WYdNO+K6wbJ/FN3m5MSUhkZOo+fdbl9OT5dW8fxxV3D+ynKQXq/qjx2zDt34XHYj4eq3AA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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
Cc: Srinivasan Shanmugam <srinivasan.s@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stephen Rothwell reported htmldocs warnings:

Documentation/gpu/i915:64: drivers/gpu/drm/i915/gt/intel_workarounds.c:32: WARNING: Inline emphasis start-string without end-string.
Documentation/gpu/i915:64: drivers/gpu/drm/i915/gt/intel_workarounds.c:57: WARNING: Inline emphasis start-string without end-string.
Documentation/gpu/i915:64: drivers/gpu/drm/i915/gt/intel_workarounds.c:66: WARNING: Inline emphasis start-string without end-string.

Escape wildcards in *_ctx_workarounds_init(), *_gt_workarounds_init(), and
*_whitelist_build() to fix above warnings.

Link: https://lore.kernel.org/linux-next/20230203134622.0b6315b9@canb.auug.org.au/
Fixes: 0c3064cf33fbfa ("drm/i915/doc: Document where to implement register workarounds")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 3111df350f5722..a00ec692d980c0 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -30,7 +30,7 @@
  *   creation to have a "primed golden context", i.e. a context image that
  *   already contains the changes needed to all the registers.
  *
- *   Context workarounds should be implemented in the *_ctx_workarounds_init()
+ *   Context workarounds should be implemented in the \*_ctx_workarounds_init()
  *   variants respective to the targeted platforms.
  *
  * - Engine workarounds: the list of these WAs is applied whenever the specific
@@ -55,7 +55,7 @@
  * - GT workarounds: the list of these WAs is applied whenever these registers
  *   revert to their default values: on GPU reset, suspend/resume [1]_, etc.
  *
- *   GT workarounds should be implemented in the *_gt_workarounds_init()
+ *   GT workarounds should be implemented in the \*_gt_workarounds_init()
  *   variants respective to the targeted platforms.
  *
  * - Register whitelist: some workarounds need to be implemented in userspace,
@@ -64,7 +64,7 @@
  *   this is just a special case of a MMIO workaround (as we write the list of
  *   these to/be-whitelisted registers to some special HW registers).
  *
- *   Register whitelisting should be done in the *_whitelist_build() variants
+ *   Register whitelisting should be done in the \*_whitelist_build() variants
  *   respective to the targeted platforms.
  *
  * - Workaround batchbuffers: buffers that get executed automatically by the
-- 
An old man doll... just what I always wanted! - Clara

