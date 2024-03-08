Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872D1875B9D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 01:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D71D1122B8;
	Fri,  8 Mar 2024 00:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GiGh9zYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA521121A2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 00:52:31 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-68facd7ea4aso13007906d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 16:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709859150; x=1710463950;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VvO/ixf0+++8oswIhtVli8kINVc0jkEfcYjOQmUta0w=;
 b=GiGh9zYrxUH2HcokbmLZQXvRNLdBM8GXbqgeS855o+ILG1wD/mrNQV93FxG2feSg1y
 n3Mr/h5V49ZINF23TfKKGkRAK/D2kKpynZpKg6eb3W5BQiL1RgTmUV2pd262QWp2xEyq
 L3vbsQ7vV5YlokcKqLnmrQUBQeAv7+iGph1tiNIOeKrapaVQxoa4mF2XZ3D5lnmd+a1t
 hhRJyHTiQzLVa7DIwwQ0FqaaBjWwI92Bhngwx3S3x9XE32OudIR/G2Rpzdx47PQnDJd8
 O+7gKHCLok6EvkfF6zIZE/O3RtMtGL/CmhAKHxSgOjmPwwoqouI2bA5w78ovEs+wIamI
 mkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709859150; x=1710463950;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VvO/ixf0+++8oswIhtVli8kINVc0jkEfcYjOQmUta0w=;
 b=KXRoZ5FQvcG6qhwaRTyqvMBAeg4cH8VL8Iz6FeU6mSG3WlpvM584Kr+iqFpxM49K69
 4qE1ndPyAnivhl+agFUJdUuoAj6VDhGjr0rnQoj0yKil+VXdZ3FXDKlheXkv0tZ7ZAke
 W312ZxXYsGVH7yl9m9VoOK52dmlUtx9K5Z3eTup3psZcsYv+0n1dgHRq7U0QHKjtbPJb
 aoTuuEcKaNi1mnF07y/Ztb86HVPZjtIk7o7dBBbfpjr7oAyyKflL67Dk/rJnL0QWYKuK
 ijTgev3UNZ8noc4vyTvV44J/LieckX9b88mL61/RGbPv/Szem3EA94nzcQ26oYQ9a0Ga
 f8+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+l17Azn3MRHfjhFUpL4AzqsYQwIj6E+xuKEvDitwVGfQToMIIr0ErdIhl+BhnfTWbsHXh+ZBV/B6VqsNPnD5Tb3m6MDgapAcdnYzKsL57
X-Gm-Message-State: AOJu0YzP/TEyQLg/jygfIkvlAXH5tUFMGjc9NFUg4P2IkZtS93nlm3TS
 Fg8Hjc/X71fLx+H6/QgmAq9boTQWvcxqE+Tt4JEEyon93l/b+0AT350IxNIHdplp1+B16VIxiyJ
 nrehgdzBhvQ9oFPtygHu7efEQLBg2XwGjwrj6Eg==
X-Google-Smtp-Source: AGHT+IGaU1LfKEWnmk08y0PX51cJJu4CPxE4nGtsmE3ZQ5R4i05wLBWUoFNHsXRHRQOdXiF/aTGId09J6yPaP0cWwdw=
X-Received: by 2002:ad4:4f14:0:b0:690:ad27:bc77 with SMTP id
 fb20-20020ad44f14000000b00690ad27bc77mr3616523qvb.28.1709859150553; Thu, 07
 Mar 2024 16:52:30 -0800 (PST)
MIME-Version: 1.0
References: <20240307094433.3440431-1-xuxinxiong@huaqin.corp-partner.google.com>
 <CAD=FV=U8wdT_5k-yrLVpmh=q4k18LntqujK7Mw88TdweBXCPgg@mail.gmail.com>
In-Reply-To: <CAD=FV=U8wdT_5k-yrLVpmh=q4k18LntqujK7Mw88TdweBXCPgg@mail.gmail.com>
From: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Date: Fri, 8 Mar 2024 08:52:19 +0800
Message-ID: <CAGoogDD6R=YeNdHPFXmmKas1vcBZfi8mQrweKj1b7dH2kR+9JQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add several generic edp panels
To: Doug Anderson <dianders@google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000049014c06131b9bb7"
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

--00000000000049014c06131b9bb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixed!
Thanks a lot!

Doug Anderson <dianders@google.com> =E4=BA=8E2024=E5=B9=B43=E6=9C=887=E6=97=
=A5=E5=91=A8=E5=9B=9B 22:36=E5=86=99=E9=81=93=EF=BC=9A

> Hi,
>
> On Thu, Mar 7, 2024 at 1:44=E2=80=AFAM Xuxin Xiong
> <xuxinxiong@huaqin.corp-partner.google.com> wrote:
> >
> > Add support for the following 2 panels:
> > 1. BOE NT116WHM-N44
> > 2. CMN N116BCA-EA1
> >
> > Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> The patch looks OK, but please resend with a more unique subject. I
> think we've already landed more than one patch with the subject "Add
> several generic edp panels". Since this is just two panels, maybe just
>
> drm/panel-edp: Add BOE NT116WHM-N44 and CMN N116BCA-EA1
>
> -Doug
>

--00000000000049014c06131b9bb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Fixed!=C2=A0<br>Thanks a lot!</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">Doug Anderson &lt;<a href=3D"=
mailto:dianders@google.com">dianders@google.com</a>&gt; =E4=BA=8E2024=E5=B9=
=B43=E6=9C=887=E6=97=A5=E5=91=A8=E5=9B=9B 22:36=E5=86=99=E9=81=93=EF=BC=9A<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Thu, Mar 7, 2024 at 1:44=E2=80=AFAM Xuxin Xiong<br>
&lt;<a href=3D"mailto:xuxinxiong@huaqin.corp-partner.google.com" target=3D"=
_blank">xuxinxiong@huaqin.corp-partner.google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add support for the following 2 panels:<br>
&gt; 1. BOE NT116WHM-N44<br>
&gt; 2. CMN N116BCA-EA1<br>
&gt;<br>
&gt; Signed-off-by: Xuxin Xiong &lt;<a href=3D"mailto:xuxinxiong@huaqin.cor=
p-partner.google.com" target=3D"_blank">xuxinxiong@huaqin.corp-partner.goog=
le.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/panel/panel-edp.c | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
The patch looks OK, but please resend with a more unique subject. I<br>
think we&#39;ve already landed more than one patch with the subject &quot;A=
dd<br>
several generic edp panels&quot;. Since this is just two panels, maybe just=
<br>
<br>
drm/panel-edp: Add BOE NT116WHM-N44 and CMN N116BCA-EA1<br>
<br>
-Doug<br>
</blockquote></div>

--00000000000049014c06131b9bb7--
