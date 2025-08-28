Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F383B3AB24
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 21:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7335E10EAB3;
	Thu, 28 Aug 2025 19:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cKjABHhx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B4210EAB3;
 Thu, 28 Aug 2025 19:58:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C4C196013D;
 Thu, 28 Aug 2025 19:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5731C4CEF7;
 Thu, 28 Aug 2025 19:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756411108;
 bh=IL8Nv0+2v6BSx6uhM82XpLiqmPiQ1BQkBmIbIkgLXl4=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=cKjABHhxolhzTGSSpNq1eYlRFx+H7KaAJg3QnbcmxcjlZ/duIZZwMsINKl1ILSAwf
 kPCWJIrAitgZ9rkN5q87G/ri+v+1hFJCAcvrThE6O02+qmujSwT5mqgjvW2Ni+8iaz
 Ha8CFx+mLcC5VHXI4suEsokteE8Os6sIbwpn3FoIRFZ0KuftbW7R0S63LGFdamlX/v
 DDMoiYviTag98LgPBcAYBzdUFd2OGrjs9WnPdWXy7n5lhLP/JizMRw7dvwDpJ8GxUw
 Giaffrbm0eMpxb/rDlzu2eXaZlKp3qPBL/Qs3i4LnetJdRKdxN6hFX0h1VedUOQtOn
 KYsC63miJm3ig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 21:58:25 +0200
Message-Id: <DCEBRUJ383TE.R6W8YCRNZP1O@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: gpu: nova-core: arm32 build errors
References: <20250828160247.37492-1-ojeda@kernel.org>
 <b680c343-ba97-4eb4-b426-56e318dce492@kernel.org>
 <DCEB1J2P3MZS.3IGXEYP0MAC5H@kernel.org>
 <CANiq72mkPqFnb4ztiCokE6+ntVSmgOTgERshg-4SMmLboFOqNg@mail.gmail.com>
 <CANiq72=6Ji97UW96V-VjjbRG=ouGeHA7QXpP2gBOJYFx=oJ19w@mail.gmail.com>
In-Reply-To: <CANiq72=6Ji97UW96V-VjjbRG=ouGeHA7QXpP2gBOJYFx=oJ19w@mail.gmail.com>
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

On Thu Aug 28, 2025 at 9:36 PM CEST, Miguel Ojeda wrote:
> On Thu, Aug 28, 2025 at 9:31=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> and a `DmaAddress`
>> newtype, not just a typedef, could perhaps be nice anyway?
>
> The one from your linked patch is not a newtype though, so I guess
> there is a reason for that.

No specific reason, I didn't see a lot of value in a newtype in the first
place, depending on you answer in the other thread, may we just found some
value. :)
