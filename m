Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 676B04D014F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 15:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30EC10E1C3;
	Mon,  7 Mar 2022 14:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE84110E1C3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 14:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646663603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BqBsilqCKDCrxnxeJqaARCUBXf202zo2/T5FUy2wzuY=;
 b=Of7s3S4cj9ow7uZoPlKnfmpowKYTm4bjKtXS+wX0wvXP8F7MNN25lcr/erFAnGDEuyRFHA
 QyadDTVTBbBJn9lmofuZZCRDGu/My6FiAI5SCbn3hc2w4/zmblhrbbziUOd28tqI6cE0ON
 YzlYBshSApaqKLFRx5fDKT8HcNjWW98=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-AgW0uKhIMymLhfSWUg5BpQ-1; Mon, 07 Mar 2022 09:33:21 -0500
X-MC-Unique: AgW0uKhIMymLhfSWUg5BpQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 y13-20020adfee0d000000b001f1fa450a3dso566227wrn.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 06:33:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=BqBsilqCKDCrxnxeJqaARCUBXf202zo2/T5FUy2wzuY=;
 b=B/xrUyb5NPFbqjVoUj0aTIdOLpKaVO3DDXvT2ld2NWCNsYrka7J8nmQJA1RC+k1mmI
 OJ6fplP7uYUXw0NMq+kLw5M8yo62aYC5f+kmNnGSp9bqEDjGzt92GoHnWRoGHA00u7jp
 svy5WBW5A4UqmR5mHTxc7LgO16GNi5/q1UsipBkGEeTLYDr+k9R7hFw2wDPgJIhvILbl
 btwkO6CzTkBIHYopNANYHiNot3pYXtXjFyQ0in7NrntvTSsNRY2ofFMZp74JS5RlIZ5s
 XQxuXoNhCap0hH2enAjVWY20Wt+Sjce5XYsqsjzXbhNLRAfs0v+Z86SNqrHNLwU0qPEN
 pkcQ==
X-Gm-Message-State: AOAM533wE1WyKiAuZVzUy5XWovZQSsUfELpijo4bhKG0HRuuJFBSawqK
 AMWjASYLGn0beaKvwfdGlJh5cyJUeMBKhaRV4wHYNXaH4VgUY8njfZxvjYRo4Opxlcz7CJ778Gx
 lJ+yW1Sw4GPQXwYgcXF9MsoZvodS1
X-Received: by 2002:a7b:c154:0:b0:388:8e6e:ff76 with SMTP id
 z20-20020a7bc154000000b003888e6eff76mr9711129wmi.191.1646663600073; 
 Mon, 07 Mar 2022 06:33:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfRVYkTxAcRn47Pfs4K6l3yvxYBhJf4kPwPZnm8FvG7VYk1WZXxsFh62kxfrGjwDoyNK0tCw==
X-Received: by 2002:a7b:c154:0:b0:388:8e6e:ff76 with SMTP id
 z20-20020a7bc154000000b003888e6eff76mr9711104wmi.191.1646663599814; 
 Mon, 07 Mar 2022 06:33:19 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l18-20020adfe592000000b001f064ae9830sm9837404wrm.37.2022.03.07.06.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 06:33:19 -0800 (PST)
Message-ID: <9982c5a7-9715-7cdd-59be-8f27a65f32bf@redhat.com>
Date: Mon, 7 Mar 2022 15:33:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] simpldrm: Enable boot time VESA graphic mode selection.
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20220218093334.24830-1-msuchanek@suse.de>
 <354f3cfd-bfa0-3ebe-3d67-705423d9294e@suse.de>
 <20220302193846.GT3113@kunlun.suse.cz>
 <2ba8497f-ba6d-558b-d782-bb3ee67d23ec@redhat.com>
 <81f87874-4aa8-265d-a0ed-c8a67708a92a@suse.de>
 <8d1c3caf-96ad-ae4c-021e-ac38f179dfcb@redhat.com>
In-Reply-To: <8d1c3caf-96ad-ae4c-021e-ac38f179dfcb@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-video@atrey.karlin.mff.cuni.cz, Borislav Petkov <bp@alien8.de>,
 Maxime Ripard <maxime@cerno.tech>, "H. Peter Anvin" <hpa@zytor.com>,
 Martin Mares <mj@ucw.cz>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@redhat.com>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/4/22 21:47, Javier Martinez Canillas wrote:
> Hello Thomas,
> 
> On 3/4/22 21:00, Thomas Zimmermann wrote:
>> Hi,
>>
>> I've merged the patches into drm-misc-fixes. Thanks a lot to both of you.
>>
> 
> Ard already picked these through the efi tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/log/
>

I talked with Ard and he kindly dropped these patches from the efi
tree. So everything is fine.
 
>> Best regards
>> Thomas
>>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

