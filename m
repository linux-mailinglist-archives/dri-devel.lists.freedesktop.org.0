Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDF4AD120D
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 14:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588C110E04C;
	Sun,  8 Jun 2025 12:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="Smldvf+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEAE10E04C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 12:53:51 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1749387226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UoAoTWaDhudNjz1U5V7+hAboAbqegZdb7n3FPRiJ6jE=;
 b=Smldvf+dIob+0gqgKw8jY2ot8r+9vfSeqg7sf8KdvWn7yjT33epEVpXDwfF+8IiBaKqXSo
 az8nsef6eVErRJrLAxG3nSTgXGlPXGRwF/STMDPTNK+XzDjpYNEnXWGgMCC8QAicS1GMQj
 hi01PNEt/KriG7HE0OK+HKPDjCD9cw5YG31tn34sdLwa/CA3XaZ5tzN20RrzXeJfn33hDl
 eU2gBVtllZ35s04rg9aZeTf0s4xFZtr//XWY3p27D6XeuTcscllloV2Vob1mS48npwz7pc
 ipMchx37YYFf4TK2KpNfUHLJhYo1Lhndi/lxIcVL0YVl6alCDzx5I9Qnz+XyNA==
Content-Type: multipart/signed;
 boundary=dd3c07efb9d99c286c094c5faf160fb096648f1e935abee08db29ed3060d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 08 Jun 2025 14:53:37 +0200
Message-Id: <DAH60H3HYG7M.3NFXBJ7576RH1@cknow.org>
Cc: "Piotr Zalewski" <pZ010001011111@proton.me>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, "Dang Huynh"
 <danct12@riseup.net>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check
 color_mgmt_changed in atomic_enable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Andy Yan" <andyshrk@163.com>
References: <20241206192013.342692-3-pZ010001011111@proton.me>
 <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org>
 <mArHDRo5bhIAjG8sDOR-kM7DsVdbXxxcC8hfuEEPfUWIdMwNnSUy8ZFoLis66DFSuIEq8TrnAxUGkyo5IUTGw3AG4k3vuVVz0fsoI27BAms=@proton.me>
 <DAH3S8O66J47.3NT18EJCXWKL9@cknow.org>
 <47773829.1fce.1974f732545.Coremail.andyshrk@163.com>
In-Reply-To: <47773829.1fce.1974f732545.Coremail.andyshrk@163.com>
X-Migadu-Flow: FLOW_OUT
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

--dd3c07efb9d99c286c094c5faf160fb096648f1e935abee08db29ed3060d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Andy,

On Sun Jun 8, 2025 at 2:10 PM CEST, Andy Yan wrote:
> At 2025-06-08 19:08:50, "Diederik de Haas" <didi.debian@cknow.org> wrote:
>>On Sat Jun 7, 2025 at 5:32 PM CEST, Piotr Zalewski wrote:
>>> On Thursday, June 5th, 2025 at 10:13 PM, Diederik de Haas <didi.debian@=
cknow.org> wrote:
>>>> Since kernel 6.14-rc1 I have the problem that visual output is no long=
er
>>>> shown on my PineTab2 and a `git bisect` pointed to this patch/commit
>>>> as the culprit. What is important to note is that `CONFIG_DRM=3Dm` see=
ms
>>>> to be required as the problem does not occur with `CONFIG_DRM=3Dy`.
>>>>=20
>>>> Near the end of my bisect session, something interesting occurred.
>>>> I was booted into a 'bad' kernel (ie no visual output) and when I
>>>> started to build my final kernel, I closed the lid of the PineTab2 whi=
ch
>>>> made it go into suspend. When my final kernel was built, I opened the
>>>> lid again, which made it resume, to transfer my final kernel to it.
>>>> And much to my surprise, I then did have visual output.
>>>> When I read the (below) commit message of the 'offending' commit, it m=
ay
>>>> not be such a surprise after all.
>>>>=20
>>>> I did try it on a Quartz64-B (also rk3566) and it did not have any iss=
ue
>>>> (output via HDMI).
>>>> I don't know what the cause for this issue is, hopefully you do.
>>>
>>> I tested and confirmed that this happens with drm=3Dm but also in my ca=
se=20
>>> it happened when drm=3Dy. After some testing I found out that at boot m=
odeset
>>
>>Interesting that it also happened with drm=3Dy.
>>As you're more knowledgeable then I am with this, maybe look through
>>https://lists.sr.ht/~diederik/pine64-discuss/<D9AM2OOLREO0.2JMAI42J06TW0@=
cknow.org>
>>
>>to see if you may spot something relevant?
>>
>>> happened twice and at short interval and since this patch allows for ga=
mma=20
>>> LUT update regardless of color_mgmt_changed state this makes DSP CTRL G=
AMMA=20
>>> LUT EN bit to be unset twice too. It seems that VOP does not like it. I=
=20
>>
>>Happy to see you found the cause :-)
>>Do you happen to know why it was unset twice? That sounds suboptimal.
>>But (IIUC) setting a bit to a value it already has causing issues,
>>sounds surprising as well.
>
> I have conducted tests on both rk3566-box-demo (with drm set to y) and rk=
3568-lubancat-2 (with drm set to m),=20
> but I was unable to reproduce this issue. Could you two please share your=
 kernel defconfig and the corresponding kernel startup logs?=20
> Additionally, both of my two boards tested with HDMI output. What kind of=
 display interface does your board use for output?

I wasn't able to reproduce this issue on my PINE64 Quartz-B (rk3566)=20
with HDMI output either, but the problem is present on a PineTab2 [1]
(also rk3566) which uses a MIPI DSI connection to the display panel.

Kernel config:
https://paste.sr.ht/~diederik/aa747ed170aa01cc759fbe1ffd9cebe8c887b10b

dmesg kernel 6.14-rc1:
https://paste.sr.ht/~diederik/733fbf8bb7f6aee8b68cf5a652157d445462c24a

dmesg kernel 6.14-rc1 with Piotr's patch:
https://paste.sr.ht/~diederik/db1af672cfb611acbfbdf35adb6f170e5c38febc

Both dmesg outputs contain a suspend-resume cycle.
I'm using a USB Wi-Fi adapter for the wireless connection.

[1] https://wiki.pine64.org/wiki/PineTab2

Happy to provide more info and/or do some tests.

Cheers,
  Diederik

>>> patched vop2_vp_dsp_lut_disable function so that dsp_ctrl is set only i=
f=20
>>> GAMMA LUT EN bit is set. I checked that this also does not break the ga=
mma=20
>>> lut functionality with emphasis on out-of/into suspend behavior.
>>>
>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu=
/drm/rockchip/rockchip_drm_vop2.c
>>> index d0f5fea15e21..7ddf311b38c6 100644
>>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> @@ -897,6 +897,9 @@ static void vop2_vp_dsp_lut_disable(struct vop2_vid=
eo_port *vp)
>>>  {
>>>  	u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
>>> =20
>>> +	if ((dsp_ctrl & RK3568_VP_DSP_CTRL__DSP_LUT_EN) =3D=3D 0)
>>> +		return;
>>> +
>>>  	dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
>>>  	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
>>>  }
>>
>>I built a kernel with 6.14-rc1 + this patch and can confirm the screen
>>has output again :-)
>>
>>> I will wait with sending a patch because maybe Andy has something to ad=
d=20
>>> to this.
>>
>>Sounds like a plan. It could be that this issue surfaced an underlaying
>>issue and if so, fixing that would be even better.

--dd3c07efb9d99c286c094c5faf160fb096648f1e935abee08db29ed3060d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEWH1AAKCRDXblvOeH7b
bhl7AQDIBrUguAnNscCeQXQtCZLqeiXP+l3DJm6F2Fj0mB1XQQD+OL05kGhhBoXv
BdqaHKsLNeSC2+SVVWtKTeiyRT6t9As=
=I/5o
-----END PGP SIGNATURE-----

--dd3c07efb9d99c286c094c5faf160fb096648f1e935abee08db29ed3060d--
