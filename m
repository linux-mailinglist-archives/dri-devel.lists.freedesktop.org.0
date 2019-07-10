Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F660642B9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F220589C16;
	Wed, 10 Jul 2019 07:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.supremebox.com (mx1.supremebox.com [198.23.53.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534388933C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 05:06:24 +0000 (UTC)
Received: from 184-96-235-43.hlrn.qwest.net ([184.96.235.43]
 helo=[192.168.0.12]) by mx1.supremebox.com with esmtpa (Exim 4.89)
 (envelope-from <opensource@jilayne.com>)
 id 1hl4o3-0005Rm-HA; Wed, 10 Jul 2019 05:06:15 +0000
From: J Lovejoy <opensource@jilayne.com>
Message-Id: <483C9F3D-953E-409F-B200-A8958D83313E@jilayne.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2] gpu/drm_memory: fix a few warnings
Date: Tue, 9 Jul 2019 23:06:13 -0600
In-Reply-To: <alpine.DEB.2.21.1907082150170.1961@nanos.tec.linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
References: <1562609151-7283-1-git-send-email-cai@lca.pw>
 <CAKb7UvhoW2F5LSf4B=vJhLykPCme_ixwbUBup_sBXjoQa72Fzw@mail.gmail.com>
 <1562614919.8510.9.camel@lca.pw>
 <alpine.DEB.2.21.1907082150170.1961@nanos.tec.linutronix.de>
X-Mailer: Apple Mail (2.3445.104.11)
X-Sender-Ident-agJab5osgicCis: opensource@jilayne.com
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=jilayne.com
 ; s=default; h=References:To:Cc:In-Reply-To:Date:Subject:Mime-Version:
 Content-Type:Message-Id:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h/GuwsNoDe3CUWf9i8jiGdd8ZF3UgtKH2q5ZsEJyUBs=; b=ATDxUypk7mie/V46wtc6G+I34G
 jGEsfGyUMoiF7ICOwPfcdRfkgFyxy3D1GlamnZWOVfMrWe54l9b2JLNSqZXRrFk7C2bnA/YptuQ6x
 2ZnfrAozd/PSF1jCGaobaZA4UknO2kjRhjI8WdKFjPiHkQuuSIRhI69t1KMVFQlPtUfo=;
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Richard Fontana <rfontana@redhat.com>, Qian Cai <cai@lca.pw>,
 Greg KH <gregkh@linuxfoundation.org>, joe@perches.com,
 linux-spdx@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1605920519=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1605920519==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_70AC868E-5265-4424-95DF-697879078E25"


--Apple-Mail=_70AC868E-5265-4424-95DF-697879078E25
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jul 8, 2019, at 1:57 PM, Thomas Gleixner <tglx@linutronix.de> =
wrote:
>=20
> On Mon, 8 Jul 2019, Qian Cai wrote:
>> On Mon, 2019-07-08 at 15:21 -0400, Ilia Mirkin wrote:
>>>> -/**
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>>   * \file drm_memory.c
>>>>   * Memory management wrappers for DRM
>>>>   *
>>>> @@ -12,25 +13,6 @@
>>>>   * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
>>>>   * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
>>>>   * All Rights Reserved.
>>>> - *
>>>> - * Permission is hereby granted, free of charge, to any person =
obtaining a
>>>> - * copy of this software and associated documentation files (the
>>>> "Software"),
>>>> - * to deal in the Software without restriction, including without
>>>> limitation
>>>> - * the rights to use, copy, modify, merge, publish, distribute, =
sublicense,
>>>> - * and/or sell copies of the Software, and to permit persons to =
whom the
>>>> - * Software is furnished to do so, subject to the following =
conditions:
>>>> - *
>>>> - * The above copyright notice and this permission notice =
(including the
>>>> next
>>>> - * paragraph) shall be included in all copies or substantial =
portions of
>>>> the
>>>> - * Software.
>>>> - *
>>>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, =
EXPRESS
>>>> OR
>>>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF =
MERCHANTABILITY,
>>>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO =
EVENT SHALL
>>>> - * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, =
DAMAGES
>>>> OR
>>>=20
>>> This talks about VA Linux Systems and/or its suppliers, while the =
MIT
>>> licence talks about authors or copyright holders.
>=20
> That's looks lika a valid substitution and does not change the meaning =
of
> the license, AFAICT.=20

As of the 3.6 release of the SPDX License List, we will have added =
markup to denote that the name in the disclaimer can be changed and =
still considered a match. This is a common scenario in other licenses =
(like the BSD family), but I don=E2=80=99t think we=E2=80=99d come =
across it until the work on the kernel and adding SPDX identifiers. So, =
yes, MIT would be the correct SPDX identifier here as of 3.6 (which will =
be posted in a few days).

For reference, the SPDX License List matching guidelines can be found =
here: https://spdx.org/spdx-license-list/matching-guidelines =
<https://spdx.org/spdx-license-list/matching-guidelines> - see Guideline =
2.1.3 specifically. Replaceable text is marked up in the master files =
that comprise the SPDX License List according the the XML schema and =
then displayed in color coded text on the website pages (see, for =
example, BSD-3-Clause - https://spdx.org/licenses/BSD-3-Clause.html =
<https://spdx.org/licenses/BSD-3-Clause.html>

Of course, if anyone finds any other license text that deserves this =
kind of accommodation, you can always make a PR here: =
https://github.com/spdx/license-list-XML =
<https://github.com/spdx/license-list-XML> :)

thanks,
Jilayne
SPDX legal team co-lead


--Apple-Mail=_70AC868E-5265-4424-95DF-697879078E25
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jul 8, 2019, at 1:57 PM, Thomas Gleixner &lt;<a =
href=3D"mailto:tglx@linutronix.de" class=3D"">tglx@linutronix.de</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">On Mon, 8 Jul 2019, Qian Cai wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">On Mon, 2019-07-08 at 15:21 -0400, Ilia Mirkin =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D""><blockquote =
type=3D"cite" class=3D"">-/**<br class=3D"">+// SPDX-License-Identifier: =
MIT<br class=3D"">+/*<br class=3D"">&nbsp; * \file drm_memory.c<br =
class=3D"">&nbsp; * Memory management wrappers for DRM<br =
class=3D"">&nbsp; *<br class=3D"">@@ -12,25 +13,6 @@<br class=3D"">&nbsp; =
* Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.<br =
class=3D"">&nbsp; * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, =
California.<br class=3D"">&nbsp; * All Rights Reserved.<br class=3D"">- =
*<br class=3D"">- * Permission is hereby granted, free of charge, to any =
person obtaining a<br class=3D"">- * copy of this software and =
associated documentation files (the<br class=3D"">"Software"),<br =
class=3D"">- * to deal in the Software without restriction, including =
without<br class=3D"">limitation<br class=3D"">- * the rights to use, =
copy, modify, merge, publish, distribute, sublicense,<br class=3D"">- * =
and/or sell copies of the Software, and to permit persons to whom the<br =
class=3D"">- * Software is furnished to do so, subject to the following =
conditions:<br class=3D"">- *<br class=3D"">- * The above copyright =
notice and this permission notice (including the<br class=3D"">next<br =
class=3D"">- * paragraph) shall be included in all copies or substantial =
portions of<br class=3D"">the<br class=3D"">- * Software.<br class=3D"">- =
*<br class=3D"">- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY =
OF ANY KIND, EXPRESS<br class=3D"">OR<br class=3D"">- * IMPLIED, =
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,<br =
class=3D"">- * FITNESS FOR A PARTICULAR PURPOSE AND =
NONINFRINGEMENT.&nbsp;&nbsp;IN NO EVENT SHALL<br class=3D"">- * VA LINUX =
SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES<br =
class=3D"">OR<br class=3D""></blockquote><br class=3D"">This talks about =
VA Linux Systems and/or its suppliers, while the MIT<br class=3D"">licence=
 talks about authors or copyright holders.<br =
class=3D""></blockquote></blockquote><br class=3D"">That's looks lika a =
valid substitution and does not change the meaning of<br class=3D"">the =
license, AFAICT.&nbsp;</div></div></blockquote><br =
class=3D""></div><div>As of the 3.6 release of the SPDX License List, we =
will have added markup to denote that the name in the disclaimer can be =
changed and still considered a match. This is a common scenario in other =
licenses (like the BSD family), but I don=E2=80=99t think we=E2=80=99d =
come across it until the work on the kernel and adding SPDX identifiers. =
So, yes, MIT would be the correct SPDX identifier here as of 3.6 (which =
will be posted in a few days).<br class=3D""><br class=3D"">For =
reference, the SPDX License List matching guidelines can be found =
here:&nbsp;<a =
href=3D"https://spdx.org/spdx-license-list/matching-guidelines" =
class=3D"">https://spdx.org/spdx-license-list/matching-guidelines</a>&nbsp=
;- see Guideline 2.1.3 specifically. Replaceable text is marked up in =
the master files that comprise the SPDX License List according the the =
XML schema and then displayed in color coded text on the website pages =
(see, for example, BSD-3-Clause -&nbsp;<a =
href=3D"https://spdx.org/licenses/BSD-3-Clause.html" =
class=3D"">https://spdx.org/licenses/BSD-3-Clause.html</a><br =
class=3D""><br class=3D"">Of course, if anyone finds any other license =
text that deserves this kind of accommodation, you can always make a PR =
here:&nbsp;<a href=3D"https://github.com/spdx/license-list-XML" =
class=3D"">https://github.com/spdx/license-list-XML</a>&nbsp;:)<br =
class=3D""><br class=3D"">thanks,<br class=3D"">Jilayne<br class=3D"">SPDX=
 legal team co-lead</div><br class=3D""></body></html>=

--Apple-Mail=_70AC868E-5265-4424-95DF-697879078E25--

--===============1605920519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1605920519==--
