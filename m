Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0059C4A562E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 06:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD5D10E2F2;
	Tue,  1 Feb 2022 05:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75A510E402
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 05:20:14 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 e21-20020a9d0195000000b005a3cd7c1e09so8464911ote.6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2apFGkxfX1t4PMALufUaS94H8GBvvJ1PAJONADrD3HA=;
 b=tUTMlzNzqdIuNJ6Ptljfy7CmsubEreZ54a6f/DWBTM/N4m5aTHNudHdz0kesj5QnHW
 bn30VzL9qvmS24D8AYxuBoj5TARj/dP9zpamcMkad5Xi6bZWQv88H31YDRjRZV5DxUfX
 dR6T+jSwabIPkse6AfvZFy8gJOINPBTvc2doaUvHRHVAlEJCTjFu8ZEHaPorqIVyB+Vu
 v/NxOE46ChnmEHXYs6/KzyqZfOXOFwNXGUGQgF7uZZts1cQ/TbxpdSyg8NaVsb93scn4
 ydR4HKFksdLdoDOD0QGr2TtGljB+22WwBPd6k9XbKMOfMIcYCS98DIUY5yNtyEAY4IX4
 rO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2apFGkxfX1t4PMALufUaS94H8GBvvJ1PAJONADrD3HA=;
 b=lrgJxwxujp9uJfLN67X14uUrbRnBw+l3fpT4a+Zni5BtxcrbXg7a4HTsRZ89yB5KJI
 5v52QQoyzib1pjP9bIqUSS74iFV4ri9egQcaMVnQLOIdaHNCmKEZDzwm+LZZ4sWpIS6X
 S59YiJq9yUDnZwpPkaXNrgsVE0xGpTDZkdt/zAZO7dFVCi/MSVLjxGftv9srC7E9598H
 2Bh2N+p9pN+oKX8y4xebUZRKxaJe9cu1fxwvrxQyLjhOdCiE608aZ/eOyvTlsZfOf7Ks
 dE4gQFC5kTcwi8w+Wrn3Sam+PwYvUD2gPR9oh2esYmF3N9YsW/Dyj7L8Nx9IpumXextn
 zvXQ==
X-Gm-Message-State: AOAM531x6YkW1H1LEBnNbqFmPEV+ZsC3n8Nu0XKeusddVHOn7xCi+HpS
 CYCn1A/47FJovPThbrKpp6FldQ==
X-Google-Smtp-Source: ABdhPJwrwYQAU5d3Yj0PCUyCjhiEO5uCs7OlDffQ/EpXZzX94VloxaC1wZq5SDTsavGNI9/VFOzR2w==
X-Received: by 2002:a9d:7604:: with SMTP id k4mr9461316otl.86.1643692814062;
 Mon, 31 Jan 2022 21:20:14 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 21:20:13 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Caleb Connolly <caleb@connolly.tech>,
 Anton Vorontsov <anton@enomsg.org>, Tony Luck <tony.luck@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 dri-devel@lists.freedesktop.org, Harigovindan P <harigovi@codeaurora.org>,
 devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, Rob Herring <robh+dt@kernel.org>,
 linux-input@vger.kernel.org, Alexander Martinz <amartinz@shiftphones.com>,
 Colin Cross <ccross@android.com>
Subject: Re: (subset) [PATCH 6/6] arm64: dts: qcom: sdm845: add device tree
 for SHIFT6mq
Date: Mon, 31 Jan 2022 23:19:23 -0600
Message-Id: <164369277345.3095904.2460167653068866280.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123173650.290349-7-caleb@connolly.tech>
References: <20220123173650.290349-7-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Sun, 23 Jan 2022 17:38:15 +0000, Caleb Connolly wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Add initial support for the SHIFT SHIFT6mq (axolotl) based on
> the sdm845-mtp DT.
> 
> Currently supported features:
> * Buttons (power, volume)
> * Bluetooth, DSPs and modem
> * Display and GPU
> * Touch
> * UART
> * USB peripheral mode
> * WLAN
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: sdm845: add device tree for SHIFT6mq
      commit: 45882459159deb792718786514bc677c8a6b1f53

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
