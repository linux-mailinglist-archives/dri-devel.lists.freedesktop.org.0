Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D374CE26
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEC110E1C5;
	Mon, 10 Jul 2023 07:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA1310E19E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 04:05:36 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4Qzr546j65zBHXgk
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 12:05:28 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688961928; x=1691553929; bh=cnZBI7U3lIITIHLY98l50CsDLls
 BGTgz6H9cvCDkx8k=; b=c333Y7tB+/CYcqDWpKGZq730C/9R5EHPvIXWYnKRVbJ
 kbN4Yt2a3aX3YDATizXoQNjt/+TuofRb7c4hRAPxC+RUw2TkVSZecbxfr8r9qQ4u
 cs0F0E204GxvOe92444aX9xsJQF49oKU0e4TSfbsgCAdliD3+o233vvLM/InsIvI
 DKI/lnWLdD0pYfNsV70QOxWLD2ano/eJJ9jzT4Q+EkMMl8UPJRCfUy7hACw64vqX
 XXC2k/KR72M23mhOvxrVf6uQjgJCkV/IPG+b0cNE/BHpKHydNEKJubvFiK8CVYh2
 m3TJyzM0eChqFUEN/eKPMeKxLTugyWj48zMnpCpW6xQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ol0wKxl2HQ22 for <dri-devel@lists.freedesktop.org>;
 Mon, 10 Jul 2023 12:05:28 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4Qzr544Zs8zBHXgf;
 Mon, 10 Jul 2023 12:05:28 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 12:05:28 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/i2c: do not use assignment in if condition
In-Reply-To: <20230710040334.53045-1-xujianghui@cdjrlc.com>
References: <20230710040334.53045-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <2c2765a57b940f56af70cd7f5af03817@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:22:46 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assignments in if condition are less readable and error-prone.  Fixes
also checkpatch warning:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.c | 0
  1 file changed, 0 insertions(+), 0 deletions(-)
  mode change 100755 => 100644 
drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.c

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.c
old mode 100755
new mode 100644
