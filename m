Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1884530B2C0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 23:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D286E895;
	Mon,  1 Feb 2021 22:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632A26E894;
 Mon,  1 Feb 2021 22:30:56 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id q5so17216999ilc.10;
 Mon, 01 Feb 2021 14:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=c++p+CPyRtJVbUdZB4mUocM9nn+KvqrZm3cu3JJaIjE=;
 b=jI9vSDlXyQ0UrBtRif6VGPwU/vnY1jfKC3GUUVz2TwC0nLwryKsoWxoGdcJ6sqdFHU
 djMzWofJCRzCnccIZZ+d9m0ZWC7u0MtBW6V5chaT6L/lFXktueqJA4InU3lmurjztCYE
 1R2Nwm8/9iH9j8W/B8TiYpcm6iEpDHkXvdMOIPbQvPAlB/5BlViyaKUV9TolEklxb3YX
 3suxqnjF/eXD1ch4hjtUiudJRCBcWpkzERk+VnoXIyhx4SLpIaZZN0PudbROwNJofpMZ
 uLxzJigT5EiNgNT/bMhWeBoVg0P4C3ts+SyqxOgDFVzy+cekeTK7xthXh106BRAsuDOH
 VXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=c++p+CPyRtJVbUdZB4mUocM9nn+KvqrZm3cu3JJaIjE=;
 b=SgwxTxX8DcF5VAS34mToCn3S1/mlNfcBNP8GmsODyTs2+oU2CassueX8K/k8FF6e6a
 nVlD583R1O1jCUw6zAmgR2F8MclXFJXbUVp1R2wzeI3JrTLiNHiQ81W6gQzKoZ3KndN3
 H/iBPf5kXqJCw5Qe0FL9FlNXcNT/ZvsuePhoJxKjiJPXn8Bqo9DyHS2n9iP6W/vNIerk
 ULZ4TcY3kTeAcVuY/YYSfPoIrSFc1Fk2FcLz1hix+qyLZ2e/g7sbFjnGZi6IXf608ha0
 xRNoxosOJE0Zmk8tHp+/ZFetdzUdLNNgmwmMun45gj1FgvbrHdrQ+Q2nwzEsxkVlDGba
 QWqA==
X-Gm-Message-State: AOAM530Tk6e+20ypk2BGlCERVFPRtHyTwhYKgP5KoB+BHSW5yBBRr25l
 M5kfgp/A+AHHte0BG7WnlA7L3+YVXBpYPcsj+NXaPIKrHIgHbA==
X-Google-Smtp-Source: ABdhPJxZr69kkr/+4IvRctwDE8eO6ufucpDd5xyK6szW/3uLVeRFpM6aQlOWLICLn/o8qNMtQMjhu4DsFl3QFn9VAj8=
X-Received: by 2002:a92:589c:: with SMTP id z28mr9353906ilf.275.1612218655169; 
 Mon, 01 Feb 2021 14:30:55 -0800 (PST)
MIME-Version: 1.0
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 1 Feb 2021 17:30:44 -0500
Message-ID: <CAHUNapTB1tt6T931LfBWVWreXGFwd6tTPqH58i7s3WKivCDT4g@mail.gmail.com>
Subject: should we do GSoC 2021?
To: ML mesa-dev <mesa-dev@lists.freedesktop.org>, 
 "X.Org Devel List" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 wayland <wayland-devel@lists.freedesktop.org>
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
Content-Type: multipart/mixed; boundary="===============1773198004=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1773198004==
Content-Type: multipart/alternative; boundary="0000000000003de3cb05ba4de8aa"

--0000000000003de3cb05ba4de8aa
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

There are discussions regarding whether or not we want to participate in
GSoC this year. Org applications are open now until Feb 19.

Last year at the GSoC Mentor Summit (Oct 2020) it was announced that
changes were coming to GSoC 2021:
- the amount of time a student is expected to spend on a project is halved
- stipends are halved
- overall duration is shortened to 10 weeks
- lowered eligibility requirements

As a result, project expectations are supposed to be reduced as well.
Whereas previously a student was expected to work 350 hours and had to be
enrolled in an accredited university programme, now projects are expected
to take a student 175 hours and accredited colleges and coding camps are
acceptable.

What this means right now is that our list of ideas (
https://www.x.org/wiki/SummerOfCodeIdeas/) needs to be checked to see if
it's still suitable. Are the project ideas still valid? Are they something
a student could do in 175 hours?

Some people feel that 175 hours might not be enough time to contribute a
significant coding effort against an fd.o project. At this point my gut
feeling is to hold off on the application. If I can't find anyone to help
go through the ideas list or who are willing to mentor under these new
changes then we'll need to consider our options.

Thoughts?

Thanks so much for reading, best regards,
    Trevor

--0000000000003de3cb05ba4de8aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>There are=C2=A0discussions=
 regarding whether or not we want to participate in GSoC this year. Org app=
lications are open now until Feb 19.</div><div><br></div><div>Last year at =
the GSoC Mentor Summit (Oct 2020) it was announced that changes were coming=
 to GSoC 2021:</div><div>- the amount of time a student is expected to spen=
d on a project is halved<br></div><div>- stipends are halved</div><div>- ov=
erall duration is shortened to 10 weeks</div><div>- lowered eligibility req=
uirements</div><div><br></div><div>As a result, project expectations are su=
pposed to be reduced as well. Whereas previously a student was expected to =
work 350 hours and had to be enrolled in an accredited university programme=
, now projects are expected to take a student 175 hours and accredited coll=
eges and coding camps are acceptable.</div><div><br></div><div>What this me=
ans right now is that our list of ideas (<a href=3D"https://www.x.org/wiki/=
SummerOfCodeIdeas/">https://www.x.org/wiki/SummerOfCodeIdeas/</a>) needs to=
 be checked to see if it&#39;s still suitable. Are the project ideas still =
valid? Are they something a student could do in 175 hours?</div><div><br></=
div><div>Some people feel that 175 hours might not be enough time to contri=
bute a significant coding effort against an fd.o project. At this point my =
gut feeling is to hold off on the application. If I can&#39;t find anyone t=
o help go through the ideas list or who are willing to mentor under these n=
ew changes then we&#39;ll need to consider our options.</div><div><br></div=
><div>Thoughts?</div><div><br></div><div>Thanks so much for reading, best r=
egards,</div><div>=C2=A0 =C2=A0 Trevor</div></div>

--0000000000003de3cb05ba4de8aa--

--===============1773198004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1773198004==--
