Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BC48110B2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 13:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E7B10E18F;
	Wed, 13 Dec 2023 12:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA0A10E18F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 12:02:19 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1f055438492so5178356fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702468939; x=1703073739;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6DofUqtgVQ4VhR1YJO8pN0dkbuoMC7o8wj1rNhuaJVI=;
 b=ly9nn1gwPJbssNNsnIJ3GaxYvwOhXC3AYdtlf0N8xnEhUWCpKl2fNQIH3cE4Ve5WQB
 maYD5oiUBun+DLcGuoot1YiM1fWbTAc7ihGfCCY01Q38VQh5gBF44Mcw0V0v88qpi/S1
 9osQc0yZt8qpPtgyXYJNLl403Vr7bx2A717As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702468939; x=1703073739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6DofUqtgVQ4VhR1YJO8pN0dkbuoMC7o8wj1rNhuaJVI=;
 b=pyVkSy5vllgYdCEPCmOC7zOI6KXRYQFuQ74vzmoyCfiBB+VIKxdTWeIyZtXP+Sw49e
 dO2Hjvex1p/u0lHRj4SeEJ9DXrbKbQkkkhhsL1KYrXCjhvhh3WJ8GkrufDQMA41ZRWUF
 TA4v5m5F5SSfjQHzzPBSl12TAHLQDVE385l0s6Ys9tQ/+hbfrgeekxWnNTO1QH+ESEiU
 t2MfDbQkp8P+vPyxlq884ACf4wEf8ptWHqZBVFmGSaiSRrdX1TCBdS56dnEjCUSEnYVn
 gZrtdWChFzUQLIk8bZoTsA66Ejnz2rNf9LGTYByjHg/zK9fkqUviOG6C/dkuRqnNhhzB
 ULGw==
X-Gm-Message-State: AOJu0Yyg3fi2n9spwjFNUc4L9UA1mM6c0mZ4ObW/d6/B88yM7xlUdGoa
 uuZg/AuKEEs7OsEplSwwhKdD7Lm8weuOnQ+qoNethw==
X-Google-Smtp-Source: AGHT+IF/QcxvngLggBQbHP0cFv23ouZz/H+lPJz9vfgLPXcpoz3ZMYkIrxsZ9sevMJwWT/ktB+kQhfZDNJgvjsl0xCo=
X-Received: by 2002:a05:6871:22c6:b0:1fb:75b:130e with SMTP id
 se6-20020a05687122c600b001fb075b130emr10223530oab.96.1702468939042; Wed, 13
 Dec 2023 04:02:19 -0800 (PST)
MIME-Version: 1.0
References: <20231205105341.4100896-1-dario.binacchi@amarulasolutions.com>
 <20231205105341.4100896-3-dario.binacchi@amarulasolutions.com>
 <CAPY8ntAALKiTEG6qyFO=qVqSLUW9x8AMfPMc_TUwC3z8tJ7Kzw@mail.gmail.com>
 <CABGWkvq-fJTDFPB=389XbHW_SLt6BQr-BhjZqZ+01i3v8EaYwA@mail.gmail.com>
 <CAMty3ZBdCW=Rak8gMin8bt9JnFChAu6nw9n6xQyCSZw=63BukA@mail.gmail.com>
 <CAOf5uwm_YmXz0A6nuCbJh+iszwqWyQkRRKATKyWZ33YUgZmEnw@mail.gmail.com>
 <CABGWkvpryv=bKsro1=6AG9kH9mU63JdWkG4xyyKvr_Rq0iADHg@mail.gmail.com>
In-Reply-To: <CABGWkvpryv=bKsro1=6AG9kH9mU63JdWkG4xyyKvr_Rq0iADHg@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 13 Dec 2023 17:32:07 +0530
Message-ID: <CAMty3ZAA-MXJNkYcbEwxDKhzMMdJuB51wk7UywLS5eY2me-FFA@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] drm/bridge: Fix a use case in the bridge disable
 logic
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 13, 2023 at 5:29=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> Hi Jagan and Dave,
>
> On Wed, Dec 6, 2023 at 2:57=E2=80=AFPM Michael Nazzareno Trimarchi
> <michael@amarulasolutions.com> wrote:
> >
> > Hi Jagan
> >
> > On Wed, Dec 6, 2023 at 2:31=E2=80=AFPM Jagan Teki <jagan@amarulasolutio=
ns.com> wrote:
> > >
> > > Hi Dario,
> > >
> > > On Wed, Dec 6, 2023 at 6:57=E2=80=AFPM Dario Binacchi
> > > <dario.binacchi@amarulasolutions.com> wrote:
> > > >
> > > > Hi Dave and Jagan,
> > > >
> > > > On Tue, Dec 5, 2023 at 4:39=E2=80=AFPM Dave Stevenson
> > > > <dave.stevenson@raspberrypi.com> wrote:
> > > > >
> > > > > Hi Dario
> > > > >
> > > > > On Tue, 5 Dec 2023 at 10:54, Dario Binacchi
> > > > > <dario.binacchi@amarulasolutions.com> wrote:
> > > > > >
> > > > > > The patch fixes the code for finding the next bridge with the
> > > > > > "pre_enable_prev_first" flag set to false. In case this conditi=
on is
> > > > > > not verified, i. e. there is no subsequent bridge with the flag=
 set to
> > > > > > false, the whole bridge list is traversed, invalidating the "ne=
xt"
> > > > > > variable.
> > > > > >
> > > > > > The use of a new iteration variable (i. e. "iter") ensures that=
 the value
> > > > > > of the "next" variable is not invalidated.
> > > > >
> > > > > We already have https://patchwork.freedesktop.org/patch/529288/ t=
hat
> > > > > has been reviewed (but not applied) to resolve this. What does th=
is
> > > > > version do differently and why?
> > > >
> > > > My patches only affect drm_atomic_bridge_chain_post_disable(), wher=
eas
> > > > Jagan's patch affects both
> > > > drm_atomic_bridge_chain_post_disable() and drm_atomic_bridge_chain_=
pre_enable().
> > > > I tested Jagan's patch on my system with success and I reviewed wit=
h
> > > > Michael Trimarchi the
> > > > drm_atomic_bridge_chain_pre_enable() fixing and we think it's okay.
> > > > We also believe that our changes to post_disable() are better, as w=
e
> > > > set the 'next' variable only when required,
> > > > and the code is more optimized since the list_is_last() is not call=
ed
> > > > within the loop.
> > > > Would it be possible to use Jagan's patch for fixing
> > > > drm_atomic_bridge_chain_pre_enable() and mine for
> > > > fixing drm_atomic_bridge_chain_post_disable()?
> > > >
> > >
> > > Can you please share the post-disabled bridge chain list with the
> > > below example before and after your change?
> >
> > We have already git commit the description in how the patch affects
> > the post_disable. As Dario
> > reported your patch is ok even in our use case. We don't have a real
> > use case as the one you describe.
> >
> > Can we know how you test it in this use case here? Can you test our
> > patches of post_disable?
> >
> > Thanks
> > Michael
> >
> > >
> > > Example:
> > > - Panel
> > > - Bridge 1
> > > - Bridge 2 pre_enable_prev_first
> > > - Bridge 3
> > > - Bridge 4 pre_enable_prev_first
> > > - Bridge 5 pre_enable_prev_first
> > > - Bridge 6
> > > - Encoder
> > >
> > > Thanks,
> > > Jagan.
>
> Starting from my use case:
>
> # cat /sys/kernel/debug/dri/32e00000.lcdif/bridge_chains
> encoder[36]
> bridge[0] type: 16, ops: 0x0, OF:
> /soc@0/bus@32c00000/dsi@32e10000:fsl,imx8mn-mipi-dsim
> bridge[1] type: 16, ops: 0x8, OF:
> /soc@0/bus@32c00000/dsi@32e10000/panel@0:sharp,ls068b3sx0
>
> I developed a pass through MIPI-DSI bridge driver to try to test your cas=
e:
> # cat /sys/kernel/debug/dri/32e00000.lcdif/bridge_chains
> encoder[36]
> bridge[0] type: 16, ops: 0x0, OF:
> /soc@0/bus@32c00000/dsi@32e10000:fsl,imx8mn-mipi-dsim
> bridge[1] type: 16, ops: 0x0, OF: /pt_mipi_dsi1:amarula,pt-mipi-dsi
> bridge[2] type: 16, ops: 0x0, OF: /pt_mipi_dsi2:amarula,pt-mipi-dsi
> bridge[3] type: 16, ops: 0x0, OF: /pt_mipi_dsi3:amarula,pt-mipi-dsi
> bridge[4] type: 16, ops: 0x0, OF: /pt_mipi_dsi4:amarula,pt-mipi-dsi
> bridge[5] type: 16, ops: 0x0, OF: /pt_mipi_dsi5:amarula,pt-mipi-dsi
> bridge[6] type: 16, ops: 0x8, OF: /pt_mipi_dsi5/panel@0:sharp,ls068b3sx02
>
> The pre_enable_prev_first flag is set through the
> "amarula,pre_enable_prev_first" dts property I put
> in my dts.
> Your and my patches give the same results (result: OK) in both your
> use case and mine.
> But If I test my new "enlarged" use case:
>
> - Encoder
> - bridge[0] (samsung-dsim)
> - bridge[1] pre_enable_prev_first
> - bridge[2] pre_enable_prev_first
> - bridge[3] pre_enable_prev_first
> - bridge[4] pre_enable_prev_first
> - bridge[5] pre_enable_prev_first
> - bridge[6] pre_enable_prev_first (Panel)
>
> the result is:
> my patches: KO
> your patch: OK
>
> So, I will remove my patches from the series.
>
> Can the driver I implemented to test the use cases (pass through
> MIPI-DSI) be considered useful for testing these
> bridge pipelines?
> Does it make sense to send its patch?

I don't think so, I have a similar test bench for chain of bridges. I
will try to re-create the chain and update the result.

Jagan.
