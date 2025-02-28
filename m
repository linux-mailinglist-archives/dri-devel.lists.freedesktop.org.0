Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49325A48FEF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 05:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D2210EBE7;
	Fri, 28 Feb 2025 04:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eD/4sbzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A335310E025;
 Fri, 28 Feb 2025 04:10:58 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-abb86beea8cso296968266b.1; 
 Thu, 27 Feb 2025 20:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740715852; x=1741320652; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lcd92g+YASdLuBfcNT0sjtP8tAqW0wrx0vnpP3NYpsk=;
 b=eD/4sbzBeWXCJfbUDDkUBb/5hlUJ7kzS2sMwY54WyTiKovuXlejhVW9PBSmV80CjoX
 wS6s7ORKcKsj366AFYKCCE9dmN5HPt+9Fg0QL2SwTlultnNCgComaVhsEk8ZFaRnvf3I
 q9E1/uUjbwDM9AG2tJaQzUwLHZNOHCvX/9Kf4hF0v8QhVfZIL0MiLl6s+JEEUOAim/Ju
 zovbEgkOmi+WE+6oPOfw2T4cYCKMWAB3WqpdfNUHZ4CWX7S5UYPE53gz59kgFTZ7KqRk
 /2d7QymKirKeswPZAu4uH+72ZoL0OStoOvdA7uLfswtbq7+5BmgR6TqCtEAdRRe//wAK
 7P6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740715852; x=1741320652;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lcd92g+YASdLuBfcNT0sjtP8tAqW0wrx0vnpP3NYpsk=;
 b=TU/SbojU/vYZ8Peqtu8ftfjPrcjEASUA6WgSnI+cvj2nippA4Q+L/6FwmSKxdpb2SK
 D5HGTfh6QGKJ+D2KlaHYJxWB+h110l/MxRkYxxs1Bl2iu8RJixVFox/NGUdSWY0hF2xb
 YG+UOtPvnLbr6UVL/CbD8UOvv8gv/VFDs/OPaxn/4tc3LJ4hEiz9Wz/nHAMV08jWf7sx
 yV2XDcvKABxdkLn1NPRQ6IKHCgvDQ62FdALbLuPyrAYeTItW2B2e9tF6njJ5cSirJduK
 uUTT5KpCe5f3Fc0561NYCKn5i1wZKMMyFN1wKqoc/sbgChKoAU6HHvtMB4RctlAdHKMF
 4wYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTeNddCHibXfMs8dmqH9z2qfUzOI+lCYubSfOUdLeEwV2BxB2svixTx7Sqz7ajIJilTefSGS6koA==@lists.freedesktop.org,
 AJvYcCVW3eAdCVNjdi+xrx7YFs2iLIaos1tm0uwsKeGfwr2iB8uA1wYaZMKiQ9ge/Nvc5YS/RUCuUyRpF7M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/78yEc+dlWvoDGDsfAf7FOKZrODwNzJbYcf6ti4rQlbkA4Sd8
 bzLnYXwhNqimDNabiaUHhENsHUtOnVrqAIDTURFoxDfmhb7Z4z1301k1lpmQdyWvLBa+nqsXwNP
 R3f2V0zKaObfd/Kh5/VaXdEn6sEg=
X-Gm-Gg: ASbGncvCuoNnItnyj7nmAVmdni40P91JYoWesaJ2fp5R8tKeh9VWeOQjzmK3/bhyQfn
 ZvNTgQ5m4NDmcpKkLHnFfWHSrBcx8CUkhcjsmxzoj4MXGBtB7WL7/3ko1j7EJk+AORsNjDvxNKW
 j2T+WC0g==
X-Google-Smtp-Source: AGHT+IF9sJMz5Qmd4c0NenYr7NxJc+GevSxwqY3e4jvZ362s8Gj8aBTzO4nWeEj4+Ox8TXhdRJm/iHtd9ZA1ZCbV47w=
X-Received: by 2002:a17:907:3f15:b0:abb:e7ed:d71e with SMTP id
 a640c23a62f3a-abf265e9049mr181693466b.46.1740715852119; Thu, 27 Feb 2025
 20:10:52 -0800 (PST)
MIME-Version: 1.0
References: <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com> <2025022644-fleshed-petite-a944@gregkh>
 <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
 <CAPM=9txrRFOb6Uzm=e0S6Tfxmskm4zwAZgsWnkvCzxN=XCZ6Vw@mail.gmail.com>
 <D83LT2GGLT92.FJ3H552P6H7@nvidia.com>
In-Reply-To: <D83LT2GGLT92.FJ3H552P6H7@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Feb 2025 14:10:39 +1000
X-Gm-Features: AQ5f1Jr5Ozqb72tvcld9L9m5FNlXAbV1CYF4W0rCkCIrTShr4JR1mLntCUta_cU
Message-ID: <CAPM=9txOK4_uVvmb4bWirBVPNsPoPTiF0NMK_FJTd1NuY0Y5xg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
To: John Hubbard <jhubbard@nvidia.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@nvidia.com>, 
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>, 
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Ben Skeggs <bskeggs@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, paulmck@kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Feb 2025 at 09:07, John Hubbard <jhubbard@nvidia.com> wrote:
>
> On Thu Feb 27, 2025 at 1:42 PM PST, Dave Airlie wrote:
> > On Thu, 27 Feb 2025 at 11:34, John Hubbard <jhubbard@nvidia.com> wrote:
> >> On Wed Feb 26, 2025 at 5:02 PM PST, Greg KH wrote:
> >> > On Wed, Feb 26, 2025 at 07:47:30PM -0400, Jason Gunthorpe wrote:
> ...
> > nova is just a drm driver, it's not a rewrite of the drm subsystem,
> > that sort of effort would entail a much larger commitment.
>
> Maybe at this point in the discussion it would help to discern between
> nova-core and nova-drm:
>
>     drivers/gpu/nova-core/ (under discussion here)

nova-core won't be suffering any of the issues Jason is raising,
nova-core isn't going to have userspace facing interfaces or be part
of any subsystem with major lifetime expectations. It has to deal with
the hardware going away due to hot unplugs, and that is what this
devres is for.

nova-core will be a kernel internal pci driver, and vfio and nova-drm
will load on top of it, once those drivers are loaded and talking to
userspace they will keep references on the nova-core driver module
through normal means.

Dave.
