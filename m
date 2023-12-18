Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B48817B1E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B29E10E1D9;
	Mon, 18 Dec 2023 19:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29BD10E1D9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:39:41 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2cc794df8aaso10578261fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 11:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928379; x=1703533179;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tHHVaX2oRREQWtqZ9yaaZrloTQbPELpQ4FvSnAzu2pY=;
 b=ma+vLiTvUnYiyMm7+i50azCq710tTykDrzGTujHGiXPy2R9ORG4J9EuQuBIv5oCARu
 oXDo8V3Zd1NT6MCZEsmHGLGFqsh2mOP+g3nWeSbTtli0QQjOjcaoGrd1E8wsYfa6bDED
 GbbpSXJ5YQUfVJpzElh2qbPXQ8HJxLFk1QKrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928379; x=1703533179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tHHVaX2oRREQWtqZ9yaaZrloTQbPELpQ4FvSnAzu2pY=;
 b=MNtT1PntqA6LZ5Amh2tDtuExnjnfmAZMg0VTGoM3gQdJpmnR6+jGUHpDD4kiJ4nTE/
 nN6qiLZp9mf5mat0UVRnamr5zP9YBLpwMai5Id08yCIBrEtA5CkYlPlnp+zmXiG0Lx0J
 UDKjqIieBhKtG0yS3tQTQbAsFT7ya2IEnrCqBrNU/GVkxO66D3wdYwqcgWf6T2ynJegP
 Iia/+MrGW7TQZaWYYqFG0R/Qlu/PsB03+Qqj1VDv+cZ9J5eSgLpCRcxM3b8/Z/sOQ/xy
 mHE0SoLWq3L/BjtFop9n2uVXT+giqS6y/Tt6tAg9zy3yTBThXqRqAvKV+qfPNwHnIOK9
 EZrw==
X-Gm-Message-State: AOJu0YzvYc9duY4sOGQdXVGteOhjvNvKxJCcNjDcx+R9eIgv9j9h6Tis
 kjS2XEEBr1A4/20XNCnZpne50hL9AQNBjwqG5zd7G/VV/3et8BTjm58=
X-Google-Smtp-Source: AGHT+IHEt9r1a6LcFukI+7IG7QJ/0odP2MsKRamSjACkO6/kcnCuMkX6qXep796jpPPgqSwRQuQr1mOgVCDAJAXi6nk=
X-Received: by 2002:a17:907:392:b0:a23:5730:836a with SMTP id
 ss18-20020a170907039200b00a235730836amr591618ejb.43.1702895685508; Mon, 18
 Dec 2023 02:34:45 -0800 (PST)
MIME-Version: 1.0
References: <20230328170752.1102347-1-jagan@amarulasolutions.com>
 <CAMty3ZBnAw+VHXoZuSgZPmSTMYd-nxBw5cZ+OxLYxqrXRX=MNg@mail.gmail.com>
 <CAPY8ntDTv-dMxRgFOfcbBvH+qjoEOPdK_02OmUtRxtyumx6Q0w@mail.gmail.com>
 <CAMty3ZDpty-pgzm-UHg_jpDQs5RjPh+j+RN02Lqh39-wrj8ZtQ@mail.gmail.com>
 <CAMty3ZA0rjAufoSG62SChNoLyEoL=iT6f0rtSZJ=J+SiidytyA@mail.gmail.com>
 <CAMty3ZD5g7dKVyHirdos8o8PLYF2LAZCWKQtFtqUR8PruPOL0A@mail.gmail.com>
In-Reply-To: <CAMty3ZD5g7dKVyHirdos8o8PLYF2LAZCWKQtFtqUR8PruPOL0A@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 18 Dec 2023 11:34:34 +0100
Message-ID: <CAOf5uwkoRd8Pt2GYJ6VyHtfd+F7gKyxYsVVQaAn8k8DdyTSeUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: Fix improper bridge init order with
 pre_enable_prev_first
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 18, 2023 at 11:28=E2=80=AFAM Jagan Teki <jagan@amarulasolutions=
.com> wrote:
>
> On Sun, Nov 26, 2023 at 9:41=E2=80=AFPM Jagan Teki <jagan@amarulasolution=
s.com> wrote:
> >
> > On Mon, Nov 13, 2023 at 6:45=E2=80=AFPM Jagan Teki <jagan@amarulasoluti=
ons.com> wrote:
> > >
> > > On Tue, Aug 1, 2023 at 11:50=E2=80=AFAM Dave Stevenson
> > > <dave.stevenson@raspberrypi.com> wrote:
> > > >
> > > > Hi Jagan
> > > >
> > > > My apologies for dropping the ball on this one, and thanks to Fried=
er
> > > > for the nudge.
> > > >
> > > > On Wed, 12 Apr 2023 at 07:25, Jagan Teki <jagan@amarulasolutions.co=
m> wrote:
> > > > >
> > > > > Hi Dave,
> > > > >
> > > > > Added Maxime, Laurent [which I thought I added before]
> > > > >
> > > > > On Tue, Mar 28, 2023 at 10:38=E2=80=AFPM Jagan Teki <jagan@amarul=
asolutions.com> wrote:
> > > > > >
> > > > > > For a given bridge pipeline if any bridge sets pre_enable_prev_=
first
> > > > > > flag then the pre_enable for the previous bridge will be called=
 before
> > > > > > pre_enable of this bridge and opposite is done for post_disable=
.
> > > > > >
> > > > > > These are the potential bridge flags to alter bridge init order=
 in order
> > > > > > to satisfy the MIPI DSI host and downstream panel or bridge to =
function.
> > > > > > However the existing pre_enable_prev_first logic with associate=
d bridge
> > > > > > ordering has broken for both pre_enable and post_disable calls.
> > > > > >
> > > > > > [pre_enable]
> > > > > >
> > > > > > The altered bridge ordering has failed if two consecutive bridg=
es on a
> > > > > > given pipeline enables the pre_enable_prev_first flag.
> > > > > >
> > > > > > Example:
> > > > > > - Panel
> > > > > > - Bridge 1
> > > > > > - Bridge 2 pre_enable_prev_first
> > > > > > - Bridge 3
> > > > > > - Bridge 4 pre_enable_prev_first
> > > > > > - Bridge 5 pre_enable_prev_first
> > > > > > - Bridge 6
> > > > > > - Encoder
> > > > > >
> > > > > > In this example, Bridge 4 and Bridge 5 have pre_enable_prev_fir=
st.
> > > > > >
> > > > > > The logic looks for a bridge which enabled pre_enable_prev_firs=
t flag
> > > > > > on each iteration and assigned the previou bridge to limit poin=
ter
> > > > > > if the bridge doesn't enable pre_enable_prev_first flags.
> > > > > >
> > > > > > If control found Bridge 2 is pre_enable_prev_first then the ite=
ration
> > > > > > looks for Bridge 3 and found it is not pre_enable_prev_first an=
d assigns
> > > > > > it's previous Bridge 4 to limit pointer and calls pre_enable of=
 Bridge 3
> > > > > > and Bridge 2 and assign iter pointer with limit which is Bridge=
 4.
> > > > > >
> > > > > > Here is the actual problem, for the next iteration control look=
 for
> > > > > > Bridge 5 instead of Bridge 4 has iter pointer in previous itera=
tion
> > > > > > moved to Bridge 4 so this iteration skips the Bridge 4. The ite=
ration
> > > > > > found Bridge 6 doesn't pre_enable_prev_first flags so the limit=
 assigned
> > > > > > to Encoder. From next iteration Encoder skips as it is the last=
 bridge
> > > > > > for reverse order pipeline.
> > > > > >
> > > > > > So, the resulting pre_enable bridge order would be,
> > > > > > - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5.
> > > > > >
> > > > > > This patch fixes this by assigning limit to next pointer instea=
d of
> > > > > > previous bridge since the iteration always looks for bridge tha=
t does
> > > > > > NOT request prev so assigning next makes sure the last bridge o=
n a
> > > > > > given iteration what exactly the limit bridge is.
> > > > > >
> > > > > > So, the resulting pre_enable bridge order with fix would be,
> > > > > > - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5, Brid=
ge 4,
> > > > > >   Encoder.
> > > > > >
> > > > > > [post_disable]
> > > > > >
> > > > > > The altered bridge ordering has failed if two consecutive bridg=
es on a
> > > > > > given pipeline enables the pre_enable_prev_first flag.
> > > > > >
> > > > > > Example:
> > > > > > - Panel
> > > > > > - Bridge 1
> > > > > > - Bridge 2 pre_enable_prev_first
> > > > > > - Bridge 3
> > > > > > - Bridge 4 pre_enable_prev_first
> > > > > > - Bridge 5 pre_enable_prev_first
> > > > > > - Bridge 6
> > > > > > - Encoder
> > > > > >
> > > > > > In this example Bridge 5 and Bridge 4 have pre_enable_prev_firs=
t.
> > > > > >
> > > > > > The logic looks for a bridge which enabled pre_enable_prev_firs=
t flags
> > > > > > on each iteration and assigned the previou bridge to next and n=
ext to
> > > > > > limit pointer if the bridge does enable pre_enable_prev_first f=
lag.
> > > > > >
> > > > > > If control starts from Bridge 6 then it found next Bridge 5 is
> > > > > > pre_enable_prev_first and immediately the next assigned to prev=
ious
> > > > > > Bridge 6 and limit assignments to next Bridge 6 and call post_e=
nable
> > > > > > of Bridge 6 even though the next consecutive Bridge 5 is enable=
d with
> > > > > > pre_enable_prev_first. This clearly misses the logic to find th=
e state
> > > > > > of next conducive bridge as everytime the next and limit assign=
s
> > > > > > previous bridge if given bridge enabled pre_enable_prev_first.
> > > > > >
> > > > > > So, the resulting post_disable bridge order would be,
> > > > > > - Encoder, Bridge 6, Bridge 5, Bridge 4, Bridge 3, Bridge 2, Br=
idge 1,
> > > > > >   Panel.
> > > > > >
> > > > > > This patch fixes this by assigning next with previou bridge onl=
y if the
> > > > > > bridge doesn't enable pre_enable_prev_first flag and the next f=
urther
> > > > > > assign it to limit. This way we can find the bridge that NOT re=
quested
> > > > > > prev to disable last.
> > > > > >
> > > > > > So, the resulting pre_enable bridge order with fix would be,
> > > > > > - Encoder, Bridge 4, Bridge 5, Bridge 6, Bridge 2, Bridge 3, Br=
idge 1,
> > > > > >   Panel.
> > > > > >
> > > > > > Validated the bridge init ordering by incorporating dummy bridg=
es in
> > > > > > the sun6i-mipi-dsi pipeline
> > > > > >
> > > > > > Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_fir=
st to
> > > > > > alter bridge init order")
> > > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > >
> > > > Thanks for investigating and sorting this.
> > > >
> > > > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > >
> > > > > > ---
> > > > > > Changes for v2:
> > > > > > - add missing dri-devel in CC
> > > > >
> > > > > Would you please look into this issue?
> > >
> > > These still not been picked it yet, can any one pull these two fixes?
> >
> > Ping!
>

Tested-by: Michael Trimarchi <michael@amarulasolutions.com>

> Ping!
>
> Thanks,
> Jagan.
>
>


--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
