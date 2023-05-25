Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8F1711027
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 17:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4698510E6B8;
	Thu, 25 May 2023 15:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9770E10E6B8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 15:57:56 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-64d4e4598f0so2618893b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 08:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685030276; x=1687622276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRjbJCM4Bj74nexhlReHUV30/iPPE3wUZ1F4retby8I=;
 b=gA4nf4yE2oHcpLPG55DTtVk+Y/9CF0daz/KwHlax1WiOIRzWOkUfQe7Ma7FQsqQ7Iy
 vYsMo0UBYGTfuGq291YU/rgalQ7J8Mf2Ke45yLjRHiexvqzG5+3HoWJFAH7C0+0E8Cfl
 apoVH6RIsz2gT6XTIPaHv86tJlO62bkMIhzBI/XqK370wWDTpagGejMptXIBXv6jSuMR
 frs34sVL9FYOpfNVhomgOS05pAnmAUqyZp7bZUUQAsjCSePdw0Ur98DQJAvpTX9aZaT9
 s7lRCaYjbayOxWrgu4ULz6Ub3DFmHXmu9/BjBhwaB3Wd8NSuh4j5jnZg/KAXF3K1oPi1
 SiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685030276; x=1687622276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRjbJCM4Bj74nexhlReHUV30/iPPE3wUZ1F4retby8I=;
 b=ht6rQzjywVNDePDJhRHpxMJS2lFMDA32/kcHkHriSYQjFbbqCKPyW0npRAaHjAZu0t
 ntwLATxQVlO9GFyDzgR3uo/zY0kaFD8JaVICzgBPN/dOaT4nPtCdLjATa+G01BdYKMv9
 TRvRfgjyBMgMePelI637Q/cOqAd4d2gtokJ6DlHBs5Upciy/McOjZd5Ng68iXTFlDk38
 ANFqFwwb0pZhcwRKfHTsErPwfvKZUep0d/vQmyjiOEuB4s0NKbFZDWhvJXU7CZyDIFgO
 spmD/SbP7qNkTaao66PuU3Eb0wsxXMQ13VX2qz/OKMP6jGDY9EcnTqM2DU8ZCkbspIYf
 +3AQ==
X-Gm-Message-State: AC+VfDxVAMhpoBQlPnPTsL5Q1S3x4wVATG/eMA+jZD/yZH9fH9rLyMR+
 5PkAToi3hwWpi98dgw0UXy6Uv0M25Y9BzM5Td0w=
X-Google-Smtp-Source: ACHHUZ5w5Mg4M6wIDvC98hKt+3Drl/mfQnNGc32bmmOnnc9YXW/slwv2zt0FgYB659YyDJIKT4oy2vmbx6km3wv3Q5A=
X-Received: by 2002:a05:6a20:4289:b0:10d:d0cd:c1c7 with SMTP id
 o9-20020a056a20428900b0010dd0cdc1c7mr6832286pzj.15.1685030275580; Thu, 25 May
 2023 08:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230518230626.404068-1-aford173@gmail.com>
 <CAOMZO5DBefFuLWi39txu2RiU5vdHVx-0T48Fua6M5Y6Fr9PGNg@mail.gmail.com>
 <CAHCN7xLqmMPtnHTVbApyYxY2tx97oRjsk_51abdDcZkOJmA=Tw@mail.gmail.com>
 <CAHCN7xJTWqf_qfaZge4GpKuuzPE_OC-Kx7hBd_hFLOchH=Ef0g@mail.gmail.com>
 <CAOMZO5Csjx17kfkxN1xMLuCg+-J0v6rjiuvaK-ZktXO50ZTuSw@mail.gmail.com>
 <CAHCN7xL2GWLTwMttCha=b9_W0nE5aimCQ08YJFrCF5vNZUOL7Q@mail.gmail.com>
 <8c65c5c3-0415-78c0-4585-df94a532a04e@linaro.org>
In-Reply-To: <8c65c5c3-0415-78c0-4585-df94a532a04e@linaro.org>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 25 May 2023 10:57:44 -0500
Message-ID: <CAHCN7xJBf+8KyXbqxVSUUXbKqomX+i-13Ed23QFeF0SM8nQpzw@mail.gmail.com>
Subject: Re: [PATCH V7 0/6] drm: bridge: samsung-dsim: Support variable
 clocking
To: neil.armstrong@linaro.org
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 10:39=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 24/05/2023 14:49, Adam Ford wrote:
> > On Wed, May 24, 2023 at 7:45=E2=80=AFAM Fabio Estevam <festevam@gmail.c=
om> wrote:
> >>
> >> Hi Adam,
> >>
> >> On Tue, May 23, 2023 at 8:49=E2=80=AFPM Adam Ford <aford173@gmail.com>=
 wrote:
> >>
> >>> Inki,
> >>>
> >>> I haven't heard back from you on whether or not you want the bindings
> >>> patch to be included with me resending the series as V7 or if you're
> >>> OK with a single, stand-alone patch.
> >>> Will you let me know?  I have the patch standing by waiting for
> >>> instructions.  If you're not the right person to ask, please let me
> >>> know who the right person is.
> >>
> >> Neil has also been collecting samsung-dsim patches. Maybe he can clari=
fy.
> >
> > If it matters, my preference all along was to do the bindings as a
> > separate thing once the driver updates were merged into the tree.
> > Since the bindings can be done in different ways, I was hoping to have
> > a separate discussion on the right way to do the bindings. If they
> > need to be part of the series, I can do that.
>
> If you don't introduce compatibles, no need to send bindings, it can
> be send separately.

This series doesn't change any compatibility.

>
> Can I apply this serie and 20230503163313.2640898-2-frieder@fris.de ? see=
ms all has been reviewed.

Looking at the driver, it looks like linux-next has some newer
features added into the driver since I started, so this series might
need a re-base.  If that's the case, let me know, and I'll do the
re-base.

adam

>
> Neil
>
> >
> > adam
>
