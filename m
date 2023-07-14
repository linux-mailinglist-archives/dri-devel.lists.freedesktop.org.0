Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4947531CB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 08:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E19210E021;
	Fri, 14 Jul 2023 06:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A516F10E1C1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 06:12:06 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R2LjH5QndzBR9tP
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:12:03 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-type:message-id:user-agent:references:in-reply-to
 :subject:to:from:date:mime-version; s=dkim; t=1689315123; x=
 1691907124; bh=AY2KWsl4zuaZH2q/t4VbaGwIJHvcVXqH0niMzqhjMYo=; b=r
 +zwrgB9KSrvvLFDRw5iGAywIDjogiUuF1M3DE1YTkw7HmCDowz7kbdRacDA6vQ7A
 24OxXkShJQfO+OyLa1ogFKolVTKViMgMLSDj0WpJduKW+/mgtRzCZnAu0YrhbiXn
 J3Dj5tkahTxEKah/YZXxQ/gqFGjGSDkY6Y0n6E89qTta2KWl0QwSvd6/xkHeE7zU
 cYaKZLjV6DzzSBnAUGEuacVq/sYuX29uA+wLOcuMAZv5ww2hMZzv4xg6nEHHwD59
 21TXgJPb/affX7W3OatfoL8rvovuV+HtPMhSu41Fua5w6ttiLBm1XWYF1H4hpQiF
 McHxcLAlVlhFJr4XDxgYg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OwIr0vbbq8w8 for <dri-devel@lists.freedesktop.org>;
 Fri, 14 Jul 2023 14:12:03 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R2LjH2sqBzBJFS7;
 Fri, 14 Jul 2023 14:12:03 +0800 (CST)
MIME-Version: 1.0
Date: Fri, 14 Jul 2023 14:12:03 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amd: add missing spaces after ',' and remove spaces
 before ','
In-Reply-To: <20230714061046.13499-1-xujianghui@cdjrlc.com>
References: <20230714061046.13499-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <99f8d4d4bcb9ed070c4631e9070e5e04@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: multipart/alternative;
 boundary="=_65d1adce327392641768cf1847e8359d"
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=_65d1adce327392641768cf1847e8359d
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed


Add missing spaces and remove spaces to clear checkpatch errors.

ERROR: space prohibited before that ',' (ctx:WxV)
ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/amd/include/atom-bits.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/atom-bits.h 
b/drivers/gpu/drm/amd/include/atom-bits.h
index e8fae5c77514..2bfd6d0ff050 100644
--- a/drivers/gpu/drm/amd/include/atom-bits.h
+++ b/drivers/gpu/drm/amd/include/atom-bits.h
@@ -33,7 +33,7 @@ static inline uint8_t get_u8(void *bios, int ptr)
  #define CU8(ptr) get_u8(ctx->bios, (ptr))
  static inline uint16_t get_u16(void *bios, int ptr)
  {
-    return get_u8(bios ,ptr)|(((uint16_t)get_u8(bios, ptr+1))<<8);
+    return get_u8(bios, ptr)|(((uint16_t)get_u8(bios, ptr+1))<<8);
  }
  #define U16(ptr) get_u16(ctx->ctx->bios, (ptr))
  #define CU16(ptr) get_u16(ctx->bios, (ptr))
--=_65d1adce327392641768cf1847e8359d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 12pt; font-family: Verdana,Gen=
eva,sans-serif'>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Add missing spaces and remove spaces to clear checkpatch errors.<br /><br /=
>ERROR: space prohibited before that ',' (ctx:WxV)<br />ERROR: space requir=
ed after that ',' (ctx:VxV)<br /><br />Signed-off-by: Ran Sun &lt;sunran001=
@208suo.com&gt;<br />---<br />&nbsp;drivers/gpu/drm/amd/include/atom-bits.h=
 | 2 +-<br />&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br /><br /=
>diff --git a/drivers/gpu/drm/amd/include/atom-bits.h b/drivers/gpu/drm/amd=
/include/atom-bits.h<br />index e8fae5c77514..2bfd6d0ff050 100644<br />--- =
a/drivers/gpu/drm/amd/include/atom-bits.h<br />+++ b/drivers/gpu/drm/amd/in=
clude/atom-bits.h<br />@@ -33,7 +33,7 @@ static inline uint8_t get_u8(void =
*bios, int ptr)<br />&nbsp;#define CU8(ptr) get_u8(ctx-&gt;bios, (ptr))<br =
/>&nbsp;static inline uint16_t get_u16(void *bios, int ptr)<br />&nbsp;{<br=
 />- &nbsp;&nbsp;&nbsp;return get_u8(bios ,ptr)|(((uint16_t)get_u8(bios, pt=
r+1))&lt;&lt;8);<br />+ &nbsp;&nbsp;&nbsp;return get_u8(bios, ptr)|(((uint1=
6_t)get_u8(bios, ptr+1))&lt;&lt;8);<br />&nbsp;}<br />&nbsp;#define U16(ptr=
) get_u16(ctx-&gt;ctx-&gt;bios, (ptr))<br />&nbsp;#define CU16(ptr) get_u16=
(ctx-&gt;bios, (ptr))</div>

</body></html>

--=_65d1adce327392641768cf1847e8359d--
