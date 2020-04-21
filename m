Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 382921B3819
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAE86E9A4;
	Wed, 22 Apr 2020 06:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7506189EBD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 09:31:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DBF64AE53;
 Tue, 21 Apr 2020 09:31:51 +0000 (UTC)
Subject: Re: [PATCH v12 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20200311165322.1594233-1-enric.balletbo@collabora.com>
 <20200311165322.1594233-5-enric.balletbo@collabora.com>
 <02290a21-7392-a2cf-576c-215091ec05e8@suse.com>
 <1585177534.26117.4.camel@mtksdaap41>
 <f3c2926a-ef92-b004-9786-5be1645af497@suse.com>
 <1585234277.12089.3.camel@mtksdaap41>
 <73ef0b8e-2802-a047-2a56-936b63d264cb@suse.com>
 <CAAOTY__EV8PHau9CzSiA8up1QAmZxfK2QnaTid0WrNOsn2Xcag@mail.gmail.com>
From: Matthias Brugger <mbrugger@suse.com>
X-Pep-Version: 2.0
Message-ID: <c809233f-6d96-8871-e6a4-b66ed5cc535f@suse.com>
Date: Tue, 21 Apr 2020 11:31:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY__EV8PHau9CzSiA8up1QAmZxfK2QnaTid0WrNOsn2Xcag@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------4BB1865ABCAB0DB18962FA15"
Content-Language: en-US
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, matthias.bgg@kernel.org,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 devicetree@vger.kernel.org, Seiya Wang <seiya.wang@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, sean.wang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Houlong Wei <houlong.wei@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 mtk01761 <wendell.lin@mediatek.com>,
 Collabora Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------4BB1865ABCAB0DB18962FA15
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 4/16/20 6:22 PM, Chun-Kuang Hu wrote:
> Hi, Matthias:
>=20
> Matthias Brugger <mbrugger@suse.com> =E6=96=BC 2020=E5=B9=B43=E6=9C=882=
6=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:45=E5=AF=AB=E9=81=93=EF=
=BC=9A
>>
>>
>>
>> On 26/03/2020 15:51, CK Hu wrote:
>>> Hi, Matthias:
>>>
>>> On Thu, 2020-03-26 at 12:54 +0100, Matthias Brugger wrote:
>>>> Hi CK,
>>>>
>>>> On 26/03/2020 00:05, CK Hu wrote:
>>>>> Hi, Matthias:
>>>>>
>>>>> On Wed, 2020-03-25 at 17:16 +0100, Matthias Brugger wrote:
>>>>>>
>>>>>> On 11/03/2020 17:53, Enric Balletbo i Serra wrote:
>>>>>>> Provide a mtk_mmsys_ddp_connect() and mtk_mmsys_disconnect() func=
tions to
>>>>>>> replace mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_p=
ath().
>>>>>>> Those functions will allow DRM driver and others to control the d=
ata
>>>>>>> path routing.
>>>>>>>
>>>>>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.c=
om>
>>>>>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>>>>>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>>>>>> Acked-by: CK Hu <ck.hu@mediatek.com>
>>>>>>
>>>>>> This patch does not apply against v5.6-rc1.
>>>>>> Please rebase as this is a quite big patch and it won't be easy to=
 do that by hand.
>>>>>
>>>>> I think this patch depends on [1] which has been acked by me and I =
have
>>>>> not picked it. The simple way is that you pick [1] first and then p=
ick
>>>>> this series.
>>>>>
>>>>> [1]
>>>>> https://patchwork.kernel.org/patch/11406227/
>>>>>
>>>>
>>>> You would need to provide a stable tag for me that I can merge into =
my tree. You
>>>> can also try to merge my for-next [1] which has the newest version f=
rom Enric.
>>>> If you see any merge conflict, then we have to do something about it=
 :)
>>>>
>>>> Regards,
>>>> Matthias
>>>>
>>>> [1]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.g=
it/log/?h=3Dfor-next
>>>>
>>>
>>> You have applied this series, so I would not apply other patches whic=
h
>>> would conflict with this series. After this series land on main strea=
m
>>> (wish it happen in this merge window), I would rebase other patch on
>>> main stream.
>>>
>>
>> I haven't (yet) send the pull request. If you want to bring in your pa=
tches in
>> v5.7 as well we can find a solution to that. Shall I provide you with =
a stable
>> branch which you can merge? This way you can add all your patches in t=
he pull
>> request as well and we don't have to wait for v5.8 to get things into =
mainline.
>>
>> Let me know and I'll provide you with a stable branch.
>=20
> This series is in linux-next but does not in main stream. So would you
> please provide a stable branch so I could pull this series?
>=20

Please find the pull request below:

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f31=
36:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:


https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.7-next-drm-stable

for you to fetch changes up to 667c769246b01c53ad0925d603d2a2531abd3ef2:

  soc / drm: mediatek: Fix mediatek-drm device probing (2020-04-13
13:01:16 +0200)

----------------------------------------------------------------
Enric Balletbo i Serra (3):
      dt-bindings: mediatek: Update mmsys binding to reflect it is a
system controller
      soc / drm: mediatek: Move routing control to mmsys device
      soc / drm: mediatek: Fix mediatek-drm device probing

Matthias Brugger (2):
      drm/mediatek: Omit warning on probe defers
      clk / soc: mediatek: Move mt8173 MMSYS to platform driver

 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt |   7 =
+--
 drivers/clk/mediatek/Kconfig                                      |   7 =
+++
 drivers/clk/mediatek/Makefile                                     |   1 =
+
 drivers/clk/mediatek/clk-mt8173-mm.c                              | 146
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mt8173.c                                 | 104
------------------------------------------
 drivers/gpu/drm/mediatek/Kconfig                                  |   1 =
+
 drivers/gpu/drm/mediatek/mtk_disp_color.c                         |   5 =
++-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c                           |   5 =
++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c                          |   5 =
++-
 drivers/gpu/drm/mediatek/mtk_dpi.c                                |  12
+++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c                           |  19
++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c                            | 259
+------------------------------------------------------------------------=
--------------------------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h                            |   7 =
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                            |  45
++++++++++---------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h                            |   2 =
+-
 drivers/gpu/drm/mediatek/mtk_dsi.c                                |   8
+++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                               |   4 =
+-
 drivers/soc/mediatek/Kconfig                                      |   8
++++
 drivers/soc/mediatek/Makefile                                     |   1 =
+
 drivers/soc/mediatek/mtk-mmsys.c                                  | 337
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h                            |  20
+++++++++
 21 files changed, 592 insertions(+), 411 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
 create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
 create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h



> Regards,
> Chun-Kuang.
>=20
>>
>> Regards,
>> Matthias
>>
>>> Regards,
>>> CK
>>>
>>>>> Regards,
>>>>> CK
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Matthias
>>>>>>
>>>>>>> ---
>>>>>>>

--------------4BB1865ABCAB0DB18962FA15
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFuECLQBCAD66PIehgR5YGIOhLIDfubGmBbktra7Ix4c0uMShRkv05ZfJmPK
N50OrIm4gaQ25RMDrZd6X3RU35IsoflqTSBGoiMQmC9TklVsAfIObuNkvDMJEDXd
pvbIuYyj9QcSysHvTW9GrU/hF3uFqoPlaDmQy9TBMDDtJu8CPYVpyVnmXJvyoYa2
KE77LYXORs+eArKR8dqOK/z3zzHWMq8IieiASRcFfDZBx4fPHRZaOYkFGaLpQPfF
/bCwWWX6O6bRvx5KOWTQzt2Hp/6ZzHX+A7XY6yLY9bM18/70NICZNF8oaDN6/i/K
nMoGcugqE2Kk66hLeybFWVmFjppRt7zh6GaVABEBAAG0JE1hdHRoaWFzIEJydWdn
ZXIgPG1icnVnZ2VyQHN1c2UuY29tPokBVAQTAQgAPgIbAwULCQgHAgYVCgkICwIE
FgIDAQIeAQIXgBYhBA1mtM782M72qvgLxkP54a369LqrBQJdZ/80BQkDxMzsAAoJ
EEP54a369LqrBxsH/jOEmKlthbUCWFmvNZyPl8VCqVNRQdVOBlg7JzjYtGPMukdv
aGMFDTbn9f7RpVdVasnjwta2rAuPxYGT2SajccSqIUnjlyxOXjdWgahfvS1bLfIh
QW3F3r5P6Sc1hVkSAYB+IKgEHoRl09fcVfxDR4i7xuGP8lvaG5087u7hHiqAXAmL
gInuY2QA8MkgxLOie6HOavSEG58Car5EBOZOuIzg7lnL0cyYv/nx6kopNuJXAaum
tsk2xwuNqz8Ny5AYTowyuasaZchEeJpc3su+yoZvOrc/UVgcCmcT7GUnMaTQGc4I
bVWWK7762RB++hLaDiFVXRJZr6jfIU2X3VrsxOO5AQ0EW4QItQEIAMrwGOUXVhVE
kl6+IXCnD2TPqdGiuv/aKZ8yIvvD1VPw8j0kRdbsha1sIxE7cKvHcnRqKuLW6w9s
FCNaXoJBPysVDWhVdT4drpr8WtwZQG4Lqa86t5Ndz14lG3Vr/lFs07BpVbxZj2/k
RqXNZbAmCmZfZbtR55XyUz20uJxoQ0ckXOUxLA2ye0bF9DOt4SwgNgSdp668YFep
sTBPR0wRLQQpL/00z+S7fiULzUqzUq4cQPpZt7YALJ2iQoUQ93G3t95DMwdt5/tT
mnFMt8ruyP45oHO+8X6RDRSR31G34YzLWGinXPMDYZ+kjhFg3yv5m5+V6Lc2+APN
PbouD/9LEXUAEQEAAYkBPAQYAQgAJgIbDBYhBA1mtM782M72qvgLxkP54a369Lqr
BQJdZ/80BQkDxMzrAAoJEEP54a369LqrjYAH/iSIrw1ROtd+uPupqwttF9IfG3Na
O1u/6Sk9nKRa2P0SaxYh7ZF8foUs5m0M9mPrAQwAFMRSuu3KQPKQM6vIJR2dRmET
G9zkyV6FBfoPaodSo8ovv8qi3XCoJxuaF3/+Fes6DPGjk8zCyCy7h+te06s5H8w1
HZc7YepyOrgdaVMqG6j4c44epLHQ/xtbHQ6Y4Zbb43RBeyYhcRpBgkB/LWuKCbqm
3AcVMmhcgns86U8jI1VkYzjuvwt9DNJgFgPpyynqfWKl9N0u7aik7ByYYUeK8tZI
1rwTZ+CdzOq4YRIVWqoG6eLHd1qf2mCuCqiz9TZnDWXPad5ghdzWiX1Mg44=3D
=3D3czs
-----END PGP PUBLIC KEY BLOCK-----

--------------4BB1865ABCAB0DB18962FA15
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------4BB1865ABCAB0DB18962FA15--
