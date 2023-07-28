Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA169766673
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 10:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0939E10E686;
	Fri, 28 Jul 2023 08:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5A210E682;
 Fri, 28 Jul 2023 08:09:40 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf15bso20579305e9.1; 
 Fri, 28 Jul 2023 01:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690531779; x=1691136579;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GqLr/DM3vzoT2FIGmxl1EtsMfdCCfHjdp08hXZT3Xyg=;
 b=jNqp0QPCVYTkV4bvppxC/WE1D3dThiR6UKFK8p4qV3WMajrs8aXfR/yEOGVVt4WO/4
 C6lj+p89l37MtuxXWAebhshvKx83b6ctlrKZ3CD7QWkKwaUrDUSdAhTUkL5JZllRwaIn
 aUO/FOw/zeur8egsp7p8tXrfbkQm2MAPBeeKrptG93bsgZA/gRiHUfaZXvUwjeD9JUty
 PZXizjxorCUDAclhWNrac3NH1InWJ9R9WrAat5wjHGfPbEQyyaYYdn/ntfYc9fC8ZlFj
 2jP6M0Ff0Led0BcYGs2Hc3hK+Sblib/akOE7NoPjHj59JUM1ML9mw3yh6Xauefqt8RMT
 9fPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690531779; x=1691136579;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GqLr/DM3vzoT2FIGmxl1EtsMfdCCfHjdp08hXZT3Xyg=;
 b=RpERCx05tusiJdUamHklthkOPMfH19QnmgsNbQ1jEm03SBsBAOnyKqyXX4+zsd1kqR
 VZ8mOfnvLW93NIHMleY9hZ8X2ZKKbRkimWHOaVlMJsNyqTWhzoivBt22PSf2ujnm5jLC
 OrL0aIFhgkzTuZ/qECgCvrGZ+Mp4Gz+F7XcZKx9zi9mPWzyDjnRO2212a3iBWuHfwYOn
 bEpKyuOmsV66AyKLzWJFHJkvjagOPh/eWaDIW+BAQaqmRqdjkpzgBrXZ5rr5OrLWY1RJ
 xQyO1bBfRaTlgFTLnJK42/S1JGQ+YSMKuzLwmba33o8xT3UOL4T9qyfk2SWI8+x02B3R
 xqlQ==
X-Gm-Message-State: ABy/qLYAojqQTD4ih5VVDS6Ou/kS854BeDKbT18x9VHfQPjlN+5dFeGN
 Faqx3zA6RxeFtbjJ0xGugtfgfXeAEotHDg==
X-Google-Smtp-Source: APBJJlFQW3i7+kOV3XLOmwouH4a0XHOhL2g3BliaVEr4MqWslzbF6GJX6aD17eqL//lIKPOLtJwD6Q==
X-Received: by 2002:a7b:c853:0:b0:3fb:b67b:7f15 with SMTP id
 c19-20020a7bc853000000b003fbb67b7f15mr1289443wml.21.1690531778542; 
 Fri, 28 Jul 2023 01:09:38 -0700 (PDT)
Received: from [192.168.0.101]
 (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
 by smtp.googlemail.com with ESMTPSA id
 f21-20020a7bcc15000000b003fd32074e74sm6447479wmh.31.2023.07.28.01.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 01:09:38 -0700 (PDT)
Message-ID: <29e17fa4-0dc3-2542-f303-7dceb1ed16bc@gmail.com>
Date: Fri, 28 Jul 2023 09:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Subject: drm/nouveau: fan:
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

static analysis with cppcheck has detected an issue in function 
nvkm_fan_update() in drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c as 
follows:

         /* schedule next fan update, if not at target speed already */
         if (target != duty) {
                 u16 bump_period = fan->bios.bump_period;
                 u16 slow_down_period = fan->bios.slow_down_period;
                 u64 delay;

                 if (duty > target)
                         delay = slow_down_period;
                 else if (duty == target)
                         delay = min(bump_period, slow_down_period) ;
                 else
                         delay = bump_period;

                 nvkm_timer_alarm(tmr, delay * 1000 * 1000, &fan->alarm);
         }

Checking drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm107.c ...
drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c:93:17: warning: Opposite 
inner 'if' condition leads to a dead code block. [oppositeInnerCondition]
   else if (duty == target)
                 ^

The first if statement checks if target != duty, however inside the code 
block there is a check if duty == target which can never be true. Either 
the logic is wrong, or the duty == target can be safely removed.

Colin
