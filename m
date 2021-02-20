Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9705E3205BE
	for <lists+dri-devel@lfdr.de>; Sat, 20 Feb 2021 15:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9963D6E1A4;
	Sat, 20 Feb 2021 14:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE0E6E1A4
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Feb 2021 14:37:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id a207so10392691wmd.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Feb 2021 06:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=fVDuuESTxn7zUT6yx7COduhBZCPBRiVBkWx2aeoYD6g=;
 b=UMMCKfMTTWaS3njwDVNXciI65bc1B2lNmmYs11uCmD+Va5aoJ9IdnbLLhhjZIaMUpj
 4/j3gfLEtDiLev+8EwiOwfny18tjArM99IbKKcDBgHmDf6+HlioGgesTU17OcrF8vK1L
 8JVCsJ99IU667sQUa8y5XOYzZFZkz+aU80TITD1J7JlIYrOSCKt8U41scJyJ+3aOwGuH
 BuMlp5ql3FUtYfswGezhE+6i76huH1S7V7TAHltfpMAcl06IGY90jrDFj0mJadLfL2KB
 /3fu0H0X6SqVwdH1sRrmHKBHo9MIRUhSIHxBgc7uwJ2u++O0D0v9FWSKqcm3meT/KQAm
 0Tiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=fVDuuESTxn7zUT6yx7COduhBZCPBRiVBkWx2aeoYD6g=;
 b=UHGL2bKisnq3hyFmxE4j3rRgT2Z/M8/TaHtJ7navV6WSUnOFVB8f6FHOjJ5GyMhBxm
 hjrMF/Ghvrai9g8tN2/yKfctL4UjIc9DmUdviln/ebY8qYJT4O3vBOonHfjfqZSIdB7n
 EW9srJN05HdBISKYaRzSUDzUwkd74ZheZkGLxiAEBlW9Q/KsPwV3tPGRCLmNtH+o4qP+
 jxxuxRc2aHiga/UTaRsexjRCXNg6sF7vRH0FHOKt68ebpBrV+mtnDzMsGHC5w9F8v0yC
 BTMciAAwQsNLBaq6sKRyTaQJCEeTWYvfkJdn5jzzwaEZZEGeAj97+zYjyGZWom8ACeaE
 24vQ==
X-Gm-Message-State: AOAM531iIY1qiToMV9MpyNAOsYzCClq0G6zXBGLkOQ9Xy2BGn5No6Y/7
 /n5QheYbltV4bBFjyvSw4uE=
X-Google-Smtp-Source: ABdhPJyKMpioQsx9EgvUqb4Jt6MC9dsejbLUksjRjov8C1jAntGDzq5CnNTj+g2mW0GBe1GuBFxsRw==
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr787485wmc.95.1613831877197;
 Sat, 20 Feb 2021 06:37:57 -0800 (PST)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id p3sm3270985wro.55.2021.02.20.06.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 06:37:56 -0800 (PST)
Date: Sat, 20 Feb 2021 11:37:49 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 David Airlie <airlied@linux.ie>
Subject: [RFC PATCH 0/3] drm/vkms: add overlay plane support
Message-ID: <20210220143749.omaoooquudaqiawf@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding support to overlay type in addition to primary and cursor plane.
The planes composition relies on the z order of the active planes and
only occurs if there is a primary plane (as in the current behavior).

The first patch decouples cursor from crtc_init. It initializes the CRTC
only with primary plane, and setup the cursor plane externally. This is
a preparation to allow to initialize the overlay plane between primary
and cursor.

The second patch generalize variables and functions names to refer to
any kind of plane, not only cursor. The goal is to reuse them for
blending overlay and cursor planes to primary.

The third patch creates a module option to enable overlay, and includes
overlay to supported types of plane. When the overlay option is enabled,
one overlay plane is initialized (plus primary and cursor) and it is
included in the planes composition.

This work preserves the current results of IGT tests: kms_cursor_crc;
kms_flip and kms_writeback. In addition, subtests related to overlay in
kms_atomic and kms_plane_cursor start to pass (pointed out in the commit
message).

Melissa Wen (3):
  drm/vkms: decouple cursor plane setup from crtc_init
  drm/vkms: rename cursor to plane on ops of planes composition
  drm/vkms: add overlay support

 drivers/gpu/drm/vkms/vkms_composer.c | 49 ++++++++++++++++------------
 drivers/gpu/drm/vkms/vkms_crtc.c     |  4 +--
 drivers/gpu/drm/vkms/vkms_drv.c      |  5 +++
 drivers/gpu/drm/vkms/vkms_drv.h      |  3 +-
 drivers/gpu/drm/vkms/vkms_output.c   | 31 ++++++++++++++----
 drivers/gpu/drm/vkms/vkms_plane.c    | 20 +++++++++---
 6 files changed, 76 insertions(+), 36 deletions(-)

-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
