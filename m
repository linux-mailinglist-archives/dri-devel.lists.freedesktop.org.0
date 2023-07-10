Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD6B74CE22
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C5410E1BD;
	Mon, 10 Jul 2023 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B841310E0EC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 06:05:08 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4Qztl43F8qzBHXgr
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 14:05:04 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-type:message-id:user-agent:references:in-reply-to
 :subject:to:from:date:mime-version; s=dkim; t=1688969104; x=
 1691561105; bh=rmk53/pqkjjPJdSMnavMSzHSzMM2/t17lNkM9jYMZUk=; b=u
 Gp3YZpVGYGG2g34aSzBAmiES7GH3K4NeC7qP+ac/qC2imG6VsRLYXyiOjAwp4rQL
 Z9ZKqLJ9i3yn+/3JIHbvXLNeTvq9jitwK39kxf4Nif3/f+LiJmhbw3LBopecFs6g
 DmVqjwyGZoO2q/fcw76FICJNKVXvXQGP3l0yKQoqFYY7YEAK9ApfYMtGn59HbvWa
 DokdzdJgDqaZg1rAJM6gb7B1uKKUM+m/1+6o59fZOVovlzg41HOpUxS4R63hA4OC
 IEaZX8Ex1QHxX9T572fV5dDSRx6eJvKO3VSVclCzYp7b6sgqyrNAkEgufdkmhpG0
 NxlbdQQknJctyFiy5gV4A==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 99-eOkPebQs7 for <dri-devel@lists.freedesktop.org>;
 Mon, 10 Jul 2023 14:05:04 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4Qztl40d7LzBHXgf;
 Mon, 10 Jul 2023 14:05:04 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 14:05:03 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: Fwd: [PATCH] drm/nouveau/i2c: do not use assignment in if condition
In-Reply-To: <20230710055219.53210-1-xujianghui@cdjrlc.com>
References: <20230710055219.53210-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <0bac7b15d5e5c0412f6113e110d3bc3c@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: multipart/alternative;
 boundary="=_d66c7a9faa3bdb07eb0fd3a1b9df6ff0"
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

--=_d66c7a9faa3bdb07eb0fd3a1b9df6ff0
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
--=_d66c7a9faa3bdb07eb0fd3a1b9df6ff0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 12pt; font-family: Verdana,Gen=
eva,sans-serif'>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Assignments in if condition are less readable and error-prone. &nbsp;Fixes<=
br />also checkpatch warning:<br /><br />ERROR: do not use assignment in if=
 condition<br /><br />Signed-off-by: Ran Sun &lt;sunran001@208suo.com&gt;<b=
r />---<br />&nbsp;drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c | 0<br=
 />&nbsp;1 file changed, 0 insertions(+), 0 deletions(-)<br />&nbsp;mode ch=
ange 100755 =3D&gt; 100644 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.=
c<br /><br />diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c=
 b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c<br />old mode 100755<b=
r />new mode 100644</div>
</body></html>

--=_d66c7a9faa3bdb07eb0fd3a1b9df6ff0--
