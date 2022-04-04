Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802474F18B5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 17:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E57510E4EA;
	Mon,  4 Apr 2022 15:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D337710E1E3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 15:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649087037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwNp5wKi4sCpy/JwyVCVYtgRdExp7ZcRrflxIJ6FsDA=;
 b=a/Mi/cQYHK5TZO7DygLYeqxf+O/23I38WUxVWBGcNRxlGptRc5lMUEUIJCLFifPIFlNcci
 H0t3ZTW/MkKG+GoG+YYDxlJVzPDYCnwtMYNPrbZ1/f4OzZr6yerR8J8M3fyu/FL6yNCdAk
 4OiVQdzEaNGnxElV5gvsBagI00Ng4sc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-b0qMmIlCNva9GaB3wxf6bw-1; Mon, 04 Apr 2022 11:43:55 -0400
X-MC-Unique: b0qMmIlCNva9GaB3wxf6bw-1
Received: by mail-qk1-f197.google.com with SMTP id
 q5-20020a05620a0d8500b004738c1b48beso6485214qkl.7
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 08:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mwNp5wKi4sCpy/JwyVCVYtgRdExp7ZcRrflxIJ6FsDA=;
 b=0DiwdfsYe5vpzGYgujthEkyV/OJr7tsXYM9toILt8cAoNIEtoi3UeI0Wwbo2BTVcQZ
 jkim8go1chfosGg9xamenUjBdoO3lND7X2VaDuPx4rB5J0vtT9V+SJ8ApvM0xzNF4Ha+
 VA8ETBuPNYf4Ic11lA283Kt5pAkcPi4wj8TQN00+dtNXl/SRhbMjjSoICeN580eaw12E
 K3xAL+CwMo1yyhH5+cKBixcQ4xRupFE2mPLBYq1G6t49gBH778xN/c43NlqwOjRTc1rP
 xjZjV89XpAFPVLCQFUgdB/uJuOGkCMOkuBkLMiTuu5beyh00GPERgd7r5+J5T4UhEaBn
 PRgQ==
X-Gm-Message-State: AOAM533Skiz3P6M2xEKYcVsSq7MdJq6Nt1hkccH7WPKjvc9NEJV7n1QD
 TNXb8cktHvg61UI9CF42pnO/Oeg7WvZwN+bwKKzFhznrgLccG1OqMuXRtug8Q70RuFVT/kVqTGl
 LvZTFuQQoFSvogPMXCSsDlINSoVtl
X-Received: by 2002:a37:6504:0:b0:67e:3194:db63 with SMTP id
 z4-20020a376504000000b0067e3194db63mr289784qkb.127.1649087034509; 
 Mon, 04 Apr 2022 08:43:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybZ7GEppWMSjwP+Dw95nhG/D+6y4DJjms9Bgretl3gqv1QkhXx47I5wVPODts8wMYZWebucw==
X-Received: by 2002:a37:6504:0:b0:67e:3194:db63 with SMTP id
 z4-20020a376504000000b0067e3194db63mr289769qkb.127.1649087034272; 
 Mon, 04 Apr 2022 08:43:54 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 az17-20020a05620a171100b00680af0db559sm6776261qkb.127.2022.04.04.08.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 08:43:53 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/display: cleanup extern usage in function
 definition
To: Harry Wentland <harry.wentland@amd.com>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, wenjing.liu@amd.com, waynelin@amd.com, Anson.Jacob@amd.com,
 Yu-ting.Shen@amd.com, keescook@chromium.org, nicholas.kazlauskas@amd.com
References: <20220403142137.2234322-1-trix@redhat.com>
 <513a5993-2cc5-54fa-2d6c-f4162d76ab0e@amd.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <462e2f2a-0cc8-2e2e-93b6-504cc12aa768@redhat.com>
Date: Mon, 4 Apr 2022 08:43:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <513a5993-2cc5-54fa-2d6c-f4162d76ab0e@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/4/22 8:22 AM, Harry Wentland wrote:
>
> On 2022-04-03 10:21, Tom Rix wrote:
>> Smatch reports this issue
>> hdcp1_execution.c:500:29: warning: function
>>    'mod_hdcp_hdcp1_dp_execution' with external linkage
>>    has definition
>>
> Which branch are you using?

linux-next from 4/1

Tom

>
> I don't see the 'extern' on
> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
>
> Harry
>
>
>> The storage-class-specifier extern is not needed in a
>> definition, so remove it.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
>> index 6ec918af3bff..1ddb4f5eac8e 100644
>> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
>> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
>> @@ -497,9 +497,9 @@ enum mod_hdcp_status mod_hdcp_hdcp1_execution(struct mod_hdcp *hdcp,
>>   	return status;
>>   }
>>   
>> -extern enum mod_hdcp_status mod_hdcp_hdcp1_dp_execution(struct mod_hdcp *hdcp,
>> -		struct mod_hdcp_event_context *event_ctx,
>> -		struct mod_hdcp_transition_input_hdcp1 *input)
>> +enum mod_hdcp_status mod_hdcp_hdcp1_dp_execution(struct mod_hdcp *hdcp,
>> +						 struct mod_hdcp_event_context *event_ctx,
>> +						 struct mod_hdcp_transition_input_hdcp1 *input)
>>   {
>>   	enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>>   

