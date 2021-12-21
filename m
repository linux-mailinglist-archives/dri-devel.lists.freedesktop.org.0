Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014E547BDF7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 11:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F82910F59B;
	Tue, 21 Dec 2021 10:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C966C10F1C1;
 Tue, 21 Dec 2021 10:13:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 203-20020a1c01d4000000b00345bf98da86so36406wmb.3; 
 Tue, 21 Dec 2021 02:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LiEdSYmJyAKWAqc7ui3XIZTznDZvFBWaDk4WF2mm3yA=;
 b=pBXL5mIQQqrE1sWVIayqcv1+QL5wyX/RH88FEO/rknbs31q5lPo7Gc1vsNLcyk0aeN
 GuQyqQB6ckAM/UMXeqF1shw9N22mmOkGalFRHuT+sytdWtPUY6l7oo5EMLPSC9rjEBV9
 21LHQ2WLsLqRROwJubFBoMUkkb+f2Mpgjv1O/Ong1dxmOUlcsz23vfcjqJD2j++ltWGb
 peffVNVGts7WXOfgJi/2dptWzKdsMGvyg+itPpnhRpO0/hj/T1dXFnSDVMWoyycHht3+
 GFC1s6NEkiwfR0QXZ9Es+IKcEhWteFlyreBY4mGdFzuw81AT1JVQ9BVWyEvFcTHkgWVa
 kz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LiEdSYmJyAKWAqc7ui3XIZTznDZvFBWaDk4WF2mm3yA=;
 b=MohzjhWfG85j5Mc4fE+vN+b0Z67A7hxPUJWNXBCdA6W6+ed3g48I43NYSO5Zxj6Z9X
 +rlOUAnSRvLp9E/aKZD+7/UiWJVMFPpwu2SMNvlreHG9p4MwExxpRok8UqcNs+A/tBPs
 khosyepaBhg1IeraOYHmukfnzcMkpb6syPLgd2Ay5BNQdD7mMPWnu80xs+Wga3VNO69H
 1MB9eiSIqnRmy2FVoaiIbhzN9Zp/iBDJySR/ytvR+zySp5qJjW/MNE32xVZ3uo2hzEvH
 CTCKiDc5FP51Tyab9gPwvvTBdO5HG3GT3YyDywnTFd9o5J0jOAMCqYQ31XnctkjVXxP+
 72Lg==
X-Gm-Message-State: AOAM532AVXOXxLGc3JGBsfCFx14R8h0BtoPTwvqNDWeIuX2FMH163vc5
 bwhAxaPsDsDwuFXixCYhKCw=
X-Google-Smtp-Source: ABdhPJxsRp72r/sEXZushQwODicy6txDdNbXADlfasQ0YwZfEqd1nrA21efVDrckpVqgvVS1sVerog==
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr2105184wmc.62.1640081607375; 
 Tue, 21 Dec 2021 02:13:27 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id m21sm18012267wrb.2.2021.12.21.02.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 02:13:26 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH 0/3] Add missing format_mod_supported functions
Date: Tue, 21 Dec 2021 11:13:16 +0100
Message-Id: <20211221101319.7980-1-jose.exposito89@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, jernej.skrabec@gmail.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wens@csie.org, maxime@cerno.tech,
 tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 sean@poorly.run, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

When setting IN_FORMATS, implementing the
"drm_plane_funcs.format_mod_supported" function is mandatory to avoid
exposing a bogus blob.

This patchset adds a bit of documentation and fixes the issue in a
couple of drivers affected by the bug.

I reviewed all the other drivers and I didn't find more instances of
the issue.

Jose

José Expósito (3):
  drm/plane: Mention format_mod_supported in IN_FORMATS docs
  drm/msm/mdp4: Add format_mod_supported function
  drm/sun4i: Add format_mod_supported function

 drivers/gpu/drm/drm_plane.c                | 7 +++++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 8 ++++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c     | 7 +++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c     | 7 +++++++
 4 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.25.1

