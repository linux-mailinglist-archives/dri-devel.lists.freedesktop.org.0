Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19047F925D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 11:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4C910E0E1;
	Sun, 26 Nov 2023 10:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4E210E0E1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 10:55:06 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54b0e553979so1877251a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 02:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700996105; x=1701600905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ECypgGqHQBjY12h9Higzn7Wesb+tD2zqqv/5yygreuE=;
 b=NBJJzJKU1PCsiaVchQEGwq4g78SxW9UQp6m79/LZsgLiB85GNGli7yTTFRpAWgnWgU
 DWFVVRxeERCz+X+PK3aNMpDrONYhPOl4FKhoUig4gItdwtYJeKZFodsYmgNj+ODk3THZ
 SCg/wlu8vs7juG1WQZGlHpJITmQlDxk2IT+hTQLpJYr/51SqPlCUC1kXRY1Il3hI5wzL
 NFfRul/50tFkvoWByDM/w86dqFXlb5oI1Pwbs7fF0pCqY5Lh/h3Kyl/6+XpsEEuZcq4k
 stAZJMzZ0yMVAMDq2RAjFFuS1SVI8s+2yQV2X//qAP4Af59M8857V0bacrlm1KxMH+oJ
 WvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700996105; x=1701600905;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ECypgGqHQBjY12h9Higzn7Wesb+tD2zqqv/5yygreuE=;
 b=nUvcoYxE+uoumYFmbM4OdUMhCvFhKNOz6q18MxfvCqpeJCngsySfGa2Wlaba9+CwBi
 uz2BKJ4+E4d0+NS3H1UAI8EYA7+/wBslZQPUoJE8TcnZ98mhEYtPFmxvcfviS0Gu5pH/
 bM21Sb+1ccF7Dq4UHIg+PskXJmI7WHWCjoQOG19sRYWhzFrM+nA06p1tjL3DvxNnoLEt
 DZ4iSW3VpWAxvczd81S5VpT6ftu6aTFzFU4L4JTIfXRgrd7n1HdDQoul/8EWAs2eyJWS
 U5yC1Qcy6KcTagXs1hmfPuoj2aTuC/b2v+kE5jjv3t/bhA3eNANJPBeCYXd4w9lOate2
 egiA==
X-Gm-Message-State: AOJu0YxEgMEpPCl4EuR7rFVtAwdmlKkjyPNV2x8OBlYo6DScOtGDWG1k
 fiUcpZdJG7BZT9BdNEXkeNI=
X-Google-Smtp-Source: AGHT+IGiaTC1sEjY/oPRpZNJ/wG8qGzhgZcG+LcLHsvxUX+adjVG4+rn73MntzJa0aF9TUzUUGhkpA==
X-Received: by 2002:a17:906:209:b0:9be:2991:81f9 with SMTP id
 9-20020a170906020900b009be299181f9mr5808853ejd.1.1700996105077; 
 Sun, 26 Nov 2023 02:55:05 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a170906080800b009fdc15b5304sm4437938ejd.102.2023.11.26.02.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 02:55:04 -0800 (PST)
Message-ID: <2601b669-c570-f39d-8cf9-bff56c939912@gmail.com>
Date: Sun, 26 Nov 2023 11:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 0/3] Rockchip inno_hdmi update
To: hjc@rock-chips.com, heiko@sntech.de
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Combined update for the Rockchip inno_hdmi driver in a
somewhat similar way to what is proposed for the
"Create HDMI Connector infrastructure patch serie".
Keeping the inno_hdmi and rk3066_hdmi driver functions
comparable makes maintanance easier.

Maxime Ripard (3):
  drm/rockchip: inno_hdmi: Remove useless mode_fixup
  drm/rockchip: inno_hdmi: Switch encoder hooks to atomic
  drm/rockchip: inno_hdmi: Remove unused drm device pointer

 drivers/gpu/drm/rockchip/inno_hdmi.c | 56 ++++++++++++----------------
 1 file changed, 23 insertions(+), 33 deletions(-)

--
2.39.2

