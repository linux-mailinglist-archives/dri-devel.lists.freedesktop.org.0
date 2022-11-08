Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356646217A1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 16:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB0E10E2B5;
	Tue,  8 Nov 2022 15:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68E010E28B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 15:03:42 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id kt23so39304070ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 07:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6IlH9BC0C74rVUlY+iu0DEUzQTQWkY08zzm9NMjrL1s=;
 b=aeQmtdEAkiWv3p0gIeMmZsjTU+YG2i5PiQ/Q0DfIdfVbt5WtyD/RmfxC1CgkRWJOHI
 1MlfvduBdhxx47D1ZljapmsKZn3HVVapxNLonx6z9YeJMtS0ouTlONzIXlyLJ6FTGBY5
 DedZSYYjcJ4CQY5bn6MI7h6E/I1CAMRIXPYWs0NiA/mvVFZYJrr1QEOfacohHI7NC0dS
 jBmRhtnwSZ6ZQxKfwbOKzQYtWP+DtPfCzimrJqaRf2+1JtsdeVpLloxr0IcQ3T8EtFdT
 qYUSjetx9nBMxdz8oClpMRi0Zh5nnu4JrrT7ub4uAAqRoMnQcw8byhkTSmsQMqV4AIKK
 OAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6IlH9BC0C74rVUlY+iu0DEUzQTQWkY08zzm9NMjrL1s=;
 b=RSp+gJETU5Vh64iodc7kCJhos8JG/cYVxMBMrYHkvfl+D4TtU9NfzhtT47dHg/KVnC
 e+6HYD4p6mPegkS6HKHQ09SPjMHLJzCW3GO+kp5OHZoSXrad1hKvAigB2r4tjpr9rQkG
 43nfMWg15xMnu2Be9qIHR6w1UWs1T1wFIV1ZuOvFLekH8P2Z+qhM9KI7ygtVjocyaoIK
 hYUp/iuHVtJArAzH1Pf3S8O1Qu0ef8Kk2H4NC029FK+ESpjF0qLQrPjrXFqiPQVkQq5a
 4Qe2hN4YmjfXwoKyYbRI+8ne1bu9je/GrZab4mv/bUnXZEJZubxwVW+ufpPTyzy/7yvM
 07gw==
X-Gm-Message-State: ACrzQf3bUeUMho+QNwSpqhEqcthfqmO8QUgTHY+a7JNFM2lA6BfxwQBs
 y4nc+qUW0K88FX5hYplQdLpq+nQtoQ2MZv0/CT9GS+jFrLQ=
X-Google-Smtp-Source: AMsMyM7vHItXzV2vO+7s4+yUSScRtHL+tHTT+rgp2U37h5bB62xy9l52Q60OQWs/1fUL0AmcE9k3PZY2LDDi5Im4yZg=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr54438091ejw.203.1667919821101; Tue, 08
 Nov 2022 07:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20221103141155.1105961-1-jagan@edgeble.ai>
 <20221103141155.1105961-4-jagan@edgeble.ai>
 <CACRpkdYEW4z6EZ7UC9wT3NtRVnE=0L6AAHJDxtu5Jb-UrB+WSA@mail.gmail.com>
 <CA+VMnFxyx=NP2QUiJ6RnfapZ9c=S4-cj+0kQn8PYyaMTBP3i-g@mail.gmail.com>
 <CACRpkdaZnGgJ3egXEtoH0gTmR0m_-9Q+iGZr2eOx2JVHYgXCXA@mail.gmail.com>
 <CA+VMnFz1h0MfwxiQeFCdvMJWQ9uKWvwstJvKnpDTKjaVHN3pYw@mail.gmail.com>
In-Reply-To: <CA+VMnFz1h0MfwxiQeFCdvMJWQ9uKWvwstJvKnpDTKjaVHN3pYw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 16:03:29 +0100
Message-ID: <CACRpkdZGXeGc_vyAGw3zW4MyR+tp9jhvKJ4sf2tSS7L9B+oyOA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm: panel: Add Jadard JD9365DA-H3 DSI panel
To: Jagan Teki <jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 8, 2022 at 3:53 PM Jagan Teki <jagan@edgeble.ai> wrote:
> On Tue, 8 Nov 2022 at 20:18, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Nov 8, 2022 at 3:12 PM Jagan Teki <jagan@edgeble.ai> wrote:
> > > On Tue, 8 Nov 2022 at 19:31, Linus Walleij <linus.walleij@linaro.org> wrote:
> > > >
> > > > On Thu, Nov 3, 2022 at 3:12 PM Jagan Teki <jagan@edgeble.ai> wrote:
> > > >
> > > > > Jadard JD9365DA-H3 is WXGA MIPI DSI panel and it support TFT
> > > > > dot matrix LCD with 800RGBx1280 dots at maximum.
> > > > >
> > > > > Add support for it.
> > > > >
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> > > > > ---
> > > > > Changes for v3:
> > > > > - updatd to WXGA
> > > > > - use JD9365DA_CMD_DCS and JD9365DA_CMD_DELAY
> > > >
> > > > My comments on v2 have not been addressed, for example I asked to
> > > > remove the delay from sequences and just use an explicit delay and
> > > > to then use the existing sequence sending macro.
> > >
> > > True, I responded on the same day [1], since I didn't get the reply I
> > > have posted by assuming my comment is valid. Would you please check
> > > and respond?
> > >
> > > [1] https://lore.kernel.org/all/CA+VMnFz0w-6O=wt3iuJo1BhQgPZ2XbpX6JdDz6vg_JW9nHTR2A@mail.gmail.com/
> >
> > OK I see, sorry for not reading close.
> >
> > The driver just supports one single variant.
> >
> > What you are doing is preparing the ground for more variants
> > that may or may not exist. This creates the antipattern "big upfront design"
> > i.e. abstractions added for things that do not yet exist.
> >
> > I think it is better to strip it down to just open coding the delay after
> > the init sequence. When the next variant appears, if ever, they can
> > add abstraction. Maybe they need the same delay in the same
> > place? Who knows...
>
> I understand your point, but delays are strictly mentioned by the
> panel vendor init sequence, cz101b4001 do you think adding in the
> generic or common code is still valid since we have code added for
> cz101b4001 specifically via driver data?

I would instead of encoding a sequence into the driver data
encode a per-variant callback that sends the sequence (which
can then be just static array) and then ends with an explicit delay.

Yours,
Linus Walleij
