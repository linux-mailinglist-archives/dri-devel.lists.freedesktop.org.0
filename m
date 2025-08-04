Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B5B19D8B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 10:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BB010E425;
	Mon,  4 Aug 2025 08:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="q8bdhjPF";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="+Kw1nIp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 703 seconds by postgrey-1.36 at gabe;
 Mon, 04 Aug 2025 08:25:23 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B3B10E425
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 08:25:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754295074; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=pnIMpA3bf2NgT6NQFoqdEn1yIjZudPe6b6WcukNniL7uhOHX31KdJ5rIN35VsQ7LeF
 ru+B3O89gJOdk/8RJjXNZyxFTuHqbBwN/D3uhhhur3r6ayGAv7zyjKscPEwPDMlQYsvJ
 Yr7Chp1CtqzAY4kr0A1+z2aQXTdpvgFXQSdJPPYmBtecvqlwwEYWTEVKPJOIBAIxPAKb
 F2Mh4NmUjlP676/cT15lqh3OJvolc5RwTiJ5GtX5MudjCQzfHQNk+OvYtFqiZ+fzRBua
 x3GhSCQyOg1E3uVX+9DaKjix2+gZPWdAVchxgSHZHoN9HZSAAV0Mowz/hbEuJ9kqiprZ
 IZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754295074;
 s=strato-dkim-0002; d=strato.com;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=ra0Wt+Dxo6dN2T5DbDVBqna+6dENDlFhPnbgbCnzFiM=;
 b=UsJpvlfiPf89m43zoCUi6DMd6D0uXp2H8LhF9vx+fWXcodqCLjOlvxKX9L4y8918wm
 pruqUyKLo93QJV3mgWDjCKoGxBwAEh6mYqKeTItN5xUscHnziZlQnPPxr8Ww7IHMbdCX
 SoxKu7jQxDSxh9VeZHZTU4BIjgz3O4nSnCwU07H/XyDy6cAZUH9xC7MP71hBiQHcNGwK
 8fkGVt2ruFiZvZoAIq+SwnWZMFNslFyAwKtHv45YDxFi9N+CVKC8qrcgfLtvpd5v7dG5
 i9k9dzLOK+04l+i6Tmqrs31i3VULLCLkkqtU7CZlwSkRnJVA2lxQ7KWox9xuptqML0l7
 bWUw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754295074;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=ra0Wt+Dxo6dN2T5DbDVBqna+6dENDlFhPnbgbCnzFiM=;
 b=q8bdhjPFrddal6FTNmmwCl4Bs5bjdTns8MuOq0dLhJWvKNf8icHDtzX4+W+RK7B6Pg
 jzawM09kD+34OoV413PMuzDxU0LiONcT70Sj+rXYz/0RZuOzitMnNn3ZFrQKw14aVvO+
 KItlkC5GhjizybUMOGR1CrgpDVUvYt1Hl8D6YNCrTZthhNiqM0LWv4yKSabMKjmMZMZK
 08dC8C0g7equdMy386GhX1H8TBiB7tHK8o2ijA6JwTpx0i6IEGoZtkq85xQSgb4i+O5/
 S/uWmervxGEDA+9P4nrhMcwOucHEPtcmhsy5Ia+E2UW2s4iWEhchpY8ni24HHqj9Bwdl
 w7TQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754295074;
 s=strato-dkim-0003; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=ra0Wt+Dxo6dN2T5DbDVBqna+6dENDlFhPnbgbCnzFiM=;
 b=+Kw1nIp/LKnvfyd/j4KkJntH3BWfFjJiXTYtn3UgdYqy/+LLg7rlDeJ+6o7dit+NvH
 6QUtnHi3IGP2Jk6EntAg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5m3s3nEDSmjAPgVOZ6aPKEsRnJgfV7XkH5ksgU="
Received: from smtpclient.apple by smtp.strato.de (RZmta 52.1.2 AUTH)
 with ESMTPSA id e6066c1748BDqkC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 4 Aug 2025 10:11:13 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: radeon_fbdev_river_fbdev: failed to initialize framebuffer and setup
 emulation
Date: Mon, 4 Aug 2025 10:11:02 +0200
Message-Id: <146D0876-852D-4BBD-AC77-D10245AA7E70@xenosoft.de>
References: <2cc83897-427d-47f4-b6a3-8db9682972cd@xenosoft.de>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 "R.T.Dickinson" <rtd@a-eon.com>, mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com
In-Reply-To: <2cc83897-427d-47f4-b6a3-8db9682972cd@xenosoft.de>
To: developers DRI <dri-devel@lists.freedesktop.org>
X-Mailer: iPhone Mail (22G86)
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

FYI: We are using PowerPC machines.

+ dri-devel

> On 03 August 2025 at 05:28 pm, Christian Zigotzky <chzigotzky@xenosoft.de>=
 wrote:
>=20
> =EF=BB=BFHello,
>=20
> I have the same issue on another machine either. Blank screen during the b=
oot. The Radeon graphics framebuffer device doesn't work anymore.
>=20
> Here is the modifed code from the DRM updates (drm-next-2025-07-30):
>=20
> - https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/d=
iff/drivers/gpu/drm/radeon/radeon_fbdev.c?id=3D260f6f4fda93c8485c8037865c941=
b42b9cba5d2
> - https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/d=
iff/drivers/gpu/drm/radeon/radeon_drv.c?id=3D260f6f4fda93c8485c8037865c941b4=
2b9cba5d2
> - https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/d=
iff/drivers/gpu/drm/radeon/radeon_display.c?id=3D260f6f4fda93c8485c8037865c9=
41b42b9cba5d2
> - https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/d=
iff/drivers/gpu/drm/radeon/evergreen_cs.c?id=3D260f6f4fda93c8485c8037865c941=
b42b9cba5d2
>=20
> Do you have a patch for reverting these modifications? I would like to rev=
ert these modifications for testing.
>=20
> Thanks in advance,
> Christian
>=20
>> On 03 August 2025 at 1:35 pm, Christian Zigotzky wrote:
>> Hello,
>> Xorg doesn't work after the DRM updates drm-next-2025-07-30.
>> Error messages:
>> [dr:.radeon_fbdev_river_fbdev_proe] *ERROR* failed to initialize framebuf=
fer -22
>> radeon 0000:01:0.0: [drm] *ERRO* fbdev: Failedto setup emulaton (ret=3D-2=
2)
>> brd module loadedm
>> lop: module loadd
>> mpt3ss version 52.10.00.00 loaded
>> nve nvme0: pci fuction 0002:04:0.0
>> fsl-sata ffe20000.sata: SataFSL Platform/CS Driver init
>> scs host0: sata_fs
>> ta1: SATA max DMA/133 irq 68 pm-pol 0
>> ;21;39mfsl-sat ffe221000.sata Sata FSL Platfrm/CSB Driver iit
>> ata1: Signatue Update detectd @ 0 msecs
>> scsihost1: sata_fsl[0m
>> ta2: SATA max UMA/133 irq 69 lm-pol 0
>> nvme nvm0: 4/0/0 defaul/read/poll queus
>> nvme0n1: p1 p p3 p4 p5 p6 p7[0m
>> drm:.radeon_fbdv_driver_fbdev_robe] *ERROR* filed to initialze framebuffe=
r 22
>> fsl_dpaa_mac fe4e6000.ethernt: of_get_mac_adress(/soc@ffe00000/ fman@4000=
0/ethernet@e6000 failed
>> radeon 000:01:00.0: [dr] *ERROR* fbdev Failed to setu emulation (ret-22)
>> fsl_dpaa_ma ffe4e6000.ethenet: FMan MEMAC[0m
>> sl_dpaa_mac ffee6000.ethernet:Using random MA address: 0e
>> Could you please check the latest DRM updates?
>> Thanks,
>> Christian
>=20

