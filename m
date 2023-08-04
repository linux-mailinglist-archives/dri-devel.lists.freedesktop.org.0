Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD57B76F954
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 07:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A8B10E23C;
	Fri,  4 Aug 2023 05:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F68310E23C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 05:09:36 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5217ad95029so2070912a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 22:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691125775; x=1691730575;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m7gaIpUGsxXrxDJIAEIWXSSX3o60FIwgIhqpH2KWbKw=;
 b=icWg6qYKfVe1RFF6IJKJVC8D355xDqE4kJvDJQh47ASiBn6t07GKpBr7KeRuApPq0t
 4tMOyUDHdMmAI65XlT+tDUMTbWs1hDMPEIvu9Sn7IxnSqrDSRC3ltlVol6Xta0cxQ2RW
 AVnYX3yQ/iatQSGslZllisRx42aZwakIST++ng1h9BT33BRyjV8rHllbeq6aOKSlAmc7
 8pY9qjsbFrmkbGLto3bmTi0sCdO3fE227iD1E+q0swImOBeBjTo4/1tFaKqLIHs/PsCL
 AlT95cjL/y6xqGMAWTbF1aclq3jvltojC2Q6e4nbjdO9jo8Q0JhCzV3r7bqEvnkzSv/F
 OOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691125775; x=1691730575;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m7gaIpUGsxXrxDJIAEIWXSSX3o60FIwgIhqpH2KWbKw=;
 b=T/nze3OWzwuHr08cZ3OW8XtSXzpdU7hwZ0vGE2da2xSB26izi3y3cZg8VD/2nbvI98
 +TLTHxp2i/JeOrio65GJBTkTp6W9sHg/G6cWmU4yNHs5wNfcbSlsAsTe7FmkWYi+Su6O
 bKCr7nKA6GMkphDRjhJ3jHfalqmc1St/5zUfxu0FgDO5vwXy4PRGIFx956OFlm56RBwf
 mdKPysfeBAM0ebTKq/uP57+Jz3DkYfBVkHe0xiwI1UZQ2nrA+vtaZ5R7XLkEo3DCWM07
 ptr9XFlvT9pBdAM5crhXy8lpWbOQN23Ex1bHZfEeYkeLrBYw93Ck2mKYtL3sh5I0lnbp
 JdtA==
X-Gm-Message-State: AOJu0YyjlzpIA+dfrYsap3foyZlEWzYWrv4m1V5iIzPh+bfPpN+Nea/P
 e1/aABcBSwvANxf0BChMXAP8yvZzgNBSS11DPyg=
X-Google-Smtp-Source: AGHT+IHmAxuEwrmZYvIFw3Fhh56Vb0aLDqsY9l+KKDDSyvcaIfGwZwZC+P/vbccGJe35PnapdyWOrLbH8UY4hPDipGQ=
X-Received: by 2002:aa7:cc8e:0:b0:523:1a09:4e2b with SMTP id
 p14-20020aa7cc8e000000b005231a094e2bmr532235edt.40.1691125774769; Thu, 03 Aug
 2023 22:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230731123336.55152-1-wangzhu9@huawei.com>
 <467bcd2c-19c6-f7c3-44e7-d0c4f8d460f4@linaro.org>
In-Reply-To: <467bcd2c-19c6-f7c3-44e7-d0c4f8d460f4@linaro.org>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 4 Aug 2023 14:09:23 +0900
Message-ID: <CAAQKjZOf9xpDos_o41B3bV_8Qw-Gi35FaOVQy12mkUwRUeYnjA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/exynos: remove redundant of_match_ptr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000136566060211e7e3"
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
Cc: Zhu Wang <wangzhu9@huawei.com>, linux-samsung-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000136566060211e7e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2023=EB=85=84 7=EC=9B=94 31=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 10:09, =
Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> On 31/07/2023 14:33, Zhu Wang wrote:
> > The driver depends on CONFIG_OF, so it is not necessary to use
> > of_match_ptr here.
> >
> > Even for drivers that do not depend on CONFIG_OF, it's almost always
> > better to leave out the of_match_ptr(), since the only thing it can
> > possibly do is to save a few bytes of .text if a driver can be used bot=
h
> > with and without it. Hence we remove of_match_ptr.
> >
> > Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>

Merged.

Thanks,
Inki Dae


> Best regards,
> Krzysztof
>
>

--000000000000136566060211e7e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">2023=EB=85=84 7=EC=9B=94 31=EC=9D=BC (=EC=9B=94) =EC=
=98=A4=ED=9B=84 10:09, Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.=
kozlowski@linaro.org">krzysztof.kozlowski@linaro.org</a>&gt;=EB=8B=98=EC=9D=
=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 31/07/20=
23 14:33, Zhu Wang wrote:<br>
&gt; The driver depends on CONFIG_OF, so it is not necessary to use<br>
&gt; of_match_ptr here.<br>
&gt; <br>
&gt; Even for drivers that do not depend on CONFIG_OF, it&#39;s almost alwa=
ys<br>
&gt; better to leave out the of_match_ptr(), since the only thing it can<br=
>
&gt; possibly do is to save a few bytes of .text if a driver can be used bo=
th<br>
&gt; with and without it. Hence we remove of_match_ptr.<br>
&gt; <br>
&gt; Signed-off-by: Zhu Wang &lt;<a href=3D"mailto:wangzhu9@huawei.com" tar=
get=3D"_blank" rel=3D"noreferrer">wangzhu9@huawei.com</a>&gt;<br>
<br>
<br>
Reviewed-by: Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowski@=
linaro.org" target=3D"_blank" rel=3D"noreferrer">krzysztof.kozlowski@linaro=
.org</a>&gt;<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Merged.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Than=
ks,</div><div dir=3D"auto">Inki Dae</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div></div></div>

--000000000000136566060211e7e3--
