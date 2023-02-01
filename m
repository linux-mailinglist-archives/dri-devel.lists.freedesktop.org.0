Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 258F0686771
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 14:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF54410E0CC;
	Wed,  1 Feb 2023 13:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB1410E149
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 13:49:52 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id m2so51117625ejb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Feb 2023 05:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ACzUjtExd1GIrXZr1vO/BegTBXZjaP/+ZCi6MVW3dcE=;
 b=XqDxeyaONwSMSPBNLF2wQqvVaptIMfUXKIL+odbcSjOEZWz8roz/UWW0pxxPb3rcZr
 XFDmxM9TAigHeKTHQNxt3sps1g+kXk+XspyzHQ5nM5bVtha7xLYeGTaNdb6wdqMkBygt
 WSEV1c7E4T0OUWeGWS+B6KE7T7kIMhklClCadFuGuBww3apkEKZPesqOgZ9QRbiHKG/s
 RhLPhfcLZUjCzjYqLQHasEL3rbrwMn3G0UFhkARdB2BfN7ojuinil2MH8DDWf2Qw7UB2
 ZZJQivmgEIaA59HQPwDukXmfcC2PdEJW/QS3cJCIN/QIrsmdmoW50R6C9Sw/k3AukrL8
 +d3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ACzUjtExd1GIrXZr1vO/BegTBXZjaP/+ZCi6MVW3dcE=;
 b=ufRkBZQxOBxJF2n47rlSbPKzoRe/rFButwL7v2479ZwHRsMl2Maoyd71LFNIEeGIY6
 gpHd4xRhuDnp16nDcMdBLNz8/MbUgMghJm+QBhv+FGtM1D7uLS1HwIeyQCmHE7gK4KVu
 6z2gGwvXLXvoNme5OX9KMIY1CnxViZTeOmfTTxuaozGoSMHmCCViOEOgXjcF19thH9ru
 W5jcTE692pugfd+9xgwUi3fcpxruzq7kHKjN17vB3UFi7rxkgunvYSFLOZiQ7nUMupU6
 ZIj+9xFgStnd7CwL7xYaJdn0IEVsR+QEYiMMhCkBNAfX8boeI1xWj8PzgHBmLgEH+377
 45kw==
X-Gm-Message-State: AO0yUKVeRnyYWiLIwH/nJCWj8U/QJIY/hhMnO/+PUP5BsxmMb8lmOeiy
 q4fdD3Twt8hCAyIc1a8+6bitYLyGjp6wTJU6
X-Google-Smtp-Source: AK7set8R0ihVH9gQLKTpTgxDtC0l0P5jQ5GnLv1eb/VCHQJYaBQmNmb6DhTSWztbpqMBqXz4Dg9UCA==
X-Received: by 2002:a17:906:2b0d:b0:877:a9d2:e5e9 with SMTP id
 a13-20020a1709062b0d00b00877a9d2e5e9mr2588659ejg.42.1675259391045; 
 Wed, 01 Feb 2023 05:49:51 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 gt15-20020a170906f20f00b0088bd62b1cbbsm2858318ejb.192.2023.02.01.05.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 05:49:49 -0800 (PST)
Message-ID: <05344ca0-3847-ea55-1e61-04aacc58995c@linaro.org>
Date: Wed, 1 Feb 2023 15:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [v1 2/3] drm/msm/disp/dpu1: add dspps into reservation if there
 is a ctm request
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
 <1675092092-26412-3-git-send-email-quic_kalyant@quicinc.com>
 <20230201111604.htgczy6yvdkywhvl@SoMainline.org>
 <20230201112631.mgwuboehrwdefqnd@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230201112631.mgwuboehrwdefqnd@SoMainline.org>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, swboyd@chromium.org, freedreno@lists.freedesktop.org,
 quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/02/2023 13:26, Marijn Suijten wrote:
> On 2023-02-01 12:16:05, Marijn Suijten wrote:
> <snip>
>>> +	if (dpu_kms->catalog->dspp &&
>>> +	    crtc_state->ctm && (dpu_kms->catalog->dspp_count >= topology.num_lm))
>>
>> Multiline-if-clause is typically indented with two tabs, not a half tab
>> (4 spaces).
> 
> Hmm, Dmitry requested indent-to-opening-parenthesis in v1 instead; and
> the majority of dpu1 uses the worst version of all: indent with a single
> tab so that the contents line up with the code block below.  Dmitry,
> I'll leave final say to you (and fix it up in my own DPU series
> accordingly too).

Well,

:set cino=(0

> 
> - Marijn

-- 
With best wishes
Dmitry

