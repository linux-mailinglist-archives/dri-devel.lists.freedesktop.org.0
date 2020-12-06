Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 314AF2D0774
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 22:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BD289D4B;
	Sun,  6 Dec 2020 21:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8770189D6C
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 21:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607291271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OTK3a2EpgqcMFsmrPHPH78wqX4JkIQW5zqkRG3GIknw=;
 b=FlZ0wNS/ycKBLEokaQYLOlmCnB3shNHP4xpWZ5n7P+reeoT7MAjiK/axVVJT6hQFcxO1RB
 E2nFQGH4Ee0ftXq+xeVSB2haUpLTcmgHBlwn9upx6ty5os1Qp3R/WKJdYEDswi+40BD/VP
 uB32SfucfJlwtyKJBborXBm46+o1wcg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-RM0_1cf_OuSIh5x7GYK4Xg-1; Sun, 06 Dec 2020 16:47:47 -0500
X-MC-Unique: RM0_1cf_OuSIh5x7GYK4Xg-1
Received: by mail-qk1-f199.google.com with SMTP id q25so10703097qkm.17
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 13:47:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=OTK3a2EpgqcMFsmrPHPH78wqX4JkIQW5zqkRG3GIknw=;
 b=UdgRedRyV7NrCfyG6D+5U6p/kJ7vvSmg8fhE5LGNrAEq95dQr3T8tzYt89ZG3KjtJb
 lpU4sb0pnLA948lJn73dWbgEhcr6OOagHWYyAJPCYbtCGSWqv2s32TLLeDooa3YhPskY
 wbq8nh1yA6uv0oWNRX0Pkn35ubsaFk+u23n9ogfrGB3+5NOAKmyJe2S6WLBryMsD0/do
 9Gatpd/n8xaBnBID4rAuU/JdYEGQ21+0U/bNyEzgtxM/X8W3k6qn0NTWWp3NVvAb1LcY
 81qlnkNCvM2Vie0PlPoUka1cffVuuCZNywUY5mZo0RZAlIG8Y6KDQaCTfg6mh4Gq2URS
 88GA==
X-Gm-Message-State: AOAM530a9nnFPEKbbST0UtpvSbWUnPaB6cN4pu4uPSeQjPDSLhvEYueo
 Mht5RuBvOfm5tg63O6pkd71sytx9JwUCPKyZ0JyLjPHgsgOI4saBx1HjZZKnAgX9W9PJ7qJWnON
 0woJH5bXLxl01txrtbrJ0yxDlWNoh
X-Received: by 2002:a37:9301:: with SMTP id v1mr20962174qkd.419.1607291267447; 
 Sun, 06 Dec 2020 13:47:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTSYUz8GprH7ZZQl7rfRTzOkUrvIm8134juk0lMfV/+12SIrmCKNfTzdhZMT6UYl2b500iiQ==
X-Received: by 2002:a37:9301:: with SMTP id v1mr20962158qkd.419.1607291267253; 
 Sun, 06 Dec 2020 13:47:47 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
 by smtp.gmail.com with ESMTPSA id o5sm565190qti.47.2020.12.06.13.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 13:47:46 -0800 (PST)
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-3-jsnitsel@redhat.com>
 <875z5e99ez.fsf@nanos.tec.linutronix.de>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 2/4] drm/i915/pmu: Use kstat_irqs to get interrupt count
In-reply-to: <875z5e99ez.fsf@nanos.tec.linutronix.de>
Date: Sun, 06 Dec 2020 14:47:45 -0700
Message-ID: <87im9ehaim.fsf@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnitsel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Peter Zijlstra <peterz@infradead.org>, Hans de Goede <hdegoede@redhat.com>,
 David Airlie <airlied@linux.ie>, Matthew Garrett <mjg59@google.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-integrity@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Thomas Gleixner @ 2020-12-06 09:38 MST:

> On Fri, Dec 04 2020 at 18:43, Jerry Snitselaar wrote:
>
>> Now that kstat_irqs is exported, get rid of count_interrupts in
>> i915_pmu.c
>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>> @@ -423,22 +423,6 @@ static enum hrtimer_restart i915_sample(struct hrtimer *hrtimer)
>>  	return HRTIMER_RESTART;
>>  }
>>  
>> -static u64 count_interrupts(struct drm_i915_private *i915)
>> -{
>> -	/* open-coded kstat_irqs() */
>> -	struct irq_desc *desc = irq_to_desc(i915->drm.pdev->irq);
>> -	u64 sum = 0;
>> -	int cpu;
>> -
>> -	if (!desc || !desc->kstat_irqs)
>> -		return 0;
>> -
>> -	for_each_possible_cpu(cpu)
>> -		sum += *per_cpu_ptr(desc->kstat_irqs, cpu);
>> -
>> -	return sum;
>> -}
>
> May I ask why this has been merged in the first place?
>
> Nothing in a driver has ever to fiddle with the internals of an irq
> descriptor. We have functions for properly accessing them. Just because
> C allows to fiddle with everything is not a justification. If the
> required function is not exported then adding the export with a proper
> explanation is not asked too much.
>
> Also this lacks protection or at least a comment why this can be called
> safely and is not subject to a concurrent removal of the irq descriptor.
> The same problem exists when calling kstat_irqs(). It's even documented
> at the top of the function.
>
> Thanks,
>
>         tglx

I don't know the history behind this bit. I stumbled across it in cscope
when looking for places using kstat_irqs.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
