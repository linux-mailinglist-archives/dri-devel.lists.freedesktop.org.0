Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F9081ADEE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E7210E5FB;
	Thu, 21 Dec 2023 04:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E20C10E5FB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 04:27:29 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-781120575f5so24182585a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 20:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703132848; x=1703737648; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H7K5s6fu04iVE3Ebxj67Sj1N1expEggq/h+TsqcjbD0=;
 b=VGOJI4mgON4GlAxQ2V+CVRI+CYY6gEX8y0/VkC6dHbLEpnVBCcMuIIAtZOxX+jmkUP
 hGWR/Hn97hVvASbXvu+9P44uHUtGhTc2swk5ViipuqGamNrUrsq1dmFjg3iMvZJwYdFU
 KkQuOfnOP/7BLIbsCfAJY5VCBJ+eHf7VWNOtfyVG1Tt9LnvAxbBkmefrrS1ff7wLObPb
 CCifiqQbgK5XQwUip73B5zy6didK2W1mAcmr0bouOLp5H9wdLCedOLRV/mSFUlPRGQUm
 5JoFqMHjZqzOZPvetuN+Crcs/yghjY76YLInX+gfZwmo6L+ThVNkLXo3lDMseNn7js0e
 +sVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703132848; x=1703737648;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H7K5s6fu04iVE3Ebxj67Sj1N1expEggq/h+TsqcjbD0=;
 b=hEGg0Ognq3+IjL4EvhI2t0k+ZbfoCdPat3dFL7+zrM+dzFDgEnxXfyrz3jNmVdgFx8
 hd1JjJkbLXDjLS00zA8k2FMyexdPa+L0wyPuONQ+pYCuLWasabMRJA+BA3Nt2v2cpKDh
 6F7h4kmn5NyGvtmuCzIURdakj0BHv1rsS/gD3dejg4rNraA3K8zdrltzsUttxMODhOIc
 nL2wGHaY7jBQ1Mp4uvM3OT/r4vSpIczd/+/ZIYmqaR5LNWdLmXyv2CbxUJ4rkQZU1TZE
 on7QpeTh+9Tq1jk2PENQ/iZUpw5T7SdSrNhqu/JOFMRdTaTPnNqhoRdTO+Nw/BxYfO8W
 ltvA==
X-Gm-Message-State: AOJu0Yy7fLZRiWmQM61TDXzAV1QDOr7WDdp+3JQIn4ch3WVs1cCqUgHJ
 G/07ATUrp/9FxvGdWZ9IYSH+MD6YAFv4AAsh/Q4=
X-Google-Smtp-Source: AGHT+IEL7lMXxi7sA+3vt5Txnw/81HEv6Zd0mAbWI5HgM5WHtqMVmwmVyPD0+7S48c2K0MoRXfI0OXYF/u2r/TvTCmA=
X-Received: by 2002:a05:620a:1a08:b0:77e:fba3:81bf with SMTP id
 bk8-20020a05620a1a0800b0077efba381bfmr25347757qkb.85.1703132848274; Wed, 20
 Dec 2023 20:27:28 -0800 (PST)
MIME-Version: 1.0
References: <CGME20231220095336eucas1p1f6cec297f84463fbf50a875cc0fb64f6@eucas1p1.samsung.com>
 <20231220095316.23098-1-pchelkin@ispras.ru>
 <111adf74-5239-420a-880c-be92a2f663fd@samsung.com>
In-Reply-To: <111adf74-5239-420a-880c-be92a2f663fd@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Thu, 21 Dec 2023 13:27:17 +0900
Message-ID: <CAAQKjZNPifME2MT_wguc==EpmUAo_v5=NWs4Ab0ZdbeMpG2MfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: gsc: minor fix for loop iteration in
 gsc_runtime_resume
To: Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/alternative; boundary="0000000000006d4029060cfd849d"
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
Cc: linux-samsung-soc@vger.kernel.org, lvc-project@linuxtesting.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Fedor Pchelkin <pchelkin@ispras.ru>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000006d4029060cfd849d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2023=EB=85=84 12=EC=9B=94 20=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 7:45, =
Marek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:

> On 20.12.2023 10:53, Fedor Pchelkin wrote:
> > Do not forget to call clk_disable_unprepare() on the first element of
> > ctx->clocks array.
> >
> > Found by Linux Verification Center (linuxtesting.org).
> >
> > Fixes: 8b7d3ec83aba ("drm/exynos: gsc: Convert driver to IPP v2 core
> API")
> > Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
>

Applied.

Thanks,
Inki Dae

> ---
> >   drivers/gpu/drm/exynos/exynos_drm_gsc.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> > index 34cdabc30b4f..5302bebbe38c 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> > @@ -1342,7 +1342,7 @@ static int __maybe_unused
> gsc_runtime_resume(struct device *dev)
> >       for (i =3D 0; i < ctx->num_clocks; i++) {
> >               ret =3D clk_prepare_enable(ctx->clocks[i]);
> >               if (ret) {
> > -                     while (--i > 0)
> > +                     while (--i >=3D 0)
> >                               clk_disable_unprepare(ctx->clocks[i]);
> >                       return ret;
> >               }
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
>

--0000000000006d4029060cfd849d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">2023=EB=85=84 12=EC=9B=94 20=EC=9D=BC (=EC=88=98) =EC=
=98=A4=ED=9B=84 7:45, Marek Szyprowski &lt;<a href=3D"mailto:m.szyprowski@s=
amsung.com">m.szyprowski@samsung.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On 20.12.2023 10:53, Fedor =
Pchelkin wrote:<br>
&gt; Do not forget to call clk_disable_unprepare() on the first element of<=
br>
&gt; ctx-&gt;clocks array.<br>
&gt;<br>
&gt; Found by Linux Verification Center (<a href=3D"http://linuxtesting.org=
" rel=3D"noreferrer noreferrer" target=3D"_blank">linuxtesting.org</a>).<br=
>
&gt;<br>
&gt; Fixes: 8b7d3ec83aba (&quot;drm/exynos: gsc: Convert driver to IPP v2 c=
ore API&quot;)<br>
&gt; Signed-off-by: Fedor Pchelkin &lt;<a href=3D"mailto:pchelkin@ispras.ru=
" target=3D"_blank" rel=3D"noreferrer">pchelkin@ispras.ru</a>&gt;<br>
Reviewed-by: Marek Szyprowski &lt;<a href=3D"mailto:m.szyprowski@samsung.co=
m" target=3D"_blank" rel=3D"noreferrer">m.szyprowski@samsung.com</a>&gt;<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">App=
lied.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div =
dir=3D"auto">Inki Dae</div><div dir=3D"auto"><br></div><div dir=3D"auto"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/exynos/exynos_drm_gsc.c | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm=
/exynos/exynos_drm_gsc.c<br>
&gt; index 34cdabc30b4f..5302bebbe38c 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c<br>
&gt; @@ -1342,7 +1342,7 @@ static int __maybe_unused gsc_runtime_resume(str=
uct device *dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ctx-&gt;num_clocks; i++=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prep=
are_enable(ctx-&gt;clocks[i]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0while (--i &gt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0while (--i &gt;=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(ctx-&gt;cloc=
ks[i]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Best regards<br>
-- <br>
Marek Szyprowski, PhD<br>
Samsung R&amp;D Institute Poland<br>
<br>
</blockquote></div></div></div>

--0000000000006d4029060cfd849d--
