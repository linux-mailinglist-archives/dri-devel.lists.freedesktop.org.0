Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C40BF9ACF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 04:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C0A10E0C4;
	Wed, 22 Oct 2025 02:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c26vvOMh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419DE10E68A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 02:09:11 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b6cdd7e5802so178358a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 19:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761098951; x=1761703751; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=af9vNF4/pOmtn3q/j2U/NQMJF3YjAHP3FBPyaTm2ZTY=;
 b=c26vvOMhu5d7gvx9Gg5sKzAX4ZNFTR7HLJhDmRPtvamZ0D9674pu+mqr3e3oZtqvay
 OdRLLzgPv/XfzLLCui7MduiS694A9sPTJnmdb5ajCiqV5Jgfgn4TZ1m0a/jQuj7O0Tk6
 t3kYol6qczfh9a4xjpq+p9RYrT83baEhI97oDg9GpCNUQ0HEw6FI7AZSEr22O9dtLe/j
 oB8A9GLBcKY33WD2sZShUV6bumPnl2ktkJjyuh2GQzg2g2kbQ+7He+9AKzetr5vCHrzE
 FBORrV0og9Mf7dQC0DqzMNzJfCnXz04hEXq2esW9VmCCp3KOTtZb1hxFHdUOP3lUOC4L
 7smA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761098951; x=1761703751;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=af9vNF4/pOmtn3q/j2U/NQMJF3YjAHP3FBPyaTm2ZTY=;
 b=JtMHpNk4bDmJOgMfwSUKputWr9Ml32ZxXI+9Ke4KWPuM3uOWCbh7YREU8k4FnvL+To
 kYSIH7mQYLtAbhQg+to3qz9HsyXK2973Gn3UcD/xYifDgUZU4w+WZfag8xOBEC/WAhNX
 01zSYX/8hNaUKOSQ+SboFGff7OVhzeOC1nWuQ+Uo1jKCwiDIOdNI/SbN2CAomMq8wEM9
 sJAKSKTGuUw8MufUX01QzLHF5fyhQ8ZP7JdFtT70/Ysres/rKQOsC8ebdIYxx8iS4tYC
 C5DIKOKonX9VqVGTHFb+os4zyxIU82/PEks0Xvji9CHOdp8/zrqNGGYYgWfNjTCvhF2J
 wPeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDA8UiAowIyPQYUuRTzaE6ZADZAfQGTYwTxPBlOVvDrszJWmK4KLYkjwkO9emUl9iSkqjruM80Isg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx805sW1/h82SkVI1iNXsRzQka22fm0dGsAHo453EOyQdCJB8ZW
 CV7gnFz5kA7Zc75czbGe5I9ZhJUZn36EY3qgkvZdAgc7CdZ5AebwrxoL
X-Gm-Gg: ASbGnculrRVO+7h6lBVRF1nDhbWeSJiXrFoz66R1s7e/nv7ftHWRBWVCT6Bv5h1UW0K
 ekdfSmWWNNU2KxrF2VfU5yjC4gQiaDRiJpuqXuMGcmsjTLtVYybDffEYuckDq4gmyXf/nfbc2qm
 u7sH+w20UFznkNxL0N7IZm65lej558Rd5OW55JPtBD77zpcx/X3P6svKLQxrqC4Sr8agISw4TAV
 Cy3s1+8/UgtyBw4B4D+MHiAGiQKDIqLnNY0uscqos0G3aPyYItl4mhk00o69QP2mQuU6wXh6el9
 /i67+7YfD88ncWvEdsIXVFOUBQyX6yplvQBOvoTUziQpXA+yJQ+B6I6k+Uc/WU0dF9XDKW612d5
 tA8qmWBF1qPbBADPDM/IQvcZuytc2Dm+Vr/bTwA/REdP5bkkw4Tp1xvUL0kL7LK4Q9mWdHL70QI
 i5yj4tOlROxzi8
X-Google-Smtp-Source: AGHT+IGoV41dxt0PTAHkgRAIyZFYB8ISFOdcqUyCiizLarhiL6pLGFIW2lB0KpZYTkg47fD50y0GNw==
X-Received: by 2002:a17:903:b90:b0:276:d3e:6844 with SMTP id
 d9443c01a7336-290ca1218cbmr205757685ad.33.1761098950545; 
 Tue, 21 Oct 2025 19:09:10 -0700 (PDT)
Received: from archie.me ([103.124.138.80]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471feb99sm123086345ad.87.2025.10.21.19.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 19:09:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id EB4D34209E4B; Wed, 22 Oct 2025 09:09:06 +0700 (WIB)
Date: Wed, 22 Oct 2025 09:09:06 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 4/7] docs: gpu: nova-core: Document the PRAMIN aperture
 mechanism
Message-ID: <aPg8wuF5ZodLxOH0@archie.me>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-5-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WWOwYHGjzVps0pxd"
Content-Disposition: inline
In-Reply-To: <20251020185539.49986-5-joelagnelf@nvidia.com>
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


--WWOwYHGjzVps0pxd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 02:55:36PM -0400, Joel Fernandes wrote:
> +The window position is controlled via the PBUS BAR0_WINDOW register::
> +
> +    NV_PBUS_BAR0_WINDOW Register
> +    +-----+-----+--------------------------------------+
> +    |31-26|25-24|           23-0                       |
> +    |     |TARG |         BASE_ADDR                    |
> +    |     | ET  |        (bits 39:16 of VRAM address)  |
> +    +-----+-----+--------------------------------------+

Shouldn't the TARGET field cell above be fitted (extended)?

> +
> +    TARGET field values:
> +    - 0x0: VID_MEM (Video Memory / VRAM)
> +    - 0x1: SYS_MEM_COHERENT (Coherent system memory)
> +    - 0x2: SYS_MEM_NONCOHERENT (Non-coherent system memory)
> +
> +64KB Alignment Requirement
> +---------------------------
> +
> +The PRAMIN window must be aligned to 64KB boundaries in VRAM. This is en=
forced
> +by the BASE_ADDR field representing bits [39:16] of the target address::
> +
> +    VRAM Address Calculation:
> +    actual_vram_addr =3D (BASE_ADDR << 16) + pramin_offset
> +    Where:
> +    - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
> +    - pramin_offset: 20-bit offset within PRAMIN window [0x00000-0xFFFFF]
> +    Example Window Positioning:

Move the supplementary explanation out of respective literal code blocks,
like::

---- >8 ----
diff --git a/Documentation/gpu/nova/core/pramin.rst b/Documentation/gpu/nov=
a/core/pramin.rst
index 19615e504db9d5..47abe539e32a81 100644
--- a/Documentation/gpu/nova/core/pramin.rst
+++ b/Documentation/gpu/nova/core/pramin.rst
@@ -70,23 +70,28 @@ The window position is controlled via the PBUS BAR0_WIN=
DOW register::
     |     | ET  |        (bits 39:16 of VRAM address)  |
     +-----+-----+--------------------------------------+
=20
-    TARGET field values:
-    - 0x0: VID_MEM (Video Memory / VRAM)
-    - 0x1: SYS_MEM_COHERENT (Coherent system memory)
-    - 0x2: SYS_MEM_NONCOHERENT (Non-coherent system memory)
+where TARGET field values are:
+
+  - 0x0: VID_MEM (Video Memory / VRAM)
+  - 0x1: SYS_MEM_COHERENT (Coherent system memory)
+  - 0x2: SYS_MEM_NONCOHERENT (Non-coherent system memory)
=20
 64KB Alignment Requirement
 ---------------------------
=20
 The PRAMIN window must be aligned to 64KB boundaries in VRAM. This is enfo=
rced
-by the BASE_ADDR field representing bits [39:16] of the target address::
+by the BASE_ADDR field representing bits [39:16] of the target address. The
+VRAM address calculation is determined by::
=20
-    VRAM Address Calculation:
     actual_vram_addr =3D (BASE_ADDR << 16) + pramin_offset
-    Where:
-    - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
-    - pramin_offset: 20-bit offset within PRAMIN window [0x00000-0xFFFFF]
-    Example Window Positioning:
+
+where:
+
+  - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
+  - pramin_offset: 20-bit offset within PRAMIN window [0x00000-0xFFFFF]
+
+Example window positioning::
+
     +---------------------------------------------------------+
     |                    VRAM Space                           |
     |                                                         |

Thanks.=20

--=20
An old man doll... just what I always wanted! - Clara

--WWOwYHGjzVps0pxd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPg8vgAKCRD2uYlJVVFO
oyuoAP9SK55E2tSNnoxS1S+ANBUsz0CHN3jIoOgeS9ZQB8q9dgD/diBfYDATtQIi
6xSU72ZYmtPwjX3snJKLeHqpNqruDgk=
=zVnz
-----END PGP SIGNATURE-----

--WWOwYHGjzVps0pxd--
