Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9626D663B03
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151A010E55C;
	Tue, 10 Jan 2023 08:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D1510E0CF;
 Mon,  9 Jan 2023 23:16:29 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id v25so15492213lfe.12;
 Mon, 09 Jan 2023 15:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t/mDgzPnUXxALwSc77P9Iyw1b4SZpp1LqX9N2wGlWLw=;
 b=B9m4CHmihRuEgTAs5tZdrZAp2YkSVYMp9hhXtVqPSGsJZsNcLaeAboG9f4nTdukK9p
 Y1ZjFYzcPThHQHD8b1mtOqNz8k5ByfxT+HHPYTAStlbClZOKfq+bzW6jutvTNMXef70u
 VBuA9bshNVdHboSaacxRpJjkCNMxooU9ncuKkRMAR9zaOq5iAAWRhZBgZaI3UjxfQUfT
 T/JwXSJrFJXGGuYmeTCQObWPapGgN3ChggBX1xVvb0CpEFK0AQ0AT+wWL8EDpYKu5M4v
 0QwuOwPg9Ioc0TEgjCxbhG1PSPv9DrFneXReAYGzJaqG1pZlP6w2ZpOFKwHh6Q5fUgjK
 9vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t/mDgzPnUXxALwSc77P9Iyw1b4SZpp1LqX9N2wGlWLw=;
 b=40GysNGF78hVi3vaKveYyZRvsb8NxDrKteMeGmrGqVhv09zXjYnbAPgfl0zLVWc5/5
 x08laOqHYqFyqvlpQstCjWmBkaHJeF+woUI1ExxzSc1x+yOJ3iLohnPXCsLT6XQD4KiF
 ViwDwjkCUtapPJ1lxYDlN2UupUXqgDfUW8Vk0CuO2LrQt9ZtJvDSA/+o4NhXScFCriqG
 qrAtVE4KQh7T2GkWZPwu6Idtt7gnK+c6uUZw/LhR0aoqff0KP/h2xjqqaWyWvV11TpLm
 tUwn9Flj0mSrPt1nuIZatzWjtoowXleRQaUxeFumu/mli+uW/V1SaGvd72yiLSN0Q7iO
 2EDQ==
X-Gm-Message-State: AFqh2krQkwSlY96tkWOXQeHBIUBQHfkua3V/DoLgmqjyro3vJJONf3+g
 AMlpF7Ut6/CtPYmd1onkt7M4M82ue8s8Wg==
X-Google-Smtp-Source: AMrXdXtPzJ3f1pblhBDPvSsW8oOxmBG4ZNuXw1pydRuDZV67dLZ7d4g4JIcTmwwjCI8J3zIceTrK1g==
X-Received: by 2002:a05:6512:c14:b0:4b5:abe3:c63d with SMTP id
 z20-20020a0565120c1400b004b5abe3c63dmr22375060lfu.42.1673306186813; 
 Mon, 09 Jan 2023 15:16:26 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w20-20020a05651234d400b004cb8de497ffsm1836363lfr.154.2023.01.09.15.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:25 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Kalyan Thota <quic_kalyant@quicinc.com>
In-Reply-To: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
References: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
Subject: Re: [PATCH v4 0/3] add color management support for the crtc
Message-Id: <167330408778.609993.9217470869804308069.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:28:50 +0000
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 21 Nov 2022 01:08:12 -0800, Kalyan Thota wrote:
> Add color management support for the crtc provided there are
> enough dspps that can be allocated from the catalog
> 
> Kalyan Thota (3):
>   drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
>   drm/msm/disp/dpu1: add helper to know if display is builtin
>   drm/msm/disp/dpu1: add color management support for the crtc
> 
> [...]

Applied, thanks!

[1/3] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a4d6f8253645
[2/3] drm/msm/disp/dpu1: add helper to know if display is builtin
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4cb6b1eebb92
[3/3] drm/msm/disp/dpu1: add color management support for the crtc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c48c475bd75a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
