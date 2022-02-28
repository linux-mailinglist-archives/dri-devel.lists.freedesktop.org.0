Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B874C70B3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 16:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E32410E66F;
	Mon, 28 Feb 2022 15:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084DB10E66F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 15:33:33 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 139so11846234pge.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 07:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eQf8qrMwWa65Olbs/tkcGZr4CIuhr9pKKWXXLBTFbrU=;
 b=uB5qSRcnsaSDFmzTBjycEr8yk2SvyekKPBvdW1Av+6yDM+IWyFwc+XyVWwHHVmBbkY
 NRt+znfl1gYVZI355a4OsD5uRvnpSVfVIn5fHdvqCCmeSFftwowKXtI/QJTQrwmj6bjp
 ahZLYAAOn6G6vDcpLs6mKd9Kx+1sEd3QX7VJahdTkbA0rVsZfAjl5SRGIwbxLCsTom1T
 P+SG6u/CIO9tEcjvqeB0zDFeZIk/8+8saEXPsmd9BGKyVoTQrwd0icHmUXHwzbRrMC5Z
 StiFF+KZUeB534oMEoUzJoSCe5oSCGoqmJpOuNvzJ9ZGO7o0+z5NqoF39BaLXpy7EXSc
 5tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eQf8qrMwWa65Olbs/tkcGZr4CIuhr9pKKWXXLBTFbrU=;
 b=iIn1ghspinQospmYP+OPP5Wp993YKtM2UwS64EHeAaLXRUOeBbtGocvntHDytyfRi5
 FygG+GB35Z5c+5sq6szplPup7pKLAV4jUF+FBkOpJ7GkKlQtSK1da3il4n/MLGRWVo5p
 qdDqa31z8UeeaqONSdxGk+jIaDRzHfHzVu5XbRCD+JM2At6larOwmDRz0QmrLrrfTwSl
 4237xYfZZDc9YcxzK15xSMvcr90Gt+B1FcSvVCkUbDvQrWePamxWzzcByStDnDTNzTo7
 FupoJW2iKqJdP/w0SHmaBnA0njynvpoQZnX5izEoTmGgEEXyZqzr0jbSejP+GjWP2leq
 iBOg==
X-Gm-Message-State: AOAM533LES38dj1fAHdMcb5u3imCcn1o8hX9e4B33j33NswbcjoliYKk
 jldJeHQU6O002W8IzNZyWMOE/5+ViBDQJjDsoE4GfQ==
X-Google-Smtp-Source: ABdhPJxLdrmV5TzGPVnOcBzm0n3mNZcbT1uPCuab0u6Nz5lXiLjwAfBzwGbZxjMBWCPELThDLGRKITBi6q+J/6oZC1E=
X-Received: by 2002:a05:6a00:889:b0:4e0:dcc3:5e06 with SMTP id
 q9-20020a056a00088900b004e0dcc35e06mr22150499pfj.29.1646062413537; Mon, 28
 Feb 2022 07:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20220225164231.904173-1-broonie@kernel.org>
 <CAJMQK-jGCX6Zp0gkfgqeA6=0zuWiSbWbytUixH3VFiwX9wtLNQ@mail.gmail.com>
 <CAPM=9tz0igKq1W3N_QseF97jqCY2Q9iSYwoFBVx2qJ8rWeVx-w@mail.gmail.com>
In-Reply-To: <CAPM=9tz0igKq1W3N_QseF97jqCY2Q9iSYwoFBVx2qJ8rWeVx-w@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 28 Feb 2022 16:33:22 +0100
Message-ID: <CAG3jFys+J1389TSADvR1jYOOQXig2thftfXKtgsGZLWkwA34bg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Allen Chen <allen.chen@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > >
> > > Caused by commit
> > >
> > >   b5c84a9edcd418 ("drm/bridge: add it6505 driver")
> > >
> > > I have used the drm tree from yesterday instead.
> >
> > hi all,
> >
> > The following fix should be able to address the errors. Should it be
> > squashed into b5c84a9edcd418 ("drm/bridge: add it6505 driver")?
>
> Can you send a patch with this to dri-devel? It's far too far down the
> tree to sqaush anything at this point.
>

Patch submitted & reviewed.

https://lore.kernel.org/all/20220228081421.1504213-1-hsinyi@chromium.org/

Should I apply it drm-misc-next?
