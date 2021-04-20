Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A1F365F17
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 20:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35526E896;
	Tue, 20 Apr 2021 18:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F586E890
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 18:16:24 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w4so34919004wrt.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 11:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7SpmCxT/nTHlY+2XgH97oE1bAOfA80ctqu0kl+CSM2k=;
 b=dOVJN3eucvXrwu7wUZ60F0lV73mfi9Fh4EqIiWQRu8bAcRYXur6Ux1tMH2LewTXHrF
 YSuzbg5E0TQadg1eZOns7Pm8yM4cprtcdu9Zk/S+7EqnXUVsmv1ZCWC18WLeHoQoPYGW
 Ijz0B7n+9hviFvMUUCB/Ey0rdR9g/OXR92ghb/fzHlZUIBT8mviXbhIrr9QIIn26U9hW
 eoHxxYAM+TpnuCq4zYUO2jTS24MfvGRTHsoUzcxCI8Tj6t/T8B6uafFVJgcGVA9Yb1RW
 dp7b1pvnKSnEwjE2ZsSuM5dFAcwhbMjcVRzbY4wL1/+g27vzKm9XVFzm7hfP75BOrfN4
 sVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7SpmCxT/nTHlY+2XgH97oE1bAOfA80ctqu0kl+CSM2k=;
 b=I6GjAx90jxu0EpPmnjBsSXadpb0Q4Z9Xr7GTwxMSK4h6gAvbNzW9zCDRGBnzCoaYfE
 2+fY4oYWyVktoj20YLENedlhTnP0snbZiTmkhNrQK7hSJo8ocoo5nPRX5kUoCZ9mU9Z6
 JiSG1DlIEkWpK5GHuN7eKDLyqV8/xyXrpnhgQ+fm/sGrOAkmaRlvSai/iZ5UwtXiq/Tb
 hC925chAHBsm+cnU8SuopWLt6pY4xOCIRZotepIqWfhdQ7HsLT1aoZBStTXtKe/ULMTJ
 qJvzlGKO2jaBEwUztI9tM9tZbqQdHCzbkZabf0ppmJa0hQny07mwkLd3qcxdn84BKWXy
 Jjww==
X-Gm-Message-State: AOAM532HBLVBGGi9jXV4+b+fRbWai8Jr6dfBH/4pCS76p3xS1rA3EABi
 db8uWlPGCtC+bA+3LoJE2ZHuvEP/AlHxnwbyxfHb1oty2a76TG/Y
X-Google-Smtp-Source: ABdhPJxztdnIxiEQ+YbsCwVl6QyVpt469fudUCY2lBFkY8qwUP46ad/fjJOE6MHV68PPo4U9Om8L0SyxipRQqQeCU3Q=
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr22414696wrn.6.1618942583638; 
 Tue, 20 Apr 2021 11:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <2ee6acde-5643-0597-017b-7e20bd1a704d@gmail.com>
In-Reply-To: <2ee6acde-5643-0597-017b-7e20bd1a704d@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 19:15:34 +0100
Message-ID: <CAPj87rN0hMHVKFzAte-mnPyPT_NUG7z=cmabTw65rJ22eQhYoQ@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: multipart/mixed; boundary="===============2144217413=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2144217413==
Content-Type: multipart/alternative; boundary="0000000000009c1c9705c06b7154"

--0000000000009c1c9705c06b7154
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Apr 2021 at 19:00, Christian K=C3=B6nig <
ckoenig.leichtzumerken@gmail.com> wrote:

> Am 20.04.21 um 19:44 schrieb Daniel Stone:
>
> But winsys is something _completely_ different. Yes, you're using the GPU
> to do things with buffers A, B, and C to produce buffer Z. Yes, you're
> using vkQueuePresentKHR to schedule that work. Yes, Mutter's composition
> job might depend on a Chromium composition job which depends on GTA's
> render job which depends on GTA's compute job which might take a year to
> complete. Mutter's composition job needs to complete in 'reasonable'
> (again, FSVO) time, no matter what. The two are compatible.
>
> How? Don't lump them together. Isolate them aggressively, and
> _predictably_ in a way that you can reason about.
>
> What clients do in their own process space is their own business. Games
> can deadlock themselves if they get wait-before-signal wrong. Compute job=
s
> can run for a year. Their problem. Winsys is not that, because you're
> crossing every isolation boundary possible. Process, user, container, VM =
-
> every kind of privilege boundary. Thus far, dma_fence has protected us fr=
om
> the most egregious abuses by guaranteeing bounded-time completion; it als=
o
> acts as a sequencing primitive, but from the perspective of a winsys pers=
on
> that's of secondary importance, which is probably one of the bigger
> disconnects between winsys people and GPU driver people.
>
>
> Finally somebody who understands me :)
>
> Well the question is then how do we get winsys and your own process space
> together then?
>

It's a jarring transition. If you take a very narrow view and say 'it's all
GPU work in shared buffers so it should all work the same', then
client<->winsys looks the same as client<->client gbuffer. But this is a
trap.

Just because you can mmap() a file on an NFS server in New Zealand doesn't
mean that you should have the same expectations of memory access to that
file as you do to of a pointer from alloca(). Even if the primitives look
the same, you are crossing significant boundaries, and those do not come
without a compromise and a penalty.


> Anyway, one of the great things about winsys (there are some! trust me) i=
s
> we don't need to be as hopelessly general as for game engines, nor as
> hyperoptimised. We place strict demands on our clients, and we literally
> kill them every single time they get something wrong in a way that's
> visible to us. Our demands on the GPU are so embarrassingly simple that y=
ou
> can run every modern desktop environment on GPUs which don't have unified
> shaders. And on certain platforms who don't share tiling formats between
> texture/render-target/scanout ... and it all still runs fast enough that
> people don't complain.
>
>
> Ignoring everything below since that is the display pipeline I'm not
> really interested in. My concern is how to get the buffer from the client
> to the server without allowing the client to get the server into trouble?
>
> My thinking is still to use timeouts to acquire texture locks. E.g. when
> the compositor needs to access texture it grabs a lock and if that lock
> isn't available in less than 20ms whoever is holding it is killed hard an=
d
> the lock given to the compositor.
>
> It's perfectly fine if a process has a hung queue, but if it tries to sen=
d
> buffers which should be filled by that queue to the compositor it just ge=
ts
> a corrupted window content.
>

Kill the client hard. If the compositor has speculatively queued sampling
against rendering which never completed, let it access garbage. You'll have
one frame of garbage (outdated content, all black, random pattern; the
failure mode is equally imperfect, because there is no perfect answer),
then the compositor will notice the client has disappeared and remove all
its resources.

It's not possible to completely prevent this situation if the compositor
wants to speculatively pipeline work, only ameliorate it. From a
system-global point of view, just expose the situation and let it bubble
up. Watch the number of fences which failed to retire in time, and destroy
the context if there are enough of them (maybe 1, maybe 100). Watch the
number of contexts the file description get forcibly destroyed, and destroy
the file description if there are enough of them. Watch the number of
descriptions which get forcibly destroyed, and destroy the process if there
are enough of them. Watch the number of processes in a cgroup/pidns which
get forcibly destroyed, and destroy the ... etc. Whether it's the DRM
driver or an external monitor such as systemd/Flatpak/podman/Docker doing
that is pretty immaterial, as long as the concept of failure bubbling up
remains.

(20ms is objectively the wrong answer FWIW, because we're not a hard RTOS.
But if our biggest point of disagreement is 20 vs. 200 vs. 2000 vs. 20000
ms, then this thread has been a huge success!)

Cheers,
Daniel

--0000000000009c1c9705c06b7154
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"">On Tue, 20 Apr 2021 at 1=
9:00, Christian K=C3=B6nig &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gma=
il.com">ckoenig.leichtzumerken@gmail.com</a>&gt; wrote:</span><br></div><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div><div>Am 20.04.21 um 19:44 schrieb Daniel
      Stone:</div><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"=
gmail_quote">
          <div>But winsys is something _completely_ different. Yes,
            you&#39;re using the GPU to do things with buffers A, B, and C
            to produce buffer Z. Yes, you&#39;re using vkQueuePresentKHR to
            schedule that work. Yes, Mutter&#39;s composition job might
            depend on a Chromium composition job which depends on GTA&#39;s
            render job which depends on GTA&#39;s compute job which might
            take a year to complete. Mutter&#39;s composition job needs to
            complete in &#39;reasonable&#39; (again, FSVO) time, no matter =
what.
            The two are compatible.</div>
          <div><br>
          </div>
          <div>How? Don&#39;t lump them together. Isolate them
            aggressively,=C2=A0and _predictably_ in a way that you can reas=
on
            about.</div>
          <div><br>
          </div>
          <div>What clients do in their own process space is their own
            business.=C2=A0Games can deadlock themselves if they get
            wait-before-signal wrong. Compute jobs can run for a year.
            Their problem. Winsys is not that, because you&#39;re crossing
            every isolation boundary possible. Process, user, container,
            VM - every kind of privilege boundary. Thus far, dma_fence
            has protected us from the most egregious abuses by
            guaranteeing bounded-time completion; it also acts as a
            sequencing primitive, but from the perspective of a winsys
            person that&#39;s of secondary importance, which is probably on=
e
            of the bigger disconnects between winsys people and GPU
            driver people.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Finally somebody who understands me :)<br>
    <br>
    Well the question is then how do we get winsys and your own process
    space together then?<br></div></blockquote><div><br></div><div>It&#39;s=
 a jarring transition. If you take a very narrow view and say &#39;it&#39;s=
 all GPU work in shared buffers so it should all work the same&#39;, then c=
lient&lt;-&gt;winsys looks the same as client&lt;-&gt;client gbuffer. But t=
his is a trap.</div><div><br></div><div>Just because you can mmap() a file =
on an NFS server in New Zealand doesn&#39;t mean that you should have the s=
ame expectations of memory access to that file as you do to of a pointer fr=
om alloca(). Even if the primitives look the same, you are crossing signifi=
cant boundaries, and those do not come without a compromise and a penalty.<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v><blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
         =20
          <div>Anyway, one of the great things about winsys (there are
            some! trust me) is we don&#39;t need to be as hopelessly genera=
l
            as for game engines, nor as hyperoptimised. We place strict
            demands on our clients, and we literally kill them every
            single time they get something wrong in a way that&#39;s visibl=
e
            to us. Our demands on the GPU are so embarrassingly simple
            that you can run every modern desktop environment on GPUs
            which don&#39;t have unified shaders. And on certain=C2=A0platf=
orms
            who don&#39;t share tiling formats between
            texture/render-target/scanout ... and it all still runs fast
            enough that people don&#39;t complain.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Ignoring everything below since that is the display pipeline I&#39;m no=
t
    really interested in. My concern is how to get the buffer from the
    client to the server without allowing the client to get the server
    into trouble?<br>
    <br>
    My thinking is still to use timeouts to acquire texture locks. E.g.
    when the compositor needs to access texture it grabs a lock and if
    that lock isn&#39;t available in less than 20ms whoever is holding it i=
s
    killed hard and the lock given to the compositor.<br>
    <br>
    It&#39;s perfectly fine if a process has a hung queue, but if it tries
    to send buffers which should be filled by that queue to the
    compositor it just gets a corrupted window content.<br></div></blockquo=
te><div><br></div><div>Kill the client hard. If the compositor has speculat=
ively queued sampling against rendering which never completed, let it acces=
s garbage. You&#39;ll have one frame of garbage (outdated content, all blac=
k, random pattern; the failure mode is equally imperfect, because there is =
no perfect answer), then the compositor will notice the client has disappea=
red and remove all its resources.</div><div><br></div><div>It&#39;s not pos=
sible to completely prevent this situation if the compositor wants to specu=
latively pipeline work, only ameliorate it. From a system-global point of v=
iew, just expose the situation and let it bubble up. Watch the number of fe=
nces which failed to retire in time, and destroy the context if there are e=
nough of them (maybe 1, maybe 100). Watch the number of contexts the file d=
escription get forcibly destroyed, and destroy the file description if ther=
e are enough of them. Watch the number of descriptions which get forcibly d=
estroyed, and destroy the process if there are enough of them. Watch the nu=
mber of processes in a cgroup/pidns=C2=A0which get forcibly destroyed, and =
destroy the ... etc. Whether it&#39;s the DRM driver or an external monitor=
 such as systemd/Flatpak/podman/Docker doing that is pretty immaterial, as =
long as the concept of failure bubbling up remains.</div><div><br></div><di=
v>(20ms is objectively the wrong answer FWIW, because we&#39;re not a hard =
RTOS. But if our biggest point of disagreement is 20 vs. 200 vs. 2000 vs. 2=
0000 ms, then this thread has been a huge success!)</div><div><br></div><di=
v>Cheers,</div><div>Daniel=C2=A0</div></div></div>

--0000000000009c1c9705c06b7154--

--===============2144217413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2144217413==--
