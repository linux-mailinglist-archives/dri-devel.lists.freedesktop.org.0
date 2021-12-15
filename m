Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D6D475561
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B12C10E400;
	Wed, 15 Dec 2021 09:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30F610E400
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639561511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uOfhMPMzb3b+8cFxZBwAoJpd4V5hJXJBPtGjNJ39SAM=;
 b=dXQsm9wd6V8MUs76jtZNieQVdJ6GJruNBkUInxoKDHpWnqY1wqJeeuSHiMjrjZ1APWWkzV
 2Zws7bycuEsnKS/Bh9N6xyQQO7rJnIJzRrySHyv6SS2v7PfiMe3kIxC5WsfK0Ro9Z//d8u
 GpjVZgg/sqKDywDaI1epiMeWXrmwgZk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-OcTF8fw8MSqZPcUSiUmS4A-1; Wed, 15 Dec 2021 04:45:07 -0500
X-MC-Unique: OcTF8fw8MSqZPcUSiUmS4A-1
Received: by mail-wr1-f71.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so5700736wro.18
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uOfhMPMzb3b+8cFxZBwAoJpd4V5hJXJBPtGjNJ39SAM=;
 b=WWY4PaShq6X2WkJDKyX6AlDUEasVVgsJu6YbwIpA91uJA60yf/bWl18kALh+aBxhko
 ivxktpsqnY0Hf43MRW/ko3TqcboLBAjTeJQtJddWGV52IB/+17uL/UQ/BI2bysK/LBfr
 mMJ9k1twbb2zMHKrpMF08tZGoLhgBSRzt8c1fvkcvTJw5v6h2/WjbT9BzQvdILPVZhub
 S3hsbBFfHdyiQ5KDZwE/jZ76CMfrFmgPoIBR7s/l9CMk4myBh8q5/iUQCwUssg6KsZv0
 /bVYLWkW+pGGp+FpCGOM/Fl7ofZ35rsN4P+dt4I+WZHhUWwBnhn3Zmda84PkRaGsEg+C
 8D3Q==
X-Gm-Message-State: AOAM530nmElFs4g13kZlepmlSVNLeXfcTs33Km+Adg1i1m349kVab44S
 BBma/8RcoCkTaG4q98mrDWVznmnfBZBCrNoIiVVTHGaX15LTH7vNZoNQ7rzAH7fUKY6N3skHHis
 A37wPRovgHUdmHDiGUZjt7OahyJQN
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr3539951wrw.104.1639561506808; 
 Wed, 15 Dec 2021 01:45:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeVaU0EvxegObzc8k4zlvSkAP+oYtkR2V06K+lEh+m+Jl9TcbiXRBDr5RTDDcpxNu5TORHcA==
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr3539941wrw.104.1639561506619; 
 Wed, 15 Dec 2021 01:45:06 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id x13sm1469172wrr.47.2021.12.15.01.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 01:45:06 -0800 (PST)
Message-ID: <a919884b-1e28-bf49-5de6-5cc2b6329969@redhat.com>
Date: Wed, 15 Dec 2021 10:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 07/60] drm/etnaviv: Add support for the nomodeset kernel
 parameter
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-8-javierm@redhat.com>
 <190d0eea4c134539a500a3fae514bb6e3025a7ec.camel@pengutronix.de>
 <36d2ca10-22ae-5c15-4ab1-6ff84507c0cb@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <36d2ca10-22ae-5c15-4ab1-6ff84507c0cb@suse.de>
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
Cc: Erico Nunes <ernunes@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[adding Erico Nunes to Cc list]

On 12/15/21 10:39, Thomas Zimmermann wrote:
> (cc'ing Maxime)
> 
> Hi
> 
> Am 15.12.21 um 10:18 schrieb Lucas Stach:
>> Hi Javier,
>>
>> Am Mittwoch, dem 15.12.2021 um 01:59 +0100 schrieb Javier Martinez Canillas:
>>> According to disable Documentation/admin-guide/kernel-parameters.txt, this
>>> parameter can be used to disable kernel modesetting.
>>>
>>> DRM drivers will not perform display-mode changes or accelerated rendering
>>> and only the systewm system framebuffer will be available if it was set-up.
>>>
>> Etnaviv is a render-only driver, so will no perform any modesetting on
>> a display device, so I'm not sure if it's sensible to cover it under
>> the nomodeset parameter. I see that it is consistent with the other
>> drivers that deal with a combined render/display device, where the
>> render device also gets disabled with the nomodeset param, but it
>> doesn't really match the description of what the parameter is supposed
>> to do.
>>
>> I'm not opposed to take this patch for consistency reasons, but I would
>> like to hear some more opinions from other DRM folks.
> 
> Our assumption is that we want to disable all DRM drivers; except those 
> that operate on the firmware's original framebuffer. That's why the the 
> test is called drm_firmware_drivers_only().
> 

Yes, we tried to document the implicit "nomodeset" semantics to make that
clear: https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b22a15a5aca34c8f59b770f858b1c21d347175e0

> We know that nomodeset is a terrible name. We only kept it because it 
> was already there, widely used, and already does what we need.
> 
> We had similar concerns with the v3d driver of vc4. Javier, maybe we 
> should leave-out such special cases for now and discuss them separately?
>

I was discussing the same with Erico (one of the lima driver developers).

Agree that we could leave those for now. Will drop from the patch-set all
the DRM drivers that don't have the DRIVER_MODESET .driver_features flag. 
 
> Best regards
> Thomas
> 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

