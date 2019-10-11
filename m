Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CECD45C9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 18:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3EC6EC69;
	Fri, 11 Oct 2019 16:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEAF6E084;
 Fri, 11 Oct 2019 15:34:12 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id n7so14435210qtb.6;
 Fri, 11 Oct 2019 08:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V7OJkDZoc7MpF2VpVhlcYlKrjQTfWtwuo6XXDvDozPk=;
 b=fbFFB/1bGY2pLPCtQ6oj2vkpTY6eaQ+oljJb1ToLLDDHuCbhFwHsq6T3cU3/5WkqAc
 toVQ2eCxUl++6Ekv0tou1iegYFJZwzboASBTPkuHcIFS0Wjw8MtcJ/xtYrkEELzj+p2Y
 7R0RKUMwDkDj0bzCw2HqjKIHNeBsjnVy6SNXazBxpJOo20cizT0b+5ZLapDEqsrbUT4c
 rglbqlEldvuroqDEG9/Qd3oM1SGL5ROIdZHAbW/zmavpzwzBO4JlQOsSw4l6j5NWwR+K
 fyWwExGHAremp2mh6Ui8p4QVT8utA6Ri/WDfEZoUEoU+YMqKMOXDvBKKwuqipNKhQ732
 au7Q==
X-Gm-Message-State: APjAAAWqR/RahXqgkRFDwKmRSKBU71y+lk1rMJwF3qWLHgwVTnSdC7Gv
 h+UZ+eJH4E/Z53Vuglj143J55mpVc5Ccj83Q3tBOpBE0WQY=
X-Google-Smtp-Source: APXvYqzEowOkaeSUUQD7RyBBGm9NZTOZj9CXulBnBsaWcFVe/NZ7n3iB+OLVAKSjoZg+Hb0MiHHHqBTUGCRvrrp4RIs=
X-Received: by 2002:ac8:2727:: with SMTP id g36mr13576324qtg.202.1570808051286; 
 Fri, 11 Oct 2019 08:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAEk+mvvz1SJQD0Yo8s0oB8=jN4yh2ZbURmZ8Ln1VKxcfBE96DQ@mail.gmail.com>
 <20191011101243.GI1208@intel.com>
In-Reply-To: <20191011101243.GI1208@intel.com>
From: John Maguire <jmaguire2013@gmail.com>
Date: Fri, 11 Oct 2019 11:33:58 -0400
Message-ID: <CAEk+mvtupRAM9TX6q0v=Zsq3EFRkxFkH0sxfKMUdDPKMczUOwg@mail.gmail.com>
Subject: Re: Kernel crash on 4.19.77-1-lts (Arch Linux / ThinkPad T470p)
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailman-Approved-At: Fri, 11 Oct 2019 16:52:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=V7OJkDZoc7MpF2VpVhlcYlKrjQTfWtwuo6XXDvDozPk=;
 b=ZrBinj/lBMEOKeKaw/43xtoNESntV3FMcvBLALdu4s6nhuQ3xkuzYSOtpjAD03ww51
 6nqnYuZ8/S3b6Liv8sFK1tsNQPcUGV/u6GPdkFiNNj/sHZpGCQAw4XSRyqATAmZMkCHm
 3RF/VoyGWxBfQzGI8QimLqXnnZRfe8WFL8VYDWsmVopQ0mPN/saxjC6C9GxCLmUNgqSF
 t5dwBNcKueZDK1+9909gia3vmzDORBt0/gOm0LIZo4HegP88ABbFg2zIfqjZ8BnWV858
 3dyJWVKh/ihwrhjI3dV8VpyOZl3KOgdgY/WJkDmd5TQkbTh++KST8xwybf18TRIlzZNX
 tTTg==
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0884411103=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0884411103==
Content-Type: multipart/alternative; boundary="000000000000e847210594a43fae"

--000000000000e847210594a43fae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Just use Cc. We want all replies to go to the list(s) as well.
Sorry, I wasn't sure and wanted to err on the side of not spamming the
wrong people.

> Oct 10 12:53:30 scorpion kernel: RIP:
0010:dma_fence_signal_locked+0x30/0xe0

>
> Looks like it could be
> https://bugs.freedesktop.org/show_bug.cgi?id=3D111381
>
> in which case you just need to upgrade to 4.19.78 and it should be
> fixed.

Thanks a bunch, not sure how I missed there was a new LTS kernel out. I
have upgraded and will report back if I continue to see the issue.

Thanks for the quick support,
John

On Fri, Oct 11, 2019 at 6:12 AM Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linu=
x.intel.com>
wrote:

> On Thu, Oct 10, 2019 at 01:15:09PM -0400, John Maguire wrote:
> > Hi there,
> >
> > I wasn't sure which mailing list to use so I BCC'd
> > intel-gfx@lists.freedesktop.org and dri-devel@lists.freedesktop.org
>
> Just use Cc. We want all replies to go to the list(s) as well.
>
> >
> > I'm using a Lenovo Thinkpad T470p and running the 4.19.77-1-lts kernel =
on
> > Arch Linux. Recently, I've started getting freezes each day. Audio can
> > still be heard, but video output stops. I was able to retrieve a call
> trace
> > from journald.
> >
> > I've attached the output of "sudo lspci -vvv" as well as the message fr=
om
> > journald (null pointer dereference).
>
> Oct 10 12:53:30 scorpion kernel: RIP:
> 0010:dma_fence_signal_locked+0x30/0xe0
>
>
> Looks like it could be
> https://bugs.freedesktop.org/show_bug.cgi?id=3D111381
>
> in which case you just need to upgrade to 4.19.78 and it should be
> fixed.
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

--000000000000e847210594a43fae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Just use Cc. We want all replies to go to the list(s)=
 as well.<span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></span><=
div>Sorry, I wasn&#39;t sure and wanted to err on the side of not spamming =
the wrong people.</div><div><br></div><div>&gt; Oct 10 12:53:30 scorpion ke=
rnel: RIP: 0010:dma_fence_signal_locked+0x30/0xe0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div>&gt;=C2=A0<br>=
&gt; Looks like it could be<br>&gt;=C2=A0<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D111381" rel=3D"noreferrer" target=3D"_blank">https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D111381</a><br>&gt;=C2=A0<br>&gt; i=
n which case you just need to upgrade to 4.19.78 and it should be<br>&gt; f=
ixed.<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br></font></span=
><div><br></div><div>Thanks a bunch, not sure how I missed there was a new =
LTS kernel out. I have upgraded and will report back if I continue to see t=
he issue.</div><div><br></div><div>Thanks for the quick support,</div><div>=
John</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Oct 11, 2019 at 6:12 AM Ville Syrj=C3=A4l=C3=A4 &lt;<a hr=
ef=3D"mailto:ville.syrjala@linux.intel.com">ville.syrjala@linux.intel.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Thu, Oct 10, 2019 at 01:15:09PM -0400, John Maguire wrote:<br>
&gt; Hi there,<br>
&gt; <br>
&gt; I wasn&#39;t sure which mailing list to use so I BCC&#39;d<br>
&gt; <a href=3D"mailto:intel-gfx@lists.freedesktop.org" target=3D"_blank">i=
ntel-gfx@lists.freedesktop.org</a> and <a href=3D"mailto:dri-devel@lists.fr=
eedesktop.org" target=3D"_blank">dri-devel@lists.freedesktop.org</a><br>
<br>
Just use Cc. We want all replies to go to the list(s) as well.<br>
<br>
&gt; <br>
&gt; I&#39;m using a Lenovo Thinkpad T470p and running the 4.19.77-1-lts ke=
rnel on<br>
&gt; Arch Linux. Recently, I&#39;ve started getting freezes each day. Audio=
 can<br>
&gt; still be heard, but video output stops. I was able to retrieve a call =
trace<br>
&gt; from journald.<br>
&gt; <br>
&gt; I&#39;ve attached the output of &quot;sudo lspci -vvv&quot; as well as=
 the message from<br>
&gt; journald (null pointer dereference).<br>
<br>
Oct 10 12:53:30 scorpion kernel: RIP: 0010:dma_fence_signal_locked+0x30/0xe=
0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <br>
<br>
Looks like it could be<br>
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111381" rel=3D"no=
referrer" target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111381</a><br>
<br>
in which case you just need to upgrade to 4.19.78 and it should be<br>
fixed.<br>
<br>
-- <br>
Ville Syrj=C3=A4l=C3=A4<br>
Intel<br>
</blockquote></div>

--000000000000e847210594a43fae--

--===============0884411103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0884411103==--
