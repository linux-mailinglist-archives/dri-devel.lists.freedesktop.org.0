Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DC4255534
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D987B6E32A;
	Fri, 28 Aug 2020 07:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E516E184
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598531519;
 bh=92IISck0Hh+QcjDct9i6ju3E7DbMlpwjZF7zW6G46Sc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=KGLhb4lQ48yAcFw8dyYZZ4x3abl5+wHNWFde6rh76yn9TPOcDV2dbkia1bYvTngcK
 7dd3CUH7vIzWvLAdPDqQQvSbIGjz+6C3cK0LESwWWnNOYWDreQs6J7TFzngFQN5veX
 SkpUre3ZxsKqNnQ1AiFgZ92OsNfUIQ3UCQ6X9UmI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.146.7] ([217.61.146.7]) by web-mail.gmx.net
 (3c-app-gmx-bap26.server.lan [172.19.172.96]) (via HTTP); Thu, 27 Aug 2020
 14:31:59 +0200
MIME-Version: 1.0
Message-ID: <trinity-d6be65d8-9086-42bc-b993-238b731cdf60-1598531519064@3c-app-gmx-bap26>
From: Frank Wunderlich <frank-w@public-files.de>
To: Robin Murphy <robin.murphy@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: Aw: [PATCH 00/18] Convert arch/arm to use iommu-dma
Date: Thu, 27 Aug 2020 14:31:59 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <cover.1597931875.git.robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:s+a4a7dJl6sfE8qr3afXfh3rFMEB0yoGDcQKLuHS4QzYWvUvvC45GFgO8lF9qXw9R52Wk
 DtakmHS+HD6cGoa1Zil3uW/U+yFS9kxTAT+z6AMI2xcYorqC2HXtzYuOCqJCgtLpQ+XE0cJjSFZx
 jxGxAyxNxltq5fYSEegUZWLgP9jut/anC9MQ4QvGWdC7Fx2DqQGzPbELk6qKjHDVZ/m5suQOG5WX
 iSa5xQ1TVnlfnQDl3zDcjq+ZYocRCeCF/YEHBWcp/6xTs4r2KnkcTO/1Z2Mnufc+NBr+EgqeLN3I
 Vw=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FxwUSbP1mjI=:ttSQgY8yWxDnU00gqYZD9w
 Z/qDxX2NghmiDYfDQ5KlK2CvVPv511mt50baxcV9OWViPRqrVksHRa4Q70leW/35miqZsjM4V
 IO6h92zZspcakoDMbQBjPkuMoyi+5LQ/QFBqRCLiWwjAvFd059HIdZ3wIqx4Ym54NMmsqjccz
 GSjwDTLDSlPZZ31m1rM3TpUiUEHmvR2WgipwWqz1AAq7WXhaIEH9QsZ2JnZLEEbOhxXoPsI/Z
 TRcWMQZ1A9GV15KtQDIO2i/Dq3pFNOn6hQhy7q9DtWpXhyRvveQF9KRDJYqc0qTjBpvzvMKr7
 cwEg2rxqBaJWgiTbO8eTHZQs26rh5cUZDyt0F7+vYHaCPFuefMRRBB057XIJ51LSUel/IEcBx
 jKL0kBgE2bzG14g6AuFmvgYvmWEVN4O/y2NQMUrsTNo+oCPAkE4kNJZRWZcUmma+gyoOQcDkF
 PF2HL5TN/+tF8l4QCRCJegf1NBi1AFsXmHuAdCOMo4mEr8RGOKC4Z9Q1zFeTTDPSLLcCl+zEE
 Ii91uM5UaMUTvml0hGGBCxEsqbJsfJ8v3jTJ9teKmcwELpC6kt7ciWfOUlIPV4vD2eQdFtfwk
 1oipkVsSHlw6p58a4q/xNJukuLHryikdXoZi+l8M+576WxE3K6Ngz4VHUmx0HOrdPsQ3RuO6H
 UQHfIQ/HTJp3cXIfVqtRO2Xhoda3GGGLYRUb8PYIOqNcBnvhX6Jze8vfjXKlOuNpMwLk=
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 linux-samsung-soc@vger.kernel.org, joro@8bytes.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, iommu@lists.linux-foundation.org, jonathanh@nvidia.com,
 agross@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 yong.wu@mediatek.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org,
 t-kristo@ti.com, kyungmin.park@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested full series on bananapi r2 (mt7623/mt2701, 5.9-rc1 + hdmi-patches), works so far fbcon+x without issues

Tested-by: Frank Wunderlich <frank-w@public-files.de>

regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
