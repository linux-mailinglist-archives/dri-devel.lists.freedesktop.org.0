Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9273A30ACE7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 17:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1156E840;
	Mon,  1 Feb 2021 16:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FB56E840;
 Mon,  1 Feb 2021 16:47:50 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id a25so20454579ljn.0;
 Mon, 01 Feb 2021 08:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yIZiOJ02BYreIZzEaXfykuQ92i8lgVKM8HuqwHuBPWc=;
 b=qgZJnkcssMWM+89wIgyQw+SQ4SVW47u/G/Dc2hHiebYRA1VAndqCaGhfST0cohXPDj
 5z0ks432uKnR4bkAmOREXcHJ/TDOrB3N1WynzryP+HfANmi2jxQNnNVRiePRQbHnirUx
 rTepZWehTgMZ73kP1TT2hCJAhTSSf9blZIeVSRRZb78vScyCtkyUFoCJQ9WONlbTEy6t
 2fd9okCvRpH5tTrbm+WuP9PcrOOcPEadQRJhspoeXA+8bjgLZrH/H3R9ANIu0xiofxIj
 xOoRAxLnzOKZ8y49ocUK/9MCBsi3nbuxMnWFXHRjjUd6DVHKtxAbakzFoqiZn/tRVqEA
 V49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yIZiOJ02BYreIZzEaXfykuQ92i8lgVKM8HuqwHuBPWc=;
 b=hWeekuoUdffxkqWJ53xRNF8RMqcxc0YJAkC80bpB+kKfKnqj3XOI7boEMSYZP6sQV8
 QikhpWgKyMowai/7qp2wSO4e1rnCrF9S4vcbtQRZe5hYtCoIFsuL5mWWR3AbiZnF7i5L
 mEabphdDNC6s980Skb/E0bly9kKZwxEijZvex+A4fpMq8vGmKxpbaC0ZN01K6VOeqcbN
 jnIgybRczK1zhdhi7KwBvBG1vlmqezAYk/AEFDmO1zaGcLBdIFyNZRuG6s7f/zMBhy4T
 azuQUQaSIzAYmN5SurOmuhHmI+kyvAaSvuoBanyWbBUssCCxsw7djEsBTRmEuCo/OO5+
 9DZQ==
X-Gm-Message-State: AOAM5334EZ+eLCfWlDhDmqCd6lScl0c0w3lfkM/+hCvly8nhTpdEL+gH
 3hqxOlx402CKB3BoFU6M7F0vf9N4UnNiJ1K6U4Q=
X-Google-Smtp-Source: ABdhPJyVksRp7dMQFreT6iFGkvyIERFPWm8QjTXwXG+7UDkdzz/KPtPtHl3yLc6PyzhjU98Vtf5kjidXFzK+Ikds2kQ=
X-Received: by 2002:a2e:a0ce:: with SMTP id f14mr10339298ljm.180.1612198069310; 
 Mon, 01 Feb 2021 08:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20201007152355.2446741-1-Kenny.Ho@amd.com>
 <CAOWid-d=a1Q3R92s7GrzxWhXx7_dc8NQvQg7i7RYTVv3+jHxkQ@mail.gmail.com>
 <20201103053244.khibmr66p7lhv7ge@ast-mbp.dhcp.thefacebook.com>
 <CAOWid-eQSPru0nm8+Xo3r6C0pJGq+5r8mzM8BL2dgNn2c9mt2Q@mail.gmail.com>
 <CAADnVQKuoZDB-Xga5STHdGSxvSP=B6jQ40kLdpL1u+J98bv65A@mail.gmail.com>
 <CAOWid-czZphRz6Y-H3OcObKCH=bLLC3=bOZaSB-6YBE56+Qzrg@mail.gmail.com>
 <20201103210418.q7hddyl7rvdplike@ast-mbp.dhcp.thefacebook.com>
 <CAOWid-djQ_NRfCbOTnZQ-A8Pr7jMP7KuZEJDSsvzWkdw7qc=yA@mail.gmail.com>
 <20201103232805.6uq4zg3gdvw2iiki@ast-mbp.dhcp.thefacebook.com>
 <YBgU9Vu0BGV8kCxD@phenom.ffwll.local>
In-Reply-To: <YBgU9Vu0BGV8kCxD@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Mon, 1 Feb 2021 11:47:38 -0500
Message-ID: <CAOWid-d5Z-xnn_MhMNoMs3HdW7n8e6Uw5YAGH7NNu7LX0Af_0A@mail.gmail.com>
Subject: Re: [RFC] Add BPF_PROG_TYPE_CGROUP_IOCTL
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Kenny Ho <Kenny.Ho@amd.com>,
 "open list:CONTROL GROUP \(CGROUP\)" <cgroups@vger.kernel.org>,
 Brian Welty <brian.welty@intel.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Martin KaFai Lau <kafai@fb.com>,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Network Development <netdev@vger.kernel.org>, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============0886988651=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0886988651==
Content-Type: multipart/alternative; boundary="0000000000003a990405ba491d13"

--0000000000003a990405ba491d13
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 1, 2021 at 9:49 AM Daniel Vetter <daniel@ffwll.ch> wrote:

>
> - there's been a pile of cgroups proposal to manage gpus at the drm
>   subsystem level, some by Kenny, and frankly this at least looks a bit
>   like a quick hack to sidestep the consensus process for that.
>
No Daniel, this is quick *draft* to get a conversation going.  Bpf was
actually a path suggested by Tejun back in 2018 so I think you are
mischaracterizing this quite a bit.

"2018-11-20 Kenny Ho:
To put the questions in more concrete terms, let say a user wants to
 expose certain part of a gpu to a particular cgroup similar to the
 way selective cpu cores are exposed to a cgroup via cpuset, how
 should we go about enabling such functionality?

2018-11-20 Tejun Heo:
Do what the intel driver or bpf is doing?  It's not difficult to hook
into cgroup for identification purposes."

Kenny

--0000000000003a990405ba491d13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 1, 2021 at 9:49 AM Daniel Vet=
ter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
- there&#39;s been a pile of cgroups proposal to manage gpus at the drm<br>
=C2=A0 subsystem level, some by Kenny, and frankly this at least looks a bi=
t<br>
=C2=A0 like a quick hack to sidestep the consensus process for that.<br></b=
lockquote><div>No Daniel, this is quick *draft* to get a conversation going=
.=C2=A0 Bpf was actually a path suggested by Tejun back in 2018 so I think =
you are mischaracterizing this quite a bit.<br><br></div><div>&quot;2018-11=
-20 Kenny Ho:<br><span class=3D"gmail-im">To put the questions in more conc=
rete terms, let say a user wants to<br>=C2=A0expose certain part of a gpu t=
o a particular cgroup similar to the<br>=C2=A0way selective cpu cores are e=
xposed to a cgroup via cpuset, how<br>=C2=A0should we go about enabling suc=
h functionality?<br>
<br>2018-11-20 Tejun Heo:<br></span>
Do what the intel driver or <span class=3D"gmail-il">bpf</span> is doing?=
=C2=A0 It&#39;s not difficult to hook<br>
into cgroup for identification purposes.&quot;</div></div><div class=3D"gma=
il_quote"><br></div><div class=3D"gmail_quote">Kenny<br></div></div>

--0000000000003a990405ba491d13--

--===============0886988651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0886988651==--
