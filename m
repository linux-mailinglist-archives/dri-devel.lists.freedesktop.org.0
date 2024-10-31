Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4EF9B8647
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 23:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C31710E0AB;
	Thu, 31 Oct 2024 22:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ecjK++5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B911810E0AB
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 22:49:35 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb4fa17044so15618201fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 15:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730414974; x=1731019774;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yj01KL78/mIsWSGjeAC3gx6GkNBZqk76+FeJua79mhM=;
 b=ecjK++5LPwg1vUlp3d1I9yZmXQ2BKovcBABreyjNxTSQ83JYAIJLlXf7X7wxtLwpHf
 6rWfVSIsUAvw8Vm5XJ/xuUiHCnDGwyHW+tCXtTcr+80c/nI/7pcIvZNqQ26Mc2I7ZjKK
 sZvIREftKsVwRjQMoG/dnI5rxYvFQSJ2Gj6k6UytcZzHwc2JUSYIoAboC16fGux6pJOb
 SSxWEYvk3R8JJZ+/k7A/AH20VV2JAO932n7JYmA1aL0xmwZ7dvxAQmeTsjztqsLXtU2L
 oEaZpHq0Eq9izwRuCg46I9Wa6o5WZ+KMR4XtT8kztVKc73HoHEB+UXfp7Daqt79NJLb4
 MOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730414974; x=1731019774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yj01KL78/mIsWSGjeAC3gx6GkNBZqk76+FeJua79mhM=;
 b=YUlFCUpaesR+RcCwNKct3THDECTE1as3VauyN8gsv26z4+Dfdva2YczYuqczBUN3Zh
 Qo2BCMWWGwsKQkuVDOc7RqJ1+8f4UInrUgrHgnwti4LsKUYQSmzKO+npntgPN6iCeANH
 Fe5z+MrN5vMfELrdtp9aF0RnjIbdzW0l7LaFHtxxvzBzqYYvsghN5qUzbdIgohEJzChI
 UJMdZAVyZD0Vw6ILfd+BAP+E7AZ4iKzam7k6Bm4ELY/Ndoyl0qQUrvjs7tJpxQfHlGkD
 Wn58Shcpn3Ug2UuYBsapHoHTZhta9rnZh4vbg7Drdck2TsGaw13XyoIRcWZoDFDaEfXY
 NuqQ==
X-Gm-Message-State: AOJu0Ywr7js3U7+GG6XgY/e5p9opYdo3aXCK8oiJl5IEiexCv+LshiuZ
 IvZvSvXDUuFbZSWUR99OSjdueV/dxo8N5w444RVW9C6K3BkhBzO9kEfYMNQ/kLujrcBIBeFNXVy
 YGsrHFmqegTVjsjwonktOcTaLoj3z5Szeoc+h
X-Google-Smtp-Source: AGHT+IFdDWtuwJtRFgf8gczzRuWv3VxICMzUz4mESUvq8xudrcH6fo9iqKDBy3tXwjgOYlLrxQC1gi1fdt/MF3Jy89Y=
X-Received: by 2002:a2e:a586:0:b0:2fb:5ebe:ed40 with SMTP id
 38308e7fff4ca-2fedb781c43mr9237011fa.15.1730414973309; Thu, 31 Oct 2024
 15:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241029144305.2911711-1-robbarnes@google.com>
 <upxsvozu33vh2jpliq7kigp6a62vkibrohi3f7e4arfptptard@44afro6gchfs>
In-Reply-To: <upxsvozu33vh2jpliq7kigp6a62vkibrohi3f7e4arfptptard@44afro6gchfs>
From: Rob Barnes <robbarnes@google.com>
Date: Thu, 31 Oct 2024 16:48:54 -0600
Message-ID: <CA+Dqm32c_-3yPUn26z3EaYdQ3tw69T224jfYqupBqEzidi7Vag@mail.gmail.com>
Subject: Re: [PATCH libdrm] modetest: Make modetest availble to vendor on
 Android
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, sukoo@google.com
Content-Type: multipart/alternative; boundary="000000000000cceac60625cda1da"
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

--000000000000cceac60625cda1da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This change was merged in
https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/399.

On Thu, Oct 31, 2024 at 1:32=E2=80=AFPM Dmitry Baryshkov <
dmitry.baryshkov@linaro.org> wrote:

> On Tue, Oct 29, 2024 at 02:43:05PM +0000, Rob Barnes wrote:
> > Make modetest available to vendors on Android. libdrm_util and
> > libdrm_test_headers is also made available to vendors since these are
> > depenencies of modetest. This results in the module target
> > modetest.vendor being availble to vendor modules.
> >
> > Signed-off-by: Rob Barnes <robbarnes@google.com>
> > ---
> >  tests/Android.bp          | 1 +
> >  tests/modetest/Android.bp | 1 +
> >  tests/util/Android.bp     | 1 +
> >  3 files changed, 3 insertions(+)
> >
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> --
> With best wishes
> Dmitry
>

--000000000000cceac60625cda1da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This change was merged in=C2=A0<a href=3D"https://gitlab.f=
reedesktop.org/mesa/drm/-/merge_requests/399">https://gitlab.freedesktop.or=
g/mesa/drm/-/merge_requests/399</a>.=C2=A0</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 31, 2024 at 1:32=E2=
=80=AFPM Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.org=
">dmitry.baryshkov@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Tue, Oct 29, 2024 at 02:43:05PM +0000, Rob =
Barnes wrote:<br>
&gt; Make modetest available to vendors on Android. libdrm_util and<br>
&gt; libdrm_test_headers is also made available to vendors since these are<=
br>
&gt; depenencies of modetest. This results in the module target<br>
&gt; modetest.vendor being availble to vendor modules.<br>
&gt; <br>
&gt; Signed-off-by: Rob Barnes &lt;<a href=3D"mailto:robbarnes@google.com" =
target=3D"_blank">robbarnes@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/Android.bp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 tests/modetest/Android.bp | 1 +<br>
&gt;=C2=A0 tests/util/Android.bp=C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 3 files changed, 3 insertions(+)<br>
&gt; <br>
<br>
Acked-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.or=
g" target=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div>

--000000000000cceac60625cda1da--
