Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D73039B9DA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 15:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004486E3F2;
	Fri,  4 Jun 2021 13:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D2E6E3F2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 13:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622813394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4vqdxAxb+FyKVptS/rdHSrnCV/69LLPC/JgrurjJvmc=;
 b=PqSsEAYRlqIA8Cednir7iY+/EMOefTnW5JU4wvN/Hy4aFpoVSMuwrzxGWcpSZsmGxPYLCX
 FdTx47pLmQJQ+0a0aePOrVkdZZ/EY4Mf+KOAx94dr9NmRVhNB+z5lmvDfBKbGTrtskEcF4
 scWH01eveqxwYy10TLLeZOC12e9tHvc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-VHk8Tm2sNYeFMxFum-hSxA-1; Fri, 04 Jun 2021 09:29:51 -0400
X-MC-Unique: VHk8Tm2sNYeFMxFum-hSxA-1
Received: by mail-wr1-f72.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso3956112wrh.12
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 06:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4vqdxAxb+FyKVptS/rdHSrnCV/69LLPC/JgrurjJvmc=;
 b=HsRlWg4VDR//u2KIMGJ7IymXTLl4/EGXd/F1LobzagAvO4eyZ9RH16qvMAZuzysA+I
 6U3oCTbnHRPGlCuOig0zm89EqalP09NEaabZhsEc44oszg7rLqSBhi7KXivcxDt25y4K
 R5BdJL+hMygS9QgYOTh1/2fBFlzJw540BffxENDOiumEKWdb9EIT0VgZMRiv8v8Xr7F3
 fxsdxOe4sP8c2qwnNPZ8qY38i8Jb8hKc+7fDhW7FLORuqujLcyuAeuorpN+rfF8c3wMU
 CGIqi3UwGy1DR4oSdNtSnCjE7eJXqVHZ2j4Co1GTcp780Cf9oYh5tafPKgIfMl9UTsZp
 EqXQ==
X-Gm-Message-State: AOAM533/9FKPKjAQ3bK2KR+qKAHSJ3R4HYKcPMuTap3GO56RG7O81dkM
 htcMZZlCyqhuiN6AdqxeLKLFxm+8hMMTVnhVmxfi+tDtCcMxEyeNq93W82Gk/GsyilqLJGpvg+v
 av6HflooDURv3B7s+RYpomuOleRL8mOBvQ1beddWhObIrNXHOMFypxtb4UskPQlC2q6Em4Z5ORc
 XEwKg=
X-Received: by 2002:adf:cd87:: with SMTP id q7mr3923970wrj.370.1622813390357; 
 Fri, 04 Jun 2021 06:29:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySXMk8hUiTTNMVEd5Qvw0VZw2bXLMJ6iiTq2xujbSth8ca1T1q1m02xGfFSHrG6+w5kWxdNQ==
X-Received: by 2002:adf:cd87:: with SMTP id q7mr3923952wrj.370.1622813390161; 
 Fri, 04 Jun 2021 06:29:50 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id r2sm6795951wrv.39.2021.06.04.06.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 06:29:49 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] allow simple{fb, drm} drivers to be used on non-x86
 EFI platforms
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20210601145912.774054-1-javierm@redhat.com>
 <YLk7HjX2OnLhMt4V@zn.tnic> <c48c6261-c9e5-29cd-8d43-6dbbcb2034ff@redhat.com>
 <YLoakvzpKwL4gVFQ@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <fa85dc40-0972-98e4-f7a4-1aa1e1a6a482@redhat.com>
Date: Fri, 4 Jun 2021 15:29:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLoakvzpKwL4gVFQ@smile.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/4/21 2:20 PM, Andy Shevchenko wrote:
> On Fri, Jun 04, 2021 at 11:41:29AM +0200, Javier Martinez Canillas wrote:
>> On 6/3/21 10:27 PM, Borislav Petkov wrote:
>>> On Tue, Jun 01, 2021 at 04:59:10PM +0200, Javier Martinez Canillas wrote:

[snip]

> 
> For myself I wrote a script to try being smart [1]. At least it works for me in
> 99% of the cases. Otherwise I add manually --cc or other related options.
> 
> [1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh
>

Thanks a lot for the pointer. I'll take a look!
 
> Feel free to modify (patches also are warmly welcome!).
> 

Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering

