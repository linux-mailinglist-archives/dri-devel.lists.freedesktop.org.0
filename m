Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0394287DE2B
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 16:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F56910EDE8;
	Sun, 17 Mar 2024 15:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ECof+i1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C470810EDE8
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 15:57:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A8D1D01;
 Sun, 17 Mar 2024 16:57:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710691043;
 bh=25i5J1kFlZfTTly5Ul2J+vToXqh5dRGaBYCuadqfxts=;
 h=From:To:Cc:Subject:Date:From;
 b=ECof+i1SV7j9dDYv3YPTZhiOsBLLbtOKxV/LUlbxFhzMxB6ArZox9moy29j0uv+Fa
 ZC+oaUHSN9WyFNSFr5LcaW2p4MtP3u7EIcyMwxIv4WmJRzn2RCx8rvDWlm6zWhxLLD
 QeZ3ZhignCmuO0IT/grqOUK2KUE+zJPHeutHIMFo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 0/2] drm/panel: Add Startek KD050HDFIA020-C020A support
Date: Sun, 17 Mar 2024 17:57:44 +0200
Message-ID: <20240317155746.23034-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
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

Hello,

This small series adds support for the Startek KD050HDFIA020-C020A panel
to the ilitek-ili9881c driver. There's not much special here, patch 1/2
addresses the DT binding and patch 2/2 the driver. Please see individual
patches for details.

The series has been tested witha Compulab SB-UCM-iMX8MPLUS carrier
board.

Laurent Pinchart (2):
  dt-bindings: ili9881c: Add Startek KD050HDFIA020-C020A support
  drm/panel: ilitek-ili9881c: Add Startek KD050HDFIA020-C020A support

 .../display/panel/ilitek,ili9881c.yaml        |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 222 ++++++++++++++++++
 2 files changed, 223 insertions(+)

-- 
Regards,

Laurent Pinchart

