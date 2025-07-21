Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8F5B0B9A8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 02:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E06910E081;
	Mon, 21 Jul 2025 00:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SQm2J0n1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3AF10E081
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 00:55:34 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2363616a1a6so31206345ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 17:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753059333; x=1753664133; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=su3U52+sp+PSAMNUwV41V2iuvGngzlC1kSqRffejv28=;
 b=SQm2J0n17chtUBCZzARgg0T9GLQMRLsMtM1gTSqR9ZrxYsSI8n9elZIDUEMjHBE1Hu
 YQd4JZEvTxS1CLmO6G9MN2NQznahxrNqfxtOxGoQcdk9A/rKpsAC+gsTsH5IBZgMTFR8
 ECyr/umtQEDkKskBo3xf3tTxYVimUkaxVPwrSznoxjhpf66GLeGd0efnh7meuBtDL3eJ
 alipaGYTDDAVkiYt1vGE63w8Qo4BGsg0fg2aVPMdAMSwY5L26emA04y2qCk5IWvFXXFk
 CicuTpnJq97D3WP5BnF+Czc8CPNZLQYOqauEgOxZDDrJhc9acHxwRXLnNSr6n8LvOHGS
 ds4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753059333; x=1753664133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=su3U52+sp+PSAMNUwV41V2iuvGngzlC1kSqRffejv28=;
 b=FNvZdQ1iMEMFEc2R4WpkJTFApC6eywutdvACRE1CTCnOTXtUDTtxTrfqTVfZf4lS8/
 jcAuCos0+U8bpsmZXC5AYz5fy3vfv8u+JZAsV7SasHJNoHhGtVePiLn0kf3y9juGA4mO
 pUFDQ8lqU9Q5f31sZhT0bAGt/EMU56uHmBUfgIhdC8vyc3RgRlcef4UTTSi0psItFxMm
 Sn4IRPt+8uJKtHIGZ9XIhPz7pt/n9+qKI3xa6qCH2iNpb7R0eA5eWMWof+hD3gvrPSew
 grD1sSx6dO9laGUA8EveqXLYahajU1UNUG/WKlT31Ix9iiTaqhihC4f28AtwGePzbxCg
 OaZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUItd0lulharM3RloJlqmFn1qbDTYyis0qpqFFixZMHUAkc8kw1yDlPvwafcFaX9hmOvi6UTKlxj2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXa+xxCa/a5meB901DkYPlYBvycQyP3qOMGL8v127BFelrcYAW
 TTj56B5j7Jlz6v9tTuhFsv9eFLkSb1bagtYzN0R26lxQSKeKm0K8n8PK1/cG6z+rx3ioEI7hnVR
 /IWOM33tLH5WiPU9BJI3t4oosmkqfmrs=
X-Gm-Gg: ASbGnctJBcTinFJq8ePnHhjLGHks5MjO3Zhn2pgIbh+M22qg+WXXeJWfqVIU9g8jmEX
 gYlDteGN1FKQu69R86fytM8zV9dEG147v81bRemhEs7nEPlncDj7T0rSAbrQqHXZeEmS6wppR5T
 tsx4s0jq2ywijkLW1m+IyV7MQiI2FlVYGg/biwkZV32HPj0pt65rK6ut8DEfIzlFo7z46kiu1d9
 363owOORQ==
X-Google-Smtp-Source: AGHT+IEE4N6Umc2ltH0YODkkoDHlFEVnhWKExhhBa/MRkZda2Ky+fkbswM6oupyOFN1r4hYW1mpTt1aIle7MXrVo1yM=
X-Received: by 2002:a17:903:22ce:b0:23d:dd04:28d4 with SMTP id
 d9443c01a7336-23e25770595mr233472765ad.43.1753059333434; Sun, 20 Jul 2025
 17:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250720152401.70720-1-luis.hernandez093@gmail.com>
 <20250720152401.70720-2-luis.hernandez093@gmail.com>
 <1b00e570-f51e-4768-a882-d03252d84534@infradead.org>
In-Reply-To: <1b00e570-f51e-4768-a882-d03252d84534@infradead.org>
From: Felipe Hernandez <luis.hernandez093@gmail.com>
Date: Sun, 20 Jul 2025 20:54:57 -0400
X-Gm-Features: Ac12FXxtTP0SrYJjWusZlgSAcBLOj0fssYgo6ZebCpxEa_mtI094lXf21XdNDRk
Message-ID: <CAGRSKZixNThTx_cUJhiXef4N4=K+eLNemqv6+9nZ=o=0d45NWg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] docs: Fix kernel-doc indentation errors
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, 
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Ondrej Ille <ondrej.ille@gmail.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Frank Li <Frank.Li@nxp.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-i3c@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 20, 2025 at 3:03=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> + Bagas
>
> On 7/20/25 8:24 AM, Luis Felipe Hernandez wrote:
> > Fix kernel-doc issues that reported Unexpected indentation errors
> > durring documentation build (make htmldocs) in CAN, I3C and GPU drivers=
.
> >
> > Convert formatting to proper ReST list syntax to resolve warning.
> >
> > Changes since v1:
> > - Convert return value descriptions to proper ReST format
> > - Fix code block introduction with :: syntax
> > - Add GPU driver fixes
> > - Remove SCSI driver (already fixed)
> >
> > Link: https://lore.kernel.org/all/20250703023511.82768-1-luis.hernandez=
093@gmail.com/
> >
> > Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c              | 16 ++++++++--------
>
> drm_gpuvm.c fixed by Bagas:
>
>   https://lore.kernel.org/linux-doc/20250709024501.9105-1-bagasdotme@gmai=
l.com/
>
> Otherwise LGTM.
>
> >  drivers/i3c/device.c                     | 13 ++++++++-----
>
> i3c is also fixed by Bagas:
>   https://lore.kernel.org/linux-i3c/20250702040424.18577-1-bagasdotme@gma=
il.com/
>
> Otherwise LGTM.
>
> >  drivers/net/can/ctucanfd/ctucanfd_base.c | 12 +++++++-----
> >  3 files changed, 23 insertions(+), 18 deletions(-)
> >
>
> > diff --git a/drivers/net/can/ctucanfd/ctucanfd_base.c b/drivers/net/can=
/ctucanfd/ctucanfd_base.c
> > index bf6398772960..f910422188c3 100644
> > --- a/drivers/net/can/ctucanfd/ctucanfd_base.c
> > +++ b/drivers/net/can/ctucanfd/ctucanfd_base.c
> > @@ -506,11 +506,13 @@ static bool ctucan_is_txt_buf_writable(struct ctu=
can_priv *priv, u8 buf)
> >   * @buf:     TXT Buffer index to which frame is inserted (0-based)
> >   * @isfdf:   True - CAN FD Frame, False - CAN 2.0 Frame
> >   *
> > - * Return: True - Frame inserted successfully
> > - *      False - Frame was not inserted due to one of:
> > - *                   1. TXT Buffer is not writable (it is in wrong sta=
te)
> > - *                   2. Invalid TXT buffer index
> > - *                   3. Invalid frame length
> > + * Return:
> > + * * True - Frame inserted successfully
> > + * * False - Frame was not inserted due to one of:
> > + *
> > + *   * TXT Buffer is not writable (it is in wrong state)
> > + *   * Invalid TXT buffer index
> > + *   * Invalid frame length
> >   */
> >  static bool ctucan_insert_frame(struct ctucan_priv *priv, const struct=
 canfd_frame *cf, u8 buf,
> >                               bool isfdf)
>
> The numbered list is not a problem AFAIK. Did you see an issue with it?
> And having the blank line just before the "False" list causing undesirabl=
e
> html output:
>
> Return
>
>  * True - Frame inserted successfully
>
>  * False - Frame was not inserted due to one of:
>
> Description
>
>  * TXT Buffer is not writable (it is in wrong state)
>
>  * Invalid TXT buffer index
>
>  * Invalid frame length
>
> The "Description" line should not be there.
>
> IMO all we want to do is convert the True and False lines into
> a bulleted list and then the html output will look like this:
>
> Return
>
>  * True - Frame inserted successfully
>
>  * False - Frame was not inserted due to one of:
>         1. TXT Buffer is not writable (it is in wrong state)
>         2. Invalid TXT buffer index
>         3. Invalid frame length
>
>
> --
> ~Randy

Hi Randy,

Thank you for the feedback, I apologize about the issues with this
latest patch version:

1. I now see that Bagas has already fixed the GPU and I3C drivers... I
apologize for the duplicate effort.

2. For the CAN driver, I understand your point about the blank line
causing unwanted issues with the HTML. I'll correct this.

3. Re the numbered list> I was being overly broad in my conversion to
bullet format. I will back this out.

I'll send a v3 that focuses only on the CAN driver fix with the
correct formatting you described (convert True/False to bullets while
keeping the numbered sub list intact).

Thank you for the guidance

Best,

Felipe
