Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B9A4AF798
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232A310E3C3;
	Wed,  9 Feb 2022 17:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB10810E23E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644426298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nGt1sk91AWrErDudwLdxz09p1Z/A3GC5vPQgc/7QHA=;
 b=fn4rjVms3TvKhIry+agCcOHNRr3YekAFd0CIcsuMyFVdM8OolKRvpopPix+62dxTCmUVNo
 d3RR2NdXXOS22ES1z6RdcQzingKRM9IwxAXM7wcyq/le+8kt11Z55ZwML/kE63EM9Iau1E
 kcingd9mpXqG5FQcMZvt0jjAMEnuXM0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-PopwhE1xPLifHmxbY1xYBg-1; Wed, 09 Feb 2022 12:04:57 -0500
X-MC-Unique: PopwhE1xPLifHmxbY1xYBg-1
Received: by mail-wr1-f69.google.com with SMTP id
 b8-20020adfc748000000b001e333edbe40so1347174wrh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5nGt1sk91AWrErDudwLdxz09p1Z/A3GC5vPQgc/7QHA=;
 b=xxoCA+lW05tDsWpgY4NwcKYhDNJoFdXUSJgnNnDinEKKNNJTgt3MSdjhjoJX7PweUd
 SnF3/tDs/zKFCGtDruIy2Z+eMntTmjo4+O+ECGZYm7qs3zGQuGoWwNO/hvUQBNwapbmV
 ge/tLV0NPRL7a9j9YdpYG2DxjU80n9RNbjvR6QAtffDYZ/ZeiVAkagMbx43hHdQyBcbS
 9UzOG0O3Gnf2BLmjoq5XMl89Td0zLD43xOsr5yFRhE9Ny8h/pHjDjLFH5+93ibLmRwpC
 xvPjdcnJEHbOI5w1qVu8vxTv8GyROdat0JkIsqhq1cr6LNR4ozW1b1Cqf+cACS83Nkqr
 YBcA==
X-Gm-Message-State: AOAM533qNsUsE0G96O8qAXT0NjIDXuQA2Bnckjsbm5od1+0lblfqqUcZ
 DqPMZpzuXpkGUF3ExOW57V1D/8MKILiAcczQabvsLBdktoR7qHAo+H8y00vXFbXEiBJFEiIi1eC
 PT7nW+nMiho6dG6D4N3COsn5NoBW7
X-Received: by 2002:a5d:52c9:: with SMTP id r9mr2859444wrv.449.1644426296220; 
 Wed, 09 Feb 2022 09:04:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxz9gThGzXLX/giWr/W1JvBYUZrrvATgUCuQX0yG/Chw7zuZKfaPye67aCPQ6VfuNzsiGcx7w==
X-Received: by 2002:a5d:52c9:: with SMTP id r9mr2859414wrv.449.1644426295970; 
 Wed, 09 Feb 2022 09:04:55 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o14sm5276066wmr.3.2022.02.09.09.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 09:04:55 -0800 (PST)
Message-ID: <46b671fd-3929-4cf0-1e0d-5f6305464238@redhat.com>
Date: Wed, 9 Feb 2022 18:04:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209091204.2513437-1-javierm@redhat.com>
 <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
 <YgPbAL0I8Wn7nnNb@smile.fi.intel.com>
 <d32c731b-c06f-2dcb-5a6d-1a84351719b2@redhat.com>
 <CAMuHMdXsAyp18ivtSe-ZVmu6xbBBnvjMuZ=H1w9Gk=Ys4rkCeg@mail.gmail.com>
 <YgPuy1QVv9A7rcCh@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgPuy1QVv9A7rcCh@smile.fi.intel.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/22 17:41, Andy Shevchenko wrote:
> On Wed, Feb 09, 2022 at 05:25:03PM +0100, Geert Uytterhoeven wrote:
>> On Wed, Feb 9, 2022 at 5:07 PM Javier Martinez Canillas
>> <javierm@redhat.com> wrote:
> 
> ...
> 
>> Are they all broken?
> 
> I guess it's incorrect question. The one we need to ask is is OF code broken?
> B/c ACPI can easily cope with this (they are different buses, can't clash).
> 

Yes, it's a problem specific to OF. It works correctly with both ACPI
and legacy platform code.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

