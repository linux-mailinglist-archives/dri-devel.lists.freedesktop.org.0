Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD7A74E458
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 04:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CADC10E1CA;
	Tue, 11 Jul 2023 02:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5EC10E1CA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 02:38:46 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0Q6V6Y7GzBHXkY
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 10:38:42 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689043122; x=1691635123; bh=s/qiL5OvwRpw8d931IAUYCY4uTp
 XmPulPbfcEyZ7+GA=; b=u0scnuf5kojhE7Sa9FVxSeOk0v/OoUA7rsqInz5wQ1l
 XqZsQKmMBZLei7A+J4h1DnRNslHRIHygi2Sjfn0GrQTCyx5pAZ97IEGQQ9knUr9t
 BqdZJnSVj5FDPnTo/OW00aFr6GWKGemMv5nNfu2jPmAkDs/RoMRaGUn9uZQ4nTb2
 BoNkzzJYGUTZnvjcLY1xU+ylHT3Pt30xGevW0nsZfKbFQQfqywA3qoYC4/jR46qu
 fTcM2LxhPFCs+77IYJYZ1ioTvKPELn5sgpG8sYbfedrZyw+2+1QyoQ+WMcI/WDVa
 lIraeESyoKOVCNcdr/APBEpb/8WBcMTto2tOdU/qezA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dv5lo0D84XUB for <dri-devel@lists.freedesktop.org>;
 Tue, 11 Jul 2023 10:38:42 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0Q6V3XDKzBHXhc;
 Tue, 11 Jul 2023 10:38:42 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 10:38:42 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/volt: Move assignment outside if condition
In-Reply-To: <20230711023631.78374-1-xujianghui@cdjrlc.com>
References: <20230711023631.78374-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <b7c038a6d2f8484e348ad977565ae9e6@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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

Fixes the following checkpatch errors:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c
index a17a6dd8d3de..d1ae98a42e34 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c
@@ -321,7 +321,8 @@ int
  nvkm_volt_new_(const struct nvkm_volt_func *func, struct nvkm_device 
*device,
             enum nvkm_subdev_type type, int inst, struct nvkm_volt 
**pvolt)
  {
-    if (!(*pvolt = kzalloc(sizeof(**pvolt), GFP_KERNEL)))
+    *pvolt = kzalloc(sizeof(**pvolt), GFP_KERNEL);
+    if (!*pvolt)
          return -ENOMEM;
      nvkm_volt_ctor(func, device, type, inst, *pvolt);
      return 0;
