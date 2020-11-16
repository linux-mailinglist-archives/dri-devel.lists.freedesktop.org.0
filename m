Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C008B2B5B57
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907266E165;
	Tue, 17 Nov 2020 08:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F5F898BE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1605518361;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=GIu7n/MLG/1dvlKdJZydGFW9ausUgTh+l2Ecw46CD6o=;
 b=OEHbxH+7jwcv+/TddQ9Y8et/gA7+LOqJo5wCERta7ZMho2MxXPZ+XI6Rf25ADGqqrT
 QzmKWGwMB+lInGgxOGaHVp47xD8xaY5tHiVXQJiuLj41g+1d47Xu5VSNGaGfno+3LLxn
 ak0Hs36WkyE83vs8HWpKdF3FE47A8hoIxRyOJiokS++I0r5po3sOrBixmkvZ/aSAj7y+
 vT9wqinVLEZ7QUdqpfFPHjOzb2JGezKNMNR13i21ShvqvhGR4G55flJ84hSyLhBWENye
 LCqoKnmIMYcSOn6DxAJS1aS1iGay5DRSiVGJU8awI3fxDuxHlFe7hbz9A7ZmwPzVVebF
 7VUA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDleVXAkICw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
 with ESMTPSA id N02faawAG9GJQ3I
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 16 Nov 2020 10:16:19 +0100 (CET)
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_FCE9F26C-63D2-4AEE-8EBB-BDC76342C28B"
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <27cfb13a-62e3-0a53-153f-92641c437cee@ti.com>
Date: Mon, 16 Nov 2020 10:16:18 +0100
Message-Id: <A74325A5-90CC-44C8-8824-7D551B53B314@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <BAFBC885-9BBE-46D1-B4C4-79910705864A@goldelico.com>
 <74abbdc4-cc1e-9caf-d4ee-0a5cdb557643@ti.com> <b0677958-02ad-1d2f-d755-!
 25a9d384eddc@ti.com> <1A09B4DA-F726-4F37-8CF4-BC192C659950@goldelico.com>
 <9a4e373e-9092-6d82-937a-bc663d2376b4@ti.com> <09ebc3e3-72c7-41fb-fb21-bf28c!
 f883d3f@ti.com> <E738362A-8ECE-4ED5-8057-2ABB6F5C3056@goldelico.com>
 <9a21b475-eff0-9882-8d65-d1f! dd2139dc4@ti.com>
 <A1DEB54D-FEC0-493A-858C-E5C0DB24B35E@goldelico.com>
 <1150ba22-1ae2-39f3-0924-7! a1f1b468597@ti.com>
 <2999ED77-B9F7-4197-81B8-F1AFF329A1E9@goldelico.com>
 <cbc147d2-af41-2bed-5670-530d45cfb24e@ti.com>
 <106bfbee-c472-c04c-0f7b-db108a090a63@ti.com>
 <420b81bd-fc95-e294-fcbe-f34db1ef! f9e7@ti.c om>
 <B2FBCAE4-FAD9-4C0D-9C75-63A701215886@goldelico.com>
 <826B2E97-8B77-412A-8093-753BF7A65EE1@goldelico.com>
 <acad2006-53a2-6587-b8e6-787e358! 8932a@ti.com>
 <AF87C7B4-DCD2-4207-A300-567DB65B08ED@goldelico.com>
 <27cfb13a-62e3-0a53-153f-92641c437cee@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 17 Nov 2020 08:51:59 +0000
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Apple-Mail=_FCE9F26C-63D2-4AEE-8EBB-BDC76342C28B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Tomi,
I hope you had a good weekend.

And I have added back the CC: list because I think we have progress =
after our internal discussion and only one issue remaining.

> Am 13.11.2020 um 15:49 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>=20
> On 13/11/2020 16:41, H. Nikolaus Schaller wrote:
>> Hi Tomi,
>>=20
>>> Am 13.11.2020 um 14:38 schrieb Tomi Valkeinen =
<tomi.valkeinen@ti.com>:
>>>=20
>>> On 13/11/2020 15:35, H. Nikolaus Schaller wrote:
>>>=20
>>>> So I'd say dsi_vc_send_short() fails if dsi_vc_enable_hs(0, 0) and =
not dsi_vc_enable_hs(0, 1)
>>>=20
>>> Oh, forgot to mention this: remove MIPI_DSI_MODE_LPM from the panel =
driver.
>>=20
>> Yes! This makes sending the init sequence work.
>>=20
>> I just have failures from w677l_read() but that may be the panel =
driver wrapper code.
>=20
> Ok, great! It would be good to have reads working too.

I have fixed it. The call to mipi_dsi_dcs_read() was wrong.

> That way we can know for sure if the commands
> go back and forth correctly (e.g. verify the panel version ID).

I can now read registers. Panel version ID is nonsense but I know that =
it was before.
Maybe they did not flash it during production since I only read =
0x40,0x00,0x00.
But we can read it.

>=20
>> If I remove all read commands (they are not necessary for operation), =
there are no error
>> messages and everything succeeds. I have a /dev/fb0.
>>=20
>> But I have no picture yet.
>>=20
>> Initially I thought that it was just the missing code to handle an =
external PWM backlight.
>> But even with (and backlight working), I have just a framebuffer with =
black screen.
>>=20
>> Anyways, I think we are very close. And this is a great step forwards =
so that I need a
>> break...
>>=20
>> Maybe I manage to consolidate the panel driver code before v5.10-rc4 =
arrives. This
>> would give a freshly merged letux tree.
>=20
> Usually backlight glow is visible even if there's no picture.

Well, it did not turn the PWM on at all. Now this works as well.

Still I have no picture. But the readout of the register 0x45 (scan =
line) shows varying
values. Therefore I think the vsync is running and incrementing the scan =
line counter.

> But a comparison between the old, working driver, with dsi debugs =
enabled, may give some hints. A
> DISPC & DSI reg dump for both cases may also give hints.

I have a script to mount debugfs and dump registers. Results are =
attached.

Significant difference seem to be in:

DISPC_TIMING_H(LCD)
DSI_CLK_CTRL
DSI_VM_TIMING1
DSI_VM_TIMING6
DSI_VC_CTRL(0)
DSI_VC_CTRL(1)
DSI_DSIPHY_CFG2

The consolidated panel driver code is here:

	=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/letux/boe-w677-dsi-panel-v2

Well, not yet clean for upstreaming but functionally much better than =
before.

What I have hacked is to mask out MIPI_DSI_MODE_LPM in =
mipi_dsi_attach(). This
can/will be replaced if your series can handle it.

BR,
Nikolaus


--Apple-Mail=_FCE9F26C-63D2-4AEE-8EBB-BDC76342C28B
Content-Disposition: attachment;
	filename=dsi-new.txt
Content-Type: text/plain;
	name="dsi-new.txt"
Content-Transfer-Encoding: 7bit

root@letux:~# ./debugdsi 
- DSS -
FCK = 192000000
- DISPC -
dispc fclk source = FCK
fck             192000000       
- DISPC-CORE-CLK -
lck             192000000       lck div 1
- LCD -
LCD clk source = PLL1:1
lck             153600000       lck div 1
pck             76800000        pck div 2
- LCD2 -
LCD2 clk source = FCK
lck             48000000        lck div 4
pck             48000000        pck div 1
- LCD3 -
LCD3 clk source = FCK
lck             48000000        lck div 4
pck             48000000        pck div 1
DISPC_REVISION                                     00000051
DISPC_SYSCONFIG                                    00002015
DISPC_SYSSTATUS                                    00000001
DISPC_IRQSTATUS                                    000000a2
DISPC_IRQENABLE                                    0812d640
DISPC_CONTROL                                      00018309
DISPC_CONFIG                                       0000020c
DISPC_CAPABLE                                      00000000
DISPC_LINE_STATUS                                  000003e3
DISPC_LINE_NUMBER                                  00000000
DISPC_GLOBAL_ALPHA                                 ffffffff
DISPC_CONTROL2                                     00000000
DISPC_CONFIG2                                      00000000
DISPC_CONTROL3                                     00000000
DISPC_CONFIG3                                      00000000
DISPC_GLOBAL_MFLAG_ATTRIBUTE                       00000001
DISPC_DEFAULT_COLOR(LCD)                           00000000
DISPC_TRANS_COLOR(LCD)                             00000000
DISPC_SIZE_MGR(LCD)                                04ff02cf
DISPC_TIMING_H(LCD)                                0040a100
DISPC_TIMING_V(LCD)                                0320323b
DISPC_POL_FREQ(LCD)                                00060000
DISPC_DIVISORo(LCD)                                00010002
DISPC_DATA_CYCLE1(LCD)                             00000000
DISPC_DATA_CYCLE2(LCD)                             00000000
DISPC_DATA_CYCLE3(LCD)                             00000000
DISPC_CPR_COEF_R(LCD)                              00000000
DISPC_CPR_COEF_G(LCD)                              00000000
DISPC_CPR_COEF_B(LCD)                              00000000
DISPC_DEFAULT_COLOR(TV)                            00000000
DISPC_TRANS_COLOR(TV)                              00000000
DISPC_SIZE_MGR(TV)                                 00000000
DISPC_DEFAULT_COLOR(LCD2)                          00000000
DISPC_TRANS_COLOR(LCD2)                            00000000
DISPC_SIZE_MGR(LCD2)                               00000000
DISPC_TIMING_H(LCD2)                               00000000
DISPC_TIMING_V(LCD2)                               00000000
DISPC_POL_FREQ(LCD2)                               00000000
DISPC_DIVISORo(LCD2)                               00040001
DISPC_DATA_CYCLE1(LCD2)                            00000000
DISPC_DATA_CYCLE2(LCD2)                            00000000
DISPC_DATA_CYCLE3(LCD2)                            00000000
DISPC_CPR_COEF_R(LCD2)                             00000000
DISPC_CPR_COEF_G(LCD2)                             00000000
DISPC_CPR_COEF_B(LCD2)                             00000000
DISPC_DEFAULT_COLOR(LCD3)                          00000000
DISPC_TRANS_COLOR(LCD3)                            00000000
DISPC_SIZE_MGR(LCD3)                               00000000
DISPC_TIMING_H(LCD3)                               00000000
DISPC_TIMING_V(LCD3)                               00000000
DISPC_POL_FREQ(LCD3)                               00000000
DISPC_DIVISORo(LCD3)                               00040001
DISPC_DATA_CYCLE1(LCD3)                            00000000
DISPC_DATA_CYCLE2(LCD3)                            00000000
DISPC_DATA_CYCLE3(LCD3)                            00000000
DISPC_CPR_COEF_R(LCD3)                             00000000
DISPC_CPR_COEF_G(LCD3)                             00000000
DISPC_CPR_COEF_B(LCD3)                             00000000
DISPC_OVL_BA0(GFX)                                 10100000
DISPC_OVL_BA1(GFX)                                 10100000
DISPC_OVL_POSITION(GFX)                            00000000
DISPC_OVL_SIZE(GFX)                                04ff02cf
DISPC_OVL_ATTRIBUTES(GFX)                          320040b1
DISPC_OVL_FIFO_THRESHOLD(GFX)                      07ff07f8
DISPC_OVL_FIFO_SIZE_STATUS(GFX)                    00000500
DISPC_OVL_ROW_INC(GFX)                             000074c1
DISPC_OVL_PIXEL_INC(GFX)                           00000001
DISPC_OVL_PRELOAD(GFX)                             000007ff
DISPC_OVL_MFLAG_THRESHOLD(GFX)                     05000400
DISPC_OVL_WINDOW_SKIP(GFX)                         00000000
DISPC_OVL_TABLE_BA(GFX)                            00000000
DISPC_OVL_BA0(VID1)                                00000000
DISPC_OVL_BA1(VID1)                                00000000
DISPC_OVL_POSITION(VID1)                           00000000
DISPC_OVL_SIZE(VID1)                               00000000
DISPC_OVL_ATTRIBUTES(VID1)                         02808400
DISPC_OVL_FIFO_THRESHOLD(VID1)                     07ff07f8
DISPC_OVL_FIFO_SIZE_STATUS(VID1)                   00000800
DISPC_OVL_ROW_INC(VID1)                            00000001
DISPC_OVL_PIXEL_INC(VID1)                          00000001
DISPC_OVL_PRELOAD(VID1)                            000007ff
DISPC_OVL_MFLAG_THRESHOLD(VID1)                    05000400
DISPC_OVL_FIR(VID1)                                04000400
DISPC_OVL_PICTURE_SIZE(VID1)                       00000000
DISPC_OVL_ACCU0(VID1)                              00000000
DISPC_OVL_ACCU1(VID1)                              00000000
DISPC_OVL_BA0_UV(VID1)                             00000000
DISPC_OVL_BA1_UV(VID1)                             00000000
DISPC_OVL_FIR2(VID1)                               04000400
DISPC_OVL_ACCU2_0(VID1)                            00000000
DISPC_OVL_ACCU2_1(VID1)                            00000000
DISPC_OVL_ATTRIBUTES2(VID1)                        00000000
DISPC_OVL_BA0(VID2)                                00000000
DISPC_OVL_BA1(VID2)                                00000000
DISPC_OVL_POSITION(VID2)                           00000000
DISPC_OVL_SIZE(VID2)                               00000000
DISPC_OVL_ATTRIBUTES(VID2)                         02808400
DISPC_OVL_FIFO_THRESHOLD(VID2)                     07ff07f8
DISPC_OVL_FIFO_SIZE_STATUS(VID2)                   00000800
DISPC_OVL_ROW_INC(VID2)                            00000001
DISPC_OVL_PIXEL_INC(VID2)                          00000001
DISPC_OVL_PRELOAD(VID2)                            000007ff
DISPC_OVL_MFLAG_THRESHOLD(VID2)                    05000400
DISPC_OVL_FIR(VID2)                                04000400
DISPC_OVL_PICTURE_SIZE(VID2)                       00000000
DISPC_OVL_ACCU0(VID2)                              00000000
DISPC_OVL_ACCU1(VID2)                              00000000
DISPC_OVL_BA0_UV(VID2)                             00000000
DISPC_OVL_BA1_UV(VID2)                             00000000
DISPC_OVL_FIR2(VID2)                               04000400
DISPC_OVL_ACCU2_0(VID2)                            00000000
DISPC_OVL_ACCU2_1(VID2)                            00000000
DISPC_OVL_ATTRIBUTES2(VID2)                        00000000
DISPC_OVL_BA0(VID3)                                00000000
DISPC_OVL_BA1(VID3)                                00000000
DISPC_OVL_POSITION(VID3)                           00000000
DISPC_OVL_SIZE(VID3)                               00000000
DISPC_OVL_ATTRIBUTES(VID3)                         02808400
DISPC_OVL_FIFO_THRESHOLD(VID3)                     07ff07f8
DISPC_OVL_FIFO_SIZE_STATUS(VID3)                   00000800
DISPC_OVL_ROW_INC(VID3)                            00000001
DISPC_OVL_PIXEL_INC(VID3)                          00000001
DISPC_OVL_PRELOAD(VID3)                            000007ff
DISPC_OVL_MFLAG_THRESHOLD(VID3)                    05000400
DISPC_OVL_FIR(VID3)                                04000400
DISPC_OVL_PICTURE_SIZE(VID3)                       00000000
DISPC_OVL_ACCU0(VID3)                              00000000
DISPC_OVL_ACCU1(VID3)                              00000000
DISPC_OVL_BA0_UV(VID3)                             00000000
DISPC_OVL_BA1_UV(VID3)                             00000000
DISPC_OVL_FIR2(VID3)                               04000400
DISPC_OVL_ACCU2_0(VID3)                            00000000
DISPC_OVL_ACCU2_1(VID3)                            00000000
DISPC_OVL_ATTRIBUTES2(VID3)                        00000000
DISPC_OVL_BA0(WB)                                  00000000
DISPC_OVL_BA1(WB)                                  00000000
DISPC_OVL_SIZE(WB)                                 00000000
DISPC_OVL_ATTRIBUTES(WB)                           00808000
DISPC_OVL_FIFO_THRESHOLD(WB)                       00080000
DISPC_OVL_FIFO_SIZE_STATUS(WB)                     00000800
DISPC_OVL_ROW_INC(WB)                              00000001
DISPC_OVL_PIXEL_INC(WB)                            00000001
DISPC_OVL_MFLAG_THRESHOLD(WB)                      03200280
DISPC_OVL_FIR(WB)                                  04000400
DISPC_OVL_PICTURE_SIZE(WB)                         00000000
DISPC_OVL_ACCU0(WB)                                00000000
DISPC_OVL_ACCU1(WB)                                00000000
DISPC_OVL_BA0_UV(WB)                               00000000
DISPC_OVL_BA1_UV(WB)                               00000000
DISPC_OVL_FIR2(WB)                                 04000400
DISPC_OVL_ACCU2_0(WB)                              00000000
DISPC_OVL_ACCU2_1(WB)                              00000000
DISPC_OVL_ATTRIBUTES2(WB)                          00000000
DISPC_OVL_FIR_COEF_H_0(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_1(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_2(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_3(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_4(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_5(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_6(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_7(VID1)                       00000000
DISPC_OVL_FIR_COEF_HV_0(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_1(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_2(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_3(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_4(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_5(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_6(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_7(VID1)                      00000000
DISPC_OVL_CONV_COEF_0(VID1)                        0199012a
DISPC_OVL_CONV_COEF_1(VID1)                        012a0000
DISPC_OVL_CONV_COEF_2(VID1)                        079c0730
DISPC_OVL_CONV_COEF_3(VID1)                        0000012a
DISPC_OVL_CONV_COEF_4(VID1)                        00000204
DISPC_OVL_FIR_COEF_V_0(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_1(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_2(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_3(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_4(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_5(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_6(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_7(VID1)                       00000000
DISPC_OVL_FIR_COEF_H2_0(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_1(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_2(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_3(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_4(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_5(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_6(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_7(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV2_0(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_1(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_2(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_3(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_4(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_5(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_6(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_7(VID1)                     00000000
DISPC_OVL_FIR_COEF_V2_0(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_1(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_2(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_3(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_4(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_5(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_6(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_7(VID1)                      00000000
DISPC_OVL_FIR_COEF_H_0(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_1(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_2(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_3(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_4(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_5(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_6(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_7(VID2)                       00000000
DISPC_OVL_FIR_COEF_HV_0(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_1(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_2(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_3(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_4(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_5(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_6(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_7(VID2)                      00000000
DISPC_OVL_CONV_COEF_0(VID2)                        0199012a
DISPC_OVL_CONV_COEF_1(VID2)                        012a0000
DISPC_OVL_CONV_COEF_2(VID2)                        079c0730
DISPC_OVL_CONV_COEF_3(VID2)                        0000012a
DISPC_OVL_CONV_COEF_4(VID2)                        00000204
DISPC_OVL_FIR_COEF_V_0(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_1(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_2(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_3(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_4(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_5(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_6(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_7(VID2)                       00000000
DISPC_OVL_FIR_COEF_H2_0(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_1(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_2(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_3(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_4(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_5(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_6(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_7(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV2_0(VID2)                     00000000
DISPC_OVL_FIR_COEF_HV2_1(VID2)                     00000000
DISPC_OVL_FIR_COEF_HV2_2(VID2)                     00000000
DISPC_OVL_FIR_COEF_HV2_3(VID2)                     00000000
DISPC_OVL_FIR_COEF_HV2_4(VID2)                     00000000
DISPC_OVL_FIR_COEF_HV2_5(VID2)                     00000000
DISPC_OVL_FIR_COEF_HV2_6(VID2)                     00000000
[  117.525871] DSI: dsi_runtime_get
[  117.532527] DSI: dsi_runtime_put
DISPC_OVL_FIR_COEF_HV2_7(VID2)                     00000000
DISPC_OVL_FIR_COEF_V2_0(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_1(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_2(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_3(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_4(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_5(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_6(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_7(VID2)                      00000000
DISPC_OVL_FIR_COEF_H_0(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_1(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_2(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_3(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_4(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_5(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_6(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_7(VID3)                       00000000
DISPC_OVL_FIR_COEF_HV_0(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_1(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_2(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_3(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_4(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_5(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_6(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_7(VID3)                      00000000
DISPC_OVL_CONV_COEF_0(VID3)                        0199012a
DISPC_OVL_CONV_COEF_1(VID3)                        012a0000
DISPC_OVL_CONV_COEF_2(VID3)                        079c0730
DISPC_OVL_CONV_COEF_3(VID3)                        0000012a
DISPC_OVL_CONV_COEF_4(VID3)                        00000204
DISPC_OVL_FIR_COEF_V_0(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_1(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_2(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_3(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_4(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_5(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_6(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_7(VID3)                       00000000
DISPC_OVL_FIR_COEF_H2_0(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_1(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_2(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_3(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_4(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_5(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_6(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_7(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV2_0(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_1(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_2(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_3(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_4(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_5(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_6(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_7(VID3)                     00000000
DISPC_OVL_FIR_COEF_V2_0(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_1(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_2(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_3(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_4(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_5(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_6(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_7(VID3)                      00000000
cat: /sys/kernel/debug/omapdss/dsi1_irqs: No such file or directory
DSI_REVISION                        00000040
DSI_SYSCONFIG                       00000015
DSI_SYSSTATUS                       00000001
DSI_IRQSTATUS                       00000000
DSI_IRQENABLE                       0015c000
DSI_CTRL                            00eaee9f
DSI_COMPLEXIO_CFG1                  2a0dcba9
DSI_COMPLEXIO_IRQ_STATUS            00000000
DSI_COMPLEXIO_IRQ_ENABLE            3ff07fff
DSI_CLK_CTRL                        a030400b
DSI_TIMING1                         ffff1000
DSI_TIMING2                         ffffffff
DSI_VM_TIMING1                      00078003
DSI_VM_TIMING2                      043c3232
DSI_VM_TIMING3                      029a0500
DSI_CLK_TIMING                      00001b10
DSI_TX_FIFO_VC_SIZE                 13121110
DSI_RX_FIFO_VC_SIZE                 13121110
DSI_COMPLEXIO_CFG2                  00030000
DSI_RX_FIFO_VC_FULLNESS             00000000
DSI_VM_TIMING4                      00000000
DSI_TX_FIFO_VC_EMPTINESS            1f1f1e1f
DSI_VM_TIMING5                      00000000
DSI_VM_TIMING6                      01000007
DSI_VM_TIMING7                      00100010
DSI_STOPCLK_TIMING                  00000080
DSI_VC_CTRL(0)                      20808f81
DSI_VC_TE(0)                        00000000
DSI_VC_LONG_PACKET_HEADER(0)        00000000
DSI_VC_LONG_PACKET_PAYLOAD(0)       00000000
DSI_VC_SHORT_PACKET_HEADER(0)       00000000
DSI_VC_IRQSTATUS(0)                 00000000
DSI_VC_IRQENABLE(0)                 000000db
DSI_VC_CTRL(1)                      20808fb1
DSI_VC_TE(1)                        00000000
DSI_VC_LONG_PACKET_HEADER(1)        00000000
DSI_VC_LONG_PACKET_PAYLOAD(1)       00000000
DSI_VC_SHORT_PACKET_HEADER(1)       00000000
DSI_VC_IRQSTATUS(1)                 00000000
DSI_VC_IRQENABLE(1)                 000000db
DSI_VC_CTRL(2)                      20808d81
DSI_VC_TE(2)                        00000000
DSI_VC_LONG_PACKET_HEADER(2)        00000000
DSI_VC_LONG_PACKET_PAYLOAD(2)       00000000
DSI_VC_SHORT_PACKET_HEADER(2)       00000000
DSI_VC_IRQSTATUS(2)                 00000000
DSI_VC_IRQENABLE(2)                 000000db
DSI_VC_CTRL(3)                      20808d81
DSI_VC_TE(3)                        00000000
DSI_VC_LONG_PACKET_HEADER(3)        00000000
DSI_VC_LONG_PACKET_PAYLOAD(3)       00000000
DSI_VC_SHORT_PACKET_HEADER(3)       00000000
DSI_VC_IRQSTATUS(3)                 00000000
DSI_VC_IRQENABLE(3)                 000000db
DSI_DSIPHY_CFG0                     132b1322
DSI_DSIPHY_CFG1                     42c6103c
DSI_DSIPHY_CFG2                     b83e000f
DSI_DSIPHY_CFG5                     ff000000
DSI_PLL_CONTROL                     00000018
DSI_PLL_STATUS                      00006383
DSI_PLL_GO                          00000000
DSI_PLL_CONFIGURATION1              10a03000
DSI_PLL_CONFIGURATION2              00656004
root@letux:~# 
--Apple-Mail=_FCE9F26C-63D2-4AEE-8EBB-BDC76342C28B
Content-Disposition: attachment;
	filename=dsi-oldi.txt
Content-Type: text/plain;
	name="dsi-oldi.txt"
Content-Transfer-Encoding: 7bit

root@letux:~# ./debugdsi 
- DSS -
FCK = 192000000
- DISPC -
dispc fclk source = FCK
fck             192000000       
- DISPC-CORE-CLK -
lck             192000000       lck div 1
- LCD -
LCD clk source = PLL1:1
lck             153600000       lck div 1
pck             76800000        pck div 2
- LCD2 -
LCD2 clk source = FCK
lck             48000000        lck div 4
pck             48000000        pck div 1
- LCD3 -
LCD3 clk source = FCK
lck             48000000        lck div 4
pck             48000000        pck div 1
DISPC_REVISION                                     00000051
DISPC_SYSCONFIG                                    00002015
DISPC_SYSSTATUS                                    00000001
DISPC_IRQSTATUS                                    000000a2
DISPC_IRQENABLE                                    0812d640
DISPC_CONTROL                                      00018309
DISPC_CONFIG                                       0000020c
DISPC_CAPABLE                                      00000000
DISPC_LINE_STATUS                                  000001af
DISPC_LINE_NUMBER                                  00000000
DISPC_GLOBAL_ALPHA                                 ffffffff
DISPC_CONTROL2                                     00000000
DISPC_CONFIG2                                      00000000
DISPC_CONTROL3                                     00000000
DISPC_CONFIG3                                      00000000
DISPC_GLOBAL_MFLAG_ATTRIBUTE                       00000001
DISPC_DEFAULT_COLOR(LCD)                           00000000
DISPC_TRANS_COLOR(LCD)                             00000000
DISPC_SIZE_MGR(LCD)                                04ff02cf
DISPC_TIMING_H(LCD)                                09d00800
DISPC_TIMING_V(LCD)                                0320323b
DISPC_POL_FREQ(LCD)                                00060000
DISPC_DIVISORo(LCD)                                00010002
DISPC_DATA_CYCLE1(LCD)                             00000000
DISPC_DATA_CYCLE2(LCD)                             00000000
DISPC_DATA_CYCLE3(LCD)                             00000000
DISPC_CPR_COEF_R(LCD)                              00000000
DISPC_CPR_COEF_G(LCD)                              00000000
DISPC_CPR_COEF_B(LCD)                              00000000
DISPC_DEFAULT_COLOR(TV)                            00000000
DISPC_TRANS_COLOR(TV)                              00000000
DISPC_SIZE_MGR(TV)                                 00000000
DISPC_DEFAULT_COLOR(LCD2)                          00000000
DISPC_TRANS_COLOR(LCD2)                            00000000
DISPC_SIZE_MGR(LCD2)                               00000000
DISPC_TIMING_H(LCD2)                               00000000
DISPC_TIMING_V(LCD2)                               00000000
DISPC_POL_FREQ(LCD2)                               00000000
DISPC_DIVISORo(LCD2)                               00040001
DISPC_DATA_CYCLE1(LCD2)                            00000000
DISPC_DATA_CYCLE2(LCD2)                            00000000
DISPC_DATA_CYCLE3(LCD2)                            00000000
DISPC_CPR_COEF_R(LCD2)                             00000000
DISPC_CPR_COEF_G(LCD2)                             00000000
DISPC_CPR_COEF_B(LCD2)                             00000000
DISPC_DEFAULT_COLOR(LCD3)                          00000000
DISPC_TRANS_COLOR(LCD3)                            00000000
DISPC_SIZE_MGR(LCD3)                               00000000
DISPC_TIMING_H(LCD3)                               00000000
DISPC_TIMING_V(LCD3)                               00000000
DISPC_POL_FREQ(LCD3)                               00000000
DISPC_DIVISORo(LCD3)                               00040001
DISPC_DATA_CYCLE1(LCD3)                            00000000
DISPC_DATA_CYCLE2(LCD3)                            00000000
DISPC_DATA_CYCLE3(LCD3)                            00000000
DISPC_CPR_COEF_R(LCD3)                             00000000
DISPC_CPR_COEF_G(LCD3)                             00000000
DISPC_CPR_COEF_B(LCD3)                             00000000
DISPC_OVL_BA0(GFX)                                 d0003440
DISPC_OVL_BA1(GFX)                                 d0003440
DISPC_OVL_POSITION(GFX)                            00000000
DISPC_OVL_SIZE(GFX)                                04ff02cf
DISPC_OVL_ATTRIBUTES(GFX)                          320040b1
DISPC_OVL_FIFO_THRESHOLD(GFX)                      07ff07f8
DISPC_OVL_FIFO_SIZE_STATUS(GFX)                    00000500
DISPC_OVL_ROW_INC(GFX)                             000034c1
DISPC_OVL_PIXEL_INC(GFX)                           00000001
DISPC_OVL_PRELOAD(GFX)                             000007ff
DISPC_OVL_MFLAG_THRESHOLD(GFX)                     05000400
DISPC_OVL_WINDOW_SKIP(GFX)                         00000000
DISPC_OVL_TABLE_BA(GFX)                            00000000
DISPC_OVL_BA0(VID1)                                00000000
DISPC_OVL_BA1(VID1)                                00000000
DISPC_OVL_POSITION(VID1)                           00000000
DISPC_OVL_SIZE(VID1)                               00000000
DISPC_OVL_ATTRIBUTES(VID1)                         02808400
DISPC_OVL_FIFO_THRESHOLD(VID1)                     07ff07f8
DISPC_OVL_FIFO_SIZE_STATUS(VID1)                   00000800
DISPC_OVL_ROW_INC(VID1)                            00000001
DISPC_OVL_PIXEL_INC(VID1)                          00000001
DISPC_OVL_PRELOAD(VID1)                            000007ff
DISPC_OVL_MFLAG_THRESHOLD(VID1)                    05000400
DISPC_OVL_FIR(VID1)                                04000400
DISPC_OVL_PICTURE_SIZE(VID1)                       00000000
DISPC_OVL_ACCU0(VID1)                              00000000
DISPC_OVL_ACCU1(VID1)                              00000000
DISPC_OVL_BA0_UV(VID1)                             00000000
DISPC_OVL_BA1_UV(VID1)                             00000000
DISPC_OVL_FIR2(VID1)                               04000400
DISPC_OVL_ACCU2_0(VID1)                            00000000
DISPC_OVL_ACCU2_1(VID1)                            00000000
DISPC_OVL_ATTRIBUTES2(VID1)                        00000000
DISPC_OVL_BA0(VID2)                                00000000
DISPC_OVL_BA1(VID2)                                00000000
DISPC_OVL_POSITION(VID2)                           00000000
DISPC_OVL_SIZE(VID2)                               00000000
DISPC_OVL_ATTRIBUTES(VID2)                         02808400
DISPC_OVL_FIFO_THRESHOLD(VID2)                     07ff07f8
DISPC_OVL_FIFO_SIZE_STATUS(VID2)                   00000800
DISPC_OVL_ROW_INC(VID2)                            00000001
DISPC_OVL_PIXEL_INC(VID2)                          00000001
DISPC_OVL_PRELOAD(VID2)                            000007ff
DISPC_OVL_MFLAG_THRESHOLD(VID2)                    05000400
DISPC_OVL_FIR(VID2)                                04000400
DISPC_OVL_PICTURE_SIZE(VID2)                       00000000
DISPC_OVL_ACCU0(VID2)                              00000000
DISPC_OVL_ACCU1(VID2)                              00000000
DISPC_OVL_BA0_UV(VID2)                             00000000
DISPC_OVL_BA1_UV(VID2)                             00000000
DISPC_OVL_FIR2(VID2)                               04000400
DISPC_OVL_ACCU2_0(VID2)                            00000000
DISPC_OVL_ACCU2_1(VID2)                            00000000
DISPC_OVL_ATTRIBUTES2(VID2)                        00000000
DISPC_OVL_BA0(VID3)                                00000000
DISPC_OVL_BA1(VID3)                                00000000
DISPC_OVL_POSITION(VID3)                           00000000
DISPC_OVL_SIZE(VID3)                               00000000
DISPC_OVL_ATTRIBUTES(VID3)                         02808400
DISPC_OVL_FIFO_THRESHOLD(VID3)                     07ff07f8
DISPC_OVL_FIFO_SIZE_STATUS(VID3)                   00000800
DISPC_OVL_ROW_INC(VID3)                            00000001
DISPC_OVL_PIXEL_INC(VID3)                          00000001
DISPC_OVL_PRELOAD(VID3)                            000007ff
DISPC_OVL_MFLAG_THRESHOLD(VID3)                    05000400
DISPC_OVL_FIR(VID3)                                04000400
DISPC_OVL_PICTURE_SIZE(VID3)                       00000000
DISPC_OVL_ACCU0(VID3)                              00000000
DISPC_OVL_ACCU1(VID3)                              00000000
DISPC_OVL_BA0_UV(VID3)                             00000000
DISPC_OVL_BA1_UV(VID3)                             00000000
DISPC_OVL_FIR2(VID3)                               04000400
DISPC_OVL_ACCU2_0(VID3)                            00000000
DISPC_OVL_ACCU2_1(VID3)                            00000000
DISPC_OVL_ATTRIBUTES2(VID3)                        00000000
DISPC_OVL_BA0(WB)                                  00000000
DISPC_OVL_BA1(WB)                                  00000000
DISPC_OVL_SIZE(WB)                                 00000000
DISPC_OVL_ATTRIBUTES(WB)                           00808000
DISPC_OVL_FIFO_THRESHOLD(WB)                       00080000
DISPC_OVL_FIFO_SIZE_STATUS(WB)                     00000800
DISPC_OVL_ROW_INC(WB)                              00000001
DISPC_OVL_PIXEL_INC(WB)                            00000001
DISPC_OVL_MFLAG_THRESHOLD(WB)                      03200280
DISPC_OVL_FIR(WB)                                  04000400
DISPC_OVL_PICTURE_SIZE(WB)                         00000000
DISPC_OVL_ACCU0(WB)                                00000000
DISPC_OVL_ACCU1(WB)                                00000000
DISPC_OVL_BA0_UV(WB)                               00000000
DISPC_OVL_BA1_UV(WB)                               00000000
DISPC_OVL_FIR2(WB)                                 04000400
DISPC_OVL_ACCU2_0(WB)                              00000000
DISPC_OVL_ACCU2_1(WB)                              00000000
DISPC_OVL_ATTRIBUTES2(WB)                          00000000
DISPC_OVL_FIR_COEF_H_0(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_1(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_2(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_3(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_4(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_5(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_6(VID1)                       00000000
DISPC_OVL_FIR_COEF_H_7(VID1)                       00000000
DISPC_OVL_FIR_COEF_HV_0(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_1(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_2(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_3(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_4(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_5(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_6(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV_7(VID1)                      00000000
DISPC_OVL_CONV_COEF_0(VID1)                        0199012a
DISPC_OVL_CONV_COEF_1(VID1)                        012a0000
DISPC_OVL_CONV_COEF_2(VID1)                        079c0730
DISPC_OVL_CONV_COEF_3(VID1)                        0000012a
DISPC_OVL_CONV_COEF_4(VID1)                        00000204
DISPC_OVL_FIR_COEF_V_0(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_1(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_2(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_3(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_4(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_5(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_6(VID1)                       00000000
DISPC_OVL_FIR_COEF_V_7(VID1)                       00000000
DISPC_OVL_FIR_COEF_H2_0(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_1(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_2(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_3(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_4(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_5(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_6(VID1)                      00000000
DISPC_OVL_FIR_COEF_H2_7(VID1)                      00000000
DISPC_OVL_FIR_COEF_HV2_0(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_1(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_2(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_3(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_4(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_5(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_6(VID1)                     00000000
DISPC_OVL_FIR_COEF_HV2_7(VID1)                     00000000
DISPC_OVL_FIR_COEF_V2_0(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_1(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_2(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_3(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_4(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_5(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_6(VID1)                      00000000
DISPC_OVL_FIR_COEF_V2_7(VID1)                      00000000
DISPC_OVL_FIR_COEF_H_0(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_1(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_2(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_3(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_4(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_5(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_6(VID2)                       00000000
DISPC_OVL_FIR_COEF_H_7(VID2)                       00000000
DISPC_OVL_FIR_COEF_HV_0(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_1(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_2(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_3(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_4(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_5(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_6(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV_7(VID2)                      00000000
DISPC_OVL_CONV_COEF_0(VID2)                        0199012a
DISPC_OVL_CONV_COEF_1(VID2)                        012a0000
DISPC_OVL_CONV_COEF_2(VID2)                        079c0730
DISPC_OVL_CONV_COEF_3(VID2)                        0000012a
DISPC_OVL_CONV_COEF_4(VID2)                        00000204
DISPC_OVL_FIR_COEF_V_0(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_1(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_2(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_3(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_4(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_5(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_6(VID2)                       00000000
DISPC_OVL_FIR_COEF_V_7(VID2)                       00000000
DISPC_OVL_FIR_COEF_H2_0(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_1(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_2(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_3(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_4(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_5(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_6(VID2)                      00000000
DISPC_OVL_FIR_COEF_H2_7(VID2)                      00000000
DISPC_OVL_FIR_COEF_HV2_0(VID2)                     00000000
DISPC_OVL_FIR_COEF_HV2_1(VID2)                     00000000
DISPC_OVL_FIR_COEF_HV2_2(VID2)                     00000000
DISPC_OVL_FIR_COEF_HV2_3(VID2)                     00000000
DISPC_OVL_FIR_COEF_HV2_4(VID2)                     00000000
DISPC_OVL_FIR_COEF_HV2_5(VID2)                     00000000
DISPC_OVL_FIR_COEF_HV2_6(VID2)                     00000000
DISPC_OVL_FIR_COEF_HV2_7(VID2)                     00000000
DISPC_OVL_FIR_COEF_V2_0(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_1(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_2(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_3(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_4(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_5(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_6(VID2)                      00000000
DISPC_OVL_FIR_COEF_V2_7(VID2)                      00000000
DISPC_OVL_FIR_COEF_H_0(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_1(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_2(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_3(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_4(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_5(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_6(VID3)                       00000000
DISPC_OVL_FIR_COEF_H_7(VID3)                       00000000
DISPC_OVL_FIR_COEF_HV_0(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_1(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_2(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_3(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_4(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_5(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_6(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV_7(VID3)                      00000000
DISPC_OVL_CONV_COEF_0(VID3)                        0199012a
DISPC_OVL_CONV_COEF_1(VID3)                        012a0000
DISPC_OVL_CONV_COEF_2(VID3)                        079c0730
DISPC_OVL_CONV_COEF_3(VID3)                        0000012a
DISPC_OVL_CONV_COEF_4(VID3)                        00000204
DISPC_OVL_FIR_COEF_V_0(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_1(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_2(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_3(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_4(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_5(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_6(VID3)                       00000000
DISPC_OVL_FIR_COEF_V_7(VID3)                       00000000
DISPC_OVL_FIR_COEF_H2_0(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_1(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_2(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_3(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_4(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_5(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_6(VID3)                      00000000
DISPC_OVL_FIR_COEF_H2_7(VID3)                      00000000
DISPC_OVL_FIR_COEF_HV2_0(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_1(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_2(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_3(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_4(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_5(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_6(VID3)                     00000000
DISPC_OVL_FIR_COEF_HV2_7(VID3)                     00000000
DISPC_OVL_FIR_COEF_V2_0(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_1(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_2(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_3(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_4(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_5(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_6(VID3)                      00000000
DISPC_OVL_FIR_COEF_V2_7(VID3)                      00000000
cat: /sys/kernel/debug/omapdss/dsi1_irqs: No such file or directory
DSI_REVISION                        00000040
DSI_SYSCONFIG                       00000015
DSI_SYSSTATUS                       00000001
DSI_IRQSTATUS                       00000000
DSI_IRQENABLE                       0015c000
DSI_CTRL                            00eaee9f
DSI_COMPLEXIO_CFG1                  2a0dcba9
DSI_COMPLEXIO_IRQ_STATUS            00000000
DSI_COMPLEXIO_IRQ_ENABLE            3ff07fff
DSI_CLK_CTRL                        a030600b
DSI_TIMING1                         ffff1000
DSI_TIMING2                         ffffffff
DSI_VM_TIMING1                      00005076
DSI_VM_TIMING2                      043c3232
DSI_VM_TIMING3                      029a0500
DSI_CLK_TIMING                      00001b10
DSI_TX_FIFO_VC_SIZE                 13121110
DSI_RX_FIFO_VC_SIZE                 13121110
DSI_COMPLEXIO_CFG2                  00030000
DSI_RX_FIFO_VC_FULLNESS             00000000
DSI_VM_TIMING4                      00000000
DSI_TX_FIFO_VC_EMPTINESS            1f1f1f1f
DSI_VM_TIMING5                      00000000
DSI_VM_TIMING6                      01340007
DSI_VM_TIMING7                      00100010
DSI_STOPCLK_TIMING                  00000080
DSI_VC_CTRL(0)                      20808f91
DSI_VC_TE(0)                        00000000
DSI_VC_LONG_PACKET_HEADER(0)        00000000
DSI_VC_LONG_PACKET_PAYLOAD(0)       00000000
DSI_VC_SHORT_PACKET_HEADER(0)       00000000
DSI_VC_IRQSTATUS(0)                 00000004
DSI_VC_IRQENABLE(0)                 000000db
DSI_VC_CTRL(1)                      20808d81
DSI_VC_TE(1)                        00000000
DSI_VC_LONG_PACKET_HEADER(1)        00000000
DSI_VC_LONG_PACKET_PAYLOAD(1)       00000000
DSI_VC_SHORT_PACKET_HEADER(1)       00000000
DSI_VC_IRQSTATUS(1)                 00000004
DSI_VC_IRQENABLE(1)                 000000db
DSI_VC_CTRL(2)                      20808d81
DSI_VC_TE(2)                        00000000
DSI_VC_LONG_PACKET_HEADER(2)        00000000
DSI_VC_LONG_PACKET_PAYLOAD(2)       00000000
DSI_VC_SHORT_PACKET_HEADER(2)       00000000
DSI_VC_IRQSTATUS(2)                 00000000
DSI_VC_IRQENABLE(2)                 000000db
DSI_VC_CTRL(3)                      20808d81
DSI_VC_TE(3)                        00000000
DSI_VC_LONG_PACKET_HEADER(3)        00000000
DSI_VC_LONG_PACKET_PAYLOAD(3)       00000000
DSI_VC_SHORT_PACKET_HEADER(3)       00000000
DSI_VC_IRQSTATUS(3)                 00000000
DSI_VC_IRQENABLE(3)                 000000db
DSI_DSIPHY_CFG0                     132b1322
DSI_DSIPHY_CFG1                     42c6103c
DSI_DSIPHY_CFG2                     b800000f
DSI_DSIPHY_CFG5                     ff000000
DSI_PLL_CONTROL                     00000018
DSI_PLL_STATUS                      00006383
DSI_PLL_GO                          00000000
DSI_PLL_CONFIGURATION1              10a03000
DSI_PLL_CONFIGURATION2              00656004
root@letux:~# 
--Apple-Mail=_FCE9F26C-63D2-4AEE-8EBB-BDC76342C28B
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii




--Apple-Mail=_FCE9F26C-63D2-4AEE-8EBB-BDC76342C28B
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--Apple-Mail=_FCE9F26C-63D2-4AEE-8EBB-BDC76342C28B--
