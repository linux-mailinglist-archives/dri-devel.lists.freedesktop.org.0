Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134D98298F6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BA310E5AB;
	Wed, 10 Jan 2024 11:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3902B10E571
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:26:04 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50eabd1c701so4911417e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 03:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704885962; x=1705490762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ukZ4eHBZ+lqRJdXFeiOENdmgYKBt7ZSKa90/KfaTIsk=;
 b=V0B9mGZtfCtX209ig3C/6wgiPyLbocz5Hpo+mGdTOZgAp6w5Gwr/dDhdxrUEC7IiaX
 /GwBiIigYUy15QxoNnal6SgRWkTxeg8fPhlVJw2zEpfEWnnlf5RuQK7hPRc+qQpflDPg
 QT98qmWJrE4tbKJhvfI3r6BiroJ35/6IU6NlhBXxo3GKSL2XKbdZY6F3/SsnSYs5iamU
 b5/Mqe8zxkjcaleP3P+o5vO26TkXzpE8I1JRvf/kgC/qt6aZBYvZIBgf42SDANi1ctrb
 WDj4G8TXliPydupzD7ZB4HfohqOEP3CFs0eiO6cPiUpFTK85WZFX3oSuk9uBmPuRWe7s
 UuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704885962; x=1705490762;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ukZ4eHBZ+lqRJdXFeiOENdmgYKBt7ZSKa90/KfaTIsk=;
 b=wsOoDoZS8bvKgGNKpDFQn2880kQKnlArF55aWT9N5FyLy9G4Q0ksGEZXHRKRc3jDhU
 vaUu85saIPlFtS0PcN3B6eFqY/LKhUCZ0fwkBTNUmC6Zz241QaRkrXmD7M43lEp+nN/O
 umK5yyqRAg32kiJxEJjpacQLWdkJvJjaEWu8MUw2+HRYaZfqVXiFC3nv7vB1v+xxMZKw
 yMLdyJPr4JQop+HsiJo4aZ5VXwLWMtfIHYdKsDFny3TPqG3fG36ptzYxsZRjNP+8mV+2
 JJ5SDsyeznn2c4IGRXb0Sdz251RYB07zWeTw+fd2qC3/L/sAnpdqaTSlGLT7HjOH+3gL
 7QMQ==
X-Gm-Message-State: AOJu0Yx5v4bm8GGhoQeK+vvhX+7VERuJUbS5Ai4Qf0n83Ddk2B/U3uql
 O1rEE6Jdk9/E1/QprooLdu6Ebimu5Qu2uQ==
X-Google-Smtp-Source: AGHT+IHdYZzUKlwAGo0xKf7zZS+FfVCqQy+Pwm2peTl8E/6DsvQMtNRqyGPsNtC9/9+lQE3r+hjjLw==
X-Received: by 2002:a05:6512:376a:b0:50e:8d0c:5eeb with SMTP id
 z10-20020a056512376a00b0050e8d0c5eebmr319316lft.85.1704885962325; 
 Wed, 10 Jan 2024 03:26:02 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 x8-20020a056512046800b0050eb7941041sm632908lfd.297.2024.01.10.03.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 03:26:02 -0800 (PST)
Message-ID: <c4693d39-4ec1-4759-9dfe-74d9556dbc99@linaro.org>
Date: Wed, 10 Jan 2024 12:25:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] drm/msm/dp: move next_bridge handling to
 dp_display
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-14-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-14-fc3e902a6f5b@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/31/23 01:44, Dmitry Baryshkov wrote:
> Remove two levels of indirection and fetch next bridge directly in
> dp_display_probe_tail().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
