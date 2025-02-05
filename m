Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C52A29705
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 18:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AD210E1E7;
	Wed,  5 Feb 2025 17:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ejkGPFJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB2810E1E7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 17:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738775775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zeSidYCdYJnARtwshAoVNn6AXIZ4ayw7DuR83E+9hlo=;
 b=ejkGPFJiif/LRtUA5EKrAsnn8tsdPUmtc3eWWBda6Gcxe1FnBdSNXZ7AZjlnN4qp/i2JtP
 v4ZHuxVI2LSCBSfyXvy449GMm4cl27XbNGKx9vcAjm/JIumnuR3ssHBXtJb0c7Tka4WioN
 wm5lnmHYo+K9XNl2EwrHCIUz8l69IVA=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-ciE5oEnyOtiwkk3-qeNimA-1; Wed, 05 Feb 2025 12:16:14 -0500
X-MC-Unique: ciE5oEnyOtiwkk3-qeNimA-1
X-Mimecast-MFC-AGG-ID: ciE5oEnyOtiwkk3-qeNimA
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6f46924f63eso14503527b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 09:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738775773; x=1739380573;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zeSidYCdYJnARtwshAoVNn6AXIZ4ayw7DuR83E+9hlo=;
 b=ZZvGGYDsvfKp/jApYIOpmq8SHLBl2eXbTgt5X5+5gqmrUI864aL0IINtlH/GiD8mkO
 oz51eT/EfLzYpPHrbHBVJI29i3b5NkGI+YOTeHxHebcfOcr6+yCIUrgqXS7JE32L4VuV
 SelXx/pfYqo3atmsV56rZHfXSFyAUgG6YRJC/Ic2uQcZBN6isGLphJ8VXhbgtZ1GfEP3
 UxNh/Sa8ueCGq0KvjWpAjRfpm/E5fMc+zhnthxy1Iy6L/gRcQj1oPBD3+8SPdzvbxiZJ
 PBignSA8whGK0YMD5VoRlH73AARUaGEuuL0NEdVVNlU/Us0NE9sEvg/5wO/Lz8MztANS
 1xQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXtp2SHwhp85x64W5MHF13UPJdOHBV0kCU10bFNtGq9H+EHw44yPlrjIrz82DMXhlBYiyCZ+Q9lBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUpCbI7hucU4eiDU+CrxXzHo3B3oqBpei20028fZJq028AosoR
 c+6IOpjoCN1EzQx152urJGuSOj385uLeRNEvsI2cZAx16vgpR+tKFXdAjprIgR3s9Es553Tnokx
 6+4V1/mAIBC5dhLVF+sgMc46HWZwHE67HsZhyGRhcFABkpWMCuAj2tYwOh3uoHk2o6kpUbR8Biy
 smXelnkIfAmzMY05EGN2PZZOvIkGAchrUAxi6DOTzT
X-Gm-Gg: ASbGncuPH6eGq48hfx4AQOTN+rXXZSKAPoZwHr2loZNUEPm96GYuXbKNYsKCBWrZtwv
 9h+YEUs8j25UCQw+NZVZ1UN6kQ9IOKsTqUJDHJjPW0zAolCY/2ADxIOEkGbjG
X-Received: by 2002:a05:690c:6c0c:b0:6f9:4195:8195 with SMTP id
 00721157ae682-6f99a60b0cdmr1342127b3.15.1738775773236; 
 Wed, 05 Feb 2025 09:16:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEo2HkXE9/PB8TiTOCOmlpYI4+BLO/SI3ZFeKcGKfVuRa8aoXdOtxFKnY5ClyavR5vDRDWGBJn3fTqfR8+aXmM=
X-Received: by 2002:a05:690c:6c0c:b0:6f9:4195:8195 with SMTP id
 00721157ae682-6f99a60b0cdmr1341537b3.15.1738775772906; Wed, 05 Feb 2025
 09:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-14-0d1609a29587@redhat.com>
 <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
 <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
 <0ae17de1-c6dc-48eb-aed2-b099b2abbea5@suse.de>
In-Reply-To: <0ae17de1-c6dc-48eb-aed2-b099b2abbea5@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 5 Feb 2025 12:16:02 -0500
X-Gm-Features: AWEUYZllqvGkhQf1gMIyypHoBPrhgiNdZ-ww_BiUqVz8q-uL_n50cYGcicLCGMU
Message-ID: <CAN9Xe3S3E_LzU7zF1UCE7fD9OE2bU7BcLy6xQOQk2s7=k+6v=A@mail.gmail.com>
Subject: Re: [PATCH 14/14] Documentation: Update the todo
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
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
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SIuGLzQXIA7sVuV-4vEqVUbTg3mrv-VloyBcn_QupPA_1738775773
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000049d89e062d68488b"
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

--00000000000049d89e062d68488b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 7:53=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de>
wrote:

> Hi Maxime
>
>
> Am 29.01.25 um 15:31 schrieb Maxime Ripard:
> > Hi Thomas,
> >
> > On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:
> >> Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:
> >>> Remove the TODO now that this series addresses
> >>> the changes needed.
> >> While your series is fine, this TODO item is unrelated. It's about
> various
> >> ancient fbdev drivers that do not reserve their memory regions
> correctly. So
> >> please drop patch 14 form the series.
> > Is it? Could we rephrase the entry then? I'm the one that suggested
> > Anusha to work on this, and it's still not clear to me what it means
> > exactly if it's not what she worked on :)
>
> I guess, we could make this more precise.
>
> Some old graphics drivers don't request their memory ranges correctly.
> It's usually a problem with hardware that has exclusive ranges, such as
> the VGA. Vga16fb doesn't request the range as it should. Someone needs
> to audit all those old drivers and fix them.
>
>
This sounds like a good next approach. I will make the documentation more
clear.

Thanks for feedback everyone!

Anusha

> Best regards
> Thomas
>
>
> >
> > Maxime
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

--00000000000049d89e062d68488b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 31,=
 2025 at 7:53=E2=80=AFAM Thomas Zimmermann &lt;<a href=3D"mailto:tzimmerman=
n@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi Maxime<br>
<br>
<br>
Am 29.01.25 um 15:31 schrieb Maxime Ripard:<br>
&gt; Hi Thomas,<br>
&gt;<br>
&gt; On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:<br>
&gt;&gt; Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:<br>
&gt;&gt;&gt; Remove the TODO now that this series addresses<br>
&gt;&gt;&gt; the changes needed.<br>
&gt;&gt; While your series is fine, this TODO item is unrelated. It&#39;s a=
bout various<br>
&gt;&gt; ancient fbdev drivers that do not reserve their memory regions cor=
rectly. So<br>
&gt;&gt; please drop patch 14 form the series.<br>
&gt; Is it? Could we rephrase the entry then? I&#39;m the one that suggeste=
d<br>
&gt; Anusha to work on this, and it&#39;s still not clear to me what it mea=
ns<br>
&gt; exactly if it&#39;s not what she worked on :)<br>
<br>
I guess, we could make this more precise.<br>
<br>
Some old graphics drivers don&#39;t request their memory ranges correctly. =
<br>
It&#39;s usually a problem with hardware that has exclusive ranges, such as=
 <br>
the VGA. Vga16fb doesn&#39;t request the range as it should. Someone needs =
<br>
to audit all those old drivers and fix them.<br>
<br></blockquote><div><br></div><div>This sounds like a good next approach.=
 I will make the documentation more clear.</div><div><br></div><div>Thanks =
for feedback everyone!</div><div><br></div><div>Anusha <br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
Best regards<br>
Thomas<br>
<br>
<br>
&gt;<br>
&gt; Maxime<br>
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

--00000000000049d89e062d68488b--

