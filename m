Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F7394A23
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 05:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943726E194;
	Sat, 29 May 2021 03:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7476E075;
 Sat, 29 May 2021 03:34:16 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso8180423pjx.1; 
 Fri, 28 May 2021 20:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+xgljqB80OtDK/c2N2F2GcS9T91nmubg381OX8UWo3I=;
 b=MEgX/kVe1b+1vgGN2QZiru88iieomhewVsd8bd/kCQM7efx75OTvNGWh/AGPioMc2a
 zFxcn7N/X0p6JIPag3JXxgLZJZ6IrAif+d6qw48dehoEUK8qX9eBu6GGvZU0FlIqCCrx
 1uPr+DfBDm9AO9L9zO/1Huz7dxPS3APhzIlYdeHKj1KMUzngT8eL4kvGWA1vhGkKeHwB
 uvq5FPR70EY7LO20FA8qXb5xfk3Y8UysTfxntKtPegq5zlc/YFKuSv945YvP1Zhz0+ZR
 Mzef0zADgZxalgC00VxNfv79bsrycbpeQ4p2bD6g869M+x/LhM9LUsWvovH1twItNP2K
 AwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+xgljqB80OtDK/c2N2F2GcS9T91nmubg381OX8UWo3I=;
 b=GuhGIlEpgArdHC73QIKLXIuYMfbcu9t+2+sttn6vceNXquK4P/rh4NvYjuM1TxsrHG
 SdlM505Q13HkttrakSPeN0rwo05z2d63E3ixOeP8YM8Ap2HYqG9iEWifSKSChYEIvzgw
 P8X0UMXe07IehHMqBeaJRNhi4JeEo0oh3dJF0SHhBdV8lv6PgZ4K4d8Bdc8otQTtikw9
 PkN6IYJbliRIEaa3QmNmWZX5H97Ok72M4SFiFo3oFXLXnvXAHo4oX9GrURZEwV8Gbic8
 80y0kup9avPguog8toBSCZBMCJ9CBQV5ycj8tJjTXu07oQzClufL9gzvWl+Q2Ktxfmd2
 695Q==
X-Gm-Message-State: AOAM533u1M7h3A52Q8BVtXyK2uofgmLI0lMHdkismqblcPMkqKXHfsSn
 r4nKI6jhA/POMQxD2M/c3UvFxPVHFBEHu2jat2M=
X-Google-Smtp-Source: ABdhPJwq8zRYeYUlW7q52T6hpoUBQTaG1jNKTgE/3Zbz3z9QFYVjJcY9419o1qrTvzRLe50MDlZvBMsgA+in9PMLZqc=
X-Received: by 2002:a17:90b:34f:: with SMTP id
 fh15mr8004491pjb.75.1622259256110; 
 Fri, 28 May 2021 20:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <c0c61805-7e13-05a0-ed7f-9cd61ca2b209@gmail.com>
 <CAAxE2A7wGCfDV=iYoXpP4JzObn9okGk4_WLH+sV-oJJjSk0DxQ@mail.gmail.com>
In-Reply-To: <CAAxE2A7wGCfDV=iYoXpP4JzObn9okGk4_WLH+sV-oJJjSk0DxQ@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 28 May 2021 23:33:39 -0400
Message-ID: <CAAxE2A4c2Vy7E165g9ZF4bapw=CGfSvzX-4RB05M9GBM+8E0pA@mail.gmail.com>
Subject: Re: Linux Graphics Next: Userspace submission update
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b1b47005c36faa53"
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b1b47005c36faa53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My first email can be ignored except for the sync files. Oh well.

I think I see what you mean, Christian. If we assume that an imported fence
is always read only (the buffer with the sequence number is read only),
only the process that created and exported the fence can signal it. If the
fence is not signaled, the exporting process is guilty. The only thing the
importing process must do when it's about to use the fence as a dependency
is to notify the kernel about it. Thus, the kernel will always know the
dependency graph. Then if the importing process times out, the kernel will
blame any of the processes that passed it a fence that is still unsignaled.
The kernel will blame the process that timed out only if all imported
fences have been signaled. It seems pretty robust.

It's the same with implicit sync except that the buffer with the sequence
number is writable. Any process that has an implicitly-sync'd buffer can
set the sequence number to 0 or UINT64_MAX. 0 will cause a timeout for the
next job, while UINT64_MAX might cause a timeout a little later. The
timeout can be mitigated by the kernel because the kernel knows the
greatest number that should be there, but it's not possible to know which
process is guilty (all processes holding the buffer handle would be
suspects).

Marek

On Fri, May 28, 2021 at 6:25 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wr=
ote:

> If both implicit and explicit synchronization are handled the same, then
> the kernel won't be able to identify the process that caused an implicit
> sync deadlock. The process that is stuck waiting for a fence can be
> innocent, and the kernel can't punish it. Likewise, the GPU reset guery
> that reports which process is guilty and innocent will only be able to
> report unknown. Is that OK?
>
> Marek
>
> On Fri, May 28, 2021 at 10:41 AM Christian K=C3=B6nig <
> ckoenig.leichtzumerken@gmail.com> wrote:
>
>> Hi Marek,
>>
>> well I don't think that implicit and explicit synchronization needs to b=
e
>> mutual exclusive.
>>
>> What we should do is to have the ability to transport an synchronization
>> object with each BO.
>>
>> Implicit and explicit synchronization then basically become the same,
>> they just transport the synchronization object differently.
>>
>> The biggest problem are the sync_files for Android, since they are reall=
y
>> not easy to support at all. If Android wants to support user queues we
>> would probably have to do some changes there.
>>
>> Regards,
>> Christian.
>>
>> Am 27.05.21 um 23:51 schrieb Marek Ol=C5=A1=C3=A1k:
>>
>> Hi,
>>
>> Since Christian believes that we can't deadlock the kernel with some
>> changes there, we just need to make everything nice for userspace too.
>> Instead of explaining how it will work, I will explain the cases where
>> future hardware (and its kernel driver) will break existing userspace in
>> order to protect everybody from deadlocks. Anything that uses implicit s=
ync
>> will be spared, so X and Wayland will be fine, assuming they don't
>> import/export fences. Those use cases that do import/export fences might=
 or
>> might not work, depending on how the fences are used.
>>
>> One of the necessities is that all fences will become future fences. The
>> semantics of imported/exported fences will change completely and will ha=
ve
>> new restrictions on the usage. The restrictions are:
>>
>>
>> 1) Android sync files will be impossible to support, so won't be
>> supported. (they don't allow future fences)
>>
>>
>> 2) Implicit sync and explicit sync will be mutually exclusive between
>> process. A process can either use one or the other, but not both. This i=
s
>> meant to prevent a deadlock condition with future fences where any proce=
ss
>> can malevolently deadlock execution of any other process, even execution=
 of
>> a higher-privileged process. The kernel will impose the following
>> restrictions to protect against the deadlock:
>>
>> a) a process with an implicitly-sync'd imported/exported buffer can't
>> import/export a fence from/to another process
>> b) a process with an imported/exported fence can't import/export an
>> implicitly-sync'd buffer from/to another process
>>
>> Alternative: A higher-privileged process could enforce both restrictions
>> instead of the kernel to protect itself from the deadlock, but this woul=
d
>> be a can of worms for existing userspace. It would be better if the kern=
el
>> just broke unsafe userspace on future hw, just like sync files.
>>
>> If both implicit and explicit sync are allowed to occur simultaneously,
>> sending a future fence that will never signal to any process will deadlo=
ck
>> that process after it acquires the implicit sync lock, which is a sequen=
ce
>> number that the process is required to write to memory and send an
>> interrupt from the GPU in a finite time. This is how the deadlock can
>> happen:
>>
>> * The process gets sequence number N from the kernel for an
>> implicitly-sync'd buffer.
>> * The process inserts (into the GPU user-mapped queue) a wait for
>> sequence number N-1.
>> * The process inserts a wait for a fence, but it doesn't know that it
>> will never signal =3D=3D> deadlock.
>> ...
>> * The process inserts a command to write sequence number N to a
>> predetermined memory location. (which will make the buffer idle and send=
 an
>> interrupt to the kernel)
>> ...
>> * The kernel will terminate the process because it has never received th=
e
>> interrupt. (i.e. a less-privileged process just killed a more-privileged
>> process)
>>
>> It's the interrupt for implicit sync that never arrived that caused the
>> termination, and the only way another process can cause it is by sending=
 a
>> fence that will never signal. Thus, importing/exporting fences from/to
>> other processes can't be allowed simultaneously with implicit sync.
>>
>>
>> 3) Compositors (and other privileged processes, and display flipping)
>> can't trust imported/exported fences. They need a timeout recovery
>> mechanism from the beginning, and the following are some possible soluti=
ons
>> to timeouts:
>>
>> a) use a CPU wait with a small absolute timeout, and display the previou=
s
>> content on timeout
>> b) use a GPU wait with a small absolute timeout, and conditional
>> rendering will choose between the latest content (if signalled) and
>> previous content (if timed out)
>>
>> The result would be that the desktop can run close to 60 fps even if an
>> app runs at 1 fps.
>>
>> *Redefining imported/exported fences and breaking some users/OSs is the
>> only way to have userspace GPU command submission, and the deadlock exam=
ple
>> here is the counterexample proving that there is no other way.*
>>
>> So, what are the chances this is going to fly with the ecosystem?
>>
>> Thanks,
>> Marek
>>
>>
>>

--000000000000b1b47005c36faa53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>My first email can be ignored except for the sync fil=
es. Oh well.<br></div><div><br></div><div>I think I see what you mean, Chri=
stian. If we assume that an imported fence is always read only (the buffer =
with the sequence number is read only), only the process that created and e=
xported the fence can signal it. If the fence is not signaled, the exportin=
g process is guilty. The only thing the importing process must do when it&#=
39;s about to use the fence as a dependency is to notify the kernel about i=
t. Thus, the kernel will always know the dependency graph. Then if the impo=
rting process times out, the kernel will blame any of the processes that pa=
ssed it a fence that is still unsignaled. The kernel will blame the process=
 that timed out only if all imported fences have been signaled. It seems pr=
etty robust.</div><div><br></div><div>It&#39;s the same with implicit sync =
except that the buffer with the sequence number is writable. Any process th=
at has an implicitly-sync&#39;d buffer can set the sequence number to 0 or =
UINT64_MAX. 0 will cause a timeout for the next job, while UINT64_MAX might=
 cause a timeout a little later. The timeout can be mitigated by the kernel=
 because the kernel knows the greatest number that should be there, but it&=
#39;s not possible to know which process is guilty (all processes holding t=
he buffer handle would be suspects).<br></div><div><br></div><div>Marek<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, May 28, 2021 at 6:25 PM Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"=
mailto:maraeo@gmail.com">maraeo@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>If both impl=
icit and explicit synchronization are handled the same, then the kernel won=
&#39;t be able to identify the process that caused an implicit sync deadloc=
k. The process that is stuck waiting for a fence can be innocent, and the k=
ernel can&#39;t punish it. Likewise, the GPU reset guery that reports which=
 process is guilty and innocent will only be able to report unknown. Is tha=
t OK?<br></div><div></div><br><div>Marek<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 28, 2021 at 1=
0:41 AM Christian K=C3=B6nig &lt;<a href=3D"mailto:ckoenig.leichtzumerken@g=
mail.com" target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    Hi Marek,<br>
    <br>
    well I don&#39;t think that implicit and explicit synchronization needs
    to be mutual exclusive.<br>
    <br>
    What we should do is to have the ability to transport an
    synchronization object with each BO.<br>
    <br>
    Implicit and explicit synchronization then basically become the
    same, they just transport the synchronization object differently.<br>
    <br>
    The biggest problem are the sync_files for Android, since they are
    really not easy to support at all. If Android wants to support user
    queues we would probably have to do some changes there.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div>Am 27.05.21 um 23:51 schrieb Marek
      Ol=C5=A1=C3=A1k:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>Hi,</div>
        <div><br>
        </div>
        <div>Since Christian believes that we can&#39;t deadlock the kernel
          with some changes there, we just need to make everything nice
          for userspace too. Instead of explaining how it will work, I
          will explain the cases where future hardware (and its kernel
          driver) will break existing userspace in order to protect
          everybody from deadlocks. Anything that uses implicit sync
          will be spared, so X and Wayland will be fine, assuming they
          don&#39;t import/export fences. Those use cases that do
          import/export fences might or might not work, depending on how
          the fences are used.<br>
        </div>
        <div><br>
        </div>
        <div>One of the necessities is that all fences will become
          future fences. The semantics of imported/exported fences will
          change completely and will have new restrictions on the usage.
          The restrictions are:<br>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>1) Android sync files will be impossible to support, so
          won&#39;t be supported. (they don&#39;t allow future fences)<br>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>2) Implicit sync and explicit sync will be mutually
          exclusive between process. A process can either use one or the
          other, but not both. This is meant to prevent a deadlock
          condition with future fences where any process can
          malevolently deadlock execution of any other process, even
          execution of a higher-privileged process. The kernel will
          impose the following restrictions to protect against the
          deadlock:<br>
        </div>
        <div><br>
        </div>
        <div>a) a process with an implicitly-sync&#39;d imported/exported
          buffer can&#39;t import/export a fence from/to another process<br=
>
        </div>
        <div>b) a process with an imported/exported fence can&#39;t
          import/export an implicitly-sync&#39;d buffer from/to another
          process</div>
        <div><br>
        </div>
        <div>Alternative: A higher-privileged process could enforce both
          restrictions instead of the kernel to protect itself from the
          deadlock, but this would be a can of worms for existing
          userspace. It would be better if the kernel just broke unsafe
          userspace on future hw, just like sync files.<br>
        </div>
        <div><br>
        </div>
        <div>If both implicit and explicit sync are allowed to occur
          simultaneously, sending a future fence that will never signal
          to any process will deadlock that process after it acquires
          the implicit sync lock, which is a sequence number that the
          process is required to write to memory and send an interrupt
          from the GPU in a finite time. This is how the deadlock can
          happen:<br>
        </div>
        <div><br>
        </div>
        <div>* The process gets sequence number N from the kernel for an
          implicitly-sync&#39;d buffer.<br>
          <div>* The process inserts (into the GPU user-mapped queue) a
            wait for sequence number N-1.</div>
          * The process inserts a wait for a fence, but it doesn&#39;t know
          that it will never signal =3D=3D&gt; deadlock.<br>
        </div>
        <div>...<br>
        </div>
        <div>* The process inserts a command to write sequence number N
          to a predetermined memory location. (which will make the
          buffer idle and send an interrupt to the kernel)</div>
        <div>
          <div>...<br>
          </div>
          * The kernel will terminate the process because it has never
          received the interrupt. (i.e. a less-privileged process just
          killed a more-privileged process)<br>
        </div>
        <div><br>
        </div>
        <div>It&#39;s the interrupt for implicit sync that never arrived
          that caused the termination, and the only way another process
          can cause it is by sending a fence that will never signal.
          Thus, importing/exporting fences from/to other processes can&#39;=
t
          be allowed simultaneously with implicit sync.<br>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>3) Compositors (and other privileged processes, and display
          flipping) can&#39;t trust imported/exported fences. They need a
          timeout recovery mechanism from the beginning, and the
          following are some possible solutions to timeouts:</div>
        <div><br>
        </div>
        <div>a) use a CPU wait with a small absolute timeout, and
          display the previous content on timeout<br>
        </div>
        <div>b) use a GPU wait with a small absolute timeout, and
          conditional rendering will choose between the latest content
          (if signalled) and previous content (if timed out)</div>
        <div><br>
        </div>
        <div>The result would be that the desktop can run close to 60
          fps even if an app runs at 1 fps.</div>
        <div><br>
        </div>
        <div><b>Redefining imported/exported fences and breaking some
            users/OSs is the only way to have userspace GPU command
            submission, and the deadlock example here is the
            counterexample proving that there is no other way.</b></div>
        <div><br>
        </div>
        <div>So, what are the chances this is going to fly with the
          ecosystem?<br>
        </div>
        <div><br>
        </div>
        <div>Thanks,<br>
        </div>
        <div>Marek<br>
        </div>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>
</blockquote></div>

--000000000000b1b47005c36faa53--
