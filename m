Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4439F2B8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7956EB88;
	Tue,  8 Jun 2021 09:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1B56EB88
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:45:46 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id u7so10341728plq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 02:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fcc/Og7aFe0nmir7/nRJLiWm8tCtLZeZ+sdu9VhvIDg=;
 b=i1pwGVNwyfLGZS3IgbA+HnT579Fxq1gki3MELtU7k2o5bdZMFwVckXyIKYuP7N5+n1
 GFQczWCC+6+U12JWfXwwb7JrS6OS+WBSSMWnZgwXhedKUurATJnFtkfZKen4BOzqH+MR
 9v+n4FNRsEzNiUE4gsDBvCeEswuJsVCQTNx2DE7CozW1N0jFiQuwnb4bGR/09Pv+shsx
 01nbsyw4fPwQc9iDDVL3aZTx2wbgo53NjdFwRG1pblnsznmH41Z7WZ6rJB4aO7qTFpaE
 pri7Ifj9AR5RE6F8A+rnTjp1aj7U01k7jcIPqmrBTxXNnOqUVb95Y5fUK0ae7y4bGCor
 QO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fcc/Og7aFe0nmir7/nRJLiWm8tCtLZeZ+sdu9VhvIDg=;
 b=RpsC3qTDni1CWw9FhI3BpxzKWYtALMlWkBcsEi+NlcPqSiWuSLSuAXVHEHMfygdQw8
 t+TabNraYNEsjOevu6j2eZgFx2D68E8SWI9LNkOpzaKdRYQQ78u6FJnuXa0uPzFf12kg
 zrVg1OKLJmGx81cTFkUf+dw1v/G4u5ooc+g//6FuYZiugCwS527ghr/2/9mK6ankQQ1W
 JVgsd0nBVmJ6agQ9wflDGO4457xE4DI9lCG3H9wL4Xm2nNwKlJsSkgyXwUpk8qunJy41
 cD3pdqgeKCAMBLUtpj47Bjnutsrpcs+ZrFwvNz6wbezuEyznkCbie/yaWHOB3If6QxVs
 T0mw==
X-Gm-Message-State: AOAM531fxTztVmj8f0xvc2e1jFWPtFo0RPBTAexLA5Y3brQb9blIN4Mj
 kHhaZW/DNnyzjZU/Ldw3FG+lyTA5BgSflR+loMhiMw==
X-Google-Smtp-Source: ABdhPJyIX90PEJ0863UOIPI/9LSNvcrro00qoP3aO7THZLdlx4L2I7LoNaHv22KMJbY4RJJ3Xir1i5nAeA3QEoNChqQ=
X-Received: by 2002:a17:90a:dc04:: with SMTP id
 i4mr25429180pjv.75.1623145546191; 
 Tue, 08 Jun 2021 02:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210607174258.16300-1-marex@denx.de>
 <20210607174258.16300-2-marex@denx.de>
 <8376707f-7234-4555-a892-0581fee00908@baylibre.com>
 <CAG3jFys9F5Nt5cTEUKF7yaMAL5pyW6Kn73h4P2SDFhiBDb6pRg@mail.gmail.com>
 <c518ba40-31d4-7418-b921-577388af3acc@denx.de>
 <CAG3jFyvCxfzK1UrgapDZvota-DFmmuowaiBoLOXB_y2Gb2-1GA@mail.gmail.com>
 <CAG3jFyuQj1v9PAx9Ois3ypL+XhMRcCuuku5ssP2xD5jmWEGujw@mail.gmail.com>
 <b4328f63-fff6-0198-e369-2c87799e1e03@denx.de>
In-Reply-To: <b4328f63-fff6-0198-e369-2c87799e1e03@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 8 Jun 2021 11:45:35 +0200
Message-ID: <CAG3jFyuqZaMqmPtE5z3iDNHWeZwOn0i61FYNxMSEY=wgy4MCZg@mail.gmail.com>
Subject: Re: [PATCH V6 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Marek Vasut <marex@denx.de>
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Neil Armstrong <narmstrong@baylibre.com>, Adam Ford <aford173@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Jun 2021 at 11:45, Marek Vasut <marex@denx.de> wrote:
>
> On 6/8/21 11:44 AM, Robert Foss wrote:
> > Pushed to drm-misc-next.
> >
> > https://cgit.freedesktop.org/drm/drm-misc/commit/?id=db2aad0ffa7dfec31ddf715017a6ae57aa162045
>
> Well, then I'll just send a follow up patch.

Thank you!
