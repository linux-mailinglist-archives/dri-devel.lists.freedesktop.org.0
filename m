Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 794309FA48C
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 08:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9865C10E2EC;
	Sun, 22 Dec 2024 07:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iRSZUWIT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A80110E086
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 07:31:30 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5401c52000dso3579973e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2024 23:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734852688; x=1735457488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4tWENes0KylDXpgmRg5/jOA7aphz2fds2f1aAKkLl0=;
 b=iRSZUWITbDxSp47eGYlmfv295KszGTHtpg35l8Yb8CA9YspH0/cbOcx30vGMEs2iL7
 iELLkPLnofEHMujoj5wyHqdjaO0L4FHVhk3+mdEOs5K/bUTG/TpZluKJdU/mim4eQ1N7
 8elGMU8aigBWbUCMhpfRSzcMrEZKPiCt2Mt8YRNjocJpUmdz3ZN9KjNSXBLMBjzChsnK
 jVopGtkC+WJPMjZ3ZJRNCav7tNjZr/GX2Th8vm4Y3oDVIqOpX5kS2GaKOhW1mWEoWhgP
 piPhDnP2YCEWI8ffkPiEgC3FcZCbBJhUDM6Gg64pngGlHQHp5Wnym5H+1OOOs5pf/XCP
 EptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734852688; x=1735457488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J4tWENes0KylDXpgmRg5/jOA7aphz2fds2f1aAKkLl0=;
 b=PSLCpObAGRr2zSm0Gpk1YfpNSBVoeXh/mMpFJBpLrVRVJcrItheEZfEvfVfdXMo4Dh
 oHgOkYZPSdDjTFinCz3goiz69Gmv9gMjA+z0vrAASs0PoT/8Vv+rYvTaSJEg0BGI1J1s
 Mv8UftglNKvlLO8OLrW9kSQNkc7KiNcakFbHPbYBiZDtJ/zCQsj3yDqphu5iaj2J+Ujd
 7RMMdegm0AGS5N6eRSRfLxBakirSm8OvttYLrXYwirpTU+C/bIUaEbSFpdBLF97m7KPP
 f5ZMnn8ZspE5GVeLl1lyazGb+DF+3NCjzJqDOrFEQ6OqfEqxZRh8DVOww37ztRw//6PH
 Iuqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz/V3F/1gB+KgCWzjVaunDUHMX/g7S+PVrn7Rr4o96jkr806//i+BtY176YXy0utnKiyxCjMnVaZc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwISv9ZCNjpV9rQOY8OToFLzDrSCaxGfjWY+yVZi2vBBWusg0e2
 yWi9gXxUrm5PGlmL5jW0R/hV7ukHNYJyjL3kxfZFmec+vAKLEQDpDRdJhECoB9U=
X-Gm-Gg: ASbGnctmE3B8jZpZP4qAbmE9ikJOWfE2WTU+LGsIyFxRB7iZ+LIbRaCnbBoptAdnBYW
 mDKDNoDnQWBmtFi69dxWAXKM30JC1U5UgJghSq04erA9+GCg+A41jkO/15IqdQIWJvQqCYsEhTk
 S9bHn0Jrchx615LEIpanfkh0V8Hjp9Tci3T1VbplK8OMqsW/JllUTGQXHgltCLoKG+b7S3uBHC6
 hLE/Me3hTPi/yaksIYT9T+9eeOroavW8kwiLWZGcvCE7TfCPw4PkQuasZQ8JFLC22bO49oy
X-Google-Smtp-Source: AGHT+IGp894fOidXwA2xVrPSy+TcSR+A1Ol/YQtOYVIHOGQiGKFP+Vy9QFAeQtlN9/c0wOZodFaWug==
X-Received: by 2002:a05:6512:ba6:b0:540:2160:ade3 with SMTP id
 2adb3069b0e04-5422953c19cmr2265129e87.25.1734852688318; 
 Sat, 21 Dec 2024 23:31:28 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422360072fsm917416e87.102.2024.12.21.23.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2024 23:31:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/16] drm/msm/dp: perform misc cleanups
Date: Sun, 22 Dec 2024 09:31:25 +0200
Message-Id: <173485266468.157212.8050342542703139695.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
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


On Mon, 16 Dec 2024 00:44:05 +0200, Dmitry Baryshkov wrote:
> - Fix register programming in the dp_audio module
> - Rework most of the register programming functions to be local to the
>   calling module rather than accessing everything through huge
>   dp_catalog monster.
> 
> 

Applied, thanks!

[01/16] drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ba3627bf82c1
[02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
        https://gitlab.freedesktop.org/lumag/msm/-/commit/486de5eec0d8
[03/16] drm/msm/dp: drop obsolete audio headers access through catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c0caebf37960
[04/16] drm/msm/dp: drop struct msm_dp_panel_in
        https://gitlab.freedesktop.org/lumag/msm/-/commit/429783c22fe9
[05/16] drm/msm/dp: stop passing panel to msm_dp_audio_get()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c9261bcc1546

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
