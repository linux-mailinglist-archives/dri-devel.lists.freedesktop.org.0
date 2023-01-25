Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1E667AD9B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 10:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7C510E0AC;
	Wed, 25 Jan 2023 09:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B2710E0AC
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 09:17:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so757565wml.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 01:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=g89bMr3eE03J+TYQWkkytiL1T/BGnye7+WdWGuXhj80=;
 b=pElJrXqx9Z2iEcj0CeiqbotfV1L1GPhFvE/mB0VdGY27rqnksdG3jYxGErTQuRqBZA
 NVRz3+jxAHpLTk5SwckXcv/hU4T+OLa0aCrsYxeqR4V2kgCMK7cwS0Vzeww/6mQ0o0dB
 ExVUoyX9c4Q8CchbQgfvDbaQU7NWqKwZNPJytXu7Xrb7jByogSe0nlCmoTdT4C/qzd/3
 k6eMduO5FkYBKRxkT8xH7PMwnharj1f9dqsj+F4QqMOR8a8IyywAQ73z28TMGOR6N9xq
 FZkhzzZNrxLNjMPsKAT5g54pgCa6iY00Y4cwbSQeemClEwh7HjyHVdsDCN1vGEa4rFzs
 1GwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g89bMr3eE03J+TYQWkkytiL1T/BGnye7+WdWGuXhj80=;
 b=dYhbJKkCp+Pb8i4bjv+Q0aUNJAmH/0BqwnxP33VdECxjVIrkfEvRuRbFKSVA4UtuEm
 LBR0sNLVCkIegzra4aiIagiS2UJBOR9CGVLvlaod/8UKX8u+FFuIBMGO5EzNGvb/LUIL
 EXr+tVXnLduvWXNqsTTEFt/Xtx1zYf1xADJnRq/fWDvRAw+TFu52Tlm6b1hd//TJKMdq
 S4M2JsWFuMz59NOwIsUI6FbWq1PVkCjgd30I7+U0QzMby4iQbvBX87RJ1QKJixaGulXa
 jllXUaEPVPTRwnht2FumWaieh1QFPLcLYn2/juddYpUb+FtwjQUNrcSKuUjcK3iUnfxr
 JGgQ==
X-Gm-Message-State: AFqh2kqhjVQC1Zy8ulAdOLDtjDN94kmq8Q4RxZmUqpGlkC5FvD9VUal0
 DkbfThiICMrqKPlmb/2QfFraAA==
X-Google-Smtp-Source: AMrXdXt6qkMvVDN8MHnXrpvwuViLfxSnAY1YvtkHqbCUyxWLTcWNuZIL/5T7W85otq5EKVAoJZM4ew==
X-Received: by 2002:a05:600c:ccf:b0:3db:f34:e9e0 with SMTP id
 fk15-20020a05600c0ccf00b003db0f34e9e0mr27755990wmb.35.1674638273229; 
 Wed, 25 Jan 2023 01:17:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2f:6fa7:d25a:7047?
 ([2a01:e0a:982:cbb0:ad2f:6fa7:d25a:7047])
 by smtp.gmail.com with ESMTPSA id
 f4-20020adfb604000000b0029100e8dedasm3862328wre.28.2023.01.25.01.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:17:52 -0800 (PST)
Message-ID: <5e99bf45-598a-7e02-7866-f542455cf910@linaro.org>
Date: Wed, 25 Jan 2023 10:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: Kconfig: fix a spelling mistake
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20230124233442.22305-1-rdunlap@infradead.org>
Organization: Linaro Developer Services
In-Reply-To: <20230124233442.22305-1-rdunlap@infradead.org>
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
Cc: Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2023 00:34, Randy Dunlap wrote:
> Correct a spelling mistake (reported by codespell).
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
