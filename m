Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD33D514D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 04:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E604B6E53C;
	Mon, 26 Jul 2021 02:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F506E53C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 02:36:03 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 z3-20020a4a98430000b029025f4693434bso1885625ooi.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 19:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=C8A6HcM++wep6KAAmRys8qmioTmOstzNOR/tiSRazoc=;
 b=BhRVKW0Bt60eRAIIsM4/IyIB+ukURdPAJx+xxhbYpE7wHrJQ0vtJAGe4kyjQcYc0Pc
 Q2Ai3Egq2KQOUOlFP1HZDih3/jSDfawWs/NB50pgKS4tWPQqMuY5E84TtBkR+Tbhzx0X
 UbvfrQIX5o7jTanojhB8HkjsuvTATOtyTbeVWeAAmoaii69GpWhIGSV91lCgHxJnPa7Y
 6cSWcIjjtgxuQ264uj6JMlsoIITcMPyxBjuZD08BBYii2mUxd5oHCJfqTe3kmOZmslm9
 w0Pytfnm0F3/jLkeyHzvY6HkldVt2+9G2XXUph6UBCXmsqikB/oGUCVSLIYbJw0jLs+y
 khqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=C8A6HcM++wep6KAAmRys8qmioTmOstzNOR/tiSRazoc=;
 b=aqiUZ9btzTjmi2Y1bANwytikFDAX1aPacDiXdzJQjf9EZCgg6FBkcgoAahZDfYbaEY
 cG6uBFpPYu5uCEuxO4keW9KNOcaDM4U7Hz1A798tW8/673nvZFROuVxVgeyNGTjiMFhP
 dbYKOf7xKLhs5UFxmlAXakvmwWMvhlhqR12A3pzsal/xDtl7OgkWDyYELa2GZ6lcHHfg
 ltNvYffb/2f+0no4RLkK5V7wm/8Zx+I7U53HDzYjFlcRkKhZ1hnNp+pZ+1I2Q/MZzbHM
 6PPfXNtiju2t1AkHm06A/3blmr0ZC80tpiHqoxZXuW4wBvAavKROGgROZJK6PW3MfxDE
 DlAg==
X-Gm-Message-State: AOAM530ymPWzhsqkswvNVX2OM1Z3kq1oJIp8wIyhMmUdXI7yjSz24rSD
 PKGQoDiag8ym+mcvuNYAEeAilpv+QcCbn78Ny4k=
X-Google-Smtp-Source: ABdhPJwITFhXUo4kX7wbncEf4RqipXNxSi71ex+6mujZPJM616Su4cICThOsM33Gvikc0Kq9OkqbBD2x4AD06Cd5gmY=
X-Received: by 2002:a4a:8687:: with SMTP id x7mr9182612ooh.46.1627266963070;
 Sun, 25 Jul 2021 19:36:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:4a:0:0:0:0:0 with HTTP;
 Sun, 25 Jul 2021 19:36:01 -0700 (PDT)
In-Reply-To: <20210615172153.2839275-1-weiyongjun1@huawei.com>
References: <20210615172153.2839275-1-weiyongjun1@huawei.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 26 Jul 2021 11:36:01 +0900
Message-ID: <CAAQKjZN_HsRW0wvHnm9hE-kjNORN4Lc+CYoT=JfseCynmmrbHg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/exynos: g2d: fix missing unlock on error in
 g2d_runqueue_worker()
To: Wei Yongjun <weiyongjun1@huawei.com>
Content-Type: multipart/alternative; boundary="00000000000049e11205c7fd9d94"
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hulk Robot <hulkci@huawei.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000049e11205c7fd9d94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for late and thanks for fixing it.

Thanks,
Inki Dae

2021=EB=85=84 6=EC=9B=94 16=EC=9D=BC =EC=88=98=EC=9A=94=EC=9D=BC, Wei Yongj=
un <weiyongjun1@huawei.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> Add the missing unlock before return from function g2d_runqueue_worker()
> in the error handling case.
>
> Fixes: 445d3bed75de ("drm/exynos: use pm_runtime_resume_and_get()")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index cab4d2c370a7..0ed665501ac4 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -897,13 +897,14 @@ static void g2d_runqueue_worker(struct work_struct
> *work)
>                         ret =3D pm_runtime_resume_and_get(g2d->dev);
>                         if (ret < 0) {
>                                 dev_err(g2d->dev, "failed to enable G2D
> device.\n");
> -                               return;
> +                               goto out;
>                         }
>
>                         g2d_dma_start(g2d, g2d->runqueue_node);
>                 }
>         }
>
> +out:
>         mutex_unlock(&g2d->runqueue_mutex);
>  }
>
>
>

--00000000000049e11205c7fd9d94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for late and thanks for fixing it.<div><br></div><div>Thanks,</div><d=
iv>Inki Dae<br><br>2021=EB=85=84 6=EC=9B=94 16=EC=9D=BC =EC=88=98=EC=9A=94=
=EC=9D=BC, Wei Yongjun &lt;<a href=3D"mailto:weiyongjun1@huawei.com">weiyon=
gjun1@huawei.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Add the missing unlock before return from function g2=
d_runqueue_worker()<br>
in the error handling case.<br>
<br>
Fixes: 445d3bed75de (&quot;drm/exynos: use pm_runtime_resume_and_get()&quot=
;)<br>
Reported-by: Hulk Robot &lt;<a href=3D"mailto:hulkci@huawei.com">hulkci@hua=
wei.com</a>&gt;<br>
Signed-off-by: Wei Yongjun &lt;<a href=3D"mailto:weiyongjun1@huawei.com">we=
iyongjun1@huawei.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/exynos/exynos_<wbr>drm_g2d.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/exynos/<wbr>exynos_drm_g2d.c b/drivers/gpu/drm=
/exynos/<wbr>exynos_drm_g2d.c<br>
index cab4d2c370a7..0ed665501ac4 100644<br>
--- a/drivers/gpu/drm/exynos/<wbr>exynos_drm_g2d.c<br>
+++ b/drivers/gpu/drm/exynos/<wbr>exynos_drm_g2d.c<br>
@@ -897,13 +897,14 @@ static void g2d_runqueue_worker(struct work_struct *w=
ork)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D pm_runtime_resume_and_get(g2d-<wbr>&gt;dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (ret &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(g2d-&gt;dev, &quot;failed to=
 enable G2D device.\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 g2d_dma_start(g2d, g2d-&gt;runqueue_node);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+out:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&amp;g2d-&gt;runqueue_<wbr>mutex);=
<br>
=C2=A0}<br>
<br>
<br>
</blockquote></div>

--00000000000049e11205c7fd9d94--
