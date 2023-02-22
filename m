Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2889969FAD5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 19:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5B010E1C5;
	Wed, 22 Feb 2023 18:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4EE10E1C5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 18:10:40 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 az11-20020a05600c600b00b003dc4fd6e61dso7182963wmb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 10:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dleZbw/eEGeiucXqvjsy5z7gHU0To+Yc0D05RkN0EU8=;
 b=Fx9phWDaVoNiA4BDq9z0ixbwejMlYI6G9+S7rfJd8Iorq90RmnhFUQ9Xxv1s2JxsH9
 1+K/VXd71/y+0/AFo2vJDRB4fIU9dk/yLs2JTiOjWl9HVruSn4aHhGkM9BL4Ysuc4vQk
 gPGHHlmw6VLOfmIlZOzk5Eq4njlMo5Yr2RVj5X2Zz/5bRf6aAp6b56aYOeYjLWIWjS+z
 SGIUuiIT1l+UNN1JiGV24E9UMJmVmCblfyc/299M0+IQcF57tf9dcugGY5iYFkJ7Oejz
 kOa9TbFLojWN320wspo+MZroJSuWyQXYXPZW782ScTkK3Y/2t/4+/AQWnUSjwuOVKGqz
 ZtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dleZbw/eEGeiucXqvjsy5z7gHU0To+Yc0D05RkN0EU8=;
 b=ZlOgNOsX7fZAnji0s4KLR/ii3ExV4qy3WHbsqEc/Oy1n9XVenxkbmQ+TVA1apqyKA0
 iff0g79oFvbKC/VGCW+ZujSiqoYIwb3WQ2p4OFMKou+GyrtUbEOXJ6p0go0icqTrdIdO
 UAvt4bmZFw7z5spoYWx1NeT8ufARWODfzp2ftHd7cEQa2WvZExQE6ydf/ZatvO0ybaKz
 i50f/7wZyiUSwpWX+6dF9D29hshwFdrZxG/9h0Y7Ro7d2yuOmPxT0ecX65VY3hTnqb/E
 tbhwz2un3DpsM681nnwN51ewfNLyDVphuogXPYH8o2Ky8Huy1XO9+qB8bqHw1ZN8LChW
 aYdw==
X-Gm-Message-State: AO0yUKU5k8BqaZoQvs3HHcTgjWWn44JXvwJ+k1DJVIT2UiXBn119kc99
 OSowjwDwbxfThKRMlhga20MG5tXTakFxgQ==
X-Google-Smtp-Source: AK7set/SZcpnI5Z6AhSrdRqhHoEmk2SCzNS8OJ7/SN3uu0hcQEoHMz1WAhEZslkp7A2NO39meUc1Kg==
X-Received: by 2002:a05:600c:3093:b0:3dc:555c:dd30 with SMTP id
 g19-20020a05600c309300b003dc555cdd30mr609445wmn.27.1677089438561; 
 Wed, 22 Feb 2023 10:10:38 -0800 (PST)
Received: from shashanks-buildpc.. (i59F7AB0C.versanet.de. [89.247.171.12])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c229a00b003dc49e0132asm8276412wmf.1.2023.02.22.10.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 10:10:38 -0800 (PST)
From: Shashank Sharma <contactshashanksharma@gmail.com>
To: xorg-announce@lists.x.org
Subject: [ANNOUNCE] xf86-video-amdgpu 23.0.0
Date: Wed, 22 Feb 2023 19:10:33 +0100
Message-Id: <20230222181033.79958-1-contactshashanksharma@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: alexander.deucher@amd.com, xorg@lists.x.org,
 dri-devel@lists.freedesktop.org, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alan Coopersmith (2):
      Update URLs to reflect gitlab migration
      gitlab CI: enable gitlab's builtin static analysis

Kai-Heng Feng (1):
      Initialize present extension for GPU screen

Lukasz Spintzyk (3):
      Use randr_crtc_covering_drawable used in modesetting
      Prefer crtc of primary output for synchronization when screen has to crtcs with the same coverage
      Do not consider disabled crtc anymore when looking for xf86crtc covering drawable.

Mario Kleiner (1):
      Fix primary output handling in amdgpu_crtc_covering_box().

Pierre-Eric Pelloux-Prayer (1):
      Use DRM_CAP_CURSOR_WIDTH/HEIGHT if possible

Shashank Sharma (2):
      config: Add hotplug driver name
      Bump version for the 23.0.0 release

tiancyin (1):
      Fix screen corruption on secondary GPU

Łukasz Spintzyk (1):
      amdgpu: fixup driver for new X server ABI

git tag: xf86-video-amdgpu-23.0.0

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-23.0.0.tar.gz
SHA256: 08c38287d39b999fd61ecb6e7b23d5079762e2b4b2179b3567973ed9aaf71222  xf86-video-amdgpu-23.0.0.tar.gz
SHA512: ea4843bf10e12ede71a338f84bc667fe80b75de88e677161811a3de4647382bbfe44b720439e2ea7768961b8a7f9cc31362da454038921ec2c577f4955476eec  xf86-video-amdgpu-23.0.0.tar.gz
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-23.0.0.tar.gz.sig

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-23.0.0.tar.xz
SHA256: 4f04f0ea66f3ced0dcc58f617409860163a19c4e8c285cfb5285f36ba09cc061  xf86-video-amdgpu-23.0.0.tar.xz
SHA512: bf26f147629a34e84a0ae8435119e170b9c95edafcab1995b63bb8f55abef32f2efbf4536eb070e64b2ae1460424b1b27a4206cb9836d33ddc6dfbee404f718b  xf86-video-amdgpu-23.0.0.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-23.0.0.tar.xz.sig

