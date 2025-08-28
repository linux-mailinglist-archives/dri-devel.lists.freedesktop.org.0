Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2198FB3ACB6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 23:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3300610EAE1;
	Thu, 28 Aug 2025 21:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C1cmWuxP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F4610EAE3;
 Thu, 28 Aug 2025 21:27:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F70860139;
 Thu, 28 Aug 2025 21:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED67C4CEEB;
 Thu, 28 Aug 2025 21:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756416475;
 bh=qA1BcQ3hWIOqTfWw0aAFTPIJL30bc08GdeoDPGTnu4U=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=C1cmWuxPqxaSGqPC5BDtl+YVTDKgdfUwazddCx+jtuYDM0FAEFDgrW081DIHEtoU2
 XK6G6aZK4ZTXOQC5+10V8VGaI7TD/m9PtC5KK2lmWfyi21oWFrT52HPMNjdwBhd563
 GGrirRrmzTbLAYOu0RMAqzolC0Wxp76GwGr0i3U8piMzc5SEfih9130z2BNRa0uFuB
 H+blxdTf8LCswMiRfsDuUYncxqOQJjbOwheAa4m/6TwKPwJ6XIBcO0fkfmLclWc4oa
 3goXTB3MHAFxTomVp958Z/K01KUOoOUsizlYZmx15hdGW3If0QpjcSWjH68puD09rc
 X8wIEFav6LnqA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 23:27:51 +0200
Message-Id: <DCEDOBPT4VLP.R2K3EWY871F1@kernel.org>
Subject: Re: gpu: nova-core: arm32 build errors
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250828160247.37492-1-ojeda@kernel.org>
 <b680c343-ba97-4eb4-b426-56e318dce492@kernel.org>
 <DCEB1J2P3MZS.3IGXEYP0MAC5H@kernel.org>
 <CANiq72mkPqFnb4ztiCokE6+ntVSmgOTgERshg-4SMmLboFOqNg@mail.gmail.com>
 <CANiq72=6Ji97UW96V-VjjbRG=ouGeHA7QXpP2gBOJYFx=oJ19w@mail.gmail.com>
 <DCEBRUJ383TE.R6W8YCRNZP1O@kernel.org>
In-Reply-To: <DCEBRUJ383TE.R6W8YCRNZP1O@kernel.org>
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

On Thu Aug 28, 2025 at 9:58 PM CEST, Danilo Krummrich wrote:
> On Thu Aug 28, 2025 at 9:36 PM CEST, Miguel Ojeda wrote:
>> On Thu, Aug 28, 2025 at 9:31=E2=80=AFPM Miguel Ojeda
>> <miguel.ojeda.sandonis@gmail.com> wrote:
>>>
>>> and a `DmaAddress`
>>> newtype, not just a typedef, could perhaps be nice anyway?
>>
>> The one from your linked patch is not a newtype though, so I guess
>> there is a reason for that.
>
> No specific reason, I didn't see a lot of value in a newtype in the first
> place, depending on you answer in the other thread, may we just found som=
e
> value. :)

To expand a bit, the typdef is also for simplicity. Eventually, drivers wil=
l do
some arithmetic on the DMA address, etc.

So, if we have a new type, we'd probably want to provide methods for doing =
the
most common arithmetic operations, because we don't want to convert to/from=
 the
corresponding primitive type all the time.

At the same time we could take this further and also provide a DmaRange typ=
e,
which also considers the size for those operations.

DmaRange is actually something that I had in mind to implement subsequently=
,
because I'm not too happy with CoherentAllocation::dma_handle_with_offset()=
,
it's just too specific and insufficient.

Given that, I thought there's not that much value in making DmaAddress a ne=
w
type. (Mybe saying "no specific reason" was a slight understatement. :)

So, if the idea was to have from/to helpers, we can also do them on DmaRang=
e.

However, given that also the above only helps in a limited way for the case=
s
discussed in the other thread, I feel like the best option might still be t=
o
depend on 64-bit for Nova.
