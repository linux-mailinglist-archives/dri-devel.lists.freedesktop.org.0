Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C38BC055A
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 08:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4AA10E563;
	Tue,  7 Oct 2025 06:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NDsvWvDS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F14E10E568
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 06:29:44 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-789b93e9971so698726b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 23:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759818584; x=1760423384; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aKkMnGRmG/HCXRR/J+wbpneMSFSl98hzVTOk4wOIvPo=;
 b=NDsvWvDS/OEmehKZipK3u2lsX7Q/LBDUkzSdLkvuU/BYr86A6l7Mp6tGPNA/9kVilP
 Htk1sOjWSgBJNAxC766gom8gBNumNAiHJ0qPKlxwnvtwjY0amXcuTa/h8Zt8yFYAZqdG
 3E3Fx7xyIL7WooJwUvSWz3CoMXaEpw7Fw0O0yIzwuwnzt892TF0d/pW7eXmyAWOTVRdl
 7aDq+4llQ6fdTIKfj6MLThYAYs3+a5OOQ8Y+9hKMIXl+Q9w78ZUtMHYvnZ3s/L7GwNpy
 +tJY9GH1QpspXAA4GlRvTpbk8O0Yb85eK5PhMRP78aTuepddiX7q14ZVrKmyQPMlt9vc
 AJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759818584; x=1760423384;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aKkMnGRmG/HCXRR/J+wbpneMSFSl98hzVTOk4wOIvPo=;
 b=azxpEi907+b8qNeQ13p3w+wTAcfgkc70GGDkNyWUY7eyLnu+As4/et2+OV31nrbL+Q
 J1lnsyfVNLAJzoE9Bk0AL9PXxwNPkcSjkctuMN4DqlBqurxR2VTwPixHbeVeM7o2fYVQ
 zZwt+QfJYHOqf1BSA2Yzcb+9jKL9TvovaNod56MTeWZP9XVRj6TqRju5bv5ivSVT/G+T
 40Gnz8aYI4+BxYYKwqESdUcE9x75MYgjXqlMyWAUirMY0m1PnRXFoS8Tp+bou4w+adYR
 0xVSJlOuy7JRTiWtzX2EcbypFrkXLRgtvSbmGAhzPF0zZzT/cAlTWT9Jg6yCbFkZeL0L
 Z2MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcN8Iuhd+GgDw3W051jueawCkAgV4qcvvv+Higzr6bzlShdTxzcJCoXPpodlz+4lqxFWf1lmsW5WM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEuFd6eJ24mfIif4j1V8I6ZNO75vPGv/nEY4/cow/bH7Jxxp71
 CE1awRksJsgEk5Z0CaHfsrwh+m7Isj6HBq4UgOul/6G86pTnIOqFSBBPmXTsZvR+DVAJSWUSbCS
 NqUuJTZOkBO9nm0xfF/i6AjP/+ID9m3w=
X-Gm-Gg: ASbGnctJRtaOmR3/iiU0AUG6T74skF9T5OLfdwhNprOxRbpGXuFxiPKF4+tnnXJcqfn
 feVN7seeoq9Xy6dZ1m13Rf8M0ZgTt8Qnc1p9JErEhlZH8UIevN93w8L6ZtF2VN60mzxmaNGVttr
 1ITw1kfah96YgPtqAFfwK2kSKK47sjSOq6Z1OEaZwDlRwIqAviRthabPfT7/WrkHhiOaIi5EhdB
 l+Brtq/M/++D861oqHxwfoFXBNUAgjIyQ==
X-Google-Smtp-Source: AGHT+IEW6knPiqMjhqg1CsWXzM0Am7GvQ+mxVelPlkPt1JP7ue4KThWpZkJDaJNhj3RD4YPttWj4FZC7v5OYuOR6TPM=
X-Received: by 2002:a17:90b:180a:b0:330:3fb7:d874 with SMTP id
 98e67ed59e1d1-339c27e2dc9mr10969162a91.8.1759818583824; Mon, 06 Oct 2025
 23:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAGfirffPy5biFVLtSNEW60UCXa6_=-=NrQbU7iLQ8+BXnFQ=1A@mail.gmail.com>
 <175922381867.30706.10351894191632562572@jlahtine-mobl>
 <CAGfirfdDe879wFzABVZkTV7grEimpnc0XrrKpj2SX1w_TLtgNg@mail.gmail.com>
 <aN0X3ck-egLMn_Xy@ashyti-mobl2.lan>
 <CAGfirffg4JzGkwaKTm9fL9Nyud4kBALvfW3Et33ZF60e8cVO1g@mail.gmail.com>
In-Reply-To: <CAGfirffg4JzGkwaKTm9fL9Nyud4kBALvfW3Et33ZF60e8cVO1g@mail.gmail.com>
From: =?UTF-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>
Date: Tue, 7 Oct 2025 15:29:32 +0900
X-Gm-Features: AS18NWAJwJZBfwvucMwYUat98KEOwu2C85iSdEGMBYwKufVF5K91QzrHXZw2m3s
Message-ID: <CAGfirfdACPUrW7hxOKXEpaPZ6=Lkwde24CfHov9=75JhXiPApg@mail.gmail.com>
Subject: Re: BUG: unable to handle kernel NULL pointer dereference in
 eb_release_vmas
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, rodrigo.vivi@intel.com, 
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch, 
 ville.syrjala@linux.intel.com, nitin.r.gote@intel.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 syzkaller@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000008ede9b06408bb117"
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

--0000000000008ede9b06408bb117
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I noticed that I had sent the related link to only one person, so I=E2=80=
=99m
resending it just in case.

https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062
<https://l.mailtrack.com/l/a23538b60e872501ef9881ddb3a7e5ffc2cbce55?u=3D123=
92148>

Best Regards,
GangMin Kim.


2025=EB=85=84 10=EC=9B=94 1=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 11:42, =
=EA=B9=80=EA=B0=95=EB=AF=BC <km.kim1503@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=
=91=EC=84=B1:

> The link is as follows.
>
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062
> <https://l.mailtrack.com/l/7ffb70a27148d4fd131a86469e503e9a70232ef6?u=3D1=
2392148>
>
> Best Regards,
> GangMin Kim.
>
> 2025=EB=85=84 10=EC=9B=94 1=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 9:00,=
 Andi Shyti <andi.shyti@linux.intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
> >
> > On Wed, Oct 01, 2025 at 12:14:41AM +0900, =EA=B9=80=EA=B0=95=EB=AF=BC w=
rote:
> > > Ok, I will do it.
> >
> > when you do, can you please paste the link here?
> >
> > Thanks,
> > Andi
> >
> > > Best Regards,
> > > GangMin Kim.
> > >
> > > 2025=EB=85=84 9=EC=9B=94 30=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6=
:17, Joonas Lahtinen
> > > <joonas.lahtinen@linux.intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
> > > >
> > > > Hi,
> > > >
> > > > Can you please open a bug as per the instructions in:
> > > >
> > > >
> https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
> <https://l.mailtrack.com/l/de3b4dc95c086ae49b881e7922499a64745d7a93?u=3D1=
2392148>
> > > >
> > > > Thanks in advance!
> > > >
> > > > Regards, Joonas
>

--0000000000008ede9b06408bb117
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I noticed that I had sent the related lin=
k to only one person, so I=E2=80=99m resending it just in case.<br><br><a h=
ref=3D"https://l.mailtrack.com/l/a23538b60e872501ef9881ddb3a7e5ffc2cbce55?u=
=3D12392148">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062<=
/a><br><br>Best Regards,<br>GangMin Kim.</div><br><br><img width=3D"0" heig=
ht=3D"0" class=3D"mailtrack-img" alt=3D"" style=3D"display:flex" src=3D"htt=
ps://mailtrack.io/trace/mail/0ff16b36172e3d8a1b6f03f56160274b1ff3dff4.png?u=
=3D12392148"><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">2025=EB=85=84 10=EC=9B=94 1=EC=9D=BC (=EC=88=98) =
=EC=98=A4=ED=9B=84 11:42, =EA=B9=80=EA=B0=95=EB=AF=BC &lt;<a href=3D"mailto=
:km.kim1503@gmail.com">km.kim1503@gmail.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=
=9E=91=EC=84=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>The link is as follows.<br>
<br>
<a href=3D"https://l.mailtrack.com/l/7ffb70a27148d4fd131a86469e503e9a70232e=
f6?u=3D12392148" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15062</a><br>
<br>
Best Regards,<br>
GangMin Kim.<br>
<br>
2025=EB=85=84 10=EC=9B=94 1=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 9:00, A=
ndi Shyti &lt;<a href=3D"mailto:andi.shyti@linux.intel.com" target=3D"_blan=
k">andi.shyti@linux.intel.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:=
<br>
&gt;<br>
&gt; On Wed, Oct 01, 2025 at 12:14:41AM +0900, =EA=B9=80=EA=B0=95=EB=AF=BC =
wrote:<br>
&gt; &gt; Ok, I will do it.<br>
&gt;<br>
&gt; when you do, can you please paste the link here?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Andi<br>
&gt;<br>
&gt; &gt; Best Regards,<br>
&gt; &gt; GangMin Kim.<br>
&gt; &gt;<br>
&gt; &gt; 2025=EB=85=84 9=EC=9B=94 30=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=
=84 6:17, Joonas Lahtinen<br>
&gt; &gt; &lt;<a href=3D"mailto:joonas.lahtinen@linux.intel.com" target=3D"=
_blank">joonas.lahtinen@linux.intel.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Can you please open a bug as per the instructions in:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://l.mailtrack.com/l/de3b4dc95c086ae49b881e7=
922499a64745d7a93?u=3D12392148" rel=3D"noreferrer" target=3D"_blank">https:=
//drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks in advance!<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Regards, Joonas<br>
</blockquote></div></div>

--0000000000008ede9b06408bb117--
