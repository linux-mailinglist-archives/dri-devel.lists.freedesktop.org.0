Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F33324AF624
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69B510E2AC;
	Wed,  9 Feb 2022 16:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC8C10E2AC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644423052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mFGitWE2+XjLxofbVGLQx4GJSy8OuJZkaSySeP1Crog=;
 b=YKs+rs7+5JM5fyry2MoRRsju2hG10pe80fQdcBhGad1s0d4fq/trs7/GOuTYTDiAzv84xd
 FPHUunKmwOYJ96OGsHP9C+x+qfP9DaSQqusyMgsMJtnSaDzn+AexUCFSeAX5pPAsco7uTD
 jQXCuWgk4lnppcRxl3FxRXq8TYQmPto=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-PdH9lSw2Mh-uShK-8yOO3w-1; Wed, 09 Feb 2022 11:10:45 -0500
X-MC-Unique: PdH9lSw2Mh-uShK-8yOO3w-1
Received: by mail-wm1-f70.google.com with SMTP id
 p24-20020a05600c1d9800b0037be98d03a1so2294723wms.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 08:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mFGitWE2+XjLxofbVGLQx4GJSy8OuJZkaSySeP1Crog=;
 b=Szm6JB+mqQcUI0sEmmpXQ5p20UBMJxh16JS4jFeObWgyP9F6sv2xgiJ4qQKfBYqacD
 ZNFNgMWy7fii4OFXSd4bqcV3MNGcjTUoshHnJnbuv1mXwnkkA2rZqvySpStUKDQ2b9Gm
 joji1J1K7ZI6SNcaiyBgYkOftDU5cXHeL1seW8n1I7Nm99g8DVCOktfL5o9noE8P5ruL
 SSH1QcvECaqFV2QU6ZkQDUitSdOXnpJKyek4N3hPLTIFhU8m1+EnVeGLJsYudhsUPFtE
 riWVymjWscuwLIbxAF1plBo8+T7Q+2qUEqvBv4oC+b7WdyK4mtFlOJ3dfxLQXUTSImbj
 cL3w==
X-Gm-Message-State: AOAM533xos7v2YvyDPju0u6G4MfNsUGSNTo7BgvtTfmaoehxLAVIoPzj
 DXuKmRG+Y+j7eFUSNjOFofH1HbY8lqkYjM3MWCp1+dRRCbyK6V2rXu18bf2uZl8FPH+WnbjM7bK
 hORfDlxw8SlMyqunycfVc/lFoSpak
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr3214207wmq.44.1644423044643; 
 Wed, 09 Feb 2022 08:10:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3zGpKODhlGXZHF/WUPS4W/m1RBSXDfqzPUnuyKsIXdGF/OBtwjUhqThnva+EpdQTtV3YvBQ==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr3214181wmq.44.1644423044396; 
 Wed, 09 Feb 2022 08:10:44 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id c18sm6654588wro.81.2022.02.09.08.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 08:10:44 -0800 (PST)
Message-ID: <ee81dc1f-2a45-9113-f1fb-47ef226a0da5@redhat.com>
Date: Wed, 9 Feb 2022 17:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209091204.2513437-1-javierm@redhat.com>
 <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
 <e6efb2fd-300e-5282-1f2e-a68130d0b45a@redhat.com>
 <YgPbleB+LAQ5ZXyB@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgPbleB+LAQ5ZXyB@smile.fi.intel.com>
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
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/22 16:19, Andy Shevchenko wrote:
> On Wed, Feb 09, 2022 at 02:04:17PM +0100, Javier Martinez Canillas wrote:
>> On 2/9/22 13:25, Geert Uytterhoeven wrote:
>>> On Wed, Feb 9, 2022 at 10:12 AM Javier Martinez Canillas
>>> <javierm@redhat.com> wrote:
> 
>> Yes, I know. Didn't feel like it, because the patch is a WIP anyways
>> (I haven't tested it but was included just for illustration purposes).
>>
>> If someone confirms that works then I will include a proper DT binding
>> in the next revision.
> 
> In a few weeks I hope I can do this.
>

Thanks, there's no rush. I just included this for your convenience because you
mentioned that have an display with a SPI interface.
 
> But you know Linux is almost always broken (*) on the certain embedded device
> if nobody keep an eye each rc cycle. It might take time to return it in shape
> first.
> 
> *) Speaking out of my own experience with device(s) that I possess.
> 

Unfortunately that's my experience too. I'll keep this patch in the series and
marked as RFC. But in v4 will extend the DT binding to mention the SPI devices.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

