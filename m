Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6979190B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 15:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC9710E148;
	Mon,  4 Sep 2023 13:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D36310E148
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 13:46:05 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4cbso1955084a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 06:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693835163; x=1694439963; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sb7j2gc6GC9TfoLoaWsfavyxIFET0F0+VOF1EvaRXhw=;
 b=jZvrpzuLqgvj7ImrPxju1/zCcX6ypTnZ2dNQwX/DDyw+jCHFklM2g0pvCHbJOf100X
 kNJrD1CYmU0QmFwN3nfZqbyqAKwNnIH5flLfmHEFNALzxMGToenwtqEBt9EUsy3CWy/N
 SjhyUfUaXQLXoOWQuNLshonTq5jLgetAtPtN7zG/mYn/rFrzHxbY2XT1bMTnSLUfAmdN
 DHd6lH0TPlsNWFVVyEXDZ0Rto7oa00TK923emhbXxUhDPacJ+RBrzVw3A1DHmslW+jjM
 paafaocFilIaURGTB+PN024FiKoDQ1w0fQe9wwne/QgKyTFOgLjfixedfmPml9g91h2u
 JP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693835163; x=1694439963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sb7j2gc6GC9TfoLoaWsfavyxIFET0F0+VOF1EvaRXhw=;
 b=hyuNd363I7dqjbF3fvFnRdUoPQkoSEqsdDUc6oQVYktvj8D8+4rMKCLF4hwFAin/G+
 FZboTFEyId196RjU/ZKU1pk3AwPHU0HSzb89DyrF4QzOtZerVjLVQ+F2a3cPIb5FvXF8
 8huAtko8VMCEu62wDqEgDDIHu/7eEzmQWCtCYqC+QZGfqjBFy/NEBFI47QMry7WYpgQ1
 z+kVplXJVjk3fYw2HkYIbumbkX4PdVIlatSzxWex0r2y+S/D+VdZ21wMyj3oXIdgV1kV
 cfcvajT0MYLp4daKiEF5FxG8ixZq304hHBSg1ZpprbtCFYiSE4il+PZQ7LN/yBgOqPrZ
 kybw==
X-Gm-Message-State: AOJu0YztgiqT2x5ORi1s8RDQmVDmLNfthU8TObb58DwHVCShKesS2m44
 +4Pfxd3qlCVDrBNpEjWmbdbga8iVZQr7QW9tjATNijsv
X-Google-Smtp-Source: AGHT+IEkejCkF3Bonm6ExNf3PEy8jlNrTaMvA0HXxyghBhhOSaLIvxZ+gZqHSC5rZGIEcrct6coE48gxajc0Sp0KeLY=
X-Received: by 2002:a50:ee17:0:b0:525:4471:6b59 with SMTP id
 g23-20020a50ee17000000b0052544716b59mr8573681eds.7.1693835163507; Mon, 04 Sep
 2023 06:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230901102400.552254-1-jani.nikula@intel.com>
 <CA+MoWDrtgtT26F-rZ-7s0PtQcTLqB6g1BARkegfZ3qQnhw=3ZQ@mail.gmail.com>
 <87fs3ui79j.fsf@intel.com>
In-Reply-To: <87fs3ui79j.fsf@intel.com>
From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Mon, 4 Sep 2023 15:45:51 +0200
Message-ID: <CA+MoWDrFJ04auQgQ=EJo0PSKRXd67=J+rMwO8uOzGoQFs8SNTA@mail.gmail.com>
Subject: Re: [RFC] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: switch to
 drm_do_get_edid()
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Zheyu Ma <zheyuma97@gmail.com>,
 Yuan Can <yuancan@huawei.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ian Ray <ian.ray@ge.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 4, 2023 at 12:16=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Sat, 02 Sep 2023, Peter Senna Tschudin <peter.senna@gmail.com> wrote:
> > Good morning Jani,
> >
> > It has been a long time since I wrote the driver, and many many years
> > since I sent my last kernel patch, so my memory does not serve me very
> > well, but I will try to shed some light.
> >
> > On Fri, Sep 1, 2023 at 12:24=E2=80=AFPM Jani Nikula <jani.nikula@intel.=
com> wrote:
> >>
> >> The driver was originally added in commit fcfa0ddc18ed ("drm/bridge:
> >> Drivers for megachips-stdpxxxx-ge-b850v3-fw (LVDS-DP++)"). I tried to
> >> look up the discussion, but didn't find anyone questioning the EDID
> >> reading part.
> >>
> >> Why does it not use drm_get_edid() or drm_do_get_edid()?
> >>
> >> I don't know where client->addr comes from, so I guess it could be
> >> different from DDC_ADDR, rendering drm_get_edid() unusable.
> >>
> >> There's also the comment:
> >>
> >>         /* Yes, read the entire buffer, and do not skip the first
> >>          * EDID_LENGTH bytes.
> >>          */
> >>
> >> But again, there's not a word on *why*.
> >
> > The video pipeline has two hardware bridges between the LVDS from the
> > SoC and DP+ output. For reasons, we would get hot plug events from one
> > of these bridges, and EDID from the other. If I am not mistaken, I
> > documented this strangeness in the DTS readme file.
> >
> > Did this shed any light on the *why* or did I tell you something you
> > already knew?
>
> I guess that answers the question why it's necessary to specify the ddc
> to use, but not why drm_do_get_edid() could not be used. Is it really
> necessary to read the EDID in one go?

I have a very weak recollection about hotplug and EDID issues with the
LVDS driver. I am not very confident about this, but maybe I needed to
find ways to read EDID early enough to please the LVDS display driver
during the LVDS driver startup.
