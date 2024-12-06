Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362869E76A5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 18:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5098210E3FB;
	Fri,  6 Dec 2024 17:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lGOEksUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC3810E3FB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 17:05:28 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-3003e203acaso1058011fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 09:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733504727; x=1734109527; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bk47j0hLV4x4PvwdRmzQiN97YZDzXlc3lZW2U0wN4ZM=;
 b=lGOEksUhK/y7XO7eZ6mDPCzAAR4Au6HhCkyqnLy2AKnmDag9zJgSTpTKfikCI8F0H2
 KUEvfvjEKXLfJtifeziuwJUHYpCaqBsKkenW1GeL576p+i3VhwYyw8wINqDk9DTenXOm
 u6zsk9dC8cvIiqLYnLb8Ph3k7mcV7QFVXb8Gb3MQxBTTWJxzvc6WiD+rYaU+IT7RrSjK
 //1eYM4zr5J067P+IjryzReqGCPvMcYd/sCuh9jIGHn8DtNT1YUJc9TkXvy9xvOFlZM2
 VubaOyG0YltRDUwmKEle1q0XG8s1rlqUC5KdPrjhMuWVfN3Se/mQ2PwrV9UssS+zDUwj
 tHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733504727; x=1734109527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bk47j0hLV4x4PvwdRmzQiN97YZDzXlc3lZW2U0wN4ZM=;
 b=IiSi74XiAEbXdjtny1bDyLVkrL8Js6B3xRR5ipKKd0LN7vhCKFvsWLcZdh9u/y8G57
 OnFyCUVeILhI8mqgNKsLZDQQfXwyfky11WF4W8+mZ0M1Ykih+fPicmY+zraK4+GQNIvB
 TRCp0f80liHrWVa4VOoOdYbYUpJNunNmjCAibUt60/Evy+XfQ7ouKfWuR3ThKEaJNXRq
 4KzJz7ak52Ix09ASr7q+nnGkzV76zNjzZCNHY7F4nPlqhAOAvB6sos3fARhosE4UZwtU
 iTICBQkOkzwcheV64dzJw42jMfxOGj+uoeykltIi2n28H0Z4JQ/xGFc2jWqBL0nitSmU
 Y1Vg==
X-Gm-Message-State: AOJu0YwLeSiHxzpA16229VvcwcCo7gM2keuJabuwwrHYZbc49FJeRTn4
 26sDXo7I5EoalsFKa5MqcOUVsWEkHnMcOGBs2ynN/hMWj20ISRdKaXHDKR7rrms3qbJBFfcQA9c
 X5s+zPkDgTDKvMp6gsGuEOys+LoI=
X-Gm-Gg: ASbGncsLEZC0ZcV6FoVDXn2QqEZEkP/0BRyYG/8zbzS0MSt6Ti1OIYGAQACWikh7Lz3
 oQ4SAit9bJCb6mlCf4pxey8+XifFwwGGpqBZ+1Y3ZMWgao0Rqmb3zqAbJBiLyrU1ymw==
X-Google-Smtp-Source: AGHT+IFneJU0vnhgaOCzc2mnFsLlI+KTveA5OMx9oRCneNPgOlpXXckD4o5S0E560pEllwa05eFAntIxXAQv8ypo3nw=
X-Received: by 2002:a05:651c:198a:b0:300:3b08:ed89 with SMTP id
 38308e7fff4ca-3003b08ee67mr5127891fa.35.1733504725108; Fri, 06 Dec 2024
 09:05:25 -0800 (PST)
MIME-Version: 1.0
References: <20241206214554.219-1-guyc.linux.patches@gmail.com>
In-Reply-To: <20241206214554.219-1-guyc.linux.patches@gmail.com>
From: Guy Chronister <guyc.linux.patches@gmail.com>
Date: Fri, 6 Dec 2024 11:05:14 -0600
Message-ID: <CAMYt9q4QMHLgHany7sztxb90jyCyh35NgSv+ek2EzD=VYhkNKw@mail.gmail.com>
Subject: Re: [PATCH] drm:panel-orientation-quirks Added DeckHD support to
 panel orientation quirks for Steam Deck This commit introduces a new quirk to
 handle specific orientation issues for DeckHD panels on the Steam Deck. The
 quirk ensures the correct display orientation for these panels, enhancing the
 user experience on Steam Deck devices. Tested on my Steam Deck to ensure
 reliability. Feedback and further testing are welcome.
To: maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 airlied@gmail.com
Content-Type: multipart/alternative; boundary="0000000000005b4e9906289d05a2"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000005b4e9906289d05a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Disregard this one, I resubmitted after running "git format-patch -1 HEAD"
after breaking the subject/commit message amendment.


On Fri, Dec 6, 2024 at 9:45=E2=80=AFAM Guy Chronister <guyc.linux.patches@g=
mail.com>
wrote:

> Signed-off-by: Guy Chronister <guyc.linux.patches@gmail.com>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 3f2e2b851cbc..c412273799cb 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -456,6 +456,13 @@ static const struct dmi_system_id orientation_data[]
> =3D {
>                   DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
>                 },
>                 .driver_data =3D (void *)&lcd1280x1920_rightside_up,
> +       }, {    /* Valve Steam Deck (Jupiter) with DeckHD */
> +               .matches =3D {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
> +               },
> +               .driver_data =3D (void *)&lcd1200x1920_rightside_up,
>         }, {    /* Valve Steam Deck (Jupiter) */
>                 .matches =3D {
>                   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
> --
> 2.45.2
>
>

--0000000000005b4e9906289d05a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Disregard this one, I resubmitted after running &quot;git =
format-patch -1 HEAD&quot; after breaking the subject/commit message amendm=
ent.<p></p></div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 6, 2024 at 9:45=E2=80=AFAM Guy=
 Chronister &lt;<a href=3D"mailto:guyc.linux.patches@gmail.com">guyc.linux.=
patches@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Signed-off-by: Guy Chronister &lt;<a href=3D"mailto:guyc.l=
inux.patches@gmail.com" target=3D"_blank">guyc.linux.patches@gmail.com</a>&=
gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/d=
rm/drm_panel_orientation_quirks.c<br>
index 3f2e2b851cbc..c412273799cb 100644<br>
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c<br>
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c<br>
@@ -456,6 +456,13 @@ static const struct dmi_system_id orientation_data[] =
=3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_EXACT_MA=
TCH(DMI_PRODUCT_NAME, &quot;Galaxy Book 10.6&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver_data =3D (v=
oid *)&amp;lcd1280x1920_rightside_up,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {=C2=A0 =C2=A0 /* Valve Steam Deck (Jupiter)=
 with DeckHD */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.matches =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DMI_EXACT_MA=
TCH(DMI_SYS_VENDOR, &quot;Valve&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DMI_EXACT_MA=
TCH(DMI_PRODUCT_NAME, &quot;Jupiter&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DMI_EXACT_MA=
TCH(DMI_PRODUCT_VERSION, &quot;1&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.driver_data =3D (v=
oid *)&amp;lcd1200x1920_rightside_up,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }, {=C2=A0 =C2=A0 /* Valve Steam Deck (Jupiter)=
 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .matches =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_EXACT_MA=
TCH(DMI_SYS_VENDOR, &quot;Valve&quot;),<br>
-- <br>
2.45.2<br>
<br>
</blockquote></div>

--0000000000005b4e9906289d05a2--
