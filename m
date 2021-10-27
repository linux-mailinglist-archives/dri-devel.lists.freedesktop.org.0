Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBC343D68B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 00:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6985D6E111;
	Wed, 27 Oct 2021 22:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C3B6E111
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 22:25:55 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id r184so10135080ybc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 15:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=28Z1ip487G+5WNboKkQXwtJTmNJWpIkaerZw8He295s=;
 b=L2OI6mJpBFc2DBF3E3qwcgZkQJn5h+M8WbN+DgySTIa4e5rQcCUG8mQlCyIvPlTRKd
 lbLM0MLLm+OAWOpkGgHDRnqiy4JOmtwUIsknZMKznD2CO1HhiQERxOnqxrO5l26ZEwDQ
 UOEaupcd/MFtE/paXmhk+NNFFZpf7Jq6UpQ9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=28Z1ip487G+5WNboKkQXwtJTmNJWpIkaerZw8He295s=;
 b=iUXhIJFXFYoIs20fMwMsauqzKmB8xwr9ceCF4GwI+fOuDQeZjAUHM6gJJggHIPNKLN
 lchgS2SM3r2fdt75/19nBQwpUnYzmAxFxiJlbpqoUuz1DeZM/h0OKfGX6xzEGhNEONcS
 FqllyX8kYqfonsZSbY4BPlEWzRdpKLoXhLSVIlhPCWLgaNqul7qYh/n4phjJytJjur+F
 RPHBQMFbmC04dKvv0EDpTXWSl9Ix23CdIiCdlNLAc9Uu4BxSVwKnymwb3MQ5AFgpKr7K
 VcdDOfMlXnEkwPgYdTEnzZAyJk35c7zGn+ZzbKpfRMoGKXwCeb5lPuTKqSnOop+43xsF
 nL9w==
X-Gm-Message-State: AOAM533zyAO8uaONgz1hAVNwRLjHIU/sunJpu97fjBGVMtoB/Lf+f/jT
 Jkzpl5MAznXtPIBr8IsJZ7rkpWpl6ad9CMESvYq3qQ==
X-Google-Smtp-Source: ABdhPJwIOsNI24n/ZGqqvjt3SK2CMqFxEG/4NgrdffKeK88P6V4tOPE8YLaGoKaZUod5VhbYU2QWrCS8EGHExGhXd/U=
X-Received: by 2002:a25:cf07:: with SMTP id f7mr499513ybg.100.1635373554560;
 Wed, 27 Oct 2021 15:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211026145622.v4.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
 <20211026145622.v4.2.I09899dea340f11feab97d719cb4b62bef3179e4b@changeid>
 <CAD=FV=XLVf1yA_o+7wSmsybivBmcYDk96kTCOnVSx9myw4i_kQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XLVf1yA_o+7wSmsybivBmcYDk96kTCOnVSx9myw4i_kQ@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Wed, 27 Oct 2021 15:25:43 -0700
Message-ID: <CA+cxXhns12w=EiswKE-MgV2ehzPk6gBV-mL73GrvW0VirV011A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/bridge: parade-ps8640: Populate devices on
 aux-bus
To: Doug Anderson <dianders@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug

On Wed, Oct 27, 2021 at 3:13 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Oct 26, 2021 at 2:56 PM Philip Chen <philipchen@chromium.org> wrote:
> >
> > Conventionally, panel is listed under the root of the device tree.
> > When userland asks for display mode, ps8640 bridge is responsible
> > for returning EDID when ps8640_bridge_get_edid() is called.
> >
> > Now enable a new option of listing panel under "aux-bus" of ps8640
> > bridge node in the device tree. In this case, panel driver can retrieve
> > EDID by triggering AUX transactions, without ps8640_bridge_get_edid()
> > calls at all.
> >
> > To prevent the "old" and "new" options from interfering with each
> > other's logic flow, disable DRM_BRIDGE_OP_EDID when the new option
> > is taken.
> >
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >
> > (no changes since v3)
> >
> > Changes in v3:
> > - Fix when to call of_node_put() in ps8640_of_panel_on_aux_bus()
> >
> > Changes in v2:
> > - Add of_node_put() calls in ps8640_of_panel_on_aux_bus()
> > - Select DRM_DP_AUX_BUS for PS8640 driver in Kconfig
> > - Replace _put_sync() with _put_sync_suspend() in ps8640_post_disable()
>
> Not that it terribly matters, but I don't think the "put_sync" vs.
> "put_sync_suspend" was in patch #2/2. It was in #1/2.
Oops, sorry, I did a terrible job separating the changes between patch
#1/2 and #2/2.
Will retroactively fix v2 change log when I post v5.

>
>
> >  drivers/gpu/drm/bridge/Kconfig         |  1 +
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 51 ++++++++++++++++++++------
> >  2 files changed, 40 insertions(+), 12 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
