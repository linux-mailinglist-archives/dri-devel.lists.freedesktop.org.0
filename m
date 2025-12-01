Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D44C97D18
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 15:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8E610E287;
	Mon,  1 Dec 2025 14:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="XauI5QRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com
 [162.62.57.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CE210E287
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 14:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1764598775;
 bh=NDRj6dw+nV9Wzv1PG5m4CN+xIzH0VK/FEarvy6FM5GI=;
 h=From:To:Cc:Subject:Date;
 b=XauI5QRnj1tKSiugd1B9I5HuA2IIrwn1/69l6LSlAUb8WNFRqw7Q9yT9gA0kx3iaz
 jXq0rSFUf9ZR4q3WeXX/+bK/+0yMnNrMBJkpyiaNUi+xVFnp2AQeFF/X4QM+qYmxUF
 hFpRsKGGYE+l8JineVbmxC3D3Mrwt7rXuDmE4LRw=
Received: from localhost.localdomain ([171.223.167.52])
 by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
 id 4E009A2B; Mon, 01 Dec 2025 22:19:32 +0800
X-QQ-mid: xmsmtpt1764598772tkxq52403
Message-ID: <tencent_D449AE627267BDD68BA41AD80EB3DFB5D407@qq.com>
X-QQ-XMAILINFO: OOO9dHjlsLs7i235ZE2+oOOr+ei3ym18iyNJDvzURHMivU20CRcxf2RKJJjEDj
 Vyx9pl9LxJGO7y0L6/YpPu72fbxXejz7izGOd2HxeEujeNMsF3eltuu7dplURQjX8W28+mSZZtoB
 7m0ka+XNiOepvKimzKRR+2pzF0U+4YgTPXuj9HyKSXwGL2q85ftI9f9+TuXDHOLNn62ibjkL9zVU
 9G6X3JwKi7qNl9bhFBskTsP7YR2iKJLWG0SIxkYYc37+cFS2aQr0ras00/TZQua3m/b5UVggFQ6S
 U2OdKJZPQz5klH4KNEsqlQtnOaF/XF59Qb1PaXbRy7HStYUHPd70pwcLQKfPfuYO+Tgmyo88MZwB
 nApeUvOQRQvGjalrkxpNA8ZTiHDRQ1bBpuT8jq/yr1AJFjNbmG+YCX+4t4AEtewx3xfP0B4iNIWD
 SzOOBt8/+2eVNEO195WIDyETaF+s2EaULIcbg90+qYlt8eIykam2CYpaXNnqWbpLE84CVAi3e2CC
 6gNjpYqf4qilCELaiAFpJZJldD9SQWjDhrWPIpjE9hdQx5amEV/1gp+7YFJojaiFPFDJB4rwrxNS
 kjqvfE2lkENiZj2OyyK0raGuI1JLaDuBUbKAIDKDn448A+g9Yzp/K+iIHlynU7yXOAmkwtYXuIJL
 FK2lMXQPuB6itiz6grbSUaCx8mD/3ooWOdBkE2QicXwSS199SC4WYuMx+cWtqLwTcmZLYa8W9X9t
 ZIHOdoIuNv35GNYzieqOS9D+7eDhEM9xdrW7tSoFSWBLg+hjlN5w8TlBOvbF7KW5jnOeBSQy22kp
 +lkShiHRWDC+6bRpns+C5UTdCS6JqX4kvlugE8akgf+b0tE4Fj6uisj5E6mUHBtA281W3buAQN8S
 0kpKmi7yu6GJ3e5cl48j9hps9EGl+MXfIWy7AFaKRLf77mhh1HnGuVPQLOdd4opX5BVNddBAAVKH
 wWpUaL2ohTTOEzf08R/FCOHgcMICvjhanpZtlpoYag8bJVvgQUYKlr86EstErAXeMBfboGJAmlu7
 GvsFsXUU+AgeS70pho1Te1paPB1Ow4jWiHtM13gN+NhrCt5wv6BXDZBLRW+RusG+Fr+xZIGz0Twu
 WWWPKLKmzcVDIk8fY=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Renjun Wang <renjunw0@foxmail.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH RESEND 0/2] Add HannStar HSD156JUW2 panel support
Date: Mon,  1 Dec 2025 22:19:17 +0800
X-OQ-MSGID: <20251201141917.31108-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The HannStar HSD156JUW2 panel is a 15.6" FHD (1920x1080) LCD-TFT LVDS
panel. Add a binding and a panel entry under panel-simple.c.

Renjun Wang (2):
  dt-bindings: display: simple: Add HannStar HSD156JUW2
  drm/panel: simple: Add HannStar HSD156JUW2

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.39.5

