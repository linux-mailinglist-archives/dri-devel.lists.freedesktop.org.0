Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA23585F9FA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 14:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C4A10E932;
	Thu, 22 Feb 2024 13:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jtU1SBx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0D910E932
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 13:38:23 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-7d6024b181bso936022241.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 05:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708609102; x=1709213902; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dQO0pcUMS5T2r2xgVzJsDqBAVatYrwKpM36VcAECAf4=;
 b=jtU1SBx3ZT6RPsIM0LxsHtno3+7U3FYBKYUYeotn19hHtFVcrfIOPNekAJ3kUK9BmV
 XU+fAR89bwOCRr6/VcPRDqJgH4wq97s9d+zamxj655hGaDa0UIX5NdvmMdoQz5VCMI4K
 he9jUMVV3u63Jo/4lEJ8DjW/DthzHKcBcVTTwaO3Ae3O/w+wo5Trm+PJzxdijLjvOHja
 P6CxNhcUTwbJo+faNZ2ezh263ofAsHwJB88VnEdXI5Jdx+vodAwqRf755J8Tc6XKDbN6
 0NS79DUlzSoIOD9c/lqx29GKK+JIIg8qvT+gqT0Jtn+M0PM3SKhY0oUX8Hopyh2sdLzS
 74QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708609102; x=1709213902;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dQO0pcUMS5T2r2xgVzJsDqBAVatYrwKpM36VcAECAf4=;
 b=fK+tBUplwRQ65Ee///QC8mMURIBOQZ471i82UHNQqOJ5eLfLrAYehcsEIaIf7m6RN/
 LdVMmWpmnfYojV23Qow4rr/9ZvSaDEDEH2pYxs0aMCgO6UIHbeQMHnpI0AARqMm6pc56
 DuE1T91D8C1zl4EAd7JsWpGtgt7U9hnqd9agts9qpCiI062kO6JbVVLFaZhCYI+0+ckn
 hH/PR2mGpV33iAJV0odxsfO3Jpo0C+QkbAiYRLvJozI5T1ibFKu0m88ltKFGz8cTJxkV
 b4fw8JKvj7ptXKj5h8K/l0L2DamlOE3/Vre/ViXBMd004nE+Eau0Mw5Z11rnEZvIX/5O
 vj2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU76ZaGtZ+YhuJ5Qzlr46nzzIRTFEY9D3MNewVUp+9DjYLTw4p4e9275zUp5Ie5QlP0GhE1m+NhynVf2bB4EABRROf1q3YzoRyTsp2Yf8y4
X-Gm-Message-State: AOJu0Yx+KGOpu35DIIJb9tkUsBP7W1G65vZ/XmpkFFfLkQkXRxHb5ytq
 TmJ8SDBgOeNL40ELkV7J5Q2yccocP0eLI5q14c4+k78l5UobWGKWns92r5DwnefqQ3VdLpRajNm
 Q37/wnONDdj/NiiyakSQML0xU12k=
X-Google-Smtp-Source: AGHT+IHeUBLCrzAQPAOcBMoi7yg8T+EG2jqNKqNBEye6VpoIAFShWlnGiLs79uKwYCpxOnHKl7ZjKIzeQ0SHQSkJ+tQ=
X-Received: by 2002:a67:eacd:0:b0:470:a10e:4b5f with SMTP id
 s13-20020a67eacd000000b00470a10e4b5fmr6001699vso.26.1708609102390; Thu, 22
 Feb 2024 05:38:22 -0800 (PST)
MIME-Version: 1.0
References: <20240221095404.592464-1-sawara04.o@gmail.com>
 <87f76339-3ace-4cbe-bdb9-266a86bf55eb@moroto.mountain>
In-Reply-To: <87f76339-3ace-4cbe-bdb9-266a86bf55eb@moroto.mountain>
From: =?UTF-8?B?5bCP56yg5Y6fIOWFseW/lw==?= <sawara04.o@gmail.com>
Date: Thu, 22 Feb 2024 22:38:11 +0900
Message-ID: <CAKNDObDWgkpzfHMBkQA3F3O-Qt6Q8UJ8BJufzYz72d9TK4qaKA@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Fix "space prohibited before that close
 parenthesis ')'" error reported by checkpatch
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: multipart/alternative; boundary="0000000000009bb0be0611f88efe"
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

--0000000000009bb0be0611f88efe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> This breaks the build.  You could do a search for it.
>
> https://lore.kernel.org/all/?q=3Ddefine_fbtft_write_reg

I understand. Thanks for letting me know.

2024=E5=B9=B42=E6=9C=8821=E6=97=A5(=E6=B0=B4) 19:18 Dan Carpenter <dan.carp=
enter@linaro.org>:

> On Wed, Feb 21, 2024 at 06:54:04PM +0900, sawara04.o@gmail.com wrote:
> > From: Kyoji Ogasawara <sawara04.o@gmail.com>
> >
> > Since whitespace is prohibited before that close parenthesis ')' in a
> > conditional statements, remove it and fix checkpatch.pl error "space
> prohibited before that
> > close parenthesis ')'".
> >
> > Signed-off-by: Kyoji Ogasawara <sawara04.o@gmail.com>
>
> This breaks the build.  You could do a search for it.
>
> https://lore.kernel.org/all/?q=3Ddefine_fbtft_write_reg
>
> regards,
> dan carpenter
>
>

--0000000000009bb0be0611f88efe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>&gt; This breaks the build.=C2=A0 Yo=
u could do a search for it.</div>&gt;<br>&gt;=C2=A0<a href=3D"https://lore.=
kernel.org/all/?q=3Ddefine_fbtft_write_reg" rel=3D"noreferrer" target=3D"_b=
lank">https://lore.kernel.org/all/?q=3Ddefine_fbtft_write_reg</a><div><br><=
/div>I understand. Thanks for letting me know.<br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">2024=E5=B9=B42=E6=9C=8821=
=E6=97=A5(=E6=B0=B4) 19:18 Dan Carpenter &lt;<a href=3D"mailto:dan.carpente=
r@linaro.org" target=3D"_blank">dan.carpenter@linaro.org</a>&gt;:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Feb 21, 2024 at 0=
6:54:04PM +0900, <a href=3D"mailto:sawara04.o@gmail.com" target=3D"_blank">=
sawara04.o@gmail.com</a> wrote:<br>
&gt; From: Kyoji Ogasawara &lt;<a href=3D"mailto:sawara04.o@gmail.com" targ=
et=3D"_blank">sawara04.o@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Since whitespace is prohibited before that close parenthesis &#39;)&#3=
9; in a<br>
&gt; conditional statements, remove it and fix <a href=3D"http://checkpatch=
.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> error &quot;spa=
ce prohibited before that<br>
&gt; close parenthesis &#39;)&#39;&quot;.<br>
&gt; <br>
&gt; Signed-off-by: Kyoji Ogasawara &lt;<a href=3D"mailto:sawara04.o@gmail.=
com" target=3D"_blank">sawara04.o@gmail.com</a>&gt;<br>
<br>
This breaks the build.=C2=A0 You could do a search for it.<br>
<br>
<a href=3D"https://lore.kernel.org/all/?q=3Ddefine_fbtft_write_reg" rel=3D"=
noreferrer" target=3D"_blank">https://lore.kernel.org/all/?q=3Ddefine_fbtft=
_write_reg</a><br>
<br>
regards,<br>
dan carpenter<br>
<br>
</blockquote></div></div>

--0000000000009bb0be0611f88efe--
