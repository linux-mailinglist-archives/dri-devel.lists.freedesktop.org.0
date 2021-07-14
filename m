Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717A13C83CD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 13:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62316E216;
	Wed, 14 Jul 2021 11:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852D06E216
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 11:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626261811;
 bh=bRr42QOU3WxiGukaiKaQo9qQhX/uefmYG0L+VFBR0cY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MH7MDNZQYjkv/8bbwBkSy/dTHjnZEPLNjx58GhW9NiKHHaEhkZIBMgl+1jheOfYNx
 sjSLqyorceUCLaV+PPaVTyVLnTnuLOwvgbv9UIdtSSouT/ugGyPoD0cnAxEyO/tBby
 KIzRPQDofNHx0bvw8YjucC6+kgI+v0FtYHZpN/kY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.152.136] ([217.61.152.136]) by web-mail.gmx.net
 (3c-app-gmx-bs01.server.lan [172.19.170.50]) (via HTTP); Wed, 14 Jul 2021
 13:23:31 +0200
MIME-Version: 1.0
Message-ID: <trinity-345a7606-49c0-417a-b40a-5ff156332354-1626261811356@3c-app-gmx-bs01>
From: Frank Wunderlich <frank-w@public-files.de>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Aw: Re:  [PATCH v6 00/11] Clean up "mediatek,larb"
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jul 2021 13:23:31 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <1626261496.14352.16.camel@mhfsdcap03>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01>
 <1626261496.14352.16.camel@mhfsdcap03>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:C0a90b1taoG2cfcfP1pde1q2MNu5r1lIgwNvN5NXJS81Z6XyWAFZhMImid05bZKAZUc1Z
 fSbF+ihXoQ925TRhUh/2PryeQrkBTUM6JIUaLAvZhNfmBG35Ckp7hDn2PsC6SOkInfw03TSGwAnq
 QVkUFPFGffmEj3883aNhVDGijVAV0Dj7a1YKE2SJcV1ysSSD1b5nQ6xxg4LGX+ho7QSyvTaUSA5/
 VeO3HfkSU+3+B2YcXrhadx1ynHb86Y/11K6GLOIm5WEjhoUM5E0xij5biHeSELX8yOKYJratdjjD
 DA=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DZIjrERjTx0=:zO1GGiDuxmWNpY4kEGNX+H
 Qsmf9C4I97mAD+wP1pU8z1eVgOesso/R5WsIidAM5D5eoNM9Jq9vra+7B0hV+BiXqHlm/N2U8
 AU3rTTheff7I21iXOz3ILBB3bGN35C3B0KptIb4TN1MAOKfCNobq+RN/zUswYDl0kZ4eUR9c0
 tQGm/bjLfNmBpNJHquyGdQvZYZNq2DH8QApwTchWdAEnpNcF+KOpKXpYjySgkTnaBYwVj27pW
 nDbtsU5XednjYl88TCAk3MdLCU/njHPVEi8eLjrm12TvLdsgmyoYJgQ3BqBfit76+TcdTzEaj
 8oSosUKEC17F7PKZVCu360ZGcAfd7x+mFySyONxorqV3I0Ge29/VKMmQCUx6U4tGyE/tedka0
 RX/CBC10tyIElacx5U7+9OoA+hRzKwTS9LRYmixBzk4cXG/5G4+j5ljnyn57NrDQp9fuMGkwH
 vk4taR0w6XvN8s45fZ+qBA/Vzfq/o2D5Jnk1CrTsYwZRGO7EH3DubSJEKxu8Q/SfXw+yPfXD2
 QcYHX3vFQ95LjF+yBhj7MDkk83UPCbZujqhgGuzFULXV9/KpR40RKpwh37QTl0x+I283hMmgo
 yZjPMs8hjkNCjgYaF3X/Y6tG+n2TFGBWh36cu9O5iTbFSEXYKv0BUaEKLtwxiEUfLEYqFZeP1
 RGJafeHCi3VQkh24Z0kvP/wCasLOFs3jsuq2je+vhXaEdZJ9NeCB9D3wVis0CVRxceZ/6F0z+
 aWWCGUHZw8ekZPLQRrauLJKsPcMo3Awj4mlBI3ggYs1VbVrpwEBT98jdeIMoiUs72pausS9ap
 BJ1DOYDL0HTAvkX8qv8ayhDVShLTwcji0NvCJczKYjZbdxnY7c=
Content-Transfer-Encoding: quoted-printable
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
Cc: Xia Jiang <xia.jiang@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Tiffany Lin <tiffany.lin@mediatek.com>, yi.kuo@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 acourbot@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Gesendet: Mittwoch, 14. Juli 2021 um 13:18 Uhr
> Von: "Yong Wu" <yong.wu@mediatek.com>
> Hi Frank,
>
> Thanks for your report. mt7623 use mtk_iommu_v1.c.
>
> I will try to reproduce this locally.

Hi,

as far as i have debugged it dev->iommu_group is NULL, so it crashes on fi=
rst access (dev_info)

drivers/iommu/iommu.c:

 923 void iommu_group_remove_device(struct device *dev)
 924 {
 925 printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
 926     struct iommu_group *group =3D dev->iommu_group;
 927     struct group_device *tmp_device, *device =3D NULL;
 928
 929 printk(KERN_ALERT "DEBUG: Passed %s %d 0x%08x\n",__FUNCTION__,__LINE_=
_,(unsigned int)group);
 930     dev_info(dev, "Removing from iommu group %d\n", group->id);


regards Frank
