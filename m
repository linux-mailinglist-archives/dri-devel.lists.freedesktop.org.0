Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B9074CE23
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3F910E1C2;
	Mon, 10 Jul 2023 07:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51E410E0F1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 06:07:15 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QztnX65p5zBHXgl
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 14:07:12 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-type:message-id:user-agent:references:in-reply-to
 :subject:to:from:date:mime-version; s=dkim; t=1688969232; x=
 1691561233; bh=Nj7xOQ9cRaGdSAtlpfwqF+2OgV3LgNsBhofoMjyRbag=; b=B
 RxmLuSEe6rZ+go4Xm6gEXS0Y1jHRR0Xw75Wjp1qTZbckMWqgjrs+HSlVxQo4heLx
 RUT4xOv4BsvI0d8o88yydOwu4Ln7rIx4wLhu3skIU5pTtTR55FTZ+2Vk0LYd+gnp
 YN3WfSV6qoYN/IO1qrLrjS7DuISYcVbfD3yel3Vg1ROdc2+UbpG/kCalpSifU4YI
 I6UhVDlcaEW2KUbkvOnYH1AqiLj5tJ8ubDUqAo9fYVLa13+d3voFTErzCl+jqfE2
 LlpEKoRIV93X0STb0te4Nl3U+JDOufxl/H2gbPbqopKd3xQ611lT8aPjnaN8Z9Ba
 SnLb+NjlSwLGWii/jgRpw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZAH-O1WxdB5K for <dri-devel@lists.freedesktop.org>;
 Mon, 10 Jul 2023 14:07:12 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QztnX4gMczBHXgf;
 Mon, 10 Jul 2023 14:07:12 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 14:07:12 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/i2c: do not use assignment in if condition
In-Reply-To: <20230710055219.53210-1-xujianghui@cdjrlc.com>
References: <20230710055219.53210-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <698cc4eb4333c5161540c7737d6e4970@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: multipart/alternative;
 boundary="=_41d132f076c0c97ca6bdbb296c41e0b7"
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

--=_41d132f076c0c97ca6bdbb296c41e0b7
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed


Assignments in if condition are less readable and error-prone.  Fixes
also checkpatch warning:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c | 0
  1 file changed, 0 insertions(+), 0 deletions(-)
  mode change 100755 => 100644 
drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c
old mode 100755
new mode 100644
--=_41d132f076c0c97ca6bdbb296c41e0b7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 12pt; font-family: Verdana,Gen=
eva,sans-serif'>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Assignments in if condition are less readable and error-prone. &nbsp;Fixes<=
br />also checkpatch warning:<br /><br />ERROR: do not use assignment in if=
 condition<br /><br />Signed-off-by: Ran Sun &lt;<a href=3D"mailto:xujiangh=
ui@cdjrlc.com">sunran001@208suo.com</a>&gt;<br />---<br />&nbsp;drivers/gpu=
/drm/nouveau/nvkm/subdev/i2c/busnv04.c | 0<br />&nbsp;1 file changed, 0 ins=
ertions(+), 0 deletions(-)<br />&nbsp;mode change 100755 =3D&gt; 100644 dri=
vers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c<br /><br />diff --git a/driv=
ers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c b/drivers/gpu/drm/nouveau/nvk=
m/subdev/i2c/busnv04.c<br />old mode 100755<br />new mode 100644</div>

</body></html>

--=_41d132f076c0c97ca6bdbb296c41e0b7--
