Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4AC8585B1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 19:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E19410E16F;
	Fri, 16 Feb 2024 18:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XMogJAwC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C94010E16F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 18:49:22 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5639ffbcc10so2819043a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1708109360; x=1708714160;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TctOHt5QHOeXjZd3OaTcubVZZYjcDJg0x4zvjdZgL3o=;
 b=XMogJAwCS7PaUuJS5qGcXVHjcVgLOQzqJrbW9yvC0CjMjfIb9e8WLsM3Y8NwzoER8Z
 ysdK6TaF8uFGbktpma7qbq7Quo3kjRGqGO3C9prVxyWJWhNWhsZefFnJNf8/SrvrOfR7
 pbXhB4V/9UEfk7cNke/ZvLjWbKPTfL/ZjBCtS+6b4VEQ5Ms/d0carhbfXGhWkxqkefx7
 s5iIbnswzhTCsPScCLnncjCTW/1i6IwNiSH4LtiFRhVDisDGhh4soBaMIksmkY8EdHB4
 M26aqdMzEgXxGKRsW1JFmhMZ7KBPczUOhwqvwGM4odZFZYrBNIYJDk3T1DVidbDUTJzW
 Jk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708109360; x=1708714160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TctOHt5QHOeXjZd3OaTcubVZZYjcDJg0x4zvjdZgL3o=;
 b=MdZh1LWtuBTYEkJUvtdKFbz9m0cO8yYWYbQ6jnJVbj4l8otGjAV7YW8DkDui1IOmWh
 meWKTWyeL60PgGMmBBe13uI1MZL/Yqwt/5hxf/GqSLbaXUf2DqgZFH4+wwoAkpGpZmfN
 0Ty6P0Hq96vJ5gP8y9lENipk7RI2oCsKQ1u2H6XSlZeIlGjCOgrhz6tnTXfJMw6T26IF
 X9AnrKr+4MW/c5QRmMG+6dYqucr5rau5f8xIuLPxw8C9NgwYg733+ywZrT/Z4rLd1j69
 14Gnp3IPYQRhboOcC71IDu1GURFMOq0wKmBkau364Ufu9FIq7HIyzBSkmH+mCcbvshI3
 UmMg==
X-Gm-Message-State: AOJu0Yx2kgXNWPqFbNnma8Kt9m0T16rAVL2tZXpjKx87QZm7QnVAji2a
 zBHWn/+t5GJlBc2lb59XtsdgXbk4nXn554dG14FwWqCNIxi8RPo11pD/U5NstVrV9QR6pvXCRp5
 E
X-Google-Smtp-Source: AGHT+IFX02OsUVIUGr+QIvkcxdgRXYcm+qe/AWVBljvA45jMw0RHjCGsDouXbrO5wlj2KkQ4AKiWNA==
X-Received: by 2002:a17:906:6617:b0:a38:99ae:da8b with SMTP id
 b23-20020a170906661700b00a3899aeda8bmr3866835ejp.56.1708109360535; 
 Fri, 16 Feb 2024 10:49:20 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([188.39.149.98])
 by smtp.googlemail.com with ESMTPSA id
 tj1-20020a170907c24100b00a3d1b3c5f1esm235108ejc.77.2024.02.16.10.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 10:49:20 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/3] vc4 VEC (analogue video) updates - margins and monochrome
Date: Fri, 16 Feb 2024 18:48:54 +0000
Message-Id: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All

A couple of patches to vc4, including adding a new "TV mode" enum for monochrome
output (yes we have some users who wish for monochrome).

Adding mono has raised a query here as to whether the the TV_MODE is meant to
describe the timing, or just the colour encoding.

The description for NTSC references "CCIR System M (aka 525-lines)", and PAL
references "CCIR System B" which is the 625 line standard.

PAL-60 is absent from the enum, but support has been added to vc4 by selecting 
DRM_MODE_TV_MODE_PAL but with the NTSC (CCIR System M) timings. Is that the
correct implementation? In which case the description for PAL should drop the
CCIR System B reference as selecting the "TV mode" doesn't dictate the timing.

Monochrome is in the same boat as it can adopt either 525 or 625 line timing,
or indeed anything else. Pi5 can support System A 405-line and the French
819-line mono modes as well.

If "TV mode" does dictate the timing as well as the colour encoding, then we
need to add PAL-60, and 2 modes for mono (extending to 4 for 405 and 819 line
modes later). If not, we ought to update the description.

Thoughts?

Thanks
  Dave

Dave Stevenson (2):
  drm/vc4: Add monochrome mode to the VEC.
  drm/vc4: vec: Add the margin properties to the connector

Nick Hollinghurst (1):
  drm: Add DRM_MODE_TV_MODE_MONOCHROME

 drivers/gpu/drm/drm_connector.c    |  7 +++++++
 drivers/gpu/drm/drm_modes.c        |  5 ++++-
 drivers/gpu/drm/drm_probe_helper.c |  5 +++--
 drivers/gpu/drm/vc4/vc4_vec.c      | 30 +++++++++++++++++++++++++++++-
 include/drm/drm_connector.h        |  7 +++++++
 5 files changed, 50 insertions(+), 4 deletions(-)

-- 
2.25.1

