Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F14A4CC244
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766C210E28C;
	Thu,  3 Mar 2022 16:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A064D10E28C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646323621;
 bh=D9W07+OUMPXR+k9aCYXbl5HFYe+LbU3RKRHJ4qCmUZs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=AUl5B72MxoLUWFdMwnZ7l+X12NdvFwz2rYRZXJRrsnRTibYOr37GMhec0EKGe0hPV
 F0Vryvk81TDdnfaJjwOmOpjLg+jXZEbGHoruSgORGquaRF70SSdwk+f4Bgfbvn9l9G
 4VBjeF6JMyf9kUee8e3yYCZwHZz8Zh2yNiHmWVNg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.154.125] ([217.61.154.125]) by web-mail.gmx.net
 (3c-app-gmx-bs69.server.lan [172.19.170.214]) (via HTTP); Thu, 3 Mar 2022
 17:07:01 +0100
MIME-Version: 1.0
Message-ID: <trinity-e24fc9d8-680d-43e4-bc2a-9a3cc7d43138-1646323621559@3c-app-gmx-bs69>
From: Frank Wunderlich <frank-w@public-files.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Aw: [PATCH v7 22/24] drm: rockchip: Add VOP2 driver
Content-Type: text/plain; charset=UTF-8
Date: Thu, 3 Mar 2022 17:07:01 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220225075150.2729401-23-s.hauer@pengutronix.de>
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-23-s.hauer@pengutronix.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:U5wBZdbza9VwWSnL2Fb/j5WKWmiu06uBo7QibEBguykIkwt7nMKuSqoQTfEekVKnR75KK
 qAtXS1kKXTbWjJXW/t/jjRrhq3gv/CeiVeIuYSvdcVoc7OzZk7GSUcIOvQZD5M1UT2xfVcrI0NPi
 9bCLXlld6yvNiefpjlqGrZnRa6GpXuVFXfdMgQqmAWUTvwy2EsZQb6eKSG/ZurDmP13S12aZGdwc
 L7S4d94Fm2Jdpz3VYvZQDp7Kufu/NS42cIOeYFlFfwN0paqnc0buptBlVcZlKPywFDP9g6LHgUiX
 K0=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qf+KSkywVP0=:JpcIqLcBRZBQNiLw8+A4la
 tiqpbqm6gA5oF3Y0T++yP1jdH443sT//j7UKXJ/CF4m4jXwx61MDkQex5e0Z5BY2G1cIJWMJW
 Ww+ofziD4r3yUpD+uhNJJk3gTW4eswSpmLvY0cwvGe61LLf1lq0jCUJIAw9w/4wdQf0FToS/0
 CnurClPnc3A8qkz5t6TRdIiocPH5rVk9GOum6m7MtvekiRjtJ+6cZZOfQjgZPUpM2kIwaiB5B
 XzAny3uYO04ndJ6NnxwMQf66BvEaBc6g5CUxTXJCRlQJ0FXe7QWlmbxcCPZdjpCwoqy6UU9J+
 ipRjFAD+rqTiiSbIpdZOJT8efLdElV4PlEVKY9Ug1/gfNree7QrfDQQstk3UfJMHAuDqp0wOQ
 AVzZjG4+ir5/PmCsKirIwKjJVzELsK06t4ctIHrsV7cYUBuDQI4hOI+7Ktj+wjLrCBDewJycw
 NatU87zOZUyX7yMJjYXcjVrc4vyTVnHCC3y3p4U75FOgbqES2fbtUEIYZHRKp9DfKyJKZ+lEc
 xpdSh81+mThatPwn9qW9j4boQ8UPaM2+/H62weOFR8vAiL4Sv4K6dsNwG3bJjBtUmfSIx9Egv
 +bYlQrmYhwRNSXoiuRr0zA950wToiif/re86r8e7ecExmqHYte4MUhVky8AsZ5bGz8iDYmVtx
 6N+lZ/I+HLK2xSUdS8XQ7mpJDHZpzSswtONauWMKO+AOejB88T+pOZXyqZSp/9VhijBPTxQEt
 uWKbXg0GEtzWShS3loX/eVmHHvLOgWd7X56MhqeCsw8B/ye9V63ZvOMPQq2n3OQ8H+2Wzn9xN
 yYP1KlJ
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

Tested this Series on my rk3568 Bananapi R2 Pro v00

Tested-by: Frank Wunderlich <frank-w@public-files.de>

regards Frank
