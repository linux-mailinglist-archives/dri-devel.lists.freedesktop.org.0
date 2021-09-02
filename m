Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C47E3FF134
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 18:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C7C6E5D3;
	Thu,  2 Sep 2021 16:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE3D6E5C3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 16:00:20 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so1783792pjr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i2sUtpSLgV2NfNkerlODfWXBzMlFhnFRaVTxnhqZHTs=;
 b=PvHrgsg6Xh0Nlquhj+NfeC2AlgVgRF+fqPBSedN6fowI+pEeR++wAwZfzlrPYWeJCV
 ecLEsjwig1wo37v7rAesQnGTCkmsmGnsG3upK+6AKNDGwnLCC4XSFpicXVspVuGi4R03
 DRxUknCYvORT5ndHwhGenIylHA8WL+o5sm8/pUBfRmmHWldY0NxbQKrhFWMq0nloRadm
 9snhOvUBwHzIa57gh6xdJkq5iafNmD06GiPyBuxDnFK7J7qvKECsx49BRDkWJm9J5j/m
 UjWhM7WJ+6S7RlE3gxYWnOmSrt8NaJYdiAzH1QVyDypdczIKqGh/AyxuivW6vCNm4R/r
 NpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i2sUtpSLgV2NfNkerlODfWXBzMlFhnFRaVTxnhqZHTs=;
 b=hGap62PWQV+V6UblctfIDRb7PdVk8hGvD3FWGedc3R/gUj01RheYrK+9OUBID6puvc
 SN+bdsdBvkCKyWXbUmG7i6ZKp53P+DAF/gM+fv8PBapdU8nJI/nEXhmU3bUzHqgdHGlw
 D6ygwRkiKrhKfW0Ytv6srZATj9KxOVEKeSLOZAvntZt0JiOTZOM/WcsQUkJ4St2rl8TX
 CtfHFHJrAtADhBEvFBzxjIKL5O7Q7hqSfU8bwmmPrnJxrY0dGc6VdMbdzRAwTa+c5lOm
 ej6z17R5z5pqvNyH0VBqotWuWwnYKAVYRMpeTh30ns7+03/IlK34Aq2nwJVZAJ+BlqIo
 retA==
X-Gm-Message-State: AOAM533CH70hUmd8Kia9bKhHA6cZpUJtJtkdnHogt+fo/MB8J+S3v+Wh
 ZiKn6pUQzp+VMfhP75kpdZ8=
X-Google-Smtp-Source: ABdhPJybKGJKm4mopOmE/lwiDN5iiviwDKWEduGO1PdaspmiazPfOhc6yufIxi4H/ewKaBoYbTPOTA==
X-Received: by 2002:a17:90a:a88b:: with SMTP id
 h11mr4586157pjq.44.1630598420051; 
 Thu, 02 Sep 2021 09:00:20 -0700 (PDT)
Received: from skynet-linux.local ([106.203.214.216])
 by smtp.googlemail.com with ESMTPSA id a15sm3528540pgn.25.2021.09.02.09.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:00:19 -0700 (PDT)
From: Sireesh Kodali <sireeshkodali1@gmail.com>
To: sireeshkodali1@gmail.com
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, robdclark@gmail.com,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] MSM8953 MDP/DSI PHY enablement
Date: Thu,  2 Sep 2021 21:29:49 +0530
Message-Id: <20210902155951.6672-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Sep 2021 16:21:03 +0000
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

This patch series adds support for the MDP and DSI PHY as found on the
MSM8953 platform (APQ8053, SDM450, SDA450, SDM625, SDM626). All the SoCs
on this platform use the adreno 506 GPU.

Vladimir Lypak (2):
  drm/msm/dsi: Add phy configuration for MSM8953
  drm/msm/mdp5: Add configuration for MDP v1.16

 .../bindings/display/msm/dsi-phy-14nm.yaml    |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      | 89 +++++++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 21 +++++
 5 files changed, 114 insertions(+)

-- 
2.33.0

