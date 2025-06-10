Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ACFAD344C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 13:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B8210E4F1;
	Tue, 10 Jun 2025 11:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="IApPMQAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B237F10E4F1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 11:02:24 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1749553342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DpzD/PxmS/TTLQGkgUz0aLIpp8nnuttkc/75uUPV/Qk=;
 b=IApPMQAX1J7x/q2VSUj1ayMhPvyZ2BlNwr4o8hs0RIBE8e7/9sKFE4xX3UA/l9iSKOZr67
 OF+woXeeHpF2VtI2BfZR5X2xHOJzwU2qayGLUvQzmFz+sdsdPYHIubyMJN4gYo69/at43M
 nypxp5mGH6oyCXMAhhv5rO2jz3pr3vnbzmnp1YBodofoBpPXtaxJ7JJPVS2Mr9YEz+9zjR
 JW+iuHpN9sOuZLvd9iRolHPOI3bk8rU7CLIqe+T/dwYaEbvAOT8eQIEeZe6x5PEgBfBpcE
 r+zEMeSFlpi0RuZSR38U668nK4+Ez8/W0MG07rUhh1l4PEC1FuTDOs6rMGeNEA==
Content-Type: multipart/signed;
 boundary=a2fd228ad8616b05fb37f016492705069e4812029ccc04877beb3c403ab6;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 10 Jun 2025 13:02:11 +0200
Message-Id: <DAISW8MXEU0G.3AMRSKNYQUJY8@cknow.org>
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
 <DAH60H3HYG7M.3NFXBJ7576RH1@cknow.org>
 <3161fa6a.93d0.19753f8c5e0.Coremail.andyshrk@163.com>
 <DAI0A1Y753FJ.B0NMT8L5VPEH@cknow.org>
 <4b380a57.8ab2.197591815a8.Coremail.andyshrk@163.com>
In-Reply-To: <4b380a57.8ab2.197591815a8.Coremail.andyshrk@163.com>
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

--a2fd228ad8616b05fb37f016492705069e4812029ccc04877beb3c403ab6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Andy,

On Tue Jun 10, 2025 at 11:07 AM CEST, Andy Yan wrote:
> At 2025-06-09 20:36:41, "Diederik de Haas" <didi.debian@cknow.org> wrote:
>>On Mon Jun 9, 2025 at 11:15 AM CEST, Andy Yan wrote:
>>> At 2025-06-08 20:53:37, "Diederik de Haas" <didi.debian@cknow.org> wrot=
e:
>>>>On Sun Jun 8, 2025 at 2:10 PM CEST, Andy Yan wrote:
>>>>> At 2025-06-08 19:08:50, "Diederik de Haas" <didi.debian@cknow.org> wr=
ote:
>>>>>>On Sat Jun 7, 2025 at 5:32 PM CEST, Piotr Zalewski wrote:
>>>>>>> On Thursday, June 5th, 2025 at 10:13 PM, Diederik de Haas <didi.deb=
ian@cknow.org> wrote:
>>>>>>>> Since kernel 6.14-rc1 I have the problem that visual output is no =
longer
>>>>>>>> shown on my PineTab2 and a `git bisect` pointed to this patch/comm=
it
>>>>>
>>>>> I have conducted tests on both rk3566-box-demo (with drm set to y)
>>>>> and rk3568-lubancat-2 (with drm set to m), but I was unable to
>>>>> reproduce this issue. Could you two please share your kernel
>>>>> defconfig and the corresponding kernel startup logs?
>>>>> Additionally, both of my two boards tested with HDMI output. What
>>>>> kind of display interface does your board use for output?
>>>>
>>>>I wasn't able to reproduce this issue on my PINE64 Quartz-B (rk3566)=20
>>>>with HDMI output either, but the problem is present on a PineTab2 [1]
>>>>(also rk3566) which uses a MIPI DSI connection to the display panel.
>>>>
>>>>Kernel config:
>>>>https://paste.sr.ht/~diederik/aa747ed170aa01cc759fbe1ffd9cebe8c887b10b
>>>>
>>>>dmesg kernel 6.14-rc1:
>>>>https://paste.sr.ht/~diederik/733fbf8bb7f6aee8b68cf5a652157d445462c24a
>>>>
>>>>dmesg kernel 6.14-rc1 with Piotr's patch:
>>>>https://paste.sr.ht/~diederik/db1af672cfb611acbfbdf35adb6f170e5c38febc
>>>>
>>>>Both dmesg outputs contain a suspend-resume cycle.
>>>>I'm using a USB Wi-Fi adapter for the wireless connection.
>>>>
>>>>[1] https://wiki.pine64.org/wiki/PineTab2
>>>>
>>>>Happy to provide more info and/or do some tests.
>>>
>>> Can you apply the patch in the attachment, reproduce this issue(without=
 Piotr's patch),=20
>>> and then provide me with a copy of the kernel log?
>>
>>Same test as above, but added ``dmesg | grep "vop2_"`` at the end as well
>>
>>dmesg kernel 6.14-rc1 with Andy's print_lut_0609_1710 patch:
>>https://paste.sr.ht/~diederik/ac356ee8b0f7e772c7310293d99d95644f59a4ee
>
>
> root@pt2-scmi:~# dmesg | grep "vop2_"
> [    4.996281] rockchip-drm display-subsystem: bound fe040000.vop (ops vo=
p2_crtc_atomic_try_set_gamma.part.0 [rockchipdrm])
> [    5.005207] rockchip-drm display-subsystem: bound fe0a0000.hdmi (ops v=
op2_crtc_atomic_try_set_gamma.part.0 [rockchipdrm])
> [    5.006798] rockchip-drm display-subsystem: bound fe060000.dsi (ops vo=
p2_crtc_atomic_try_set_gamma.part.0 [rockchipdrm])
> [    5.021204] vop2_crtc_atomic_try_set_gamma  gamma_lut: 000000000000000=
0
> [    5.021219] vop2_vp_dsp_lut_disable dsp_ctrl: 0x0000000f
>
> It seems that dsp_ctrl: 0x0000000f , this value is not what we expected.
>
> The expected is 0x00010000.
>
> Could you please do an experiment for me? When there is no display on you=
r screen,=20
> execute the following command and see if the screen can resume displaying=
:
>
> ./data/io  -w -4 0xfe040d00 0x10000; io -w -4 0xfe040000 0x28002=20
>
> I have placed the io tool in the attachment.
>
> You can use command like bellow to read back to confirm if what you write=
 has taken effect:
> io -r -4 -l 0x100  0xfe040d00=20
>
> you may need to make CONFIG_DEVMEM=3Dy so that you can write the register=
 by io command.

I renamed it as ``andy-io`` and performed the test:

```sh
root@pt2-scmi:~# echo 'just (re-)booted into my PineTab2; screen is blank'
just (re-)booted into my PineTab2; screen is blank
root@pt2-scmi:~# uname -a
Linux pt2-scmi 6.14.0-rc1-00001-gfbe17d9b77b0 #18 SMP Mon Jun  9 13:17:28 C=
EST 2025 aarch64 GNU/Linux
root@pt2-scmi:~# ./andy-io -r -4 -l 0x100 0xfe040d00
mmap() failed: Operation not permitted
root@pt2-scmi:~# grep CONFIG_DEVMEM /boot/config-6.14.0-rc1-00001-gfbe17d9b=
77b0
CONFIG_DEVMEM=3Dy
root@pt2-scmi:~# ./andy-io -w -4 0xfe040d00 0x10000
mmap() failed: Operation not permitted
root@pt2-scmi:~# ./andy-io -w -4 0xfe040000 0x28002
mmap() failed: Operation not permitted
```

I guess this is not what you expected and I don't know why it happens.

Cheers,
  Diederik

> [   73.750524] vop2_crtc_atomic_try_set_gamma  gamma_lut: 000000000000000=
0
> [   73.750542] vop2_vp_dsp_lut_disable dsp_ctrl: 0x00010000
>>>>>>> patched vop2_vp_dsp_lut_disable function so that dsp_ctrl is set on=
ly if=20
>>>>>>> GAMMA LUT EN bit is set. I checked that this also does not break th=
e gamma=20
>>>>>>> lut functionality with emphasis on out-of/into suspend behavior.
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers=
/gpu/drm/rockchip/rockchip_drm_vop2.c
>>>>>>> index d0f5fea15e21..7ddf311b38c6 100644
>>>>>>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>>>>>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>>>>>> @@ -897,6 +897,9 @@ static void vop2_vp_dsp_lut_disable(struct vop2=
_video_port *vp)
>>>>>>>  {
>>>>>>>  	u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
>>>>>>> =20
>>>>>>> +	if ((dsp_ctrl & RK3568_VP_DSP_CTRL__DSP_LUT_EN) =3D=3D 0)
>>>>>>> +		return;
>>>>>>> +
>>>>>>>  	dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
>>>>>>>  	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
>>>>>>>  }
>>>>>>
>>>>>>I built a kernel with 6.14-rc1 + this patch and can confirm the scree=
n
>>>>>>has output again :-)
>>>>>>
>>>>>>> I will wait with sending a patch because maybe Andy has something t=
o add=20
>>>>>>> to this.
>>>>>>
>>>>>>Sounds like a plan. It could be that this issue surfaced an underlayi=
ng
>>>>>>issue and if so, fixing that would be even better.


--a2fd228ad8616b05fb37f016492705069e4812029ccc04877beb3c403ab6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEgQtgAKCRDXblvOeH7b
bgCaAQCewNGurxHRr3jS3eEoPIWei9XCwBRy9BEv6a3QzGD+pAEAheo+MJVHidjB
pJTB5xZ0vFxj8HUWu+5MHzEn5NUnJAE=
=N8Ux
-----END PGP SIGNATURE-----

--a2fd228ad8616b05fb37f016492705069e4812029ccc04877beb3c403ab6--
