Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EE2BF9E6C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 06:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF6D10E0F6;
	Wed, 22 Oct 2025 04:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="itB79jCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6412E10E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:01:45 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-27ee41e0798so101310685ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 21:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761105705; x=1761710505; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5XEGeI2U2r41+s29akUYCWbcwFKMTqkQOw+6CMAYMfM=;
 b=itB79jCjp8Hj3OdX30m8Kim9RstoZPLdqAV1UKK7GZNYPQGJnQACRJqVRlAogMRF7N
 eGrWdpcyyxDWT+WSmdKfLwsGMIBj2HTab54G2kdytFCKtsDBKf8BqUoLjtuUHZeuObkW
 rEdn3Gadazm8x8jLPsqwtd3jg3bItrlEPrnHSztriJfcoLqyT2Nwj2MIwzcKLJf5a2pW
 FveLO8baHZ1Ye7FxPNghUGQnjWUgC3PqU04m4u93sn1ShA53xYNneb+8utlwnZjsfv/g
 Z9vUKoq6XJNVUU0v35IGkcxCSHw/IbUsYQoSYer/WfOvZPRl4CGQV6yt5MI3hNxaY7lZ
 f12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761105705; x=1761710505;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5XEGeI2U2r41+s29akUYCWbcwFKMTqkQOw+6CMAYMfM=;
 b=hd1QibXpaj891EkK8Y7gNpUfsKWir4Si1n7Ib01Ot9FgsE9dw43eeYienzRlxiQPoG
 WSHuEhkjICfkSTFEiR62z0z/eKasR7Sx5PCVCPCXVJ4/Qh7VjsE78KqJsjTRmbFgkvEj
 jU0f9jYX+EkGZZelDRhR2NCzCKNjuaAlrdPZF3KeUbrY8u+xItxOC0qHRI4r8CT2Y0Is
 Jr7SVWc0vZM+cJAcoo93HbjMZGsISq5Mt+G1iXJATO7psbgCewG+RG321lAjltYDn4ok
 rDM/XtY+oxsnSaR1j0OIXVSXLYvcG21NHskvH51bcgCtyYd1PKVQpRlwCohgZo8YnbMy
 pEXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW97YTuHXgsLFHaczMg4wLKNr0UnXN6/ZPIxPCwSQUBWlA4ydIKe2cKx0Zpom1bxPzap5465A0kIgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7M9NANz+rtRtK0m+DNHTBHU8hwslzA0tcETwqbdbJvdiC+nNG
 XFQ/nN+ymKU0y45TcarPemE81Euru2lFh6vJBtPlCpboa06MAOvapOak5Fy3zHs8euU=
X-Gm-Gg: ASbGncthi32O5MFkRsELclEIs8waVoztK2y5pDPqjLAtdfM5ydpAGda1bQblPIH9MZV
 +nAgToywiskMICY6OSf0WbiiKtEZ9WSPQtgXDWDN6CMkgQKiIVXone+hb/apqfVerd+yu6NPrdn
 0Tep+IFVYDPJnIxP/Yi8w1iMz0Vl6lB9pwop9NiODixpSn+4/gtIpzOEXdFiK+bmJfvckTwG1XU
 szL0nqHcDEGwEWiNZfRTuFI3JIgzJSndbWtaWu+BmYxyDsrxxgwkd0lYMVDvzTrYu2EjlSQjeBO
 h1tDuc3nQQY17NPp0cPlusVaxTabte7yxRISGExXkH+Gawakwg+YGFxP6SchPeLmpVEASR7VkX9
 dCAGAQRTnHBOFhemXHQIBKP8Bl2AFUHNviimgscl4fPImDabGJz5E/pKsJcqF0fUaba4r1Y+tly
 kohKK9eiwALO0a
X-Google-Smtp-Source: AGHT+IEYWTGPLkVLKAMGZYnPNOk1bG7CyHUMxRahoDXL1MDVvSzLtlyzXLVhQRT4L6q1WhaGPTRqNA==
X-Received: by 2002:a17:902:f70f:b0:290:2a14:2eab with SMTP id
 d9443c01a7336-290c9cf8f2fmr233326615ad.11.1761105704778; 
 Tue, 21 Oct 2025 21:01:44 -0700 (PDT)
Received: from localhost ([122.172.87.183]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292472193acsm125225365ad.108.2025.10.21.21.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 21:01:44 -0700 (PDT)
Date: Wed, 22 Oct 2025 09:31:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, 
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v18 11/16] rust: opp: fix broken rustdoc link
Message-ID: <bjoulx2acrfpnqmwmnamunihzuaakyk3i6m3gvtcxklssmznt2@azfbrjhiedi3>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
 <20251018-cstr-core-v18-11-ef3d02760804@gmail.com>
 <gcdcwpotzidrksmsnyvesnojcylbb2fqpiue4fijhj2cmayli5@7lpyessslxka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gcdcwpotzidrksmsnyvesnojcylbb2fqpiue4fijhj2cmayli5@7lpyessslxka>
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

On 22-10-25, 07:57, Viresh Kumar wrote:
> On 18-10-25, 13:45, Tamir Duberstein wrote:
> > Correct the spelling of "CString" to make the link work.
> > 
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  rust/kernel/opp.rs | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

I have instead applied this one now. Thanks.

-- 
viresh
