Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C4D633F87
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 15:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0A410E3FD;
	Tue, 22 Nov 2022 14:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B8810E0CC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 14:54:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id g12so25056102wrs.10
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 06:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KrmpqTzejW7lkXpBGPhRv0hrjR4p7AU1gtyo69Z8dF0=;
 b=YCNl6cLofcjidVRmlkW34QMzrxYEAWxQbuiM1YpiT8cJ/YWAUvxcNzkVK6JwrsDgoM
 rbalLGZmQKr5LzHBUO4qqZS7mwH2DpsjQ4wfXQszjLzMXX+6SwJdDEHOF8USSx9F4pKU
 U5g2mizLnvzhYP0bfhBeVkjZGWWZ26TtzYawM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KrmpqTzejW7lkXpBGPhRv0hrjR4p7AU1gtyo69Z8dF0=;
 b=6tyKK1SEptFo0CZp8SSxaBHl3PgCidfT61qSHb5MgLMsuXIQN7TAhPhI+FKSheJS3E
 ivpl9g7dmKA+Vp/lmB8XD111sfQDGeUbTnLs49w+xh91Z2tXk79uDldzpsOe2GQhefvp
 fN1/4CIccNKORlGj36+xeyaz5jx2CRlbI2GDck9JaB/jyoJOJt+gAPwhjjd9nhF5pz4E
 nUGIVCUICVggIalSKXhYTRvufcTOgtsTCTakaOmRNU0YZJzayLPQn14U1Kq8bwedpVa8
 bkbsEFK8dBGUF5KmepKQEjq0O/RQbIKqqrDA474s+BMoTEweWpl5ARZiofKRWg3O/sm1
 yu6w==
X-Gm-Message-State: ANoB5pn5zq1nGHZx0j9Vkj7rcbTHPM9pHGHDiv8dlURWMM3+a/VaEkyv
 mK3Fpn2xH31z4Q4EUwJnay2boQ==
X-Google-Smtp-Source: AA0mqf4wHzbCTiw1wZ+EHm0EW2ISVF8I4ZoG2HxHzkAjALvpNFz3Jnb1gQyAfrmIT7ceICceEd46Pw==
X-Received: by 2002:adf:e3c3:0:b0:241:ccd8:f0f7 with SMTP id
 k3-20020adfe3c3000000b00241ccd8f0f7mr8677335wrm.393.1669128876365; 
 Tue, 22 Nov 2022 06:54:36 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 w4-20020adfec44000000b002415dd45320sm14103759wrn.112.2022.11.22.06.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:54:35 -0800 (PST)
Date: Tue, 22 Nov 2022 15:54:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v4 0/4] new subsystem for compute accelerator devices
Message-ID: <Y3ziqU2vrgwIY4HB@phenom.ffwll.local>
Mail-Followup-To: Dave Airlie <airlied@gmail.com>,
 Sonal Santan <sonal.santan@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Jiho Chu <jiho.chu@samsung.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20221119204435.97113-1-ogabbay@kernel.org>
 <02c514c0-62c4-1cdf-5d3f-b3d8942ef005@amd.com>
 <CAPM=9ty_YHrM5QhAjgFvNdpkEwnB_WHsouhYG8m5XGrb+kmWAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9ty_YHrM5QhAjgFvNdpkEwnB_WHsouhYG8m5XGrb+kmWAQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiho Chu <jiho.chu@samsung.com>, Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>,
 Christopher Friedt <chrisfriedt@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Sonal Santan <sonal.santan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 03:46:25PM +1000, Dave Airlie wrote:
> On Tue, 22 Nov 2022 at 09:06, Sonal Santan <sonal.santan@amd.com> wrote:
> >
> > On 11/19/22 12:44, Oded Gabbay wrote:
> > > This is the fourth (and hopefully last) version of the patch-set to add the
> > > new subsystem for compute accelerators. I removed the RFC headline as
> > > I believe it is now ready for merging.
> > >
> > > Compare to v3, this patch-set contains one additional patch that adds
> > > documentation regarding the accel subsystem. I hope it's good enough for
> > > this stage. In addition, there were few very minor fixes according to
> > > comments received on v3.
> > >
> > > The patches are in the following repo:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v4
> > >
> > > As in v3, The HEAD of that branch is a commit adding a dummy driver that
> > > registers an accel device using the new framework. This can be served
> > > as a simple reference.
> > >
> > > v1 cover letter:
> > > https://lkml.org/lkml/2022/10/22/544
> > >
> > > v2 cover letter:
> > > https://lore.kernel.org/lkml/20221102203405.1797491-1-ogabbay@kernel.org/T/
> > >
> > > v3 cover letter:
> > > https://lore.kernel.org/lkml/20221106210225.2065371-1-ogabbay@kernel.org/T/
> >
> > Thanks for defining the new accel subsystem. We are currently working on
> > DRM based drivers for unannounced acceleration devices. I am fine with
> > these changes with the assumption that the choice of using classic DRM
> > or accel is left up to the individual driver.
> 
> I don't think that decision should be up to any individual driver
> author. It will have to be consensus with me/Daniel/Oded and the
> driver authors.

Plus the entire point of this is that it's _still_ a drm based driver. So
aside from changing a flag in the kernel driver and adjusting userspace to
find the right chardev, there should be zero changes need for an existing
drm based driver stack that gets ported to drivers/accel.

And of course if we realize there's issues as we add drivers, we can fix
things up. This is just to kick things off, not something that's going to
be cast in stone for all eternity.

Sonal, with that clarification/explanation, is this entire thing
reasonable in principal and you can drop an Ack onto the series?

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
