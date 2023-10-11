Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C147C5712
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 16:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F158510E4E9;
	Wed, 11 Oct 2023 14:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8122810E4E9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 14:38:12 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53db3811d8fso2232825a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697035091; x=1697639891; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0vZToVsgXRWZfLo5rsOcN+LGMRHmIudHJDej1lZABCM=;
 b=CYVQYMicJosEo3IVQO/WpzWYpoLbodCLENUU0NNleozs3UuH1RCVrfzQlbQpvu+aie
 PpRHnwAbpGL2E9scUNoPIdH+5HBTl+31gvYl8zSdavaD83AYU1+l8ByMxqxgaoKPmtSO
 8UCPFjlS2xqfyf835v1hMxamRErguDMe2qT2fM2gLWZzKavraOjQXpbzwcacmDKxI50N
 at32eMLCC+yh+15TfzcpSjcWtuUV6DqXDFiF2O8C9gY6Oc2NSK37gRN1APM2cUD7EQz9
 C5cQTLP9JBpIaEn+gx08qspMsYLMgM0Q8D+lxa4OPtVqZH0gFNnDh0jr2t7nWsf8kYWM
 Uscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697035091; x=1697639891;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0vZToVsgXRWZfLo5rsOcN+LGMRHmIudHJDej1lZABCM=;
 b=GnA7zMwgGwtFESYlkKCli+7KAoRLzt9h798BhoUSlnBFJz+KQX3dPqBEgTu1toi1Xx
 W+nn+yLktNemQSOUTQVNLkELDKjeiCWr0ilUjEgMKzTrrx7oAMSsNywbeNJ229yyzCC+
 k2w5jeY7Tvn60dbTS14zZcOpxWC/yTWcWCmBGKeIqRUoLqPBRzOhluAhyV7sNLJ47QwD
 VCOWJd3p724vVZPQEKlh6hb0sfrLx4UbIlQjERPAMU4fQ2ET+2CsumeSCizh4q0vNrxZ
 m09Lczq5pyIh+uVxb4cXUrUA+cJkMW1QHz+zG3svbYp4f7as2wflWbAY84odOpv3ggXe
 Lygg==
X-Gm-Message-State: AOJu0YzovtDulAwUFs8bzs1ho5t/LV2Z8yrStitGa+qu6cZzz/OC77oF
 /i3QJh3mhKBS17uo6bOl1v0=
X-Google-Smtp-Source: AGHT+IEgMDBcdZeBV7mjfwI0zrFa57ZIWS69YdUT342bDnOI5fH1lDw2opQoqPAh1K00pWXBJvDyrA==
X-Received: by 2002:a50:fb0c:0:b0:530:8759:a3ac with SMTP id
 d12-20020a50fb0c000000b005308759a3acmr18356337edq.2.1697035090568; 
 Wed, 11 Oct 2023 07:38:10 -0700 (PDT)
Received: from localhost
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 d5-20020aa7ce05000000b005346a263bb1sm8872167edv.63.2023.10.11.07.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 07:38:10 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH 0/2] fbdev/simplefb: Add missing simple-framebuffer features
Date: Wed, 11 Oct 2023 16:38:07 +0200
Message-ID: <20231011143809.1108034-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: linux-fbdev@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Hi,

This contains two patches that bring simplefb up to feature parity with
simpledrm. The patches add support for the "memory-region" property that
provides an alternative to the "reg" property to describe the memory
used for the framebuffer and allow attaching the simple-framebuffer
device to one or more generic power domains to make sure they aren't
turned off during the boot process and take down the display
configuration.

Thanks,
Thierry

Thierry Reding (2):
  fbdev/simplefb: Support memory-region property
  fbdev/simplefb: Add support for generic power-domains

 drivers/video/fbdev/simplefb.c | 128 +++++++++++++++++++++++++++++++--
 1 file changed, 121 insertions(+), 7 deletions(-)

-- 
2.42.0

