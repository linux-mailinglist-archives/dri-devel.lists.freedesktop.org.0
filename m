Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54694682BD8
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 12:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FA810E317;
	Tue, 31 Jan 2023 11:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7201410E317
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 11:51:42 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id me3so40803864ejb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 03:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QQgfiktEQ6CHbsLdc2xgeGGQErl3Bddwak/hS/cFzLs=;
 b=KtTB0g9re1dA8ZJ2Movj19V75dJO8OU+1zPk7KvcO76ojtbOm7T+1Q+PRbSgXR2Mw2
 t9i05XCOSDWG57ridUBa3bqZqxQM4vpVyD0ikz7jxZG8Oa6i8px/29UqhJNLNsr6O4eu
 5fWpFTzRG9GZikcJCXViSDeidf9Yjr6U0Y+baqdt4AnKkppfmvOQP0RFxFV9xhWuWPb3
 sBBwsUGCxFmmnxPN7Y5jYTj4/lWnmq9A4h4eMhUmL8dtAaIKzGUC4DapogEKEHlBd0mc
 gDiXo6RWFN9iwYDNT9tajxsPvjtV5ajZZrpQ3hhS6a5JwWyka97C6r04ulCLacg6wd75
 cNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QQgfiktEQ6CHbsLdc2xgeGGQErl3Bddwak/hS/cFzLs=;
 b=F7vGyEBdUJY9SICYRLlvCoCHnjrerq71gD7hH5rLYZ9ZEhSV13r6y5TirETt2obYxA
 sOisQvIzAARKUKx3X4gIAAGdscBvX9yRbaSBIhIVsaZrRLyXZLDWjXLQk9KV4AwCKO+s
 1sT1HtHUgYsc1pK3M0y+5YS4NOn705N1JRMpSormd6v1Qjfgq4bWdUt7De4aKWinXH/w
 F38lzvWaswAQdS3SIpbBkDa8Zls0+HA8vvqOPfZ+vq1z7PGGjAYMwkgsEGPR2TpgcuM5
 ZNXwS9Zhohmqoga8a2Om4OwuxrhLD48UmS/D5BgP8sVwF7RjSITbNBGja7ciyL1Xjd1E
 1vHA==
X-Gm-Message-State: AO0yUKUExfO10OqzynA17ud66ZqQ9aqvDKQweAa8m193rOK5hO/srNVz
 GIQkIt6tcgLY233u+x1vwzkxHw==
X-Google-Smtp-Source: AK7set/TH31+UFmNU2qQupy+IGEIXakJjaiRbJBmgU1/pLW0cosPPBlYH8BVxFPqSKsuZqxVk2kW2w==
X-Received: by 2002:a17:906:4f82:b0:88a:296b:535b with SMTP id
 o2-20020a1709064f8200b0088a296b535bmr5105126eju.64.1675165900838; 
 Tue, 31 Jan 2023 03:51:40 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a17090653d700b007ad69e9d34dsm8322335ejo.54.2023.01.31.03.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 03:51:40 -0800 (PST)
Message-ID: <f387ac20-7453-addb-c9de-c4553f79c925@linaro.org>
Date: Tue, 31 Jan 2023 13:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 06/27] drm/msm/dpu: move pipe_hw to dpu_plane_state
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-7-dmitry.baryshkov@linaro.org>
 <f27fd72c-43a1-fa4f-6fda-4214d5b2920b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f27fd72c-43a1-fa4f-6fda-4214d5b2920b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/01/2023 23:51, Abhinav Kumar wrote:
> 
> 
> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>> In preparation to adding fully virtualized planes, move struct
>> dpu_hw_sspp instance from struct dpu_plane to struct dpu_plane_state, as
>> it will become a part of state (allocated during atomic check) rather
>> than part of a plane (allocated during boot).
>>
> 
> I was thinking about a couple of things about this patch:
> 
> 1) Since we are moving away from using "pipe" and using "sspp", perhaps 
> we can rename pipe_hw to hw_sspp in the below struct
> 
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -35,6 +35,8 @@  struct dpu_plane_state {
>       uint32_t multirect_mode;
>       bool pending;
> 
> +    struct dpu_hw_pipe *hw_sspp;
> +

Ack

>       u64 plane_fetch_bw;
>       u64 plane_clk;
>   };
> 
> 2) I still dont see any comment as promised in v1 about why we are doing 
> this in dpu_plane_reset().
> 
> https://patchwork.freedesktop.org/patch/473155/?series=99909&rev=1#comment_875365
> 
> I think what we need to mention is that the dpu_plane_reset() is the one 
> which allocates the plane state today and hence pipe_hw can only be 
> assigned there.

Ack

> 
> Rest LGTM.
> 

-- 
With best wishes
Dmitry

