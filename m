Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C070D151
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 04:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C768510E3BE;
	Tue, 23 May 2023 02:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B852D10E3BE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 02:36:40 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-96fd3a658eeso314636966b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 19:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684809397; x=1687401397;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O66ayLqrLjwwaV7X5MO9+8QCAk5qVqzn+Gz81adsgUE=;
 b=Tsjbe8DGSU/irgcnIcqZhWgA8BXCIoUoSg2AiZPd2ikJVZMCEaY6sYxVmjHoDqqboS
 JvdKBkzhUGFrVR3kBg3RVeGNvCVIE3Kf8ZCT/iVdRie+3NCZS9aIDxGK+1jMjALJJFAn
 5C3oO6BYyvaokSR5xcmccDOUzrMN3fHcdd7Ma1E0CMOWV/6RXhFQl/GFsuji2t+Xg5JP
 FB2f5EFckcMMRLKr1LeqYgJUQaI1t501e1ZdoEkAxqiZbp5hLngsu77fdKLXzY04S2Sk
 V7zdIjlFkbI9rwaJDdjuZPIBYYUwMTk+3wtxKOlUsLFf04B8lHq56SFIijxRb/oaBY5s
 SB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684809397; x=1687401397;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O66ayLqrLjwwaV7X5MO9+8QCAk5qVqzn+Gz81adsgUE=;
 b=dlwKxMuA1NI7LcKzCIMx8rlRPHlt1roUDCh2KEljV+w/smmvqxCFJk1pHg30DPj5iO
 hjTEys2eM8oT73QCu0y8Z6RNeon9NcBythVN5a3sAe0f8SOieOfTtkIsuKj6XWdUNZir
 /kEnvlRF0BNg8oZlOrVMiOueg9V4i4PCwGaTSZvQKZJs0fwqB0BWZ7jL8uTaLpPrwDuc
 7RRQkJcRUc4YE+AkEk3X5D3MGk39w8SOQqE3z9PcjwcPNXgt9b4RutIa3qb0esKjS4Uf
 bpKwpzkPyZVDhktGA9sp4DzFLeoB1qMAav69xu9m3lkisBuesZXDcNK8H53sdaZtPxW9
 47EQ==
X-Gm-Message-State: AC+VfDzO+LowmMzCBkFNn8rgzVeuLQyqyq0wPlsm6koUZ5C+5jwbthDp
 bpI5tCD/p3lMuQ8kq+mgiyhaLSUv8hmSvyS42+zHGVPO
X-Google-Smtp-Source: ACHHUZ6hmkt3bdLPpCi5Qy+9qX23c1qhp80zaiX/xfPv19NanUTs9QCrbU7SsB409+v2nc5iZ7QzAq46WODzcbBMHmI=
X-Received: by 2002:a17:907:a01:b0:94f:395b:df1b with SMTP id
 bb1-20020a1709070a0100b0094f395bdf1bmr10520399ejc.21.1684809396624; Mon, 22
 May 2023 19:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230519000408epcas1p4f5d90f588e7250d2d168d2943adef4f7@epcas1p4.samsung.com>
 <20230519000407.60744-1-inki.dae@samsung.com>
 <ZGbCO9/5yEstym+c@ashyti-mobl2.lan>
 <04c401d98a09$898df160$9ca9d420$@samsung.com>
 <ZGc/ipQspaaUf5FX@ashyti-mobl2.lan>
In-Reply-To: <ZGc/ipQspaaUf5FX@ashyti-mobl2.lan>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 23 May 2023 11:36:25 +0900
Message-ID: <CAAQKjZMwShMC8P7Oj+KhEHTqes0XywgD9JvB7YZy2H8pSqtC5w@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: vidi: fix a wrong error return
To: Andi Shyti <andi.shyti@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000099a21a05fc53418b"
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
Cc: linux-samsung-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000099a21a05fc53418b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2023=EB=85=84 5=EC=9B=94 19=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 6:21, A=
ndi Shyti <andi.shyti@linux.intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:

> Hi Inki,
>
> > > > @@ -469,8 +469,6 @@ static int vidi_remove(struct platform_device
> *pdev)
> > > >   if (ctx->raw_edid !=3D (struct edid *)fake_edid_info) {
> > > >           kfree(ctx->raw_edid);
> > > >           ctx->raw_edid =3D NULL;
> > > > -
> > > > -         return -EINVAL;
> > >
> > > It doesn't look right to me, I think the correct patch should be:
> > >
> > > -       if (ctx->raw_edid !=3D (struct edid *)fake_edid_info) {
> > > -               kfree(ctx->raw_edid);
> > > -               ctx->raw_edid =3D NULL;
> > > -
> > > -               return -EINVAL;
> > > -       }
> > > -
> > > +       ctx->raw_edid =3D NULL;
> > >
> > > because "ctx->raw_edid" points to a non allocated memory in the
> > > .data segment and you cannot free it.
> > >
> > > A follow-up cleanup should be to remove the "const" from
> > > fake_edid_info because you are assigning its address to pointers
> > > (raw_edid), so that what's the point for having it const? You are
> > > just fooling the compiler :)
> >
> > Thanks for review comment.
> >
> > "ctx->raw_edid !=3D fake_edid_info" means that the edid sent by the use=
r
> through
> > the ictl system call - vidi_connection_ioctl - is used instead of fake
> one -
> > face_edid_info.
> > In this case, ctx->raw_edid object needs to be released because
> ctx->raw_edid
> > object is allocated and the edid object sent by user is copied to the
> ctx-
> > >raw_edid by kmemdup(). :)
>
> yes... yes... I sent you another e-mail after this :)
>

I didn't check the second email you sent. :)

Thanks,
Inki Dae


> Thanks,
> Andi
>

--00000000000099a21a05fc53418b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">2023=EB=85=84 5=EC=9B=94 19=EC=9D=BC (=EA=B8=88) =EC=
=98=A4=ED=9B=84 6:21, Andi Shyti &lt;<a href=3D"mailto:andi.shyti@linux.int=
el.com">andi.shyti@linux.intel.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Hi Inki,<br>
<br>
&gt; &gt; &gt; @@ -469,8 +469,6 @@ static int vidi_remove(struct platform_d=
evice *pdev)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0if (ctx-&gt;raw_edid !=3D (struct edid *)fake_ed=
id_info) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(ctx-&gt;raw_ed=
id);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;raw_edid =3D=
 NULL;<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; &gt; <br>
&gt; &gt; It doesn&#39;t look right to me, I think the correct patch should=
 be:<br>
&gt; &gt; <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;raw_edid !=3D (struct edi=
d *)fake_edid_info) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(ctx=
-&gt;raw_edid);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;r=
aw_edid =3D NULL;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
INVAL;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;raw_edid =3D NULL;<br>
&gt; &gt; <br>
&gt; &gt; because &quot;ctx-&gt;raw_edid&quot; points to a non allocated me=
mory in the<br>
&gt; &gt; .data segment and you cannot free it.<br>
&gt; &gt; <br>
&gt; &gt; A follow-up cleanup should be to remove the &quot;const&quot; fro=
m<br>
&gt; &gt; fake_edid_info because you are assigning its address to pointers<=
br>
&gt; &gt; (raw_edid), so that what&#39;s the point for having it const? You=
 are<br>
&gt; &gt; just fooling the compiler :)<br>
&gt; <br>
&gt; Thanks for review comment. <br>
&gt; <br>
&gt; &quot;ctx-&gt;raw_edid !=3D fake_edid_info&quot; means that the edid s=
ent by the user through<br>
&gt; the ictl system call - vidi_connection_ioctl - is used instead of fake=
 one -<br>
&gt; face_edid_info.<br>
&gt; In this case, ctx-&gt;raw_edid object needs to be released because ctx=
-&gt;raw_edid<br>
&gt; object is allocated and the edid object sent by user is copied to the =
ctx-<br>
&gt; &gt;raw_edid by kmemdup(). :)<br>
<br>
yes... yes... I sent you another e-mail after this :)<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">I didn&#39;t check the=
 second email you sent. :)</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thanks,</div><div dir=3D"auto">Inki Dae</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
Thanks,<br>
Andi<br>
</blockquote></div></div></div>

--00000000000099a21a05fc53418b--
