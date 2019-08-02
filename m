Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10FD81385
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CF96E2E4;
	Mon,  5 Aug 2019 07:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29AE6E0A2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 23:29:33 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id v18so74255685ljh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 16:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FqoD94WDLyWA8l9zI3MRA8YgAwJDuCPz2geT9v/93AU=;
 b=n4ylsUBiZ6heNso1xR24KjjpsvfFdQiFdFPZkISiq8FYYcJ67fd3PN5vydn7J9rjeN
 W9oJqR7XnLS5dJZo9Bf2zihf/5qUJAA64FKqZgJwjk89jBViir2L8k3IAUpXhJwRxVpR
 nyctoDvXgsbxcdvyZ2o9bFtKloiDmh0pPWWDKVD/p6Lnrpm17AmWLUuAdE+82L0grtTP
 XqUxtemWbGJSIrGmzZyVE5QBJYQNZ5VtcmdsVBCBt6S2/YnUjQXv12lAbSOjbqxIvbL5
 flm7Fph4fZCLcj0UTc8RiAyLFtBzN+7L2paSl2XIQIOB5ks1kmbIcJdEsTyeQjWCRQN8
 tWuw==
X-Gm-Message-State: APjAAAXqfgZtdGuTAyw6jNT7AlyRMwoLcfsVHjDLdza8KsznV1w/S2v4
 sl1/EJ+iCJn2U3wKBQMiq0n1JfgMrvcXbFTf11Y=
X-Google-Smtp-Source: APXvYqxQomGFhJOzhqjL4fHtC06r+EtvDQrM180ePolUOYxy3p36rmppE8ZrP0N69kgRfCGOdkfnpbPRwWIstlW7o8Q=
X-Received: by 2002:a2e:8802:: with SMTP id x2mr52112581ljh.200.1564788571846; 
 Fri, 02 Aug 2019 16:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <bug-204407-27@https.bugzilla.kernel.org/>
 <20190802132306.e945f4420bc2dcddd8d34f75@linux-foundation.org>
 <20190802203344.GD5597@bombadil.infradead.org>
 <1564780650.11067.50.camel@lca.pw>
 <20190802225939.GE5597@bombadil.infradead.org>
In-Reply-To: <20190802225939.GE5597@bombadil.infradead.org>
From: Petr Vandrovec <petr@vandrovec.name>
Date: Fri, 2 Aug 2019 16:29:20 -0700
Message-ID: <CA+i2_Dc-VrOUk8EVThwAE5HZ1-zFqONuW8Gojv+16UPsAqoM1Q@mail.gmail.com>
Subject: Re: [Bug 204407] New: Bad page state in process Xorg
To: Matthew Wilcox <willy@infradead.org>
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
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
Cc: David Airlie <airlied@linux.ie>, bugzilla-daemon@bugzilla.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0665196511=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0665196511==
Content-Type: multipart/alternative; boundary="000000000000f93a5c058f2aba0c"

--000000000000f93a5c058f2aba0c
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 2, 2019, 3:59 PM Matthew Wilcox <willy@infradead.org> wrote:

> That doesn't help because we call reset_page_owner() in the free page path.
>
> We could turn on tracing because we call trace_mm_page_free() in this
> path.  That requires the reporter to be able to reproduce the problem,
> and it's not clear to me whether this is a "happened once" or "every
> time I do this, it happens" problem.
>

It happened on 3 of the boots with that kernel.  4th time box either
spontaneously rebooted when X started, or watchdog restarted box shortly
after starting X server.

So I believe I should be able to reproduce it with additional patches or
extra flags enabled.

Petr

>

--000000000000f93a5c058f2aba0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, Aug 2, 2019, 3:59 PM Matthew Wilcox &lt;<a href=3D"mai=
lto:willy@infradead.org">willy@infradead.org</a>&gt; wrote:</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
That doesn&#39;t help because we call reset_page_owner() in the free page p=
ath.<br>
<br>
We could turn on tracing because we call trace_mm_page_free() in this<br>
path.=C2=A0 That requires the reporter to be able to reproduce the problem,=
<br>
and it&#39;s not clear to me whether this is a &quot;happened once&quot; or=
 &quot;every<br>
time I do this, it happens&quot; problem.<br></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">It happened on 3 of the boots with=
 that kernel.=C2=A0 4th time box either spontaneously rebooted when X start=
ed, or watchdog restarted box shortly after starting X server.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">So I believe I should be able to rep=
roduce it with additional patches or extra flags enabled.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Petr</div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div></div=
>

--000000000000f93a5c058f2aba0c--

--===============0665196511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0665196511==--
