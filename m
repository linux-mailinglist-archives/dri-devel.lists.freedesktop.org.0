Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C815AAE57B2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 01:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6DB10E47A;
	Mon, 23 Jun 2025 23:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XSfXnQSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384F510E47A;
 Mon, 23 Jun 2025 23:13:36 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-313862d48e7so710175a91.1; 
 Mon, 23 Jun 2025 16:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750720416; x=1751325216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2HXruGsRkrnO4T0LtQG3CCRxkdrPRNW2kXRz195ROg8=;
 b=XSfXnQScpJ2N7lMWMbGjXQ/ZaqEB0B/TCGCiPJtgsJAl/0sWVDgivBu2VbEk6BAcL5
 C2rWEKoiCbrA/B2/nGL+EDU0/eL3aEAu2qF4Wn9CmC/t/TIoQk5IbbjoZEAtLnCnLMN5
 VYdlstDaLw/oXMb+ZoBxTWjsLV2BKl1JUsQgZyTTvSbkV4PY9UquFOI39bw4T1DTIypw
 8itHLRv46tTucuJwsDJlJERyZCL++W7TFyRcH92ZgQ1gtE8p/nRJoE76eYXpkuVQ66Gp
 u3JRTwA97SVF0AddR4zQSA8QeZos4vKsw1+vd6r2xV6cJ6ec6zNR5INlrQ8Ko8yPWVrn
 iYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750720416; x=1751325216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2HXruGsRkrnO4T0LtQG3CCRxkdrPRNW2kXRz195ROg8=;
 b=veZOOmJsp6Nr4JoD1kcJy9mjZmMcc/OPpXK/+qNM5ZvioUNUY9u/pyaCTjZVFg4YSt
 yBnrLhqwcaEMZ8NXx6skpcNFCTIuL4ZTsrGNe1PqWNhQdt1GBw2eWZBqqjPHZF2OFEwp
 +N6uDVPwoXEiPlXFR9WeOU7Q++jPtVozCkeCN1EBRBkmK1qCig/01qEdjyYo8GjWgO1H
 sH54V1IAs3TRq0vhsds/LnmKSVW9R+UC+Do7S3YhDggr3qyANMhhr8IWJjiE09TxWCBi
 pQWrhjxBenP/bEQ9bZAxe9rQg/TPOaXzpzu4fv2i7ArbW2JaSg+t5Tq/qkeEQEiD+H0T
 5m5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5Hoc1xokaZuicL34k9V+/jCc7rz/4NLka2B+1VfoLk+TwecHIIrsaWr/Y2OwMdzTOD7o8eTMLYw==@lists.freedesktop.org,
 AJvYcCXG8tQwpaWHkPQlhKG/0j3nmRRqvuTHt5pIULnx1HQ+Gc6eacSYW0+C/bhrY/OpmTQgPwfofINHg3s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpk68tK2nxbI+uZsxYK4A/eDaAbtGzARLEtkfVfRxR2l7wVFjC
 NDbsziEVVLmkDtGfXPZDcJsyBFNfLqPTGICwNmzOIjTmvtrjmf+wBecxtpM0E2nflbZVFffwPII
 yyxbPVE4srMOD0JHD6Jg8QuTOtQRT36Q=
X-Gm-Gg: ASbGncuoNpCC6aqJEI02kTDjbfvL2iNgQm9TUcV/SGOYZiiKVYQN3h4Un99bBvyPP2Y
 7Svxl+1KKu2eJotbGlUoFiYx4qbeCXtoEVgw368An0GSVgxgfaODWvpZDTZLNL144mv7DLMaJG4
 /wVokXb4zQ4Unys0kFKSTCUp8ZQ5C/IZfpcQoaMXtC1P0=
X-Google-Smtp-Source: AGHT+IH7XVvohyW/cz0YuCPytHgywdDr9SzijVJMsGTdwBGX+kM/pF+FLLchYSGNnYqk9nn2La4vwv67m+JjzET5PAE=
X-Received: by 2002:a17:90a:d64f:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-3159d577d0cmr6882432a91.0.1750720415660; Mon, 23 Jun 2025
 16:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
In-Reply-To: <20250609122200.179307-1-trintaeoitogc@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Jun 2025 01:13:22 +0200
X-Gm-Features: Ac12FXzn7V6XJa8kRyU5bxAVt4CroqqcMGg3veONxVG0AI0fCukO93xidJUyyDo
Message-ID: <CANiq72=5XhSd5qbWV5PTWQk18-roFKCs=kqF0iEbcn99tKhOoA@mail.gmail.com>
Subject: Re: [PATCH] rust: module: remove deprecated author key
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, dakr@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, mcgrof@kernel.org, russ.weight@linux.dev, 
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 leitao@debian.org, gregkh@linuxfoundation.org, david.m.ertman@intel.com, 
 ira.weiny@intel.com, leon@kernel.org, fujita.tomonori@gmail.com, 
 tamird@gmail.com, igor.korotin.linux@gmail.com, walmeida@microsoft.com, 
 anisse@astier.eu, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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

On Mon, Jun 9, 2025 at 2:22=E2=80=AFPM Guilherme Giacomo Simoes
<trintaeoitogc@gmail.com> wrote:
>
> Commit 38559da6afb2 ("rust: module: introduce `authors` key") introduced
> a new `authors` key to support multiple module authors, while keeping
> the old `author` key for backward compatibility.
>
> Now that all in-tree modules have migrated to `authors`, remove:
> 1. The deprecated `author` key support from the module macro
> 2. Legacy `author` entries from remaining modules
>
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Reworded slightly. - Miguel ]

I don't see any new/missing ones in -next, so this should be clean. Let's s=
ee...

Cheers,
Miguel
