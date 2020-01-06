Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6474C1320EA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1162C8991D;
	Tue,  7 Jan 2020 08:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CBD6E516
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 20:47:35 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id m26so49875565ljc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 12:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S0mqKpCEh0T5oGdQ8KLcBf7Df3QAvh9OV/hvSXpMlTg=;
 b=WKuEsDAF6KfV9cqhEhsLilh4GLM0tVgz5prXx49922TtPfkX4Z63/fDSzC5MCxRPaK
 fOjyIMK2jKl2cBi2NRFHlU5JUGewv7o+2AKc0LrPSzP0aNV2pHcz2AF21TJr/yZAFMbO
 BpG/ojwAm29d6xBWgUFm3TwNj3PwsTNFRT+2QCq+rL4+hWl0ULiwxDRr1l0rF3tiQef7
 rtCsdkINV6q5L7G45OLyWeP+oYwEMO9hpxURWeCPeB/HnR0pC8LPP4bFkd1f80n6NqGl
 cGsezUATJgbJ/lQoWiOAxy87i/oFrqNiALobqCLtLExFWSnPLjIzXQhzgOF/lduNDT4a
 0gAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S0mqKpCEh0T5oGdQ8KLcBf7Df3QAvh9OV/hvSXpMlTg=;
 b=H3qQdLiP56RjetZvY0lbnHPQAs33Nw+dg5SWpcKfsWKcXlnNNgA2nxRQAB26+4LeL5
 CyF7EKwjol2N5++D35rCi+4a+FQwg9xmDvWdEO2xk8BFxr9QUQVTp3dLiGjuPtOkobC0
 ZmQq/MwjeyXamVh1X+UJBaN0KLbVc7q0swG+QUPitNSDZ3UILWrirzDwO4W5iiSMRyna
 8evyY4R8WJFZmORDD/9nWPgSQK3DwwoII9EJjItOK/WJChMdrZ1SFVFsvH8ICaYsHIG+
 y6wvhtcSeX1bIgutXar/iO1BDHWzL0Qxo5yqM51xMqpoOVMMRdxmSLYZ1hrhIVq0wmmJ
 Mdpg==
X-Gm-Message-State: APjAAAWL4uZxP8QJCfJQri8DOtPOBkqun7StfT0qprYDIdn0ywmlYt5k
 V8Lk77inloBgqKz47NG8kV1uKSUlmH3Z5T9yx6oW
X-Google-Smtp-Source: APXvYqw4j3klpPHcpNQwpnkmpv1ocQwp8Xbyj57bR7jwCjodHj11UA9OvE7qO6SlV0XN4OEfm6VGBaiGP0SXA4Uar/0=
X-Received: by 2002:a2e:2c16:: with SMTP id s22mr60497543ljs.248.1578343653188; 
 Mon, 06 Jan 2020 12:47:33 -0800 (PST)
MIME-Version: 1.0
References: <CAKT=dDnhth-6giOWgym7qpLNeH=86=XhQmPcgHM2J8B_L3myRQ@mail.gmail.com>
 <2981882.gi1CFgH74X@saphira>
 <CAKT=dD=r46-UckK+hsZMvF0wBFqSe3bGdBa=vs2bOrarpexoPA@mail.gmail.com>
 <1931035.d46ecxlGCF@saphira>
In-Reply-To: <1931035.d46ecxlGCF@saphira>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Mon, 6 Jan 2020 12:47:21 -0800
Message-ID: <CAKT=dDmMs1VOFst3gVUbsAp8yFuvV9e+zq0DqayBQ8G7+utc7g@mail.gmail.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
To: Rohan Garg <rohan.garg@collabora.com>
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
Cc: Alistair Delva <adelva@google.com>, Prahlad Kilambi <prahladk@google.com>,
 dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>,
 Kenny Ho <y2kenny@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Chris Forbes <chrisforbes@google.com>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: multipart/mixed; boundary="===============0715143892=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0715143892==
Content-Type: multipart/alternative; boundary="000000000000c967c4059b7ec41a"

--000000000000c967c4059b7ec41a
Content-Type: text/plain; charset="UTF-8"

Thanks, I'll check it out.

Best,
Yiwei

On Mon, Jan 6, 2020 at 2:46 AM Rohan Garg <rohan.garg@collabora.com> wrote:

> Hi Yiwei
>
> On jueves, 19 de diciembre de 2019 19:52:26 (CET) Yiwei Zhang wrote:
> > Hi Rohan,
> >
> > Thanks for pointing out the pids issue! Then the index would be
> {namespace
> > + pid(in that namespace)}. I'll grab a setup and play with the driver to
> > see what I can do. I know how to find an Intel or Freedreno setup, but
> I'd
> > still like to know is there a development friendly Mali setup?
> >
>
> You should be able to setup a Mali T860 compatible device with this guide
> [1].
>
> Cheers
> Rohan Garg
>
> [1] https://panfrost.freedesktop.org/building-panfrost-mesa.html
>
>
>

--000000000000c967c4059b7ec41a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Thanks, I&#39;ll check it out.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Best,</div><div dir=3D"auto">Yiwei</div><div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 6, 2020 at 2=
:46 AM Rohan Garg &lt;<a href=3D"mailto:rohan.garg@collabora.com">rohan.gar=
g@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Y=
iwei<br>
<br>
On jueves, 19 de diciembre de 2019 19:52:26 (CET) Yiwei Zhang wrote:<br>
&gt; Hi Rohan,<br>
&gt; <br>
&gt; Thanks for pointing out the pids issue! Then the index would be {names=
pace<br>
&gt; + pid(in that namespace)}. I&#39;ll grab a setup and play with the dri=
ver to<br>
&gt; see what I can do. I know how to find an Intel or Freedreno setup, but=
 I&#39;d<br>
&gt; still like to know is there a development friendly Mali setup?<br>
&gt; <br>
<br>
You should be able to setup a Mali T860 compatible device with this guide [=
1].<br>
<br>
Cheers<br>
Rohan Garg<br>
<br>
[1] <a href=3D"https://panfrost.freedesktop.org/building-panfrost-mesa.html=
" rel=3D"noreferrer" target=3D"_blank">https://panfrost.freedesktop.org/bui=
lding-panfrost-mesa.html</a><br>
<br>
<br>
</blockquote></div></div>

--000000000000c967c4059b7ec41a--

--===============0715143892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0715143892==--
