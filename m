Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 551683DB839
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 14:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFBD6E2E1;
	Fri, 30 Jul 2021 12:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855C16E2E1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 12:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627646799;
 bh=FOQ3kf7nC91N2pAcyJy+ukr7C27FR3nQ3DekDqj8uEI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SlQlS2e/5cr5IQ2fa8QR7A4b+mf+myEnxGLmMZJMRsxc7C6QbaN6sxtPbeJ9DKjcQ
 KTKVbDH/GfqMcD9V/ooYsKa4KA0Vbhdx9noBM6+LD71cRA+6UXJPVBriHDvNN0DmKI
 yyEtUDQVHUJ5U48CFjKqPjhfuocD8p842IRX/jRs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.152.200] ([217.61.152.200]) by web-mail.gmx.net
 (3c-app-gmx-bs05.server.lan [172.19.170.54]) (via HTTP); Fri, 30 Jul 2021
 14:06:39 +0200
MIME-Version: 1.0
Message-ID: <trinity-166e2707-ca11-4d84-803f-43732de72e2b-1627646799181@3c-app-gmx-bs05>
From: Frank Wunderlich <frank-w@public-files.de>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Aw: [PATCH v7 00/12] Clean up "mediatek,larb"
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jul 2021 14:06:39 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Ju8UvQ9aQQ211RZizAddcu/LK0Fbm40eWbtOgPOujam+ZiApQCh89ygqJKUfghzFx3Em+
 2gYhue+9Tw2MD6gxpnG7k1n49GwJ96zbYr1t0dKh0XNlowbze19Bdjyh25AQrFqjwwEBD5zmvd83
 mhgHUGlB8Ek/ujixS17y/tmLUcS6lj6J3JAEdYwCmEJOBtpSoiNFM3NNFkq6C1Kia0XV7mTPl8vn
 vIhfuilUuastgrBdB7uKylodyw+GkvQKNLmACZ0chLIvF4sg96dcRXaudTEuldb+NRZCXQ2lp6Fe
 X4=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A1JU1CJi+pQ=:iWEaNtvfYekBmQdj4p6NXW
 UCTDP5kHinGH0vNnqhIZRPdE39sbNxHrVO/p9Q24RiiXHAyeUJq8L+93SGGOg4tPCbdTxfiKV
 QNPWJF70uYhxy7mgbZlvInK5n6x9M1/K1gNBf3lccsTjt0t4n7WcI4NKCruv73h/djU0LVXne
 u+0SY70AaL3ley93WPeezkfjb8VSz88R2HcvX9McS6Od/X98F06af4B/GbOm1djPXU1SXfpKo
 KUIyySiyy6TRpyKROR56bXkdpixhsjixdqQCnx1NOPihzse8xL39ftyMRCoEojHVSiXTDrgV0
 wYLpEHQ3csdA1t3aEvcUXJrFC/iilayKyvXe9HrWP5LjD5hZlvX++dSXMC2bS+sjJ+eOU4CkG
 q5M0m7y1SLgWSah28VRg6keBpjwkiusGHwSeFrJBy9o+wBg7RZq2fwYkcq/79Mq9yixMZOoR6
 nhiymGdyIERrtxqU6M7A2syxtcjcXbLCmxadopF91xMgIPyRJLQmESawqxIuX/JKCRU8WnICX
 yaVOTYoq5ZT+yOg7fTBack7iK2KxkkNeuDn9dy/MhyU31tAOibr7pfGIyuHmU+MKjqOSn8sD2
 yJIhbYA42sZeUNd4oYzJMShnDHIkHHbMBy5uAgWrxznbOECqrG5/wUBFgzPZW93EAvMmi7d6r
 lk0vBXlmisYQWoMoO9WVZCx1Jf118gMwBc5emj7E35X/YicRI/KoVpTwSfgLVwFIUf/8E1yYK
 NxOYhTRYoQfJZSsRL/ySFrn1KZ2Wx9AntKI1JV3pQblcuhCCvu9yfmLU+oxe/6k6j32YmVzRy
 sVTI6932Tsaqfe0g/gNwzm3RroETnuenND43TwPhPdSsqPyflo=
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
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>,
 yi.kuo@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, yong.wu@mediatek.com,
 anan.sun@mediatek.com, acourbot@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Full Series tested on BPI-R2/MT7623

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank
