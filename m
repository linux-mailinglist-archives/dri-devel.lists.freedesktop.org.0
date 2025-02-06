Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04AFA2B401
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 22:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E5210E970;
	Thu,  6 Feb 2025 21:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Na8bVlvY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EF010E957
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 21:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738876582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LIRhzPa0ziB3G/ikzWEbtqiSuvX/5xBqL7wzBRiH8M=;
 b=Na8bVlvY1YKaLk0SSwZvzwxxT8XgWT+EfdZIxWlPTghr6JwFzKlxbjf9ci7oJlH9nVzmW4
 zuvfpSh3C0vQlkJ8I1sSoro+FueBDgN6dXVjNqIQPE+Gd42AFKcG2/i5xcFQ0JQTuDSGvN
 xnJ+w9n4EhEdyzPlIdZbeS3ta5RnSUQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-xfnqBMKSMjWgTB8eCJrtOg-1; Thu, 06 Feb 2025 16:16:19 -0500
X-MC-Unique: xfnqBMKSMjWgTB8eCJrtOg-1
X-Mimecast-MFC-AGG-ID: xfnqBMKSMjWgTB8eCJrtOg
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6f68264a641so15582327b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 13:16:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738876579; x=1739481379;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/LIRhzPa0ziB3G/ikzWEbtqiSuvX/5xBqL7wzBRiH8M=;
 b=TezyPnKO8mOjjZjboGvGoZ7ZtNV5iK+SI1Sa/NbaXhrt1nTS2PTj0Oh5HTz3Lb6BSB
 DktfY70gj8/NVmr2YpIGnBCjg6YAbC/dcnALu4uPyJG8A/MGk0yteHT1rDcKvpITPqyA
 Sc3bPIPOoHZRqSN5zRtP5+Tut1UbREz5hWF1bKqvQ+nHL5lJgLH9aTSC95ruP45O1XOu
 hS4YkTMiEwUax7ik+Fy5khbi8vxXOjwRSlj9KEIEPIG84TWUH9nSlOtO5b8I3xu5LWbw
 oedHW7lfUOVL4SeuRhRdV0nN1YdouZKSS6NrxTQy3C/btdXZo7je1nvsmGWagPTiY5Hw
 5CPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkoO141WpwAKWgqbn00pOxIwbqh1fe7R5xiFB8vcn6XzbC/htDMHnM5rZsQtPMu2jABJ6QqEXd32o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0yPjRG0KuDwasScDt3NZ90uZQ5hm4QZejNT4gXk69GL4RzYwE
 FuiNHdI+ApInbWEamZDkwxiJcLInmIaGdfX7KGi+eBhDzyJf4F/Dj0V6oU7Xa/yCK8Bb1f7SgTt
 NAMus/onq4+2gdtrH5wz5oqI3AZY24f1eY/jOeNH7TBicAtaRNlt4TkmW6pAahXG00erLuwvEKi
 vuECqS75WKUFp11oqxvYDum99gfNaT52WEKovRw4zU
X-Gm-Gg: ASbGncspP5KkSxUjsbY0WhmhDuZP8waCJGX82wJsWAhsU07CojEDx9IZ0M6CgulVv7x
 rPb6A8eLZnTiK1DIM/DCxWgi9IU3hg2iKa03u0GNdUjq5swB2goYW+7lHHADS
X-Received: by 2002:a05:690c:9989:b0:6ef:6fef:4cb6 with SMTP id
 00721157ae682-6f9b233bf8fmr8830847b3.0.1738876579018; 
 Thu, 06 Feb 2025 13:16:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjCqpwPwL+07jYSJFwomed71Bwu5IyhQrsp/e8kjJRvrAsFYgViw9/vssKy4znNo90IGP+LEAAzfLVoH6pYqM=
X-Received: by 2002:a05:690c:9989:b0:6ef:6fef:4cb6 with SMTP id
 00721157ae682-6f9b233bf8fmr8830137b3.0.1738876578666; Thu, 06 Feb 2025
 13:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
 <20250205-mem-cocci-newapi-v1-12-aebf2b0e2300@redhat.com>
 <73bad044-f5fc-40ea-9e32-571912573a5f@suse.de>
In-Reply-To: <73bad044-f5fc-40ea-9e32-571912573a5f@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 6 Feb 2025 16:16:07 -0500
X-Gm-Features: AWEUYZk6prfZM1C9-Gul4JSYr8izxGkZAIuEujMIU0-RwOCWKJ-qTeyWBXWPDFc
Message-ID: <CAN9Xe3R=PpKbM=QraFvPMTF+XvBujjxp3XCWtg3Y5+pd+OE1Dw@mail.gmail.com>
Subject: Re: [PATCH 12/12] Documentation: Update the todo
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
 Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
 John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Marek Vasut <marex@denx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, 
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4ZEfXxhvCxb0ZPKFzM1CBnpAiUXR53JhRdLrqs-nt8k_1738876579
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c7abf9062d7fc054"
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

--000000000000c7abf9062d7fc054
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 2:57=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de>
wrote:

> Hi
>
>
> Am 05.02.25 um 21:08 schrieb Anusha Srivatsa:
> > Update the Documentation to be more precise.
> >
> > v2: Update for clarity
> >
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >   Documentation/gpu/todo.rst | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index
> 256d0d1cb2164bd94f9b610a751b907834d96a21..03fcd086889acbd1294669b260292ff=
c79e97e2f
> 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -441,13 +441,13 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
> >
> >   Level: Intermediate
> >
> > -Request memory regions in all drivers
> > --------------------------------------
> > +Request memory regions in all fbdev drivers
> > +--------------------------------------------
> >
> > -Go through all drivers and add code to request the memory regions that
> the
> > -driver uses. This requires adding calls to request_mem_region(),
> > -pci_request_region() or similar functions. Use helpers for managed
> cleanup
> > -where possible.
> > +Old/ancient fbdev drivers do not request their memory properly.
> > +Go through these drivers and add code to request the memory regions
> that the
> > +driver uses. Problematic areas include hardware that has exclusive
> ranges like
> > +VGA. VGA16fb does not request the range as it is expected.
>
> I'd keep both, old and new text, and turn them into a single paragraph.
> The old text explains what to do and the new text gives examples.
>
>
Sure. Waiting for one final patch to be reviewed(patch 11). With that, I
will make the changes you suggested and re-roll the series.

Thanks for the feedback!

Anusha

> Best regards
> Thomas
> >
> >   Drivers are pretty bad at doing this and there used to be conflicts
> among
> >   DRM and fbdev drivers. Still, it's the correct thing to do.
> >
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
>

--000000000000c7abf9062d7fc054
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 6, =
2025 at 2:57=E2=80=AFAM Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann=
@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hi<br>
<br>
<br>
Am 05.02.25 um 21:08 schrieb Anusha Srivatsa:<br>
&gt; Update the Documentation to be more precise.<br>
&gt;<br>
&gt; v2: Update for clarity<br>
&gt;<br>
&gt; Cc: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de" targe=
t=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0Documentation/gpu/todo.rst | 12 ++++++------<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst<b=
r>
&gt; index 256d0d1cb2164bd94f9b610a751b907834d96a21..03fcd086889acbd1294669=
b260292ffc79e97e2f 100644<br>
&gt; --- a/Documentation/gpu/todo.rst<br>
&gt; +++ b/Documentation/gpu/todo.rst<br>
&gt; @@ -441,13 +441,13 @@ Contact: Thomas Zimmermann &lt;<a href=3D"mailto=
:tzimmermann@suse.de" target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Level: Intermediate<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -Request memory regions in all drivers<br>
&gt; --------------------------------------<br>
&gt; +Request memory regions in all fbdev drivers<br>
&gt; +--------------------------------------------<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -Go through all drivers and add code to request the memory regions tha=
t the<br>
&gt; -driver uses. This requires adding calls to request_mem_region(),<br>
&gt; -pci_request_region() or similar functions. Use helpers for managed cl=
eanup<br>
&gt; -where possible.<br>
&gt; +Old/ancient fbdev drivers do not request their memory properly.<br>
&gt; +Go through these drivers and add code to request the memory regions t=
hat the<br>
&gt; +driver uses. Problematic areas include hardware that has exclusive ra=
nges like<br>
&gt; +VGA. VGA16fb does not request the range as it is expected.<br>
<br>
I&#39;d keep both, old and new text, and turn them into a single paragraph.=
 <br>
The old text explains what to do and the new text gives examples.<br>
<br></blockquote><div><br></div><div>Sure. Waiting for one final patch to b=
e reviewed(patch 11). With that, I will make the changes you suggested and =
re-roll the series. <br></div><div><br></div><div>Thanks for the feedback!<=
/div><div><br></div><div>Anusha<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Best regards<br>
Thomas<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Drivers are pretty bad at doing this and there used to be =
conflicts among<br>
&gt;=C2=A0 =C2=A0DRM and fbdev drivers. Still, it&#39;s the correct thing t=
o do.<br>
&gt;<br>
<br>
-- <br>
--<br>
Thomas Zimmermann<br>
Graphics Driver Developer<br>
SUSE Software Solutions Germany GmbH<br>
Frankenstrasse 146, 90461 Nuernberg, Germany<br>
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman<br>
HRB 36809 (AG Nuernberg)<br>
<br>
</blockquote></div></div>

--000000000000c7abf9062d7fc054--

