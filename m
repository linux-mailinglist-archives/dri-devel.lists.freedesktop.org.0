Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F319B7272E8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 01:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3380310E56F;
	Wed,  7 Jun 2023 23:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7A810E56F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 23:26:18 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f611ac39c5so49679e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 16:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686180376; x=1688772376;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=clAyQHagKADMcGEukzKqm8FN+4BHghHI7AVIxMqM/aY=;
 b=d44tE+KKQjfk93ENTy8SveEMHyx6yvK7RQwcjKSFZ+faU2g5xHT86cZ+a65AZVmEjh
 vsP6TBwGAdP/b5pMlRKbgkb0eyPyf63isIOb6EyRxuzMZZlEjefMzN9A4hZB92aVhDC/
 Rtc05tHDQCx0CwE6LDJEMOhveN3R0LwhixWwNdJfCFdkuBQMd5oC0DeXM8NUJFtf5QCm
 JJ/2H2N3qXN2aZ0IN+QyDUqYseyGvQE5yLzfm+T2SK1rLS/D1X8YgNrrhplCxaKua7e+
 y25UddS/c5IbknVfE9a2kCvI1ELwZaaCDd24LYanhIleshJ739CqXQq01i3RS2icJQ+I
 fLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686180376; x=1688772376;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=clAyQHagKADMcGEukzKqm8FN+4BHghHI7AVIxMqM/aY=;
 b=AY+crKyb77SYDJpZCVOukdPZUg06dPOtJWzNeDue0H49rXLIMPVr6QukN1K59fHNFe
 T5gQiNFYn6OdAti1csZhmPAGJYPY6fWaGYz2BrkWD//+3v8jGhu42g0qSbUA8prwx9oN
 akuDUvkJ1Nqa0r11+CUmvo6sizyGMSCTDNPYu5YqUrOAQOiyQJDWrnmAvMDFJX2Kx4DL
 asj4Ok/dqoC9ROI8ZmMOI6J8yvCBIjD8grNBdASNF5xHpnbALriMlrzXnxoyOyTJeHop
 E08/EAA2tihye8t51tzD2OAERuVWvilG8X7ADdh7OLNV6lL21M9ebbF/nI9sFuibvIE+
 6WzA==
X-Gm-Message-State: AC+VfDzUy/oaq7kvUGJ6BYy2bySiJMFWcbJ+fKOreW8sL2omdscrsNEM
 fHy7EoNRxskliiUSKAsWSahK1g==
X-Google-Smtp-Source: ACHHUZ7tMkaummVBZmyBdPLwUs1cTQAxIPGZmcOMvJLsSTK+PfiT6YW5LuYLDmRrqxDaizf+iAijAw==
X-Received: by 2002:ac2:549c:0:b0:4f6:3fa1:19b7 with SMTP id
 t28-20020ac2549c000000b004f63fa119b7mr1295642lfk.7.1686180376398; 
 Wed, 07 Jun 2023 16:26:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q5-20020ac25a05000000b004f63eea01a7sm468156lfn.192.2023.06.07.16.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 16:26:15 -0700 (PDT)
Message-ID: <b7762fab-ba49-3929-281d-ca57280e31fc@linaro.org>
Date: Thu, 8 Jun 2023 02:26:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: tidy up some error checking
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <ZH7vP2Swu8CYpgUL@moroto>
 <gkeclhi5ouudxiwbd6wds7y2svtdcamyuqcnk42z7hr2js52qh@25ox3nxgeuzp>
 <b27d016b-ff87-435b-8341-45a4369049fa@kadam.mountain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b27d016b-ff87-435b-8341-45a4369049fa@kadam.mountain>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06/2023 17:42, Dan Carpenter wrote:
> On Tue, Jun 06, 2023 at 10:23:46PM +0200, Marijn Suijten wrote:
>>> @@ -359,8 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>>>   	 * frequency divided by the no. of rows (lines) in the LCDpanel.
>>>   	 */
>>>   	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
>>> -	if (vsync_hz <= 0) {
>>> -		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
>>> +	if (!vsync_hz) {
>>> +		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %lu\n",
>>>   				 vsync_hz);
>>
>> Nit: no need to print the value here, you know it's zero.  Could be
>> clarified to just "no vsync clock".
>>
> 
> Yeah.  That's obviously not useful.  Sorry, I will resend.

I'll fix while applying. Seems easier.

-- 
With best wishes
Dmitry

