Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2116D580BDD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 08:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B39210F599;
	Tue, 26 Jul 2022 06:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAE410F08D;
 Tue, 26 Jul 2022 04:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658810760; x=1690346760;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+hMHWP4TrhFZRGvCOWqhFzNxgYw3fCmXGdC/7XEsrbA=;
 b=p/0WpnNA4CpZkmC9IDmsRP2Od6RiY8rXOmOAviuIAYzMIY2zWlAZmP8z
 CVUMdCN40oo53yhlUJ9YvGvd1QTKE7iF17qSTVYCdBJ/38OrX/qkxyA4r
 tffNYiW8fd3DyijCBjyOcAgsSqGaGOveWJouvlYLYxMKEU5cuZvVd71ab Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Jul 2022 21:45:59 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 21:45:59 -0700
Received: from hu-ddhamara-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Jul 2022 21:45:56 -0700
From: <quic_ddhamara@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 0/1] drm/msm/a6xx: Fix null pointer access in
 a6xx_get_indexed_registers
Date: Tue, 26 Jul 2022 10:14:45 +0530
Message-ID: <20220726044446.21102-1-quic_ddhamara@quicinc.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Mailman-Approved-At: Tue, 26 Jul 2022 06:47:09 +0000
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
Cc: quic_akhilpo@quicinc.com, linux-arm-msm@vger.kernel.org,
 Devi prasad Dhamarasingi <quic_ddhamara@quicinc.com>,
 dri-devel@lists.freedesktop.org, robclark@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Devi prasad Dhamarasingi <quic_ddhamara@quicinc.com>

Fix a null pointer access when memory allocation fails in
a6xx_get_indexed_registers().

Akhil P Oommen (1):
  drm/msm/a6xx: Fix null pointer access in a6xx_get_indexed_registers

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.37.0

