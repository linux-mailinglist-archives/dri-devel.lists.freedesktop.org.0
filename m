Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF540B3AE83
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 01:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3BD10EB01;
	Thu, 28 Aug 2025 23:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YVfU0deX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E1010EB01
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:43:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 19BCD45111
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F62C4CEF9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756424589;
 bh=IKkQPTLNow+5QOzXg9+pFjpSfZ+cYSFqp7PIC7fnb5w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YVfU0deXqRDF4IOAq6X17WobB7FIGPMzhKfg7Vwm8ecdu/lLR9olzZGF2ZzDGG+3v
 JIXuKH/6G25Epw9Tr5TkWejuvganUyZHlGMiYV7vhQ2Dm4awn8wEAZivuJXJ5GHeHF
 zXhgKKo0/CM5TugZLqnYw0dxZTn8nP0P+ikXPTdKekU2gyXZUd5/ok+yRZA9pEYqin
 QZ3mVV/zpbMaktBDqUSQ4iriMIuGyomVCHs9U9x/tp47sSJS3880sTO9eq6aQhrzjY
 J9zrJU5dqOWmY+sc7ZD7cVPzsemrQ43xN+dWKb7fykNn7T19FehML+kcJi8vpBn+6R
 cWsVEeU4ktWag==
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2445805aa2eso16413935ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 16:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWPAzXxdBFx/qbMNTNc2WroITeCJr3DypX7k1X2OAikX1mov+skpjY8f5pFgNLCVIRvGzx5xtoOhCw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW3Q0mx+sNO+QLu10CyYleyzNsCwGIxxVHaD+Gc0uW/Qbg3t/V
 xO/LEe/jdHwu5GCJ+TAWlIBk69qtSHiCqnMO+X8McEq5yyeDxQJhcWcENkDn68W1HErJnPVx3Gv
 rRW0F5V8e6uPtFUJ3hUc8Y2PCBYQoFQ==
X-Google-Smtp-Source: AGHT+IFSLDRoEj3Ks5hwGi1W8AnLLwz/yGpEDFuakB+9DYUjJgQ8P7MVJ/lJfz07WcL7JOg4li7B6vPRid2aUekAwfk=
X-Received: by 2002:a17:903:1249:b0:240:7247:f738 with SMTP id
 d9443c01a7336-2462edee76fmr342377505ad.1.1756424588455; Thu, 28 Aug 2025
 16:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250825150948.2998-1-chunkuang.hu@kernel.org>
 <CAPM=9txPBARP_60P1M=9SF6HzPWkaj2gDN=J0wCAO2PvjwUWug@mail.gmail.com>
In-Reply-To: <CAPM=9txPBARP_60P1M=9SF6HzPWkaj2gDN=J0wCAO2PvjwUWug@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 29 Aug 2025 07:44:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8yV=Wj_rXWSZMiXJsqzm9swvMj8QnKJAMVn83krYatxw@mail.gmail.com>
X-Gm-Features: Ac12FXzIyWw4_oCgW2atmQfT4w63UswKbptiVkaCrxHf4Fc9WJ6K6uWBZ3v-ZOw
Message-ID: <CAAOTY_8yV=Wj_rXWSZMiXJsqzm9swvMj8QnKJAMVn83krYatxw@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm fixes - 20250825
To: Dave Airlie <airlied@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, Jason-JH Lin <jason-jh.lin@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Ma Ke <make24@iscas.ac.cn>
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

Hi, Dave:

Dave Airlie <airlied@gmail.com> =E6=96=BC 2025=E5=B9=B48=E6=9C=8828=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=882:27=E5=AF=AB=E9=81=93=EF=BC=9A
>
> > Louis-Alexis Eyraud (2):
> >       drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable order
> >       drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_up=
date_bits calls
>
> Hey,
>
> ^^^ this patch is missing a S-o-b line from the committer, please fix.

Sorry for this. I've fixes this and sent new pull request.

Regards,
Chun-Kuang.

>
> Thanks,
> Dave.
>
> >
> > Ma Ke (1):
> >       drm/mediatek: Fix device/node reference count leaks in mtk_drm_ge=
t_all_drm_priv
> >
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 ++++++++++++++-------
> >  drivers/gpu/drm/mediatek/mtk_dsi.c     |  6 ++++++
> >  drivers/gpu/drm/mediatek/mtk_hdmi.c    |  8 ++++----
> >  drivers/gpu/drm/mediatek/mtk_plane.c   |  3 ++-
> >  4 files changed, 26 insertions(+), 12 deletions(-)
