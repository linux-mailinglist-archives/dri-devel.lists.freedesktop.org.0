Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F45C74E422
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 04:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6099E10E19C;
	Tue, 11 Jul 2023 02:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8077E10E1CA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 02:31:48 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0PyT3CkszBHXhd
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 10:31:45 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-type:message-id:user-agent:references:in-reply-to
 :subject:to:from:date:mime-version; s=dkim; t=1689042705; x=
 1691634706; bh=sZFf8nEPCt6sgcFf3AwXOvUb4nHVIdvsXdMlw2ABBj4=; b=v
 bf/aI8JCrs3fl+20oqa0E0BFpJBK72FjL6KTutePVcQi+RwJMMaI1gibQMEQSgzx
 hZGL5eQVUlcaSRacP0js1nqMbDfHh1r6TmKoOHh3HunilNFuldFm2zC16Z9boMFp
 n2GUycyXTX0jLmQ2jhJWO+Kk73FZ4NDLH1RoZB1GwPS8W0jNZChzx4hFcqJdnZCl
 F6fm/7AlJVSZ56+YP07iueCe8CN9POPF12XPrna1i2jPPDQI7W7iVIAmdPz0h0+n
 RX3mrvkvfEO7vdwgaJKZJkams47dqusiCNEJIQcUqyq8mpHEvGmWcakTvsl1ldJP
 REeQe8dZC7qAOXVC9izSQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Qj9ck5CflZtw for <dri-devel@lists.freedesktop.org>;
 Tue, 11 Jul 2023 10:31:45 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0PyT0XFVzBHXhc;
 Tue, 11 Jul 2023 10:31:45 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 10:31:44 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/volt/gk104: Move assignment outside if condition
In-Reply-To: <20230711022942.78260-1-xujianghui@cdjrlc.com>
References: <20230711022942.78260-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <bd3bd7ec598a7858fc0a90619eedd0ca@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: multipart/alternative;
 boundary="=_855b09989585a2a6eec31eacda0d5530"
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

--=_855b09989585a2a6eec31eacda0d5530
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed


Fixes the following checkpatch errors:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c
index d1ce4309cfb8..35ab4fa5d18e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c
@@ -113,7 +113,8 @@ gk104_volt_new(struct nvkm_device *device, enum 
nvkm_subdev_type type, int inst,
          volt_func = &gk104_volt_pwm;
      }

-    if (!(volt = kzalloc(sizeof(*volt), GFP_KERNEL)))
+    volt = kzalloc(sizeof(*volt), GFP_KERNEL);
+    if (!volt)
          return -ENOMEM;
      nvkm_volt_ctor(volt_func, device, type, inst, &volt->base);
      *pvolt = &volt->base;
--=_855b09989585a2a6eec31eacda0d5530
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 12pt; font-family: Verdana,Gen=
eva,sans-serif'>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Fixes the following checkpatch errors:<br /><br />ERROR: do not use assignm=
ent in if condition<br /><br />Signed-off-by: Ran Sun &lt;<a href=3D"mailto=
:xujianghui@cdjrlc.com">sunran001@208suo.com</a>&gt;<br />---<br />&nbsp;dr=
ivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c | 3 ++-<br />&nbsp;1 file ch=
anged, 2 insertions(+), 1 deletion(-)<br /><br />diff --git a/drivers/gpu/d=
rm/nouveau/nvkm/subdev/volt/gk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/v=
olt/gk104.c<br />index d1ce4309cfb8..35ab4fa5d18e 100644<br />--- a/drivers=
/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c<br />+++ b/drivers/gpu/drm/nouvea=
u/nvkm/subdev/volt/gk104.c<br />@@ -113,7 +113,8 @@ gk104_volt_new(struct n=
vkm_device *device, enum nvkm_subdev_type type, int inst,<br />&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;volt_func =3D &amp;gk104_volt_pwm=
;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />&nbsp;<br />- &nbsp;&nbsp;&nbsp=
;if (!(volt =3D kzalloc(sizeof(*volt), GFP_KERNEL)))<br />+ &nbsp;&nbsp;&nb=
sp;volt =3D kzalloc(sizeof(*volt), GFP_KERNEL);<br />+ &nbsp;&nbsp;&nbsp;if=
 (!volt)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
-ENOMEM;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nvkm_volt_ctor(volt_func, devic=
e, type, inst, &amp;volt-&gt;base);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*pvo=
lt =3D &amp;volt-&gt;base;</div>

</body></html>

--=_855b09989585a2a6eec31eacda0d5530--
