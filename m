Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F16A61292AD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B066E1BE;
	Mon, 23 Dec 2019 08:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E286E0D4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 18:52:39 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id p8so7404897ljg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q3VQ5YSyLgjF9XYAN9lWYlmpq3OBR/OT+NqwafVh5w4=;
 b=EymosJppu/2ejbFbueHT4tIwHmYgv+zRX5b7o1BP4JFm6pEjKVxrMr6TQ8V9nqIQ5R
 1E/VgMrW1d7QpuJOO5iULhdTpbhk63Pe3jIcIpavMah/1Qg9ssxg7ffsxau0gQBUeyK+
 2SWRROAC5kkgPowf8+hOAbfVc49C1cNpzPXQxObiDQbG5YhFp8eBj9S1oGNihuAKqTQP
 XAK4Fg0hEyaT5i9iLnGnfFQmonMZ7qDCKY48L2NVk0DOYKpIwKKoI5/JiwcpuCSseeBm
 lEKMijn97iS7a/yZD6qXS4+iopCfJP2Xy1amAnicPN1COLqi4r+bD4fVZZmJxUXo/Gvk
 lpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q3VQ5YSyLgjF9XYAN9lWYlmpq3OBR/OT+NqwafVh5w4=;
 b=YGL+gOtS+QTqYQlDkedHMRfvrqkDOZaXUUzLbkEgSc4SVJCILSOHle1WBhnTOlX7Ob
 f1F2dpIilvrOLRC1uYuuIEgxqSpFgWf7l+RbYmZVRKbv9llvQlv1W4LEldfw3IqQa2Pk
 mx3N5l1mrLP+bsipibjuRLY5cZyDSTdjesrP/ft16hzgeliQPXGRBmMgvLF5tz4ifpJR
 4dfYRDEYeVAkU76j5yXgDaRBf7hpltSyR0v2vy8OGp/laEJ/AwPSZPizsxIyDfiulXrR
 ny6eFFrNJjPdk/ajCN3QKchaYJayQXWvilnYnTOgZuRlezOqMcS7Nmlet6YN5L9nOlZA
 8QeA==
X-Gm-Message-State: APjAAAVQC8cEE62zBwzt2D9KoocXmQFIrLPa2g8lctKlM7u2C/fASgT3
 +TTNgIgZ5r05sV5Kvt998NKU80zNEr1jEKmTYQ1G
X-Google-Smtp-Source: APXvYqzuyiZnt51axFHi2e0V1VbNTe9wS43Zp+MtXqT0NLaguhVmr4i/j7X3alA8zp+35nLn9yhxIroSeEKtgyckql0=
X-Received: by 2002:a2e:9a01:: with SMTP id o1mr6864229lji.247.1576781557472; 
 Thu, 19 Dec 2019 10:52:37 -0800 (PST)
MIME-Version: 1.0
References: <CAKT=dDnhth-6giOWgym7qpLNeH=86=XhQmPcgHM2J8B_L3myRQ@mail.gmail.com>
 <20191112201808.GE31272@redhat.com>
 <CAKT=dDkGCKuE=CNr=9dfXCZw-exc570cc67w_uV_X322cGf3Og@mail.gmail.com>
 <2981882.gi1CFgH74X@saphira>
In-Reply-To: <2981882.gi1CFgH74X@saphira>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Thu, 19 Dec 2019 10:52:26 -0800
Message-ID: <CAKT=dD=r46-UckK+hsZMvF0wBFqSe3bGdBa=vs2bOrarpexoPA@mail.gmail.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
To: Rohan Garg <rohan.garg@collabora.com>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Kenny Ho <y2kenny@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <seanpaul@chromium.org>,
 Chris Forbes <chrisforbes@google.com>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: multipart/mixed; boundary="===============2107529926=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2107529926==
Content-Type: multipart/alternative; boundary="0000000000009f7560059a13107c"

--0000000000009f7560059a13107c
Content-Type: text/plain; charset="UTF-8"

Hi Rohan,

Thanks for pointing out the pids issue! Then the index would be {namespace
+ pid(in that namespace)}. I'll grab a setup and play with the driver to
see what I can do. I know how to find an Intel or Freedreno setup, but I'd
still like to know is there a development friendly Mali setup?

Many many thanks for all the feedback!
Yiwei

On Thu, Dec 19, 2019 at 8:18 AM Rohan Garg <rohan.garg@collabora.com> wrote:

> Hey
>
> > Is it reasonable to add another ioctl or something equivalent to label
> > a BO with what PID makes the allocation? When the BO gets shared to
> > other processes, this information also needs to be bookkept somewhere
> > for tracking. Basically I wonder if it's possible for upstream to
> > track BOs in a similar way Android tracks dmabuf. Then there's a node
> > implemented by cgroup in proc listing all the BOs per process with
> > information like label, refcount, etc. Then Android GPU vendors can
> > implement the same nodes which is going to be compatible even if they
> > later adopts drm subsystem.
> >
> > So my sketch idea for the nodes are:
> > (1) /proc/gpu0_meminfo, /proc/gpu1_meminfo
> > This is a list of all BOs with pids holding a reference to it and the
> > current label of each BO
> > (2) /proc/<pid>/gpu0_meminfo, /proc/<pid>/gpu1_meminfo
> > This is a list of all BOs this process holds a reference to.
> > (3) Is it reasonable to implement another nodes for {total,
> > total_unmapped} counters? or just surface through /proc/meminfo?
> >
>
> This would be tricky to implement because:
>
> (1) PID's are not unique, PID namespaces allow linux userspace to
> potentially
> share the same PID.
>
> (2) Specifically in the case of mesa, there isn't a way to (AFAIK)
> associate a
> BO with a PID.
>
> Cheers
> Rohan Garg
>
>
>

--0000000000009f7560059a13107c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Rohan,<div><br></div><div>Thanks for pointing out =
the pids issue! Then the index would be {namespace + pid(in that namespace)=
}. I&#39;ll grab a setup and play with the driver to see what I can do. I k=
now how to find an Intel or Freedreno setup, but I&#39;d still like to know=
 is there a development=C2=A0friendly Mali setup?</div><div><br></div><div>=
Many many thanks for all the feedback!</div><div>Yiwei</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 19,=
 2019 at 8:18 AM Rohan Garg &lt;<a href=3D"mailto:rohan.garg@collabora.com"=
>rohan.garg@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hey<br>
<br>
&gt; Is it reasonable to add another ioctl or something equivalent to label=
<br>
&gt; a BO with what PID makes the allocation? When the BO gets shared to<br=
>
&gt; other processes, this information also needs to be bookkept somewhere<=
br>
&gt; for tracking. Basically I wonder if it&#39;s possible for upstream to<=
br>
&gt; track BOs in a similar way Android tracks dmabuf. Then there&#39;s a n=
ode<br>
&gt; implemented by cgroup in proc listing all the BOs per process with<br>
&gt; information like label, refcount, etc. Then Android GPU vendors can<br=
>
&gt; implement the same nodes which is going to be compatible even if they<=
br>
&gt; later adopts drm subsystem.<br>
&gt; <br>
&gt; So my sketch idea for the nodes are:<br>
&gt; (1) /proc/gpu0_meminfo, /proc/gpu1_meminfo<br>
&gt; This is a list of all BOs with pids holding a reference to it and the<=
br>
&gt; current label of each BO<br>
&gt; (2) /proc/&lt;pid&gt;/gpu0_meminfo, /proc/&lt;pid&gt;/gpu1_meminfo<br>
&gt; This is a list of all BOs this process holds a reference to.<br>
&gt; (3) Is it reasonable to implement another nodes for {total,<br>
&gt; total_unmapped} counters? or just surface through /proc/meminfo?<br>
&gt; <br>
<br>
This would be tricky to implement because:<br>
<br>
(1) PID&#39;s are not unique, PID namespaces allow linux userspace to poten=
tially <br>
share the same PID.<br>
<br>
(2) Specifically in the case of mesa, there isn&#39;t a way to (AFAIK) asso=
ciate a <br>
BO with a PID.<br>
<br>
Cheers<br>
Rohan Garg<br>
<br>
<br>
</blockquote></div>

--0000000000009f7560059a13107c--

--===============2107529926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2107529926==--
