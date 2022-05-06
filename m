Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048351D800
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 14:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC75910E05A;
	Fri,  6 May 2022 12:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC8D10E094
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 12:38:26 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so6745934pjh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 05:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Iv8SoSGBxWhw5qDincZ2Joez8FK0jJmCBzROaO+wX8=;
 b=kg3X7f76VAhb5/0qlftuTSqLaYMwDIxBDAd1RWI38gWo8rY2zEW0LKoS5c5pqiDXmU
 J24k3b4+WItGItv4dq6hX/6tcVO2INMZYHVBBX3N+mLn/2Odgb4R2b4uM92As4EHs7YM
 zzGm1kNGfpBNHNp0KX50x+s9BFvgHnZ+P7rAWwR265PeyT2T63+zTztq/MPTyZeWdTwK
 Jue4OpVj5v5h1dpZPEK57GToifuoVNn/kyKgfqLyTiLFtBLUY3PK7ooYdwo15NS1HBLP
 kz5wTinfBSEHFhFy+AJPMISuMWqPdSh/Is+LYy8EcxxZd0RZzpw39zaq+dwcC1vcaeYG
 MWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Iv8SoSGBxWhw5qDincZ2Joez8FK0jJmCBzROaO+wX8=;
 b=JhVqp1tvQ6q9oyKw9zVFiX6yHqkUPUxjcxvguRP0pl1UiD5GVMRLjHSZX13kB4Kh/d
 9RryDVl2jpJkG7R21x0BeP9LqBye4r/N4G0b8taiISyvqxWVkZxaaW7B46vOW3j4qhnh
 0tLMdLwJ1QGjQWdIbGP8CempJ+eOuc/2RQrNQ91p44tNPlMx2A3K9gVqdW7+/T6SGExs
 TB/OAKgbSrUvB6LbX+JSiiCLzwDFMA3F0gipT+iaAwDpdIwNnOjxTUs1Zk6nNM1Au55W
 +62URdMw47baAGQITviCG1P2pyFYTfpEn22pByTTezHZnR2vUMcB5rhuy5e+v9hWPSYL
 kuYg==
X-Gm-Message-State: AOAM531WT/r6xDCvlID4H6YI9OAGiYKNxzFXYhbrIftmVpvLfO/mnyDi
 rjU8q2tnTWehuqFieU4ysv7slOwTGGoOFYU+xSc4XA==
X-Google-Smtp-Source: ABdhPJy9H58NHSFFT2cxJ8NNbv/IBW8+5AyJ4M/qbkpKhSG/EzIWZIerpt2VYedRbVV5I8pFe97agg11zULt3k/oh3Y=
X-Received: by 2002:a17:903:2350:b0:15e:93de:763a with SMTP id
 c16-20020a170903235000b0015e93de763amr3428485plh.117.1651840705693; Fri, 06
 May 2022 05:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220504012601.423644-1-marex@denx.de>
 <YnKWeAu2MxXA7GzV@robh.at.kernel.org>
In-Reply-To: <YnKWeAu2MxXA7GzV@robh.at.kernel.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 6 May 2022 14:38:14 +0200
Message-ID: <CAG3jFysE6yjBByBRxdjvOXmZH4Acw=M06toeG3evBZ9NeGifhw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: ldb: Fill in reg property
To: Rob Herring <robh@kernel.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robby Cai <robby.cai@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 4 May 2022 at 17:06, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 04 May 2022 03:26:01 +0200, Marek Vasut wrote:
> > Add missing reg and reg-names properties for both 'LDB_CTRL'
> > and 'LVDS_CTRL' registers.
> >
> > Fixes: 463db5c2ed4ae ("drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge")
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Cc: Peng Fan <peng.fan@nxp.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Robby Cai <robby.cai@nxp.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: devicetree@vger.kernel.org
> > To: dri-devel@lists.freedesktop.org
> > ---
> >  .../bindings/display/bridge/fsl,ldb.yaml         | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to drm-misc-next
