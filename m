Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31A76B4DBD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 17:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED1310E210;
	Fri, 10 Mar 2023 16:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134D210E210
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 16:57:27 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h14so5669626wru.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678467445;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gFpyIz5IDkAlMCD4jLAXbROu3buVoZLKweW3KUNtWJ0=;
 b=DMwdjpYHDqyh3WZntB5Q+unbDUcqJsH4jeMh7Wwz66hLFXLimqrFd3j6+sP/aanXU2
 SjPgGzGGZTocbPEnS6G5BXoObcYFBsBglbmYokkdTuI66i4czHd3KwY8fl7bC8U9bsxs
 rebf9FU4ptW+u+CK8UWJJgHwI3xW9WHYZXxBMqYqA/NzlMxVqeBIJEej6U6Jyc6PqjWi
 P0jbNBEo0EEzAJfRQtjQefuJSs4pqHSToCG+vvOCOsoAEb+KeX6Bq/jgOnoZY8OnDKEa
 H1a93t7fMJJyhjEKoRa3gjKWyRN5OrsLOJPpsUNtH1hL2jkRUHDsyff/v0i6tlMfLTWl
 n27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678467445;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gFpyIz5IDkAlMCD4jLAXbROu3buVoZLKweW3KUNtWJ0=;
 b=QR5DC1JkWLO+VT4gQSLMjG/kg6Zy41xdJ2igONLqe4alupoxUykjYbDDmpISBpbdWf
 HJCygYWZIEcmHqDktiNodqUyUKBIG18KzPfzrL2zBiP3WoQUE1MNj165BggemC2qDpi/
 KFbHVQ6Xg8FRA7HJGejcvdZ1q7S1VyGqoleMRMvjaNwMRbT07BmmBmwxnAeYilzx0MyN
 XDNU7psCAqHcy2atZwnmfFU++MT4myDzOcxJ52fYXln/fRTMzKUhRxV40qLMEzc4P0rX
 JX3BQZ01tRzA9/7kiEH1Ymuf6CGAcweqcWYoOAW3fridE+n9T35D8+RhjYNWVfsuWTVd
 oOaA==
X-Gm-Message-State: AO0yUKU3oflDJ1jj3lLqC5iH284/bTalUm8KDGV+pqdyEXCjT/fNuWa5
 EUk66FTDBWOKudZp/AuvKGwN9w==
X-Google-Smtp-Source: AK7set/k2jvzdpZ+x1/a+riehOzhZniJXHH01TqXAOPGR1MT6PQL+VWojbn/xqNddc5P1TIkEsH+Zw==
X-Received: by 2002:adf:efc3:0:b0:2c7:ffd:f483 with SMTP id
 i3-20020adfefc3000000b002c70ffdf483mr17423986wrp.41.1678467445393; 
 Fri, 10 Mar 2023 08:57:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:566:5b64:c228:1137?
 ([2a01:e0a:982:cbb0:566:5b64:c228:1137])
 by smtp.gmail.com with ESMTPSA id
 c14-20020adffb0e000000b002c8ed82c56csm224763wrr.116.2023.03.10.08.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 08:57:25 -0800 (PST)
Message-ID: <26e7dd52-215b-ce55-394d-b0730d5015b4@linaro.org>
Date: Fri, 10 Mar 2023 17:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] drm/panel: Add driver for Novatek NT36523
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230310132144.2241-1-lujianhua000@gmail.com>
 <20230310132144.2241-2-lujianhua000@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230310132144.2241-2-lujianhua000@gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/03/2023 14:21, Jianhua Lu wrote:
> Add a driver for panels using the Novatek NT36523 display driver IC.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v4:
>    - add multiple modes support
>    - use dev_err_probe helper
>    - fix dsi_info type string
>    - reimplement mipi_dsi_dual_dcs_write_seq() macro
> 
> Changes in v3:
>    - Refactor source code
> 
> Changes in v2:
>    - Refactor and clean up source code
> 
>   MAINTAINERS                                   |   7 +
>   drivers/gpu/drm/panel/Kconfig                 |  10 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-novatek-nt36523.c | 771 ++++++++++++++++++
>   4 files changed, 789 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36523.c
> 

<snip>

It looks great now, Konrad do you have some comments on this revision ?

Neil
