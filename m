Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BBC571C26
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 16:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9244994A9A;
	Tue, 12 Jul 2022 14:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E7389E39
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 14:17:41 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id z25so14203251lfr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tE1LBinyRAFM7xgiM2OmAsGrZh17ueaU0Hwd2TP+P9Y=;
 b=G8oTmqTKnRlM2P+Hnu+3Zj0+SXC+nIh/u1+vYdJOAv51boeaX+MtVxPR7MugTKp2Pz
 JCty0Zx2kq9XXCDv3XtoMoj9YO9KmIZL+Thz4xRFqpUcXCFpJqThP5qgOhLCEqTaoeIx
 KUTN69p8/1CTO6urjp5eN5Ql1WjBJfFUrl3L31/rweJkNtuwil0jBp0clTQFieSgfLCk
 7i4cVhfJCYVD8ugqsGwNChNjnK/AW1r+0hs0A2X1mioJCuQ7Dw4RJqa6di/9MusMeBaF
 jA4v/2IV5ggOKSD7rGALL082T4UX2yYf+dBzA9qp+sXCT2FYQ4OMcYncfyxD8sAJ3QGY
 olEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tE1LBinyRAFM7xgiM2OmAsGrZh17ueaU0Hwd2TP+P9Y=;
 b=4N/eO5fDQPMZxRuZYHT6JA0RqpJSd7w9LgOAmR8DsWIfeNpT4yIk4rZm6i+GxMGa2X
 Gc6lU/Fl0OLQgEyA5uoNd31reuBqTaDBakrG/0uitVy0qVn1uahpidxwzQ/uq4nbc8uF
 RTQ98quH7WpjQrOX3hifLqTGHfAUNit8Wk8vpjF1wI0TNx2CYUY2syjM2PDrSQtcrqPx
 yFTePGxxDEiMNEnRvawCSgjQyok8aSwS4a9hVEb3BXBNYY3tsxTep+OCBwcssy/x9f3E
 8z1vQ1TFH+tUXKR2cRYg0jQsyYljK+/Qhh+j1N1SP0GXTZzplySQOSgCeG/jM5/E1BVs
 TiiA==
X-Gm-Message-State: AJIora+N3vJ8RuJuCTZvK6YSgk0KCFOEUoINiALIsF+XtVSnFNELgYm0
 ThIQh52OEQBSbHuow88k6Y/Fyi4lCaHUYRm9X1c=
X-Google-Smtp-Source: AGRyM1uhuDuEeCQY5kKGj61RDhf2S7VfZUzAG7fGlymDQJwgo9AClxhvB6FglZ/YpTyRbcHnrpUUMnHaGcSlWebAf/U=
X-Received: by 2002:ac2:54a2:0:b0:489:57b0:7adc with SMTP id
 w2-20020ac254a2000000b0048957b07adcmr15365764lfk.271.1657635458295; Tue, 12
 Jul 2022 07:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220709141136.58298-1-mollysophia379@gmail.com>
 <1c90df71-4db0-9d20-e41b-2dfdce8d6456@linaro.org>
In-Reply-To: <1c90df71-4db0-9d20-e41b-2dfdce8d6456@linaro.org>
From: Molly Sophia <mollysophia379@gmail.com>
Date: Tue, 12 Jul 2022 22:17:26 +0800
Message-ID: <CAK0UmJBVUNmexWjuYqx03F9R_HCoj8qQtOp=LEdVp3_SA2ceKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a8ae7205e39c549e"
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a8ae7205e39c549e
Content-Type: text/plain; charset="UTF-8"

I'm really sorry about that. I made a stupid mistake when sending the mail.
Apology for the mess I've made.

Best regards,
Molly

On Tue, Jul 12, 2022 at 10:08 PM Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 09/07/2022 16:11, MollySophia wrote:
> > Add documentation for "novatek,nt35596s" panel.
> >
> > Signed-off-by: MollySophia <mollysophia379@gmail.com>
>
> I see now three different patchsets, twice v1 and once v2 (send shortly
> after v1). This is confusing.
>
> Best regards,
> Krzysztof
>

--000000000000a8ae7205e39c549e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>I&#39;m really sorry about that. I m=
ade a stupid mistake when sending the mail. Apology for the mess I&#39;ve m=
ade.</div><div><br></div><div>Best regards,<br>Molly</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 12, 2=
022 at 10:08 PM Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlows=
ki@linaro.org">krzysztof.kozlowski@linaro.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On 09/07/2022 16:11, MollySoph=
ia wrote:<br>
&gt; Add documentation for &quot;novatek,nt35596s&quot; panel.<br>
&gt; <br>
&gt; Signed-off-by: MollySophia &lt;<a href=3D"mailto:mollysophia379@gmail.=
com" target=3D"_blank">mollysophia379@gmail.com</a>&gt;<br>
<br>
I see now three different patchsets, twice v1 and once v2 (send shortly<br>
after v1). This is confusing.<br>
<br>
Best regards,<br>
Krzysztof<br>
</blockquote></div></div>

--000000000000a8ae7205e39c549e--
