Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD3BA9DA74
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 13:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC79B10E03E;
	Sat, 26 Apr 2025 11:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="U4ebAV2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C520D10E03E
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 11:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1745667166; x=1746271966; i=deller@gmx.de;
 bh=saU175Joz9QcsGyRzAZUu/ki5+/5BGbUfFRQ/c8MoYc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=U4ebAV2PYsU191wNSuhz+9bbGTcrxXOY2pimwAdAHhfzqz9l2T48e2imw6uGfnU2
 PhXZUeWKEfLU8Lh04a9ziS9P3sg0AkAxDgmy+08YaQl2oSUjPhhw3yKxr5R1ODEXV
 60mn7ylURFJrpx08g3DLRHu7C+wuDAxJvpw+6cj7miVkVZIT8kdtQbSU0/Z3vGh67
 VKJ/OCq3DbQn6ElyHJZZ6RRKWprXqJxMNEv+h3shhco0S5z+GmuIpK3aVRMa9Pjpi
 Lz5IgYFH2waH1S0QiPezTM6hRWB73FZAgn/BMonBjzlXa9kqorsznHbIdFC/VZxRg
 tucqgVLHgO8GdLezsw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.181]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MORAU-1uRqNP3n2s-00MG3L; Sat, 26
 Apr 2025 13:32:45 +0200
Message-ID: <b982d4f1-6ed8-490b-8d47-6dc5231913e7@gmx.de>
Date: Sat, 26 Apr 2025 13:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fbdev: arkfb: Cast ics5342_init() allocation type
To: Kees Cook <kees@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheyu Ma <zheyuma97@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250426062305.work.819-kees@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250426062305.work.819-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1S3zvciCiuaF2ZFFgka1cN5KYqrJSnPPfOQwlKCQhBbZYHbYNyA
 HQzYCk+2Z0HF3crIPsdsQFp62B3UdL3ieefJUsprM1biJpkEzOjC+qFxGf2ZjyNz4ybl4c3
 xd4ZT/7gHzgc4Rro/W0XEBC9hpuYElU7gptkFJj8zhJuxwOSmuXfmT59MqlhlRimMiQheWM
 899Wil/xfYzcI7Dxg4HlA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XEiqCWyyu34=;qlN/rJFu9tX5OmBgSmJrPCwuNFK
 0jTK49Hx6J0bKlGg+WqqS+ro1mdxRYo3QWwMsAnW8nxHi7vDNJmj8odBCtIbzGI6KalXSSN7k
 60SeKyH3khJid1+MK7ROS4hTfGqD2RkLr/1VZQklblP5CiCzjJ9avP/2RoomkvnS1peEebZXi
 HP1WLnzqcYR3spx4kl8c6zhxQ6I6QMeINt2SIwxHy7cBoVSbOhiHf81taEfE+BHuLwCUNDhCL
 arGcbFuYSSxPlkwt2ThrfHBs1FF5ujQKqCOtY9vPWFBdKEUa9yWeYQVP5wSnsociNFtwJTe95
 yqLQ3oZMsDIU7ogpfRGWiIwOIzbFXaWSmNk+8UKlUALsmzykLmpF9oe1cNI6U4mzF+FMV4Xse
 HSPvDtoG9Mq3TGLn433hfMAi/4KS1RDcMeIRcMBDkRIaB/CqrJ/+8Iee/DfTSy5kVgam5IB5f
 qRZ2OV6ABJWYs7TC2giQXlMUYATjFwpPPIm90qmV6yTKwhg44S3J5p874ZKtgRcjUYOtGEUM6
 mBdaelQsLc2/7PMyjaseLZdsTTSz6LqQOi0OCY0KPgDy6nR/foKPpRkibtTwtMg2IPL8F+PE/
 UK+PyJust5sqqjwraxAJiBpsj3vX3cAVa3fz03qx92QJWjo/AU/gwtXEO71EZlvRNkFlj7Fxh
 TtvtLcbHKO8nxvgJbMcAAcGfnFMF0XDLo9Fwhr9WBJ1kvSOWKSOaI9k0KkwytxNUVvnNILcw4
 A5fuj2qyYli8q+e4TK34v1+L0boI1JDfMDkRF0FYbIQm9WxvCjaDfdp4ktW66Yo9HbxGZL15Q
 RHI4d7tSTIdUzhH89sSw6GzgPxj8pGCRjcOfZA3GICBO9CXkK4dKe4+liPUBXBKoN1IZuMKWA
 hYuN6sNk02+1NCEh2oHbScE0AHb9olBR4nF5s6NXoPzP2yQIKVFbqds2vqFP63SpgPEJsBUKE
 r6lP3lRD9exPSNbqNur8JVjYSOgRuZe2n3+WPWjpNMS1LRXHQTx5xnx+nVZ5cOrTfq2O/WEpJ
 hKSqzQv1FQ5T56a3gosgsw7hAI3kSGma09xbInIy9lOS716ZM5K6jWVLuCxgPDhCw9QtuoegZ
 obbTQ94vAa3I5xogA/Fp/KBZGg4b0uPGlYxBFEqTUA8SmATOaC/kDxFuB5URCV0E/O2v5rXLk
 kJ/5xdfw666E2Xs06pgio2fUGbchgCmlPztogedTBbLdiwcp7vWHXEL8GBcHnwylYqpNfK7bD
 tmThCClvnmb6q6oEYifyNkpIHo9ip8kapS6NH7emQrqve2rGD378Fg1i6+xb6mzLpafQAJ8YF
 m9l387HQtvC/m8Vir+I8RwKV45ZuOsfyjJhNm0O8esLREySLJVAxz84/gIV9KB232dXOWs8MO
 TLlcmOhfbzMaa3wTRp1JA/puEaTxgrKAzCgrseH2XXKPEqn/i8YNz9uTTl85C4lm+AzMedcCk
 LOneZei1TUeWWEORTjmx9gZ0WB1DVxJRzS8EvN92eL9rGSoXuNB7EU6zq1X57X/iJ0T6SUrux
 9Ln/fV04o6sMvhCuAT9ziwHHZLVk8VLYSa+9X0toGg0Y5N7rs98KD3b3NazJB9HKC0LfBvUwy
 0+9atNvdcMllzNRD3hF9RRpC9deqXNZivhujxjjIWjojSqVCROlGOpG8dSj7zAIJjWJZHdChL
 M1X1hlrDdH7g/KB6R6Dm1K2IXioMBhZmNrJ40eYxq1I04xEo/4s3vjQu5lzANQoubvCLh3fxI
 QptBTbK/n1UA1EGgEnRATMznUCWZ7clBUdq3M5WEydzIgUvACB0W7KFIuSQlUBWJfb1bmfT0w
 5i5ZvKwPgh9PK4box0D4ghXT/J06c70xAcRIolvBX3Hksq4roFXY2JGshSgFTHkYh/YTPg2pk
 nVt2bO/T+n3HA2foBt5fN5y1y16B1l21oXC41Go5Pazp8jTIhgrcbox87O+kCDhprEWaZQi7j
 ZMDc9q6+op/isHQGNO2KmObJboRAWG9QlKnbATtshjAI+PPzVey3PI4San4CizJcdYFEuVezi
 FW7WbS11H0/DZcIbfFxY93upJ3zrSzxv8sJ9D/IDz6xAgjQ2MahmGm/damey7/tj2OJeySHX+
 QW31RB68fIb4UjosqSaujFxoUG/s+QjxjBKZBuTgfQsxDAr2eVJIzB6zxjeZVO+aDo/tyxPcd
 nD8wpSulDvC8WrWY+6jyBtubllpEcU3FZy/25+K4wAzdbKswealyKgBfXOVxYRP2Ggk2OSVWx
 MfHSOWp6rb3tJu7ZKyeuiBlNAm2KDtHJ79tfqu7Coq7HmVBS2t349ckwR4/7Unm+GxPyZKBow
 T5wBIUnv1wIN12OZTQX+uYfaylKJPqvVKeTST99eMeOJPL1qukIv6hAEW7BBhNFHZx9hd2SzQ
 s4zeBcRqqt/RES/7sdMPUAkEGRurb90twnuG8HpZ/8SYzbqC/WpBv8LO+KpRsqbX500XWWNva
 ZhReZmfQ3VSYEyu2IgnE8xvO8x0Zy0Cjp479PwZKTum1GvwOq3+SijCmlRTywjIKbeP4/LNTj
 TZc/UgaUDq7XaqFD3sAceRtMRyMooneblPwAqulOwBunxFYL3ZXMfPtUIIJuPEyheJOEpEyQF
 Af3PK+iVRSDYfGjH5TEiFCc7xzHCmAqQVgeezOgH7/A3/C5llxis4xeiJlfrk7E6iVpmJC7RB
 znvTpzBt47Qu+sCDWLhxD+ppJjEoDmRkYhy954+OmzslMYK6L8vAgGkNhEBmi23GxYsmhUSK1
 i4VJznpel7bM1Wcq6RMbK0yfM0NJQIqZsGdcYah23fRC98GkrZw0lCcNaXDY0vpSjQhkc3VGA
 juDldBlcGbmekNG2fvN1XWZCKvQb88Y352OL9+5G7wsKkayhOFsIeKTGglsx/BMUaW7Rc1sjF
 Ix7+2CXRP3RcT1a9p3bhldVb09Ku6eDWttd1zd4u100e0MvnnJGEJO7MltC+Z5RgMA6w0WUAJ
 Mc3cyvFUpc0XfFEkygenxy1ZtXXvJlbzilIeuQa+rCczWHXu0CdVIT3bFUj2xf7ZNjOCfIE3I
 w==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/26/25 08:23, Kees Cook wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type=
.)
>=20
> The assigned type is "struct dac_info *" but the returned type will be
> "struct ics5342_info *", which has a larger allocation size. This is
> by design, as struct ics5342_info contains struct dac_info as its first
> member. Cast the allocation type to match the assignment.
>=20
> Signed-off-by: Kees Cook <kees@kernel.org>

Thanks Kees!
I applied your patch, but wouldn't this untested patch be cleaner and fulf=
ill the
same purpose to match a kzalloc return type?

diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index 7d131e3d159a..a57c8a992e11 100644
=2D-- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -431,7 +431,8 @@ static struct dac_ops ics5342_ops =3D {
 =20
  static struct dac_info * ics5342_init(dac_read_regs_t drr, dac_write_reg=
s_t dwr, void *data)
  {
-       struct dac_info *info =3D (struct dac_info *)kzalloc(sizeof(struct=
 ics5342_info), GFP_KERNEL);
+       struct ics5342_info *ics_info =3D kzalloc(sizeof(struct ics5342_in=
fo), GFP_KERNEL);
+       struct dac_info *info =3D &ics_info->dac;
 =20
         if (! info)


Helge

  ---
> Cc: Helge Deller <deller@gmx.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Zheyu Ma <zheyuma97@gmail.com>
> Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> Cc: <linux-fbdev@vger.kernel.org>
> Cc: <dri-devel@lists.freedesktop.org>
> ---
>   drivers/video/fbdev/arkfb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
> index 082501feceb9..7d131e3d159a 100644
> --- a/drivers/video/fbdev/arkfb.c
> +++ b/drivers/video/fbdev/arkfb.c
> @@ -431,7 +431,7 @@ static struct dac_ops ics5342_ops =3D {
>  =20
>   static struct dac_info * ics5342_init(dac_read_regs_t drr, dac_write_r=
egs_t dwr, void *data)
>   {
> -	struct dac_info *info =3D kzalloc(sizeof(struct ics5342_info), GFP_KER=
NEL);
> +	struct dac_info *info =3D (struct dac_info *)kzalloc(sizeof(struct ics=
5342_info), GFP_KERNEL);
>  =20
>   	if (! info)
>   		return NULL;

