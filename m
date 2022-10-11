Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B91095FB0E7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 13:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D2710E002;
	Tue, 11 Oct 2022 11:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48F210E002
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 11:04:42 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id k2so30590788ejr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 04:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=RHmKNxQeYlL17It4UDJFUaAGwCKxU2/7jM91lczFG6Q=;
 b=OHRXqQxVECmzpYs+O8Juj4pH0t07+KIxpOqfmaIAEYzTEjSYlsUEnFoWQ1jGMbhQ5v
 SauK5044Y3qR1eY0OrlyHcR6GilfDAVBd39R8HiDRiOPybbvzv/o/Elfmh2EvP2bLWnw
 BHp+NwesO07RDB/Uxsv/vrD2iUTIX9mS3PZCaOc7fMETnSzabmEVZxg+bNHPKBJm2pq1
 jiALMqiCKBfHEzrEUIY3PLNCtSA2uJKobLO9+HuTCprhLJjLSNTuh4EhM8fcy+I60F2H
 eCa4xHEzcLQWvib2VRRLBrax4RX40BgLG27+wfJAFLSLhVrRt2uUB3ZFp0U/K5z3gDat
 4Nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RHmKNxQeYlL17It4UDJFUaAGwCKxU2/7jM91lczFG6Q=;
 b=ipvJ7/mw3vVTyARrGwTiq0txhK6eT5tooVNKD1bCAW5uqvA73nTPdEUmridc7W3ew3
 9Jn+/MD6+r8ja9dVVJrpNqDECgPOZzLPMC25BJLjY/oXhiNf7jqikMBT7yGC/0CYKwXW
 KEObY1yHxdT9KN4doPjPKVR7ndm0cn7GgTf6DyH4XqIO+RwyfIrolE8cPCLX2QM3mHWe
 ZVMRUdmFMxA9SWO+89dZvlNBghqKTRyMxKFt07DXeEkMlInkJ8+GCqE5mj8P3mBY3Fy7
 L9EOikoAc5t+nMwlt/12z3PgLVFDm2Ua4dkGSiU9QODDgR/k9h9rohUCdYAe5QvUORu3
 9CDQ==
X-Gm-Message-State: ACrzQf0haaPH5V0gkBnpDaK603iwgscFErNssSESRv9+afB/pAPcwhZN
 T47ys9CPBwJl/TZw3cc5I19fS6ho9eE=
X-Google-Smtp-Source: AMsMyM4EqiY2sViv0PHqhlcGAEcK0LNfSU5xLDKfebvjkLG/stHRJfX5rXbIE5Ci7ZvyOe+0b+GfYA==
X-Received: by 2002:a17:907:320c:b0:77b:6f08:9870 with SMTP id
 xg12-20020a170907320c00b0077b6f089870mr17980027ejb.249.1665486281132; 
 Tue, 11 Oct 2022 04:04:41 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 v8-20020aa7d9c8000000b00458478a4295sm8938122eds.9.2022.10.11.04.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 04:04:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch,
	airlied@linux.ie
Subject: Render only DRM devices
Date: Tue, 11 Oct 2022 13:04:35 +0200
Message-Id: <20221011110437.15258-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi guys,

we already have quite a bunch of devices which are essentially render only and don't expose any connectors or more general display functionality.

Just recently I ran into a case where an older X/DDX combination caused problems for such a device so I looked a bit into the possibility to allow drivers to disable the primary node and only expose the render node.

It turned out that this effectively hides the device from X, but OpenGL and Vulkan can still use it perfectly fine.

The only crux is that this is checked so early in the initialization that drivers don't have an opportunity to update their dev->driver_features. So we will always need a separate drm_driver structure for render only devices.

Please review and comment,
Christian.


