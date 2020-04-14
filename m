Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68101A8013
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 16:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D0089D66;
	Tue, 14 Apr 2020 14:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D442689D66
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 14:44:09 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9B2F340443;
 Tue, 14 Apr 2020 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586875449; bh=CyQLY6qA9b5hLjN1QZuqQF+tTWfcH+oMNp9NHfFqATo=;
 h=From:To:Cc:Subject:Date:From;
 b=DrTqvCEdWVVYU7NdGBLWNrjs+MH9B2O5Rb2ohpc1in5xryOIb4U2EbiL0Ef/wkcwH
 Ki6Z1BAHuoCMQ36goSJCv8xY48STOzlRx3+2FtESSqdA68MYyHVzYLMvk+BMNHgwj0
 kWe78JO7FcyPIDJeUnguuEpHsEyw7e/1ci17vyCB2AN6uzAeotF9wxkmuAQl+Bjy3b
 oTUemcFSQDQ4lXMnofiTX/KdQl6MpFlbXjznW9j1XFBnym0SoXlVjC/kroqNOZaR6G
 MEMi5MoKzduGVQ5EHHHMBami3dMKcLYJArQCsE4lM31psZxZkphYiY/UsITV8xKLbe
 fC1z3rJUXgOfQ==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.225.48.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 653FBA005C;
 Tue, 14 Apr 2020 14:44:04 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v2 0/2] DRM: ARC: add HDMI 2.0 TX encoder support
Date: Tue, 14 Apr 2020 17:44:00 +0300
Message-Id: <20200414144402.27643-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-snps-arc@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes v1->v2:
 * use DT Schema format please (.yaml files) for DT bindings

Eugeniy Paltsev (2):
  DRM: ARC: add HDMI 2.0 TX encoder support
  dt-bindings: Document the Synopsys ARC HDMI TX bindings

 .../display/bridge/snps,arc-dw-hdmi.yaml      | 131 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/arc/Kconfig                   |   7 +
 drivers/gpu/drm/arc/Makefile                  |   1 +
 drivers/gpu/drm/arc/arc-dw-hdmi.c             | 126 +++++++++++++++++
 6 files changed, 272 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
 create mode 100644 drivers/gpu/drm/arc/arc-dw-hdmi.c

-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
