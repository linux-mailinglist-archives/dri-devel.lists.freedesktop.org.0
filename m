Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AA5A19025
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 11:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCAD10E6B4;
	Wed, 22 Jan 2025 10:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="AGbFvQ/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D8C10E6B4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 10:48:04 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso3788348f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 02:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737542883; x=1738147683; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=R3qnm+GrOqpWT3BtKZrVJSSh7IFzEZx0DUsgxBNt09w=;
 b=AGbFvQ/33VouuCxaWQo83ZAUT/U6dpjncZZVeWZTrzyYVBmT4UO0yBD7Sg6b/blNu7
 ebgC9UBE0Hn3xxCB0T6/1upGY6Os/+aus4Lwt45Ykixwz0pWfw0CWMoQhHrblQpZwPmk
 wRm9CdscqPgAY+WRCogpURbqpLHBb43Ge/iOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737542883; x=1738147683;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R3qnm+GrOqpWT3BtKZrVJSSh7IFzEZx0DUsgxBNt09w=;
 b=KNsCq55YZKPNhhL639uKoFNgyDUtwS6S2bZGSsqLPyxXGScGRFfmgfzC6pMLzk85Hu
 EzS5v5e/subpJ5a8SqePRwS8RQVYwinitHjMcAz7Qf902lGUw1cqijEgfR0JylCkd/v4
 UYDAbWF0U0imdMVrrCT5HkZrVjyKLGyndXqc+iVA8IN8zt8D7/gJxfGdyhnzFxduGoeI
 T0AqiveZxujJETYOv4fQDyuf2liIBP3tRbA7LmdtGReceNzQfwpDuVCfORCWxAAR8tLN
 TaUyQu6E4U2PphBY57iyHQh+tGO86rzVK6HkAs/82dyCyatuNvS+bh9mI4qxaNizwK3S
 nh/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoyxyiTWY9sdmOCWMJCb7Sa/r7pHCPkULaRHIMllvuRooqByePr8Jy3GpGsfHDEQQ2qVrWHLjStHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxjQLv5Vze1+MheOidIpKrjgVdovDCdXxMxBN4N0RVcSesFiBW
 UkIoLtK9uoIp8PRCdYkNcyg2BjEYgRyEhzmTmAOzNJa2pJkNDeNe1nDHWyh7IFA=
X-Gm-Gg: ASbGnctoDN4dp/NtUkczW1zVMBbbOQeYcP+YX3cBbOuvlc+JNCSmkzbLk6FcuxjCWaJ
 NlEud/xcf7p5A1iBqsQLIhJO3rrCTllZBQNa+TpetV+tonSAlmHokfXUY56o1q7LEh9fTcnAPDy
 /8T5pnKVnxqvl2UPkgbJrNDcQIN5pqSk0EbX0KoOR+CFskVPjXHTmSbcFQWx0Si/zlRYiasW9ga
 zeo6yCyrjvvUo33hBlii5fcBakoJZQ0984+ptndm3hvSFkKHEmFS1IjnfSk/IE419184x7vnZgf
 2Xvp0w==
X-Google-Smtp-Source: AGHT+IH7hZcnuy+MAuZs/4qf2PjHXv4dOTIxBxZs7aWdoOLpZdMzGf2Srf3iq6sA/STj3ONpZxXHpw==
X-Received: by 2002:a5d:64a1:0:b0:385:df84:8496 with SMTP id
 ffacd0b85a97d-38bf56555cfmr19966306f8f.3.1737542882255; 
 Wed, 22 Jan 2025 02:48:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327e1fdsm16116107f8f.94.2025.01.22.02.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 02:48:01 -0800 (PST)
Date: Wed, 22 Jan 2025 11:47:59 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Stone <daniel@fooishbar.org>, James Jones <jajones@nvidia.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <Z5DM35KTto7cN1Wa@phenom.ffwll.local>
References: <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
 <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
 <CAPj87rP4r4q-wBx1dHsEkZ7=S2c2XsbA1Pz4Skw1ETt_2yD2Ag@mail.gmail.com>
 <CAAxE2A6ghBK2VTLkNXgk1c61UG1ZQAzWQ4q=wO-OShAUC9eRmQ@mail.gmail.com>
 <CAPj87rNFy7GLAjjxDYGLN-f8M0F7yMX6PED94O4kBJ=pwtPVyA@mail.gmail.com>
 <Z4pmnTy1NYD3rLwS@phenom.ffwll.local>
 <CAAxE2A6iDsN=YKW2F7WyyZxn4Sw4Dr5CxZminQGwf8awBivovQ@mail.gmail.com>
 <0e9aee49-aa69-4fb6-bab8-4624143f5267@suse.de>
 <Z46Y4EME7T6yejWP@phenom.ffwll.local>
 <CAAxE2A7T0ho42j_a1XbqA1wdCTECZs_MjBb-THv3c+HudWAULQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAxE2A7T0ho42j_a1XbqA1wdCTECZs_MjBb-THv3c+HudWAULQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Tue, Jan 21, 2025 at 02:21:57PM -0500, Marek Olšák wrote:
> On Mon, Jan 20, 2025 at 1:41 PM Simona Vetter <simona.vetter@ffwll.ch>
> wrote:
> 
> > On Mon, Jan 20, 2025 at 08:58:20AM +0100, Thomas Zimmermann wrote:
> > > Hi
> > >
> > >
> > > Am 18.01.25 um 03:37 schrieb Marek Olšák:
> > > [...]
> > > >
> > > > 3) Implementing DRM_FORMAT_MOD_LINEAR as having 256B pitch and offset
> > > > alignment. This is what we do today. Even if Intel and some AMD chips
> > > > can do 64B or 128B alignment, they overalign to 256B. With so many
> > > > AMD+NV laptops out there, NV is probably next, unless they already do
> > > > this in the closed source driver.
> >
> > I don't think this works, or at least not any better than the current
> > linear modifier. There's way too many users of that thing out there that I
> > think you can realistically redefine it.
> >
> 
> DRM_FORMAT_MOD_LINEAR was redefined on PC a long time ago to mean 256B
> pitch alignment because of laptops with AMD+Intel. Drivers redefined it
> because that's what happens when it's under-defined. As you say,
> DRM_FORMAT_MOD_LINEAR can't be removed, but then it can't work with any
> other pitch alignment on all PC hw either, so there is no other choice.
> 
> The options for PC are either a new parameterized linear modifier (with
> properly defined addressing and size equations) or DRM_FORMAT_MOD_LINEAR
> with 256B pitch alignment. There is no 3rd option. Even if you totally
> disregard AMD, you won't get it below 128B or 64B on the rest of PC hw
> anyway, and that's the same problem.

Ah I missed that, but just checked in mesa, happened in 2021 apparently.
Would be really good to document this in the kernel's drm_fourcc.h
comments as the defacto rule. It's better if the docs reflect actual
reality, whatever that is.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
