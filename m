Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E225F8D92
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 20:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B037B10E067;
	Sun,  9 Oct 2022 18:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E3210E548
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 18:56:52 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id x18so2543812ljm.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Oct 2022 11:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4BqFxrrCFx1w9zJ1okwcKdbwVKbwlGalHmaJp/PWKYw=;
 b=ntkBYO3tdwDZG3MUdXCzs2ZAMe21LMDq/e0kJODPoYBqt/AUXkjGAEozcaMjlDI6Sp
 OXyBzIj9WQwwCb5DoyIFrG7wrCfAMtKm+fx6k3B77XeeBQQadqHE9ab1YAO+Bqb4S6ij
 QfJSedWlKIA7zoGyjTHPV483Brzt/K1esjwWaq0tEiKR2Bb8E7rotscMLL6BShQab92O
 JKcGmzCi4dueg0Z2UkDzSKrydX/5EsToLw6ylLOExHTLvi+EIDOATNj59X/dgs9WJg3N
 j06umGPOOMj2G63Gu/ebKb6TdIlyewwF2IoG4YrWD63N7Zlzt5HqbY3ozXLymNiRPN6X
 iWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4BqFxrrCFx1w9zJ1okwcKdbwVKbwlGalHmaJp/PWKYw=;
 b=d4BXjEIvylN35cw3uqRgHBu4EhNkg2Qs7nOOyMoqZ949pb0TaL/5bTSW0V27fki0TJ
 a9U6Mi25099TXDCbQ84F/ZfxprNCmYE60iE7AJYHRJ/x9KNbMtbaEaCoq0hLD1hI+6RY
 8ZuAXoGzQ82AMH0BfO18J4f1E519KZwVumcUN3TgjFZy7fMpHL6sdwwQCSR4kmsgmOrt
 uctcUTo1Xf7sulS/9dY10l915Dte4iks117zDmREVfpLu5J+JBxTdIP/2CaxjmbtKA0b
 l0WiWbhkonB2Z0Gi2P7EP9XCYcvorRalurENOekBYSaLen1frn2LlnfDTtL8Y+AOta0M
 HdGg==
X-Gm-Message-State: ACrzQf3wUT2RLXhPS8st0tCqhpXiKvCYl9KMgX2gfgIFTtAARda/nPxx
 7zOSBqTBB1NIFD4fnkr6ASkyWQ==
X-Google-Smtp-Source: AMsMyM7Q9mAoQECe/JbTqMM8N5BgPY+HiSdKyCxs5AHW3ie/cE8EAsGCW+RRdE2iXtvNdSEiSw4QCw==
X-Received: by 2002:a2e:b78f:0:b0:26f:a850:8c78 with SMTP id
 n15-20020a2eb78f000000b0026fa8508c78mr282196ljo.442.1665341810646; 
 Sun, 09 Oct 2022 11:56:50 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 13-20020a2eb94d000000b0026ad753448fsm1360880ljs.85.2022.10.09.11.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 11:56:50 -0700 (PDT)
Message-ID: <0ac50b87-326d-c857-41d9-44ec22ce1248@linaro.org>
Date: Sun, 9 Oct 2022 21:56:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 06/10] drm/msm/dsi: Migrate to
 drm_dsc_compute_rc_parameters()
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009184824.457416-7-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009184824.457416-7-marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2022 21:48, Marijn Suijten wrote:
> As per the FIXME this code is entirely duplicate with what is already
> provided inside drm_dsc_compute_rc_parameters(), and it is yet unknown
> why this comment was put in place instead of resolved from the get-go.
> Not only does it save on duplication, it would have also spared certain
> issues.
> 
> For example, this code from downstream assumed dsc->bits_per_pixel to
> contain an integer value, whereas the upstream drm_dsc_config struct has
> it with 4 fractional bits.  drm_dsc_compute_rc_parameters() already
> accounts for this feat, and the sole remaining use of
> dsc->bits_per_pixel inside dsi_populate_dsc_params() will be addressed
> in a separate patch.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

