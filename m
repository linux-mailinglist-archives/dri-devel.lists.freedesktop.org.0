Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333A5B2697A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 16:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968A110E329;
	Thu, 14 Aug 2025 14:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qxUP2eCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9101010E329
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:34:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2D65945D11
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAB7C4CEF9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755182073;
 bh=v5M0Qos1gNG9BhySlvlZJoHLGeHj6L3mYrNuRgeHmNM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qxUP2eCn3qKY6NOyD8svceAte2FegBshWIsRko3Ux1blTnu4NN9ug4GSR+RaS9Z2z
 68rvKMf8bwLL7TCRgbQHI+/XbZ7cmy/sjLO77MpmjxDJyt5V7RFtQJ/AR8mHfdKgUK
 kk5jHQM5FNeayZmns4y02Ds3yf5JUgSDgO9xY9bZHx5DUfCjCms+dSjlipCHPAweKV
 Kt+juAErKW9xRxnNFLb10vFZBMb03KelsfvdXZv8sh1y0Ysx+8UvGnxG0CejFqAjAn
 m9dFxfmUpjZ/MajlVIENiSbtOHwWe6/osutZxx3jJ6FZ2ZMxdJUiFHPTL6DZ0V+kfc
 ZF7c43t1zgqMg==
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b47173a03ffso600109a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:34:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtE82Ga9lSjLcqnPQOl91mr4dWguh9o0wtcBA8f7eM/Tw2r/p+c6wcuC4hSAE79pMFYvllLKC5alo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4Jl4bM/NZowSSHHGEoCdlZp3pVeRrT8D0n6BR73eN7aDQ0yGT
 eH9/R3hPTwHxzyxb/pjr+t4jPRStieqirVehU9xLcLsE7pckhS2m4DR63hwUxS0hSBfp95TY/a3
 tuthYjNsdPIu6dgL+8HvsXnG2yKk0jQ==
X-Google-Smtp-Source: AGHT+IFZBGHiyx4R8I0ZtPt03HyzJ/h+SHoNTrWb26RWZtlcu/LuBo3basMRoZchAXRPaCN5XUhmJgnvc08y4GlhQHw=
X-Received: by 2002:a17:903:1ae4:b0:23d:f986:6472 with SMTP id
 d9443c01a7336-24458a65075mr40000145ad.25.1755182072478; Thu, 14 Aug 2025
 07:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <c8a64686-f1a2-44f1-9d13-fd5b4f923e0f@molgen.mpg.de>
In-Reply-To: <c8a64686-f1a2-44f1-9d13-fd5b4f923e0f@molgen.mpg.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 14 Aug 2025 22:35:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8vLqU30L3+ijYJPLrioRsUwVwJAeumtVYfRJ9e5tjp4A@mail.gmail.com>
X-Gm-Features: Ac12FXy0NDb8BGMAM7k-PNcb_9DgKIcM0T0DGazslGHWEE6YexmPG9CoPZcHXNE
Message-ID: <CAAOTY_8vLqU30L3+ijYJPLrioRsUwVwJAeumtVYfRJ9e5tjp4A@mail.gmail.com>
Subject: Re: MT8183: Only maximum resolution 1280x720?
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
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

Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2025=E5=B9=B45=E6=9C=8825=E6=
=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=882:01=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Dear Linux folks,
>
>
> On the older MT8183 device Lenovo IdeaPad Duet Chromebook, running
> ChromeOS with their Linux 5.10.x, connecting a 1920x1080 Dell monitor to
> a USB-C adapter using HDMI, only the resolution of 1280x720 is
> configured, although the adapter also support 1920x1080. It happens with
> all adapters, for example, LMP USB-C mini Dock [1].
>
> I reported it to the Chromium OS issue tracker [1], and the last comment =
is:
>
> > It seems the display pipeline for the internal display (DSI) has
> > higher clock rate. Also, the resolution support depends on the
> > refresh rate as well, so the claimed 2400x1080 might only work on
> > lower refresh rate.
> >
> > For the external display, the display modes are mostly rejected by
> > the pre-defined max_clock_khz in mtk_dpi.c:
> > https://elixir.bootlin.com/linux/v6.11.4/source/drivers/gpu/drm/mediate=
k/mtk_dpi.c#L940
>
> Can you confirm this? The font rendering seems not so good in the lower
> resolution, and strangely, playing movies these seem to be rendered in
> higher resolution (or the monitor or hardware does a good job in
> up-scaling).

8183 max_clock_khz is defined in patch [3] by Rex, but this is a
prepare patch for mt8192 [4].
I'm not sure that Rex has test it for mt8183.
Maybe you could try to enlarge 8183 max_clock_khz and see.

[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/gpu/drm/mediatek/mtk_dpi.c?h=3Dv6.17-rc1&id=3D44b07120291c4b7a67=
22ccb7149f6b9d938cf5a2
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/gpu/drm/mediatek/mtk_dpi.c?h=3Dv6.17-rc1&id=3D38eaef2dca4ec8dfb9=
ea84d9dde0f76da5c8caaa

Regards,
CK

>
>
> Kind regards,
>
> Paul
>
>
> [1]: https://lmp-adapter.com/product/lmp-usb-c-mini-dock/
> [2]: https://issuetracker.google.com/issues/295666708
