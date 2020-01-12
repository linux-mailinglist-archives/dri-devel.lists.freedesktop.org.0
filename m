Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BC7138801
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 20:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B777889ED6;
	Sun, 12 Jan 2020 19:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA8389EBB;
 Sun, 12 Jan 2020 19:54:12 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id b22so2965269pls.12;
 Sun, 12 Jan 2020 11:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yud86Z6TCLSzd0rR4y2aIB+ldRZqkAROXID9MEYSFRY=;
 b=LSneU5osfAdaRa9Vis9gXCnleS2SMgQoqlVF/rEy1osnQVkvwuFe6u8RCRMr3wWcMp
 E2rVGBfMju31g+0ewn3GNANjbuulCUd5V3VSGix2PEO57fWsxVASbXyz063zxmSX+XZ6
 21MfAudMiQ53BiNHLWuWOCk46PTajisQUTlYp12+Hq8cRLcU4xYaHFC7HKaZyb0AFOQK
 ci32Mh6d2ppBTnOStnwnILDtlMzErf0hYp8e2dEqBAvpolSLU4p/rVnj/NIbqtbt3+o7
 VAzJ1mknsTEVjFU6k2PN6nIR0G6R8KarlkyXSkuNfUMpvHcCRQauRPeQQK69GlR3XB22
 f5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yud86Z6TCLSzd0rR4y2aIB+ldRZqkAROXID9MEYSFRY=;
 b=fq0OO58Tgb/px1Y5FxVoQoKKlAKc+3wVsNXuU5IbhUBAtio1P2zP87iPqxQnw85cSm
 l4YzFxt+xJPGulbcjWlOwcxr8aY4xx5x9gEmKSbSPdoQ/UMXdqK9/nAEz81mL6NgVMad
 jdEyL9bIzABT+zdWqkJdMyWPTiSTnMYkeXkA/Y2AxQLvk2r6M88FpjuBEUewaT/mloLr
 9ZTIYVsweHNrxvp+EwZcOSlhGaJTW7YX1xJWVucLQiEJ5iNwGoGHnbTm+NJCc7VQaddf
 60syh9gVe+Aa1O8Otrs8Ns9WAAP0BXYXUvCt/uCX1C8bBoaDLvUMrMTCJOcuObD5qpYN
 L7ag==
X-Gm-Message-State: APjAAAXIH39ixgorudLztTXw5m/yOiVmmBmD0p5Tx//MI6PWQxhdHAUN
 POgonQ7I1MXa3uXuNqJXz0K4+249B7Y=
X-Google-Smtp-Source: APXvYqzg3ZTlrgWnSzwGAoyDQpR2QVy2mV1UbfhCVOs0nnzZiJ5QYI/WrPy1+HK2WaVmhK9ISXkm4A==
X-Received: by 2002:a17:902:aa85:: with SMTP id
 d5mr17395774plr.16.1578858851944; 
 Sun, 12 Jan 2020 11:54:11 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 u128sm11418702pfu.60.2020.01.12.11.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 11:54:11 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/msm: use firmware-name to find zap fw
Date: Sun, 12 Jan 2020 11:53:56 -0800
Message-Id: <20200112195405.1132288-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

Rob Clark (4):
  drm/msm: support firmware-name for zap fw (v2)
  drm/msm: allow zapfw to not be specified in gpulist
  dt-bindings: drm/msm/gpu: Document firmware-name
  arm64: dts: sdm845: move gpu zap nodes to per-device dts

 .../devicetree/bindings/display/msm/gpu.txt   |  3 ++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  1 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  7 +++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  7 +++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  6 +--
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  7 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 50 +++++++++++++++----
 7 files changed, 64 insertions(+), 17 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
