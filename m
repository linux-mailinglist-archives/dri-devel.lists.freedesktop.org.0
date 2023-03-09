Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 517DB6B1B16
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 07:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2731110E78A;
	Thu,  9 Mar 2023 06:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F4E10E78A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 06:04:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id E42A342037;
 Thu,  9 Mar 2023 06:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678341862;
 bh=yXH1tZdsDmO++xIlBpu0JLuAAbte1OW7AlybHK5hIBg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=L26euRJ0eRSChLfBBV+IWoJpXejfXnHpxYL7EKKxQNfNY3MHWKaHrZ0sXQwYPrYjl
 j0hAICH5fd0yIi9MUnBCGQJ2J/6Qbc2vaFXhPzja0rtJkPaOT0D6BVUaDh2KleQjJb
 V9Q8BguecZBBMPvATXnO5AmpObEALYXxJDP4XlSvevTfXkmhlRxHWnw8QuunLcXUOm
 YrZoEGe/la+xsrlvECQsvt7d+kil4hHLFigx8YmCEzkKb1Y6ouadywOXrPImwCCfU5
 EkNVKQwuFJFHWt9UWr30hoU/WCszEJG2VRApZSuCsQz88fGHJUdoD9Yew/iCxUuDC7
 BTptPp5MzKzeg==
Message-ID: <11ce9291-c17f-e73d-fb5d-13d5386fe6be@asahilina.net>
Date: Thu, 9 Mar 2023 15:04:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 01/18] rust: drm: ioctl: Add DRM ioctl abstraction
Content-Language: en-US
To: =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-1-917ff5bc80a8@asahilina.net>
 <D9Cyx-9kbjaeb8QVBFqapDyctoDdVyu5uXEJDR41sdXUDXM1VgdRicV5huJDwfC3-T2J-R_DYHH8JZ1_aRdgbeYZFT78J9QveeeYbiTq4yU=@protonmail.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <D9Cyx-9kbjaeb8QVBFqapDyctoDdVyu5uXEJDR41sdXUDXM1VgdRicV5huJDwfC3-T2J-R_DYHH8JZ1_aRdgbeYZFT78J9QveeeYbiTq4yU=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 linaro-mm-sig@lists.linaro.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 linux-sgx@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/03/2023 02.34, Björn Roy Baron wrote:
>> +                            // SAFETY: This is just the ioctl argument, which hopefully has the right type
>> +                            // (we've done our best checking the size).
> 
> In the rust tree there is the ReadableFromBytes [1] trait which indicates that it is safe to read arbitrary bytes into the type. Maybe you could add it as bound on the argument type when it lands in rust-next? This way you can't end up with for example a struct containing a bool with the byte value 2, which is UB.

There's actually a much bigger story here, because that trait isn't
really very useful without a way to auto-derive it. I need the same kind
of guarantee for all the GPU firmware structs...

There's one using only declarative macros [1] and one using proc macros
[2]. And then, since ioctl arguments are declared in C UAPI header
files, we need a way to be able to derive those traits for them... which
I guess means bindgen changes?

For now though, I don't think this is something we need to worry about
too much for this particular use case because the macro forces all
struct types to be part of `bindings`, and any driver UAPI should
already follow these constraints if it is well-formed (and UAPIs are
going to already attract a lot of scrutiny anyway). Technically you
could try taking a random kernel struct containing a `bool` in an ioctl
list, but that would stand out as nonsense just as much as trying to
unsafe impl ReadableFromBytes for it so... it's kind of an academic
problem ^^

Actually, I think we talked of moving UAPI types to a separate crate (so
drivers can get access to those types and only those types, not the main
bindings crate). Then maybe we could just say that if the macro forces
the type to be from that crate, it's inherently safe since all UAPIs
should already be castable to/from bytes if properly designed.

Aside: I'm not sure the ReadableFromBytes/WritableToBytes distinction is
very useful. I know it exists (padding bytes, uninit fields, and
technically bool should be WritableToBytes but not ReadableFromBytes),
but I can't think of a good use case for it... I think I'd rather start
with a single trait and just always enforce the union of the rules,
because pretty much any time you're casting to/from bytes you want
well-defined "bag of bytes" struct layouts anyway. ioctls can be R/W/RW
so having separate traits depending on ioctl type complicates the code...

[1]
https://github.com/QubesOS/qubes-gui-rust/blob/940754bfefb7325548eece658c307a0c41c9bc7c/qubes-castable/src/lib.rs
[2] https://docs.rs/pkbuffer/latest/pkbuffer/derive.Castable.html

> 
> https://rust-for-linux.github.io/docs/kernel/io_buffer/trait.ReadableFromBytes.html [1]
> 

~~ Lina
