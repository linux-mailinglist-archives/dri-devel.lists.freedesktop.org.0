Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C564AF8C1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E4B10E368;
	Wed,  9 Feb 2022 17:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 324 seconds by postgrey-1.36 at gabe;
 Wed, 09 Feb 2022 17:49:57 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D1810E368
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644428995;
 bh=bZbERGS5dPadQqxAada0Qnetp5usNMkkZudsQMtwL34=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MFbIzzf8Ko+SNDhKlUxwO7HsTFORTEuyFDmwFIevTI0IdFXOEtRIk9tl0Bj2D6j5m
 Qudq3lQQCPxqUyQDiGuQsdSl3NvA6jKFd6zzi05PjSkOPAwsvREhHV7BBDpiTqt7fC
 R+YRlCPc3GXXPANoIRbyMe4w4CPAsAdbvZ+wCkNw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.77.2] ([80.245.77.2]) by web-mail.gmx.net
 (3c-app-gmx-bs62.server.lan [172.19.170.146]) (via HTTP); Wed, 9 Feb 2022
 18:44:13 +0100
MIME-Version: 1.0
Message-ID: <trinity-0fd51fc6-00ab-402e-871a-71d3356623cb-1644428653437@3c-app-gmx-bs62>
From: Frank Wunderlich <frank-w@public-files.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Aw: [PATCH v5 00/23] drm/rockchip: RK356x VOP2 support
Content-Type: text/plain; charset=UTF-8
Date: Wed, 9 Feb 2022 18:44:13 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220209095350.2104049-1-s.hauer@pengutronix.de>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Kt6uAoUQy9KUxXYBKRna2pPwbagv75n8tB/ygcLmTad0OxyWH9GjeOrVm0AWTeIbrbqIq
 Tm1s3jWc+KpbC6iwreK7KtjQNxoO4BOa0lbhoSv8XGtsEHshbXteWUQGpRXothSDjShyy1mXnZBT
 hT1852znFykmSoCSO1QIUeC0etGbz2nof3MmQSE8+d+mbiy3hkxqwVpE8lxhW/CeeQ9jM94aYIZ/
 oB7m9mFSP+Xnau4l7gLNvr5ybM0twlYFQNn71AWtH7j6JytJyppXurHMP5yW0oI9M3x0OYm/V0av
 b8=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BdM/7l5539M=:ZFDvdxmyI42PXthARSt3qb
 q2Xv/r82G6JykDdKBjQl4UJs+nQbYJMsOvQHB9vrJ1xdHb+Y2Fq0US8OsVuXe8CIefOpuUnmw
 HAARrI15iARtUvrGWVDPw8ue8oNmI+xjtWsyw6VjtsNueE8OC4kSnoVs9pPbjUUox4li8AiXP
 GKQ5Z1TfPofieJSruX+NKi5WKYxOpFxVKCx/KjDSLyzW3QhVeMInfhVTng/Dg6avhUV+ZNHmH
 GmfN2iPq+Wt20MxxfQsbDzrG7e2bZxOIYUsPi/Qh43Z1WSjss34iV1403EvUTRgPQQVmiwDzN
 ECVxLjg/J+CNMOBP2xjAUZAIUjFq96X7FXz+M32wo7x/p7ucFtXgcHCvBorSGShQRPmQ8n0r1
 u7fZdz0ywayakYuBrxmUzCDMzKGA2XPRoygzk3F2xlY7GWNGZFSWu63pRr6fF2TRlxWA/kqQk
 Oy/8AMkdiJFDYC80nbHVhfvHWB4yJ8a2SLTzPflTV/tmbumdpg/s190rgBj66o3LBnejTbMzB
 PNHfCvxNNesdbTkJPIZS54ov3qyQBl4YNvQlTONhv7BJ8hLSwtgeWg1AIBJAx4omrFvoecdU3
 r1tVx/BUbeVEWlxx6AXorti7wra9gp12JmyV+r45jVF46MJ7PCB6gfbbFJoW9o63NowDFBBQ7
 HEwMdM3qwb0gnD8Qx//0OFsgMCdgyntKgcQILxzz1doHpw8cwe4JbXHYajOtP8Z/H1LHiSC20
 eSvBp2mKaHVVgHW/LgFwj0M0KPqI4wf5SFFwZyrmm/f4MwW1pqsTPmu3BGTvKdta3M6O1xO9r
 laloIRU
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha

tested full v5 Series + 3 clk-Patches from v4 on 5.17-rc2 on my rk3568 based Bananapi R2 Pro

1280x720-32@60Hz
1920x1080-32@60Hz
3840x2160-32@60Hz

with fb console

Tested-by: Frank Wunderlich <frank-w@public-files.de>

regards Frank
