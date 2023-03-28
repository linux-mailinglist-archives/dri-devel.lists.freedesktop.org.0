Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A546CB2B7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 02:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA83610E41D;
	Tue, 28 Mar 2023 00:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0248C10E41D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 00:03:41 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id r11so42935226edd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 17:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679961820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l+DgzQY4fNkvzleeGuyqZbcukfUSd7X3lVhC764y+bE=;
 b=p8du2jelzEB3ENTn+ayNWOjyrDGJkmEpOz39ivKVikP9cd5LO2IrtoyNfooYrANkps
 iauiEyggnFaEcDMqc4KYBKf9LVVV93Yx324dWglCHs2SOEQ0uby8jsnGlz9bcEWtPLXl
 zS6o8Wu5ylQXEIRWMDaNNAHhfncGs6nueCMCvfTOkbXjPvaA8WcUJcugVAH4dcY8DjK0
 Y4VskKVsU0rgUp4FNRyU+7XhZo2zB3a6KOK6uq8LquMkkK47ZvIlDjG3PdMZfTOzg/dy
 O2Xz17nG+1xX4/yvTk/5YR+qNNamfHJu+YntHXXk40+PnX2kfIUxE7KxSCvCKaEboVtH
 KZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679961820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l+DgzQY4fNkvzleeGuyqZbcukfUSd7X3lVhC764y+bE=;
 b=M7CQxirGaaKs+iycCPMkxVVJTJEzXjparldsynYUov0SR7vw6gtbnPU7jdV3As21Ac
 GrsINDhFsaBa9uBV6OHOXSZ08b9i8km5TzPyKnQwYyOpjZCPegScHttI8R1SI7m0K53P
 udfcR7rSElDq39Zisk8HJkTYkAh25GhmU0aOO2LVPmt8nlOoCS3x4iiG68xuPYzyIgRV
 wIeHDYdRHZtnqXg9i6ke++d5Inu/kEuFvo6tPOqxCwZmghavw2vN5kZY/mm1zoL3nDXk
 +R1t26G9U3fTGEXxWux3+l9tpFtr/n0Fjdfo2c6QcxYPlCwY8xkz4rMU6ROqLZnBjjQo
 QHAA==
X-Gm-Message-State: AAQBX9d5rM73Qw0bXgewWwdragR8An+vY4XKe3YIU4jjQh7Vdz0Va26C
 enRElGm9Wc+yWOvgolD0/vGQ9reYqnCdD5JTKDQNBHwP
X-Google-Smtp-Source: AKy350Y/1tZ+g++KCbM4mgyvTKF9YVvuW2xA2T+kVWkqqLgNmRlrGAN60fZXfeGdj6/4l8wfIhJ/Y3tJSrN7pvFZgCQ=
X-Received: by 2002:a50:bb62:0:b0:4fa:ce07:639f with SMTP id
 y89-20020a50bb62000000b004face07639fmr6675052ede.5.1679961820236; Mon, 27 Mar
 2023 17:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230303145218epcas1p2e77bc610f57337830924e3c6c02ca291@epcas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com>
 <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
 <CAOMZO5DFhFTh9kd2NdEe1m2AEs7Se0PNeWZ+5q-cSAz-QVoPDg@mail.gmail.com>
 <CAAQKjZM66M6wgtoBmAcQifq8LgBUos0bZfbTkRBqnOb7E-05tQ@mail.gmail.com>
 <CAOMZO5ArYAf72oSY-WMSdfH6w5HAvvrLz24eR+4YBzOASp7U-Q@mail.gmail.com>
 <794538dd-f29a-571b-601a-f61c60d00382@linaro.org>
In-Reply-To: <794538dd-f29a-571b-601a-f61c60d00382@linaro.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 28 Mar 2023 09:03:29 +0900
Message-ID: <CAAQKjZPmYcdUphP9w7i_O65rhXwsw2rCxAnDJ1JG73-RuLP4UQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000880ebe05f7ea97ac"
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000880ebe05f7ea97ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2023=EB=85=84 3=EC=9B=94 27=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 11:08, =
Neil Armstrong <neil.armstrong@linaro.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:

> On 23/03/2023 16:34, Fabio Estevam wrote:
> > Hi Inki,
> >
> > On Mon, Mar 13, 2023 at 9:51=E2=80=AFPM Inki Dae <daeinki@gmail.com> wr=
ote:
> >
> >>> Could you please apply v16?
> >>
> >>
> >> I am planning to merge this patch series soon, but I will be proceedin=
g
> with the pull-request next week. As the DSIM driver is being moved to the
> bridge folder, I would like to wait for acknowledgment from the bridge
> maintainers. However, if there are no further comments until next week, I
> will proceed with the pull-request.
> >
> > A friendly reminder: do you think you can proceed with the pull-request
> now?
>
> I can apply the entire patchset to drm-misc-needed if needed.
>
> Inki, is it ok for you or you still want to take it in the exynos tree ?
>

Sorry for late. I will proceed with pull-request today.

BTW, now is rc4 so we have more time for pull-request. Is there any reason
you hurry up?

Thanks,
Inki Dae


> Neil
>
> >
> > Thanks
>
>

--000000000000880ebe05f7ea97ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<br><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">2023=EB=85=84 3=EC=9B=94 27=EC=9D=BC (=EC=9B=94) =
=EC=98=A4=ED=9B=84 11:08, Neil Armstrong &lt;<a href=3D"mailto:neil.armstro=
ng@linaro.org">neil.armstrong@linaro.org</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=
=91=EC=84=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 23/03/2023 16:34, =
Fabio Estevam wrote:<br>
&gt; Hi Inki,<br>
&gt; <br>
&gt; On Mon, Mar 13, 2023 at 9:51=E2=80=AFPM Inki Dae &lt;<a href=3D"mailto=
:daeinki@gmail.com" target=3D"_blank" rel=3D"noreferrer">daeinki@gmail.com<=
/a>&gt; wrote:<br>
&gt; <br>
&gt;&gt;&gt; Could you please apply v16?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I am planning to merge this patch series soon, but I will be proce=
eding with the pull-request next week. As the DSIM driver is being moved to=
 the bridge folder, I would like to wait for acknowledgment from the bridge=
 maintainers. However, if there are no further comments until next week, I =
will proceed with the pull-request.<br>
&gt; <br>
&gt; A friendly reminder: do you think you can proceed with the pull-reques=
t now?<br>
<br>
I can apply the entire patchset to drm-misc-needed if needed.<br>
<br>
Inki, is it ok for you or you still want to take it in the exynos tree ?<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sor=
ry for late. I will proceed with pull-request today.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">BTW, now is rc4 so we have more time for pull-=
request. Is there any reason you hurry up?</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Inki Dae</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
Neil<br>
<br>
&gt; <br>
&gt; Thanks<br>
<br>
</blockquote></div></div></div>

--000000000000880ebe05f7ea97ac--
