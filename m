Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562E9661A7C
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 23:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EA810E01F;
	Sun,  8 Jan 2023 22:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68B610E050
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 22:40:55 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j17so10383077lfr.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 14:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=04VPxodDj8VYqfXc+AO5iDAa0bDV0HeRkmLR4Sxbnw8=;
 b=JGxoURkoihHFPGzdeL7AT0d0bJ+n0BJwTiUFG0q0xP758klKGYT7KZFxCbvFd5XxC9
 Tsqd97ZaxIgAMko3zqiKWZx8kAMEtpURZEkYGavS6nNFcuHa8zLOAZAj96aO2FIDpKu4
 PyBpgW1+YDBtkPtuDb02rPqv0LO4QIeaXA+m76hD1Tdp2VhE6uqU0YzhBxAJH9Des4Wg
 romWKqe6fyeLJYY6nLRCnaosA/P5eteRiRZvjYOMAL0X0cuXVlu5+jR3tcHZ2+iYt43W
 RyTMm14xjqSGaHgDUuq5L1nC/vPe+Ql4AFuFe0DtHfvxLdpE8KKb/FcKoRAX6Xf438vZ
 uSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=04VPxodDj8VYqfXc+AO5iDAa0bDV0HeRkmLR4Sxbnw8=;
 b=Q9QozPkybvkL/vm2WX98JOSDlhNM64TzWwlSbMGA31J05hKf2n28jwTfam04dbF4gc
 6CQMNjWujK5gaMy0QFZiKeVmuaLqcKiynv8bJiDAFHMnPLuXPROhV+5bCpBthk0Ojusf
 17LQsZCvJXRac+/9f5hIrce72T8XvjBzs/vxecsfmaMqmQahT5+YZ5leqg1xkODeN1mQ
 VgDV44VnGci9eTuWwLKdXjQIWx9jfZMyX9yYy2n8Wp2ejHUENgao3TSL77ee414vhA85
 RfHz42qNDPBnuJuxzv6U/SPQNW6G6qI70jsydnzbeL9qpexeRFRF3mv4kKD80pMtATi3
 X9Hw==
X-Gm-Message-State: AFqh2koUf6y8ImqlhNVqyOhKL7+1w00lCfffO1ijxjnVLBb4S7Yce550
 1zHtGyOB2yB7OWdqrBiEbJcAxA==
X-Google-Smtp-Source: AMrXdXsYBiFkCm6HkGiZyLtZo4tZyRsq3YwGKIk3T/55haEfYPzQzsx4FvI2H0FaYtQAIQfOSd/7dQ==
X-Received: by 2002:ac2:5318:0:b0:4b5:7720:5fe4 with SMTP id
 c24-20020ac25318000000b004b577205fe4mr17346875lfh.67.1673217654007; 
 Sun, 08 Jan 2023 14:40:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 1-20020ac25f41000000b004b590b0c084sm1253296lfz.3.2023.01.08.14.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 14:40:53 -0800 (PST)
Message-ID: <698a7082-84a5-b805-3e7b-9c72810580f3@linaro.org>
Date: Mon, 9 Jan 2023 00:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/hdmi: Add missing check for
 alloc_ordered_workqueue
Content-Language: en-GB
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, swboyd@chromium.org, quic_khsieh@quicinc.com,
 johan+linaro@kernel.org
References: <20230106023011.3985-1-jiasheng@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230106023011.3985-1-jiasheng@iscas.ac.cn>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/01/2023 04:30, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer and cause NULL pointer dereference in `hdmi_hdcp.c` and
> `hdmi_hpd.c`.
> 
> Fixes: c6a57a50ad56 ("drm/msm/hdmi: add hdmi hdcp support (V3)")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

