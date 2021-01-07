Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA8C2ECC1A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 10:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984A96E40F;
	Thu,  7 Jan 2021 09:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE4C6E40F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 09:00:29 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id c79so3469442pfc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 01:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A38XEG2bxzvR12086jQpwTTb/g0iT6/kG6TCSTQMuF8=;
 b=HJnCLAsRHKWwLhQ7mKp+58XMFdmWbGx2dCO0jxV1ALEGSO6wf10jAomB5O+3gmuBHB
 CTPoWHFdcP5Go3ofX1hhjyQDEi0/327NPX2VSj+mZcNIK2gvbIFO94nb2C70wwBJNaZ0
 GsavQVH6iJa2B0zmPjPsSTxSS4hW7wytRLe9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A38XEG2bxzvR12086jQpwTTb/g0iT6/kG6TCSTQMuF8=;
 b=B9zCPUbqjBZfc8WGHldsEgBo+rGFJNGI36zSHu5YZbtJfzbieUCrzCQkwQWfN2AihJ
 aUyUHbdpvSRNZ25fCgNAHncUESjLrCrKpFcPBpK5Lu59fvvCDfWMzbc04RP4RzFj0yFy
 /c3cqROClHMd5fx41Isr3BUZq+ywY/wogwNd0pEGm9Ss0vQ/rBcNmW5w9R2ThA3hUplg
 AVNN9bLAvRjoB2rN2xp28Qthz/9+5K0SNn7c8uLAVtXe5gSL/3gZonZFNopUhBtpe5/9
 E7uEemqEKpv1vkQXzyRzozOw4/nOd75IkxRezFXlnDLIB/KhNe62mzzSVsHH7qtYRSWE
 B52A==
X-Gm-Message-State: AOAM532CxTKM82lvtDz/cvzETQgYiv+vZZ19XzNY6vHFybABNyxJ/Rma
 mc+ZLRmFE16ROxcM8om7auluWA==
X-Google-Smtp-Source: ABdhPJw9Ssl8Yb7I2NbXzQGWuVjK6p28ej36nNEL2Q2+nQZhP5RGtaadDnQqTtmMvEnuKGhzm6xJnA==
X-Received: by 2002:a62:e30c:0:b029:19d:932b:a1e2 with SMTP id
 g12-20020a62e30c0000b029019d932ba1e2mr7918416pfh.78.1610010028859; 
 Thu, 07 Jan 2021 01:00:28 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id a29sm5022421pfr.73.2021.01.07.01.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:00:28 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v8 0/4] drm/panfrost: Add support for mt8183 GPU
Date: Thu,  7 Jan 2021 17:00:18 +0800
Message-Id: <20210107090022.3536550-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Follow-up on the v5 [1], things have gotten significantly
better in the last 9 months, thanks to the efforts on Bifrost
support by the Collabora team (and probably others I'm not
aware of).

I've been testing this series on a MT8183/kukui device, with a
chromeos-5.10 kernel [2], and got basic Chromium OS UI up with
mesa 20.3.2 (lots of artifacts though).

devfreq is currently not supported, as we'll need:
 - Clock core support for switching the GPU core clock (see 2/4).
 - Platform-specific handling of the 2-regulator (see 3/4).

Since the latter is easy to detect, patch 3/4 just disables
devfreq if the more than one regulator is specified in the
compatible matching table.

[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20200306041345.259332-1-drinkcat@chromium.org/
[2] https://crrev.com/c/2608070

Changes in v8:
 - Use DRM_DEV_INFO instead of ERROR

Changes in v7:
 - Fix GPU ID in commit message
 - Fix GPU ID in commit message

Changes in v6:
 - Rebased, actually tested with recent mesa driver.

Nicolas Boichat (4):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
  drm/panfrost: Add mt8183-mali compatible string

 .../bindings/gpu/arm,mali-bifrost.yaml        |  25 +++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   6 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   6 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
 6 files changed, 161 insertions(+)

-- 
2.29.2.729.g45daf8777d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
