Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 371A023C6AE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489636E500;
	Wed,  5 Aug 2020 07:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8B96E21F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596552262;
 bh=M74RPzCRuh0utMrP2KavnbtPD979HoMyUkUEHnxdnJs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dYrylRTKVRIaRg43Q7R8dFGXyUIuT65S2ps9pSJ4yruv+Jj3pkeAH4uh7lQ3AiF5J
 RZY5f5j8oZLknIonBki5iU8pX8szlaQZHqJrh0eoZf430MnNzgt2PevIm7M8B2Z/rk
 kucm7ikTNfyF7pyzfBBdHb7KJrw9fpXiacUOMQXw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.119] ([217.61.144.119]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Tue, 4 Aug 2020
 16:44:22 +0200
MIME-Version: 1.0
Message-ID: <trinity-5e5aa82a-c026-4138-9f33-d3776710eb47-1596552262328@3c-app-gmx-bap28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: [PATCH v3 1/5] drm: mediatek: add ddp routing for mt7623
Date: Tue, 4 Aug 2020 16:44:22 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_94Kt3Z4FhB+1Chca-tanzY1Xwun8D2ZQ09Y7p7+Jw40Q@mail.gmail.com>
References: <20200804105849.70876-1-linux@fw-web.de>
 <20200804105849.70876-2-linux@fw-web.de>
 <CAAOTY_94Kt3Z4FhB+1Chca-tanzY1Xwun8D2ZQ09Y7p7+Jw40Q@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:K4vr5xLllernAPYxqzkou0b7G3SwErhkjcivj32wkp1hhhjwRwbRXU4j/Bnwcf5k5o44V
 fsU3r3SIxaDuuJpR4PyfEoLEzHoXnaAyzRA8Tu+cILYk7+t+UiHnn0KvLmJdN6igayqfcQE6XJTg
 JwRCXhLqPRdkwKLIo/RcogO0U3xXRKiMhCJZ7afFIIgokPJ9TUrZZJyZBPiFjdk6ZCcnHunNUSip
 kLsOMsNzIukx5LMmkNfHryQwKkcp9Ed/Pe4ioIs36Vjxj2zSdUfHqI3Qbdnni1PJrvnD2OLCMI3r
 KE=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:49jcVtSXYUo=:DnAfsV9jgGCpqHD/1MAphF
 hYDUK8odWLBafkI6/tiA/6/C/AOvtCBjZPxJ8SwaQDLBoUjTDioKsGr8dykcCu1vfJh5uPoz1
 JQxyOT9C+JlN4cdP4EyjbG+Mk9CSDBNNJZe0wFI66xx/TotpXuYXgjdoZL/gCb+7vOOZhsOs3
 C0TsuGjF6oz6UVbpWQ0b6ht4H5cc+redjzkrzA/IQF+ZAE991FUb1NWvu1Dqdg4gNUNK4TJxg
 l1oJ7KXNSWzg/syEbOiF18opnTiuIdbSZM5Mj5TwOTw++8V6Rp6swHdRtBnBVuFbMzUnEmI/G
 9aZrLD0oeJsOt/GDancoHAJkzptPKlAUsSjCRdgrZBGbNW/GZB8zNp1P9Q6+SKbjEiujlQpIK
 8VqiJSUXmuVcKjDa381e27es8qbxEh4iTDKT58m5Y0zRZtk6+6eiuSeZJLcpMQOaOv0esbK2p
 MJqvwYhbwrB464E8dJmf3xFJFmBQe0aOg50D2shEcJ57UVUmCDnD/p2z4vCZEJPtmZMnKCgNo
 UnNI3xIvdjp/vmKHUpDPzWMrqdxIBoAhsaJH1jPmr7QnCEoiES2Ku0vCyjvULGkhNb/cTd3vn
 ECawz2iJJJzz12wPpGAEz0S4Iytm1dgiYFDEtfKC7oYrNOX7fu2argrmV1tzDOLN7UcinTaHV
 oIL7Iy8c9qOb/YpbBfCo0DC0C/eTMNxYZsjLy0AOg14NRCRyi42ZIOrJi4VSrodip04Q=
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> Gesendet: Dienstag, 04. August 2020 um 16:34 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>

> > -static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
> > +static enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
>
> Why do you remove 'const'?

was removed by previous patch and not re-added (revert failed), sorry. will fix in next version, if all other is ok.

regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
