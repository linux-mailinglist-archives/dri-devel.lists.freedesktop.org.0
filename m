Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8B75111D2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 08:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2FE10E05F;
	Wed, 27 Apr 2022 06:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0618310E05F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 06:59:17 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id p4so870592edx.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 23:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bK82D9oiFTeFkJ58x1A+6byrQ5w9F1pcq60Qto3VPFY=;
 b=IOslx8w+I67QW4Gw7u7XjV1f/VZn5ZL68eRvJSzAEdXGT8F1XSKAvRanc/fz1Kflx1
 cq5yW/+4F8v0d1vxx40u5cIg0EFPoTG2XMQfCIjHI2w/9LUch1+2A8IeGwPF0YAEmycy
 GY3/SNPPnb8v+oa87JIJg/gldtpauXUylQzGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bK82D9oiFTeFkJ58x1A+6byrQ5w9F1pcq60Qto3VPFY=;
 b=r+9YTGky46BHv3YxiqhxeZFbHsmIl7CEfz2xP7HPl0n/cIQsbejhitZ8sG/5wuZ+Yl
 Tudy661EUxj5H/OKX9aLMc6XpNtBrn4NOn02HHnDOmw6fKEvWA0PqGmlX6zj4Ltyv9Sf
 QRHtQXojv9prUr37xHZ8n0TL1uTBweBPYQjsW1PNgSih08yT16OLC3jt2brem8T4PuI0
 dnu+6aSJnrU6Zk5zjgy7RAHHWVutli6pjIV2CuTe+tYaYNR96U6KR1i42Wg7VKRDPNxp
 v8orf0CICto99/ObL2dOHjfMSiFx/6/B14c1LUyPZ3J/f+qxFHB8rsEtga7wfujH/dRC
 iavA==
X-Gm-Message-State: AOAM531R39FRgUfNn60VQCgrCl+HGhjx4ujHz66caoSJbmf4+4w+u8D1
 KfdJkB3okaF949ZIbx4ZSt9MZ4GUCBrkKdodkOTaiNJwGNn6uw==
X-Google-Smtp-Source: ABdhPJwChhqWc3Zlm/e181I9ur5sdpaiHGYSj0JhOgOl+NxLqV5Z3fdK4kERVFHsCEXtsJAipshrpvbeGa8UzKrfOh8=
X-Received: by 2002:a05:6402:11cd:b0:425:ee49:58cb with SMTP id
 j13-20020a05640211cd00b00425ee4958cbmr13163292edw.157.1651042755556; Tue, 26
 Apr 2022 23:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
In-Reply-To: <20220421082358.ivpmtak3ednvddrc@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 27 Apr 2022 12:29:04 +0530
Message-ID: <CAMty3ZCLEMv4cqUcUGUAkLtH8tmh1WO582cDjZWynAifZJy=_w@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
To: Maxime Ripard <maxime@cerno.tech>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Robert Foss <robert.foss@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 1:54 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > + Linus
> > + Marek
> > + Laurent
> > + Robert
> >
> > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > > bridge")' attempted to simplify the case of expressing a simple panel
> > > under a DSI controller, by assuming that the first non-graph child node
> > > was a panel or bridge.
> > >
> > > Unfortunately for non-trivial cases the first child node might not be a
> > > panel or bridge.  Examples of this can be a aux-bus in the case of
> > > DisplayPort, or an opp-table represented before the panel node.
> > >
> > > In these cases the reverted commit prevents the caller from ever finding
> > > a reference to the panel.
> > >
> > > This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> > > panel or bridge")', in favor of using an explicit graph reference to the
> > > panel in the trivial case as well.
> >
> > This eventually breaks many child-based devm_drm_of_get_bridge
> > switched drivers.  Do you have any suggestions on how to proceed to
> > succeed in those use cases as well?
>
> I guess we could create a new helper for those, like
> devm_drm_of_get_bridge_with_panel, or something.

I think using the same existing helper and updating child support is
make sense, as there is a possibility to use the same host for child
and OF-graph bindings.

I can see two possible solutions (as of now)

1. adding "dcs-child-type" bindings for child-based panel or bridge
2. iterate child and skip those nodes other than panel or bridge. or
iterate sub-child to find it has a panel or bridge-like aux-bus (which
is indeed hard as this configuration seems not 'standard' i think )

Any inputs?

Thanks,
Jagan.
