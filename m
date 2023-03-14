Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C835D6B873C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 01:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F311010E6A9;
	Tue, 14 Mar 2023 00:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A500C10E6A9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 00:51:31 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r15so28563211edq.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 17:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678755090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qdSc7i6SEnLVZwBcxtojq5tmThBpzIJLqC5dv7pGxBI=;
 b=YoPnZmDhJzRHqG/JfilBwnv7QpUw0HCXKZYDY0D1A2vdNitb+IWQ/0BXPtikW9fVLG
 8yEG1q/5S06b8/pAx0ti1nHDFYlWBhW1WWh4xoFE9DOg+pvBvJS21Wwhv6bL4DKBvKTq
 syeihwTNvi/Y4FEngNHlH/unQ8Tf05egYd5HndemCISKvOoiY1LeVaVjSVvNV2JhMjIX
 RqMYYv0ylmfXuRjN75YUnOV5TE8TNFPLk0KDzqQ7BgINZANRjwC5Kd2IGxeCwtljD6ev
 lkqpG73mXK4mgzoETfb/2a2185DEAnta70VlzxbL975mmDWLhc7kHH9LNr8dhZP1qAHh
 +N2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678755090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qdSc7i6SEnLVZwBcxtojq5tmThBpzIJLqC5dv7pGxBI=;
 b=eh5hYnea4sBTu3wrYU8VndOIBcpLtysWQDg7d0pCBNg6k+VSG4Pc6JjohJnz36OELH
 MLU47cm/h4cbOmhmTgbb0V9KTyxd5uU4EN19L2uM7PVgDTk9Ua8f+wJzgQt0jhWsAeSx
 7h4kLdyNCzaikmQlZ3ACsld4u2jxLORuowfkaBsnPFPCWBbdIZfv8cFUTzrMAQqe/2Kc
 9etTkNFnIaAS31/bJ2FW5MWzzSS0Zy/OcBRum8CnBd34f5IWmF+LUuRDaeULzF2ZApdH
 X4aO4gUY7Nfl3T+93HUAulJI9trimYbPAjdmTHwkW6TdHApyxXmhErQgLBGvDuMoaz5Y
 Csvw==
X-Gm-Message-State: AO0yUKUcU9+XpebmKoTn4fPe6h3P0pJrXKFgTqsgDz62hFJgERnb4BDS
 Qza8pwmq1kHsMPaBfHPZWVQN5UrZonbyo5WRG10=
X-Google-Smtp-Source: AK7set+pfZ6msp7PWWbzH6MGDanGTZIxZkd12AtaKtFaurll9wFFvBX5sBCweJdItn/FXkDJwYxqyi/kXrZrZz93SJo=
X-Received: by 2002:a50:ce18:0:b0:4fb:ebdd:6a03 with SMTP id
 y24-20020a50ce18000000b004fbebdd6a03mr3153947edi.5.1678755089905; Mon, 13 Mar
 2023 17:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230303145218epcas1p2e77bc610f57337830924e3c6c02ca291@epcas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com>
 <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
 <CAOMZO5DFhFTh9kd2NdEe1m2AEs7Se0PNeWZ+5q-cSAz-QVoPDg@mail.gmail.com>
In-Reply-To: <CAOMZO5DFhFTh9kd2NdEe1m2AEs7Se0PNeWZ+5q-cSAz-QVoPDg@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 14 Mar 2023 09:51:18 +0900
Message-ID: <CAAQKjZM66M6wgtoBmAcQifq8LgBUos0bZfbTkRBqnOb7E-05tQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
To: Fabio Estevam <festevam@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000cc7ce305f6d1a099"
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
 linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000cc7ce305f6d1a099
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabio Estevam,

2023=EB=85=84 3=EC=9B=94 14=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 9:31, F=
abio Estevam <festevam@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> Hi Inki,
>
> On Mon, Mar 6, 2023 at 2:24=E2=80=AFAM =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen =
Platform Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90
> <inki.dae@samsung.com> wrote:
>
> > Seems some issue Marek found on testing. If fixed then I will try to
> pick this
> > patch series up.
>
> Marek has successfully tested v16.
>
> Could you please apply v16?
>

I am planning to merge this patch series soon, but I will be proceeding
with the pull-request next week. As the DSIM driver is being moved to the
bridge folder, I would like to wait for acknowledgment from the bridge
maintainers. However, if there are no further comments until next week, I
will proceed with the pull-request.

Thanks,
Inki Dae


> Thanks
>

--000000000000cc7ce305f6d1a099
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Fabio Estevam,<br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">2023=EB=85=84 3=EC=9B=94 14=EC=9D=BC =
(=ED=99=94) =EC=98=A4=EC=A0=84 9:31, Fabio Estevam &lt;<a href=3D"mailto:fe=
stevam@gmail.com">festevam@gmail.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Hi Inki,<br>
<br>
On Mon, Mar 6, 2023 at 2:24=E2=80=AFAM =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen Pl=
atform Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90<br>
&lt;<a href=3D"mailto:inki.dae@samsung.com" target=3D"_blank" rel=3D"norefe=
rrer">inki.dae@samsung.com</a>&gt; wrote:<br>
<br>
&gt; Seems some issue Marek found on testing. If fixed then I will try to p=
ick this<br>
&gt; patch series up.<br>
<br>
Marek has successfully tested v16.<br>
<br>
Could you please apply v16?<br></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">I am planning to merge this patch series soon, b=
ut I will be proceeding with the pull-request next week. As the DSIM driver=
 is being moved to the bridge folder, I would like to wait for acknowledgme=
nt from the bridge maintainers. However, if there are no further comments u=
ntil next week, I will proceed with the pull-request.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Inki Dae</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
<br>
Thanks<br>
</blockquote></div></div></div>

--000000000000cc7ce305f6d1a099--
