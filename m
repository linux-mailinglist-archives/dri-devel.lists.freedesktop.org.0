Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2192B44B
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E136089DA4;
	Mon, 27 May 2019 12:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B308898A7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 07:19:35 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id t24so13940884otl.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 00:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gCXDaAhhepVdGqAEbXkzp+/iup+G9YqvUqXeaScPOVM=;
 b=eVboSO+TLbODoc0JiYBvj/a+y1PayUZIlo8XcS8fmA/8GM5d0BTOAkiGRTpdlGbDBw
 uP84moQL947Q3aWB8xOtCS2CIUNQwyjaZTIa+sA7gAA2UcfckVAjtrgWZszKpzBRvPIu
 0upp++xhb7Omlpc53PEzEM73SN1eMO/5zp3DrJpV0LGcGXaWOXtzDTYpCg/Bilplx8uT
 PX57MdDrLL6XnKEf4/6ymRPGybYf4nVgjUAro/Ve47Zm/52/Meqkwmx38ww7n0FbPkGn
 eYvkCXfm8mkDnRYYW7ygqt4w4s8v/xQG6ZUrCQ1ZCeTPIaVGVH0DAzhyfx7QsKrkaZiF
 ukWw==
X-Gm-Message-State: APjAAAVShiTFzlIi30dytgWs18MAnEF984Vx0Wd/lpYNqAMBMPLrKYx7
 FWfih0lLkEpkP710UOhdezOxPLHmVndAT8BxvfuIzQ==
X-Google-Smtp-Source: APXvYqyV5lNoAHhavVEOaod/dIZxEpZX8b0x/V2HwgzxLRRXymwIN1yUj5sQjT5boFUaf1KLLBiFhNTiRGFPkBbmVzg=
X-Received: by 2002:a9d:878:: with SMTP id 111mr1819536oty.76.1558941574902;
 Mon, 27 May 2019 00:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190527010753.GA15000@smart-ThinkPad-T410>
In-Reply-To: <20190527010753.GA15000@smart-ThinkPad-T410>
From: Vikas Patil <vikasmpatil@gmail.com>
Date: Mon, 27 May 2019 09:19:23 +0200
Message-ID: <CA+kt3u3PLY=GgAQZC+eq_4fda+FrymH1ZC2BKzbZEkPLE=j_eQ@mail.gmail.com>
Subject: Re: [ADV7393] DRM Encoder Slave or DRM Bridge
To: CA+kt3u11xsbjhZ2mNRfJUBbqtrPaUJHsEMk9CfzLdEED=xBXSw@mail.gmail.com
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gCXDaAhhepVdGqAEbXkzp+/iup+G9YqvUqXeaScPOVM=;
 b=FBXWl1yFIwEkQCfW6aouz9uvhTtRL5dX7MnLblEEaClBQG3txz5ZSsqnXY4+S0f21V
 LKPGqAfccM/t5aaABKOM0fuELZqTCX2H5M/4tdyFOb5kIsY4OL9xsCTCu/XBQqRJ3zty
 zb7sRPzsbCju0z1zEWBa0bSKEROqwPAKBYkmNFAXGK2cE9uifs9pz8dajC7fGH/LUeWH
 +6FjnhB3MKKCdKvWbjAdIuE3FNyq96dBbdFyxJlVPnt7Ml1p8vVmZhU1/a5GlPh3jut7
 4l+Q4H9ExS9Q0GPQ4W4PjRRiSVcmAPuv6epqC4WqzQZOPh15B6waFqjug/xqeWZ5WyQq
 ECQg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Valkeinen, Tomi" <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1504284073=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1504284073==
Content-Type: multipart/alternative; boundary="000000000000cc38dc0589d95eb3"

--000000000000cc38dc0589d95eb3
Content-Type: text/plain; charset="UTF-8"

Hi Nasser,

No, problem was not solved and I left it as priorities of my work changed.

Best Regards,
Vikash

On Mon, May 27, 2019 at 3:08 AM nasser afshin <afshin.nasser@gmail.com>
wrote:

> Hi Vikash,
>
> As it's been quite a while, I want to know if the problem is solved
> successfully
> If so, could you please shed some light on the problem solving path?
>
> Working on a custom hardware based on TI AM5728, and having the same
> problem at hand, I just was curious if some one has been able to write a
> omapdrm based driver for ADV7393.
>
> Any help would greatly be appreciated.
>
> Kind Regards,
> Nasser Afshin
>
>

--000000000000cc38dc0589d95eb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div>Hi Nasser,</div><div><br><=
/div><div>No, problem was not solved and I left it as priorities of my work=
 changed.</div><div><br></div><div>Best Regards,</div><div>Vikash</div><div=
><br></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, May 27, 2019 at 3:08 AM nasser afshin &lt;<a href=3D"mailto:a=
fshin.nasser@gmail.com">afshin.nasser@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi Vikash,<br>
<br>
As it&#39;s been quite a while, I want to know if the problem is solved suc=
cessfully<br>
If so, could you please shed some light on the problem solving path?<br>
<br>
Working on a custom hardware based on TI AM5728, and having the same<br>
problem at hand, I just was curious if some one has been able to write a<br=
>
omapdrm based driver for ADV7393.<br>
<br>
Any help would greatly be appreciated.<br>
<br>
Kind Regards,<br>
Nasser Afshin<br>
<br>
</blockquote></div></div></div>

--000000000000cc38dc0589d95eb3--

--===============1504284073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1504284073==--
