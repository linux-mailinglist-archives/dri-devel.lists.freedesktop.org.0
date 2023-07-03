Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38B5745403
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 05:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B62510E081;
	Mon,  3 Jul 2023 03:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7678310E081
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 03:01:10 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc0609cd6so37048345e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 20:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688353266; x=1690945266;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U8ad13yyafQrAvVdCshOeZZNLSGLnY4fYSfi1Iu/epo=;
 b=M5xt8wly2yvlWD2fyR6yCu66260n4SAGISL+cJ4ha8dvy6VxsqNr54myZM0vJhMUqT
 L1KDtBZ8+IyQKAQgQhC6AJQeAzjXvnk55pYvVsxXCc5/TAEt/BMCyj0pnvi0UWID+gVy
 zGMcBHfQVunkAf8cIBKfisAdMgYdvB4OXcQ4W2kAc+qmWfvLiJYtD2+gNDEBVp+Hp6QD
 ZiX8Q5kUF4UVHKa0GwTHy8k2Xzw2jekXDcMi3Mm5ATW141YURCC7kzpNvwFXzofGRHWj
 oFGfLE+JmGwk0/vma/Ca/ZXOQmXdG1JNmZ1D93exSB6d8vv4CsBFUbapqYPG4YuRlKix
 Xy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688353266; x=1690945266;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U8ad13yyafQrAvVdCshOeZZNLSGLnY4fYSfi1Iu/epo=;
 b=CBc+XrjrA0kTJVJ2Ux0d9A3cNfpK9qkCGXfePB2sishmpHMx3cKEzmUgpRhACs0Ka3
 owWYa04ebmSpQ8i246dBAuhmYWcYZN5C109p4mwQaMiSZPx1AbuaAntkDIXuC7rNfgUF
 fTDUDDk6uHYgPX767Ju8eL7u+zoywVhQbEv46wYamjVpKE+nvaTpwqV+Vl6opAJ0PxMd
 CGHR1ZdQ2ycmbTSFxFDSAwRa4SOslfHm2MFMuqsaCTDap1DxnVE8YY9+CMefulOe9i1Y
 3kAgI29IqvxFzBi6EvcjVuMr04VUrdjgpmSjJcyseruvSq/7EFCCi0DYlJ5zv3v+XP0M
 rdcQ==
X-Gm-Message-State: ABy/qLZ3FwZGgGsMcHwOWFnTppwDSXh/2QzYHNoh0xlBLFJeTfdyfr36
 CiTg/ctpOwvHzNjhFlHdiGe4hECLZeUVuHi2OXE=
X-Google-Smtp-Source: APBJJlFHYt4WLEP3MU3ZOefn9uCUXTA5wGEhLJhUJImc/ObWYEOIxutMryuLPPOeFJIu6N7TXAEIM66iqKSRXklBwqg=
X-Received: by 2002:adf:e9c2:0:b0:313:e9d7:108f with SMTP id
 l2-20020adfe9c2000000b00313e9d7108fmr6676102wrn.33.1688353266296; Sun, 02 Jul
 2023 20:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230630021906.1035115-1-islituo@gmail.com>
 <207f70b5-e017-33bc-bf46-206b3fb69a04@linaro.org>
In-Reply-To: <207f70b5-e017-33bc-bf46-206b3fb69a04@linaro.org>
From: Tuo Li <islituo@gmail.com>
Date: Mon, 3 Jul 2023 11:00:56 +0800
Message-ID: <CADm8Ten-1yBdQFaETvS19j=_UFC4GEJqH38DU=7xPXLkOnvvzg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fix a possible null-pointer dereference due
 to data race in exynos_drm_crtc_atomic_disable()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b16b0f05ff8c6061"
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
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kyungmin.park@samsung.com, alim.akhtar@samsung.com, baijiaju1990@outlook.com,
 linux-arm-kernel@lists.infradead.org, BassCheck <bass@buaa.edu.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b16b0f05ff8c6061
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks for your reply! The report is publicly available at
https://sites.google.com/view/basscheck/home. And this
patch is from the 8th report on this website.

Thanks,
Tuo Li

On Sat, Jul 1, 2023 at 4:01=E2=80=AFPM Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 30/06/2023 04:19, Tuo Li wrote:
> > The variable crtc->state->event is often protected by the lock
> > crtc->dev->event_lock when is accessed. However, it is accessed as a
> > condition of an if statement in exynos_drm_crtc_atomic_disable() withou=
t
> > holding the lock:
> >
> >   if (crtc->state->event && !crtc->state->active)
> >
> > However, if crtc->state->event is changed to NULL by another thread rig=
ht
> > after the conditions of the if statement is checked to be true, a
> > null-pointer dereference can occur in drm_crtc_send_vblank_event():
> >
> >   e->pipe =3D pipe;
> >
> > To fix this possible null-pointer dereference caused by data race, the
> > spin lock coverage is extended to protect the if statement as well as
> the
> > function call to drm_crtc_send_vblank_event().
> >
> > Reported-by: BassCheck <bass@buaa.edu.cn>
>
> I cannot find this report. This is an open source work and public
> collaboration. The "Reported-by" usually means that the issue was
> reported to us, in some way, usually in public. Can we see the report?
> Otherwise adding non-public, non-verifiable reports is useless and
> clutters our report-credit-system.
>
> Best regards,
> Krzysztof
>
>

--000000000000b16b0f05ff8c6061
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>Thanks for your reply! The repor=
t is publicly=C2=A0available=C2=A0at=C2=A0</div><div><a href=3D"https://sit=
es.google.com/view/basscheck/home">https://sites.google.com/view/basscheck/=
home</a>. And this</div><div>patch is from the 8th report on this website.<=
/div><div><br></div><div>Thanks,</div><div>Tuo Li</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 1, 2023 =
at 4:01=E2=80=AFPM Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozl=
owski@linaro.org">krzysztof.kozlowski@linaro.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On 30/06/2023 04:19, Tuo Li=
 wrote:<br>
&gt; The variable crtc-&gt;state-&gt;event is often protected by the lock <=
br>
&gt; crtc-&gt;dev-&gt;event_lock when is accessed. However, it is accessed =
as a <br>
&gt; condition of an if statement in exynos_drm_crtc_atomic_disable() witho=
ut<br>
&gt; holding the lock:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0if (crtc-&gt;state-&gt;event &amp;&amp; !crtc-&gt;state-&g=
t;active)<br>
&gt; <br>
&gt; However, if crtc-&gt;state-&gt;event is changed to NULL by another thr=
ead right<br>
&gt; after the conditions of the if statement is checked to be true, a<br>
&gt; null-pointer dereference can occur in drm_crtc_send_vblank_event():<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0e-&gt;pipe =3D pipe;<br>
&gt; <br>
&gt; To fix this possible null-pointer dereference caused by data race, the=
 <br>
&gt; spin lock coverage is extended to protect the if statement as well as =
the <br>
&gt; function call to drm_crtc_send_vblank_event().<br>
&gt; <br>
&gt; Reported-by: BassCheck &lt;<a href=3D"mailto:bass@buaa.edu.cn" target=
=3D"_blank">bass@buaa.edu.cn</a>&gt;<br>
<br>
I cannot find this report. This is an open source work and public<br>
collaboration. The &quot;Reported-by&quot; usually means that the issue was=
<br>
reported to us, in some way, usually in public. Can we see the report?<br>
Otherwise adding non-public, non-verifiable reports is useless and<br>
clutters our report-credit-system.<br>
<br>
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div>

--000000000000b16b0f05ff8c6061--
