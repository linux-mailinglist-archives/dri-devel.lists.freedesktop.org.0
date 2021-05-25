Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4538F882
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 05:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528F28938F;
	Tue, 25 May 2021 03:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F79789395
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 03:08:27 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id kr9so7934681pjb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 20:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VHDFyefEfXv2T1h/kXDPOn5vVw8tSm/6FW05x+E2j40=;
 b=merHIeKNi5Uu6C9TAUujDNIN9FxrI34YUx7aW4WyFELIyYppIt99C4UwGvzWaArcmu
 9EaYZFbnrmtDjrMZ7c8349ke6DKJjWiZDCUD5epOu2PqMIr5kYM1CoXZ0XNE1vQ3QFiu
 bvf2bDyHaIMES3MNNrHcengJbyjgwpDl3VY20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VHDFyefEfXv2T1h/kXDPOn5vVw8tSm/6FW05x+E2j40=;
 b=XoWG6QNBAn+skahFNBnUlAuxbrR8ap0St2Q3yeAWv/JUiqNgmkutT/GwRRa7tv3CTQ
 2xvECbO28kSt5YSMK3WNNlrzBMrgHzqs5/+48qNn/vwN22Bdtz/DjA3W4BFqyS6pK9oe
 OvLgWaNADLfSdJw2bFqhcuV5Et7tEOv1+ahTkbZrEWu9IKZTrvC3ijyX/zTcSbQcQehW
 DjTQ2afQMET80x7RZNJM+US8rryv3hNUFlz/ZGEj+eN+kTcPeyKk3+jndQsEHQOjURT5
 xul2SzhB0+Q51YlMCo0B/UiTZbC2qObQCC5HVjAVaaxFmcsUgViS3UVl16et3RUyC468
 1q6w==
X-Gm-Message-State: AOAM530E/lVnCdY/mOti5zJMkdTjtK9Ul1jQAgkOwoQDjwFdBbqgzZfY
 PgJN6qCZpwlKM1Mixmuld2af4j3DV/xneQ==
X-Google-Smtp-Source: ABdhPJzup5fr6XDh88epa0Kd0XmeVjICC0d7yxrk2/WAf1SQ4Bp6gGwC/m/0A8hjh5lpwhO9E9xHmA==
X-Received: by 2002:a17:902:7e02:b029:f1:62ce:6674 with SMTP id
 b2-20020a1709027e02b02900f162ce6674mr28811513plm.39.1621912106807; 
 Mon, 24 May 2021 20:08:26 -0700 (PDT)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com.
 [209.85.210.179])
 by smtp.gmail.com with ESMTPSA id x21sm12340609pfr.124.2021.05.24.20.08.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 20:08:26 -0700 (PDT)
Received: by mail-pf1-f179.google.com with SMTP id d16so22462609pfn.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 20:08:25 -0700 (PDT)
X-Received: by 2002:a6b:7b08:: with SMTP id l8mr16990516iop.50.1621912094090; 
 Mon, 24 May 2021 20:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-2-tientzu@chromium.org>
 <170a54f2-be20-ec29-1d7f-3388e5f928c6@gmail.com>
 <CALiNf2-9fRbH3Xs=fA+N1iRztFxeC0iTsyOSZFe=F42uwXS0Sg@mail.gmail.com>
 <YKvL865kutnHqkVc@0xbeefdead.lan>
In-Reply-To: <YKvL865kutnHqkVc@0xbeefdead.lan>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 25 May 2021 11:08:03 +0800
X-Gmail-Original-Message-ID: <CALiNf2_iq3OS+95as4fj+AOMDVYgGL71A1811QLaZ=5T7TRjww@mail.gmail.com>
Message-ID: <CALiNf2_iq3OS+95as4fj+AOMDVYgGL71A1811QLaZ=5T7TRjww@mail.gmail.com>
Subject: Re: [PATCH v7 01/15] swiotlb: Refactor swiotlb init functions
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Will Deacon <will@kernel.org>,
 airlied@linux.ie, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 sstabellini@kernel.org, Jim Quinlan <james.quinlan@broadcom.com>,
 xypron.glpk@gmx.de, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 11:53 PM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> > > do the set_memory_decrypted()+memset(). Is this okay or should
> > > swiotlb_init_io_tlb_mem() add an additional argument to do this
> > > conditionally?
> >
> > I'm actually not sure if this it okay. If not, will add an additional
> > argument for it.
>
> Any observations discovered? (Want to make sure my memory-cache has the
> correct semantics for set_memory_decrypted in mind).

It works fine on my arm64 device.

> >
> > > --
> > > Florian
