Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D7D60C44E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8C510E15C;
	Tue, 25 Oct 2022 06:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B1310E399
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:35:42 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id m6so8775114pfb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zcdfaNsoIuuSNF9XByhbeUp3KpNdfCPWzGZ8aF5nLxA=;
 b=A/SaFlQiUebp/U4yUjESResGqrVwntBISSfqBzWDzKJibVbtIVr9UUfU6mxLj07U3t
 BF1P1ziYSaSoZu2hLeXkqtIzAlvAh0MFneC+wQBMWmi0FH1LXXFBqHadJUpo8KeJTncO
 UfWe0DIEAPCTW/sCTy15HwE2CBjAb+Rx1eEUSB+NNH260sZc5OtfAVjOXussqn3KA347
 PpO/tyEscshRJ9N6nCBeacKW6fv3Tw1lcWUes4Zil4fK5WzarbbrLQTA4j7+JXjg1OB5
 Nl7VXtFCfuFWoaeikVJ/SxvLnxREoubYa0ceNbAiLW7yzBhF70OMrb+09Y3IJKqA+AuT
 576g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zcdfaNsoIuuSNF9XByhbeUp3KpNdfCPWzGZ8aF5nLxA=;
 b=Wtz0kcDHiBfBr71Esk4U31TGXqBP68/OXnvqzkb6Ykaau324SPCVmgT0vSiGfvUGpY
 4IXzCIKteTYQBEPu+6LkIUnyo5eXNR2FKxyjsdO37CmBl/Kht6cVDJOa212cvahOSM17
 aOBEbv+VIAPTVYdbiXGg+hu82btVKwEjh02YUW7mmKF7hhoGmcXJSbAaMSVshcr816PR
 hdzzve+obR2Kaiip/8/xZHHOMrIMkzs+n9vseUdi5ScVi2cnpp2CUl6TWiIhLVqMczyu
 hoMn9QG1Wdi+02Iq8Z2XUcsgM6cbSarsdpKtIT2t8FSTB+QDt5NedkRKI6Ji3eAJeJEr
 U16Q==
X-Gm-Message-State: ACrzQf3+PGJZO0wKD9szoIi0THbTZ/MKTYizM/qsB+plL1EqSLevo+cQ
 Xfi50FGZrq+SiE5YruZmfr8g9Q==
X-Google-Smtp-Source: AMsMyM5stq/ljVzMueZdUgOUcwUqYp0qFBFo+CXciS0i44pLthcVHJASa5mVlU8sjRqgQycqku2BPA==
X-Received: by 2002:a63:2345:0:b0:463:7c74:73b with SMTP id
 u5-20020a632345000000b004637c74073bmr28176901pgm.39.1666611341111; 
 Mon, 24 Oct 2022 04:35:41 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:35:40 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 00/22] Fallback to native backlight
Date: Mon, 24 Oct 2022 20:34:51 +0900
Message-Id: <20221024113513.5205-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Oct 2022 06:54:01 +0000
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
Cc: linux-fbdev@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Azael Avalos <coproscefalo@gmail.com>, Mattia Dongili <malattia@linux.it>,
 Daniel Dadap <ddadap@nvidia.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Woithe <jwoithe@just42.net>, Jonathan Corbet <corbet@lwn.net>, "Lee,
 Chun-Yi" <jlee@suse.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Robert Moore <robert.moore@intel.com>,
 linux-acpi@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
 Len Brown <lenb@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, intel-gfx@lists.freedesktop.org,
 acpi4asus-user@lists.sourceforge.net, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 platform-driver-x86@vger.kernel.org, devel@acpica.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net, Jingoo Han <jingoohan1@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 2600bfa3df99 ("ACPI: video: Add acpi_video_backlight_use_native()
helper") and following commits made native backlight unavailable if
CONFIG_ACPI_VIDEO is set and the backlight feature of ACPI video is
unavailable, which broke the backlight functionality on Lenovo ThinkPad
C13 Yoga Chromebook. Allow to fall back to native backlight in such
cases.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Akihiko Odaki (22):
  drm/i915/opregion: Improve backlight request condition
  ACPI: video: Introduce acpi_video_get_backlight_types()
  LoongArch: Use acpi_video_get_backlight_types()
  platform/x86: acer-wmi: Use acpi_video_get_backlight_types()
  platform/x86: asus-laptop: Use acpi_video_get_backlight_types()
  platform/x86: asus-wmi: Use acpi_video_get_backlight_types()
  platform/x86: compal-laptop: Use acpi_video_get_backlight_types()
  platform/x86: eeepc-laptop: Use acpi_video_get_backlight_types()
  platform/x86: fujitsu-laptop: Use acpi_video_get_backlight_types()
  platform/x86: ideapad-laptop: Use acpi_video_get_backlight_types()
  platform/x86: msi-laptop: Use acpi_video_get_backlight_types()
  platform/x86: msi-wmi: Use acpi_video_get_backlight_types()
  platform/x86: nvidia-wmi-ec-backlight: Use
    acpi_video_get_backlight_types()
  platform/x86: panasonic-laptop: Use acpi_video_get_backlight_types()
  platform/x86: samsung-laptop: Use acpi_video_get_backlight_types()
  platform/x86: sony-laptop: Use acpi_video_get_backlight_types()
  platform/x86: thinkpad_acpi: Use acpi_video_get_backlight_types()
  platform/x86: toshiba_acpi: Use acpi_video_get_backlight_types()
  platform/x86: dell-laptop: Use acpi_video_get_backlight_types()
  platform/x86: intel_oaktrail: Use acpi_video_get_backlight_types()
  ACPI: video: Remove acpi_video_get_backlight_type()
  ACPI: video: Fallback to native backlight

 Documentation/gpu/todo.rst                    |  8 +--
 drivers/acpi/acpi_video.c                     |  2 +-
 drivers/acpi/video_detect.c                   | 54 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_opregion.c |  3 +-
 drivers/platform/loongarch/loongson-laptop.c  |  4 +-
 drivers/platform/x86/acer-wmi.c               |  2 +-
 drivers/platform/x86/asus-laptop.c            |  2 +-
 drivers/platform/x86/asus-wmi.c               |  4 +-
 drivers/platform/x86/compal-laptop.c          |  2 +-
 drivers/platform/x86/dell/dell-laptop.c       |  2 +-
 drivers/platform/x86/eeepc-laptop.c           |  2 +-
 drivers/platform/x86/fujitsu-laptop.c         |  4 +-
 drivers/platform/x86/ideapad-laptop.c         |  2 +-
 drivers/platform/x86/intel/oaktrail.c         |  2 +-
 drivers/platform/x86/msi-laptop.c             |  2 +-
 drivers/platform/x86/msi-wmi.c                |  2 +-
 .../platform/x86/nvidia-wmi-ec-backlight.c    |  2 +-
 drivers/platform/x86/panasonic-laptop.c       |  2 +-
 drivers/platform/x86/samsung-laptop.c         |  2 +-
 drivers/platform/x86/sony-laptop.c            |  2 +-
 drivers/platform/x86/thinkpad_acpi.c          |  4 +-
 drivers/platform/x86/toshiba_acpi.c           |  2 +-
 drivers/video/backlight/backlight.c           | 18 +++++++
 include/acpi/video.h                          | 21 ++++----
 include/linux/backlight.h                     |  1 +
 25 files changed, 85 insertions(+), 66 deletions(-)

-- 
2.37.3

