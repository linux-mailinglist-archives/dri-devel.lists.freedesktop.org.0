Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AEF6D2F99
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 12:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F73410E0E7;
	Sat,  1 Apr 2023 10:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799F010E0E7
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 10:01:31 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id c9so21607959lfb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 03:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680343289;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2ashd2jmNGSIbGJQnNJYWhd+xpZtd9xxM/hYfr9rYcA=;
 b=cvMa0BOgOKuLHFcuTuUangjhtuU9ZabVvI0Y+v8IFlvPGejj0sSIewvL7PGEV7j7x/
 m7keJzkIcw0KW873qypmVzRl4n3BKSuEZCrnIueU1O1MCZ8MQ4007y7RtoKD1QcIwuQF
 NwAISXX+HjvmxoT2DE/UeDk1YxQue+jP35L/fr4iuNePtiFdXtGCKwqpzCBwQBeX5j8E
 h6iQOrydTiQ3WV/4DZWmW0a+T9eUFZyBkYya7PmAra+focN70gHeyDvFH+Gk0rZs1he+
 TcGEtE2k2tmRLbLm1w3sKDg+oeTuZAS8yKlMxHwR7gzK5MS9FVtqaJpsevHksBp7P8FL
 dy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680343289;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ashd2jmNGSIbGJQnNJYWhd+xpZtd9xxM/hYfr9rYcA=;
 b=kGo+0OZOQj3BTyjjmR98v4bvYhFCxWmcpSsrxJQLrEZ+FBRfYqUBK3/EwGPGfX0Qto
 K2SzM1uUX7kWbLopiCziqh4sTEIRqCy5qDtEpzrSjEKl81aOuQQaTrRyHtL+qQ9KoCxM
 BpW9ILPi/Sv4PL3n+ltXawxmIZsezrrLUBVbmNYt92E/3sBwScdZ3ewxc+EBl0wJtL0j
 4WsMMUGeSrOX501cFDjND9s1r30N2vmQb7e3N6pQwV/qU0zZVpMMpp1FzXsr1CmUtvVq
 Xx8UeXDZuq3buog54K4yoehOVYJApsh5jLWnJB4UlNoCijcDhX4Hd59Ajfjl/oRGG04a
 AXoA==
X-Gm-Message-State: AAQBX9cp2rHnbO9ZnVWK97Y8G8OwI6QIT7UZyFJcnxXoUcKk2pn223AS
 UhpJRIUE83KjCiGA1sWS9H6dKQ==
X-Google-Smtp-Source: AKy350Y0rU9C+2qKJhXR3P4UDAi3oG2kpaWzmNmI8qMFgCf0V70lDWcGZrau2okmTZjXeM+5aRXtrA==
X-Received: by 2002:ac2:428c:0:b0:4e9:9c76:1b85 with SMTP id
 m12-20020ac2428c000000b004e99c761b85mr7761595lfh.3.1680343289432; 
 Sat, 01 Apr 2023 03:01:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d7-20020ac25447000000b004d57fc74f2csm752344lfn.266.2023.04.01.03.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 03:01:29 -0700 (PDT)
Message-ID: <e538dfcf-e317-e975-0442-8ab5cdca6c8e@linaro.org>
Date: Sat, 1 Apr 2023 13:01:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC v2 1/6] drm/display/dsc: Add flatness and initial
 scale value calculations
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-1-3c13ced536b2@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v2-1-3c13ced536b2@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/03/2023 21:49, Jessica Zhang wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
> 
> Changes in v2:
> - Renamed det_thresh_flatness to flatness_det_thresh
> - Set initial_scale_value directly in helper
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   include/drm/display/drm_dsc_helper.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

