Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF744D27F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 08:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072E56E951;
	Thu, 11 Nov 2021 07:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A496E951
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 07:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636615877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYQEw5GVtmhIImAbCeB41t1wheO6mxsaCZLTEEKlNIY=;
 b=If0xiAVKqkEvAjK4aHEiw60HXIEYCStFaOVz1p4ERFog1/BhmdHjZs5UvgW4xDhIP/qMIG
 U3oAC8sfb0foingle3NcTHPs7S0/yVynCTLnUybDAiazIvK1FhoWDmVNrMI+4FH1ur3EKl
 e0u1h9zaI1cRxDIdJM6VSItEZkP4yrc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-4Hg-fwh_MsWOPCQz28QZ9g-1; Thu, 11 Nov 2021 02:31:14 -0500
X-MC-Unique: 4Hg-fwh_MsWOPCQz28QZ9g-1
Received: by mail-wr1-f71.google.com with SMTP id
 y10-20020adffa4a000000b0017eea6cb05dso833753wrr.6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 23:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZYQEw5GVtmhIImAbCeB41t1wheO6mxsaCZLTEEKlNIY=;
 b=QQe/tS+cT2HsWMD59uBdoaSu3WjfAz9rf+j0Zdif31fIHBxP/qBFSnmNfHE4w7MfUm
 DYK1V8lkXz7qKDFC71W+9++KPr0SWAvvA5yRg74lGbRKEkoS7LpjF9ICaGpTeLIXEr8/
 EjKSes6FVevxA6T+4FRs3zCIy7Vn8uM0v3nYN+P5Ia8+jT15/hH8DUFWmA554dNqhNC8
 LO2vU1VNmGqT/AgLqvm46zkhmsWqE5VjqgQPvPVTTAGUUp+hyTq+0ZQf6YfFsqtJWgHA
 cyAI6ZJDUhUhj1zEUTQnzdST5oRID3xr4I2FGKZKyIGur0WzR76eGpuwSmELckUVQ9WO
 O8MQ==
X-Gm-Message-State: AOAM530JMy0r/29k5REwgtR6klGHId1OeaiBhna6uAEsWJrByUOrGOW1
 MRhaZ7liLusmh5rFQlkKmCMyK3gXGeRIPLDiDsM8DNO1ufg2SfoNDDQ9t1aN2XJEGE4EQ1jelBK
 DL46itcKeg/QlLaWX3DAb4SVqPkhS
X-Received: by 2002:adf:ee04:: with SMTP id y4mr6361297wrn.0.1636615873229;
 Wed, 10 Nov 2021 23:31:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1JLpDvD1ipMwjqp3XjHqiTZwSRafDcbKcys/CZyMEO92UHHU3jo67AkcjMz8ueVY4Z8KreA==
X-Received: by 2002:adf:ee04:: with SMTP id y4mr6361266wrn.0.1636615873037;
 Wed, 10 Nov 2021 23:31:13 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id h1sm1962703wmb.7.2021.11.10.23.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 23:31:12 -0800 (PST)
Message-ID: <af0552fb-5fb5-acae-2813-86c32e008e58@redhat.com>
Date: Thu, 11 Nov 2021 08:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [REGRESSION]: drivers/firmware: move x86 Generic System
 Framebuffers support
To: Ilya Trukhanov <lahvuun@gmail.com>
References: <20211110200253.rfudkt3edbd3nsyj@lahvuun>
 <627b6cd1-3446-5e55-ea38-5283a186af39@redhat.com>
 <20211111004539.vd7nl3duciq72hkf@lahvuun>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20211111004539.vd7nl3duciq72hkf@lahvuun>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: len.brown@intel.com, linux-efi@vger.kernel.org, regressions@lists.linux.dev,
 linux-pm@vger.kernel.org, pavel@ucw.cz, rafael@kernel.org,
 stable@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 tzimmermann@suse.de, ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Ilya,

On 11/11/21 01:45, Ilya Trukhanov wrote:

[snip]

>> Can you please share the kernel boot log for any of these cases too ?
>

Thanks a lot for the testing and providing the info!
 
>> This is just a guess though. Would be good if you could test following cases:
>>
>> 1) CONFIG_FB_EFI not set
> 
> /proc/fb:
> 0 amdgpu
> 
> dmesg: https://pastebin.com/c1BcWLEh
> 
> Suspend-to-RAM works.
> 
>> 2) CONFIG_FB_EFI=y and CONFIG_DRM_AMDGPU=m
> 
> /proc/fb before `modprobe amdgpu`:
> 0 EFI VGA
> 
> after:
> 0 amdgpu
> 
> dmesg: https://pastebin.com/vSsTw2Km
> 
> Suspend-to-RAM works.
> 
>> 3) CONFIG_SYSFB_SIMPLEFB=y and CONFIG_FB_SIMPLE=y
> 
> /proc/fb:
> 0 amdgpu
> 1 simple
> 
> dmesg: https://pastebin.com/ZSXnpLqQ
> 
> Suspend-to-RAM fails.
> 
>>
>> And for each check /proc/fb, the kernel boot log, and if Suspend-to-RAM works.
>>
>> If the explanation above is correct, then I would expect (1) and (2) to work and
>> (3) to also fail.
>>

Your testing confirms my assumptions. I'll check how this could be solved to
prevent the efifb driver to be probed if there's already a framebuffer device.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

