Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EED8B4ABB2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952BD10E64B;
	Tue,  9 Sep 2025 11:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DOGGtsJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C14110E64B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:24:51 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3df726ecff3so2914359f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 04:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757417090; x=1758021890;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SlpGeLSPioG51P60BOa3LrpU0FbaPi3fRTERMh3jekE=;
 b=DOGGtsJBC2tO4qQ+QO4VBHO51oOGGuYZHV6AH5zb4XAQ1zOsUhxflcPIrBz5BLO3nq
 1cA/T5C6zzh/iaJBkblU8ihB/WbUKZbriI7k9ri4WF7/yyTLG15by7ojclp0MNLbg8h6
 HlLlyi4/629GgooH2Y7dxMIoKqKTJOEtEKul5cdnDARKPVwUVqXvFKDcLF7LkU1WRLS1
 l+zE3vZ8a1NrJmUiCM+4OBt0GDnQuYp+4yLJ7QG8yS9/Iz/vPIcCwQaMfjlKtCmzv7Xf
 hbp/uEz7mH36kr1e16iEpX4Jx3IIR1r8F6Q2Mq+7yNGq4ai+acTBwMSoUt9kzNFuuGPu
 qbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757417090; x=1758021890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SlpGeLSPioG51P60BOa3LrpU0FbaPi3fRTERMh3jekE=;
 b=YhY+rgMT4WDf9eaetqHiSVX4CBD4NoF/qT27rjXzSj27XPSxDClpCZeCn+NdSyXJqy
 wL9A0Wa5Ck9K/HQIjZf0oYfhuYmKilqXz3joQHI46JlJyRhoHvDDHLlLYr2TX0yciBwO
 kunZKbSYdykD0jq9nUUeZsx9jXO9K+cU94SehPDbBsAi5lwakhvOEg/efLsxCf2DhS+U
 aqY7nMQpRjnGakBs3a7ySVKLBxTNOCoRO+/ZlmnnqBkamNI6Kgt69u0r8ile+lNOherI
 6XsK9xtSye78FiMXFrkd2FZrs/yR55v8vUtQjIMwX4FGTta3ukcUs7iLr7URNzhGlfxG
 BMKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXmMvx4Q/PZ26/QkgqHnSKAafQZXG2aW+gr2T+nodpK/nCxzw4CWn+jFvt8lz3J2QCnHTR7yUFYqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9WIzKhv/c7HA1weDKE2zCAI2nFycKiCiLCy97AnL95cOiCLy8
 drcdUe9uUCRJS3ZMnTf9oOGU2PM/Tk94JxpJ6rAc0xJPtkgtQUHmSXT1JCPRN+JSIvPgGvp58cI
 /jaHNnAY3+rMTO0DCis6+tagFtDdzDCXwoUIyCqcr
X-Gm-Gg: ASbGnctH8th3gRTEDXPVsPBCBNXe/wrROeIHbpop3HQnzLS7yPRKNM8UfURo1oZoHA7
 UliWh2LpD9zLkSWeQJqtnkvHajI8aH1qWSqxysdlEDCCLTPxUhwDImCHSJFHcSUg/2O9rpuTr4w
 mFwjPlO6J2PNghKPHpP73F043o7loVcM3FfBulHVG40JD1o43IIpHK8kvSa/QmwbED9bEHlDKm0
 cZ/15UCqg4HVNmDWiYjsVIaDTBpA0lW56GEKqJrm7iMKoto6x3eW75xvPiw+tHVDF+/VC98DR1e
 A6z4b+Ph8bY=
X-Google-Smtp-Source: AGHT+IHml7KDQnLZb8rjsUtaI2jtqrtAkle19ABt+nKN7aScJ7nfn4E1bb8e1N2pJF4QBnZOjd4VFNVXBYUbkb7kvqc=
X-Received: by 2002:a05:6000:1a8c:b0:3e4:7f66:8ade with SMTP id
 ffacd0b85a97d-3e63736f0a6mr8635754f8f.6.1757417089737; Tue, 09 Sep 2025
 04:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
 <20250905152505.005a610d@fedora>
 <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
 <DCL8DQV23FIZ.KJ74UQ9YOFZV@kernel.org> <aL1pSFB9iBsfHFM_@google.com>
 <DCMJ6K06T63T.2UBTM1RL4YJ0A@kernel.org> <aL1u_YxOkuj1kIq6@google.com>
 <20250908091140.44856fde@fedora> <aL6TJYRmWIkQXujj@google.com>
 <DCNAE3CJMEJ0.JH1F0MJABXQI@kernel.org> <20250908122002.2c80dd3a@fedora>
 <DCNDGFE7RR5Q.X3PCDW0KIX89@kernel.org> <20250908141156.3dbdea0b@fedora>
 <7aa3f464-a3d0-47a0-b044-d8db93f45918@kernel.org>
 <a2006f74-75bb-48ac-ac9c-0a71c8f9d510@linux.intel.com>
 <8078cad2-d5d3-4e20-9848-034c2a503f3d@kernel.org>
 <cbd5c99d2394335ac4aeb2740994ab14508e2553.camel@linux.intel.com>
In-Reply-To: <cbd5c99d2394335ac4aeb2740994ab14508e2553.camel@linux.intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 9 Sep 2025 13:24:36 +0200
X-Gm-Features: AS18NWDW4ixkiSB7H4rrLvI2J3PBz80ZR4NKOECvc7-D1qMuUhNHVcSBxjljRqI
Message-ID: <CAH5fLghY8o0ouvaz48D4bsWMJ7A06L750xdKibaoe=bKjVOpzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Sep 9, 2025 at 1:11=E2=80=AFPM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> On Tue, 2025-09-09 at 12:47 +0200, Danilo Krummrich wrote:
> > On 9/9/25 12:39 PM, Thomas Hellstr=C3=B6m wrote:
> > > On 9/8/25 14:20, Danilo Krummrich wrote:
> > > > On 9/8/25 2:11 PM, Boris Brezillon wrote:
> > > > > On Mon, 08 Sep 2025 13:11:32 +0200
> > > > > "Danilo Krummrich" <dakr@kernel.org> wrote:
> > > > > > No, drivers can't iterate the evict/extobj lists directly; or
> > > > > > at least this is
> > > > > > not intended by GPUVM's API and if drivers do so, this is
> > > > > > considered peeking
> > > > > > into GPUVM internals, so drivers are on their own anyways.
> > > > > >
> > > > > > Iterators, such as for_each_vm_bo_in_list() are not exposed
> > > > > > to drivers.
> > > > > Okay, that's a good thing. I thought Xe was doing some funky
> > > > > stuff with
> > > > > the list...
> > > > Maybe, I don't know. If they do so, the should send patches
> > > > adding the
> > > > corresponding iterators and provide a rationale why drivers need
> > > > to access those
> > > > lists directly and why we can't provide an API that handles the
> > > > overall
> > > > use-case, such as drm_gpuvm_prepare_objects(), etc.
> > >
> > > We're using the drm_gpuvm_*for_each* macros in drm_gpuvm.h,
> > > assuming from name
> > > and docs they are driver api.
> > >
> > > Also the drm_gem_for_each_gpuvm_bo(), although this usage could
> > > easily be
> > > converted to a helper.
> >
> > We were talking about the extobj/evict lists, the ones you mention
> > are fine of
> > course. :)
> >
>
> Hmm. Now on closer inspection it looks like we're checking for evict
> list empty, It looks like rebinding after validation may in theory
> evict some bos to system memory and then we'd rerun the validation step
> if the evict list was not empty.
>
> We could of course add a helper for that or if there are better
> suggestions to handle that situation, that'd be fine as well.

I don't think evict list empty means that there are no evicted GEMs.
It's possible for an extobj to be missing from the evict list in some
scenarios. That's why drm_gpuvm_prepare_objects_locked() checks
evicted on the extobj list to ensure that the evicted list is
up-to-date when you call into drm_gpuvm_validate_locked().

Alice
