Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DBDA6B8D4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 11:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E923710E786;
	Fri, 21 Mar 2025 10:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ismHwEHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0C210E785
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 10:35:48 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4394a823036so17832065e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 03:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1742553344; x=1743158144; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3Kfp6sALNxTTtUe+bIHaZwZakvZcPmpmO3uXVTBrCw=;
 b=ismHwEHFwTdbutHQ9lDDbIVfq+qpjHi5onBTIZjyZKTawsE0kIZwkT4lbP8nJMf2n5
 vZw/lK9cQ3Qmsq1SEcNGF9ADhyJ2QBu3q8rJ9cNmMpGZrvm9x0HOV1EbzkhYo9DRXmnO
 1IIitFvMbRTH+0MNfJuYWhKNee1Eu1sU6RN0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742553344; x=1743158144;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e3Kfp6sALNxTTtUe+bIHaZwZakvZcPmpmO3uXVTBrCw=;
 b=rd8ciVBDE6I65EZVgdkKzuTUlhDAcQsNUX8kiA1WS52iA6/dmbXESE+ZCm8ncMXYun
 ASV9GdxR+EutATLROZPCnDzWswN40X+NUPSY8r/sv5BorxhPpQS1N44sn5lut2B7wT6a
 69kMbcfwN6mkIhJ2JbXXM8u50rhyUSCRTrKUry5rK89jofov0XkhBmPvEJiV7LkR9UgO
 ZT4FzkX9rlOW30y9TPYvxn6To/ImnjgbPaTPFwnY8sozbxBkHj+LtEwp05EBDSM2tGjK
 pYMTSuRPbsfXNuKxj7Nfb8z2Y5YLmWJfF4OWrf7fJL7mq28f9XSSW0e6Hfg+Vh3rEqAO
 pnZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/VcCnAUmuEVyvCNxDlmywIqzsBnNm2UjCnpkTLAJk4QEfNVVcfaGsvEke1BTtT7ZFUrQrvSCIdEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz18xopXUx237NRMps2REa4diDrj05ceabqSj5qW7P0jDa9pxw1
 5zqBjbt23XvXhDgmXRK/qqH51sWb6MYj/zW0/26OdBo2SpZ1ZDoIMVjTaLXDp4E=
X-Gm-Gg: ASbGncsB+LKZMarRAAv35mJvNrscfh/vmHuVz5ljKQhKqRkKaoUedx4f0cahsDOTba+
 YclN5Tqvm0XMd0YrAmIPRrfTDNkvPZi0T0zFnGCDSUexdfFgABSX+xrgqw6mbj5KrCXNz3LQGa/
 cSKXh157uijWDsm5kb4Xlz9d+c0nw4e5Yulv/I3NJBVeRhO59B5FGlAC73IvoHrSqkD3ABj6whS
 bIQZr20BG6REBnf1/TmOVyB2RmYdsCUzOzoYjAHR64aOXGDMbzSt6iPkwqcRVOfWWFsNGW0ryAV
 L3BCxP0WeZ5tdRFln89H6v+32GljVefShaFpo5kfnoIkddNbj0Z07GjS
X-Google-Smtp-Source: AGHT+IGdgqrnktS88HQx0VeXm5vsHxDPIPUGT/Sqr6rq09y+ynhAfmQF/0b/+MUc3ZwiGzOBD/Pjgw==
X-Received: by 2002:a05:600c:3c9b:b0:43d:4686:5cfb with SMTP id
 5b1f17b1804b1-43d50a361f8mr15516775e9.27.1742553343656; 
 Fri, 21 Mar 2025 03:35:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9eff79sm2000820f8f.95.2025.03.21.03.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 03:35:42 -0700 (PDT)
Date: Fri, 21 Mar 2025 11:35:40 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z91A_Dz-nY2iFqYb@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
References: <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
 <20250306153236.GE354511@nvidia.com>
 <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
 <20250307123255.GK354511@nvidia.com>
 <Z8rv-DQuGdxye28N@phenom.ffwll.local>
 <20250307145557.GO354511@nvidia.com>
 <Z9LsbhzjI-P3-edQ@phenom.ffwll.local>
 <20250319172132.GL9311@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319172132.GL9311@nvidia.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Wed, Mar 19, 2025 at 02:21:32PM -0300, Jason Gunthorpe wrote:
> On Thu, Mar 13, 2025 at 03:32:14PM +0100, Simona Vetter wrote:
> 
> > So I think you can still achieve that building on top of revocable and a
> > few more abstractions that are internally unsafe. Or are you thinking of
> > different runtime checks?
> 
> I'm thinking on the access side of the revocable you don't have a
> failure path. Instead you get the access or runtime violation if the
> driver is buggy. This eliminates all the objectionable failure paths
> and costs on the performance paths of the driver.
> 
> And perhaps also on the remove path you have runtime checking if
> "driver lifetime bound" objects have all been cleaned up.
> 
> The point is to try to behave more like the standard fence pattern and
> get some level of checking that can make r4l comfortable without
> inventing new kernel lifecycle models.
> 
> > Yeah maybe we're not that far really. But I'm still not clear how to do
> > an entirely revoke-less world.
> 
> Not entirely, you end up revoking big things. Like RDMA revokes the
> driver ops callbacks using SRCU. It doesn't revoke individual
> resources or DMA maps.
> 
> I have the same feeling about this micro-revoke direction, I don't
> know how to implement this. The DMA API is very challenging,
> especially the performance use of DMA API.

Ah I think we're in agreement, I think once we get to big subsystems we
really want subsystem-level revokes like you describe here. And rust
already has this concept of a "having one thing guarantess you access to
another". For example an overall lock to a big datastructure gives you
access to all the invidiual nodes, see LockedBy. So I think we're covered
here.

For me the basic Revocable really is more for all the odd-ball
random pieces that aren't covered by subsystem constructs already. And
maybe drm needs to rethink a bunch of things in this area in general, not
just for rust. So maybe we should extend the rustdoc to explain that bare
Revocable isn't how entire subsystems rust abstractions should be built?

Cheers, Aima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
