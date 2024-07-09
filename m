Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEB492B6E4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 13:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BA910E502;
	Tue,  9 Jul 2024 11:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YyaAu5Uo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BA610E502
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 11:17:59 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1fa55dbf2e7so24567495ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 04:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720523879; x=1721128679; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9LffdEqewAZJmMCfa7ecxMlJEx99J7erlVb1U4mZnCc=;
 b=YyaAu5Uo6P3kri+jCu5z/L0MMyMVm38k8E6pRbkVVVQWjjZQjmCLPRKh7eLaAlDXlU
 lYNQuxSzdl6V1IOFEx+LjKnILuthcQGgp7J6WUHsMddRLiOANiHV1aw/VecM559VE2+4
 u2nIbWiy9GVtv/bplpuuwbZqHFkT0y4yG8Ovo5TC+LT38SyD3MnWHbLfGAxuu2kQg9aG
 yYNkwyh0ccJFIVbnELtXuj+7plBkG92tZpksAX0X65yqV56yMHaTqw7wDEQ/xrTcI2PD
 N5RoBm6fFpFfhR1hmeB4eQEnN1guPgh626YgYUwEFO8w1RU+SNTs0KRNS+47U2kDFP8w
 ljPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720523879; x=1721128679;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9LffdEqewAZJmMCfa7ecxMlJEx99J7erlVb1U4mZnCc=;
 b=OYqeDqclrT3hmKVGn5HvRYnk4zODQOVB79+FYE9UI3j/0LwEIFtFvEkh0zd4xWpK80
 +uPnzJ4N7dHynEqXIeaJjqoRknr6iPO9xLQruW/Tvp2YKPurhJ4Rg5vJ9czZ4xv0MlV8
 VCTZUIg7H1bE6fflfZxZkQiETgwm3aYl4mv7NOqoWFybsUlQj40UB4rJkELG7UwdPdi+
 q/+OVObESrUVXGL2qdadh52VTSkNENMy6J8RSUwtBDXoMXC6hRsnLCurXNnj5NaE2SB4
 vUua6mOKPClL/gE/3gFXXwrBNYSxLyE10h6Fl9rhm/DAcbbP4548VrKhooDSgHQeKSso
 f45g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNumSIVMKo9rd+0YzYrv3r106gaxyHg1PkSRfUAHtk9+hS6rhtcmrRHjmnTZGbdPNnn8aq4vhswpNzvCc8GhJP+Xfa2KHlC+0pD0XunOAF
X-Gm-Message-State: AOJu0Yyx/uNBQR/S2n4NumLJWG12OlkVr5vQwrBqdsPNIp0Gmv/OGyMj
 8gCbMFH8jdaOUshmcN62WWmVHNfZNqPhtTcktACKSmHRMkdQK3qN
X-Google-Smtp-Source: AGHT+IG2Mq9eNcqdHg3oa4a7z2UqJ0SFwWZrv4mZhDGVicRfQokX1Eq15hYu9qp8JCL43PBi68eRVA==
X-Received: by 2002:a17:902:e80d:b0:1fb:93e6:94a3 with SMTP id
 d9443c01a7336-1fbb6d03da9mr17249195ad.18.1720523878976; 
 Tue, 09 Jul 2024 04:17:58 -0700 (PDT)
Received: from [10.0.0.19] ([122.172.81.60]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a107d2sm13957255ad.18.2024.07.09.04.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 04:17:58 -0700 (PDT)
Message-ID: <36aa6067-fa6b-4957-ae33-58a28e32c8fd@gmail.com>
Date: Tue, 9 Jul 2024 16:47:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/mipi-dsi: add more multi functions for better
 error handling
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, LinusW <linus.walleij@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240628182428.171031-1-tejasvipin76@gmail.com>
 <20240628182428.171031-2-tejasvipin76@gmail.com>
 <CAD=FV=VKiEjDfeK8pCqAk8+YWBD2U4ESLik8kiDbvgrZz7o1NA@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAD=FV=VKiEjDfeK8pCqAk8+YWBD2U4ESLik8kiDbvgrZz7o1NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/9/24 5:50 AM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jun 28, 2024 at 11:25 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>
>> +/**
>> + * mipi_dsi_dcs_set_page_address_multi() - define the column extent of the
>> + *     frame memory accessed by the host processor
>> + * @ctx: Context for multiple DSI transactions
>> + * @start: first column of frame memory
>> + * @end: last column of frame memory
> 
> nit: "start" and "end" comments should say "first page" and "last
> page", not "first column" and "last column". The previous function was
> the one about columns.
> 
>> + *
>> + * Like mipi_dsi_dcs_set_page_address() but deals with errors in a way that
>> + * makes it convenient to make several calls in a row.
>> + */
>> +void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
>> +                                          u16 start, u16 end)
> 
> nit: indentation of the above line isn't _quite_ right.
> 
> 
> Other than the two nits, this looks fine to me, but I'd prefer if
> someone else provides an "Ack" in addition to me that they're OK
> adding these extra "multi" functions. Both Dmitry and Linus W were
> involved in the original "multi" functions, so maybe they'd be willing
> to offer their opinions?

I think a better way to go forward with multi style functions is to
use macros. All the multi style functions are basically exactly the
same with the only difference being the function called internally
and the dev_err. This can be represented in the form of a macro, and
would save on a ton of otherwise redundant code, while also allowing 
us to "convert" any function to multi style as and when we please.

We would ideally have 2 macros, one for the main functions where we
desire to modify accum_err on an error arising, and another macro that
just checks accum_err to see if the function should be a no op.

If you guys think this is a good idea, I'll work on the macros and
do the multi conversions in this new way.

-- 
Tejas Vipin
