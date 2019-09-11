Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C740B0946
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89F16EBE2;
	Thu, 12 Sep 2019 07:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366AD6E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 17:37:51 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id g11so7074003uak.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 10:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p33Mid5tC+gZKbvhSmzXfsnDTIxyk2PvEabCehtjKwk=;
 b=VW+hljhCxYhryQreGkor7icdH+Sfma2cWYYVq4XcH4v5HDZUjyL4l1dXzV8krSt2ng
 GZcHIlmwfh+eLAxgH94Lo6WpHi2GPdCrsBCS2b/DTabinZLe5wlySO44tl90nfk4IvC4
 JUt8u84tvlYvMNwALo90B1Dbvl4WmnVLDeoAm2I3N/QeHk5yXKxZUrCiBvrqDqSjRt8p
 XuBsF8aPIqADyOe8HpOtxTlc+7JXzb1bbEyWfub46VQWZVyrOs6Px37yq/W60ZdRxbxk
 jNpS20vu3MQ8SasbHrV/81+bBcPWtb3u8qoBMyK6kgrbTjLrdO+Z9Xjl6FiDWGB19ck3
 iuxw==
X-Gm-Message-State: APjAAAXvqCDiv0lwGJSYcpd4rSpFSr5oGhmeEg87QWk/uBGmXD4P5pV3
 fULkuEntN/TSZ81y+qdea95JnCB9KDz0GaJ+6LSONw==
X-Google-Smtp-Source: APXvYqyhc453lvhVHxYtjIj5TrljnnTStpL3H94a9pggA4kWdWcwKY6jxjfNPyaVWE/+4r6pi2de5yp9c7C6+VAwcBQ=
X-Received: by 2002:ab0:915:: with SMTP id w21mr18465604uag.30.1568223470575; 
 Wed, 11 Sep 2019 10:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190911173453.958-1-cai@lca.pw>
In-Reply-To: <20190911173453.958-1-cai@lca.pw>
From: Maxime Ripard <maxime.ripard@anandra.org>
Date: Wed, 11 Sep 2019 19:37:40 +0200
Message-ID: <CAO4ZVTMUMKMOqef5yV=5bwHLXLMsNtTegGGMkw0GbFaDHvrV6g@mail.gmail.com>
Subject: Re: [RFC PATCH] gpu: no need to compile drm/ if CONFIG_DRM=n
To: Qian Cai <cai@lca.pw>
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anandra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=p33Mid5tC+gZKbvhSmzXfsnDTIxyk2PvEabCehtjKwk=;
 b=ng/BhFh13SlPkYXJxY7MXO5oS76g/aSJBGdaqUW6KBbrp0Oj3onfaMWg/CG7Lpb7YM
 SVHZuAX8jvp88Zpwfhtc8XBV/Q2DrwBXaw4ihGFxHXspzFTEP5hmzkqto/+rq2LnIMow
 5LrpvpzerheGrNMaGZpoAPaJJALF1MiQKRU8fP7TXam3QNAxnqY9CXoOT8+GQwo9gTo/
 +qd47fC5jTYKNm9BBVl1WyY50MX1LccNR/NxP+Amkb53M7hxu8K89CbZHL1W8J9gjqOm
 P2AO8P+JJ/f1yYuYa6FAPRIFLxSRF5ZkXfbwi0+RZkDrtjJM2L+Zmvpgf3Ory6/Crof6
 w3xQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, airlied@linux.ie,
 emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yamada.masahiro@socionext.com,
 mripard@kernel.org, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============0348530511=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0348530511==
Content-Type: multipart/alternative; boundary="000000000000e471e105924a7a7d"

--000000000000e471e105924a7a7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mer. 11 sept. 2019 =C3=A0 19:35, Qian Cai <cai@lca.pw> a =C3=A9crit :

> The commit c0e09200dc08 ("drm: reorganise drm tree to be more future
> proof.") changed the behavior from only compiling drm/ if CONFIG_DRM=3Dy
> to always compiling drm/. This restores the behavior, so people don't
> need to waste time compiling stuff they don't need.
>
> Fixes: c0e09200dc08 ("drm: reorganise drm tree to be more future proof.")


You are missing your signed-off-by

Thanks,
Maxime

--000000000000e471e105924a7a7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Hi,</div></div><div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 11 sept. 2019 =C3=A0 19:3=
5, Qian Cai &lt;<a href=3D"mailto:cai@lca.pw">cai@lca.pw</a>&gt; a =C3=A9cr=
it=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">The commit c0e09200dc08 (=
&quot;drm: reorganise drm tree to be more future<br>
proof.&quot;) changed the behavior from only compiling drm/ if CONFIG_DRM=
=3Dy<br>
to always compiling drm/. This restores the behavior, so people don&#39;t<b=
r>
need to waste time compiling stuff they don&#39;t need.<br>
<br>
Fixes: c0e09200dc08 (&quot;drm: reorganise drm tree to be more future proof=
.&quot;)</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">You are =
missing your signed-off-by</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thanks,</div><div dir=3D"auto">Maxime</div></div></div>

--000000000000e471e105924a7a7d--

--===============0348530511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0348530511==--
