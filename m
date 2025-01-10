Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A43A09383
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 15:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D7B10F0F1;
	Fri, 10 Jan 2025 14:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="Hq1NT6fw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFADB10F0F4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 14:32:14 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e5447fae695so3674669276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 06:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1736519534; x=1737124334;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NDwKXJyUu7WK6+pPH5SAf0E0Lgsz939qIMhTM5AwEY=;
 b=Hq1NT6fwWe2IVSVMUq3fZR7FAUjoLE/G8+a7Q1SvgkU6c8lR3Fg/UZhi2B2izMNlnS
 nGxkmvbv5Zj4fuJ9IDZV4bKYZ1gDpQ5WVP2b8xgZZIoUAh4JVvBcVjT189cs/PxsHEtq
 SMHaNs9H3gmiglzC72UyM8Xu7zDWhi7sPGbKq830OaPXSFy3Wkoh+zR33jjtguEiHvzX
 17SpPimEypwk+B6uqCKpnOTZoWDeDMfSKSBalTYm7lZFFyOmritSPPaKwlxQ96P9a+N4
 3OMjjbBoj4yHeQhOxaFqMRGvLi4QORIz2UYSYM3WTvoyIzrJ4Oah2CMb+0PTr6ZeVU44
 hAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736519534; x=1737124334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NDwKXJyUu7WK6+pPH5SAf0E0Lgsz939qIMhTM5AwEY=;
 b=nFPtHc8j9UBrzhVzWIc3ZQBdOACCQfiQFQwzwRrURAXfrK+RT3RCV4v13zNHDw5f2J
 ywo2JqNunKUH1A0V+wwqGWVKRryWBylDF4PAFuRMpJ5UAW9WxpiHrajoKJEWxOyy2GsF
 ckpMpmJDvrp/6iMB6i/eeTALaeRoTVSG6PNm62ok9qB/ZifuwLHUSEFEwozFCyId/leE
 IVkU02zQSoAmC0pwePPN6fDm/z1tyo3z6rbcmoWPe3qUtoIxQfXPPRaB/U9HaOMwTML9
 la0ooMpbPhbGfD3lE8rcJ3CZMgWN0yw/eMdQrwZhGMIduG1urjjaJVS7USVcOL5Cd/el
 yh8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpFZUttIK3ueugPiaUgrDdODFTOl+3lUvRKH83MZ/jJzKkAFa+FKQNjmuIPkHbWc2QI5ZlG5EO8TI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYilJgqyzV4a8Em5u/jzkqOWaQjuEtSbCfy70Ijt9TMysVlM44
 FgO8Z/4fZ89cGFNBR96MS+RBPWagfpLNNh+0RdbhQUnauq1gVHwSmjK5reLjmHvlhc1Y/er8TAX
 aQTL0hXc6kGrge10D124V3DgF/WreGbbLsGZpVQ==
X-Gm-Gg: ASbGnctFM60fe4Dto81b1BdC9BIsrNedZj0dFzZ2/FoIrCE9vUwNWig4dO+lTC+P8YC
 /v3TnGLoVjNnrsilnzsDP86J6VRnYTODfdR2nC9E=
X-Google-Smtp-Source: AGHT+IE/nVT9Nwx4AT/InxOiesUKohbC0qEI3D0DSgjbaUlRJT7+3V/ghgGL9kHWJzIDsa7fJW18YuXDe9ZVuPQc94s=
X-Received: by 2002:a25:11c9:0:b0:e39:a3d9:48eb with SMTP id
 3f1490d57ef6-e54ee1824f1mr6138619276.26.1736519533692; Fri, 10 Jan 2025
 06:32:13 -0800 (PST)
MIME-Version: 1.0
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
 <CADnq5_PAG662SODmS8cSg7jcyh8ZQRgcWMtgjx5RZbuUE7j3Og@mail.gmail.com>
 <6a17b4f1-5b5b-4226-b3c3-4dfa3f3c3811@amd.com>
 <CADGDV=Vfnqmdn9Hdo9e3Av66NeZD1j1iijsEnP8Dqwakey5epA@mail.gmail.com>
 <3c47ea32-eeb3-47f1-a626-5868457469ab@amd.com>
In-Reply-To: <3c47ea32-eeb3-47f1-a626-5868457469ab@amd.com>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 10 Jan 2025 15:32:02 +0100
X-Gm-Features: AbW1kvaEBc0OnI-S2OXnAIQKXGFEKFfAubJoVQYPgGpAsjtDEZRHdwK0jmK7Dh0
Message-ID: <CADGDV=UCd3d93NtppetkrgG+pE-0EoxxXQMwjgiZPbvRBStKiw@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>
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

[...]
> Take a look at those messages right before the crash:
>
> J=C3=A4n 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.2.1 is not rea=
dy,
> skipping
> J=C3=A4n 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.3.1 is not rea=
dy,
> skipping
>
> That is basically a 100% certain confirm that an application tries to
> use the device before before those compute queues are resumed.
>
> Can I have a full dmesg? Maybe the resume is canceled or aborted for
> some reason.
>

Yes, of course. I have made the files available here:
https://drive.google.com/drive/folders/1W3M3bFEl0ZVv2rnqvmbveDFZBhc84BNa

best regards,
 Philipp
