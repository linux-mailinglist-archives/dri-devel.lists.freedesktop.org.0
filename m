Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5159A84F416
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 12:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FD710F329;
	Fri,  9 Feb 2024 11:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="EafA/bnf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28E910F323
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 11:02:52 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5114a21176cso314381e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 03:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707476571; x=1708081371; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vuYIlExUBLY2J6M+ngxVOAFSad/SHF5e+TMcqooCk/4=;
 b=EafA/bnfDNVa2HNhQLMPkm17MhiN+ew9fuoSQpCxOiE5/1g4lFCkAj2X75bKQi8Wg5
 iTpLuu4oKtBVVkBT/TDHGz2dEOdpQYloRzRMgul7n+E+d/X+DXBEBXXVY0jjBOGAk7GK
 aM8D5CexhJW9d/wN5xv7o3p6Pmbk4iZ0cXqvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707476571; x=1708081371;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vuYIlExUBLY2J6M+ngxVOAFSad/SHF5e+TMcqooCk/4=;
 b=KOD6M3ywCNUgY+LjbtnSB1Q/VrKMAgbbYO51hJNFcoW8xK+4zU1Q6UBoflmot7V+Y1
 +KoUAO6JUMPbRLKGiaJFH1R3tGDUkK3RQXZzC2pP63pQFOrj/0Xqg5gT5TVIJZOkKC/r
 TRKCO4e87IiKf5Lxs1xh6HEdfpMttpATt5hjDIHi+LKROLe65uO6iXruZ6sVycnxwl9W
 xKGfrkGU5IkLxImMRn1HOd5s0+PIKCUAuUOHvYdNnPAMc/GD//TWJvyOB03GGsoL1vqK
 U5zBGrb0HXAJ08xQkKT1NZTNZZ/5dqG2a5Sm98xySoYJmjIZKg5dzwwAzVbHmEuIn9zI
 8vyQ==
X-Gm-Message-State: AOJu0YySJgkhCpxZgamzFwwThW1qF6sUWHCTR55vX/ju1pqTVAKCb1ov
 uNznP+i5EIIZBuD08gbnCpkljXL0PMYessxvp8OvZ8k4X2B1xkaKuHxysf4DX1A=
X-Google-Smtp-Source: AGHT+IH6E0/AASvROXrvxkigjakcyaKsJ20YLXJ0nvKogI/yEfwVIZAEoyri+p2vNSQzIFe+xvTWHg==
X-Received: by 2002:a05:6512:308d:b0:50e:7f87:f5aa with SMTP id
 z13-20020a056512308d00b0050e7f87f5aamr1043351lfd.3.1707476570842; 
 Fri, 09 Feb 2024 03:02:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWcBvPi7bshClS192/V6ZRLWgmi+XBhW0KLYsT4pwcEnPxPLcoUYXf0vqnlp0ao0VBAMGZrRxHYkLlUaTbOufIsNZgsL8Ni95XiSJwJ7enQuhI1VYzpheOYOISBMY3HT0GdUPXSk5jBu2+adnorJga+EeBf4ngFka2exnzouuU8oIQ1wpxXk6kT/BlZ4yW2DgLNM/G/IfBLuegBzzZGoqIKVu4Q7GCWSq6XN2uI73zbEvK0ytHbgXR8MLJOrC71U0G7eYqndH91qXPe1Xhde79Slk4O2kV0/SbVlOzTHwZqHtzEmyBSEgjZaNy+Rs2ZiOdiTugqLAs0bNPlvdE5ixbR+iVCkkSR+80=
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bk27-20020a0560001d9b00b0033b55661f32sm1570062wrb.9.2024.02.09.03.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 03:02:50 -0800 (PST)
Date: Fri, 9 Feb 2024 12:02:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: Re: [etnaviv-next v13 7/7] drm/etnaviv: Add support for vivante
 GPU cores attached via PCI(e)
Message-ID: <ZcYGWEG8eqAiqqai@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240206172759.421737-1-sui.jingfeng@linux.dev>
 <20240206172759.421737-8-sui.jingfeng@linux.dev>
 <ZcNO9aZwWzyYs-Rv@phenom.ffwll.local>
 <jahydq72bqb27de2ijwwmdjh4ri326mxhfjn5pbvf7cqcpnauq@rw5hjdiroi5d>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jahydq72bqb27de2ijwwmdjh4ri326mxhfjn5pbvf7cqcpnauq@rw5hjdiroi5d>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Thu, Feb 08, 2024 at 04:27:02PM +0100, Maxime Ripard wrote:
> On Wed, Feb 07, 2024 at 10:35:49AM +0100, Daniel Vetter wrote:
> > On Wed, Feb 07, 2024 at 01:27:59AM +0800, Sui Jingfeng wrote:
> > > The component helper functions are the glue, which is used to bind multiple
> > > GPU cores to a virtual master platform device. Which is fine and works well
> > > for the SoCs who contains multiple GPU cores.
> > > 
> > > The problem is that usperspace programs (such as X server and Mesa) will
> > > search the PCIe device to use if it is exist. In other words, usperspace
> > > programs open the PCIe device with higher priority. Creating a virtual
> > > master platform device for PCI(e) GPUs is unnecessary, as the PCI device
> > > has been created by the time drm/etnaviv is loaded.
> > > 
> > > we create virtual platform devices as a representation for the vivante GPU
> > > ip core. As all of subcomponent are attached via the PCIe master device,
> > > we reflect this hardware layout by binding all of the virtual child to the
> > > the real master.
> > > 
> > > Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> > 
> > Uh so my understanding is that drivers really shouldn't create platform
> > devices of their own. For this case here I think the aux-bus framework is
> > the right thing to use. Alternatively would be some infrastructure where
> > you feed a DT tree to driver core or pci subsystem and it instantiates it
> > all for you correctly, and especially with hotunplug all done right since
> > this is pci now, not actually part of the soc that cannot be hotunplugged.
> 
> I don't think we need intermediate platform devices at all. We just need
> to register our GPU against the PCI device and that's it. We don't need
> a platform device, we don't need the component framework.

Afaik that's what this series does. The component stuff is for the
internal structure of the gpu ip, so that the same modular approach that
works for arm-soc also works for pci chips.

Otherwise we end up with each driver hand-rolling that stuff, which is
defacto what both nouveau and amdgpu do (intel hw is too much a mess for
that component-driver based approach to actually work reasonably well).

Cheers, Sima

> > I think I've seen some other pci devices from arm soc designs that would
> > benefit from this too, so lifting this logic into a pci function would
> > make sense imo.
> 
> Nouveau supports both iirc.
> 
> Maxime



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
