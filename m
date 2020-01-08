Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64B133887
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 02:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7216E11E;
	Wed,  8 Jan 2020 01:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A690D6E11E;
 Wed,  8 Jan 2020 01:39:03 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id k25so734044pgt.7;
 Tue, 07 Jan 2020 17:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qrBHJRFSRA4AlmSOTlxgOJ04a73uvSIbhRd+GAk2pRE=;
 b=ejeetgrcvv9LsANDxK4s91NGCUtBlKd9sKWqIIK30ge81Kr3B8uhtVoCvfC+V8RuZo
 k3tsAtYkYe+3Kj9IzIcdhnuZpq6JQKfNqfS+pPtEXTjMDRTixQSCX1D/GUUY/qg23W2N
 YzM9zAOOlCEBSqx4grMnk0Z24bb7ilMh17h4wjC4MqvnSpejwCKLFk2XvVbFcbVB35tp
 41feryqS09briYf4eGcDGNuUU4XLmSVnU+X9EMbw1C2Gi0MUp7iCiq39bRvvhzBEC1we
 WNT8TtlhktCHnPYfsp+GAIdGW2wHPu8p/3DVaAlxLAoasAomod10GTlOiuqQdCtG6UPU
 9YHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qrBHJRFSRA4AlmSOTlxgOJ04a73uvSIbhRd+GAk2pRE=;
 b=tvBqQJhz3cyS226DRaDMKbPlBdHpJqB0xcZG3SF+6AOItNRcHdbbHS1k0lXJ9ZlEtK
 0GneUfFRV4TrjOHE9KsekoaCa6h0QPlnOrYm9SLkObrMXJet8Jj1L7OxlR69W2AfsNYg
 TOziCbkRk6SC1VBcuLsmGUTIwF3G0JK7K9M+Jje/CVYnorF0HA+cCoKRVUYCfjIgQLSP
 uKOkqIkBpU9Y90gH7a2jnNAu3LpqvobdywoKPkHx6E10Qd6goU9tuO1YQ4mPQyPKC7XD
 Pj5gOmiFzdJk6c7Fd0/dnLT9CHKMKwAr77eWCN9c1c7ch39su28CZ1G9BBNoIr/lOfrI
 Cv+g==
X-Gm-Message-State: APjAAAUcGmzMFxAgv+zWGppCaJqFhECnVGDWAs4WMJ4581eyWTBBME4q
 9h/8ORnZQt6s0aVdpVG1Xwbuh8HNf3o=
X-Google-Smtp-Source: APXvYqx/RXCffdkJxN9926F2ZtBJ7RCAjEZ+yRHzVoEMHDlC2SG4j9p18uaRcrabtEj3ZNUIWgSNsQ==
X-Received: by 2002:aa7:8007:: with SMTP id j7mr2431615pfi.71.1578447542963;
 Tue, 07 Jan 2020 17:39:02 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id 73sm1032858pgc.13.2020.01.07.17.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 17:39:02 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm: use firmware-name to find zap fw
Date: Tue,  7 Jan 2020 17:38:41 -0800
Message-Id: <20200108013847.899170-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For devices which use zap fw to take the GPU out of secure mode on
reset, the firmware is likely to be signed with a device specific key.
Meaning that we can't have a single filesystem (or /lib/firmware) that
works on multiple devices.

So allow a firmware-name to be specified in the zap-shader node in dt.
This moves the zap-shader node out of the core sdm845.dtsi and into per-
device dts files.  Which also removes the need for /delete-node/ in
sdm845-cheza.dtsi (as cheza devices do not use zap).

This aligns with how Bjorn has been handling the similar situation with
adsp/cdsp/mpss fw:

   https://patchwork.kernel.org/patch/11160089/

Rob Clark (3):
  drm/msm: support firmware-name for zap fw
  dt-bindings: drm/msm/gpu: Document firmware-name
  arm64: dts: sdm845: move gpu zap nodes to per-device dts

 .../devicetree/bindings/display/msm/gpu.txt   |  3 ++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  1 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  7 ++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  8 +++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  6 +---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  7 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 32 +++++++++++++++++--
 7 files changed, 55 insertions(+), 9 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
