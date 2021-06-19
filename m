Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD1B3AD784
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 05:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5A16EB19;
	Sat, 19 Jun 2021 03:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29916EB19
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jun 2021 03:50:13 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id c15so5598271pls.13
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 20:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zO5LL7Owrsk50u85z5NQdq/+aN2FoxcpBADlxiwbwtc=;
 b=GoMVApQGRvRIO7blwwZSLVX7KnEaLUsgQiZnYGnQ8mp+79muo9lTEuES+H8kLhS8xC
 djxEq6nvfo+uAAf09DzdZIJgtSBquVbHx1Yy7Zj9ycZDtCn5PRIixQGHzFvC0S0QErMk
 dzuQb1UZyozHrgC7e811z9kAB0L/tg8WkvJDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zO5LL7Owrsk50u85z5NQdq/+aN2FoxcpBADlxiwbwtc=;
 b=CCbuWxqNrOdpuaV8Z2eqA1iEKElrz/ZOSgJvlfrSulpWuZgsa3v+FqkGjjJG3Lwj4B
 kd9o+AR+3d9spGCIFqVaJtGTMyJVi5czPq0H4AxEyDGpYJox55Xm2BYm4B+NCkW7HTJL
 /BZOgZ/O480CRrSL9eATXC5OKpStsH5euzG02li+F6ncuL+Pe/AKaziPQhm2QQ4Gq6E1
 jB/zQowKxdX6RPKIAdhLi+OvN25FMGgvK1DzvgPqqsil9UhWgT2iD3SFt5kiwChzWwx9
 2rktq3Wc+9IpfsGD6DXWMzMVTIFgNfmu75V2EozjfgzPcbeAc5+aNLepWyshibOA3apb
 1rZw==
X-Gm-Message-State: AOAM531qZz8bMV+3SoqYoHVQSkhich9q4wcORj8V5y+HbhVbZ+YBXwux
 vzI3mJ5/x81R8mVmnJPgh6Ja82+cvVG6Kw==
X-Google-Smtp-Source: ABdhPJyJOoXiCQMDiuOJLnS4odfsB0KVLw0clgYblMVhYLzMFNT232FjlXyuf6ysYqGzKktetg1zMA==
X-Received: by 2002:a17:902:9a81:b029:121:a348:fa68 with SMTP id
 w1-20020a1709029a81b0290121a348fa68mr5143890plp.46.1624074613121; 
 Fri, 18 Jun 2021 20:50:13 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com.
 [209.85.210.176])
 by smtp.gmail.com with ESMTPSA id e2sm9236147pfc.135.2021.06.18.20.50.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 20:50:12 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id y15so3399238pfl.4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 20:50:12 -0700 (PDT)
X-Received: by 2002:a05:6602:50:: with SMTP id
 z16mr10626949ioz.155.1624074224014; 
 Fri, 18 Jun 2021 20:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210617062635.1660944-1-tientzu@chromium.org>
 <CALiNf2_qF7OY0LHToNYx0E79BWMt2n7=nepPPLf+7YV3=KFEyw@mail.gmail.com>
In-Reply-To: <CALiNf2_qF7OY0LHToNYx0E79BWMt2n7=nepPPLf+7YV3=KFEyw@mail.gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Sat, 19 Jun 2021 11:43:33 +0800
X-Gmail-Original-Message-ID: <CALiNf289bo1WzEWWapzeQ8xYiH8s1qgDkpHVgy=PgAmv6rvGnQ@mail.gmail.com>
Message-ID: <CALiNf289bo1WzEWWapzeQ8xYiH8s1qgDkpHVgy=PgAmv6rvGnQ@mail.gmail.com>
Subject: Re: [PATCH v13 00/12] Restricted DMA
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, 
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
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
 mingo@kernel.org, Jianxiong Gao <jxgao@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 airlied@linux.ie, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v14: https://lore.kernel.org/patchwork/cover/1448954/
