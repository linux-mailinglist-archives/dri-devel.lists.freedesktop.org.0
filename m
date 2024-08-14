Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B10E951504
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 09:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D7C10E40F;
	Wed, 14 Aug 2024 07:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K76olTS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34FD10E32E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 03:41:36 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2f1798eaee6so58468691fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 20:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723606895; x=1724211695; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i59JDytc+gv41Nsj3/KkjuTx5BoKUY9SYp0/xWpG9RA=;
 b=K76olTS5BOM57K9ANdaKYO0qx+2QtTPjbNh5Gxr2cn89DDqbFzS9MYy87We2n6aIPL
 F662zIPA8LhLKqH1eCjA2akmhmLiLq94T+h2r6D00O5rbPPFLgtGGHrjTiARREYzfzOO
 9wN1z9CO2aSM4GOjcuBVksFSZAo64tTJZ8va7Mixxz9zlaEfKqX91ME2j6HigINXtJYT
 qvuP1UWXr1AXI4JFMFgOgfFBsC17HH+yp8B3bAHGdPcoYum871fxZq1jSLndvGVuaYJn
 LWOmZjKOZ+vXsz0loZVbhimHYuR6nt7Jzag88tnaPzMFubPTDjdl6B2TWl8aEGC+MLim
 YtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723606895; x=1724211695;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i59JDytc+gv41Nsj3/KkjuTx5BoKUY9SYp0/xWpG9RA=;
 b=VsIrRa5UnCsVtOZD8hJWGbDh1fteVXn4KfgIRNI8M67ABSNFTmwyA86+3ADMoiB2Ly
 /tSEGowVrgN4Wwhy2oV9fKePXm8pAY2w4yQaNfhxtggFMCRsHPtKqmEvk/W0LsveGnuH
 tma/jEYaf45QbKK2pjHllpJBWshzaiNuYG+bNoiQ9WMpycBdogiQefsBXPlDG/Bu24+x
 JVwGi4mM8Of5O230ZsEGgE8jdlI7WhT8XlwKLenFjq5t6tJnz0J/00spFg2a5Eiu45Zy
 VioHC/CKDcMXPYSxC6lbJAvP9+6OvHrPAXVlYEWNzNLxgakCLQSYmXnv6PIorgvZ6otW
 RnQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbtkphmLLwoScaGTolU6wepJLBeex+Vr7qGPjuwlo0aIJbuOTrww5iEln4ZMW9XGFwj/HTd1x9DXGSiGY9B1qCooH3ilUXPWxYrOIQ+Ptu
X-Gm-Message-State: AOJu0Ywa+5v37USji0VfpZ3Bzi3LCjOQBcq6aaJbK5cfONMVUhae76fx
 jitC2a+oiFf0veJA5kImQ3rCMJRK5jVCpTRt7+kqlhVrG3oONTFQSkkxK6cDuTPrEJEDDOJjqQu
 MN1hoME+0QVEFrBdQYWLeO805CA0=
X-Google-Smtp-Source: AGHT+IGLyWRileaG2taLoRvQlFxNK4CMLLGa27uTYkuNlT6Rs/Ese/C+d6tKz0dBv0BVMRPOO3yWeQ60NmKSz6GJXyg=
X-Received: by 2002:a2e:b887:0:b0:2ef:3093:e2c3 with SMTP id
 38308e7fff4ca-2f3aa1f9209mr8867071fa.31.1723606894187; Tue, 13 Aug 2024
 20:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240803001814.7752-1-riyandhiman14@gmail.com>
 <1e74a5ef-7d15-451e-8cb8-2743ef95089a@suswa.mountain>
In-Reply-To: <1e74a5ef-7d15-451e-8cb8-2743ef95089a@suswa.mountain>
From: Riyan Dhiman <riyandhiman14@gmail.com>
Date: Wed, 14 Aug 2024 09:11:22 +0530
Message-ID: <CAAjz0QY9jDUx-URQTtdW3kO2mkfV4dhUsJhB9-k12SEt++Gp8g@mail.gmail.com>
Subject: Re: [PATCH] staging: vme_user: vme_bridge.h: Document mutex in
 vme_dma_resource structure
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000a9223b061f9c8051"
X-Mailman-Approved-At: Wed, 14 Aug 2024 07:11:09 +0000
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

--000000000000a9223b061f9c8051
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 3, 2024 at 9:54=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org>
wrote:

> On Sat, Aug 03, 2024 at 05:48:14AM +0530, Riyan Dhiman wrote:
> > Adhere to Linux kernel coding style
> >
> > Reported by checkpatch:
> >
> > CHECK: mutex definition without comment
> >
> > Proof for comment:
> >
> > 1. The mutex is used to protect access to the 'running' list
> > (line 1798 tsi148_dma_list_exec function)
> >       mutex_lock(&ctrlrl->mtx);
> >       if (!list_empty(&ctrlr->running)) {
> >               mutex_unlock(&ctrlr->mtx);
> >               return -EBUSY;
> >       }
>
> Why did you chop out the "channel =3D ctrlr->number;" line?  That code
> looks like this:
>

I included only the mutex lock and unlock part of the code in the message.
I thought adding the entire code snippet would make the commit message too
lengthy.


> drivers/staging/vme_user/vme_tsi148.c
>   1798          mutex_lock(&ctrlr->mtx);
>   1799
>   1800          channel =3D ctrlr->number;
>   1801
>   1802          if (!list_empty(&ctrlr->running)) {
>   1803                  /*
>   1804                   * XXX We have an active DMA transfer and
> currently haven't
>   1805                   *     sorted out the mechanism for "pending" DMA
> transfers.
>   1806                   *     Return busy.
>   1807                   */
>   1808                  /* Need to add to pending here */
>   1809                  mutex_unlock(&ctrlr->mtx);
>   1810                  return -EBUSY;
>   1811          }
>   1812
>   1813          list_add(&list->list, &ctrlr->running);
>
>
> The first line after we take a lock and the last line before we drop
> the lock are hopefully chosen because they need to be protected by the
> lock.
>

Yes, I included only that part of the code in the commit message to avoid a
lengthy commit message

> 2. It's also used when removing DMA list from running list:
> > (line 1862 tsi148_dma_list_exec function)
> >       mutex_lock(&ctrlr->mtx);
> >       list_del(&list->list);
> >       mutex_unlock(&ctrlr->mtx);
> >   Ensuring thread-safe modification of the controller's state.
> >
> > Without this mutex, concurrent access to the DMA controller's state cou=
ld
> > lead to data corruption or inconsistant state.
> >
>
> It's also used in drivers/staging/vme_user/vme.c
> What you should do is rename the mutex from mtx to XXX_mtx and then
> rename all the places where it is used.  Keep renaming until the driver
> builds.
>
> XXX_mtx is obviously not the correct name.  But "mtx" is vague and
> useless.  There are 3 other locks in this header file which have the
> same name so not only is it useless as a descriptive name, it's also
> useless for searching.
>

Yes, I agree 'mt' is a vague name and doesn't convey much information.
In this patch, I have added only comments to address the checkpatch error.
Given your suggestion to change the variable name, I'd like to confirm,
Should I create a new patch that includes both the comment and the 'mtx'
variable name change?
Or should I leave this current patch with comments only and
create a separate patch for the variable name changes?


> Since you say that it is "protect access to the 'running' list", then
> that means you need to check all the places where the running list is
> accessed and ensure that the lock is held.  Or if it's not, what makes
> that thread safe?
>

Yes, I have checked the lock usage in all the places where the 'running'
list is accessed.


> > diff --git a/drivers/staging/vme_user/vme_bridge.h
> b/drivers/staging/vme_user/vme_bridge.h
> > index 9bdc41bb6602..bb3750b40eb1 100644
> > --- a/drivers/staging/vme_user/vme_bridge.h
> > +++ b/drivers/staging/vme_user/vme_bridge.h
> > @@ -61,6 +61,7 @@ struct vme_dma_list {
> >  struct vme_dma_resource {
> >       struct list_head list;
> >       struct vme_bridge *parent;
> > +     /* Mutex to protect DMA controller resources and ensure
> thread-safe operations */
>
> "resources" is too vague.  "ensure thread-safe operations" is obvious
> and doesn't need to be said.
>

Should I mention the exact resources this mutex protects?

Regards,
Riyan Dhiman

--000000000000a9223b061f9c8051
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Aug 3, 2024 at 9:54=E2=80=AFAM Da=
n Carpenter &lt;<a href=3D"mailto:dan.carpenter@linaro.org">dan.carpenter@l=
inaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Sat, Aug 03, 2024 at 05:48:14AM +053=
0, Riyan Dhiman wrote:<br>
&gt; Adhere to Linux kernel coding style<br>
&gt; <br>
&gt; Reported by checkpatch:<br>
&gt; <br>
&gt; CHECK: mutex definition without comment<br>
&gt; <br>
&gt; Proof for comment:<br>
&gt; <br>
&gt; 1. The mutex is used to protect access to the &#39;running&#39; list<b=
r>
&gt; (line 1798 tsi148_dma_list_exec function)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;ctrlrl-&gt;mtx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!list_empty(&amp;ctrlr-&gt;running)) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&am=
p;ctrlr-&gt;mtx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Why did you chop out the &quot;channel =3D ctrlr-&gt;number;&quot; line?=C2=
=A0 That code<br>
looks like this:<br></blockquote><div><br></div><div>I included only the mu=
tex lock and unlock part of the code in the message.</div><div>I thought ad=
ding the entire code snippet would make the commit message too lengthy.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
drivers/staging/vme_user/vme_tsi148.c<br>
=C2=A0 1798=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&amp;ctrlr-&gt;mtx=
);<br>
=C2=A0 1799=C2=A0 <br>
=C2=A0 1800=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 channel =3D ctrlr-&gt;number;=
<br>
=C2=A0 1801=C2=A0 <br>
=C2=A0 1802=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!list_empty(&amp;ctrlr-&g=
t;running)) {<br>
=C2=A0 1803=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /=
*<br>
=C2=A0 1804=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0* XXX We have an active DMA transfer and currently haven&#39;t<br>
=C2=A0 1805=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*=C2=A0 =C2=A0 =C2=A0sorted out the mechanism for &quot;pending&quot;=
 DMA transfers.<br>
=C2=A0 1806=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*=C2=A0 =C2=A0 =C2=A0Return busy.<br>
=C2=A0 1807=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*/<br>
=C2=A0 1808=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /=
* Need to add to pending here */<br>
=C2=A0 1809=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m=
utex_unlock(&amp;ctrlr-&gt;mtx);<br>
=C2=A0 1810=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn -EBUSY;<br>
=C2=A0 1811=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 1812=C2=A0 <br>
=C2=A0 1813=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list_add(&amp;list-&gt;list, =
&amp;ctrlr-&gt;running);<br>
<br>
<br>
The first line after we take a lock and the last line before we drop<br>
the lock are hopefully chosen because they need to be protected by the<br>
lock.<br></blockquote><div><br></div><div>Yes, I included only that part of=
 the code in the commit message to avoid a lengthy commit message</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; 2. It&#39;s also used when removing DMA list from running list:<br>
&gt; (line 1862 tsi148_dma_list_exec function)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;ctrlr-&gt;mtx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del(&amp;list-&gt;list);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;ctrlr-&gt;mtx);<br>
&gt;=C2=A0 =C2=A0Ensuring thread-safe modification of the controller&#39;s =
state.<br>
&gt; <br>
&gt; Without this mutex, concurrent access to the DMA controller&#39;s stat=
e could<br>
&gt; lead to data corruption or inconsistant state.<br>
&gt;<br>
<br>
It&#39;s also used in drivers/staging/vme_user/vme.c<br>
What you should do is rename the mutex from mtx to XXX_mtx and then<br>
rename all the places where it is used.=C2=A0 Keep renaming until the drive=
r<br>
builds.<br>
<br>
XXX_mtx is obviously not the correct name.=C2=A0 But &quot;mtx&quot; is vag=
ue and<br>
useless.=C2=A0 There are 3 other locks in this header file which have the<b=
r>
same name so not only is it useless as a descriptive name, it&#39;s also<br=
>
useless for searching.<br></blockquote><div><br></div><div>Yes, I agree &#3=
9;mt&#39; is a vague name and doesn&#39;t convey much information.</div><di=
v>In this patch, I have added only comments to address the checkpatch error=
.=C2=A0</div><div>Given your suggestion to change the variable name, I&#39;=
d like to confirm,</div><div>Should I create a new patch that includes both=
 the comment and the &#39;mtx&#39; variable name change?=C2=A0</div><div>Or=
 should I leave this current patch with comments only and</div><div>create =
a separate patch for the variable name changes?</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
Since you say that it is &quot;protect access to the &#39;running&#39; list=
&quot;, then<br>
that means you need to check all the places where the running list is<br>
accessed and ensure that the lock is held.=C2=A0 Or if it&#39;s not, what m=
akes<br>
that thread safe?<br></blockquote><div><br></div><div>Yes, I have checked t=
he lock usage in all the places where the &#39;running&#39; list is accesse=
d.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/v=
me_user/vme_bridge.h<br>
&gt; index 9bdc41bb6602..bb3750b40eb1 100644<br>
&gt; --- a/drivers/staging/vme_user/vme_bridge.h<br>
&gt; +++ b/drivers/staging/vme_user/vme_bridge.h<br>
&gt; @@ -61,6 +61,7 @@ struct vme_dma_list {<br>
&gt;=C2=A0 struct vme_dma_resource {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head list;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vme_bridge *parent;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Mutex to protect DMA controller resources and =
ensure thread-safe operations */<br>
<br>
&quot;resources&quot; is too vague.=C2=A0 &quot;ensure thread-safe operatio=
ns&quot; is obvious<br>
and doesn&#39;t need to be said.<br></blockquote><div>=C2=A0</div><div>Shou=
ld I mention the exact resources this mutex protects?</div><div><br></div><=
div>Regards,</div><div>Riyan Dhiman</div><div>=C2=A0</div></div></div>

--000000000000a9223b061f9c8051--
