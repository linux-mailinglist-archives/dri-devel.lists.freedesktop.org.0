Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C893C59C0B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 20:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1329810E1AA;
	Thu, 13 Nov 2025 19:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HIzQEUao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5B810E1AA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:32:08 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-7c70eae77d7so335068a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 11:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763062328; x=1763667128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lw/U+z5I4kWuL5rL8h4E+nT2ml8zVb8Mlz2CECK2kyU=;
 b=HIzQEUao1+S2rnKNu5B2X92dfadfuf2i2uMW9k2KT3IpCSt0DDWS6wqe32bOUTGpkL
 QxcOH0j8egfiPzl25XpNsq37kwtCyG96sZ4F3c5+oWqm8Wp9TCM4MCiou2os6HcD5plX
 fhHXu8fWwNJjEDysjXTsNSnTsCNpN1MYSUDIahtWr18gNerWx5VO1DozINq+oGfU+JRk
 vViBFfJfR0vjVWZpYkcCUIQ3dTPryLSEXTRBBKa0nGhsdEnvhU1UxiPloZZyS1Yx8LqS
 u7VbUD9A1DqA77dE5tlDFhPgvLJ9hvAe3qTPNtPOs8WnKLuoLOyW1rov5mi1fAUXIJeg
 T15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763062328; x=1763667128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lw/U+z5I4kWuL5rL8h4E+nT2ml8zVb8Mlz2CECK2kyU=;
 b=FPs1UQx6/Q2NlhFbwqNU3iAZkhnAfcymx8SZQlBsjf86PF/76QyE7RHDoXuF0lj2/B
 XdbAODN/H0luDCajqYu6xYeOykKTkO6uKyizs7nnqBLJQsVV00o19nt4VniAQ5B/9dGw
 VqyQlAzyacymSrxXzkcC/t4iKczCf6hEY5xoMEKaJac3k2loxpI+C2X181NIlc9M0D9r
 IICdj6qgnv8hI3V1T7Qj9WgRLL0EsdvOaB+3xvyzrY2fmdRRxZEpK9h8wPp1nbvdhZCy
 Am7rUXR0rFXQdIqDZJWY+6bfqEY62azbBmWOUObyU98uL+BM1443Tz8mfTJ5M2IJNRjC
 OwCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+fZpa1rSAwH7/BPghxVeYF/VxPmCmDU7Ip5vc58Z+R8UNuZzyMvNmKLurcavKy0Q53C5x49RP/pY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2j9MOWlz9+Li7wSEGxVvl4W9AsrLWMnorInGfY1ufFiseTH19
 KhLpkrY48qI+j7RoWAUaT1EEWrjlspJW6l/uDylRRL0FTaAv/kc1Ik4R
X-Gm-Gg: ASbGncvkG3JkkEh4+5HedowzIJOhPQ2UaQxVFdvxS2W16b6sY055GhglAf6sZVXq7ZD
 9fZJFSfZyM/iDpO22oKSfFQ0k1Txhr6Hj/CchXBFQiV4D7sFucHGhXbfPaEY4dVTA1qVM0e/u0O
 /K2vhN3ZMAQerUY7+qVZIFUM6ui8n1onyNii7Nq1FUHJJQJ6szDNimvjPvzQkaInSbCXGG1YmUz
 lgQna8lbrsLJOXBNXZMJw92lV/a2TM01Rjd/LE9xcb2hcPiy6+PnCLSeNX3UTO7XxNrGFXVDtTi
 5vIs7SbDrJeYuNw8yN2nH2d/SSuMR/MOolcsLnPSL35GwBHCVQA6pf6S0Wt3bxr5EOsoIHdc6kH
 +/gXBU72NmvePJZZ3v/hRrJIcYpiz9kLBpmjv95ewk8sxjPoUd4qS7oR8Vej1laTzawVxr2SGex
 rNg7YI0FfD
X-Google-Smtp-Source: AGHT+IFEgyX0ltKX3lDaJ+pACBb477rkzx0l2ZFB+JcPMhVtmDYkqFRhnbMiih50devZNHV+aa6GYw==
X-Received: by 2002:a05:6830:25d6:b0:7aa:4e01:f57d with SMTP id
 46e09a7af769-7c7444fe486mr424984a34.18.1763062327571; 
 Thu, 13 Nov 2025 11:32:07 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7c73a392fa5sm1693527a34.19.2025.11.13.11.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 11:32:06 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mripard@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, rfoss@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, neil.armstrong@linaro.org,
 heiko@sntech.de, sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 0/3] Add HDMI for Gameforce Ace
Date: Thu, 13 Nov 2025 13:29:36 -0600
Message-ID: <20251113192939.30031-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the micro HDMI port for the Gameforce Ace. This port does
not have a HPD pin so it requires making changes to the HDMI controller
to support this configuration.

Changes since v1:
 - Simplified checking of no-hpd parameter and changed to
   device_property_read_bool() function.

Chris Morgan (3):
  dt-bindings: display: rockchip: Add no-hpd for dw-hdmi-qp controller
  drm/bridge: dw-hdmi-qp: Add support for missing HPD
  arm64: dts: rockchip: Add HDMI to Gameforce Ace

 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |  6 ++
 .../dts/rockchip/rk3588s-gameforce-ace.dts    | 63 +++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c  | 32 ++++++++--
 3 files changed, 97 insertions(+), 4 deletions(-)

-- 
2.43.0

