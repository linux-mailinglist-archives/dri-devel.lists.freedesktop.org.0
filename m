Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7FD15A345
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928AD6F489;
	Wed, 12 Feb 2020 08:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc30.google.com (mail-yw1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256C96F423
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 18:48:26 +0000 (UTC)
Received: by mail-yw1-xc30.google.com with SMTP id n184so5692233ywc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 10:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=+kQqg894ymcaPpTU+slbxV54o97AEArgCde/E/E3bK8=;
 b=FZKGrFc5FVnFTZZQnm3tPFg0oD94ghQ5VqaGUx2qBVBlU4FBgKsQXLzTmXhI+totLr
 3J1YcvUYg/r65kODV/71Vu55zJ600BnoSTl4jWLwqgwd8exJy5o2qpqzwQyBykWoDvVo
 Vsru6M9oY+ION7cV0s5uXU7gvO8aw9EEwW+4FC2q4e5wfxrj4WAzq+d1jhHkJ52jUKoi
 6XuFNWndwgXP4B9CyYJ7mWKt6In4v2VahQyNqrc3hh+grUQo/HzOcH/E96FqibsKky49
 syD7h+kJeiEdjBf8zW6vCx799/LSIo6o3uPIkhHu2U/QxP8sp2UvBOQ9DOy8Q5jNZDa1
 S6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=+kQqg894ymcaPpTU+slbxV54o97AEArgCde/E/E3bK8=;
 b=VsKWm0DCU4EjLs1JKm9UDwP3R6jwV4F8zcZHr/hiEAjnegr7wmWfsbRzO/o7zMy1Hv
 4rRg7VeVYa6RFJfr+05Rdo7voPfh25pqftAqW3RV27pKlw6mvj3S8NGlmwRAQkGvY4kP
 sV79FIZkKqk4ZzofKhB8Dm5V+e9FrXdmb2xNcSf4a8bXjt9vthE+j4V0WTMZS+CptXGY
 rUqMrpM0rrNkNl87DLzsIVARz3qtHEws23CMvUOJlWR5pRlDmdi3uQlemOPywMM1xzLM
 qchwNlC6Y0hvLZYZcrciq0AhsCWdQH5wSsnlUWA7l/jPjpEe345wJfe83mXHYx+wx/jI
 +82w==
X-Gm-Message-State: APjAAAWd2p2+vUSlrotE4A+7Zg95I/vezPtO0hn3pOf8PuBiVB6HjOD8
 iFiq7mdM2laEuujNEXui7IM=
X-Google-Smtp-Source: APXvYqz+yitDKBvBiImcBkAM8FgYP/5DBkRVCPyXQDlV/fhwFrrf9G3aKZAZ7P/sM9vt68EBYj8tTA==
X-Received: by 2002:a0d:c4c1:: with SMTP id g184mr6620334ywd.305.1581446905354; 
 Tue, 11 Feb 2020 10:48:25 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net.
 [73.88.245.53])
 by smtp.gmail.com with ESMTPSA id d9sm2242276ywh.55.2020.02.11.10.48.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:48:25 -0800 (PST)
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
From: Frank Rowand <frowand.list@gmail.com>
Subject: build error: f7655d42fcee drm/edid: Add CTA-861-G modes with VIC >=
 193
Message-ID: <4e918a35-dbcd-b2fd-1888-a86e7d448128@gmail.com>
Date: Tue, 11 Feb 2020 12:48:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I am getting a kernel build error at version 5.6-rc1:

drivers/gpu/drm/drm_edid.c: In function 'cea_mode_alternate_timings':
drivers/gpu/drm/drm_edid.c:3275:2: error: call to '__compiletime_assert_3282' declared with attribute error: BUILD_BUG_ON failed: cea_mode_for_vic(8)->vtotal != 262 || cea_mode_for_vic(9)->vtotal != 262 || cea_mode_for_vic(12)->vtotal != 262 || cea_mode_for_vic(13)->vtotal != 262 || cea_mode_for_vic(23)->vtotal != 312 || cea_mode_for_vic(24)->vtotal != 312 || cea_mode_for_vic(27)->vtotal != 312 || cea_mode_for_vic(28)->vtotal != 312
make[4]: *** [drivers/gpu/drm/drm_edid.o] Error 1


Kernel configuration:
  make qcom_defconfig

  (arch/arm/configs/qcom_defconfig)


Compiler is arm-eabi-gcc 4.6.x


The build error goes away if I revert:

   f7655d42fcee drm/edid: Add CTA-861-G modes with VIC >= 193


The build error also goes away if I comment out the two lines added to cea_mode_for_vic():

 	if (vic >= 193 && vic < 193 + ARRAY_SIZE(edid_cea_modes_193))
 		return &edid_cea_modes_193[vic - 193];


-Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
