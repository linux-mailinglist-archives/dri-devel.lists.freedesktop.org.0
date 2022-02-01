Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333234A564F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 06:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D9D10E16E;
	Tue,  1 Feb 2022 05:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143EE10E16E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 05:20:42 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 l12-20020a0568302b0c00b005a4856ff4ceso7027937otv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AxUIbjg3SvCLBVXCrv9jIsGx71GsTQ6qIWnsAt6VTbY=;
 b=BiSXSMEsNtBTkDinyXlJ67kpwdj31ar6lPoZA/5iikJbtUTbyv+x8iSa7vv7ZCPYq6
 R7Nv0ANSJk6YgAKMwKENalGwcFVeYxJ7V2bekO9F5h1eAxArRCkEJ+lG56yEr9XWpOxd
 j2UrqPc78k5N69ULMd+CcgKOfYHmCINMvzaZAjVplmKnLYhCFakcrm4CQledQ5fmW064
 2J0OepZDuPZHszaOu2m/zgWix3+PDZZGPT2LMzNHLZVSXKE7Jp/jdpgT+cVMmsIampR7
 hre70NoxFVAjnX75mUVPc1J863wP7tru5EaM0vZP9LKpUoOAE8n6/QQyI2vekIi4LFOB
 I8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AxUIbjg3SvCLBVXCrv9jIsGx71GsTQ6qIWnsAt6VTbY=;
 b=5XE/b8HQXrUyYYkCSwBZkIQwleuGZMRVBi4KeCNWgzJW85nedg8mJLFFDElaesOS70
 aPcvlXJ1AqQMDqL0xxdrRY6MmMUROhZbDFWYRuQGSUDJdMc2p+qymV7zgcFEO2lWYLBk
 pAOx9u9ifIBXC8jvRag2j/iL7UF2JM2wGy1yqJL3QwWJYyrhWWdocZNzE9O1i3lajyNG
 Su2C88nxeKJHq9n0PF1qVdGaMzOwQTsxYbt9GsmdwF109kBGWCSHpW3AnXwyn7dosrcU
 E6PE9JEsqXWsAgwvTT0jM253Fz+rklHNCC9r4t1yt+uSsD92nJOCyfzNidK0TC6I3Y/3
 b3JQ==
X-Gm-Message-State: AOAM531L9gig6fzO9VKHpU4dUX7vny8gLvNiwih3w3TdshF04e/6DX+P
 ALHt8rg7pXHvuYCdDgAf1DLulw==
X-Google-Smtp-Source: ABdhPJz7xSZzfdlELJEKFP+8VoUH7pamHFIqMvwPRNtJNI8E/x0hnVAHOllmRicnrMtz2Q1gMZswNw==
X-Received: by 2002:a05:6830:1084:: with SMTP id
 y4mr9564994oto.42.1643692842301; 
 Mon, 31 Jan 2022 21:20:42 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 21:20:41 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: (subset) [PATCH 0/4] Enable display backlight on Fairphone 4
Date: Mon, 31 Jan 2022 23:19:51 -0600
Message-Id: <164369277344.3095904.11289204126111973872.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211229170358.2457006-1-luca.weiss@fairphone.com>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Kiran Gunda <kgunda@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Dec 2021 18:03:54 +0100, Luca Weiss wrote:
> Add and enable PM6150L wled which is used for controlling the display
> backlight on Fairphone 4.
> 
> This series depends on the recent wled series by Marijn Suijten,
> currently applied in the for-backlight-next branch of
> kernel/git/lee/backlight.git (or linux-next).
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: pm6150l: Add wled node
      commit: fe508ced49dd51a700c0f9ec7826d523cfe621b2
[4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Configure WLED
      commit: 7a52967d9050f3e430373bc51c56865b49a38573

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
