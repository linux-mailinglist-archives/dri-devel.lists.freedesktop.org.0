Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D751439386D
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 23:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF8D6E14D;
	Thu, 27 May 2021 21:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A246E14D;
 Thu, 27 May 2021 21:52:36 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id y15so1602757pfn.13;
 Thu, 27 May 2021 14:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=AALpRFvKWaboZWkeO1WO6xHCDasSd3vaHtROIHDCLDw=;
 b=SugO7dZLtDNQaHWRPnNrGHmXrTQgaDzhuTfZY6CagYyWkyDNYFEfblkeMZ/6Sc+Jm+
 cWAoS8ZtmATjzx8jB0Kcwz8O2aS4NgquRM6yojhLPu0U31j7yfUE0KUXRhNlsZnXsj8e
 GeI8CdP92WzkduTgdRDaxJR/g2JNNO/50wF3J1ZgOWcK21wasQNge4IZv3F8grkuH25z
 EZbmKVwZl4FBm/lcK189Qgl7qNzM70GSGMndbG69e2v91AN/A65UYSd21WakU0J/Pyzf
 iwAw2Arc3Xx6ctBu71Ap/MabEOxT4PyuL6dHilaIG9VAaKKu4xb5pN6u0lMw5PNPAAvj
 yF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AALpRFvKWaboZWkeO1WO6xHCDasSd3vaHtROIHDCLDw=;
 b=R7tjez4nUapAdMVzUSSPpREDcPBhNlBiBG4sDa+J2IbbI1QsIlQ5pH6lpvqgFqvl2p
 tbKu4OyPIaJ5o8K055P2pyfaIVW9Hfhqqi7/4LL23NIH0srYHUyxqFszx/yhAcS+ClkZ
 1LDcIywentZ7yc3QW4Zt7+LxOdjvGoAGtWnzMTkaUlI7AtZZSIGEU+QABaSvrTed3tkf
 B+KF/dwfXBxT1I0ZMXIa59jYJsp/57+5PanIAUlzC++mVnQ487Myx47+HW/NDjw07LE7
 JsspHcRHJ8P7BMGDj11rT/fsPre4YIKIxxSoVHH+VvPzEV7EWnF/pBK0MYrAmczW86UC
 972Q==
X-Gm-Message-State: AOAM530W1AazDDn40u8SZ+LjJtyPfiuScH0U6zIVLDtHkFozwqBZOhOY
 SIyPOq2HUaAKR5z5b36EoOn+x9AgZ3edoNWFH0OrfhnkzVE=
X-Google-Smtp-Source: ABdhPJx751RB3YUQLJP3b7hnDjpioYr/G3rsappLHZr3g+840OevTe5C8uiK3Ho9oOmWB6J85QknmjdMVwIrvcNHr74=
X-Received: by 2002:a05:6a00:22c1:b029:2dc:edbe:5e9 with SMTP id
 f1-20020a056a0022c1b02902dcedbe05e9mr501087pfj.51.1622152355790; Thu, 27 May
 2021 14:52:35 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 27 May 2021 17:51:59 -0400
Message-ID: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
Subject: Linux Graphics Next: Userspace submission update
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>, 
 Jason Ekstrand <jason@jlekstrand.net>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: multipart/alternative; boundary="000000000000f045a205c356c633"
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

--000000000000f045a205c356c633
Content-Type: text/plain; charset="UTF-8"

Hi,

Since Christian believes that we can't deadlock the kernel with some
changes there, we just need to make everything nice for userspace too.
Instead of explaining how it will work, I will explain the cases where
future hardware (and its kernel driver) will break existing userspace in
order to protect everybody from deadlocks. Anything that uses implicit sync
will be spared, so X and Wayland will be fine, assuming they don't
import/export fences. Those use cases that do import/export fences might or
might not work, depending on how the fences are used.

One of the necessities is that all fences will become future fences. The
semantics of imported/exported fences will change completely and will have
new restrictions on the usage. The restrictions are:


1) Android sync files will be impossible to support, so won't be supported.
(they don't allow future fences)


2) Implicit sync and explicit sync will be mutually exclusive between
process. A process can either use one or the other, but not both. This is
meant to prevent a deadlock condition with future fences where any process
can malevolently deadlock execution of any other process, even execution of
a higher-privileged process. The kernel will impose the following
restrictions to protect against the deadlock:

a) a process with an implicitly-sync'd imported/exported buffer can't
import/export a fence from/to another process
b) a process with an imported/exported fence can't import/export an
implicitly-sync'd buffer from/to another process

Alternative: A higher-privileged process could enforce both restrictions
instead of the kernel to protect itself from the deadlock, but this would
be a can of worms for existing userspace. It would be better if the kernel
just broke unsafe userspace on future hw, just like sync files.

If both implicit and explicit sync are allowed to occur simultaneously,
sending a future fence that will never signal to any process will deadlock
that process after it acquires the implicit sync lock, which is a sequence
number that the process is required to write to memory and send an
interrupt from the GPU in a finite time. This is how the deadlock can
happen:

* The process gets sequence number N from the kernel for an
implicitly-sync'd buffer.
* The process inserts (into the GPU user-mapped queue) a wait for sequence
number N-1.
* The process inserts a wait for a fence, but it doesn't know that it will
never signal ==> deadlock.
...
* The process inserts a command to write sequence number N to a
predetermined memory location. (which will make the buffer idle and send an
interrupt to the kernel)
...
* The kernel will terminate the process because it has never received the
interrupt. (i.e. a less-privileged process just killed a more-privileged
process)

It's the interrupt for implicit sync that never arrived that caused the
termination, and the only way another process can cause it is by sending a
fence that will never signal. Thus, importing/exporting fences from/to
other processes can't be allowed simultaneously with implicit sync.


3) Compositors (and other privileged processes, and display flipping) can't
trust imported/exported fences. They need a timeout recovery mechanism from
the beginning, and the following are some possible solutions to timeouts:

a) use a CPU wait with a small absolute timeout, and display the previous
content on timeout
b) use a GPU wait with a small absolute timeout, and conditional rendering
will choose between the latest content (if signalled) and previous content
(if timed out)

The result would be that the desktop can run close to 60 fps even if an app
runs at 1 fps.

*Redefining imported/exported fences and breaking some users/OSs is the
only way to have userspace GPU command submission, and the deadlock example
here is the counterexample proving that there is no other way.*

So, what are the chances this is going to fly with the ecosystem?

Thanks,
Marek

--000000000000f045a205c356c633
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Since Christian believes=
 that we can&#39;t deadlock the kernel with some changes there, we just nee=
d to make everything nice for userspace too. Instead of explaining how it w=
ill work, I will explain the cases where future hardware (and its kernel dr=
iver) will break existing userspace in order to protect everybody from dead=
locks. Anything that uses implicit sync will be spared, so X and Wayland wi=
ll be fine, assuming they don&#39;t import/export fences. Those use cases t=
hat do import/export fences might or might not work, depending on how the f=
ences are used.<br></div><div><br></div><div>One of the necessities is that=
 all fences will become future fences. The semantics of imported/exported f=
ences will change completely and will have new restrictions on the usage. T=
he restrictions are:<br></div><div><br></div><div><br></div><div>1) Android=
 sync files will be impossible to support, so won&#39;t be supported. (they=
 don&#39;t allow future fences)<br></div><div><br></div><div><br></div><div=
>2) Implicit sync and explicit sync will be mutually exclusive between proc=
ess. A process can either use one or the other, but not both. This is meant=
 to prevent a deadlock condition with future fences where any process can m=
alevolently deadlock execution of any other process, even execution of a hi=
gher-privileged process. The kernel will impose the following restrictions =
to protect against the deadlock:<br></div><div></div><div><br></div><div>a)=
 a process with an implicitly-sync&#39;d imported/exported buffer can&#39;t=
 import/export a fence from/to another process<br></div><div>b) a process w=
ith an imported/exported fence can&#39;t import/export an implicitly-sync&#=
39;d buffer from/to another process</div><div><br></div><div>Alternative: A=
 higher-privileged process could enforce both restrictions instead of the k=
ernel to protect itself from the deadlock, but this would be a can of worms=
 for existing userspace. It would be better if the kernel just broke unsafe=
 userspace on future hw, just like sync files.<br></div><div><br></div><div=
>If both implicit and explicit sync are allowed to occur simultaneously, se=
nding a future fence that will never signal to any process will deadlock th=
at process after it acquires the implicit sync lock, which is a sequence nu=
mber that the process is required to write to memory and send an interrupt =
from the GPU in a finite time. This is how the deadlock can happen:<br></di=
v><div><br></div><div>* The process gets sequence number N from the kernel =
for an implicitly-sync&#39;d buffer.<br><div>* The process inserts (into th=
e GPU user-mapped queue) a wait for sequence number N-1.</div>* The process=
 inserts  a wait for a fence, but it doesn&#39;t know that it will never si=
gnal =3D=3D&gt; deadlock.<br></div><div>...<br></div><div>* The process ins=
erts a command to write sequence number N to a predetermined memory locatio=
n. (which will make the buffer idle and send an interrupt to the kernel)</d=
iv><div><div>...<br></div>* The kernel will terminate the process because i=
t has never received the interrupt. (i.e. a less-privileged process just ki=
lled a more-privileged process)<br></div><div><br></div><div>It&#39;s the i=
nterrupt for implicit sync that never arrived that caused the termination, =
and the only way another process can cause it is by sending a fence that wi=
ll never signal. Thus, importing/exporting fences from/to other processes c=
an&#39;t be allowed simultaneously with implicit sync.<br></div><div><br></=
div><div><br></div><div>3) Compositors (and other privileged processes, and=
 display flipping) can&#39;t trust imported/exported fences. They need a ti=
meout recovery mechanism from the beginning, and the following are some pos=
sible solutions to timeouts:</div><div><br></div><div>a) use a CPU wait wit=
h a small absolute timeout, and display the previous content on timeout<br>=
</div><div>b) use a GPU wait with a small absolute timeout, and conditional=
 rendering will choose between the latest content (if signalled) and previo=
us content (if timed out)</div><div><br></div><div>The result would be that=
 the desktop can run close to 60 fps even if an app runs at 1 fps.</div><di=
v><br></div><div><b>Redefining imported/exported fences and breaking some u=
sers/OSs is the only way to have userspace GPU command submission, and the =
deadlock example here is the counterexample proving that there is no other =
way.</b></div><div><br></div><div>So, what are the chances this is going to=
 fly with the ecosystem?<br></div><div><br></div><div>Thanks,<br></div><div=
>Marek<br></div></div>

--000000000000f045a205c356c633--
