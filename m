Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBB1AD557F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 14:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30B010E64E;
	Wed, 11 Jun 2025 12:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="Vvw64LLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9433610E64C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 12:26:54 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1749644812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TzoweW1VyuVNEJZRGyBVGxqfzPWF4RZHCiNkVHUDk5Y=;
 b=Vvw64LLdbK0WMs8ryRBDkxbCsO1tPIylYEbe2NZlDCc/zQnb/cxEl6FRfjx5fL8BpQLy5E
 axaimd8A1ci1qOdfjgoUYTI2zHTtN+HdZyW7hlvB293ZJRwvWa78w95x/LmeMypyi3c6na
 DnQUWtrTHgSQ4HjBfkr7YslDMyuAw3TZX/svyfphxJHLvS8+T9EtahrCtb0nXDaqA4+zHg
 LfYOYCYRhNGMmiuv2UBudtbgp3mr7AjWeR8ZEl8VGwMhuPLXjDCu+f0ThXAdT2R18hfWAT
 34k0t56pA7W44CLGzQyvyjcM8QZPhwWNEpEMAtgA/gfWf0zitS1Q1kDy7HcQgQ==
Content-Type: multipart/signed;
 boundary=1bd61a99ad02106f912f5090cc57499a933afac880da8b9c6edd0841a2a5;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 11 Jun 2025 14:26:38 +0200
Message-Id: <DAJPBG7GPPH2.3BDCMH0U3FU0E@cknow.org>
Cc: "Piotr Zalewski" <pZ010001011111@proton.me>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, "Dang Huynh"
 <danct12@riseup.net>, <dri-devel@lists.freedesktop.org>,
 <linux-rockchip@lists.infradead.org>
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
 <DAISW8MXEU0G.3AMRSKNYQUJY8@cknow.org>
 <4e600374.6dc7.1975df03a2d.Coremail.andyshrk@163.com>
 <DAJNEG81JCU5.35KVU8KAT5MDU@cknow.org>
 <b25ddc.a29c.1975eea8033.Coremail.andyshrk@163.com>
In-Reply-To: <b25ddc.a29c.1975eea8033.Coremail.andyshrk@163.com>
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

--1bd61a99ad02106f912f5090cc57499a933afac880da8b9c6edd0841a2a5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Jun 11, 2025 at 2:15 PM CEST, Andy Yan wrote:
> At 2025-06-11 18:56:31, "Diederik de Haas" <didi.debian@cknow.org> wrote:
>>On Wed Jun 11, 2025 at 9:41 AM CEST, Andy Yan wrote:
>>> At 2025-06-10 19:02:11, "Diederik de Haas" <didi.debian@cknow.org> wrot=
e:
>>>>On Tue Jun 10, 2025 at 11:07 AM CEST, Andy Yan wrote:
>>>>> At 2025-06-09 20:36:41, "Diederik de Haas" <didi.debian@cknow.org> wr=
ote:
>>>>>>On Mon Jun 9, 2025 at 11:15 AM CEST, Andy Yan wrote:
>>>>>>> At 2025-06-08 20:53:37, "Diederik de Haas" <didi.debian@cknow.org> =
wrote:
>>>>>>>>On Sun Jun 8, 2025 at 2:10 PM CEST, Andy Yan wrote:
>>>>>>>>> At 2025-06-08 19:08:50, "Diederik de Haas" <didi.debian@cknow.org=
> wrote:
>>>>>>>>>>On Sat Jun 7, 2025 at 5:32 PM CEST, Piotr Zalewski wrote:
>>>>>>>>>>> On Thursday, June 5th, 2025 at 10:13 PM, Diederik de Haas <didi=
.debian@cknow.org> wrote:
>>>>>>>>>>>> Since kernel 6.14-rc1 I have the problem that visual output is=
 no longer
>>>>>>>>>>>> shown on my PineTab2 and a `git bisect` pointed to this patch/=
commit
>>>>>>>>>
>>>>>>>>> I have conducted tests on both rk3566-box-demo (with drm set to y=
)
>>>>>>>>> and rk3568-lubancat-2 (with drm set to m), but I was unable to
>>>>>>>>> reproduce this issue. Could you two please share your kernel
>>>>>>>>> defconfig and the corresponding kernel startup logs?
>>>>>>>>> Additionally, both of my two boards tested with HDMI output. What
>>>>>>>>> kind of display interface does your board use for output?
>>>>>>>>
>>>>>>>>I wasn't able to reproduce this issue on my PINE64 Quartz-B (rk3566=
)=20
>>>>>>>>with HDMI output either, but the problem is present on a PineTab2 [=
1]
>>>>>>>>(also rk3566) which uses a MIPI DSI connection to the display panel=
.
>>>>>>>>
>>>>>>>>Kernel config:
>>>>>>>>https://paste.sr.ht/~diederik/aa747ed170aa01cc759fbe1ffd9cebe8c887b=
10b
>>>>>>>>
>>>>>>>>dmesg kernel 6.14-rc1:
>>>>>>>>https://paste.sr.ht/~diederik/733fbf8bb7f6aee8b68cf5a652157d445462c=
24a
>>>>>>>>
>>>>>>>>dmesg kernel 6.14-rc1 with Piotr's patch:
>>>>>>>>https://paste.sr.ht/~diederik/db1af672cfb611acbfbdf35adb6f170e5c38f=
ebc
>>>>>>>>
>>>>>>>>Both dmesg outputs contain a suspend-resume cycle.
>>>>>>>>I'm using a USB Wi-Fi adapter for the wireless connection.
>>>>>>>>
>>>>>>>>[1] https://wiki.pine64.org/wiki/PineTab2
>>>>>>>>
>>>>>>>>Happy to provide more info and/or do some tests.
>>>>>>>
>>>>>>> Can you apply the patch in the attachment, reproduce this issue(wit=
hout Piotr's patch),=20
>>>>>>> and then provide me with a copy of the kernel log?
>>>>>>
>>>>>>Same test as above, but added ``dmesg | grep "vop2_"`` at the end as =
well
>>>>>>
>>>>>>dmesg kernel 6.14-rc1 with Andy's print_lut_0609_1710 patch:
>>>>>>https://paste.sr.ht/~diederik/ac356ee8b0f7e772c7310293d99d95644f59a4e=
e
>>>>>
>>>>> root@pt2-scmi:~# dmesg | grep "vop2_"
>>>>> [    4.996281] rockchip-drm display-subsystem: bound fe040000.vop (op=
s vop2_crtc_atomic_try_set_gamma.part.0 [rockchipdrm])
>>>>> [    5.005207] rockchip-drm display-subsystem: bound fe0a0000.hdmi (o=
ps vop2_crtc_atomic_try_set_gamma.part.0 [rockchipdrm])
>>>>> [    5.006798] rockchip-drm display-subsystem: bound fe060000.dsi (op=
s vop2_crtc_atomic_try_set_gamma.part.0 [rockchipdrm])
>>>>> [    5.021204] vop2_crtc_atomic_try_set_gamma  gamma_lut: 00000000000=
00000
>>>>> [    5.021219] vop2_vp_dsp_lut_disable dsp_ctrl: 0x0000000f
>>>>>
>>>>> It seems that dsp_ctrl: 0x0000000f , this value is not what we expect=
ed.
>>>>>
>>>>> The expected is 0x00010000.
>>>>>
>>>>> Could you please do an experiment for me? When there is no display on=
 your screen,=20
>>>>> execute the following command and see if the screen can resume displa=
ying:
>>>>>
>>>>> ./data/io  -w -4 0xfe040d00 0x10000; io -w -4 0xfe040000 0x28002=20
>>>>>
>>>>> I have placed the io tool in the attachment.
>>>>>
>>>>> You can use command like bellow to read back to confirm if what you w=
rite has taken effect:
>>>>> io -r -4 -l 0x100  0xfe040d00=20
>>>>>
>>>>> you may need to make CONFIG_DEVMEM=3Dy so that you can write the regi=
ster by io command.
>>>>
>>>>I renamed it as ``andy-io`` and performed the test:
>>>>
>>> 7543:# CONFIG_IO_STRICT_DEVMEM is not set
>>>
>>> CONFIG_IO_STRICT_DEVMEM should not be set to y if you want to access an=
 IO address from usersapce.
>>
>>That last one seems to be the culprit:
>>
>>My kernel config is based upon Debian's and in commit
>>ef7e196951aa ("[arm*,powerpc*,s390x,x86] Enable IO_STRICT_DEVMEM")
>>
>>I found "can be reverted using the kernel parameter: iomem=3Drelaxed", so
>>I added that parameter and rebooted:
>>
>>```sh
>>root@pt2-scmi:~# echo 'just (re-)booted into my PineTab2; screen is blank=
'
>>just (re-)booted into my PineTab2; screen is blank
>>root@pt2-scmi:~# uname -a
>>Linux pt2-scmi 6.14.0-rc1-00001-gfbe17d9b77b0 #18 SMP Mon Jun  9 13:17:28=
 CEST 2025 aarch64 GNU/Linux
>>root@pt2-scmi:~# cat /proc/cmdline=20
>>root=3DUUID=3D42bbb627-189b-49e3-ae42-699815dc2cbb ignore_loglevel ro roo=
twait earlycon console=3Dtty0 console=3DttyS2,1500000n8 fw_devlink=3Doff io=
mem=3Drelaxed
>>root@pt2-scmi:~# ./andy-io -r -4 -l 0x100 0xfe040d00
>>fe040d00:  0000000f 00000000 00000000 00000000
>>fe040d10:  00000010 00000000 00000000 00000000
>>fe040d20:  00000000 00000000 00000000 00000000
>>fe040d30:  01b70010 00500370 00100510 10001000
>>fe040d40:  00000000 00000000 03b00010 00500370
>>fe040d50:  05120004 00100510 00000000 00000000
>>fe040d60:  00000000 00000000 00000000 00000000
>>fe040d70:  00000000 00000000 00000000 00000000
>>fe040d80:  15110903 00030911 1a150b04 00040b15
>>fe040d90:  15110903 00030911 00000000 00000000
>>fe040da0:  00000000 00000000 00000000 00000000
>>fe040db0:  00000000 00000000 00000000 00000000
>>fe040dc0:  00000000 00000000 00000000 00000000
>>fe040dd0:  00000000 00000000 00000000 00000000
>>fe040de0:  00000000 00000000 00000000 00000000
>>fe040df0:  00000000 00000000 00000000 00000000
>>root@pt2-scmi:~# ./andy-io -w -4 0xfe040d00 0x10000
>>root@pt2-scmi:~# echo 'screen just turned on \o/'
>>screen just turned on \o/
>
> Do you mean the screen is turned on(that you see the display on the scree=
n) here ?

Yep. Before the ``-w`` command the screen was blank/black and after the
``-w`` command the (sway based) login screen was visible.

>> root@pt2-scmi:~# ./andy-io -r -4 -l 0x100 0xfe040d00
>>fe040d00:  00010000 00000000 00000000 00000000
>>fe040d10:  00000010 00000000 00000000 00000000
>>fe040d20:  00000000 00000000 00000000 00000000
>>fe040d30:  01b70010 00500370 00100510 10001000
>>fe040d40:  00000000 00000000 03b00010 00500370
>>fe040d50:  05120004 00100510 00000000 00000000
>>fe040d60:  00000000 00000000 00000000 00000000
>>fe040d70:  00000000 00000000 00000000 00000000
>>fe040d80:  15110903 00030911 1a150b04 00040b15
>>fe040d90:  15110903 00030911 00000000 00000000
>>fe040da0:  00000000 00000000 00000000 00000000
>>fe040db0:  00000000 00000000 00000000 00000000
>>fe040dc0:  00000000 00000000 00000000 00000000
>>fe040dd0:  00000000 00000000 00000000 00000000
>>fe040de0:  00000000 00000000 00000000 00000000
>>fe040df0:  00000000 00000000 00000000 00000000
>>root@pt2-scmi:~# ./andy-io -w -4 0xfe040000 0x28002
>>root@pt2-scmi:~# echo "screen is still on ... don't see any changes on sc=
reen"
>>screen is still on ... don't see any changes on screen
>>root@pt2-scmi:~# ./andy-io -r -4 -l 0x100 0xfe040d00
>>fe040d00:  00010000 00000000 00000000 00000000
>>fe040d10:  00000010 00000000 00000000 00000000
>>fe040d20:  00000000 00000000 00000000 00000000
>>fe040d30:  01b70010 00500370 00100510 10001000
>>fe040d40:  00000000 00000000 03b00010 00500370
>>fe040d50:  05120004 00100510 00000000 00000000
>>fe040d60:  00000000 00000000 00000000 00000000
>>fe040d70:  00000000 00000000 00000000 00000000
>>fe040d80:  15110903 00030911 1a150b04 00040b15
>>fe040d90:  15110903 00030911 00000000 00000000
>>fe040da0:  00000000 00000000 00000000 00000000
>>fe040db0:  00000000 00000000 00000000 00000000
>>fe040dc0:  00000000 00000000 00000000 00000000
>>fe040dd0:  00000000 00000000 00000000 00000000
>>fe040de0:  00000000 00000000 00000000 00000000
>>fe040df0:  00000000 00000000 00000000 00000000
>>```
>>
>>For completeness, I then closed the lid and opened it again:
>>
>>```sh
>>root@pt2-scmi:~# dmesg | grep "vop2_"
>>[    5.128785] rockchip-drm display-subsystem: bound fe040000.vop (ops vo=
p2_crtc_atomic_try_set_gamma.part.0 [rockchipdrm])
>>[    5.138031] rockchip-drm display-subsystem: bound fe0a0000.hdmi (ops v=
op2_crtc_atomic_try_set_gamma.part.0 [rockchipdrm])
>>[    5.139641] rockchip-drm display-subsystem: bound fe060000.dsi (ops vo=
p2_crtc_atomic_try_set_gamma.part.0 [rockchipdrm])
>>[    5.160937] vop2_crtc_atomic_try_set_gamma  gamma_lut: 000000000000000=
0
>>[    5.160950] vop2_vp_dsp_lut_disable dsp_ctrl: 0x0000000f
>>[ 1931.879232] vop2_crtc_atomic_try_set_gamma  gamma_lut: 000000000000000=
0
>>[ 1931.879245] vop2_vp_dsp_lut_disable dsp_ctrl: 0x00010000
>>```
>>
>>Cheers,
>>  Diederik
>>
>>>>> [   73.750524] vop2_crtc_atomic_try_set_gamma  gamma_lut: 00000000000=
00000
>>>>> [   73.750542] vop2_vp_dsp_lut_disable dsp_ctrl: 0x00010000
>>>>>>>>>>> patched vop2_vp_dsp_lut_disable function so that dsp_ctrl is se=
t only if=20
>>>>>>>>>>> GAMMA LUT EN bit is set. I checked that this also does not brea=
k the gamma=20
>>>>>>>>>>> lut functionality with emphasis on out-of/into suspend behavior=
.
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/dri=
vers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>>>>>>>>>> index d0f5fea15e21..7ddf311b38c6 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>>>>>>>>>> @@ -897,6 +897,9 @@ static void vop2_vp_dsp_lut_disable(struct =
vop2_video_port *vp)
>>>>>>>>>>>  {
>>>>>>>>>>>  	u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
>>>>>>>>>>> =20
>>>>>>>>>>> +	if ((dsp_ctrl & RK3568_VP_DSP_CTRL__DSP_LUT_EN) =3D=3D 0)
>>>>>>>>>>> +		return;
>>>>>>>>>>> +
>>>>>>>>>>>  	dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
>>>>>>>>>>>  	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
>>>>>>>>>>>  }
>>>>>>>>>>
>>>>>>>>>>I built a kernel with 6.14-rc1 + this patch and can confirm the s=
creen
>>>>>>>>>>has output again :-)
>>>>>>>>>>
>>>>>>>>>>> I will wait with sending a patch because maybe Andy has somethi=
ng to add=20
>>>>>>>>>>> to this.
>>>>>>>>>>
>>>>>>>>>>Sounds like a plan. It could be that this issue surfaced an under=
laying
>>>>>>>>>>issue and if so, fixing that would be even better.
>>


--1bd61a99ad02106f912f5090cc57499a933afac880da8b9c6edd0841a2a5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEl2BQAKCRDXblvOeH7b
bj8CAP9k8P9uUMP1hR0diALNWGgTFwtXLPSGNUkmF92M/APjxQEAyhGwbdP5e599
gcBwjGontmUy9IZcVcQupO6LrrxjnAY=
=qXta
-----END PGP SIGNATURE-----

--1bd61a99ad02106f912f5090cc57499a933afac880da8b9c6edd0841a2a5--
