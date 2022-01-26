Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B22E549D06B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 18:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990B510E5F2;
	Wed, 26 Jan 2022 17:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E44F10E5BC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643217034;
 bh=kUqNJVfSqN8rx5gjFfwJ/0lwW2NKaOjKFQh3mYmuad0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=iSY12iRc7lPsUnuh9tapUq7GvVpRQ4GITj+6rEj8KPPEjQK0790cKMU52Xq/HzQu+
 AWFgv4GgRX9jXKE8CZQzbmspwVgv7hpwP0ujAjuc35l4YXcrT+P84oG4J2CrZ9UTf0
 0SJ8eLPTPqjTvjBQ8XokeXXQeZ/lgdnStvH7wihw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.153.46] ([217.61.153.46]) by web-mail.gmx.net
 (3c-app-gmx-bap59.server.lan [172.19.172.129]) (via HTTP); Wed, 26 Jan 2022
 18:10:33 +0100
MIME-Version: 1.0
Message-ID: <trinity-29a2d337-830f-4ff2-861d-bbe695726bbf-1643217033760@3c-app-gmx-bap59>
From: Frank Wunderlich <frank-w@public-files.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Aw: [PATCH 27/27] drm: rockchip: Add VOP2 driver
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Jan 2022 18:10:33 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220126145549.617165-28-s.hauer@pengutronix.de>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-28-s.hauer@pengutronix.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ymDBYVjKtSQdPfmVcjBk0159dDQ4Dupgs3VpHv0SQb4JX5jWMDtAhkONitEkb+tvDkUwE
 ATKd2QG3EPsSyJgf+Uq6ZLU/XV06rJ0v1fpfZwrOXlrZFgVojhg0PuIM/jBv9vRSf+oIxHnVpsym
 3N3dSK6El+MIdPp4a5D7MpzNWX16ocB2YpMSKth1e53UDwJAGousLjFtu4GNo/EEorf02UiWGaNf
 aqYoKiam5NXlrk8CJ9aJBQxeWdxSG7qTYsGaQl/kpeGUH90qS6Jkx6gPDKfhY0mStbMGnZoh3don
 ns=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LXbgsP9OhrM=:vUyBSYaoC+r4+1AkJqjZXQ
 AH2W08ld/yXoEcf943VwyRs6jzjnVz6vU2yIMf1ynN0ip0DfuMtLFnAQ3cnKATp6qGrntYx8d
 dtKxDEohJcMsmoTjfWjQ1iPkpYKW0hYvdzyCGjkMybaAd2NU4B5iWmAqPARUHhEbvdC4bHBe8
 6KP81XLAPZdFG3LZe4TJ05v3c6FDgMaID+rxZto6WY6bVXmj1p5x7wOsC5l+OMn82X9jihpQo
 dBkLP/fY4HBeMb4ah0IHzKtT3OAXo9IAXIVusMOtsqBxkiT71B9rE4sKuXimy+xMhBbCDEeq5
 0D6z5n1HL+i6Qh4oDQ8cgOAoRrxeip6Rl4ESrR9eV8RIV0aalpXOQ6eCmBWgpFsZYJTsqHuDd
 228UIg1XxU7z9A/hqxHH8x7YL0GDz3RqVofaBPd1n97qA9c+cUeLX5DuJa5nUA+vANA8ZP1t/
 wk0H62wNW8QUTo7LnPJYtRP8ahykXgYsk2Lq32Z9viTeyOqVphfuXjKNTwCPPOEdp8tz9bJ/m
 qYepkZQMBv+3v7TG9Mm19/eNSUDu2Mnf3E8TZ+zmi3gKIW+a/aLU62W0lYO0TJlabctyhXZ9K
 vIIOH+FsZdMl3JTWWrIqvB/lXlbVI6zkSMt3L/xlvP2lFbkX7aY/DQ2Mofc9+q4zB/jZljrGX
 HLKSlaS5yLO4e79jpjDfo/+o+7PnD/KeuFSbBGXuh0/O6yrV3FlX1MPIQ7ErZYYMXd+Sq3WAk
 nEXCCChM14DAbICUX32jrvJE74kAvasEHX7K/jc9WfqUPTKdOY6T0RrVgFtorIsotM0ELp0x8
 Iw5SM4njxe+BL42vZbv1DcQzS0dKuk9cmkba417pV2gTxOhTg/aL3Bd8CpxhJ51ZsSUI4KD
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

tested full series on Bananapi r2 Pro V0 prototype (rk3568)

4K@60Hz
1080p@60Hz

both look good

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank
