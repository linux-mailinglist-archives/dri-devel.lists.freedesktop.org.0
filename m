Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2394AFE0E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 21:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9CC89E3F;
	Wed,  9 Feb 2022 20:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5620F89E3F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 20:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644437618;
 bh=bZbERGS5dPadQqxAada0Qnetp5usNMkkZudsQMtwL34=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=f+OJbW3aG6qLnrt4HlkF3NjI9sJzl8ZD53rnRKfmGP+UW6oPPYfb4XDu/7CsoJDXt
 5jTNUv6MkU/HaErg7CSGTAL1Tli894NaqsqBPotM5jOJQxvlXwKop8WC561bExQ1Lv
 mZbxCKhqEE3XA41wJlG7pzkMmcXxzNU2cWbyPsec=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.77.2] ([80.245.77.2]) by web-mail.gmx.net
 (3c-app-gmx-bs62.server.lan [172.19.170.146]) (via HTTP); Wed, 9 Feb 2022
 21:13:37 +0100
MIME-Version: 1.0
Message-ID: <trinity-64a1ce60-e8ac-49d8-abe4-91b0f692c13a-1644437617960@3c-app-gmx-bs62>
From: Frank Wunderlich <frank-w@public-files.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Aw: [PATCH v5 22/23] drm: rockchip: Add VOP2 driver
Content-Type: text/plain; charset=UTF-8
Date: Wed, 9 Feb 2022 21:13:37 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220209095350.2104049-23-s.hauer@pengutronix.de>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-23-s.hauer@pengutronix.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:+cdMhHjrAZgXlErp4/YCapKkUq88eAKp7+SpVwHUzYYxiDZV0aCZIj0Iq4wyffX2za42C
 X7wbT7KqRHUBBIDtlBZOCVITl8H1GLpJ1G2z7vpLR4+xKYraBYWeedHKURcmM5CnzwEm97ZeAvyw
 BaAbGtHVp4AuKoqT/iffHIU3sSLVP+i4TitnwQWh/scEySediIZUYE/H5IGg7bOeGdDtIXFnlIBc
 Ju1mRlPHeWtbBVJ8aOTbJx2P5mzOJVf9AreRacKKpFUWykZvqBwzPkODEeJX/oBtlvWnDBU8o6k8
 3A=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WyPrspXp5mA=:1LHepIGjQQbIeW1suIQrkh
 StvHJZFf9qNeOITqhlLGNcWH/4If8vxrxxbyWgL7AfMHPGaskBW0ETYlphfmhRr9HNpCcpQbK
 yNstknDUzdGdApzx92sVHEv+Km5P+4lPc15GpEu0SsNOnWR4Vgi9ySvL0SEYlTjBjWUFz/JzY
 enXErHvS/fkuNxX187mTiLNkPj+rWgPP57sU0qtptsxl0lFl6OVvdzE9hRmBaS+tJbQTSlgBR
 J2hdYhSYOuOdQep4DAK6P6zqpdMJoXoWc3AJ/Wo+Kme9wVaBqfu57TkvEvOPTVKuz6myMBir6
 A2F8S2QlfDiQwT01/gVpuhwWseOyNmJF7hlr09HVzXavBACguPomZBlnq+2VnVtt5hDNGNRYX
 loIAJmikNaIrvlWPweOSCdFMhB+T4Pg3iYuLMv+e+VWT3/1KJl/joH0w/wuf+eTlp4flb5X/d
 ANikT9tJPngpUKw5O+9cr0lCqKp0Oay5Q5/E86T7XcQCh30lI5R88RCMTz84cZNNvRKW/UYEa
 K+/9O/5aDFQNolPBs1XrNC+IRlc8EWJzMYvvKx5CsrRDH5awEFXW6J9zlSwXcFR3LD3TZvlhI
 p289T8lAlqs11pheEmOzgj/9N4R3NmWU5sWUqhT9J1VyuGBc6JR7yHqnedf7lL03iAWnkAOaS
 HWW4Xafxp5BUxzmWvhLI4Cw3kWPLhsC/aabAXUFqc1hC0HZRpYP/WzYuDSXblchuJzvSE6EWS
 vCJeyedaWKhJFs+3D5/dTH/lz0gCQrrJhI1Z3CksnpTWtMTVDuNoAlrEp/RkwgzfAMa1bW32G
 PWU0SSt
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
