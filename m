Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0651AD11E0
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 13:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5167110E141;
	Sun,  8 Jun 2025 11:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="fB1PRqeB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FD210E08C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 11:09:27 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1749380960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zoEhqr5dCKReBKCW+FPOezXLEUt9HByAZzTQfk/PhNY=;
 b=fB1PRqeBq9Fdm/8b7qJrk6r7iGZc1uBykrGgjaZvRx4x8QSqMvrFN1NxGRqhA8Ig6Mmrjy
 exGRAnFm9hI33Wimi/GSTORJHZ4fYuxyQMBzu/6msWW2N30szn1NdM20M+l11At4s4nsPT
 CAWx7/UnmguvhWvDG8TjHwtgDQ81SUMTVsvqisNpeY4S4MzzvsAi/r2lIpGlwmsF9/B3rM
 iA71Ntw0Q42ju14WWIr1bLPEngBw8qJuzEwESc/aXSDw+anAf7bHEkNJcwDQKQ0yxuEbKj
 037GMaPr7ql62n9xtjxEZCvlJAIBzdRqw514hKC34Sb/+8A64OO9qQac8HyGFA==
Content-Type: multipart/signed;
 boundary=affa8168ff2adf1cce55c04b55d0b5a716290986d64deb81ada2b29ecbd7;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 08 Jun 2025 13:08:50 +0200
Message-Id: <DAH3S8O66J47.3NT18EJCXWKL9@cknow.org>
Cc: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
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
To: "Piotr Zalewski" <pZ010001011111@proton.me>
References: <20241206192013.342692-3-pZ010001011111@proton.me>
 <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org>
 <mArHDRo5bhIAjG8sDOR-kM7DsVdbXxxcC8hfuEEPfUWIdMwNnSUy8ZFoLis66DFSuIEq8TrnAxUGkyo5IUTGw3AG4k3vuVVz0fsoI27BAms=@proton.me>
In-Reply-To: <mArHDRo5bhIAjG8sDOR-kM7DsVdbXxxcC8hfuEEPfUWIdMwNnSUy8ZFoLis66DFSuIEq8TrnAxUGkyo5IUTGw3AG4k3vuVVz0fsoI27BAms=@proton.me>
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

--affa8168ff2adf1cce55c04b55d0b5a716290986d64deb81ada2b29ecbd7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Piotr,

On Sat Jun 7, 2025 at 5:32 PM CEST, Piotr Zalewski wrote:
> On Thursday, June 5th, 2025 at 10:13 PM, Diederik de Haas <didi.debian@ck=
now.org> wrote:
>> Since kernel 6.14-rc1 I have the problem that visual output is no longer
>> shown on my PineTab2 and a `git bisect` pointed to this patch/commit
>> as the culprit. What is important to note is that `CONFIG_DRM=3Dm` seems
>> to be required as the problem does not occur with `CONFIG_DRM=3Dy`.
>>=20
>> Near the end of my bisect session, something interesting occurred.
>> I was booted into a 'bad' kernel (ie no visual output) and when I
>> started to build my final kernel, I closed the lid of the PineTab2 which
>> made it go into suspend. When my final kernel was built, I opened the
>> lid again, which made it resume, to transfer my final kernel to it.
>> And much to my surprise, I then did have visual output.
>> When I read the (below) commit message of the 'offending' commit, it may
>> not be such a surprise after all.
>>=20
>> I did try it on a Quartz64-B (also rk3566) and it did not have any issue
>> (output via HDMI).
>> I don't know what the cause for this issue is, hopefully you do.
>
> I tested and confirmed that this happens with drm=3Dm but also in my case=
=20
> it happened when drm=3Dy. After some testing I found out that at boot mod=
eset

Interesting that it also happened with drm=3Dy.
As you're more knowledgeable then I am with this, maybe look through
https://lists.sr.ht/~diederik/pine64-discuss/<D9AM2OOLREO0.2JMAI42J06TW0@ck=
now.org>

to see if you may spot something relevant?

> happened twice and at short interval and since this patch allows for gamm=
a=20
> LUT update regardless of color_mgmt_changed state this makes DSP CTRL GAM=
MA=20
> LUT EN bit to be unset twice too. It seems that VOP does not like it. I=
=20

Happy to see you found the cause :-)
Do you happen to know why it was unset twice? That sounds suboptimal.
But (IIUC) setting a bit to a value it already has causing issues,
sounds surprising as well.

> patched vop2_vp_dsp_lut_disable function so that dsp_ctrl is set only if=
=20
> GAMMA LUT EN bit is set. I checked that this also does not break the gamm=
a=20
> lut functionality with emphasis on out-of/into suspend behavior.
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index d0f5fea15e21..7ddf311b38c6 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -897,6 +897,9 @@ static void vop2_vp_dsp_lut_disable(struct vop2_video=
_port *vp)
>  {
>  	u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> =20
> +	if ((dsp_ctrl & RK3568_VP_DSP_CTRL__DSP_LUT_EN) =3D=3D 0)
> +		return;
> +
>  	dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
>  	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
>  }

I built a kernel with 6.14-rc1 + this patch and can confirm the screen
has output again :-)

> I will wait with sending a patch because maybe Andy has something to add=
=20
> to this.

Sounds like a plan. It could be that this issue surfaced an underlaying
issue and if so, fixing that would be even better.

> Best regards, Piotr Zalewski

Thanks a lot!

Cheers,
  Diederik

--affa8168ff2adf1cce55c04b55d0b5a716290986d64deb81ada2b29ecbd7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEVvWQAKCRDXblvOeH7b
brRDAQCguY9ZFdSt7xQUkBKyd7789zRNn0+93u+Vr4h+mYoyJQEAr5r9tLCGYzr9
L2/ox8e+rRdwvnI33pwjOjQezGaHlA4=
=oIW1
-----END PGP SIGNATURE-----

--affa8168ff2adf1cce55c04b55d0b5a716290986d64deb81ada2b29ecbd7--
