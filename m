Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA83D830DC6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 21:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F5A10E81E;
	Wed, 17 Jan 2024 20:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FF110E81E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 20:10:56 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5571e662b93so9558228a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 12:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705522193; x=1706126993;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9EN9U2M6WcTO4kvqAssI2USJeGX9gxivbYmkNOhif20=;
 b=JVrJhrQt21XXX8GnCylNRwZt1FxqgP/w4naL9H77eyiEz/Dq82c4vUUhoSpQXSpsEq
 3L8VmFOHlzz2N9HVgJK+LIj3lVGfyZreb0Ip7IMASodsenUQOMsWKy/l58LR3GA/3axg
 nrEBxb4KtfWyQcIUQokjutfKHDWheJYTzeCoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705522193; x=1706126993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9EN9U2M6WcTO4kvqAssI2USJeGX9gxivbYmkNOhif20=;
 b=skMg9ncknpfO13UiG0xUgjH8Y1BCQdJNsuI8zfLctu+53sbqjPGEcNgoAG1aL+f6mm
 SAWiWB2w6AUafddGNeFq35ce799zTWp0LHEJmoWf5ni78XHjSAgow/4Pc1oujaT9M2Ip
 2//jXYb35hQd67bDNAdkTiYD6sdgjVSXA8KV1hjyvfG03sIgpMuxvp6eIdQbg3NMvcUg
 6SwI8eB3AWqe23waMlOYRFRap1zRjTMNbEoxlxrXwI9LpPGAVTj5N69rcXgO/8wO35iy
 u3g7DtMqn1r9DGbFDxngCCbqw2CMXOMLG/yaVks5/0oE/B2zwk7DzjUSPJBHIBn4Ip3M
 2wYw==
X-Gm-Message-State: AOJu0YyXvHWYyfMv/nckldnb5WWwFL5HddiMUjBJBE4990l60h6SIMh7
 UeQlVgTOzH83J/cL4e0hhEbu5J4BDiwEmuYTUX2f6QrMrk9zCig=
X-Google-Smtp-Source: AGHT+IFZ24Dgc4IIGY3k8otKVhxbqkmIy5amIJypGy5us33a8FgA5RPzKIt+cxtKmbt/8yOsbLwl/g==
X-Received: by 2002:a05:6402:34c7:b0:559:6e73:798a with SMTP id
 w7-20020a05640234c700b005596e73798amr2889382edc.24.1705522193159; 
 Wed, 17 Jan 2024 12:09:53 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 h14-20020a056402094e00b00559cc2082dcsm1558075edz.19.2024.01.17.12.09.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 12:09:52 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-40d5097150fso59355e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 12:09:52 -0800 (PST)
X-Received: by 2002:a05:600c:1c8d:b0:40e:5274:e2ba with SMTP id
 k13-20020a05600c1c8d00b0040e5274e2bamr205912wms.4.1705522191757; Wed, 17 Jan
 2024 12:09:51 -0800 (PST)
MIME-Version: 1.0
References: <20240117103502.1.Ib726a0184913925efc7e99c4d4fc801982e1bc24@changeid>
 <CAJMQK-j_gEfZqWppG3oVNWBopH9uVK-NrzXvoSr=ijF2pMycDA@mail.gmail.com>
In-Reply-To: <CAJMQK-j_gEfZqWppG3oVNWBopH9uVK-NrzXvoSr=ijF2pMycDA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Jan 2024 12:09:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UsnDMx+TV3JCAmboTdFRtpOQzQ1V0cw70PadCoXVNJ_w@mail.gmail.com>
Message-ID: <CAD=FV=UsnDMx+TV3JCAmboTdFRtpOQzQ1V0cw70PadCoXVNJ_w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Make sure we drop the AUX
 mutex in the error case
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 17, 2024 at 11:39=E2=80=AFAM Hsin-Yi Wang <hsinyi@chromium.org>=
 wrote:
>
> On Wed, Jan 17, 2024 at 10:35=E2=80=AFAM Douglas Anderson <dianders@chrom=
ium.org> wrote:
> >
> > After commit 26db46bc9c67 ("drm/bridge: parade-ps8640: Ensure bridge
> > is suspended in .post_disable()"), if we hit the error case in
> > ps8640_aux_transfer() then we return without dropping the mutex. Fix
> > this oversight.
> >
> > Fixes: 26db46bc9c67 ("drm/bridge: parade-ps8640: Ensure bridge is suspe=
nded in .post_disable()")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Sorry for missing this in my review! :( Given that this is really
> > simple and I'd rather the buggy commit not be there for long, if I can
> > get a quick Reviewed-by tag on this patch I'll land it without the
> > typical stewing period.
> >
>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

Thanks! I've pushed this to avoid the breakage. If any additional
follow up comes up I'm happy to post additional patches.

a20f1b02bafc drm/bridge: parade-ps8640: Make sure we drop the AUX
mutex in the error case


-Doug
