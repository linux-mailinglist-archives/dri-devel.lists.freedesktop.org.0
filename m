Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1822925A5D5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 08:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DB96E12D;
	Wed,  2 Sep 2020 06:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD616E127;
 Wed,  2 Sep 2020 06:52:36 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a9so3331824wmm.2;
 Tue, 01 Sep 2020 23:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=44BdaxqK2OQQPVP9Xv1Ay6p5VR9c7tRwk90e8v0rhXM=;
 b=rBfDgm4vt0PsNxdr/XRr1DlPWM6hxGNoPXGMWb4nhkSrjA8uXeFarENmm9DcKyxsC4
 mp8hR0lRqHGMGSqZdxJZdjm6+hLvDsUihr5PI77rvxefeyy3UKu9AGMSfl6a5hu/B1iV
 zs4bPtLtK602zUf3BUIaKsZT6S7J7QPwzHc6y+aeflTM/AvGBlS+WYnKGlwvsnoP/BQL
 qTnaOC+8C/nzVAYFzZiloTxGDBRqb4nIuMYo5DGufMuUSSrOPEKWJoTnv6CwEG7Sh4qf
 W50YeqRXNzPLIQ5DQL8g/T1xv0BfE+pK/fXeZN/EeVZcrX6GRf49Bs0/RglB/gLYWunc
 6yug==
X-Gm-Message-State: AOAM5314akqoqGWt8rICSzAW2sORwyf5+RSOy0eeb/TQ5i1FOELK6OPe
 GhUSbecfvOlAvnL7EPTUqWSakv0bo6PXy3Wx7UE=
X-Google-Smtp-Source: ABdhPJwa0Qb9zS50HTgFl3gbsPuDmy4NHUh3WiKkgu/nBHI2j7Q+p+ABCxoU32SQaIktGbLN924T50hDLN1GySEVJKU=
X-Received: by 2002:a1c:c90d:: with SMTP id f13mr5395692wmb.25.1599029554465; 
 Tue, 01 Sep 2020 23:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200901154200.2451899-1-robdclark@gmail.com>
In-Reply-To: <20200901154200.2451899-1-robdclark@gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Wed, 2 Sep 2020 08:52:23 +0200
Message-ID: <CAAObsKD2uXmRD7Qw+kWzKcz5o96adczdaTGkPA_1fR=UZcR=cA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm: More GPU tracepoints
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1128752074=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1128752074==
Content-Type: multipart/alternative; boundary="000000000000944f4a05ae4f149f"

--000000000000944f4a05ae4f149f
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Do you think we could make all these generic? Visualization tools will need
to do some processing so these can be neatly presented and it could be far
more convenient if people wouldn't need to add code for each GPU driver.

Maybe we could put all these tracepoints in DRM core as they seem useful to
all drivers?

Thanks,

Tomeu

On Tue, 1 Sep 2020 at 17:41, Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>
> Various extra tracepoints that I've been collecting.
>
> Rob Clark (3):
>   drm/msm/gpu: Add GPU freq_change traces
>   drm/msm: Convert shrinker msgs to tracepoints
>   drm/msm/gpu: Add suspend/resume tracepoints
>
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c  |  3 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c  |  4 ++
>  drivers/gpu/drm/msm/msm_gem_shrinker.c |  5 +-
>  drivers/gpu/drm/msm/msm_gpu.c          |  4 ++
>  drivers/gpu/drm/msm/msm_gpu_trace.h    | 83 ++++++++++++++++++++++++++
>  5 files changed, 97 insertions(+), 2 deletions(-)
>
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--000000000000944f4a05ae4f149f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">Hi Rob,</div><div class=3D"gmail_default" style=3D"font-family=
:monospace,monospace"><br></div><div class=3D"gmail_default" style=3D"font-=
family:monospace,monospace">Do you think we could make all these generic? V=
isualization tools will need to do some processing so these can be neatly p=
resented and it could be far more convenient if people wouldn&#39;t need to=
 add code for each GPU driver.</div><div class=3D"gmail_default" style=3D"f=
ont-family:monospace,monospace"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:monospace,monospace">Maybe we could put all these tracepoi=
nts in DRM core as they seem useful to all drivers?</div><div class=3D"gmai=
l_default" style=3D"font-family:monospace,monospace"><br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace">Thanks,</div><=
div class=3D"gmail_default" style=3D"font-family:monospace,monospace"><br><=
/div><div class=3D"gmail_default" style=3D"font-family:monospace,monospace"=
>Tomeu<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 1 Sep 2020 at 17:41, Rob Clark &lt;<a href=3D"mailt=
o:robdclark@gmail.com">robdclark@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">From: Rob Clark &lt;<a href=3D"ma=
ilto:robdclark@chromium.org" target=3D"_blank">robdclark@chromium.org</a>&g=
t;<br>
<br>
Various extra tracepoints that I&#39;ve been collecting.<br>
<br>
Rob Clark (3):<br>
=C2=A0 drm/msm/gpu: Add GPU freq_change traces<br>
=C2=A0 drm/msm: Convert shrinker msgs to tracepoints<br>
=C2=A0 drm/msm/gpu: Add suspend/resume tracepoints<br>
<br>
=C2=A0drivers/gpu/drm/msm/adreno/a6xx_gmu.c=C2=A0 |=C2=A0 3 +<br>
=C2=A0drivers/gpu/drm/msm/adreno/a6xx_gpu.c=C2=A0 |=C2=A0 4 ++<br>
=C2=A0drivers/gpu/drm/msm/msm_gem_shrinker.c |=C2=A0 5 +-<br>
=C2=A0drivers/gpu/drm/msm/msm_gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 4 ++<br>
=C2=A0drivers/gpu/drm/msm/msm_gpu_trace.h=C2=A0 =C2=A0 | 83 +++++++++++++++=
+++++++++++<br>
=C2=A05 files changed, 97 insertions(+), 2 deletions(-)<br>
<br>
-- <br>
2.26.2<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a><br>
</blockquote></div>

--000000000000944f4a05ae4f149f--

--===============1128752074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1128752074==--
