Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F80CAD6E62
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 12:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7351610E7C6;
	Thu, 12 Jun 2025 10:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wl7wNucj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A672010E7C6;
 Thu, 12 Jun 2025 10:54:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F2A8D5C5AF4;
 Thu, 12 Jun 2025 10:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBADCC4CEEA;
 Thu, 12 Jun 2025 10:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749725677;
 bh=Svf2SlshRf4K2I3bpqEV/6RweQo/oo8/RGNKpTG7qDs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Wl7wNucjTNCstmT8lp0PPGX2AAqsrSfFv41JrNffe3eBnZlkiDeRDpgKVI5QWRn1f
 4LvzOizaTV6LTjwMAahzYTkouypLbCtX6MLiD7iWkEcFLbA5GgL0584ayTrOwyJy6q
 GZ0xDOOQvhagfMadU4IYifKGs8zn3dPIPt8DF1KHuXLEae/LN+WkKdo6gqQMgRRlAm
 0f40dVGAP/11T/OPQxjpMxL4/bnqJaNlUSnxCSLfCzpVK4/67JqW4Qhg3BxNGkU7kS
 UbFl4M6f2XJNpOAydXw/LO3zQXI6Bfab6qpFBLT14W+LFIOz/aoKNyZcRNHjTfqYdW
 erTQ3cyOhT+Tg==
Message-ID: <6e97aa79-6d6f-497f-96d2-7568d6516682@kernel.org>
Date: Thu, 12 Jun 2025 12:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/20] gpu: nova-core: add types for patching firmware
 binaries
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-18-05dfd4f39479@nvidia.com>
 <aEAf3GUUz5oxnuk9@cassiopeiae> <DAKDETL7I95F.31L41GTLYNBWO@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DAKDETL7I95F.31L41GTLYNBWO@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/12/25 9:19 AM, Alexandre Courbot wrote:
> On Wed Jun 4, 2025 at 7:28 PM JST, Danilo Krummrich wrote:
>> If we can't patch them when the object is created, i.e. in
>> FirmwareDmaObject::new(), I think we should take self by value in
>> FirmwareDmaObject::patch_signature() and return a SignedFirmwareDmaObject (which
>> can just be a transparent wrapper) instead in order to let the type system prove
>> that we did not forget to call patch_signature().
> 
> This one is a bit tricky. Signature patching is actually optional,
> depending on whether there are signatures present at all (it might not
> be the case on development setups). So involving the type system here
> would require storing the result in an enum, and then match that enum
> later in order to do the same thing in both cases - load the binary
> as-is.
> 
> So I guess I would rather leave this one as it currently is, unless
> there is a better way I haven't thought about?

In the end the idea is to ensure that we can't forget to call patch_signature(), 
so even if it's optional we could do what I mentioned above, just that 
patch_signature() might be a noop?
