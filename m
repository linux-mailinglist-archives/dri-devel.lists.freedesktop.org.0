Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE530900B98
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 19:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9F510ECE6;
	Fri,  7 Jun 2024 17:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZsnGQM33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EF610ECE0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 17:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717782955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c2USRNsUh4hVMRo8qpq7zv19zfSRCqrdM7qMgjktFAk=;
 b=ZsnGQM33b3kf3iI0jBaLoOhssVfT0GlFPdSBFZlo1qG5x0b+OKFG3a24yVBn6who4pDbIu
 ykSRf23I2qnewzqa3oGOOSP0kUhp/vVXYcTyrRo7wfI8KzrVEH6u4fCDL8N6Robdsa0aok
 zqOaqHtPk05IfRm07sFomxIqcXM0MTU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-r0Cx8q5dN4yiUkLoFWD99w-1; Fri, 07 Jun 2024 13:55:54 -0400
X-MC-Unique: r0Cx8q5dN4yiUkLoFWD99w-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-35e0f445846so1619975f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 10:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717782953; x=1718387753;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c2USRNsUh4hVMRo8qpq7zv19zfSRCqrdM7qMgjktFAk=;
 b=CWHmmjoh+kHyraIHzqbqDRrB0qoMCbDVCEda/LTBzVohUjN9ECCQa4hg4LrOFtFJTN
 ucMAN5dm8Hvt5VNP+KpoT/eTjgRFi9FtT4GC9xEFTHu6aXXWpuuTWDk3YFt+gIIDWfXR
 hyQBioo522LHtP5BKgp57ApEzSSo1a4YVlMuOZMAVnwwy35Vu0wybvzflPwO1kWxJ0NZ
 dnzM7BCRcEku4lTIKSVeMmywTA1LekH6QBEbE41OW9jUUhhAvwHCew2dS0t6nHKzmPcc
 +oDKTkbsBClH3efSK4LdthD221yNIHAGdLrT8xvC37fPYYN5lsP9pP51fe7z4y9J+1H2
 Lfew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMwfDr1+vIrGgdYC5KOvs61hO7gdMEWDiTCOUo10FrAyaueT1K77ae6jGbaasjZxoZ74afbqNQCcYm2+S7rhclPDKeZ2Or3etQpTTiQ/tj
X-Gm-Message-State: AOJu0YzsQcCJ6sbPaIgnJlpfMofTloSQqXoxoOlIMcQXCuMVCuKWvLov
 OR/BtZiip7wfj/c7zQy2WzbOeJe8eJHj9VGFxf3sSdc3bKwN8b3MZXtlRSVadDD25ZD3mq7Ul3r
 +IbTySrFaBK+Y5Lf3vS/fzzHFeHpP4uZd1AG1Uu56rKXfIA0g/qwkK0SPmvxG/G2+jg==
X-Received: by 2002:a05:6000:c6:b0:35d:cd60:cc59 with SMTP id
 ffacd0b85a97d-35efed54c85mr2247731f8f.35.1717782952939; 
 Fri, 07 Jun 2024 10:55:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd0q63Q+ll6ZV0ldUT81ypvw/xe2C9I7iCd+hxmTDRSsRX+Yo5EMV9qMgBA5eGvpIRAqCJCQ==
X-Received: by 2002:a05:6000:c6:b0:35d:cd60:cc59 with SMTP id
 ffacd0b85a97d-35efed54c85mr2247698f8f.35.1717782952564; 
 Fri, 07 Jun 2024 10:55:52 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e983d8sm4420813f8f.84.2024.06.07.10.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:55:51 -0700 (PDT)
Date: Fri, 7 Jun 2024 19:55:49 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, wedsonaf@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZmNJpQbTtFUPOkAJ@cassiopeiae>
References: <Zlgg_Q5y3Q99Ts1s@pollux>
 <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
 <Zlmfkws-QjNmFxfr@pollux>
 <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
 <2024060708-residue-hardy-af36@gregkh>
 <ZmMMMyi3uXTFtIae@cassiopeiae>
 <2024060745-palatable-dragging-32d1@gregkh>
MIME-Version: 1.0
In-Reply-To: <2024060745-palatable-dragging-32d1@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 07, 2024 at 05:41:11PM +0200, Greg KH wrote:
> On Fri, Jun 07, 2024 at 03:33:39PM +0200, Danilo Krummrich wrote:
> > On Fri, Jun 07, 2024 at 02:36:50PM +0200, Greg KH wrote:
> > > Anyway, that's all hand-wavy right now, sorry, to get back to the point
> > > here, again, let's take this, which will allow the firmware bindings to
> > > be resubmitted and hopefully accepted, and we can move forward from
> > > there to "real" things like a USB or PCI or even platform device and
> > > driver binding stuff.
> > 
> > In order to continue I propose to send out the following series:
> > 
> > 1) minimal device and firmware abstractions only
> 
> Sounds good.

Just a heads-up, I'll probably send this one quite a bit earlier than the other
two to make sure to unblock Fujita on their PHY driver.

> 
> But after this, I don't want to take ANY driver core rust code that is
> not able to live in the "normal" part of the Linux kernel tree.  It's
> just unsustainable to have it all in one directory sorry.  If this
> deadline makes that kbuild work actually happen faster, all the more
> reason to have it.  If that kbuild work is somehow stalled due to other
> issues, please let me know what that is.
> 
> > 2) v2 of all other device / driver, devres and PCI driver abstractions
> 
> I will be glad to review this.

Glad to hear that!

> 
> > 3) v2 of basic DRM driver abstractions and Nova
> 
> I love it how one of the most complex driver subsystems we have (drm) is
> attempting to be the "first real" driver use for the rust apis.  Bold
> move :)

I'd argue that as one of the most complex driver subsystems we have a lot of
need for the advantages Rust provides to us. :)

> 
> > The v2 series would contain static driver allocation (in case of DRM even const)
> > and quite a few more simplifications around `driver::Registration` and
> > `device::Data`.
> > 
> > Does that make sense?
> 
> Yes, but note, I'm going to probably push back on the "driver::" stuff.

That's OK, I'm happy to convince you of its usefulness. :)

> But will do so with more constructive criticism as I want this to work
> very much and I agree that I think we are both talking past each other
> in different ways.  Mostly probably due to my total lack of Rust
> experience, my apologies, thanks for your patience with me for this.

Very much appreciated! Please don't hesitate to ask for more explanation on
certain things if they're unclear. I'm happy trying my best to provide useful
answers.

- Danilo

> 
> thanks,
> 
> greg k-h
> 

