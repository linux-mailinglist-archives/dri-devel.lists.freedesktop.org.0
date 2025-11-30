Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3E9C95072
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 15:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DDF89023;
	Sun, 30 Nov 2025 14:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="RbwmrQU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 485 seconds by postgrey-1.36 at gabe;
 Sun, 30 Nov 2025 14:44:42 UTC
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com
 [162.62.57.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868E889023
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 14:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1764513877;
 bh=efa3Phy+9Z/xCM2a0z0nq9OLkO6OgO7fwzu5NcORe/w=;
 h=From:To:Cc:Subject:Date;
 b=RbwmrQU5ShhplkzkNLqDmFj0K7JFm+/RIZGDAzSUF6pORMqHCDS8IgNRVe22Wz0Cd
 0QpP/kwvMhkC6uXFHIkrjl0QdfdHVDA6d+dXvB3RtvUUJt33GawZATlOhT4F/rilSO
 lcy9ZIhfTtHf1aylqoHIFiCwgEjRdQ59C5kcEGMU=
Received: from localhost.localdomain ([171.223.167.52])
 by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
 id 74625490; Sun, 30 Nov 2025 22:29:06 +0800
X-QQ-mid: xmsmtpt1764512946t25g3kiom
Message-ID: <tencent_9EB0AA660F6B5E93CEC56ECE35AD49491308@qq.com>
X-QQ-XMAILINFO: NC4p7XQIBeahEfXR2loLDJJaZZHlGs/k8kTJB7zZgPrsAqCMPinxwfPEuxWAJc
 ZaHtUywKQJcPeXvcBTa5HsxLFRdc32210K+w/juAQ2sNy4XBhh+gYG9LaglAtKIoReqvj6GtjvB1
 WsVBoh0YcocKlgV+co6701eA0G7QU9G1U7vqiFPwbtLEtvjQFlIg4XpHUCP1rGezHGR2mrZatX8Y
 ItvgE0sOyzDWwws5yvcLa1VSKaH4YIDTnFS3RSTd2QrBErC//NRxQqtPTrI79vGz/o7CeCpzrp5A
 ODBD9b3oHbcaEL7M1cBfiuPosw8Ok+uaIE9fuAGz1YJWrfacrLbw8cSPjE1y1/l8PMWtdJBZkMpY
 ttimRbb7fz2c9Pe+bs3pxLS+9OjAet7KhWLSQTQhOoNkuM3UJxo/xlhD7QkOMe6sXguX4MMWZCvT
 gMZcmeAGqbYWWJ5ABrHIGxL3Tv0DhhEqdX2lBW3n4kjqVvNZV4LOXn6pWNxHnA2ni57jmkzGU+RH
 BKTGI6zqTw+5MWkjx+w189b8ew4eoHFaq/qcFVsM55cTJnbNILhR9bxOba8ubqwa3wqz3KVHGtZd
 G9OTD/xjQrQuuarzPeOLJIPNhrLzXhUI/Sgy7Gsp9BUuJFKCBVWGj4bhG1uqpo7J3bgNYVCId8RR
 UZyT/ncJM7DZMECqx2dlvLIeo+1jXRKFb36MBkO+Gf2x+APDVxfHZa8juvoW5IeHQF8cYuk+xFC7
 KQGdEWhnb8u+jczE3MwM4zK9yWA/DocVGLzgPmK280a+DUu6Zz11iFiq3Z4UkFkJckXXUAAcz1B+
 h9rcuXoAHW9IkWgUcyyVKkM+HO5BJU9jTTLOFILYSBLZ6gG3NZJwjC+HWC0pEm51BCKPFPq4euSZ
 fhhGO3EuR1+7bAuHSd3plIo9igQzgGr6FS4j2SHvvqYOv81Rmkwq1hfXBOeW8XSkYo9f3EDBhIr4
 L8IEN6vbfwns0KMu1UMcU6ul3wu731+XoU6qLifpaCTwKTpCA9o023RZfCzipbOHMrxDwp1co/tS
 7SXzVcqr6d4+24V0JB+t27IxQN0LrzLe0Br34LMiI7R7ZGyPfSxOLVWbzoKxU=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Renjun Wang <renjunw0@foxmail.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH 0/2] Add HannStar HSD156JUW2 panel support
Date: Sun, 30 Nov 2025 22:28:41 +0800
X-OQ-MSGID: <20251130142843.78926-1-renjunw0@foxmail.com>
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


base-commit: e538109ac71d801d26776af5f3c54f548296c29c
-- 
2.39.5

