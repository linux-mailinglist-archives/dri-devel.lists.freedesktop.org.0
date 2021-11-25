Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A47E45D3FB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 05:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018226E088;
	Thu, 25 Nov 2021 04:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B10F6E088
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 04:44:19 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id o20so19809542eds.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 20:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JTm5yftESs3lfpIAJt/PY1fspStWK+nQ5o7JPoENxFI=;
 b=XCZmHmmW+GDrIdKpT6KaqHodSGM8A0TOe5C+OJ/iQtnsfTB2GlFFgVPzu7GB4qn8lV
 3tzDEOkvdy2u9tMkcsIhn4Uqtht+G+zDnLy+MG3bHBKt98UUDojdTDKYx7aXT77Oz8xQ
 kyEBZLrGlsAfMyeQCyHTYmX0YfFuOiBFSB760=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JTm5yftESs3lfpIAJt/PY1fspStWK+nQ5o7JPoENxFI=;
 b=MaNNwsi1b04Gi99ZydjmhA+ggm3Atgbi+I9UgCWNfFOoqEuEk1EHBMpmcrzMtANvMa
 b3VEUb2wCmT+3cGtk+Lf0iIj1SdNwG8AtUoZD0XOIn7ZuuvSgSTk85XFbcFFx3XAjk9s
 7vki2Q7C6aqM0WkSCc6g6SlFEYmy+oX6PD+ZdnYYLa4M2RHhByHp+Kfa2qnYWmMhC1R2
 lu049i1MePNnsKnPhzECRGwElDpQcpvU+aUN+kmX2T1z8dTF9lkO+YJV1r3/5Zbdxqne
 1tcuMBNnF6LumHUZeMWTSEW0wlN52R6a2QWgkPocpwumdLEPHV0RRfCsnentuQRQ2Ohf
 S08w==
X-Gm-Message-State: AOAM533pwFAyzLnKhj8sjDxK4Jb+RJ9d3GAzDhN97FxgP92Lzkk3g91I
 mcGu+Sm5ALzwR9Uw5NuyzECT2kjT4KIk5D5aNhfKTw==
X-Google-Smtp-Source: ABdhPJylsL2uCDsedR2Pcz5H55x/Cxlul8iQdQOZWYIASibEl8UyleGTNZnusQKrNvtsMJ0mqVcNpd5dJI2S1lQozlQ=
X-Received: by 2002:a17:907:7664:: with SMTP id
 kk4mr27143961ejc.319.1637815457819; 
 Wed, 24 Nov 2021 20:44:17 -0800 (PST)
MIME-Version: 1.0
References: <20211124172553.519309-1-jagan@amarulasolutions.com>
 <CAOMZO5C9LhoKKW_TapKtqgAEq2h3dqe97dU9-11ezs+Cx+zr3g@mail.gmail.com>
In-Reply-To: <CAOMZO5C9LhoKKW_TapKtqgAEq2h3dqe97dU9-11ezs+Cx+zr3g@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 25 Nov 2021 10:14:07 +0530
Message-ID: <CAMty3ZCuq_eu+tCtqXLz+Km5-U4s3qk8EsbhbTfOGkJm-eU6CA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Add TI DLPC3433 bindings
To: Fabio Estevam <festevam@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Christopher Vollo <chris@renewoutreach.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabio,

On Thu, Nov 25, 2021 at 12:47 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Jagan,
>
> On Wed, Nov 24, 2021 at 2:26 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > TI DLPC3433 is a MIPI DSI based display controller bridge
> > for processing high resolution DMD based projectors.
> >
> > It has a flexible configuration of MIPI DSI signal input
> > produces RGB565, RGB666, RGB888 output format with maximum
> > of 720p resolution in 60 and 120 Hz refresh rates.
> >
> > Add dt-bingings for it.
> >
> > Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  .../bindings/display/bridge/ti,dlpc3433.yaml  | 112 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
>
> Shouldn't the MAINTAINERS change be part of patch 2/2 instead?

I usually go the initial entry as part of bindings patch since
checkpatch fires a warning if i added 2/2
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#23:
new file mode 100644

Jagan.
