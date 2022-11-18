Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA162F454
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 13:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC98B10E700;
	Fri, 18 Nov 2022 12:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D24110E700
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 12:16:17 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id cl5so8966791wrb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 04:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6xYxrdgg7kHc9dVUV3Wt8PZSVz1mE/x85HmVohO2UuI=;
 b=eQSiTmDGqok7KcCLhd923mgK8KBY5N1rAKEsz/t+dg7vNHvdJwWkX+3c6Ad7pu/8Le
 ls4gvLoy5FexFqD2IjwFGy9oJYndEkR4Dvb9IRGC1BjybU09/tycC5YXpWB2YJ492jFD
 kUZ6inJQ7T/PcFaxO5KxvxKXHXXpyA+2Ao6TyARiKfnOZ8Z6RD4s0T7GXcZ8RlFR8/dG
 TG59BeXuX2VEWy86Qez+/iFNo6zDB3SCLSt06BEN54SfoY2/x3qLw6oIHqG3OpvhN2RL
 aBTONhUyVI1qj7Nwo/OK8cemypXswgTidGG+Ms8UOcAo4waRDP5az7yz5FBViiDSslvq
 hJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6xYxrdgg7kHc9dVUV3Wt8PZSVz1mE/x85HmVohO2UuI=;
 b=yYrJUJMZYdwQsa0e7LSUGUb/E178zpJkr9CS240xmWbE4pUB8shLB0YyXvUwzMGlAf
 wAMsMfDnmLopjjpvxgEQYydLcNZBfFjKs8CSH4ygTfshbc35Y+kgsJhSA3+uyRxw6++w
 ZX4V4DV9hlRGxeLAveAvGfjEQRIswAc+VN7vq3urBiNDCz/mqSm7XqKE/5zbvNJCVijm
 027NqNQm5FXdiHBBajplZJix5rdgj12fe2yts2Tt936752XMNpmpFBJW4nLAVRAcZWIw
 jQnnM415XMM1ZXArP3qmZlZfeFRlykPFdNUUN+1dc5BoWyWlFa079I2+5zObYZk3z1p+
 j8Dw==
X-Gm-Message-State: ANoB5pk0rzgRO1doKKsBY2RxAKlv+tqo1qJtfM3UnHgFzvO3b9EjF1PK
 POVSYOuiRwWtnQCMf7juaiE=
X-Google-Smtp-Source: AA0mqf406NGnh6OSMy16COVi7kAaSZweiyf5iBaetxBjX7GJpAlgQuVeyBaEmgXIUFCRIeX2f0wmFg==
X-Received: by 2002:adf:f849:0:b0:236:57e8:c79a with SMTP id
 d9-20020adff849000000b0023657e8c79amr4377484wrq.321.1668773775901; 
 Fri, 18 Nov 2022 04:16:15 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1c5403000000b003cfc02ab8basm9057976wmb.33.2022.11.18.04.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 04:16:15 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL v2] drm/tegra: Fixes for v6.1-rc6
Date: Fri, 18 Nov 2022 13:16:14 +0100
Message-Id: <20221118121614.3511110-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.1-rc6

for you to fetch changes up to c2418f911a31a266af4fbaca998dc73d3676475a:

  gpu: host1x: Avoid trying to use GART on Tegra20 (2022-11-18 09:33:20 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v6.1-rc6

This contains a single fix that avoids using the GART on Tegra20 because
it doesn't work well with the way the Tegra DRM driver tries to use it.

----------------------------------------------------------------
Robin Murphy (1):
      gpu: host1x: Avoid trying to use GART on Tegra20

 drivers/gpu/drm/tegra/drm.c | 4 ++++
 drivers/gpu/host1x/dev.c    | 4 ++++
 2 files changed, 8 insertions(+)
