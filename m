Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 295744B869F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 12:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AD710E660;
	Wed, 16 Feb 2022 11:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D3810E70D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 11:28:43 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e3so3003700wra.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 03:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=epvxMXVABsOlpoWAIZRmBAbtBNOhmgedGEUdZPQGKqw=;
 b=PHnXv9jR6fXp45T6rFvUAsp3ILeAQEMn/B9IlxXjks8K14BRLIjynEI0VTxTPJaj1A
 8tdlTfp1BQUKlk0KhHedT7ssuipX/W1FYtxwRbNfnnzWl6ONQmR5Pj5HmmiOaMDZFLZJ
 PYEgBJsAhELUZLMnVcR90NjQRUA9UXIER2ZyJ/GAOZjfQlW5XqOYWXE/cvQt4Sh24Al4
 vXA4Nge0kC35+Yu2oZdZN4Af4cCrctt0/S/ebCeA/Rx7V3rpph84vFHjXWo9umE6D2DG
 xXTHZrQXddOqocnDRSAw/61XGOPPaaKhvxuQ6t/mRqBJSC0Ur9yuPv4AhGjnqe3cyC07
 +ZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=epvxMXVABsOlpoWAIZRmBAbtBNOhmgedGEUdZPQGKqw=;
 b=25hGy4ah0bDJPXTUGpJHrBWDls2f5pkoZZv12CUQwx07dKrJHFjN5xTgebMhxlcdgB
 FGqkuBPhF+KoCUH+XcNDhgn6fpGo/dtp5TLWX9yNtooMmWS34hsfkbemngC1ekXzUnlc
 6fSQYdeMrL4qr1Hcyr18GodXNRxUIqYq3oDm1JmjXjwxZn1Xg2khpBek3QqKbxIqz/3m
 QOB496V4RII/CcKPegWNlXLg6TzSufP0R+44x6dldjgbc1mjPSFFHrzt2WnVc5ZTBEx8
 I6w1fR0ncUOilQ7f7ImSuhvwnvK62N30RUsWQQUFv2Q6xL5QsAqJlHB1/ZI3a8mxlk6O
 RQlQ==
X-Gm-Message-State: AOAM533wNicfsOqFnH2SAM18GWcJSNqDOhx646+8ii8vxIyUw3SPvZhM
 KOTbRWmTzn+pepkeckFTSv+Wql1KHWlJ4w==
X-Google-Smtp-Source: ABdhPJxOA7nfQ+FMG5ZBNPHxXj3tQuU7mL1dTYOTyc46wVP9dFApw5JwyStkou+e+6kJ1DfK9ngyHw==
X-Received: by 2002:adf:82d0:0:b0:1e2:a961:1aea with SMTP id
 74-20020adf82d0000000b001e2a9611aeamr2026104wrc.706.1645010922184; 
 Wed, 16 Feb 2022 03:28:42 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:13a:17a0:fb6f:ee00:90ce:69a])
 by smtp.gmail.com with ESMTPSA id
 ba27sm8158465wrb.61.2022.02.16.03.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 03:28:41 -0800 (PST)
From: Samuel Pitoiset <samuel.pitoiset@gmail.com>
To: xorg-announce@lists.x.org
Subject: [ANNOUNCE] libdrm 2.4.110
Date: Wed, 16 Feb 2022 12:28:35 +0100
Message-Id: <20220216112835.62764-1-samuel.pitoiset@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Stone (1):
      drm/atomic: Stable sort for atomic request de-duplication

Dylan Baker (9):
      meson: use dictionary kwargs
      meson: add override_dependency when possible
      meson: switch the meson builtin for symbol visiblity
      meson: switch to cc.get_supported_arguments
      meson: use more standard formatting for better readability
      meson: use cc.check_header instead of open coding
      meson: use cc.has_function_attribute instead of open coding
      meson: use the modern interface for pkg.generate
      meson: use summary() instead of message

Eric Engestrom (1):
      use standard `__typeof__()` instead of GNU extension `typeof()`

Guchun Chen (1):
      tests/amdgpu: Add VCN test support for Biege Goby

Raviteja Goud Talla (1):
      intel: sync i915_pciids.h with kernel

Samuel Pitoiset (4):
      amdgpu: update_drm.h for new CTX OP to set/get stable pstates
      amdgpu: implement new CTX OP to set/get stable pstates
      tests/amdgpu: add a test for new CTX OP to get/set stable pstates
      build: bump version to 2.4.110

Sathishkumar S (1):
      tests/amdgpu: add jpeg tests support

Simon Ser (1):
      releasing: s/master/main/

Tejas Upadhyay (1):
      intel: Add support for ADL-N

ravitejax (1):
      intel: Add support for RPLS platform

git tag: libdrm-2.4.110

https://dri.freedesktop.org/libdrm/libdrm-2.4.110.tar.xz
SHA256: eecee4c4b47ed6d6ce1a9be3d6d92102548ea35e442282216d47d05293cf9737  libdrm-2.4.110.tar.xz
SHA512: 52f92ef1fe4c218a1d7dba53ef43334dbfca80e3209afe59f3a32c4bf67473126534e990df07a931a12d46a3b997c21ef17c1c4d8a0c88d44d5c6c040e3b6be3  libdrm-2.4.110.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.110.tar.xz.sig

