Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D048381357
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79C5898A3;
	Mon,  5 Aug 2019 07:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482A96E424
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 02:42:07 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id az7so34277903plb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 19:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CD0xPHmCqIGwmXCKmScvuNDZsnUPkB0OS6IdZRmBxmw=;
 b=Lo59lNQebx9awJpQWQa2t0axq+3wkfZoHGDCIm5bdNVoyFljjAHfhDulrC9pdy+rTO
 q70i0B0oDm9Q6f4nRSYgWq9xuI4T0n2m7SDb5apaPiah/BRkdbqUUtugLBAmFDGgF2ZD
 5vBUahg905Z2oSaLaO2j8ZMZIj8z+wnMKvRWM7P3rbU6k0JxiLdRY3PUSx6X+0q290rN
 ZctBdMy8GCyX546pw89aVvR188nzxhSZ9UAYJEBXkZRKJLIcY13HgvgmAjqCIxKKbtZz
 O6LedCuBRlUlSGf4CVj+il6Pf48aZJHQuQDZ7zI5rAR6wWqCADJrjQwXy50AKYHUFqjl
 ZQnw==
X-Gm-Message-State: APjAAAX/OPjbbE40OkAaptSm1512c6mwZl5BSvQ9p51Rx4MXCbzD8+AR
 RV0HU8wd8zFS/Rk6vXbXqlXLNU7HWoZm1BaH3BNDuw==
X-Google-Smtp-Source: APXvYqzIR0GKhKOsV4BnlKK7aHmzJfWvGf46SK4zbyKp26GxmipM7NHkF7IpoEmO+MhKjh76ytfq5mOyyY1FrYE3048=
X-Received: by 2002:a17:902:86:: with SMTP id
 a6mr47710748pla.244.1564800126910; 
 Fri, 02 Aug 2019 19:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <CA+quO7KJTrp_RpFJ8fpv6jCgKNv98uZLpU2sRe_ye-xTG6=4jA@mail.gmail.com>
 <20190730163510.GC14551@arch-x1c3>
 <CA+quO7+kJws7bSJRirFjc5YFROB+oVMJieU-cHnLu4ZLqGNQuA@mail.gmail.com>
In-Reply-To: <CA+quO7+kJws7bSJRirFjc5YFROB+oVMJieU-cHnLu4ZLqGNQuA@mail.gmail.com>
From: Jerry Han <jerry.han.hq@gmail.com>
Date: Sat, 3 Aug 2019 10:41:55 +0800
Message-ID: <CA+quO7+AaxBgNqxunnPTwEoW6DwyD9oo8da-wN+NpsPH-ULAkA@mail.gmail.com>
Subject: Re: [PATCH] [v9] drm/panel: Add Boe Himax8279d MIPI-DSI LCD panel
To: Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000b626e3058f2d6b3b"
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CD0xPHmCqIGwmXCKmScvuNDZsnUPkB0OS6IdZRmBxmw=;
 b=jSSE71But8rpZ/0YbnvsJqVQC4LWZ99sHOPfWfnB//TH3/rivtFenQGZ6qO+EkWQbV
 nnuk0YYT+GQxL7hlxeuAUlai02Nru3HPddhD8Yz/bM2W4MR3ulYQUzU8TBtgSG5hVfmX
 fAjsaGLIl8VAiTk+342O8+GiO98BuusP9Mpg3N7vtLCyKq4yyMXwN9Yrjuobd3JIrMYD
 qofb23k27jsS15vEl89JB1qArfk57RRhfWyhbVufuEPTyHFhmKY/CI+jIwgDf7RPZEVZ
 SDr1JKXkYjHwVL+ghjDKpDldQUPgmvGNVDViqnGQM7Kdnkvt63F7Rz6PBnf79GGxN2FY
 Qsdg==
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
Cc: Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Derek Basehore <dbasehore@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rock wang <rock_wang@himax.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b626e3058f2d6b3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add Patch~5

Jerry Han <jerry.han.hq@gmail.com> =E4=BA=8E2019=E5=B9=B48=E6=9C=883=E6=97=
=A5=E5=91=A8=E5=85=AD =E4=B8=8A=E5=8D=8810:10=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Emil:
>
> thanks for you advice.
>
> V1: https://patchwork.freedesktop.org/patch/287425/
> V2: https://patchwork.freedesktop.org/patch/289843/
> V3: https://patchwork.freedesktop.org/patch/290393/
> V4: https://patchwork.freedesktop.org/patch/290396/
> V5: https://patchwork.freedesktop.org/patch/291131/   (only modify
> commit message Added changelog, no files modified)
> V6: https://patchwork.freedesktop.org/patch/291650/
> V7: https://patchwork.freedesktop.org/patch/294141/
> V8: https://patchwork.freedesktop.org/patch/301925/
> V9: https://patchwork.freedesktop.org/patch/320514/
>
> Emil Velikov <emil.l.velikov@gmail.com> =E4=BA=8E2019=E5=B9=B47=E6=9C=883=
1=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=8812:35=E5=86=99=E9=81=93=EF=
=BC=9A
>
> >
> > Hi Jerry,
> >
> > On 2019/07/29, Jerry Han wrote:
> > >
> > > From 9c63ed65469e075430a07f89012cd116c427bd6f Mon Sep 17 00:00:00 200=
1
> > > From: Jerry Han <hanxu5@huaqin.corp-partner.google.com>
> > > Date: Mon, 29 Jul 2019 11:30:48 +0800
> > > Subject: [PATCH] [v9] drm/panel: Add Boe Himax8279d MIPI-DSI LCD pane=
l
> > >
> > Please submit patches as outlined in the documentation [1].
> >
> > As a non native English speaker to another, I would suggest carefully
> > reading through the instructions. I found them very useful.
> >
> > HTH
> > Emil
> >
> > [1] Documentation/process/submitting-patches.rst

--000000000000b626e3058f2d6b3b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0005-v5-2-2-drm-panel-Add-Boe-Himax8279d-MIPI-DSI-LCD-pan.patch"
Content-Disposition: attachment; 
	filename="0005-v5-2-2-drm-panel-Add-Boe-Himax8279d-MIPI-DSI-LCD-pan.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jyuxl28g0>
X-Attachment-Id: f_jyuxl28g0

RnJvbSAxMjRkOGVlZWUwMjg1NGEzYjlkNmZiYTlkNmE1Y2VlZDZkNmY4MjBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKZXJyeSBIYW4gPGhhbnh1NUBodWFxaW4uY29ycC1wYXJ0bmVy
Lmdvb2dsZS5jb20+CkRhdGU6IFRodSwgMSBBdWcgMjAxOSAxNjowNjoyMiArMDgwMApTdWJqZWN0
OiBbUEFUQ0ggMDUvMTBdIFt2NSwyLzJdIGRybS9wYW5lbDogQWRkIEJvZSBIaW1heDgyNzlkIE1J
UEktRFNJIExDRAogcGFuZWwKClN1cHBvcnQgQm9lIEhpbWF4ODI3OWQgOC4wIiAxMjAweDE5MjAg
VEZUIExDRCBwYW5lbCwgaXQgaXMgYSBNSVBJIERTSQpwYW5lbC4KCnY1OgotIEFkZGVkIGNoYW5n
ZWxvZwoKdjQ6Ci0gRnJlZml4IGFsbCBmdW5jdGlvbiBtYWVzIHdpdGggYm9lXyAoU2FtKQotIEZz
ZWQgImVuYWJsZV9ncGlvIiByZXBsYWNlICJyZXNldF9ncGlvIiwgTWFrZSBpdCBsb29rIGNsZWFy
ZXIgKFNhbSkKLSBTb3J0IGluY2x1ZGUgbGluZXMgYWxwaGFiZXRpY2FsbHkgKFNhbSkKLSBGaXhl
ZCBlbnRyaWVzIGluIHRoZSBtYWtlZmlsZSBtdXN0IGJlIHNvcnRlZCBhbHBoYWJldGljYWxseSAo
U2FtKQotIEFkZCBzZW5kX21pcGlfY21kcyBmdW5jdGlvbiB0byBhdm9pZCBkdXBsaWNhdGluZyB0
aGUgY29kZSAoU2FtKQotIEFkZCB0aGUgbmVjZXNzYXJ5IGRlbGF5KHJlc2V0X2RlbGF5X3Q1KSBi
ZXR3ZWVuIHJlc2V0IGFuZCBzZW5kaW5nCiAgICB0aGUgaW5pdGlhbGl6YXRpb24gY29tbWFuZCAo
Um9jayB3YW5nKQoKdjM6Ci0gUmVtb3ZlIHVubmVjZXNzYXJ5IGRlbGF5cyBpbiBzZW5kaW5nIGlu
aXRpYWxpemF0aW9uIGNvbW1hbmRzIChKaXRhbyBTaGkpCgpWMjoKLSBVc2UgU1BEWCBpZGVudGlm
aWVyIChTYW0pCi0gVXNlIG5lY2Vzc2FyeSBoZWFkZXIgZmlsZXMgcmVwbGFjZSBkcm1QLmggKFNh
bSkKLSBEZWxldGUgdW5uZWNlc3NhcnkgaGVhZGVyIGZpbGVzICNpbmNsdWRlIDxsaW51eC9lcnIu
aD4gKFNhbSkKLSBTcGVjaWZpZXMgYSBHUElPcyBhcnJheSB0byBjb250cm9sIHRoZSByZXNldCB0
aW1pbmcsCiAgICBpbnN0ZWFkIG9mIHJlYWRpbmcgImRzaS1yZXNldC1zZXF1ZW5jZSIgZGF0YSBm
cm9tIERUUyAoU2FtKQotIERlbGV0ZSBiYWNrbGlnaHRfZGlzYWJsZSgpIGZ1bmN0aW9uIHdoZW4g
YWxyZWFkeSBkaXNhYmxlZCAoU2FtKQotIFVzZSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KCkgcmVw
bGFjZSBvZl9maW5kX2JhY2tsaWdodF9ieV9ub2RlKCkgKFNhbSkKLSBNb3ZlIHRoZSBuZWNlc3Nh
cnkgZGF0YSBpbiB0aGUgRFRTIHRvIHRoZSBjdXJyZW50IGZpbGUsCiAgICBsaWtlIHBvcmNoLCBk
aXNwbGF5X21vZGUgYW5kIEluaXQgY29kZSBldGMuIChTYW0pCi0gQWRkIGNvbXBhdGlibGUgZGV2
aWNlICJib2UsaGltYXg4Mjc5ZDEwcCIgKFNhbSkKClYxOgotIFN1cHBvcnQgQm9lIEhpbWF4ODI3
OWQgOC4wIiAxMjAweDE5MjAgVEZUIExDRCBwYW5lbCwgaXQgaXMgYSBNSVBJIERTSQogICAgcGFu
ZWwuCgpTaWduZWQtb2ZmLWJ5OiBKZXJyeSBIYW4gPGhhbnh1NUBodWFxaW4uY29ycC1wYXJ0bmVy
Lmdvb2dsZS5jb20+CkNjOiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+CkNjOiBE
ZXJlayBCYXNlaG9yZSA8ZGJhc2Vob3JlQGNocm9taXVtLm9yZz4KQ2M6IFJvY2sgd2FuZyA8cm9j
a193YW5nQGhpbWF4LmNvbS5jbj4KLS0gCjIuMTcuMQoK
--000000000000b626e3058f2d6b3b
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--000000000000b626e3058f2d6b3b--
