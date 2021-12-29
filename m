Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23986481592
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 18:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF40010E21C;
	Wed, 29 Dec 2021 17:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8892710E21C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 17:04:31 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id f5so88539951edq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fairphone.com; s=fair;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2ieMbS+0D70pohooVgVjI3yQAHsrI5Yv9aY0un0BvWo=;
 b=xhe6pIARJ6nLxgaxAop08bsGSZx7Kd1UHcvKv5ZPM0idYz9aF0B/bEfVlj/jBvPEtv
 EL+qyUCy17ZT5uW1wjT7/JjXHAAC22rkvHyo8Q2cuyrY5hEzFKU2LMuuPt/bEIBXMBcZ
 tsfJiiDsS97+WiMnMJrXiLSA/kDkYo4uhIiyzdEA4TAXXm+x7BPiFOBCbj5/VlAqsAvE
 2Mltoe9ZvCTgvetpz3GsLVq+0zFxvjuXZA2zLJaeFXQ4D/LPhmRyDvt4ZbQ8WqyNT3Lo
 IxkocrOxDq6U1n3AjNJu8e61H14NFTitTuJYG3isHVjxir78T+h2tld3qMIe4PnoIXv3
 MtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2ieMbS+0D70pohooVgVjI3yQAHsrI5Yv9aY0un0BvWo=;
 b=EKKkuxrajYqNOMQXI5AFx8v5Gf2WhBkSWWqSWuf+eIhgL3lj6fhbHiREg1q95aJ3Hd
 jBDNjgghmXfjqEjwzMrvR0woU3o81cft7iUKhU4oduTD6f9+gbrEyogvVXUPepm5BCdU
 4zOQ/6PqwTPOdF06Elx6QeNILcgtTwCgsjnB1lt4txu50RTLDDVgc6Gk7Y/U0KIJjusM
 tokqdJKQeaAL6aYZ2UKh883TRjcm2e4505yaBZYtxcGSoTAOoAiPVM9PZou6MU+R5LuV
 xkULplUOMQKRPqhXn4Bye3M6vfudUIKvnsBinlLjiImgdhwUBZuO5A16eBRCYT33Hb7v
 37FA==
X-Gm-Message-State: AOAM532Xz6jixn/ev+vqD2Kq3//cKoNlON3sMoUdFSHlkVSxhjj//LOO
 ZGSK48mtZiMkyuC1OpdRfQ4oNw==
X-Google-Smtp-Source: ABdhPJxEun8C2Rz5QYSsXiRo78geOqzPnu/l72Y9HBWwUVyyAPVjgqYpYhJYTw9hG0hiFAmsYo+q8Q==
X-Received: by 2002:aa7:c5ca:: with SMTP id h10mr25978582eds.401.1640797469905; 
 Wed, 29 Dec 2021 09:04:29 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
 by smtp.gmail.com with ESMTPSA id w11sm8546153edv.65.2021.12.29.09.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 09:04:29 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/4] Enable display backlight on Fairphone 4
Date: Wed, 29 Dec 2021 18:03:54 +0100
Message-Id: <20211229170358.2457006-1-luca.weiss@fairphone.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Kiran Gunda <kgunda@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca.weiss@fairphone.com>,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add and enable PM6150L wled which is used for controlling the display
backlight on Fairphone 4.

This series depends on the recent wled series by Marijn Suijten,
currently applied in the for-backlight-next branch of
kernel/git/lee/backlight.git (or linux-next).

Luca Weiss (4):
  dt-bindings: backlight: qcom-wled: Add PM6150L compatible
  backlight: qcom-wled: Add PM6150L compatible
  arm64: dts: qcom: pm6150l: Add wled node
  arm64: dts: qcom: sm7225-fairphone-fp4: Configure WLED

 .../devicetree/bindings/leds/backlight/qcom-wled.yaml  |  1 +
 arch/arm64/boot/dts/qcom/pm6150l.dtsi                  | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts      |  9 +++++++++
 drivers/video/backlight/qcom-wled.c                    |  1 +
 4 files changed, 21 insertions(+)

-- 
2.34.1

