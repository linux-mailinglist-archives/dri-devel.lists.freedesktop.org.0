Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A6668FC2E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 01:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FD210E8D3;
	Thu,  9 Feb 2023 00:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B360F10E8D3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 00:51:46 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id l14so734894eds.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 16:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rTGFhfzcYplQId+sbmms2QWBS43jFXQKPthbZZe6X0c=;
 b=GZHyVqwEzJyz7qRrp9C7MjtoKVomAa2ytxow43iOevqKxMSl8Hg2xum/e+osw4/5yW
 8She46s6t7lDb4s+/snLBWSOgL3fONS/8m3EgUcNk8Nyq5RvxEVwNaR4wO0azpzpkJVN
 7lJqUDlBHYqNVTwpKnI1jzTByPsevN9IRk904NTtvw+cp9h8toOSfn0/8SfQsPWtoCgN
 n9zc19kOEzSo7vsuDHW0Wfn06lejdryasSFEGtUR7c/JfZGiH5kp8xz7bGu00EcZ/hrb
 cbHN5JtGZm2JDQHMe3iHOHgELxVWlD/3pMZXcKKnPO6nINDpZnohxJ637q6qfgp1wipW
 bHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rTGFhfzcYplQId+sbmms2QWBS43jFXQKPthbZZe6X0c=;
 b=T/N1nZDyim3vGVxcUXsATDFuJGiZjR8YYIooIIXGo3yqOsfGfUnqvNsx1RFpo2IFqw
 qhBzZUbUP0TSYhRfkuWmNYX7oVdNuGf0eICzLXr0ml/FGl6FunbNHqjQUR4ZFQvLpFiZ
 r/1f+1Ml2g4GmEOY2EKf2Jlq7mwPOSOmPd1FTOAHEaJfUTpCd3XXpdv2TXXP6dgh7XJG
 ArYeUI9nCxRCNIH+2J/YrImRZLr2Pf59ZmfcVzAiF15WK9q0kGX97tXOf4+eJnqKnv8i
 O3R+Zi4HV4hpxWXQRHAdGxGCwWD+Bg1FkfpNI4XbkolIhL0xufv4WeXYyJPauuMAewKD
 Xkjg==
X-Gm-Message-State: AO0yUKUEvaJFiIhcE960+pceLq3t2pcVaZ18LDTJXLPVPeLixY3zzWKn
 YnVUvcOL08FO0qpSDeRU6YkBuA==
X-Google-Smtp-Source: AK7set/AYewPqrv/AyFCWJyWludZh6t6QwAEpA5XnSN0PwRkf2CpT4mAeU/u7cT/dZGW9OwYtHOxDw==
X-Received: by 2002:a05:6402:4148:b0:4aa:a516:8ea5 with SMTP id
 x8-20020a056402414800b004aaa5168ea5mr6070634eda.10.1675903905143; 
 Wed, 08 Feb 2023 16:51:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a50d50d000000b0049e08f781e3sm74396edi.3.2023.02.08.16.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 16:51:44 -0800 (PST)
Message-ID: <9c9d0985-cbd3-ea28-cc4b-a4afc8ae22b6@linaro.org>
Date: Thu, 9 Feb 2023 02:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 22/27] drm/msm/dpu: rework
 dpu_plane_sspp_atomic_update()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-23-dmitry.baryshkov@linaro.org>
 <7132b394-2e6a-20c8-fa64-3da082060226@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7132b394-2e6a-20c8-fa64-3da082060226@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2023 02:22, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Split pipe-dependent code from dpu_plane_sspp_atomic_update() into the
> 
> sspp-dependent?

No, this is really pipe-dependent. It takes dpu_sw_pipe and 
dpu_sw_pipe_cfg arguments.

> 
>> separate function dpu_plane_sspp_update_pipe(). This is one of
>> preparational steps to add r_pipe support.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

