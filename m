Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63B47DB925
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 12:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C83210E292;
	Mon, 30 Oct 2023 11:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2465F10E04F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1698661709; x=1699266509; i=wahrenst@gmx.net;
 bh=5fu8YN5W//4aIguK4VINNkgKz+/yGpnarGMBWHEg5gw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=A1NA2QRn2bOQOuiPa/Sy8BB1VtVfGsMklDsJisUE5QN+0Y5sDXX9nDy5G4SN2Sir
 sl+2Nq+UHQDmMAGCr9I/QOcqacxqYVYcJ2Te0YflDDZev+qqgs2M8BMix82muOTH6
 wJUk6xfLnegmMXTvVFejmSo3rR0oKBfFiFmLjvnYzGhEBYAB06+df+fG1N/Xz8gP8
 5yP4V2OTbvAsd5Glqte0LHFrm+4c1P/tzW/4Tm/mEIj6os+luSAURByL2zLB8xNgQ
 MQPyIDRCvR2Fv98GOe3hh++0CtNOrsFNhe2pRP0y0b/o2SZLX2I2PSl3l5ryJU5U0
 C0fX37ZvtWQA0na40g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26vB-1quwWy2oYL-002WOG; Mon, 30
 Oct 2023 11:28:29 +0100
Message-ID: <4eda35af-c885-4ecd-9db5-f9a3a7810459@gmx.net>
Date: Mon, 30 Oct 2023 11:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/v3d: fix up register addresses for V3D 7.x
Content-Language: en-US
To: Iago Toral <itoral@igalia.com>, Maira Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
References: <20231030082858.30321-1-itoral@igalia.com>
 <20231030082858.30321-3-itoral@igalia.com>
 <613c4107-26c5-4d48-95c2-15ac8fcca33c@gmx.net>
 <7dbf5892f22b01ec3ef99dc1b261f68147fc9715.camel@igalia.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <7dbf5892f22b01ec3ef99dc1b261f68147fc9715.camel@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p9/AlSZgtgMtpHotvziArlHtgW6sXfvqqvs6JoXnIaRqbQNGbBe
 AaGn++7hj8Wud4eKuRU3ZIjKB8i6V9HNF5f827kCItw+HCbvyBpWQqz6LlJcgWiSTg3xwP4
 DrCulzgB7Hr3UHC7BXhGWNLXti9S/7UnXlpCvmekVhoGHQqb+OcYxypZeEKAOC9r7QLNAij
 /582WPRcaqbPLyZawx9+Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ihoLADv59q0=;qKQzMxwb1sT0ASJJloI86c6t//z
 wvdxxXpsbuUNEG+r7z8G6907jTKi48EkObliVVoOtxwojsHxV+zkZs72I6wd0t53TIAeeuEGl
 46vU5XVimGOSPa7CGgXLmFdCofYyndtZRSEIMf/Ig/zaLA01/19dvXsNZZI9nHWPyLtdTPXJ+
 cw0AvjRofqyA/1+lw7hzvY6gC3RPPqR4aW/WR8R4kTfoPD8JC/epVuwciaEVaQFpnYfOIHmTM
 +NdrGghVHbhBWXZFc8lxbS0HhiuLQN6w0jXRTTeAUuKCFvpSNI5aNJdyw5POQkOlnYs+bIPXA
 k9ZnfjzSfWIVzn/Y1AhVxVuWR/kGwLO6YVzbhV5twZNgSo+NUljNU9ihF2V9rrivG6GJYDKX+
 BoT/TPoYts6kLqIcxegY/SMR62+LJywDDjp4D4Hp1harPVX78zixy71pijNZJ4nYzRtgn3yz+
 gIo3eM6GO9eYxG61Acu67ewUavYwYAubcoAOLQzFD7PPuWj2o9KBZoKzyfneF8Q9OiNathBSk
 w5/eWRQEmjqynBkA2XRIdwoYA4HwxIE/TPhMVgL66tMh8wtOAnCpxNbZ9YMpAeWPQHcyTP/YM
 oscSvktpRkNrplLr1mxb2HcmsuvYRLdiyyP3dDiNqA6aL/mLm8P2Bnw354QuBDmu9wCCqjMkM
 uCxqhgcIf+eHTOeoJYld6AusMrx8GgfGxF4TPKnl0gON+1CRGw08P4XbbzDNstzJve4LqyAz0
 FwWuize2yvOYpiDAb9VpBGF2cmY8qpnZeKHBktzCejpF5QC/n1kB9ZkD+Ky8eTtV17m96oBin
 UHYXw8oHDHtDSjKP9kvtr5ZWfuiRBbn+7jEPqx+MQKaJy3mfVFb6MQ90I3nlFaeEEQSU0pu2e
 juzgLmtkhd/4YzrNc3EUDI+Vlz1rWsKqgfTijg33Scmd5mj1lt0Ds5dfE2ag/yWkJvLLOU1sf
 DzNzgRPPHYEzKNcWNCPu9dC7oaA=
X-Mailman-Approved-At: Mon, 30 Oct 2023 11:41:13 +0000
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Iago,

Am 30.10.23 um 11:14 schrieb Iago Toral:
> Hi Stefan,
>
> El lun, 30-10-2023 a las 10:58 +0100, Stefan Wahren escribi=C3=B3:
>> Hi Iago,
>>
>> Am 30.10.23 um 09:28 schrieb Iago Toral Quiroga:
>>> This patch updates a number of register addresses that have
>>> been changed in Raspberry Pi 5 (V3D 7.1) and updates the
>>> code to use the corresponding registers and addresses based
>>> on the actual V3D version.
>>>
>>> v2:
>>>  =C2=A0 - added s-o-b and commit message. (Ma=C3=ADra Canal)
>>>  =C2=A0 - Used macro that takes version as argument and returns
>>>  =C2=A0=C2=A0=C2=A0 appropriate values instead of two different defini=
tions
>>>  =C2=A0=C2=A0=C2=A0 for post-v71 and pre-v71 hardware when possible. (=
Ma=C3=ADra Canal)
>>>  =C2=A0 - fixed style warnings from checkpatch.pl. (Ma=C3=ADra Canal)
>>>
>>> Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
>>> ---
>>>  =C2=A0 drivers/gpu/drm/v3d/v3d_debugfs.c | 178 +++++++++++++++++-----=
---
>>> -----
>>>  =C2=A0 drivers/gpu/drm/v3d/v3d_gem.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 4 +-
>>>  =C2=A0 drivers/gpu/drm/v3d/v3d_irq.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
46 ++++----
>>>  =C2=A0 drivers/gpu/drm/v3d/v3d_regs.h=C2=A0=C2=A0=C2=A0 |=C2=A0 94 ++=
+++++++-------
>>>  =C2=A0 drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0 |=C2=A0 38 ++++---
>>>  =C2=A0 5 files changed, 204 insertions(+), 156 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c
>>> b/drivers/gpu/drm/v3d/v3d_debugfs.c
>>> index 330669f51fa7..f843a50d5dce 100644
>>> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
>>> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
>>> @@ -12,69 +12,83 @@
>>>  =C2=A0 #include "v3d_drv.h"
>>>  =C2=A0 #include "v3d_regs.h"
>>>
>>> -#define REGDEF(reg) { reg, #reg }
>>> +#define REGDEF(min_ver, max_ver, reg) { min_ver, max_ver, reg,
>>> #reg }
>>>  =C2=A0 struct v3d_reg_def {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 min_ver;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 max_ver;
>> Is this documented some where which SoC has which V3D version?
>>
> Not that I am aware of.
>
> There are really only two Raspberry Pi SoCs supported by v3d: bcm2711
> is Raspberry Pi 4 which is V3D 4.2 (compatible with 4.1), and bcm2712
> is Raspberry Pi 5 which is V3D 7.1.
okay, in this case the best source would be Emma's wiki [1]. Maybe these
should be added as well to the wiki.

[1] - https://github.com/anholt/linux/wiki/Devices-with-Videocore-graphics
>
> I don't know what SoCs are supported by versions of V3D before 4.1, I
> think those were targetting set-top-box hardware that Emma used while
> setting up the driver before the SoC for Raspberry Pi 4 was available.
>
> Iago

