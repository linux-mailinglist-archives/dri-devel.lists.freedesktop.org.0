Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F60B5B6A55
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 11:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6ED10E68D;
	Tue, 13 Sep 2022 09:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F36E10E664
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 09:10:20 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id z20so13580593ljq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 02:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
 :from:from:to:cc:subject:date;
 bh=Zh7KSW8XgAdUI4oywrXiPzbxPf2PCLuY6igDqNcMUMk=;
 b=L+hj1jib7bxEFZkiXWnck4FyUYOcTFkz3QmNtfDjPKSIJuHlONVZ+3xe+jcbfUbOty
 qGGrsxzfUGlG21ax/Vx7Luaenmr78o+ZL12mxDlOGZo7W2DLUIwqxzFc1coWVvWDr0b5
 ZM+goxytkvPkhiAq036wluKe65zS/3yqUx5R1/TUP5/BgJx0wNlP3SEcd06K8bI6+DW6
 YL5nMjeW3smTzhUOanhnSpHTIUU6Jx+yF1bpSkh1RJIAzZtaDMCWTPoleCHKVsPpGTsp
 McO6+F3PZVjOPvvs7siAQWmz8bbViPam9RB4nBlHcxFtXepYq+L5ZUTnIM8KGfxnTxhV
 8b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=Zh7KSW8XgAdUI4oywrXiPzbxPf2PCLuY6igDqNcMUMk=;
 b=RflE/TIjOoDnPiNR9HGytoGW2o4gvxUEsl/GFlg8Pb9hxH33CGqgsPUI7yZoGjbRqe
 8eLWYKltkacuiMDCmHPYL0nTv6d8JVx+UEW0yG1khLjARFxBeWNCLOlXC3z1LEz/84ti
 xsVfqtEvVvYF8P3XkE1GcrsRReAzGtUhAglMY7k+eC4xSJDPx60WL687F4phEZ0mcpi0
 kp0VEJ3RgbuJaUPgInZYu607fKMV4uwVnAtd9mIlXKD5Z8r6JMJiHveI2merwE0U3x3M
 28SHnE5dRkK06B2uEL7inZCjnRIITGZjyHI3ih71vzswDLMilhyhGcQDvquiWNsRnnkd
 EgcQ==
X-Gm-Message-State: ACgBeo0npFIejuLz52DfclyGooDYj38hUHz6bJtCoE4KoCI7Ud1ZjpdO
 mLxrAIgRIPDE+LORZoAZtRA=
X-Google-Smtp-Source: AA6agR5dtQKNGUZ/Sj5tdRh4ZAI4CVktA0LLNE7DwtaD91uuNGsQoDpCqJV1mQgk5ePqmlDPgaUPAw==
X-Received: by 2002:a2e:a884:0:b0:25d:ea06:6a3f with SMTP id
 m4-20020a2ea884000000b0025dea066a3fmr8589963ljq.335.1663060218419; 
 Tue, 13 Sep 2022 02:10:18 -0700 (PDT)
Received: from smtpclient.apple (31-178-127-80.dynamic.chello.pl.
 [31.178.127.80]) by smtp.gmail.com with ESMTPSA id
 cf14-20020a056512280e00b0049465afdd38sm1580963lfb.108.2022.09.13.02.10.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Sep 2022 02:10:17 -0700 (PDT)
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Message-Id: <3A581416-C8A0-4121-B3D5-DFA29B4768A8@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_502BF529-8202-42C9-815C-329C2D464344"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] drm/rockchip: vop2: Fix Null Pointer Dereference on
 Multiple VPs
Date: Tue, 13 Sep 2022 11:10:16 +0200
In-Reply-To: <d8a86990-6d9f-9ca0-326a-e5706f924516@wolfvision.net>
To: Michael Riesch <michael.riesch@wolfvision.net>,
 Chris Morgan <macroalpha82@gmail.com>
References: <20220912180242.499-1-macroalpha82@gmail.com>
 <d8a86990-6d9f-9ca0-326a-e5706f924516@wolfvision.net>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: David Airlie <airlied@linux.ie>, Chris Morgan <macromorgan@hotmail.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Apple-Mail=_502BF529-8202-42C9-815C-329C2D464344
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> Wiadomo=C5=9B=C4=87 napisana przez Michael Riesch =
<michael.riesch@wolfvision.net> w dniu 13.09.2022, o godz. 08:55:
>=20
> Hi,
>=20
> On 9/12/22 20:02, Chris Morgan wrote:
>> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Cc: Sascha -> any thoughts on this one?
>=20
> Best regards,
> Michael
>=20
>> If I use more than one VP to output on an RK3566 based device I
>> receive the following error (and then everything freezes):
>>=20
>> [    0.838375] Unable to handle kernel NULL pointer dereference at =
virtual address 0000000000000250
>> [    0.839191] Mem abort info:
>> [    0.839442]   ESR =3D 0x0000000096000005
>> [    0.839785]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>> [    0.840256]   SET =3D 0, FnV =3D 0
>> [    0.840530]   EA =3D 0, S1PTW =3D 0
>> [    0.840821]   FSC =3D 0x05: level 1 translation fault
>> [    0.841254] Data abort info:
>> [    0.841512]   ISV =3D 0, ISS =3D 0x00000005
>> [    0.841864]   CM =3D 0, WnR =3D 0
>> [    0.842130] [0000000000000250] user address but active_mm is =
swapper
>> [    0.842704] Internal error: Oops: 96000005 [#1] SMP
>> [    0.843139] Modules linked in:
>> [    0.843420] CPU: 0 PID: 37 Comm: kworker/u8:1 Not tainted =
6.0.0-rc5+ #40
>> [    0.844013] Hardware name: RG503 (DT)
>> [    0.844343] Workqueue: events_unbound deferred_probe_work_func
>> [    0.844871] pstate: 80000009 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
>> [    0.845487] pc : __drm_crtc_init_with_planes+0x48/0x2e4
>> [    0.845956] lr : drm_crtc_init_with_planes+0x68/0x94
>> [    0.846399] sp : ffffffc00a7a3710
>> [    0.846695] x29: ffffffc00a7a3710 x28: ffffff8000fb4080 x27: =
ffffffc00a7a37a0
>> [    0.847332] x26: ffffffc0097d01c7 x25: ffffff8000fb44d8 x24: =
ffffffc0097d01c7
>> [    0.847967] x23: ffffffc009311870 x22: 0000000000000000 x21: =
0000000000000008
>> [    0.848603] x20: ffffff80010d0800 x19: ffffff8000fb44e8 x18: =
0000000000000000
>> [    0.849237] x17: 08000000000000d1 x16: 0800000000000091 x15: =
08000000000000c1
>> [    0.849874] x14: 0000000000000000 x13: 3432564e3631564e x12: =
3231564e36314742
>> [    0.850509] x11: 3631475234324742 x10: 000000000000002d x9 : =
ffffffc008682004
>> [    0.851144] x8 : 00000000006f7475 x7 : 00000000fffffff0 x6 : =
ffffffc00a7a37a0
>> [    0.851778] x5 : ffffffc0097d01c7 x4 : ffffffc009311870 x3 : =
0000000000000000
>> [    0.852412] x2 : 0000000000000008 x1 : ffffff8000fb44e8 x0 : =
ffffff80010d0800
>> [    0.853048] Call trace:
>> [    0.853270]  __drm_crtc_init_with_planes+0x48/0x2e4
>> [    0.853706]  drm_crtc_init_with_planes+0x68/0x94
>> [    0.854118]  vop2_bind+0x89c/0x920
>> [    0.854429]  component_bind_all+0x18c/0x290
>> [    0.854805]  rockchip_drm_bind+0xe4/0x1f0
>> [    0.855166]  try_to_bring_up_aggregate_device+0x9c/0x290
>> [    0.855639]  __component_add+0x110/0x168
>> [    0.855991]  component_add+0x1c/0x28
>> [    0.856312]  dw_mipi_dsi_rockchip_host_attach+0x98/0x10c
>> [    0.856785]  dw_mipi_dsi_host_attach+0xbc/0xd0
>> [    0.857184]  mipi_dsi_attach+0x30/0x44
>> [    0.857521]  devm_mipi_dsi_attach+0x2c/0x70
>> [    0.857896]  ams495qa01_probe+0x2d4/0x33c
>> [    0.858257]  spi_probe+0x8c/0xb8
>> [    0.858550]  really_probe+0x1e0/0x3b8
>> [    0.858881]  __driver_probe_device+0x16c/0x184
>> [    0.859278]  driver_probe_device+0x4c/0xfc
>> [    0.859646]  __device_attach_driver+0xf0/0x170
>> [    0.860043]  bus_for_each_drv+0xa4/0xcc
>> [    0.860389]  __device_attach+0xfc/0x1a8
>> [    0.860733]  device_initial_probe+0x1c/0x28
>> [    0.861108]  bus_probe_device+0x38/0x9c
>> [    0.861452]  deferred_probe_work_func+0xdc/0xf0
>> [    0.861855]  process_one_work+0x1b0/0x260
>> [    0.862217]  process_scheduled_works+0x4c/0x50
>> [    0.862614]  worker_thread+0x1f0/0x26c
>> [    0.862949]  kthread+0xc4/0xd4
>> [    0.863227]  ret_from_fork+0x10/0x20
>> [    0.863553] Code: aa0503fa f9002bfb aa0603fb b40000a2 (b9424840)
>> [    0.864095] ---[ end trace 0000000000000000 ]---
>>=20
>> A cursory reading of the datasheet suggests it's possible to have
>> simultaneous output to 2 distinct outputs. On page 13 it states:
>>=20
>> Support two simultaneous displays(same source) in the following =
interfaces:
>> - MIPI_DSI_TX
>> - LVDS
>> - HDMI
>> - eDP
>>=20
>> In order to achieve this though, I need to output to VP0 and VP1 (or
>> any 2 distinct VPs really). This is so I can have the ref clock set
>> to 24MHz for the HDMI and the pixel clock of the DSI panel (for the
>> example above it's 33.5MHz).  Currently, only by removing this code
>> block is such a thing possible, though I'm not sure if long-term
>> there should only be 1 CRTC for the rk3566 (and 2 CRTCs for 3568)
>> along with a max of 2 encoders for rk3566 (and 3 encoders for 3568).
>>=20
>> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
>>=20
>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>> ---
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 --------------
>> 1 file changed, 14 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c =
b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index e4631f515ba4..f18d7f6f9f86 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -2289,20 +2289,6 @@ static int vop2_create_crtc(struct vop2 *vop2)
>> 		struct vop2_win *win =3D &vop2->win[i];
>> 		u32 possible_crtcs;
>>=20
>> -		if (vop2->data->soc_id =3D=3D 3566) {
>> -			/*
>> -			 * On RK3566 these windows don't have an =
independent
>> -			 * framebuffer. They share the framebuffer with =
smart0,
>> -			 * esmart0 and cluster0 respectively.
>> -			 */
>> -			switch (win->data->phys_id) {
>> -			case ROCKCHIP_VOP2_SMART1:
>> -			case ROCKCHIP_VOP2_ESMART1:
>> -			case ROCKCHIP_VOP2_CLUSTER1:
>> -				continue;
>> -			}
>> -		}
>> -
>> 		if (win->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
>> 			vp =3D find_vp_without_primary(vop2);
>> 			if (vp) {
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


Chris, Michael,

IIRC this is fix for issue reported by me here: =
https://lore.kernel.org/linux-arm-kernel/20220405090509.GP4012@pengutronix=
.de/t/#mf29d19089fefcd27995a93c886f65132b6c75c7c =
<https://lore.kernel.org/linux-arm-kernel/20220405090509.GP4012@pengutroni=
x.de/t/#mf29d19089fefcd27995a93c886f65132b6c75c7c>


--Apple-Mail=_502BF529-8202-42C9-815C-329C2D464344
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Wiadomo=C5=9B=C4=87 napisana przez Michael Riesch &lt;<a =
href=3D"mailto:michael.riesch@wolfvision.net" =
class=3D"">michael.riesch@wolfvision.net</a>&gt; w dniu 13.09.2022, o =
godz. 08:55:</div><br class=3D"Apple-interchange-newline"><div =
class=3D""><div class=3D"">Hi,<br class=3D""><br class=3D"">On 9/12/22 =
20:02, Chris Morgan wrote:<br class=3D""><blockquote type=3D"cite" =
class=3D"">From: Chris Morgan &lt;<a =
href=3D"mailto:macromorgan@hotmail.com" =
class=3D"">macromorgan@hotmail.com</a>&gt;<br class=3D""></blockquote><br =
class=3D"">Cc: Sascha -&gt; any thoughts on this one?<br class=3D""><br =
class=3D"">Best regards,<br class=3D"">Michael<br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">If I use more than one =
VP to output on an RK3566 based device I<br class=3D"">receive the =
following error (and then everything freezes):<br class=3D""><br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.838375] Unable to handle kernel NULL =
pointer dereference at virtual address 0000000000000250<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.839191] Mem abort info:<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.839442] &nbsp;&nbsp;ESR =3D 0x0000000096000005<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.839785] &nbsp;&nbsp;EC =3D 0x25: DABT =
(current EL), IL =3D 32 bits<br class=3D"">[ &nbsp;&nbsp;&nbsp;0.840256] =
&nbsp;&nbsp;SET =3D 0, FnV =3D 0<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.840530] &nbsp;&nbsp;EA =3D 0, S1PTW =3D 0<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.840821] &nbsp;&nbsp;FSC =3D 0x05: level =
1 translation fault<br class=3D"">[ &nbsp;&nbsp;&nbsp;0.841254] Data =
abort info:<br class=3D"">[ &nbsp;&nbsp;&nbsp;0.841512] &nbsp;&nbsp;ISV =
=3D 0, ISS =3D 0x00000005<br class=3D"">[ &nbsp;&nbsp;&nbsp;0.841864] =
&nbsp;&nbsp;CM =3D 0, WnR =3D 0<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.842130] [0000000000000250] user address but =
active_mm is swapper<br class=3D"">[ &nbsp;&nbsp;&nbsp;0.842704] =
Internal error: Oops: 96000005 [#1] SMP<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.843139] Modules linked in:<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.843420] CPU: 0 PID: 37 Comm: kworker/u8:1 Not =
tainted 6.0.0-rc5+ #40<br class=3D"">[ &nbsp;&nbsp;&nbsp;0.844013] =
Hardware name: RG503 (DT)<br class=3D"">[ &nbsp;&nbsp;&nbsp;0.844343] =
Workqueue: events_unbound deferred_probe_work_func<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.844871] pstate: 80000009 (Nzcv daif -PAN -UAO -TCO =
-DIT -SSBS BTYPE=3D--)<br class=3D"">[ &nbsp;&nbsp;&nbsp;0.845487] pc : =
__drm_crtc_init_with_planes+0x48/0x2e4<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.845956] lr : drm_crtc_init_with_planes+0x68/0x94<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.846399] sp : ffffffc00a7a3710<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.846695] x29: ffffffc00a7a3710 x28: =
ffffff8000fb4080 x27: ffffffc00a7a37a0<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.847332] x26: ffffffc0097d01c7 x25: ffffff8000fb44d8 =
x24: ffffffc0097d01c7<br class=3D"">[ &nbsp;&nbsp;&nbsp;0.847967] x23: =
ffffffc009311870 x22: 0000000000000000 x21: 0000000000000008<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.848603] x20: ffffff80010d0800 x19: =
ffffff8000fb44e8 x18: 0000000000000000<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.849237] x17: 08000000000000d1 x16: 0800000000000091 =
x15: 08000000000000c1<br class=3D"">[ &nbsp;&nbsp;&nbsp;0.849874] x14: =
0000000000000000 x13: 3432564e3631564e x12: 3231564e36314742<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.850509] x11: 3631475234324742 x10: =
000000000000002d x9 : ffffffc008682004<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.851144] x8 : 00000000006f7475 x7 : 00000000fffffff0 =
x6 : ffffffc00a7a37a0<br class=3D"">[ &nbsp;&nbsp;&nbsp;0.851778] x5 : =
ffffffc0097d01c7 x4 : ffffffc009311870 x3 : 0000000000000000<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.852412] x2 : 0000000000000008 x1 : =
ffffff8000fb44e8 x0 : ffffff80010d0800<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.853048] Call trace:<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.853270] =
&nbsp;__drm_crtc_init_with_planes+0x48/0x2e4<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.853706] &nbsp;drm_crtc_init_with_planes+0x68/0x94<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.854118] &nbsp;vop2_bind+0x89c/0x920<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.854429] =
&nbsp;component_bind_all+0x18c/0x290<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.854805] &nbsp;rockchip_drm_bind+0xe4/0x1f0<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.855166] =
&nbsp;try_to_bring_up_aggregate_device+0x9c/0x290<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.855639] &nbsp;__component_add+0x110/0x168<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.855991] =
&nbsp;component_add+0x1c/0x28<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.856312] =
&nbsp;dw_mipi_dsi_rockchip_host_attach+0x98/0x10c<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.856785] &nbsp;dw_mipi_dsi_host_attach+0xbc/0xd0<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.857184] =
&nbsp;mipi_dsi_attach+0x30/0x44<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.857521] &nbsp;devm_mipi_dsi_attach+0x2c/0x70<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.857896] =
&nbsp;ams495qa01_probe+0x2d4/0x33c<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.858257] &nbsp;spi_probe+0x8c/0xb8<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.858550] &nbsp;really_probe+0x1e0/0x3b8<br class=3D"">[=
 &nbsp;&nbsp;&nbsp;0.858881] &nbsp;__driver_probe_device+0x16c/0x184<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.859278] =
&nbsp;driver_probe_device+0x4c/0xfc<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.859646] &nbsp;__device_attach_driver+0xf0/0x170<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.860043] =
&nbsp;bus_for_each_drv+0xa4/0xcc<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.860389] &nbsp;__device_attach+0xfc/0x1a8<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.860733] =
&nbsp;device_initial_probe+0x1c/0x28<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.861108] &nbsp;bus_probe_device+0x38/0x9c<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.861452] =
&nbsp;deferred_probe_work_func+0xdc/0xf0<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.861855] &nbsp;process_one_work+0x1b0/0x260<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.862217] =
&nbsp;process_scheduled_works+0x4c/0x50<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.862614] &nbsp;worker_thread+0x1f0/0x26c<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.862949] &nbsp;kthread+0xc4/0xd4<br =
class=3D"">[ &nbsp;&nbsp;&nbsp;0.863227] =
&nbsp;ret_from_fork+0x10/0x20<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;0.863553] Code: aa0503fa f9002bfb aa0603fb b40000a2 =
(b9424840)<br class=3D"">[ &nbsp;&nbsp;&nbsp;0.864095] ---[ end trace =
0000000000000000 ]---<br class=3D""><br class=3D"">A cursory reading of =
the datasheet suggests it's possible to have<br class=3D"">simultaneous =
output to 2 distinct outputs. On page 13 it states:<br class=3D""><br =
class=3D"">Support two simultaneous displays(same source) in the =
following interfaces:<br class=3D"">- MIPI_DSI_TX<br class=3D"">- =
LVDS<br class=3D"">- HDMI<br class=3D"">- eDP<br class=3D""><br =
class=3D"">In order to achieve this though, I need to output to VP0 and =
VP1 (or<br class=3D"">any 2 distinct VPs really). This is so I can have =
the ref clock set<br class=3D"">to 24MHz for the HDMI and the pixel =
clock of the DSI panel (for the<br class=3D"">example above it's =
33.5MHz). &nbsp;Currently, only by removing this code<br class=3D"">block =
is such a thing possible, though I'm not sure if long-term<br =
class=3D"">there should only be 1 CRTC for the rk3566 (and 2 CRTCs for =
3568)<br class=3D"">along with a max of 2 encoders for rk3566 (and 3 =
encoders for 3568).<br class=3D""><br class=3D"">Fixes: 604be85547ce =
("drm/rockchip: Add VOP2 driver")<br class=3D""><br =
class=3D"">Signed-off-by: Chris Morgan &lt;<a =
href=3D"mailto:macromorgan@hotmail.com" =
class=3D"">macromorgan@hotmail.com</a>&gt;<br class=3D"">---<br =
class=3D""> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 =
--------------<br class=3D""> 1 file changed, 14 deletions(-)<br =
class=3D""><br class=3D"">diff --git =
a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c =
b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c<br class=3D"">index =
e4631f515ba4..f18d7f6f9f86 100644<br class=3D"">--- =
a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c<br class=3D"">+++ =
b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c<br class=3D"">@@ -2289,20 =
+2289,6 @@ static int vop2_create_crtc(struct vop2 *vop2)<br class=3D""> =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>struct vop2_win *win =3D &amp;vop2-&gt;win[i];<br class=3D""> =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>u32 possible_crtcs;<br class=3D""><br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(vop2-&gt;data-&gt;soc_id =3D=3D 3566) {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>/*<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * On RK3566 these windows don't have an independent<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * framebuffer. They share the framebuffer with smart0,<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * esmart0 and cluster0 respectively.<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> */<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>switch (win-&gt;data-&gt;phys_id) {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>case =
ROCKCHIP_VOP2_SMART1:<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>case ROCKCHIP_VOP2_ESMART1:<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>case ROCKCHIP_VOP2_CLUSTER1:<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>continue;<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">-<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (win-&gt;type =3D=3D =
DRM_PLANE_TYPE_PRIMARY) {<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>vp =3D =
find_vp_without_primary(vop2);<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if (vp) =
{<br class=3D""></blockquote><br =
class=3D"">_______________________________________________<br =
class=3D"">Linux-rockchip mailing list<br class=3D""><a =
href=3D"mailto:Linux-rockchip@lists.infradead.org" =
class=3D"">Linux-rockchip@lists.infradead.org</a><br =
class=3D"">http://lists.infradead.org/mailman/listinfo/linux-rockchip<br =
class=3D""></div></div></blockquote></div><br class=3D""><div =
class=3D""><br class=3D""></div><div class=3D"">Chris, =
Michael,</div><div class=3D""><br class=3D""></div><div class=3D"">IIRC =
this is fix for issue reported by me here:&nbsp;<a =
href=3D"https://lore.kernel.org/linux-arm-kernel/20220405090509.GP4012@pen=
gutronix.de/t/#mf29d19089fefcd27995a93c886f65132b6c75c7c" =
class=3D"">https://lore.kernel.org/linux-arm-kernel/20220405090509.GP4012@=
pengutronix.de/t/#mf29d19089fefcd27995a93c886f65132b6c75c7c</a></div><div =
class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_502BF529-8202-42C9-815C-329C2D464344--
