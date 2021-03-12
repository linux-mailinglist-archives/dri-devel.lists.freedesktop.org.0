Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57077338479
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 04:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5DC6ECA6;
	Fri, 12 Mar 2021 03:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic311-25.consmr.mail.ne1.yahoo.com
 (sonic311-25.consmr.mail.ne1.yahoo.com [66.163.188.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093446ECA6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 03:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1615520974; bh=qSjx3SVyb+Fgibla3+MHxep7GguygdHMZ7We+Gl9M3M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=UIk8pPPBHD9MGASxfZUDvXoR+2LJcQPY0J3uWwKHen9NqGtsPs5VbsfUQilw/BreLIyNfxNMQcukqXfGoueC7lorhvhB/QXF5xI3X8+v90HYNi4WcAxMfY2Zu0kT9FnMYLAx6y50s+FNiDAtpYOWS7GT3pexdbeHZU1bNebhRPtQ40vSz+716/byErVvf2exK4flIf5fgfknmySKdduL7HMdKiTYL4+ozDvmOeAL1eXBpDJPyWUFV6vP487PgEeo/6kQW0fgDHC8vX2tX/GDPNh1Vv1G3zvYPzV+WyVtNt7hi+iX8sWzwZ2Jd+cUOC4LZZ0ucTiu9F9JQO9zhPw5yA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1615520974; bh=9MJjzzxgeyOvllo+P7z7Z2TyFdLU1UGikBQTq6Xyi6d=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=IE2NFeovUwBmLo+xy9+xuamQvUpOBTRr9GN/HJjIog9z4w/Mb+Krren9iUM8Z0qc/o2CLxFgFQ3COxstg4WDIhSenUJCxtLVG/TEnVs69ZvtaLzBem5jgNinMaFKyYP811A68Fhn8MbHprvWlUYVrTzeyGf8bgVWiVge1r97NdiNGXvPqyfV4beSr68aQQGIXFiFOxQ3ctKx5ZXFun5lwUKdBBjRzelTa6JicYk3kE5FA3DnLRy/DrwfygzA1Kw5eGFuI0SClxZ0Q/3V2I8GsRX4RnarqtoxHagC+ngTZgrDH6j+tjFHbHXSFkr7D4JV2rs6ELkj9LPm9x101rv5Dw==
X-YMail-OSG: BeOQs7wVM1nFym.OcSwhhyJ8HzdouEMyF1SLaoObi4GXGv_._83p4mpa72SHCUS
 c9aLjO2OxDx3XXinMx5ZzhLBtzLx5YFUJ9ztcDOhqKQTzpbExAhq.kOqxrI.NyI6roRK4hH65Px4
 CKWlkEGzvQa8p6DoA9D9rKJPadEjOsjHdtoxCNMhbE3KHBpbHrMlJRpq0e23OgtZZ5HhmvKbEjmD
 W8gW_eM_YNxsSbAb5OB_mUF43l.Nq4K_RCaCcFhRz89Y67pq2tDi3pFVo43zR1nmFhF_7.1H0vSH
 r61q7YylJFngE99aH84ZloR85ZECWHdKIv3W73TanRheIt1.db1.Vrxo0SRFYxBGUUvWoTt115GE
 aI3lD1Aog7wpsjvOhYp2LTk9im49BbSPZ.q7pHeenWJgkRyZ5vZDMlcyvFgMyySyMLUmMpArIi.Q
 a.ZlHzKqMmSjCh366wkj7Ffrw0ThT9B5zsjGLn_p5uDT4f.gmGw4BDfCQ9s3hIbofSx1eV3OF8sq
 DwfI3bioenVZ3pekld4XkXR0yPVR4fLydC0q2sXDcrbBHohc8gZjKnWD7zQ2g.IRQ2XlpDRjx9tQ
 Q3xf5.o0MA26HPpUg9PJzCQE279B6Do8drG3WAsLk6qu1pcdXUs11cqLkhdXuFVdWRz.FHfHOiE2
 4LHNIkAMiNhRGS_hcEyj55ho3W9ZK3tU3_izSdS5VirEoVGJmB6Jjlou6QpePqzBWjP9JV.V4Pnq
 iqr3vvYjSaNH.K1Z3cE4a86ZpD_8pvrdc.5D8W9Dv9Af5x6GJhIMqMiuPQ.gaL_h4XK9fnBg6MrY
 kBHzJllDd6Ql5l1hTfU33_O.ZNgKCcQMV6rCiuOq0DCVRHZqw1GExI168lOc7HCYxn_bAmkUrWKC
 eRv2GnDEbm.M3rFOcolhwD2zDuzXPoK69qWoWu12BNy.T5WIwX_lKKn4zP397_7djfKLQAjqN035
 RcucPbqy_yZBP7DAB9bUeYX_HB_bEPg06fq3suewv3yx3TlwvD_TPllJOlxx.PJWqOGG080iZUwS
 cIwh1tX.Ivv552y50ZYfsxjW_BckclK0_E5fqgdSTxUB7RFwaJzz6FHSWs4RT8iolujspRw.nVDu
 hP8TslbFON7HFqx3dYm8tOOGli2lIAbaup_.YZhTrEPCuzxhBsAIPv3NJ8e2pj4vTCJR2HKaEhcd
 HLzl0Jxm1IfdTC86fIDJIWvgYnlXVy7YzhkIZ7BD7aGKh_J02_d9es0Da5t3uJPGjfTMAmJRIWV.
 sciv.Sx6YFPGPvaEGcpVu4ZO9xQmwuKaajmuFXLS46dP.13e5g.qli0XNvMAb2yT7j..0U67ndOQ
 kDE1ml3Xw9vu_ph7M65DJgVDYKLPBOeX5dqkRWXHo1kQcNrNLMPHEZY6GimTRxEGcvuj7sx4zl97
 HiR.kx5DXkpCEvV7LwYz0htHrzWA0RqSzEWaKDk0CH0LocSmNq7uGuIiE0nBwwvZhjVVdkEm3LQo
 7nNx6XVooT3UREqmM4qTQWBso0UX3hr1vGuEfyWeilbvXGP7nT5VWOtedwT4Nn.5xVGoK7yjHF1f
 n9975fdyarqTb_gLaAuEsvXE5rA2KbPxqhQQJjjkBp5fpeazpBVw.gZB8bcMO8SF4axUV1Wz9pi4
 IS5olLTN472frJPFMfU8UDyBAk7FuiiQ7BNtZeq2wqI.TsERYlI1zXpDWoGaid19chdBzNs4J14c
 NYmrb20ETW8nwdxoBoOnyemSiKnHZ0NEk8oRRD6gLRIGb9fMqwoMdUuuCXxcIQ0B8.9DwSSVsluB
 atA0GPc4B5qrlkFvsjyVzDYmkcl1IROlhfrayO.wHwqE1_JdN1GOnpy7BHzdjhNZOhSyy5v78ege
 hJZqK2aR4wswkK4ujzIioasJ4Cq.7vELK65032tBHF_MzKb542KxwWztVKRBF4H7LNM4EEpiBgXP
 bwBV_PiSVdJrU7Fc32ICgQFvyYEMyyxm1efm57jIm6iVyySlc4xrNSJ_m_qC0NKQrUj4YA10jngl
 DDdguamK0y_0sDEAX.vhuXzFBG_fCrL1cMjR1CzKj_krBtaVGXih4ClwpIM08HiGIekTwexwP7RB
 DP2mwazrLZbUb3YrXFoTsmiSXF898quqQVYNVDdOJZq_Sjm194kApLq.K99txA8.xuK.6mub5NoS
 GA0N4GfsyoaG2iBvPvGYAcmZFy8rRwoUjpImz1nz0DibtyT5mLGhr7O072wBLmhRo9oldUkT0Rau
 _sdSp3tCfNeFuD46jKAGI5xAMnjv2vn8fLA8P3DpoJ5Q7f9pDoAN8nwU_bVrxiypb_4keLbhOiPg
 V5l64KjjFz5DOyk1XPM3phyRxtaQA.axHKJd5FSuWEiHOBRnP.EC9e5HGer6NiRPI4vPCqQlncm1
 AFZINUpeYXJpe3jR_kTiYw5GBfi8FxjyjlkxfsXatvYDlADcdmoxf8faPSGH7gQjxHYC7sMWgm7Y
 v9Y3.i8eux5mschq8rbwuHnG5pLj_4.I.LwWm1aZH..hB2h9GFQ7ZxISLdPdfCix4xDdTWLc66zp
 0klpIPvZrvQk_uzIEocSi5.TKJhV0mvkEOCsQl19jB0FcLtc8LfEO7X1w0bI-
X-Sonic-MF: <bluescreen_avenger@verizon.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ne1.yahoo.com with HTTP; Fri, 12 Mar 2021 03:49:34 +0000
Received: by smtp407.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 85a992d9f1add2b765a1c9c8bf7d2aee; 
 Fri, 12 Mar 2021 03:49:28 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 0/7] drm: add simpledrm driver
Date: Thu, 11 Mar 2021 22:49:27 -0500
Message-ID: <1761762.3HQLrFs1K7@nerdopolis>
In-Reply-To: <c5db27fd-40dc-8800-965e-84be2f562d65@suse.de>
References: <20160902082245.7119-1-dh.herrmann@gmail.com>
 <1819978.CKrAbXhGjX@nerdopolis>
 <c5db27fd-40dc-8800-965e-84be2f562d65@suse.de>
MIME-Version: 1.0
X-Mailer: WebService/1.1.17936
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
 Apache-HttpAsyncClient/4.1.4 (Java/11.0.9.1)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, March 10, 2021 4:10:35 AM EST Thomas Zimmermann wrote:
> Hi
> 
> Am 10.03.21 um 03:50 schrieb nerdopolis:
> > On Friday, September 2, 2016 4:22:38 AM EST David Herrmann wrote:
> >> Hey
> >>
> >> On request of Noralf, I picked up the patches and prepared v5. Works fine with
> >> Xorg, if configured according to:
> >>      https://lists.freedesktop.org/archives/dri-devel/2014-January/052777.html
> >> If anyone knows how to make Xorg pick it up dynamically without such a static
> >> configuration, please let me know.
> >>
> >>
> >>
> > Hi
> > 
> > I am kind of curious as I do have interest in seeing this merged as well.
> 
> Please take a look at [1]. It's not the same driver, but something to 
> the same effect. I know it's been almost a year, but I do work on this 
> and intend to come back with a new version during 2021.
> 
> I currently work on fastboot support for the new driver. But it's a 
> complicated matter and takes time. If there's interest, we could talk 
> about merging what's already there.
> 
> Best regards
> Thomas
> 
> [1] 
> https://lore.kernel.org/dri-devel/20200625120011.16168-1-tzimmermann@suse.de/
> 
> > 
> > There is an email in this thread from 2018, but when I tried to import an mbox
> > file from the whole month for August 2018, for some reason, kmail doesn't see
> > the sender and mailing list recipient in that one, so I will reply to this one,
> > because I was able to import this into my mail client.
> > https://www.spinics.net/lists/dri-devel/msg185519.html
> > 
> > I was able to get this to build against Linux 4.8, but not against a newer
> > version, some headers seem to have been split, and some things are off by 8
> > and other things. I could NOT find a git repo, but I was able to find the
> > newest patches I could find, and import those with git am against 4.8 with
> > some tweaks. If that is needed, I can link it, but only if you want.
> > 
> > However in QEMU I wasn't able to figure out how to make it create a
> > /dev/dri/card0 device, even after blacklisting the other modules for qxl,
> > cirrus, etc, and then modprobe-ing simpledrm
> > 
> > In my view something like this is would be useful. There still could be
> > hardware devices that don't have modesetting support (like vmvga in
> > qemu/virt-manager as an example). And most wayland servers need a
> > /dev/dri/card0 device as well as a potential user-mode TTY replacement would
> > also need /dev/dri/card0
> > 
> > I will admit I unfortunately failed to get it to build against master. I
> > couldn't figure out some of the changes, where some new structs were off by
> > a factor of 8.
> > 
> > 
> > Thanks
> > 
> > 
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> 
> 
Hi

I tried simplekms against v5.9, and it built, and it runs, and is pretty neat.

I tried using the qxl, cirrus, and vmware card in QEMU. Weston starts on all
of them. And I did ensure that the simplekms driver was being used

That is, it works after adding GRUB_GFXPAYLOAD_LINUX=keep , to avoid having to
set a VGA option. (although not sure the equivalent in syslinux yet)
 

Thanks.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
