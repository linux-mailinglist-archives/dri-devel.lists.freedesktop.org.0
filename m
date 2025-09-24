Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C12B99959
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 13:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A26110E6FD;
	Wed, 24 Sep 2025 11:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MbSkcM9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C51610E707
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 11:32:00 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5688ac2f39dso7762178e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 04:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758713518; x=1759318318; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oys5quViuvxnIqAu3kdxxzwNACJdrE+Sn1HRv1hkjcM=;
 b=MbSkcM9KnZHyajxwc+lv6zDn3fXmKJROEm7djeLCNeJvDwIoHjgTjxmCc3gYOKk+Pt
 jkjmdsQt3iYpkC3wtWXC6ilrTRyTRbxgH/eFzv35cA2nbTqKy4XkYX3XamAr2p1s9m9c
 DNdpYiHOVy24bIT2mLI46NGUZftYK61EHXPdO1In6EOMxzTbbLYYXSHtTjaszpuDVJ76
 lQfHDq9oM6cp9XJpJQxJrCMJvinFioqosYcTB7taioczooMvL/x7zrV7yLhIt9V1zjVA
 05cHPE4KrkwE1EV4siuB14JYBmxzh9z1++Gxye++72l01sGKWh+bEsUgt1ergydplq/5
 DSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758713518; x=1759318318;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oys5quViuvxnIqAu3kdxxzwNACJdrE+Sn1HRv1hkjcM=;
 b=hMOs3WCN4zkunVjlno3wmXzJeBMSBf8ZZb8zPp0aM7n1Du5vyy+R7ynWQdjKTnoc5M
 hdzFX85HT3DKN/kqyuM1wlB0UdnM5Cjralcw+9So5q3pDHzvLfY6RzjsLsOAs1PwGjWp
 0DwXyzeYC0pB4UfI2fd/89mX0t6zYJkU0V1wCbGMVeWBO2kefp416Hkr3EpvcgCWBdqf
 BB3sH6yP8MuTGU2HPD4dI0iLCQYayV/CImXzt1W75T7ddf2jBjCM4nBteHJHUw/3niiD
 2jcgUiJpeXCC1xxKGi1rMDTx72HmM8UMN5xk96cbkOqOpu1VWSQ+mu7UTnCN907/uFse
 69SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWktemae7WIgsJbojn3borQ6vg2ZJSas7+oRRzq7L6/JsejSPmZlg1+bqpHHpDDlSQMpkxbC7Scfuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze7nLVeg6ii+xoJERkCZ9nMYDVJNWYYYZNnrMXfkPymivvPCML
 mwwTyMhTGPN1fbIe4USe2rjVeBOAsEq6hK9NXv6U00asDobK8GvWOpqFmncJiI0zIX619H5misQ
 C0gUGHlQhjUNMmorX6I87MZj8Mud3dts=
X-Gm-Gg: ASbGnctTB1C4NiwuxxRLHs5+K5b+oDqwe59iqhFNE17aFqXMX7PcSDGCz4qVi4cqQz3
 3YEB5VrKfIXFUVOoZs0hnwcshQG/V8KnqbPM9bIvse2jN3LeMMXVrpSSVvuuKqLmHjl9vXEW+Rb
 p5P8GTR7yXvunJ71pqLt8CZKb9FC4ro5womwv0WicNSAt25gNZTM7I17M1Wjb8gCkLmTwGHptlE
 t6Tk/mbug==
X-Google-Smtp-Source: AGHT+IFGnbNF6xl8QU22wCnMf96OW2rC6BZjViEKQCcCI330JERQpjmk7Y1WkyWLksH37yb1r23D9aqtqoBYjtk78lA=
X-Received: by 2002:a05:6512:602:10b0:57c:2474:3733 with SMTP id
 2adb3069b0e04-58072efee51mr1942468e87.42.1758713517949; Wed, 24 Sep 2025
 04:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250922144318.26-1-alsp705@gmail.com>
 <4u27n4orhmm4fn6xpxbdayqj3fz22lw3il7wjhtif5fjdyitps@d6i6i52giy4j>
In-Reply-To: <4u27n4orhmm4fn6xpxbdayqj3fz22lw3il7wjhtif5fjdyitps@d6i6i52giy4j>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAIEM=?= <alsp705@gmail.com>
Date: Wed, 24 Sep 2025 14:31:46 +0300
X-Gm-Features: AS18NWA3GcQq-PCLH7vqH8RGnqC7xHh47aSrZeZvhh0x_Jf8cuRbuDXEZZ7U7ho
Message-ID: <CAGMq1902iw=PWd=zHjoRgRd4pF9LWTX_mccQHinFMs5W_cGvxw@mail.gmail.com>
Subject: Re: [PATCH 5.10] gpu/i915: fix error return in mmap_offset_attach()
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: multipart/alternative; boundary="0000000000007fc8f2063f8a66bc"
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

--0000000000007fc8f2063f8a66bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof Karas,

Ignored (unchecked) return values from functions that can fail.
While a single unchecked return may look harmless, in aggregate they create
a broad
attack surface =E2=80=94 a latent, easily-exploitable category of vulnerabi=
lities
that can lead to data corruption,
denial-of-service, or privilege escalation when error conditions are hit in
the field.

Counter example:  /drivers/gpu/drm/drm_prime.c:748:
ret =3D drm_vma_node_allow(&obj->vma_node, priv);
    if (ret)
        goto out;

Counter example:  /drivers/gpu/drm/drm_gem.c:387:
ret =3D drm_vma_node_allow(&obj->vma_node, file_priv);
    if (ret)
        goto err_remove;

Best Regards,
Alexandr

=D0=B2=D1=82, 23 =D1=81=D0=B5=D0=BD=D1=82. 2025=E2=80=AF=D0=B3. =D0=B2 12:0=
7, Krzysztof Karas <krzysztof.karas@intel.com>:

> Hi Alexandr,
>
> > Return value of function 'drm_vma_node_allow', called
> > at i915_gem_mman.c:670, is not checked, but it is usually
> > checked for this function
> Grepping for this function in the repo tells me this is currently
> the only place we call it. I'd rephrase the commit message to focus
> only on missing return code.
>
> After that:
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> --
> Best Regards,
> Krzysztof
>

--0000000000007fc8f2063f8a66bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Krzysztof Karas,</div><br><div>
<div>Ignored (unchecked) return values from functions that can fail.=C2=A0<=
br>While a single unchecked return may look harmless, in aggregate they cre=
ate a broad <br>attack surface =E2=80=94 a latent, easily-exploitable categ=
ory of vulnerabilities that can lead to data corruption, <br>denial-of-serv=
ice, or privilege escalation when error conditions are hit in the field.<br=
><br></div>

Counter example:=C2=A0
/drivers/gpu/drm/drm_prime.c:748:<br>
<div style=3D"color:rgb(212,212,212);background-color:rgb(47,52,60);font-fa=
mily:Consolas,&quot;Courier New&quot;,monospace;font-weight:normal;font-siz=
e:12px;line-height:16px;white-space:pre"><div><span style=3D"color:rgb(212,=
212,212)">ret </span><span style=3D"color:rgb(220,220,220)">=3D</span><span=
 style=3D"color:rgb(212,212,212)"> drm_vma_node_allow</span><span style=3D"=
color:rgb(220,220,220)">(&amp;</span><span style=3D"color:rgb(212,212,212)"=
>obj-&gt;vma_node</span><span style=3D"color:rgb(220,220,220)">,</span><spa=
n style=3D"color:rgb(212,212,212)"> priv</span><span style=3D"color:rgb(220=
,220,220)">);</span></div><div><span style=3D"color:rgb(212,212,212)">=C2=
=A0 =C2=A0 </span><span style=3D"color:rgb(86,156,214)">if</span><span styl=
e=3D"color:rgb(212,212,212)"> </span><span style=3D"color:rgb(220,220,220)"=
>(</span><span style=3D"color:rgb(212,212,212)">ret</span><span style=3D"co=
lor:rgb(220,220,220)">)</span></div><div><span style=3D"color:rgb(212,212,2=
12)">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color:rgb(86,156,214=
)">goto</span><span style=3D"color:rgb(212,212,212)"> out</span><span style=
=3D"color:rgb(220,220,220)">;</span></div></div><br>Counter example:=C2=A0 =
/drivers/gpu/drm/drm_gem.c:387:<br>
<div style=3D"color:rgb(212,212,212);background-color:rgb(47,52,60);font-fa=
mily:Consolas,&quot;Courier New&quot;,monospace;font-weight:normal;font-siz=
e:12px;line-height:16px;white-space:pre"><div><span style=3D"color:rgb(212,=
212,212)">ret </span><span style=3D"color:rgb(220,220,220)">=3D</span><span=
 style=3D"color:rgb(212,212,212)"> drm_vma_node_allow</span><span style=3D"=
color:rgb(220,220,220)">(&amp;</span><span style=3D"color:rgb(212,212,212)"=
>obj-&gt;vma_node</span><span style=3D"color:rgb(220,220,220)">,</span><spa=
n style=3D"color:rgb(212,212,212)"> file_priv</span><span style=3D"color:rg=
b(220,220,220)">);</span></div><div><span style=3D"color:rgb(212,212,212)">=
=C2=A0 =C2=A0 </span><span style=3D"color:rgb(86,156,214)">if</span><span s=
tyle=3D"color:rgb(212,212,212)"> </span><span style=3D"color:rgb(220,220,22=
0)">(</span><span style=3D"color:rgb(212,212,212)">ret</span><span style=3D=
"color:rgb(220,220,220)">)</span></div><div><span style=3D"color:rgb(212,21=
2,212)">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color:rgb(86,156,=
214)">goto</span><span style=3D"color:rgb(212,212,212)"> err_remove</span><=
span style=3D"color:rgb(220,220,220)">;</span></div></div><br></div>Best Re=
gards,<br></div>Alexandr</div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 23 =D1=81=D0=B5=
=D0=BD=D1=82. 2025=E2=80=AF=D0=B3. =D0=B2 12:07, Krzysztof Karas &lt;<a hre=
f=3D"mailto:krzysztof.karas@intel.com">krzysztof.karas@intel.com</a>&gt;:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Alexandr,<br>
<br>
&gt; Return value of function &#39;drm_vma_node_allow&#39;, called <br>
&gt; at i915_gem_mman.c:670, is not checked, but it is usually <br>
&gt; checked for this function<br>
Grepping for this function in the repo tells me this is currently<br>
the only place we call it. I&#39;d rephrase the commit message to focus<br>
only on missing return code.<br>
<br>
After that:<br>
Reviewed-by: Krzysztof Karas &lt;<a href=3D"mailto:krzysztof.karas@intel.co=
m" target=3D"_blank">krzysztof.karas@intel.com</a>&gt;<br>
-- <br>
Best Regards,<br>
Krzysztof<br>
</blockquote></div>

--0000000000007fc8f2063f8a66bc--
