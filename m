Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3381D64EDF8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 16:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6EC10E5D5;
	Fri, 16 Dec 2022 15:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C384E10E5D5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 15:31:05 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1441d7d40c6so3654513fac.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 07:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y3HgMZDjLD1hyRTfo7mvTffzTHR1grBKI853xQKk2IY=;
 b=ucxtBgi69DmC3rmbtTZCUveLOSWKO+ISzwoWOYhdHUz2ys7P/vAjzt/K7I6GQ3cATY
 hWVa5sOMiwzmYzCBFKzqmL9DL+RGPdMNFScm3/2o1LdQeXjAoDkyL3BqC+n/H/x5TSd4
 dsRIaNOCM8M/5SBJDDc01HGCQSbG37wujUvjEHQDP12Sh1orEzzDFU8hKtcaH1Y7VHVp
 s2INxHeZ/eOsTwHQeDm5C7xo7ZdDWJ97ToHAiTI/AyZvcANC9XsJBAhx7tX3Fu8zp1ve
 qOW9VBE4G8uVyGnSjLJ861ZTGSwfhQmTDfyr0DPPCAvNaYw/LFzjXITqE342TSVDmU2u
 1L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y3HgMZDjLD1hyRTfo7mvTffzTHR1grBKI853xQKk2IY=;
 b=jKNPC1NFAr09XVoBQXY91xWOFIDCIBJ6+p+laul2j84lU+ilKkz0xJChKi0tXuOEmA
 ZpW5H6E1w3SHPKrYJkuPkeciOj6LQMbESDJ4mRAZznhhe3nsnHtxGg9y0Y+5hcvAmx6t
 tC28DI8E2ipJY6+c0uzg2OuzmoVNsjn3J45OK+WJ7K8P/nCKK7nt3k5ET/JaK755VwgL
 691RwJ6hzfldJgFfCCvDy8hdBRPKGaSwcyXisKxICZUr3bgZG9rrQSHMoEZvNDZD5Xvj
 QNV7sBN/k8ucEipnFRw08gIzIwvbleXbsv/ECcOqqK48M2XWWYn11Xp6oVOGi/aAfvc8
 zjDw==
X-Gm-Message-State: AFqh2kongg9RJJxg+8ZNSxld6SRfzAAfqhPWqWMwVLWpqCcehj1vkLxy
 aTSyUzmcsW0LJTKk3HWvDFPXRu3Vz9r0Z/OavcyNTw==
X-Google-Smtp-Source: AA0mqf5WgBOUX6I0rVOthV+fq3r1tva8TkKYNNS05YDt9taPUIK2eV/5qzk9+ygvlshVXfFAmpzF4kmY/k14Rx/is2o=
X-Received: by 2002:a05:6870:2393:b0:144:b04d:1669 with SMTP id
 e19-20020a056870239300b00144b04d1669mr675777oap.155.1671204664975; Fri, 16
 Dec 2022 07:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-2-paul@crapouillou.net>
 <CAG3jFytgK0noWteGvXTdSm9as9Q=qfhf_ep3Z8Wv2ofmLzGb=A@mail.gmail.com>
 <c78e92ae3cbea037abdd31ecd64e997c8dd1def2.camel@crapouillou.net>
 <bb2b5b72-42b3-3a6c-d865-9e338e34aba0@linaro.org>
In-Reply-To: <bb2b5b72-42b3-3a6c-d865-9e338e34aba0@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 16 Dec 2022 16:30:53 +0100
Message-ID: <CAG3jFysK9-B6K0QiGxra5nYqBQ0d5MSYWtJZiktEqaLiBO_Dxw@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: display: bridge: it66121: Add
 compatible string for IT6610
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000673b2205eff3a87d"
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
Cc: Phong LE <ple@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000673b2205eff3a87d
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 16, 2022, 12:21 Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 16/12/2022 11:46, Paul Cercueil wrote:
>
> >>>  properties:
> >>>    compatible:
> >>> -    const: ite,it66121
> >>> +    enum:
> >>> +      - ite,it66121
> >>> +      - ite,it6610
>
> These should be ordered alphabetically. What's with the tendency of
> adding always to the end?
>
> >>>
> >>>    reg:
> >>>      maxItems: 1
> >>> --
> >>> 2.35.1
> >>>
> >>
> >> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> >
> > Series applied to drm-misc-next.
> >
> I wished you give DT maintainers a bit more time than two days.
>

Noted. Will make it a week.


> Best regards,
> Krzysztof
>
>

--000000000000673b2205eff3a87d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Dec 16, 2022, 12:21 Krzysztof Kozlowski &lt;<a=
 href=3D"mailto:krzysztof.kozlowski@linaro.org">krzysztof.kozlowski@linaro.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 16/12/2022 11=
:46, Paul Cercueil wrote:<br>
<br>
&gt;&gt;&gt; =C2=A0properties:<br>
&gt;&gt;&gt; =C2=A0=C2=A0 compatible:<br>
&gt;&gt;&gt; -=C2=A0=C2=A0=C2=A0 const: ite,it66121<br>
&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 enum:<br>
&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ite,it66121<br>
&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ite,it6610<br>
<br>
These should be ordered alphabetically. What&#39;s with the tendency of<br>
adding always to the end?<br>
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0 reg:<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.35.1<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: Robert Foss &lt;<a href=3D"mailto:robert.foss@linaro.=
org" target=3D"_blank" rel=3D"noreferrer">robert.foss@linaro.org</a>&gt;<br=
>
&gt; <br>
&gt; Series applied to drm-misc-next.<br>
&gt; <br>
I wished you give DT maintainers a bit more time than two days.<br></blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Noted. Will =
make it a week.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div></div></div>

--000000000000673b2205eff3a87d--
