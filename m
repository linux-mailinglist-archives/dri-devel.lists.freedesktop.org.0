Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A56E658C5C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 12:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285A210E20C;
	Thu, 29 Dec 2022 11:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067E610E20C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:43:33 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id u7so18678628plq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 03:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HkW/bXbQiBX0hG6VTNd6G4EsGUoqYnuRzq2f8ySmZpI=;
 b=FE0t8WOCCCNSWw96cKhsQi/CwI+6OjQSNSjLp5PlHm/P7Tj11g7N2WVzv1c9zZ6L4f
 dVx+HuAkbRCi1Sll+5JEEpbtFecV4PM3dlbmdar7UABBfjEflIqpKLSN3ZgGeNqxoeT8
 XR6UOa6PSD+biEO0IMot7pWAxA1DuukZe+YeOpSYoxorOQRsinII7aO47VkuWeiRObkd
 u4MGd7a3+g09Z49JUwE1BLYOucELfC6DFvdZqxC6+2Whs52aKEz7mT0G9IIK2QV0ltyy
 83Np0IY8N6wSOXMY7fzbO1isgwJ1vZQEhnF6rHmsznWHJLsuFeukvoSQzfxbdCL0hFIT
 I5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HkW/bXbQiBX0hG6VTNd6G4EsGUoqYnuRzq2f8ySmZpI=;
 b=XkDnekCydpVl5weO2aCqAya9UqkanqoScZqtaU7Z8dBL8iCnK4fsrf9HjHKTc9KLKo
 qWn6Ak2wAwc3HOVI9V7dQBYeAvXPag42NHIgjf5ukP1YNXtGRCGIO8bqXCdLpgceCZB4
 m677ll0B80YcljqxLhMEmNARSUesd3YP2KLlHKy4gO1of687dANa4H6/h4S86G5+pNmH
 DYBe5fuz3TfsVWw/STbUTR96wCcpfYGfZnZrzH/knNHajLcX4ALU6B5gDeYJx6PqmfMT
 3X2SzYGEB/SnB0y+RXV/uH/3MzoyO6TtvIrLvoLAalaOC27mNu06w7UkQwIWh24cmC90
 8m9Q==
X-Gm-Message-State: AFqh2kr6JdOwDvr16Ttg2W3LmNk1g+oDekUPlpaZKV4xl1Q69Ya/JiBN
 N3lO5QsQZXJjZNjkqWNJ1Gi7X79zYZgA51Lf+YD9IA==
X-Google-Smtp-Source: AMrXdXue2jVdZBUtQhFk+8QKG55TgbqjqBbiwxe/o2n+8xHlWRd8QdbXzI+PHOXMPlB9j/be0ozfea+Z5z8ItfFd25c=
X-Received: by 2002:a17:902:edd1:b0:189:d976:31a3 with SMTP id
 q17-20020a170902edd100b00189d97631a3mr2249490plk.59.1672314212638; Thu, 29
 Dec 2022 03:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20221227110335.2923359-1-javierm@redhat.com>
 <20221227110335.2923359-5-javierm@redhat.com>
 <b7204e9a-cb23-c2ed-88de-0d6271bba98a@tom-fitzhenry.me.uk>
In-Reply-To: <b7204e9a-cb23-c2ed-88de-0d6271bba98a@tom-fitzhenry.me.uk>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Thu, 29 Dec 2022 12:43:21 +0100
Message-ID: <CABxcv=kzxiXSO3k=iRYFPRhgpnBrGZDz-58jLQHJD=AapXmYow@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: rk3399-pinephone-pro: Add internal
 display support
To: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>
Content-Type: multipart/alternative; boundary="00000000000098f5e605f0f5fe53"
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
Cc: devicetree@vger.kernel.org, Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Martijn Braam <martijn@brixit.nl>, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000098f5e605f0f5fe53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Tom,

On Thu, 29 Dec 2022 at 10:39 Tom Fitzhenry <tom@tom-fitzhenry.me.uk> wrote:

> On 27/12/22 22:03, Javier Martinez Canillas wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> >
> > The phone's display is using Hannstar LCD panel, and Goodix based
> > touchscreen. Support it.
> >
> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > Co-developed-by: Martijn Braam <martijn@brixit.nl>
> > Signed-off-by: Martijn Braam <martijn@brixit.nl>
> > Co-developed-by: Kamil Trzci=C5=84ski <ayufan@ayufan.eu>
> > Signed-off-by: Kamil Trzci=C5=84ski <ayufan@ayufan.eu>
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Tested-by: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>
>
> Display and touchscreen works on my Pinephone Pro, thanks for the
> mainlining!
>

Thanks for testing it!


> > @@ -367,6 +474,10 @@ vcc1v8_codec_en: vcc1v8-codec-en {
> >       };
> >   };
> >
> > +&pwm0 {
> > +     status =3D "okay";
> > +};
>
> Please move &pwm0 before &sdio0, to keep this ~alphabetical.


Sure. I=E2=80=99ll do that in v4.

Best regards,
Javier

--00000000000098f5e605f0f5fe53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello Tom,</div><div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, 29 Dec 2022 at 10:39 Tom Fitzhenry=
 &lt;<a href=3D"mailto:tom@tom-fitzhenry.me.uk">tom@tom-fitzhenry.me.uk</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 27/12/22 22:03, Javi=
er Martinez Canillas wrote:<br>
&gt; From: Ondrej Jirman &lt;<a href=3D"mailto:megi@xff.cz" target=3D"_blan=
k">megi@xff.cz</a>&gt;<br>
&gt; <br>
&gt; The phone&#39;s display is using Hannstar LCD panel, and Goodix based<=
br>
&gt; touchscreen. Support it.<br>
&gt; <br>
&gt; Signed-off-by: Ondrej Jirman &lt;<a href=3D"mailto:megi@xff.cz" target=
=3D"_blank">megi@xff.cz</a>&gt;<br>
&gt; Co-developed-by: Martijn Braam &lt;<a href=3D"mailto:martijn@brixit.nl=
" target=3D"_blank">martijn@brixit.nl</a>&gt;<br>
&gt; Signed-off-by: Martijn Braam &lt;<a href=3D"mailto:martijn@brixit.nl" =
target=3D"_blank">martijn@brixit.nl</a>&gt;<br>
&gt; Co-developed-by: Kamil Trzci=C5=84ski &lt;<a href=3D"mailto:ayufan@ayu=
fan.eu" target=3D"_blank">ayufan@ayufan.eu</a>&gt;<br>
&gt; Signed-off-by: Kamil Trzci=C5=84ski &lt;<a href=3D"mailto:ayufan@ayufa=
n.eu" target=3D"_blank">ayufan@ayufan.eu</a>&gt;<br>
&gt; Signed-off-by: Javier Martinez Canillas &lt;<a href=3D"mailto:javierm@=
redhat.com" target=3D"_blank">javierm@redhat.com</a>&gt;<br>
<br>
Tested-by: Tom Fitzhenry &lt;<a href=3D"mailto:tom@tom-fitzhenry.me.uk" tar=
get=3D"_blank">tom@tom-fitzhenry.me.uk</a>&gt;<br>
<br>
Display and touchscreen works on my Pinephone Pro, thanks for the <br>
mainlining!<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for testi=
ng it!</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; @@ -367,6 +474,10 @@ vcc1v8_codec_en: vcc1v8-codec-en {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +&amp;pwm0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
<br>
Please move &amp;pwm0 before &amp;sdio0, to keep this ~alphabetical.</block=
quote><div dir=3D"auto"><br></div><div dir=3D"auto">Sure. I=E2=80=99ll do t=
hat in v4.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,=
</div><div dir=3D"auto">Javier</div></div></div>

--00000000000098f5e605f0f5fe53--
