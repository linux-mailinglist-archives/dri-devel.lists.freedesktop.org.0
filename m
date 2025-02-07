Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37151A2CB60
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 19:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E733510E127;
	Fri,  7 Feb 2025 18:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ULkxKUtL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FA910E127
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 18:33:46 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ab2c9b8aecaso427759666b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 10:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1738953225; x=1739558025;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LSfjVDdFy380pTqlr6fb1AB4PEji/7GivU8X5uTYCzs=;
 b=ULkxKUtLM6LVCENo+RT2hlV2lwDOL07XdAuYqfbdIEd/gUAIEoM8QajJxO5mJx593n
 b8cthefSlons4h9V11yxN6dWj29+SR/z07m7E0HVwD2BJbEdhGyMzfoSBuqKpLhybWaN
 03b+2XkkLjbPqBHcbcDKTB7aAVCg2Mv4O7RFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738953225; x=1739558025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LSfjVDdFy380pTqlr6fb1AB4PEji/7GivU8X5uTYCzs=;
 b=fwZMuJ9pCCyrBDh6xc/mzL0AGR5YC+VV4xfb6539zP15P8djszJ7YcWcdTwibG+Pig
 n572Vzw3mGrpg4NsDJKDQ3e3kpwA298uOcE34H9UdcIrGkrDgCdp1iSJOGlOVydNzBwG
 Jmyo/ZHCDLUb6bsvP1eVbwGfUhxkScJ4r6IKC7DcTyMr2R0AlKPJkShANmq7nd8ap4ky
 Q8OHj4aMHNypZyBoinyhz5KVT525qQzRsQN0Ecmtyzrnd9Q/xiDLLeM3vOnPMLCYgy2F
 qaC2vyj7r8953qvk5t4iiscIKvDkyt8LliYvRBV1RVulFKQgIXqY92q9lFhLRNg4UP9H
 tEJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPdAbxRYUIiicTE/rWuyyc5x/GoaOekG9HOI7KO+tO0OIlX9TD8q5udZNIIi184bUj5B28iY2RHjw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEvL1Ypi0B7fkTsF+bdPLgv39nBYU8zxC/QU2qGh5+xq4M6oxQ
 Knyr2HRVNHwDrvFPL/b1Qz6cIyIGa/0ItTIpS2zESW7ZfsJhVkbvdn4oN7FddKEyIUfncXc+c4x
 l76I=
X-Gm-Gg: ASbGncvMRCQrjehy4IWY5nbPfnWIakeLzEUx6tPS2Goel1AHeAEENN1LNKepvSNma7F
 Nh6ppZhDUeY8Y/N43TzwWUBH8lKnohK+eJW5Jr8yUZy7dg/CjqD5TRIaNQM6fM2oytPnjLV6ANa
 qfElZzzdVMuEdy9MEwwzKh8SGkcVoTi+8s99BRhJLGEu7Fqc2NBokrfz9qPzF1OFHnsGpC1Oqrw
 pmWbRVXyUxq/kjnZ8Natl6Hnyot2x9DVJG8WfNoVgmxuDeu0S+18SJRgJbXEwa57D0Dbm5fBX7S
 9kJbG2k0RhDKCzuoBDgZiyPEXeifRFcN1SAEnc/NKgopsPnEERnOcMk25cn2J/Ghaw==
X-Google-Smtp-Source: AGHT+IHxaTbK7lh0VO0HAc3Oup10gAuDNBgW8ujlHM6k+0cmNJ4LNTdONPRJMDQihPibXF8+1J98ww==
X-Received: by 2002:a17:907:d0b:b0:ab7:b7e:65c3 with SMTP id
 a640c23a62f3a-ab789adb0e3mr337052266b.17.1738953224587; 
 Fri, 07 Feb 2025 10:33:44 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f484acsm315640466b.11.2025.02.07.10.33.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 10:33:44 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5dcf0de81ebso4698059a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 10:33:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW1tTiW1FShx36OxOyd6yZsqG4dksaPmZeMvy9d7kHMyf19q42IVYDc+iDTWSy6DN9ph4a27OqLZ00=@lists.freedesktop.org
X-Received: by 2002:a17:907:3f12:b0:ab6:8fda:3bcf with SMTP id
 a640c23a62f3a-ab789c85e91mr475100466b.56.1738953223934; Fri, 07 Feb 2025
 10:33:43 -0800 (PST)
MIME-Version: 1.0
References: <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh> <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <Z6UPXxEJYpanU9iU@cassiopeiae>
 <4c0a7cf9-26e1-4a19-8a6e-7c30bc3aef86@marcan.st>
 <20250207-mature-pastel-rottweiler-e6dbd9@lemur>
 <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
In-Reply-To: <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Feb 2025 10:33:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiQUya5_zTwLFNT2XkX-bf_H1vJiJ3zuADnO-3EwOOjVA@mail.gmail.com>
X-Gm-Features: AWEUYZnMc9rrYSL8b5KBAFdfhmKQWSDBm7ZGh4b76ktZGQGeBJNjsWmuQH4lWbE
Message-ID: <CAHk-=wiQUya5_zTwLFNT2XkX-bf_H1vJiJ3zuADnO-3EwOOjVA@mail.gmail.com>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: Hector Martin <marcan@marcan.st>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, 
 Dave Airlie <airlied@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, 
 phasta@kernel.org, Christoph Hellwig <hch@lst.de>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com, 
 aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 airlied@redhat.com, "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>, 
 DRI Development <dri-devel@lists.freedesktop.org>
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

On Fri, 7 Feb 2025 at 10:02, Hector Martin <marcan@marcan.st> wrote:
>
> Meanwhile, for better or worse, much of Linux infra *is* centralized -
> for example, the mailing lists themselves, and a lot of the Git hosting.

The mailing lists are mostly on kernel.org, but the git hosting most
certainly is not centralized in any way.

The kernel.org git repositories used to be special in that I didn't
require signed tags for them, because I trusted the user maintenance.
But I was encouraging signed tags even back then, and once it got to
the point where most were signed anyway, I just made it a rule. So now
kernel.org isn't special even in that respect.

Now, kernel.org is very much _convenient_. And you see that in the
stats: of my pulls in the last year, 85% have been from kernel.org.
But that is very much because it is convenient, not because it's
centralized.

But that still leaves the 15% that aren't kernel.org.

Since I did the stats, in case anybody is interested, the top
non-kernel.org hosts for my pulls are github.com, git.samba.org,
gitlab.freedesktop.org, evilpiepirate.org, git.infradead.org and
git.lwn.net (and there's a handful of other ones in there).

(And while I did the stats just for *my* pulls, if you look at total
merges over-all, the non-korg repositories are actually at 20% - I
think my percentages are higher simply because I tend to pull from
mostly top-level maintainers, and those are even more likely to use a
kernel.org account).

More importtantly, not being centralized was very much a basic tenet
of git, so *if* git.kernel.org were to become problematic, it's very
easy to move git repositories anywhere else. Very much by design.

              Linus
