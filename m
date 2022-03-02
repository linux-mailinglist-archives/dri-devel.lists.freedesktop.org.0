Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5E94CA239
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDAB10F47A;
	Wed,  2 Mar 2022 10:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A388810F478
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646217163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPpPQo0rFTcgUQrPoN9LDSfjjllxDYkn6tRSloMNpvs=;
 b=jP/jOnOORxqjrNxjJIFJEAceENdF8ET2fhw5OMqxoEda0t0WA6hq739zqoBJauTxf4yx7V
 bXGMQOYWPdWL50URkJ1JR5he3bLJTRZT07A+w2zCmMrdtZ5DMOlKOHPgXijdwIhATFJSVD
 Trrppp8MOjTb41BVrGOofTPiL1QTnZM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-QybQlxyeOIWAlv8HPAZCxQ-1; Wed, 02 Mar 2022 05:32:40 -0500
X-MC-Unique: QybQlxyeOIWAlv8HPAZCxQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 c23-20020a170906925700b006d6e2797863so759034ejx.14
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 02:32:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kPpPQo0rFTcgUQrPoN9LDSfjjllxDYkn6tRSloMNpvs=;
 b=uPpjAVWaR5MGMEOjHd/eDYQUSz1T2IjXxUiAChq9xLB9yKtSy9wL6IE43lIlJ/utjN
 +efsS2RLwj5vbfHSySN2E/+pQwLJat4nVz428JoU81+AvzngzzLox04aa7KXdgAOYZ2b
 HN3l2sYGAjLWGCGyISgRAx9n9Nj9ysIdjSFR/XW0YU4uGJhveNtx0VPXoVju9+vRb0Jm
 SweJYtD4pC5byauKO6IdmcppL4XPtBJFxCz5ABeE+BTk3yUqaKPLbjzxfvszuZB9WjLa
 hPZhAu1FIhMIKhXEAlCTXH4sFhsdW/bw4E9gWR6PQ7hSlcVgAqDPh1v76K4KL6BwOu1r
 DJ8g==
X-Gm-Message-State: AOAM531V94Z/IBdtG1LjpggoamD7KSKwEbm8uREPFFYkDzRXerotHCKi
 JIEc7L9ZUOw4Z8I9m/7PR3a0cMZdxTPGMEFH+QzoaC2GuKfMIIWIG9qFXnOtw/OKzKIOYJ8WpvM
 7RRtb6LZpfDUHsu6xDPykWL8aAMYI
X-Received: by 2002:a50:8d1a:0:b0:415:a1ce:89a8 with SMTP id
 s26-20020a508d1a000000b00415a1ce89a8mr4185344eds.146.1646217159196; 
 Wed, 02 Mar 2022 02:32:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgt5fBNpSUSHz6W30noIClOvZSA7o9CWwo8lkYp+IWSlTUeGZLpFqRU4MWM0XGxUgTLVLFbg==
X-Received: by 2002:a50:8d1a:0:b0:415:a1ce:89a8 with SMTP id
 s26-20020a508d1a000000b00415a1ce89a8mr4185326eds.146.1646217158987; 
 Wed, 02 Mar 2022 02:32:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a056402068300b0041594aa9eedsm1554151edy.54.2022.03.02.02.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 02:32:38 -0800 (PST)
Message-ID: <9925b272-b52d-be3c-bac9-e56cea421199@redhat.com>
Date: Wed, 2 Mar 2022 11:32:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: linux-next: build warning after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
References: <20220202150201.290c7d3d@canb.auug.org.au>
 <20220202150320.3e9bdd62@canb.auug.org.au>
 <f50d5044-7192-bdb3-7ca9-7217ed311787@redhat.com>
 <20220302123417.2c84200b@canb.auug.org.au>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220302123417.2c84200b@canb.auug.org.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rajat Jain <rajatja@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/2/22 02:34, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 2 Feb 2022 09:38:37 +0100 Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> On 2/2/22 05:03, Stephen Rothwell wrote:
>>>
>>> On Wed, 2 Feb 2022 15:02:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
>>>>
>>>> After merging the drm tree, today's linux-next build (htmldocs) produced
>>>> this warning:
>>>>
>>>> drivers/gpu/drm/drm_privacy_screen.c:X: warning: Function parameter or member 'data' not described in 'drm_privacy_screen_register'  
>>>
>>> Actually:
>>>
>>> drivers/gpu/drm/drm_privacy_screen.c:392: warning: Function parameter or member 'data' not described in 'drm_privacy_screen_register'  
>>
>> Thank you for reporting this, I will prepare a patch fixing this.
> 
> I am still seeing this warning.

Weird, this should be fixed by:

https://cgit.freedesktop.org/drm-misc/commit/?id=ccbeca4ca04302d129602093c8d611065e3f7958

Which was added to the "drm-misc-next-2022-02-23" drm-misc tag/pull-req 7 days ago,
which was merged into drm-next 6 days ago ?

I just reverted that did a make htmldocs and got the warning, then re-applied and
the warning was gone...

Regards,

Hans

