Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3E0A1517A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 15:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72FE10EB00;
	Fri, 17 Jan 2025 14:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="J23okV0l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B519310EB0B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 14:18:09 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-437a92d7b96so20535795e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 06:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737123488; x=1737728288; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Tp7wSAJqhLGIrZ3nLQeCPYHy8kxgR4Pc06+Wfa9fy1Q=;
 b=J23okV0lMY1MiRM6M70XDzl9BpIX11X9GLqLetT+3gMNQFZ1Bnm7C96eOo9tg2JqjC
 II/sKNCGcMqhmH74hfnZnGroFNkUo3idUKJjShKPDyvYmF59h4mcdEMkoJqLRSpdj7VY
 HAVNAjKy/PmRxLqgJTMECjmf1lMedq3Coa9TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737123488; x=1737728288;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tp7wSAJqhLGIrZ3nLQeCPYHy8kxgR4Pc06+Wfa9fy1Q=;
 b=dW0lLKvGPV4GqsPv7lQB1RkjAyTBLRxGD+lr/FwT8HIfDS/iIehAarkVGfLWsoa/6Y
 HJp++yjHn46NKUd2LMQcPyMVgOvwNvLblDeeglSoaDAxw8s1wn/riDLWY82ct31Kw/vS
 hiLbUkBUNkBMQXGbF4tBhBz9G71VBujCDFJ7TmFRTHEu/fNI8bzazrzMVW8X7AEP1TuU
 hDJcRzi1vwuCYc3lt5Sll9uD6dMn89xSNyzwX5EyixpCy/EQL9uRNLlIbtAXqa4K8+iR
 q9dgurVvzborI4UR1IxvX45gtBkSejM+u0YoTKPqSb1wFMAsu09MMGJpsmnyfmVKq8bc
 W5Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKbxGIvE3rfmIZxSKWkn+T8MnuIRG+xxA8XFPMJEUr3ItZDK98isoPxO/zoMnln0vgsjRQD2XMXIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJasmc0GVdsjIa90Z45/U8EDOugD1Mqn973tQZnrzikX8QK/LH
 cNQ7i+1qJp+nLOc/PfLjv0RuX8w3PBr9xLAOTKTXFfPMKUETNO9Veoc6d1hqh+c=
X-Gm-Gg: ASbGncvYGe+CSz2EZg1XhCMMMFj35rbgnuJ95fB0yTcWsFo4Q9l6B5/yClvjZtJjxY8
 90wYoehfMvuOw6974cEEwqOmwwf4F/RH4kkqocnEVCsjNXH0aiF+Mu4HzHUCiCrrIoEPTm0nPgd
 k9mpRcqMi4jAO+h73L855/Nu9lJQZviOl9Ol96ShgvLD7xjbit5FydmVc/iPwmSxkG7YKRzYenN
 2P1Fe+cpH/nXj5zM4/5yK7yZP3Z0SEdNznWKJ5B84H49MiVccNu+fuahCSJZ7Jkb5xI
X-Google-Smtp-Source: AGHT+IGmGWKhpQjrSctpZpzWmduNr6tOj7WD15395d+bDkHH4Rt6DnKHMET7Vs5pm2MWNMs121e3Ug==
X-Received: by 2002:a05:600c:350b:b0:431:58cd:b259 with SMTP id
 5b1f17b1804b1-438914671fdmr30487135e9.31.1737123487983; 
 Fri, 17 Jan 2025 06:18:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74c4751sm94460675e9.19.2025.01.17.06.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 06:18:07 -0800 (PST)
Date: Fri, 17 Jan 2025 15:18:05 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 James Jones <jajones@nvidia.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Brian Starkey <brian.starkey@arm.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <Z4pmnTy1NYD3rLwS@phenom.ffwll.local>
References: <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
 <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
 <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
 <CAPj87rP4r4q-wBx1dHsEkZ7=S2c2XsbA1Pz4Skw1ETt_2yD2Ag@mail.gmail.com>
 <CAAxE2A6ghBK2VTLkNXgk1c61UG1ZQAzWQ4q=wO-OShAUC9eRmQ@mail.gmail.com>
 <CAPj87rNFy7GLAjjxDYGLN-f8M0F7yMX6PED94O4kBJ=pwtPVyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPj87rNFy7GLAjjxDYGLN-f8M0F7yMX6PED94O4kBJ=pwtPVyA@mail.gmail.com>
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

On Wed, Jan 15, 2025 at 12:20:07PM +0000, Daniel Stone wrote:
> On Wed, 15 Jan 2025 at 04:05, Marek Olšák <maraeo@gmail.com> wrote:
> > On Tue, Jan 14, 2025 at 12:58 PM Daniel Stone <daniel@fooishbar.org> wrote:
> >> AMD hardware is the only hardware I know of which doesn't support
> >> overaligning. Say (not hypothetically) we have a GPU and a display
> >> controller which have a minimum pitch alignment of 32 bytes, no
> >> minimum height alignment, minimum 32-byte offset alignment, minimum
> >> pitch of 32 bytes, and minimum image size of 32 bytes.
> >>
> >> To be maximally compatible, we'd have to expose 28 (pitch align) * 32
> >> (height align) * 28 (offset align) * 28 (min pitch) * 28 (min size) ==
> >> 19668992 individual modifiers when queried, which is 150MB per format
> >> just to store the list of modifiers.
> >
> > Maximum compatibility is not required nor expected.
> >
> > In your case, only 1 linear modifier would be added for that driver, which is: [5 / 0 / 5 / 5 / 5]
> >
> > Then if, and only if, compatibility with other devices is desired, the driver developer could look at drivers of those other devices and determine which other linear modifiers to add. Ideally it would be just 1, so there would be a total of 2.
> 
> Mali (actually two DRM drivers and sort of three Mesa drivers) can be
> paired with any one of 11 KMS drivers (really 12 given that one is a
> very independent subdriver), and something like 20 different codecs
> (at least 12 different vendors; I didn't bother counting the actual
> subdrivers which are all quite different). The VeriSilicon Hantro G2
> codec driver is shipped by five (that we know of) vendors who all have
> their own KMS drivers. One of those is in the Rockchip RK3588, which
> (don't ask me why) ships six different codec blocks, with three
> different drivers, from two different vendors - that's before you even
> get to things like the ISP and NPU which really need to be sharing
> buffers properly without copies.
> 
> So yeah, working widely without having to encode specific knowledge
> everywhere isn't a nice-to-have, it's a hard baseline requirement.
> 
> >> > DRM_FORMAT_MOD_LINEAR needs to go because it prevents apps from detecting whether 2 devices have 0 compatible memory layouts, which is a useful thing to know.
> >>
> >> I get the point, but again, we have the exact same problem today with
> >> placement, i.e. some devices require buffers to be in or not be in
> >> VRAM or GTT or sysram for some uses, and some devices require physical
> >> contiguity. Solving that problem would require an additional 4 bits,
> >> which brings us to 2.3GB of modifiers per format with the current
> >> scheme. Not super viable.
> >
> > Userspace doesn't determine placement. The kernel memory management can move buffers between heaps to accommodate sharing between devices as needed. This is a problem in which userspace has no say.
> 
> It really does though!
> 
> None of these devices use TTM with placement moves, and doing that
> isn't a fix either. Embedded systems have so low memory bandwidth that
> the difference between choosing the wrong placement and moving it
> later vs. having the right placement to begin with is the difference
> between 'this does not work' and 'great, I can ship this'. Which is
> great if you're a consultancy trying to get paid, but tbh I'd rather
> work on more interesting things.
> 
> So yeah, userspace does very much choose the placement. On most
> drivers, this is either by 'knowing' which device to allocate from, or
> passing a flag to your allocation ioctl. For newer drivers though,
> there's the dma-heap allocation mechanism which is now upstream and
> the blessed path, for which userspace needs to explicitly know the
> desired placement (and must, because fixing it up later is a
> non-starter).
> 
> Given that we need to keep LINEAR ~forever for ABI reasons, and
> because there's no reasonably workable alternative, let's abandon the
> idea of abandoning LINEAR, and try to work with out-of-band signalling
> instead.
> 
> One idea is to actually pursue the allocator idea and express this
> properly through constraints. I'd be super in favour of this,
> unsurprisingly, because it allows us to solve a whole pile of other
> problems, rather than the extremely narrow AMD/Intel interop case.
> 
> Another idea for the out-of-band signalling would be to add
> information-only modifiers, like
> DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_EQ(256), or
> DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_GE(32). But then that doesn't really
> work at all with how people actually use modifiers: as the doc
> describes, userspace takes and intersects the declared modifier lists
> and passes the result through. The intersection of LINEAR+EQ256 and
> LINEAR+GE32 is LINEAR, so a userspace that follows the rules will just
> drop the hints on the floor and pick whatever linear allocation it
> feels like.

Yeah I think latest when we also take into account logical image size (not
just pitch) with stuff like it needs to be aligned to 2 pixels in both
directions just using modifiers falls apart.

And the problem with linear, unlike device modifiers is that we can't just
throw up our hands and enumerate the handful of formats in actual use for
interop. There's so many produces and consumers of linera buffers
(Daniel's list above missed camera/image processors) that save assumption
is that anything really can happen.

> I think I've just talked myself into the position that passing
> allocator constraints together with modifiers is the only way to
> actually solve this problem, at least without creating the sort of
> technical debt that meant we spent years fixing up implicit/explicit
> modifier interactions when it really should've just been adding a
> !)@*(#$ u64 next to the u32.

Yeah probably.

Otoh I know inertia, so I am tempted to go with the oddball
LINEAR_VEDNOR_A_VENDOR_B_INTEROP thing and stretch the runway for a bit.
And we just assign those as we go as a very special thing, and the drivers
that support it would prefer it above just LINEAR if there's no other
common format left.

Also makes it really obvious what all userspace/kernel driver enabling
would be needed to justify such a modifier.
-Sima

> 
> Cheers,
> Daniel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
