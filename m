Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214745AD7F0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0476C10E44C;
	Mon,  5 Sep 2022 16:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9168410E44C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:59:04 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso6035421wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 09:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=CgKrfbywM986JsD6pvuwk2YZa7EEUAgSQzvLV0whDF0=;
 b=NedyZ5HNrEe2KbF4KnxBFkQblzkE6/En/zC53MSEYfz/O1KyBBVeqlPe+43ABFlGlp
 GU3NOMqNv4QNQTrKMFKChq9hMsdCYHYuvKcHnnoIR0646UMhzVaHTHiydsmrpx+vDyYC
 hPIw0afpLHAbO132oZGqXPX3QnrDrqsfPIqw2sMzkD/773LCGAlbpr1fz1u0P2FRkW6m
 Dhm3Ngj4bL5EvQp5BZFMasPByQs51SuHu5UJ2uNWEu1+16Z+nkBmMjoaMJYDZjMg+l1U
 zzzzD+xHZmTNoyHsFKRTpwgcsLQYYmjuIXSzWah+PlVCK9rCg1JoaRxCRwu5nbUrIQcP
 VY/Q==
X-Gm-Message-State: ACgBeo1ga/buy/IZedXpyMWLcMXbWTDeyFl0Q41NTuOn8RsiFkHXJfHc
 qfS0S45ZXGcSVlDCtF6kxP0=
X-Google-Smtp-Source: AA6agR6ofDrHdFk38CYHi4v6c7fb7YDmAICkMrs4KirhPNkUNgsIiH8ue/0Wsjlc5GjN8lLBkzLnaQ==
X-Received: by 2002:a05:600c:2c47:b0:3a6:4623:4ccf with SMTP id
 r7-20020a05600c2c4700b003a646234ccfmr11917348wmg.85.1662397142900; 
 Mon, 05 Sep 2022 09:59:02 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d4302000000b0021e51c039c5sm9439397wrq.80.2022.09.05.09.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 09:59:02 -0700 (PDT)
Date: Mon, 5 Sep 2022 16:58:58 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v3 1/3] PCI: Move
 PCI_VENDOR_ID_MICROSOFT/PCI_DEVICE_ID_HYPERV_VIDEO definitions to pci_ids.h
Message-ID: <20220905165858.oxmaxpur44aq6t2q@liuwe-devbox-debian-v2>
References: <20220829171508.GA8481@bhelgaas>
 <875yiauqz9.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yiauqz9.fsf@redhat.com>
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 linux-pci@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Deepak Rawat <drawat.floss@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 30, 2022 at 09:31:54AM +0200, Vitaly Kuznetsov wrote:
> Bjorn Helgaas <helgaas@kernel.org> writes:
> 
> > On Sat, Aug 27, 2022 at 03:03:43PM +0200, Vitaly Kuznetsov wrote:
> >> There are already three places in kernel which define PCI_VENDOR_ID_MICROSOFT
> >> and two for PCI_DEVICE_ID_HYPERV_VIDEO and there's a need to use these
> >> from core Vmbus code. Move the defines where they belong.
> >
> > It's a minor annoyance that the above is 81 characters long when "git
> > log" adds its 4-character indent, so it wraps in a default terminal.
> >
> > It'd be nice if we could settle on a conventional spelling of "Vmbus",
> > too.  "Vmbus" looks to be in the minority:
> >
> >   $ git grep Vmbus | wc -l; git grep VMbus | wc -l; git grep VMBus | wc -l
> >   4
> >   82
> >   62
> >
> > FWIW, one published microsoft.com doc uses "VMBus":
> > https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/reference/hyper-v-architecture
> 
> Makes sense,
> 
> Wei,
> 
> assuming there are no other concerns about these patches, would you be
> able to tweak the commit message here when queueing or would you like me
> to send v4 instead? 

I can do the tweaking. Don't bother sending v4 if there is no other
concern.

Thanks,
Wei.

> 
> Thanks!
> 
> -- 
> Vitaly
> 
