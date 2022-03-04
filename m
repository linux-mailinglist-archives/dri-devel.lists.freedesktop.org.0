Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0324CD923
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 17:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2234112713;
	Fri,  4 Mar 2022 16:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FA7112713
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 16:31:13 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id y2so6809149edc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 08:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kipyyfQhII/lUc7ysFVEiW0FpeN/L7xlD0io3E8wlvc=;
 b=V9VXpoR2CA3L+SEaFUZyvVoeyi/77ttHxWBlqvxLVMmPTjoYR/nKzSOkXUSlRFawnH
 SUWqu7YOXW9wdIjUgiRAmaJXZDwLokkfZ19LAfe5+A5R7Y0l4IQWKyO/T7HW2uT5KIoS
 +IIi0cc+vsdq4W/QrEKG3xPPXJ5ATrszY1WkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kipyyfQhII/lUc7ysFVEiW0FpeN/L7xlD0io3E8wlvc=;
 b=GRJ2HwBzoLqX9mPfQUTjr22JC4E/H5zssYagE9mMpOvfnk8WAx55CGtPBYwoAWl1xp
 qiD8k6SJmBjOiecnZ8Hnsec+aZ5NEhbQpZulJZkP8/CMc0xKy3PAhS+hJU+MTOGFQ0nP
 0GV7Fk7a45wY/8Rm4hOqZDNMR21AMWsQJpUOcVo3ZuGBL5ZSeuXmk4dupijhKDnC4XPj
 ugHxEJ03ze+yBywl1W6KOTNYNtLCb8QNs99MnD/IMmN8Vx0wU+eRGYnYJnohBSx/CDLL
 kzqEBnq3+HumQFrbT6ViyHDAGDyzJ2hh9PmeQX0xJ6H9BhD+hVtkV49XjKGjYwLszU5N
 THIA==
X-Gm-Message-State: AOAM533VR20+k8htYoKRbtpeYHWbGJ9Nl+UWpzc+Q7vRv2sVmac+lVQy
 QPq0CAF6jZfBzi5IIXi/JR+wU3+SuAXuyz7s
X-Google-Smtp-Source: ABdhPJyfv2Bti/78xXd9yepPNzcZhy7BN1ayA34N63lryR7icNxElKo9bvI+2oqbb04CbFimpyzwYQ==
X-Received: by 2002:a05:6402:1941:b0:413:2555:53e3 with SMTP id
 f1-20020a056402194100b00413255553e3mr39918089edz.164.1646411471234; 
 Fri, 04 Mar 2022 08:31:11 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 hg8-20020a1709072cc800b006d6e469fbf0sm1914109ejc.134.2022.03.04.08.31.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 08:31:10 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id
 l2-20020a7bc342000000b0037fa585de26so5575008wmj.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 08:31:09 -0800 (PST)
X-Received: by 2002:a7b:c0c1:0:b0:385:be1b:e6a with SMTP id
 s1-20020a7bc0c1000000b00385be1b0e6amr8416576wmh.73.1646411469246; Fri, 04 Mar
 2022 08:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=XeUbw44OZ0H6hJhS3Pb7LgknVpKynHFxWpPx_qPQ6+QA@mail.gmail.com>
 <YNPDAyODcvlWtxpj@pendragon.ideasonboard.com>
 <CAD=FV=W6npK+NhethhY8ghtt7gwDHYfpX00w07nHE82anqx5aA@mail.gmail.com>
 <164563818901.4066078.3221991328451321918@Monstersaurus>
 <CAD=FV=VxOOhZMjVWzXHbEV_EZKRLxtuKgbko-7SUFMsj7upz0g@mail.gmail.com>
 <164640875638.4039516.894310137608889285@Monstersaurus>
In-Reply-To: <164640875638.4039516.894310137608889285@Monstersaurus>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Mar 2022 08:30:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WC09+-H+pFTgxFHa8B+fqMkJPO0Jm81FLJiu6+PeNn7w@mail.gmail.com>
Message-ID: <CAD=FV=WC09+-H+pFTgxFHa8B+fqMkJPO0Jm81FLJiu6+PeNn7w@mail.gmail.com>
Subject: Re: [RFC PATCH 11/11] drm/bridge: ti-sn65dsi86: Support hotplug
 detection
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 4, 2022 at 7:46 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> > > What about:
> > >
> > >         pdata->no_hpd = of_property_read_bool(np, "no-hpd");
> > >         if (panel && !pdata->no_hpd) {
> > >                 DRM_ERROR("Panels will not function with HPD. Enforcing no-hpd\n");
> > >                 pdata->no_hpd = true;
> > >         }
> > >
> > > That leaves it still optional to DP connectors, but enforced on eDP?
> >
> > Yeah, that's fine with me. Nits would be to use "warn" instead of
> > "error" since this isn't fatal and use the non-SHOUTING versions of
> > the prints since the SHOUTING versions are deprecated.
>
> Could you clarify this please? The whole driver uses DRM_ERROR style. Is
> there a new debug macro somewhere?

Mostly looking at commit 306589856399 ("drm/print: Add deprecation
notes to DRM_...() functions"), which I added a few months ago.
Despite the fact that I added the documentation, though, I'm not the
one driving the transition away from the SHOUTing versions. If you
look through history you can see this is driven by more senior DRM
people.

IMO it's fine to transition slowly to the new non-shouting versions
and it doesn't bother me to have some code in a file using the old
SHOUTing versions and some using the newer functions. Basically for
new code or when we're touching code anyway we do the transition then.
That being said, if you want to

-Doug
