Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BBB4AF5FF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51B510E18D;
	Wed,  9 Feb 2022 16:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E728F10E18D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644422756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5TAmHdeWTvg28aUVJ1ETzsjk2tMW9UdCMcB5C9Mn4Tw=;
 b=HTN3YklO3OpS5FeED2fxuLyH6lK9aHvCjRtMNrNtnujC9mCjV7wo7IiqtCAQU5EIfppvNH
 Fl7NjiFo4c/dGN6CYeJhMUQ7Q1I3/IKYFUJVcUDY/3K5W4+IUuuJYYSESoHLVg+1RQx5Tt
 DQ4Hd1ZKQAsnjdovhPscpSO0HxQdgmI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-LodtZPjlPZy-ZdQ7k8uipg-1; Wed, 09 Feb 2022 11:05:55 -0500
X-MC-Unique: LodtZPjlPZy-ZdQ7k8uipg-1
Received: by mail-wm1-f71.google.com with SMTP id
 a17-20020a05600c069100b0037bb7eb6944so254614wmn.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 08:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5TAmHdeWTvg28aUVJ1ETzsjk2tMW9UdCMcB5C9Mn4Tw=;
 b=Ihoby9uAGEjlvnpdGQAxUwwZv4YoDPGdL31Vc7mBNvrkji1xfVnyz8kR1csXrFSMPp
 s9hVSCAy1Hie1f1OgTDjxuacWL/lKVEF2zFj6QFrq8yuJQsq3/49HUmDcAti6hEpiEI0
 uyS9ZrspA2048X2KSobR20gNjCXBm3xgaH3jDg7u7zsRVWGmHiisM52MR6VDyRtL1j7s
 I9/1fc+iP8K9xu7a5ilmvjoyeuhOruFO3pDMqk5fcdzXLU4KEn2wNLVd1SmlOr3GUAFf
 xWt8h4nEcZo676KopOeJ9H019xEIjuwYh1Z8FA0yOw57ZYgDGEYxqptN7ZKQiWpvqf/Z
 qJyA==
X-Gm-Message-State: AOAM532dhrhXkoxSTRfaYH54dOLdLrFWUOrm7oE2wvJTk92hiYKRdCQr
 0kOwR6HUCUFF0DuO2PEalDSJFKB6ySaoE+0+odl8TLzi/xKN+JDNofYGISmrLhmKMaAXC54YJBC
 40e2cnsbM9LYTlgI7MgSRMOTkGNwC
X-Received: by 2002:adf:ffca:: with SMTP id x10mr2725660wrs.248.1644422754709; 
 Wed, 09 Feb 2022 08:05:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQmH0hF86x5L3n3fUWIlDsIruVfpsZiFRZH6CEakA0J830BtIAGYu0zKtjzdbc8XMHNPqYCg==
X-Received: by 2002:adf:ffca:: with SMTP id x10mr2725648wrs.248.1644422754526; 
 Wed, 09 Feb 2022 08:05:54 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r2sm19113350wrz.76.2022.02.09.08.05.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 08:05:54 -0800 (PST)
Message-ID: <af9959db-96cc-8d53-27c7-9a0db1bbfdbe@redhat.com>
Date: Wed, 9 Feb 2022 17:05:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209091204.2513437-1-javierm@redhat.com>
 <YgPa2AD727QnlRWW@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgPa2AD727QnlRWW@smile.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/22 16:16, Andy Shevchenko wrote:
> On Wed, Feb 09, 2022 at 10:12:04AM +0100, Javier Martinez Canillas wrote:
>> The ssd130x driver only provides the core support for these devices but it
>> does not have any bus transport logic. Add a driver to interface over SPI.
> 
> Thanks!
> 
> Same set of comments as per I²C patch.
> 

Sure, thanks for your feedback!

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

