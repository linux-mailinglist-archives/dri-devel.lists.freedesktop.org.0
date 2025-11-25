Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99841C83C97
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 08:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529D010E364;
	Tue, 25 Nov 2025 07:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZQqIQrT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F5710E363
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 07:49:29 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8a3eac7ca30so329286885a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 23:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764056968; x=1764661768; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dYXQ1uyTYiQp5l0EOSTj3X1iUi+LYOARqqBvPXETpmQ=;
 b=ZQqIQrT/iYzzWE5uBmcADmXoZZb+H5YBVGQCkLgyglYDr55EYVA/WgSyUCv2Q9i4EB
 wt3G1hLuGbjqdKSBe3q/w2X5GxX7Iir3J/WDVRulYzxJKyH7MtjHPAUA+jNK4VDJi1th
 XU2rU2QazDAWgpB4FrxOW9THu1RLuRxDJMxXnPdGErqpT3ZsF7E8d38THQ2ehBVQ7wvr
 0s94crMdtgbnf6qq/vXKrPwJw8mkT3QOKN3gQOkekxqAqrDqcQUfmFdDQ/BjqvG7eSyJ
 s85vdl9scq9QBJQDwPNZ4DRgQPash4yAg8nGisBYS+M2wPzlvxkxADO0xk61gw+NaY8e
 Nk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764056968; x=1764661768;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dYXQ1uyTYiQp5l0EOSTj3X1iUi+LYOARqqBvPXETpmQ=;
 b=h+O0BpA41dwjaBFFFqaOj8Qh+QYWV8j3BA4Vh/nI2vnkUMC/aglHf0SGTJTfIzCRM3
 wMFWcwhCxpsts0Ey4G9dPSpNpJ9zMkR72G9COjT16D/MXoFDuv8OK/mHQ7xH+vp0yhAg
 VaJncLoMWf24MCUtm7KZAjjNBmqg9uPAyPVhpbOpy/lUzbosStIWftrC9H1MefANphmT
 j9e+u7iXc8fjWBWFjPsHN3GmAio/jUr4/lSWIQ4pCzjeHsB63rad5cN+baLsdUimWLZP
 R93LRbJSUl8s7Pz1PBAU2oQypzou7mQtenpWbjCp8v/2M70LlGwFbFBVu7po9RXwuAq6
 8I0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv+b0enuMOX2taJKCiMRHH5WCh/y+ktF2oBhxYVHIuLCBXh44+bOqaQetQVCYOvJIzobtSsHdoTMo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+pv37BVyBpgyCde+Qrg7s8koYZOXxat7PLCRQioGfg1M+8UWf
 E6LuTEk+Uc1Hx2eNnD7o69lHpU8Cv3XjLKYYovEfAaJMTgg0Vp6QTOGpWwPWNz+3VAqQy89ywqb
 JJe1H7CXE/ya6eVbjVhUKGDUNO6+zOIo=
X-Gm-Gg: ASbGnctXL2aq8P9M9+RwzNk/oMYEo730KNm9D7U/928Y+dORW1vXokUWPBjnbe45ecx
 TeC10KBW0fvlRR+/7rjteOe8eV76U4YmRVNiA30R8QzYuHMa+4P0OFfiD1FSWNf0MSpjWfxXP6X
 +D+Ipy/Ag72Bh4VUs17dvxbR/mqlVDCCbQaJ+ODMAb9ULJfXnPKiYe3rru2rpZ5LYIj3zRPSw2v
 oMxPnimjCzuxdNOGsI2n/7pOtB36MiP3CUevUKy6khMYqVa+KddrhgcX+yHPhKlCf/4dg==
X-Google-Smtp-Source: AGHT+IEtXPDouByPiT/qxibkQ8ULLGq/MTP3sJn0d1xkeYQ9cq7USFxzR7YMrVKLhlsOLhXx4WZEKVrsh8lyXL+gyvM=
X-Received: by 2002:a05:620a:708a:b0:8b2:6ac5:bce1 with SMTP id
 af79cd13be357-8b4ebd9ec27mr242566785a.52.1764056968048; Mon, 24 Nov 2025
 23:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20251124234432.1988476-1-joelagnelf@nvidia.com>
 <f73e4536-ec89-4625-96d4-6fa42018e4e4@amd.com>
In-Reply-To: <f73e4536-ec89-4625-96d4-6fa42018e4e4@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 25 Nov 2025 17:49:16 +1000
X-Gm-Features: AWmQ_bnwzbjWb8lRQT1DDgpaZ85N7NFNJhUwspjg107_d0wU8nUTSe73G0Ayj_8
Message-ID: <CAPM=9twe3xcVBgrNCT+1_pGECPL-ry_aA2dxBwbKVeai4+S7AQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: Move DRM buddy allocator one level up
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
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

On Tue, 25 Nov 2025 at 17:45, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 11/25/25 00:44, Joel Fernandes wrote:
> > Move the DRM buddy allocator one level up so that it can be used by GPU
> > drivers (example, nova-core) that have usecases other than DRM (such as
> > VFIO vGPU support). Modify the API, structures and Kconfigs to use
> > "gpu_buddy" terminology. Adapt the drivers and tests to use the new API=
.
> >
> > The commit cannot be split due to bissectability, however no functional
> > change is intended. Verified by running K-UNIT tests and build tested
> > various configurations.
>
> Well such a change needs to be part of the patch set which actually start=
s to use it outside of drivers/gpu/drm.

I'm not sure it really makes sense yet to force that for this, since
the next patch would be just adding rust bindings to it, then a patch
to nova-core would be needed to use it, I'd rather not merge something
like this via the rust or nova trees as it breaks the principle of
least surprise.

Maybe this + rust bindings might be enough to justify it, but it
should be reviewable as a standalone idea.

Dave.
