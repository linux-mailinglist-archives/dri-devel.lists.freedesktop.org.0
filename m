Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24671A709E3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA9B10E4DA;
	Tue, 25 Mar 2025 19:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bNm64ZBw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D269110E4DA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 19:05:04 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-30363975406so502881a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742929504; x=1743534304; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6TMgaEW+9sayzHvoDGxPrtSjxiQA+4hzRkywj2TAG0U=;
 b=bNm64ZBwqjfzohshEK3k7JqLBfsSCj4fR+T+6opoitMCCiIXjewC0FhROQh314oTs/
 e1HjCSV4QlqXycf3ZzaeZRLtcHDA5x7B6UjWvhMzURQI301mF9eQhbz/jahRTnw/S5JD
 QC6zu06biknOuEr6weV4hh4qBetdlSEqDktpfqZFDTH3I4Zcr0FzQHD9rXhvSJB4rELP
 ioXyF3uJxhakvxfhwR1Q75e3R/Ti52OQqZtBwVnFORQHETIUwTDbsghPPCYEyIQEuZVw
 Br96qqDRfHZT6hDyCb02cwBmAfhyC24Js3KwZP04+AzBxT0FfwmLHyqrRegS+a/oFpZi
 mTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742929504; x=1743534304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6TMgaEW+9sayzHvoDGxPrtSjxiQA+4hzRkywj2TAG0U=;
 b=q7KFWBEtltzuwhAmM/AuSNDNheNdgXqwb0RAvj+gTdRm4fmmHZ37L/NQkAWgFTygTK
 c7bIsEUvRxLL0s3kC24hL6yiaxi0e5I0clPIGPjS6JvP/a7mZLaZRKTUcyB/YcddPKpM
 TxWSb/auoW/5gP1Hzbeng0NMbB0MdBY8SpCDhhgCJs1vCFOi3fmVfNIEmSiZioANSOXX
 r8jImGtzVObIZRR/CSh9tC0/alOX2FPtrrWvy05FsaoT84yPu+MiugvL+NXidpLWiujx
 97xZoNdYicgXh9Owb9+TnCwpKUxVm8B/zpBhSMNJ0/8vfVgsQZ+wYoOVYElhoVM0Xdph
 rZnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdqABj8HcJ42qpF2bqaFuzmuFIdmy7KXLa9LtAUXpOSBd+JmG5vDJMxjrCJWcp9YO458i/bE/y/QA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgwbiyvWIbwWWciy05UPymDal3wtFTfS0L4cFGWm6bACWH/pxo
 1uYfEAfp/dVR4c3KnvUkhpFz8axaHuIVRiWgw7Lzyr5UsqjQXVijg+asbz2YJ7Aj8eA1qaKg9Jt
 mDhw2t6NagF880ekmijqxo+t10gg=
X-Gm-Gg: ASbGncvyIDpNaWv6KWlNj6pYqPolcmzQyDGQpeXloHggeTc/15pRkoWX6QIe5YjA47F
 bVUW/9OkBWmAuCjmnhUSDhoSONtiMIIpGpKDek0LD75vfyMe82ZmezGSqGZ7O0pgoEVoLRlQFia
 bSiO7NWgLOwwRRCxDM5zCFmwPvtw==
X-Google-Smtp-Source: AGHT+IEaXErss0xXwV0lJBIcOaPCzt+p7KmJRqpZTTvZUvZnCO8fOgnNeypm8mZP1MAMagB1I17kUy/UdhjTcObxQRA=
X-Received: by 2002:a17:90b:3a8d:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-3036b4abf73mr2506809a91.5.1742929504147; Tue, 25 Mar 2025
 12:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250324210359.1199574-1-ojeda@kernel.org>
 <20250324210359.1199574-3-ojeda@kernel.org>
 <dd1616d5-4808-46be-9167-6fbfe76e0c73@redhat.com>
In-Reply-To: <dd1616d5-4808-46be-9167-6fbfe76e0c73@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Mar 2025 20:04:52 +0100
X-Gm-Features: AQ5f1JpmlWonQlCTJ2hC2bel5qL6r28Y6ygrNFDOCt0MmPyi13zbtF_Iod_7f3o
Message-ID: <CANiq72kz9SW8Rexj7feZRvTAhgF+cBwarpFnqu0TSk6C2r9SRQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] drm/panic: add missing Markdown code span
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
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

On Tue, Mar 25, 2025 at 10:05=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
>
> Thanks, it looks good to me.
>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>
> You want to take the whole series in the rust tree?
>
> Otherwise I can push the patch 1-2 to drm-misc-next if needed.

Please take them if possible, since others may want to take them
through their tree anyway, plus it should have less conflicts if you
change other bits, plus these are independent fixes anyway that can go
in on their own whether or not the lint gets eventually enabled.

Thanks!

Cheers,
Miguel
