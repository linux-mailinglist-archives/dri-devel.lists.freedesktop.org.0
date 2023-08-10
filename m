Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B75977882B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 09:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C34D10E67A;
	Fri, 11 Aug 2023 07:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A192910E5EF;
 Thu, 10 Aug 2023 20:16:45 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe0fe622c3so2038708e87.2; 
 Thu, 10 Aug 2023 13:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691698603; x=1692303403;
 h=mime-version:message-id:date:subject:cc:to:from:user-agent:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LcP6/gihYI3kLBbBHFTF24IF50Lr5xUUX6ydg05FQlo=;
 b=Z0m1UJALxdYe5PXargYxue9zOzYJ4iErJqG/bWrieSJfM6seflBymkZCrykNpQ1/yz
 5l0USSHzC7N29x1eiv5fz+Qx7DJT3eqhyTBYJ3T2zq3GzEkoJ2GXZ3X5SH8V7c1u736F
 VTlhwEIY9xWhR4MdP1LicqeIo8k+9G3Z6U283UMVs84XT1SNpO+AMSgjkV5SYFt14JX5
 EKUqARHonbihU4k7wDbx/hkktnQr93kwjvLvWKdx9E07WCiMpdNMW6OL4F2C4oCTlrDT
 lCqZzG9+1UFjBjd8PLFi/EEjtdqh6Kx2+kIYxcCjwUF6BZw9Vn3cLU/iGy9sZrB9/OK0
 MIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691698603; x=1692303403;
 h=mime-version:message-id:date:subject:cc:to:from:user-agent
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LcP6/gihYI3kLBbBHFTF24IF50Lr5xUUX6ydg05FQlo=;
 b=ZBl0V/VmZGkswnRFLBesCQ6vGG/XZ1TdPE+wTwyTGbQk87MncXUQrFEHD9jxDcDzai
 gimwyRlfqrwxhfSfSvS5fG8OnY7aqmga0zqdpDNrMn0nLegwyhKvpuTVhcdZqRO2ZKkN
 nYaUJOJHS9OamZKBuRjgUZTNLHkgs1u++7EOlxrZoMqnO3Ef4WbIJWCqxqr4WwLNTZv1
 mlPfTCI9G5hdA6/kkzZcPXLyus/jSYMhlTAEghsUVzaZIUlJ3aBBu5ftXb0AGfaNTcrb
 uC4c5NzBi8dJbkJutt4+Oir53Q1znZWeXw85cb57vnw/TU/UItE2SsFAiugdfh9XyXjk
 CQhg==
X-Gm-Message-State: AOJu0YzhuKvvtm0Lfr3tcN/CRyJIn77MGkbzfwKgzztjqNGfQlqoUVB+
 FuCnqsGJG1uU+pl7eIbkG3dww9+xOH0u7A==
X-Google-Smtp-Source: AGHT+IGBU9UfpHwTi/scygTsLzy0bhD3BMlBgMDxm30Hk4qAdgwzFvCJplgp/nM5Csbv3WHlE//S8Q==
X-Received: by 2002:a05:6512:3710:b0:4f9:596d:c803 with SMTP id
 z16-20020a056512371000b004f9596dc803mr2443161lfr.53.1691698603236; 
 Thu, 10 Aug 2023 13:16:43 -0700 (PDT)
Received: from razdolb (95-24-154-238.broadband.corbina.ru. [95.24.154.238])
 by smtp.gmail.com with ESMTPSA id
 x19-20020ac25dd3000000b004f864690901sm420781lfq.244.2023.08.10.13.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 13:16:42 -0700 (PDT)
User-agent: mu4e 1.10.4; emacs 29.1
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [REGRESSION] HDMI connector detection broken in 6.3 on Intel(R)
 Celeron(R) N3060 integrated graphics
Date: Thu, 10 Aug 2023 22:33:00 +0300
Message-ID: <87v8dmr6ty.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 11 Aug 2023 07:26:19 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following is a copy an issue I posted to drm/i915 gitlab [1] two
months ago. I repost it to the mailing lists in hope that it will help
the right people pay attention to it.

After kernel upgrade from 6.2.13 to 6.3 HDMI connector detection is
broken for me. Issue is 100% reproducible:

1. Start system as usual with HDMI connected.
2. Disconnect HDMI
3. Connect HDMI back
4. Get "no signal" on display, connector status in sysfs is disconnected

Curiously, running xrandr over ssh like

    ssh qnap251.local env DISPLAY=:0 xrandr

makes display come back. drm-tip tip is affected as well (last test
2023-08-02).

Bisecting points at a4e771729a51 ("drm/probe_helper: sort out poll_running vs poll_enabled").
Reverting that commit on top of 6.3 fixes the issue for me.

System information:
* System architecture: x86_64
* Kernel version: 6.3.arch1
* Linux distribution: Arch Linux
* Machine: QNAP TS-251A, CPU: Intel(R) Celeron(R) CPU N3060 @ 1.60GHz
* Display connector: single HDMI display
* dmesg with debug information (captured on drm-tip, following above 4 steps): [2]
* xrandr output:

    Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 16384 x 16384
    DP-1 disconnected (normal left inverted right x axis y axis)
    HDMI-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 708mm x 398mm
       1920x1080     60.00*+  50.00    59.94    30.00    25.00    24.00    29.97    23.98
       1920x1080i    60.00    50.00    59.94
       1360x768      59.80
       1280x768      60.35
       1280x720      60.00    50.00    59.94
       1024x768      75.03    70.07    60.00
       832x624       74.55
       800x600       75.00    60.32
       720x576       50.00
       720x480       60.00    59.94
       640x480       75.00    60.00    59.94
       720x400       70.08
    DP-2 disconnected (normal left inverted right x axis y axis)
    HDMI-2 disconnected (normal left inverted right x axis y axis)```

I'm willing to provide additional information and/or test fixes.

[1] https://gitlab.freedesktop.org/drm/intel/-/issues/8451
[2] https://gitlab.freedesktop.org/drm/intel/uploads/fda7aff0b13ef20962856c2c7be51544/dmesg.txt

#regzbot introduced: a4e771729a51

--
Best regards,
Mikhail Rudenko
