Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86564D3BA40
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 22:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B00D10E36E;
	Mon, 19 Jan 2026 21:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Q9Xf8fbQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D91310E36E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 21:46:01 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260119214559euoutp0210074dcf276029dfe2c10a37c58d3031~MQAiaXjSH3214732147euoutp02Q
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 21:45:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20260119214559euoutp0210074dcf276029dfe2c10a37c58d3031~MQAiaXjSH3214732147euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1768859159;
 bh=FiwIk5BBQQ9iPckGkn5Dt7hTifYvLcVxHD5dU0pMV5E=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Q9Xf8fbQ6xVsysLFDwsjw9red5LNE/4dOsmM6sweOLApnZwCpBccB68wd3WMnXddC
 0sstwB7PMcjsb9GbEeeM3X8TzuvpDxJe9fT4KrkQ3dvNZa7JCTxLNeKutAEUPGONtT
 YvPWGiPdsR2VcrU0fvTXCArpfNsRUtHtHYRWY64g=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260119214557eucas1p2a32532504042480c2809f13589fc9127~MQAhG-1kc1870218702eucas1p2W;
 Mon, 19 Jan 2026 21:45:57 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260119214556eusmtip2baec3b17eba8b350eca229f32831d134~MQAgH2fip0752007520eusmtip22;
 Mon, 19 Jan 2026 21:45:56 +0000 (GMT)
Message-ID: <90657b83-1cff-4c7d-adde-9b560c2be7c2@samsung.com>
Date: Mon, 19 Jan 2026 22:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] pwm: th1520: remove impl Send/Sync for
 Th1520PwmDriverData
To: Alice Ryhl <aliceryhl@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20260113-clk-send-sync-v4-3-712bc7d94a79@google.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260119214557eucas1p2a32532504042480c2809f13589fc9127
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260113151335eucas1p157cd966c5f0f4e477fb11272810a0ae8
X-EPHeader: CA
X-CMS-RootMailID: 20260113151335eucas1p157cd966c5f0f4e477fb11272810a0ae8
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
 <CGME20260113151335eucas1p157cd966c5f0f4e477fb11272810a0ae8@eucas1p1.samsung.com>
 <20260113-clk-send-sync-v4-3-712bc7d94a79@google.com>
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



On 1/13/26 16:12, Alice Ryhl wrote:
> Now that clk implements Send and Sync, we no longer need to manually
> implement these traits for Th1520PwmDriverData. Thus remove the
> implementations.
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Cc: linux-riscv@lists.infradead.org
> ---
>  drivers/pwm/pwm_th1520.rs | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> index e3b7e77356fc2492077c519073e861beb3e44df9..043dc4dbc6232020195c7b73fad302bbb69652df 100644
> --- a/drivers/pwm/pwm_th1520.rs
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -97,21 +97,6 @@ struct Th1520PwmDriverData {
>      clk: Clk,
>  }
>  
> -// This `unsafe` implementation is a temporary necessity because the underlying `kernel::clk::Clk`
> -// type does not yet expose `Send` and `Sync` implementations. This block should be removed
> -// as soon as the clock abstraction provides these guarantees directly.
> -// TODO: Remove those unsafe impl's when Clk will support them itself.
> -
> -// SAFETY: The `devres` framework requires the driver's private data to be `Send` and `Sync`.
> -// We can guarantee this because the PWM core synchronizes all callbacks, preventing concurrent
> -// access to the contained `iomem` and `clk` resources.
> -unsafe impl Send for Th1520PwmDriverData {}
> -
> -// SAFETY: The same reasoning applies as for `Send`. The PWM core's synchronization
> -// guarantees that it is safe for multiple threads to have shared access (`&self`)
> -// to the driver data during callbacks.
> -unsafe impl Sync for Th1520PwmDriverData {}
> -
>  impl pwm::PwmOps for Th1520PwmDriverData {
>      type WfHw = Th1520WfHw;
>  
> 

I thought this was already merged :-).

Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>
