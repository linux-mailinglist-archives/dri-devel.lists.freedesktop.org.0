Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEB98110A6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 12:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343A510E7A9;
	Wed, 13 Dec 2023 11:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E72510E7A9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 11:59:18 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-db548da6e3bso6604089276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 03:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702468757; x=1703073557;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fyXRP+lDcGUWL91uKJAg/CGQD1HLIoJn9slNttkFTJM=;
 b=J65g9H+ZWZmQS72aEUxS4IHLdu6bbM+7Xrjl38EEsrgrugy200wU2ZcZ11wJBNZqfb
 Hq965zpcO2dc+KczQ0ZEd6ALlz5rtZTE5F30Bu7O6RjNuJw3uuvxk2g/45UL89++V6Fz
 J8Vdpxsh/Jyacc4hLOnVGsiNvqgsxCFGseDwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702468757; x=1703073557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fyXRP+lDcGUWL91uKJAg/CGQD1HLIoJn9slNttkFTJM=;
 b=DD4h39s0/j/chxdoCF/Uxc/fz78x5YMrjszfFd9amkjcBkASGazytl3bDmX9MaKVb2
 9mOLvPeAq0befLUHxDbPKbgg9lyB9FAzpqfHZMnbYyfwOkOFSbDR2PrVXUHMhyHZUcP1
 zdTdze4TsFskmHdNd0VsXtmfGBnf1bRbNa811rh/UFZiA2izHZxagpNyaqTHX6meFviE
 A7WilS42jr7R17WGdTHQippBe++wH9oSzaaNabRVupsvGha97C2EOnEhoTIiko+0zQym
 BSVkFcYiSKP7XG/1cO3BZWEFP6y17fLea2aRAlEX9ByXkjDJrj/2p/FzhFc+GBSPysZe
 nBhw==
X-Gm-Message-State: AOJu0YzVmM50kX6ocO9FdH7lqS+1wkcW4ESJ+DdhX2h0MEDzS05Rgdfa
 puNYMzQJ7VTwQDdkAUuJXdANAwCuHIdYfXQbRdC4ow==
X-Google-Smtp-Source: AGHT+IG/lGV3GLi5A77Pfj4Ksef7IAyWSzeuqOeDzG9y2WMz47wgsLwB0I4+VhFxi9w+BAa2/xBNS9Qr1EbIeeDX7eE=
X-Received: by 2002:a25:bec5:0:b0:dbc:ad3b:f751 with SMTP id
 k5-20020a25bec5000000b00dbcad3bf751mr2967257ybm.34.1702468757529; Wed, 13 Dec
 2023 03:59:17 -0800 (PST)
MIME-Version: 1.0
References: <20231205105341.4100896-1-dario.binacchi@amarulasolutions.com>
 <20231205105341.4100896-3-dario.binacchi@amarulasolutions.com>
 <CAPY8ntAALKiTEG6qyFO=qVqSLUW9x8AMfPMc_TUwC3z8tJ7Kzw@mail.gmail.com>
 <CABGWkvq-fJTDFPB=389XbHW_SLt6BQr-BhjZqZ+01i3v8EaYwA@mail.gmail.com>
 <CAMty3ZBdCW=Rak8gMin8bt9JnFChAu6nw9n6xQyCSZw=63BukA@mail.gmail.com>
 <CAOf5uwm_YmXz0A6nuCbJh+iszwqWyQkRRKATKyWZ33YUgZmEnw@mail.gmail.com>
In-Reply-To: <CAOf5uwm_YmXz0A6nuCbJh+iszwqWyQkRRKATKyWZ33YUgZmEnw@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 13 Dec 2023 12:59:05 +0100
Message-ID: <CABGWkvpryv=bKsro1=6AG9kH9mU63JdWkG4xyyKvr_Rq0iADHg@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] drm/bridge: Fix a use case in the bridge disable
 logic
To: Jagan Teki <jagan@amarulasolutions.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan and Dave,

On Wed, Dec 6, 2023 at 2:57=E2=80=AFPM Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Hi Jagan
>
> On Wed, Dec 6, 2023 at 2:31=E2=80=AFPM Jagan Teki <jagan@amarulasolutions=
.com> wrote:
> >
> > Hi Dario,
> >
> > On Wed, Dec 6, 2023 at 6:57=E2=80=AFPM Dario Binacchi
> > <dario.binacchi@amarulasolutions.com> wrote:
> > >
> > > Hi Dave and Jagan,
> > >
> > > On Tue, Dec 5, 2023 at 4:39=E2=80=AFPM Dave Stevenson
> > > <dave.stevenson@raspberrypi.com> wrote:
> > > >
> > > > Hi Dario
> > > >
> > > > On Tue, 5 Dec 2023 at 10:54, Dario Binacchi
> > > > <dario.binacchi@amarulasolutions.com> wrote:
> > > > >
> > > > > The patch fixes the code for finding the next bridge with the
> > > > > "pre_enable_prev_first" flag set to false. In case this condition=
 is
> > > > > not verified, i. e. there is no subsequent bridge with the flag s=
et to
> > > > > false, the whole bridge list is traversed, invalidating the "next=
"
> > > > > variable.
> > > > >
> > > > > The use of a new iteration variable (i. e. "iter") ensures that t=
he value
> > > > > of the "next" variable is not invalidated.
> > > >
> > > > We already have https://patchwork.freedesktop.org/patch/529288/ tha=
t
> > > > has been reviewed (but not applied) to resolve this. What does this
> > > > version do differently and why?
> > >
> > > My patches only affect drm_atomic_bridge_chain_post_disable(), wherea=
s
> > > Jagan's patch affects both
> > > drm_atomic_bridge_chain_post_disable() and drm_atomic_bridge_chain_pr=
e_enable().
> > > I tested Jagan's patch on my system with success and I reviewed with
> > > Michael Trimarchi the
> > > drm_atomic_bridge_chain_pre_enable() fixing and we think it's okay.
> > > We also believe that our changes to post_disable() are better, as we
> > > set the 'next' variable only when required,
> > > and the code is more optimized since the list_is_last() is not called
> > > within the loop.
> > > Would it be possible to use Jagan's patch for fixing
> > > drm_atomic_bridge_chain_pre_enable() and mine for
> > > fixing drm_atomic_bridge_chain_post_disable()?
> > >
> >
> > Can you please share the post-disabled bridge chain list with the
> > below example before and after your change?
>
> We have already git commit the description in how the patch affects
> the post_disable. As Dario
> reported your patch is ok even in our use case. We don't have a real
> use case as the one you describe.
>
> Can we know how you test it in this use case here? Can you test our
> patches of post_disable?
>
> Thanks
> Michael
>
> >
> > Example:
> > - Panel
> > - Bridge 1
> > - Bridge 2 pre_enable_prev_first
> > - Bridge 3
> > - Bridge 4 pre_enable_prev_first
> > - Bridge 5 pre_enable_prev_first
> > - Bridge 6
> > - Encoder
> >
> > Thanks,
> > Jagan.

Starting from my use case:

# cat /sys/kernel/debug/dri/32e00000.lcdif/bridge_chains
encoder[36]
bridge[0] type: 16, ops: 0x0, OF:
/soc@0/bus@32c00000/dsi@32e10000:fsl,imx8mn-mipi-dsim
bridge[1] type: 16, ops: 0x8, OF:
/soc@0/bus@32c00000/dsi@32e10000/panel@0:sharp,ls068b3sx0

I developed a pass through MIPI-DSI bridge driver to try to test your case:
# cat /sys/kernel/debug/dri/32e00000.lcdif/bridge_chains
encoder[36]
bridge[0] type: 16, ops: 0x0, OF:
/soc@0/bus@32c00000/dsi@32e10000:fsl,imx8mn-mipi-dsim
bridge[1] type: 16, ops: 0x0, OF: /pt_mipi_dsi1:amarula,pt-mipi-dsi
bridge[2] type: 16, ops: 0x0, OF: /pt_mipi_dsi2:amarula,pt-mipi-dsi
bridge[3] type: 16, ops: 0x0, OF: /pt_mipi_dsi3:amarula,pt-mipi-dsi
bridge[4] type: 16, ops: 0x0, OF: /pt_mipi_dsi4:amarula,pt-mipi-dsi
bridge[5] type: 16, ops: 0x0, OF: /pt_mipi_dsi5:amarula,pt-mipi-dsi
bridge[6] type: 16, ops: 0x8, OF: /pt_mipi_dsi5/panel@0:sharp,ls068b3sx02

The pre_enable_prev_first flag is set through the
"amarula,pre_enable_prev_first" dts property I put
in my dts.
Your and my patches give the same results (result: OK) in both your
use case and mine.
But If I test my new "enlarged" use case:

- Encoder
- bridge[0] (samsung-dsim)
- bridge[1] pre_enable_prev_first
- bridge[2] pre_enable_prev_first
- bridge[3] pre_enable_prev_first
- bridge[4] pre_enable_prev_first
- bridge[5] pre_enable_prev_first
- bridge[6] pre_enable_prev_first (Panel)

the result is:
my patches: KO
your patch: OK

So, I will remove my patches from the series.

Can the driver I implemented to test the use cases (pass through
MIPI-DSI) be considered useful for testing these
bridge pipelines?
Does it make sense to send its patch?

Thanks and regards
Dario

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
