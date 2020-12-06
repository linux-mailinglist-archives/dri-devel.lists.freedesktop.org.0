Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639812D0770
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 22:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5010189CBC;
	Sun,  6 Dec 2020 21:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFBD89D4B
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 21:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607291193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pt7TdFB7ulKa/lV+VvFZnu9g+M0yRQxxm6d6lfJIcJQ=;
 b=TY7Qa/6LjPb8YVXHQjXGKfKnFUYvc98n/sr+2dC8zjMDMtp5md76XR1zwr6imaeR5kYQgV
 2F/4G/fCmuKe5nrMk3B6LrWpkStOvXTIA5WHnqcrC+vmbTI2B3I/jaO7XOCCNk7V1Oc54x
 0HTXvxGCuHPbF6kdynOoXVAbNFLIKKQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-Gs3nA78-OjSKjZs4sNQG5g-1; Sun, 06 Dec 2020 16:46:29 -0500
X-MC-Unique: Gs3nA78-OjSKjZs4sNQG5g-1
Received: by mail-qt1-f197.google.com with SMTP id l17so8596712qtj.18
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 13:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=Pt7TdFB7ulKa/lV+VvFZnu9g+M0yRQxxm6d6lfJIcJQ=;
 b=h+kWBsttVmr5mSVjygpRq7RS30g6wX90LuoJhV0JuNNKlP2zfJcSSkPrjM8XzkKsPC
 OzjTZCVm3qwkbMyGTgGGxjw/b+oWZ8tFqj6bkh9oc6X9FBDOgsH5NdUKVaNOGRLqk0Dr
 GR4GlbrmF8XMBmW1dpImhdrBz4HQNtjSDcPYHBC8DNcwtzlKZ2tUT3Cw87Um7Nu2KQH3
 p081rp3+dsjL3sVsdGEe4rSay1UJzcCf82FSYjMMqCoLkw3uhkf023dOkKB8IbGziaXE
 EMyNM9gZiedhdQAKrxugFdVVxUedjKtMv9RqnphLVgEP4Zb0ufFcK6rgA9RNjQTvM2WM
 PtnA==
X-Gm-Message-State: AOAM5336A/iJ+p/BnX9G/BvoEFqzwoJ2uhfNQ/qyLQIYxGVMMYzJTC9i
 QT1tPllPIYo/iOOz/NFfxwZ0zlcgmuYTwSHbMGF6qV+L3eCj6qXvI/JWS2hXqaiqkaRJBdxQGT8
 6aa3kl2zT3qfwbocsew2Uersi/hPE
X-Received: by 2002:a37:7143:: with SMTP id m64mr21643213qkc.280.1607291188964; 
 Sun, 06 Dec 2020 13:46:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdJmpyy0faO+c7dz32lK3lca+T2SB1F3DXtNcksxPbw00LbiUdsAxUQYUXlLzAVtknWfl5ZQ==
X-Received: by 2002:a37:7143:: with SMTP id m64mr21643187qkc.280.1607291188745; 
 Sun, 06 Dec 2020 13:46:28 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
 by smtp.gmail.com with ESMTPSA id a28sm46494qtm.80.2020.12.06.13.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 13:46:28 -0800 (PST)
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-2-jsnitsel@redhat.com>
 <87y2ia7rbv.fsf@nanos.tec.linutronix.de>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 1/4] irq: export kstat_irqs
In-reply-to: <87y2ia7rbv.fsf@nanos.tec.linutronix.de>
Date: Sun, 06 Dec 2020 14:46:26 -0700
Message-ID: <87lfeahakt.fsf@redhat.com>
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
Cc: kernel test robot <lkp@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>,
 Matthew Garrett <mjg59@google.com>, linux-integrity@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Thomas Gleixner @ 2020-12-06 10:54 MST:

> Jerry,
>
> On Fri, Dec 04 2020 at 18:43, Jerry Snitselaar wrote:
>
> The proper prefix is 'genirq:' git log kernel/irq/irqdesc.c would have
> told you. 
>
>> To try and detect potential interrupt storms that
>> have been occurring with tpm_tis devices it was suggested
>> to use kstat_irqs() to get the number of interrupts.
>> Since tpm_tis can be built as a module it needs kstat_irqs
>> exported.
>
> I'm not really enthused about exporting this without making it at least
> safe. Using it from an interrupt handler is obviously safe vs. concurrent
> removal, but the next driver writer who thinks this is cool is going to
> get it wrong for sure.
>
> Though I still have to figure out what the advantage of invoking a
> function which needs to do a radix tree lookup over a device local
> counter is just to keep track of this.
>
> I'll reply on the TPM part of this as well.
>
> Thanks,
>
>         tglx

I can rework it to use a device local counter.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
