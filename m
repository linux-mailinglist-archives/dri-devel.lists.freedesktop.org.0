Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC14733AD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 19:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D1B10E829;
	Mon, 13 Dec 2021 18:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400BA10E829
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 18:11:40 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id y196so12570387wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 10:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eABLlwdhhQA4EtdJ9dTJbyW3eJdzwFqTfReCX7SfswY=;
 b=Q+uc31bNiJitSMqmr1/rJyPPWrnX2FrpDpzyQ3x2IUkYEYEWsPeoO7BauxVPvrSCpR
 I/rooyQX2u1yXB+q2X3HmZFopsNQPvwGGTtobKjUcI6GtxR0uGEGW35uHTQPb+MgQrRP
 St60ql6J9J7YkrUMVP8ph71/0klP4HxJMC5MGla5kQ4EfitKzSrBzekCUSZ8e86cMJFB
 PoiD0Gj0kWo5CJXDdr0nnuja2H1IT9+BxrxYFgxpuCAeje2GW7EwlMcqDTMdR5bXzFPi
 n0boV/hpPittJWGTzefXw68mnTEmbO+zeN7GFxKuiO+7juT3gm0/rl4glGuzVit0L2oE
 8nRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eABLlwdhhQA4EtdJ9dTJbyW3eJdzwFqTfReCX7SfswY=;
 b=tf+xhJw6+FAvLWewHJ7WZcGaUIhZ1ynDiPnNq6FXRxJAniG6brLhSK/SSgRFHCG0ge
 dRXmer+WcK4U4PVqZhseXCSHosSxSBAL/xkhU3yC9X8j3eLGuzr0a+vE1rh8wuzjVhed
 FFFs67Ivud0+Z9ef3sx7OAX3CMXfrMYPPAsmibk+TtI05ES3IBVSrAH8v5ihO15sUZ8s
 LfqcrLaq2Q6nxwPOlVa5Pw0L3zDNKYn21mPxk4RTpUHe8RiiEgXGQTC0m00RnCQ1maQV
 oE5gWjDV9EwSDThE4cK3unghoV+lf9OP74BlCtwwfn129RhKAJ1kjQHnzf6vwF5mnOii
 ahyw==
X-Gm-Message-State: AOAM5325r0ZmYSKO6jDdkV5EQdnluxwjhwfI+V6E9K5yFoHkGij8m64o
 SS09Tc69C86WNUT6tCCJCbmgvsIdw47Beg==
X-Google-Smtp-Source: ABdhPJxrnILbtrKwTKTPwkYNsdvjUz2gzOftVzw5JaMQvHJtjxm1PFVZvA57d7rAiJv1hvhrm3YVcw==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr289245wmb.51.1639419098682;
 Mon, 13 Dec 2021 10:11:38 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id t127sm8750956wma.9.2021.12.13.10.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 10:11:38 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Subject: [PATCH 0/3] drm/vkms: add support for multiple overlay planes
Date: Mon, 13 Dec 2021 19:11:28 +0100
Message-Id: <20211213181131.17223-1-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

First of all, let me quickly introduce myself. I'm José Expósito and
I'm a hobbyist open source developer.
My contributions are usually in the kernel input/HID subsystems and
in its userspace library (libinput) as well as other projects.

I'm trying to learn more about the GPU and I found VKMS as a good
project to get started.

So, now that you have been warned about my (lack) of experience in this
subsystem, let's get into the patches.

The series adds support for multiple overlay planes by adding a new
module parameter that allows to configure the number of overlay planes
to add.

I checked that the planes are properly created using drm_info[1] and
also executed the IGT test "kms_plane" to make sure that the planes
were listed in the output.
In addition, I checked the vkms_composer and -even though I'm not sure
how to properly test it- it looks like it is already prepared to
compose an arbitrary number of planes.
Having said that, I really hope I didn't make any obvious mistakes.

I noticed that the docs say:
> For all of these, we also want to review the igt test coverage and
> make sure all relevant igt testcases work on vkms

I ran some plane related tests, but some of them were already failing
without my code, so I'd appreciate some help with this bit.

Thank you very much in advance for your time. Any suggestions to
improve this patchset or about what to work on next are very welcome.

Jose

[1] https://github.com/ascent12/drm_info

José Expósito (3):
  drm/vkms: refactor overlay plane creation
  drm/vkms: add support for multiple overlay planes
  drm/vkms: drop "Multiple overlay planes" TODO

 Documentation/gpu/vkms.rst         |  2 --
 drivers/gpu/drm/vkms/vkms_drv.c    |  5 +++++
 drivers/gpu/drm/vkms/vkms_drv.h    |  1 +
 drivers/gpu/drm/vkms/vkms_output.c | 29 ++++++++++++++++++++++-------
 4 files changed, 28 insertions(+), 9 deletions(-)

-- 
2.25.1

