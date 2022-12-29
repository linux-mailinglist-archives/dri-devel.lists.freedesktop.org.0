Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0AD658C59
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 12:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AC310E1FD;
	Thu, 29 Dec 2022 11:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B14510E1FD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:42:25 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 79so12220386pgf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 03:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=opKzX/gSToa0GHXm2YZJYMSRtI+NoB4NvxkvJmU2sqM=;
 b=0pXr+/LSsbCbzcBxsn3pBNU9fIOBV3srO0m37ShKm3kxcyyIbNzFl451hg+sAgfNnc
 sdx+7oA+uWVuwJ2rr52u9mvO2rHr3xbc0397vBQ/xNBo7NtOaKOfyIH4ulhvu7WHdlIJ
 rtpaAn9IgnQXqxz3HgeEQ2slHsM+2v3hrFBRj6ZhAdMsgKJEgoJXCzm3YGs8VacsvPcq
 y1GilY2KlqEF1IH+dHV6ipQNadvp12yeexGrygjoS0Hh5YWEQu4Jzn6CTYFQqIWzkTxn
 jYaMZv0+19mgzvyCwI3+gWdQOPaVelH/OH73C9H2POyFUDWUeqSzMPsg1/uuS+DhLHEv
 5c+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=opKzX/gSToa0GHXm2YZJYMSRtI+NoB4NvxkvJmU2sqM=;
 b=NxN9gFxIr9rvWo5vj5b7u98jNONOx1lYovgs0Uh8oRWpJKJH4KdK6pUJ4MTejAp9MH
 fnEiGCNGOJJTx56JzScz5ktDY5eR1rgLKAsi7wa1hNEuj/nbPAYQqa5HN2Eh7RxkYobn
 zq6GezDwHj1w7iGEaP6h9lPbil5KhUC/aBNBTPqVYhymGIxWRr1lCZuuxnCyyHwryR/Z
 5cVrEtAfFOlsSN6Vt7LqFzS0jXxvgryLjW+twgijlFl2Enkda8tBz41iwgNYg1ILj7/S
 HqAx4eAdgCaztAX97JPZRPgipcL/onYsWW4S8G1av8+oJBkzLeM1yeTv+bEcd5vf3wK1
 uUdg==
X-Gm-Message-State: AFqh2koUbPMRQ/yJXYxmNIM8Tw8NKSrs580USHzNVadqGhbWgWfRwElL
 0dg35iJUyN52tzw0PYMTDU3FSHtm/jMgvU9ajAhg9Q==
X-Google-Smtp-Source: AMrXdXvcUYXlgC4/r2MW5PsTQ05QjxJyosuNsVwyYK0c4xjmhME4gz8Sc7MXW3NaMI/3revADZYn94KLLTxnaGkcDb4=
X-Received: by 2002:a62:388d:0:b0:576:7440:2478 with SMTP id
 f135-20020a62388d000000b0057674402478mr1586318pfa.51.1672314145036; Thu, 29
 Dec 2022 03:42:25 -0800 (PST)
MIME-Version: 1.0
References: <20221227110335.2923359-1-javierm@redhat.com>
 <20221227110335.2923359-2-javierm@redhat.com>
 <CAMty3ZAaHKJ21D8mE=HU3D3KOGAiZ7vfmW_Hgc-E5JO5S+tMNA@mail.gmail.com>
 <CABxcv=kwtk21UbOwaV4tq=BpPsrYmnTrzuhybjbknipqk5R-fA@mail.gmail.com>
 <CAMty3ZDESyJoWMO_BgHzUJN=hLV0dH6y=3B9ogOsSUvaTMqarQ@mail.gmail.com>
 <CABxcv=mFzuUq0-PQ8H3N0Sxmzg+z1v_uwhUe0jcH2++NDQRR0w@mail.gmail.com>
 <CAMty3ZDJEx6J6xtbAVyO61vSKeW_7F-xWk5yvkwKvHNc1oyykA@mail.gmail.com>
In-Reply-To: <CAMty3ZDJEx6J6xtbAVyO61vSKeW_7F-xWk5yvkwKvHNc1oyykA@mail.gmail.com>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Thu, 29 Dec 2022 12:42:13 +0100
Message-ID: <CABxcv=kzMZ+HMTMGxYkmJh2EbzE2wwc7Q7bVd--3FKZVK97LqA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: Add Himax HX8394 panel
 controller
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: multipart/alternative; boundary="00000000000091786b05f0f5fa64"
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
Cc: devicetree@vger.kernel.org, Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000091786b05f0f5fa64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jagan,

On Thu, 29 Dec 2022 at 10:54 Jagan Teki <jagan@amarulasolutions.com> wrote:

>
[=E2=80=A6]


> > > compatible:
> > >     items:
> > >       - enum:
> > >           - hannstar,hsd060bhw4
> > >       - const: himax,hx8394
> > >
> > > himax,hx8394 is the actual controller and is denoted as fallback
> compatible.
> > >
> >
> > I see. Do you have an example of a panel controller that does this? I
> > don't see that much value in doing this since you want the DTS to
> > describe the actual HW and so want the panel I believe.
>
> Yes, but the Panel needs to be built on top of the display IC so the
> actual parent here is the display IC and the panel is sub-HW.  This is
> what usually follows, here are some reference bindings.


I see. Thanks for these references.

I=E2=80=99ll adapt the driver and binding schema then according to this and=
 post a
v4.

Best regards,
Javier

--00000000000091786b05f0f5fa64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello Jagan,</div><div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, 29 Dec 2022 at 10:54 Jagan Teki =
&lt;<a href=3D"mailto:jagan@amarulasolutions.com">jagan@amarulasolutions.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"></blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">[=E2=80=A6]</div><div dir=3D"auto"><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><br>
&gt; &gt; compatible:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0items:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- enum:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- hannstar,hsd060bhw4<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- const: himax,hx8394<br>
&gt; &gt;<br>
&gt; &gt; himax,hx8394 is the actual controller and is denoted as fallback =
compatible.<br>
&gt; &gt;<br>
&gt;<br>
&gt; I see. Do you have an example of a panel controller that does this? I<=
br>
&gt; don&#39;t see that much value in doing this since you want the DTS to<=
br>
&gt; describe the actual HW and so want the panel I believe.<br>
<br>
Yes, but the Panel needs to be built on top of the display IC so the<br>
actual parent here is the display IC and the panel is sub-HW.=C2=A0 This is=
<br>
what usually follows, here are some reference bindings.</blockquote><div di=
r=3D"auto"><br></div><div dir=3D"auto">I see. Thanks for these references.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">I=E2=80=99ll adapt the d=
river and binding schema then according to this and post a v4.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"auto"=
>Javier</div></div></div>

--00000000000091786b05f0f5fa64--
