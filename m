Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F148365BE3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 17:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364596E831;
	Tue, 20 Apr 2021 15:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4526E831
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 15:08:02 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so8070876wmi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a7rBcmDXDGz4Lw9+pZ+HWZu6yZyUb/BG4yrlM5ykTEQ=;
 b=tQ5NrFo6I62yb10tHSiAMD0JMIxw+0yoUCC3Dns2wyXFKhpqurJo9j2FLF5cX3vYb5
 DqtvENDRy+GRdVOe8WkEGuls/p0JtPIH8LioqpEdf4NUGSDXAX+e8l6G9aqzHeJmLRcV
 C0N0N2b40a1VGvoqffaTVDiggOQaP1MOC5r/ErFS8ZtL2FlIdd1WS6cCzNS6p2Q3AgW3
 LB0Bbtlgdt3QFueZbuIyK/+D3aRyXBZCQw9A+r1Q2n0fRS1r5QCxt0WR1RlHeR4/srJk
 CjX7CmfUgmSdD8+TmglFwJ+esbiekk0Aj0WyzDmzU7RkBH+4oQ1ENgghizO/wBfu2yjm
 jVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a7rBcmDXDGz4Lw9+pZ+HWZu6yZyUb/BG4yrlM5ykTEQ=;
 b=AgA+kThE8aJiu7l+rfwN1Fh9a8z6e2hI35yMkGHMmSpLyaA1xXEsLVgkDMUZnNbqtk
 usvT/xr2K/OdnnHeSsh2oAP3wJHBHvIqz+ZEQxK4+O9Uh+uj/eM1FK8t0D46q3RJ3UTq
 jzOwTSDs9hdFgQCwuOs/Krm2qNGvDBBO4ZV90nLk943WOj77nFGJlJDlyCIpU+5LLf13
 OpkwXUBsAWM/ujVJtQGgp92Sdpmo+LALdPpNfwV/NDE344RiG25LuC+RPD+/O/zu8AM3
 rEJjAi8pf7twemo8xD2RCAfGa9qKRXo0oXHLtVmiySy8gQTaS+5pW8RDAOj3W61abgVg
 ufLQ==
X-Gm-Message-State: AOAM530fl8IyluSoKxeOWZwiKlx4yDw7bxFIdxSEUHykLdqU0vwQyaHh
 OTwXI07arT8Gg/4cGiMRWoD4ziKhTVFtkOF3mt0QQg==
X-Google-Smtp-Source: ABdhPJzsm1S1eYDa2vwDE2I5nX5nAxme3IqyTbxU2Zqib0Pm3AcKfp8ADxvrD63XBPQh5zx7WO1x8Iq4anRfciPt3pU=
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr5154247wmj.84.1618931281218;
 Tue, 20 Apr 2021 08:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com>
 <136d3b55-ff1e-c47b-d443-22bd27427956@gmail.com>
In-Reply-To: <136d3b55-ff1e-c47b-d443-22bd27427956@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 16:07:13 +0100
Message-ID: <CAPj87rMSk+SgCBfrcQTEvppp=qQv4MRdeHRKAOUn5pZAEhh9mg@mail.gmail.com>
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
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Content-Type: multipart/mixed; boundary="===============0291535056=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0291535056==
Content-Type: multipart/alternative; boundary="000000000000eee5f505c068cf65"

--000000000000eee5f505c068cf65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Apr 2021 at 15:58, Christian K=C3=B6nig <
ckoenig.leichtzumerken@gmail.com> wrote:

> Am 20.04.21 um 16:53 schrieb Daniel Stone:
>
> On Mon, 19 Apr 2021 at 11:48, Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wr=
ote:
>
>> Deadlock mitigation to recover from segfaults:
>> - The kernel knows which process is obliged to signal which fence. This
>> information is part of the Present request and supplied by userspace.
>> - If the producer crashes, the kernel signals the submit fence, so that
>> the consumer can make forward progress.
>> - If the consumer crashes, the kernel signals the return fence, so that
>> the producer can reclaim the buffer.
>> - A GPU hang signals all fences. Other deadlocks will be handled like GP=
U
>> hangs.
>>
>
> Another thought: with completely arbitrary userspace fencing, none of thi=
s
> is helpful either. If the compositor can't guarantee that a hostile clien=
t
> has submitted a fence which will never be signaled, then it won't be
> waiting on it, so it already needs infrastructure to handle something lik=
e
> this.
>
>
> That already handles the crashed-client case, because if the client
> crashes, then its connection will be dropped, which will trigger the
> compositor to destroy all its resources anyway, including any pending wai=
ts.
>
>
> Exactly that's the problem. A compositor isn't immediately informed that
> the client crashed, instead it is still referencing the buffer and trying
> to use it for compositing.
>

If the compositor no longer has a guarantee that the buffer will be ready
for composition in a reasonable amount of time (which dma_fence gives us,
and this proposal does not appear to give us), then the compositor isn't
trying to use the buffer for compositing, it's waiting asynchronously on a
notification that the fence has signaled before it attempts to use the
buffer.

Marek's initial suggestion is that the kernel signal the fence, which would
unblock composition (and presumably show garbage on screen, or at best jump
back to old content).

My position is that the compositor will know the process has crashed anyway
- because its socket has been closed - at which point we destroy all the
client's resources including its windows and buffers regardless. Signaling
the fence doesn't give us any value here, _unless_ the compositor is just
blindly waiting for the fence to signal ... which it can't do because
there's no guarantee the fence will ever signal.

Cheers,
Daniel

--000000000000eee5f505c068cf65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"">On Tue, 20 Apr 2021 at 1=
5:58, Christian K=C3=B6nig &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gma=
il.com">ckoenig.leichtzumerken@gmail.com</a>&gt; wrote:</span></div><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    <div>Am 20.04.21 um 16:53 schrieb Daniel
      Stone:</div><blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
       =20
       =20
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Mon, 19 Apr 2021 at
            11:48, Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@gmail=
.com" target=3D"_blank">maraeo@gmail.com</a>&gt; wrote:</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div><span>Deadlock mitigation to recover from
                  segfaults:</span><br>
              </div>
              <div>- The kernel knows which process is obliged to signal
                which fence. This information is part of the Present
                request and supplied by userspace.<br>
              </div>
              <div>- If the producer crashes, the kernel signals the
                submit fence, so that the consumer can make forward
                progress.</div>
              <div>- If the consumer crashes, the kernel signals the
                return fence, so that the producer can reclaim the
                buffer.</div>
              <div>- A GPU hang signals all fences. Other deadlocks will
                be handled like GPU hangs.</div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Another thought: with completely arbitrary userspace
            fencing, none of this is helpful either. If the compositor
            can&#39;t guarantee that a hostile client has submitted a fence
            which will never be signaled, then it won&#39;t be waiting on
            it, so it already needs infrastructure to handle something
            like this. </div>
        </div>
      </div>
    </blockquote>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>That already=C2=A0handles the crashed-client case, because i=
f
            the client crashes, then its connection will be dropped,
            which will trigger the compositor to destroy all its
            resources anyway, including any pending waits.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Exactly that&#39;s the problem. A compositor isn&#39;t immediately info=
rmed
    that the client crashed, instead it is still referencing the buffer
    and trying to use it for compositing.<br></div></blockquote><div><br></=
div><div>If the compositor no longer has a guarantee that the buffer will b=
e ready for composition in a reasonable amount of time (which dma_fence giv=
es us, and this proposal does not appear to give us), then the compositor i=
sn&#39;t trying to use the buffer for compositing, it&#39;s waiting asynchr=
onously on a notification that the fence has signaled before it attempts to=
 use the buffer.</div><div><br></div><div>Marek&#39;s initial suggestion is=
 that the kernel signal the fence, which would unblock composition (and pre=
sumably show garbage on screen,=C2=A0or at best jump back to old content).<=
/div><div><br></div><div>My position is that the compositor will know the p=
rocess has crashed anyway - because its socket has been closed - at which p=
oint we destroy all the client&#39;s resources including its windows and bu=
ffers regardless. Signaling the fence doesn&#39;t give us any value here, _=
unless_ the compositor is just blindly waiting for the fence to signal ... =
which it can&#39;t do because there&#39;s no guarantee the fence will ever =
signal.</div><div>=C2=A0</div><div>Cheers,</div><div>Daniel</div></div></di=
v>

--000000000000eee5f505c068cf65--

--===============0291535056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0291535056==--
