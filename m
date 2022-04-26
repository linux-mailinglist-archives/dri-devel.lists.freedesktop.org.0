Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D663E51058E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C403F10E2E0;
	Tue, 26 Apr 2022 17:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037E010EF01;
 Tue, 26 Apr 2022 17:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650994612; x=1682530612;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LfeU+qR1LVCLWLHBR/AmkPZiH2YFo20bzm5nVGPB3CI=;
 b=tIE9Qu3+twwSotcq7ZGeezK66q1oXN15gh979ZrgkQsOPD59xTwQmpxK
 0idat9zV1aJwB1l1xaqi9dEpvXrtdFGs51Tw5v9WuYT48tYB1u+QPhX/Z
 6I0C1U+gBO0dh1qRd0kV8CkifNGPjpSsWCNgE0UdlRUYqc8GbcYVdNBHP Q=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Apr 2022 10:36:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:36:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 10:36:50 -0700
Received: from [10.111.160.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 26 Apr
 2022 10:36:47 -0700
Message-ID: <244db806-7afc-e8e9-a855-c592e0af8c44@quicinc.com>
Date: Tue, 26 Apr 2022 10:36:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] drm/msm/dp: remove fail safe mode related code
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, <agross@kernel.org>, <airlied@linux.ie>,
 <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>, <sean@poorly.run>,
 <vkoul@kernel.org>
References: <1650952595-27783-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53kv+NPJ-4Cpjy_FeJT5xOo7fLNz24fyGUcjy6ucccjbQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n53kv+NPJ-4Cpjy_FeJT5xOo7fLNz24fyGUcjy6ucccjbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/25/2022 11:00 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-04-25 22:56:35)
>> Current DP driver implementation has adding safe mode done at
>> dp_hpd_plug_handle() which is expected to be executed under event
>> thread context.
>>
>> However there is possible circular locking happen (see blow stack trace)
>> after edp driver call dp_hpd_plug_handle() from dp_bridge_enable() which
>> is executed under drm_thread context.
>>
>> After review all possibilities methods and as discussed on
>> https://patchwork.freedesktop.org/patch/483155/, supporting EDID
>> compliance tests in the driver is quite hacky. As seen with other
>> vendor drivers, supporting these will be much easier with IGT. Hence
>> removing all the related fail safe code for it so that no possibility
>> of circular lock will happen.
> [...]
>>
>> Changes in v2:
>> -- re text commit title
>> -- remove all fail safe mode
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 
> Should add some Fixes tags here, probably for the first introduction of
> this logic and the one that moved stuff around to try to avoid the
> lockdep warning.

Fixes: 8b2c181 ("drm/msm/dp: add fail safe mode outside of event_mutex 
context")
