Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A27CBE58EF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 23:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C9510EA96;
	Thu, 16 Oct 2025 21:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nki/ULUq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51FB10EA96;
 Thu, 16 Oct 2025 21:19:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 95F76418D6;
 Thu, 16 Oct 2025 21:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5463EC4CEF1;
 Thu, 16 Oct 2025 21:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760649574;
 bh=tLht0hogKAd9moeHeSio4bb2QbKG78zvDKNBY8e6Beo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nki/ULUqCLt0HVz0H2BEsvB08XnDngifRrqfMIme7ex6WmWEZFW/+PNYok88Ye1gk
 5NkZym2m9SvUva0L9vOd3k24C/OrFF5ArJXswfzpqive3b1e6TBqC7xi+BpAPcBjth
 byES0LmjEvfGbSdV0K6MbJTkGWbZJqoCiF3HAwMoKhDIPsNgayYLGxZRhDg2nGtqGi
 1DB/Oox6qsSFGDFDyvLAP86L4wi5LOcBQLe4SSwCBP9ZCjIcGmmjFsMPayp1GWxg8y
 Rxd2xN5GUFocpj2VjzV3n9k3pn7OKq1frxrABPcAQcMk4l/H+7F6XETeaT48Oi81KQ
 rZeNKKHUmRNdw==
Message-ID: <0eedf2b9-2e80-421a-9356-d5ba8e49a147@kernel.org>
Date: Thu, 16 Oct 2025 23:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Solve mentions of `CoherentAllocation`
 improvements [COHA]
To: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
 <409f2f03-2bc2-4cb8-9ca7-4e30f82077ff@kernel.org>
 <21944b18-ac36-4acd-9d36-cc05579acc0d@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <21944b18-ac36-4acd-9d36-cc05579acc0d@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 10/16/25 11:13 PM, Daniel del Castillo wrote:
> Sorry, I thought it was okay as they were part of the same task. Will do.

No worries, no need to apologize -- thanks for your contribution!
> Thanks for the other comments as well, I'll apply them and send a new
> version soon.
