Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4680D3956F0
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 10:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98516E884;
	Mon, 31 May 2021 08:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807046E884;
 Mon, 31 May 2021 08:25:39 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id s6so12487336edu.10;
 Mon, 31 May 2021 01:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=poB73wf5466hbomdjtxFNKbSQSQ59KS6ynL9JADMnBM=;
 b=SbMpfS9Sfaqj294FpiT7SPOLU4K9U0svLj/1yN6LbfgfPWZWg2P4ARKkQBwbkFELaI
 uw9vEIPGnDfKCun5Y3QM89cPLoAQABHr5rzL7vbAUJSeEdxvR7E7mMsV7o/+AHHvPfiU
 R7tClnxSURgq4HPFv30ihidTJBhn3aaD9wAc84Q6+ubD8SL2bUXzIPwL7ifS2qh+cZSm
 dEOZMkOw1fFT/jWa8858Gfhm3WBu2GucgTJELSFW+l5pLKrOiPXCCdvPgKZiGR4AIgTM
 aWIav5rwU8mvjzJ5V3Lz4wpxt6SKew4li6/nrcNVgM5FXH3GtxUIEohjr4dONngi6Wdy
 rFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=poB73wf5466hbomdjtxFNKbSQSQ59KS6ynL9JADMnBM=;
 b=ANBsHTmKOQvvuLa9DFOjys/PeOhEqQTXaOwKOrFtJ86SsaDDOB8Qfw7j9Jej74AbQ1
 tLhOVPgzJbdE0XKXjMfkBYNo/Xs5fFCrEhdtCYmJC+NGjYu9gy6Phj0/DiJCb1te6YX9
 rHHdXTT+ErOa8ALGqC1XDG3iR36LF3Pgo1cWmEO47eoxp2R30yugFWrh/CBSbZ6kHJAm
 QfvqyXU5aPCeAhy0WAc3Jtb8fhv7uZgVjn2aa7aG+Am/FnKpVgH34sMdpeaHcEK9/v8J
 7UsKTOju4SfTneArlrW3+eOzOuRWGKkp5sLJXBEQK7VhX1HoVEO28hb9iVwQ6ifsrwIT
 DDvQ==
X-Gm-Message-State: AOAM532yjeJpGeBvQJaaptxziXG6yIjju61824N6PgPNCN+sZWdXAkOS
 BeCK4LGFOQGNTv3Coxc0hxA=
X-Google-Smtp-Source: ABdhPJyguTHYNC7Ry8z6mCty2Tm6ZMFYwKpmjS+1HBG6888HOl2Om53VSuM8phqEMgGsYiLjBnmufQ==
X-Received: by 2002:a05:6402:40d0:: with SMTP id
 z16mr24604808edb.104.1622449538075; 
 Mon, 31 May 2021 01:25:38 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b94:4956:bad4:7c81?
 ([2a02:908:1252:fb60:b94:4956:bad4:7c81])
 by smtp.gmail.com with ESMTPSA id g19sm5621743ejw.79.2021.05.31.01.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 01:25:37 -0700 (PDT)
Subject: Re: Linux Graphics Next: Userspace submission update
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <c0c61805-7e13-05a0-ed7f-9cd61ca2b209@gmail.com>
 <CAAxE2A7wGCfDV=iYoXpP4JzObn9okGk4_WLH+sV-oJJjSk0DxQ@mail.gmail.com>
 <CAAxE2A4c2Vy7E165g9ZF4bapw=CGfSvzX-4RB05M9GBM+8E0pA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4ca02a0c-3d00-be4d-9f3d-bb63678f4d05@gmail.com>
Date: Mon, 31 May 2021 10:25:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAAxE2A4c2Vy7E165g9ZF4bapw=CGfSvzX-4RB05M9GBM+8E0pA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------777AB12B8A412C556494EA96"
Content-Language: en-US
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

This is a multi-part message in MIME format.
--------------777AB12B8A412C556494EA96
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Yes, exactly that's my thinking and also the reason why I'm pondering so 
hard on the requirement that the memory for shared user fences should 
not be modifiable by userspace directly.

Christian.

Am 29.05.21 um 05:33 schrieb Marek Olšák:
> My first email can be ignored except for the sync files. Oh well.
>
> I think I see what you mean, Christian. If we assume that an imported 
> fence is always read only (the buffer with the sequence number is read 
> only), only the process that created and exported the fence can signal 
> it. If the fence is not signaled, the exporting process is guilty. The 
> only thing the importing process must do when it's about to use the 
> fence as a dependency is to notify the kernel about it. Thus, the 
> kernel will always know the dependency graph. Then if the importing 
> process times out, the kernel will blame any of the processes that 
> passed it a fence that is still unsignaled. The kernel will blame the 
> process that timed out only if all imported fences have been signaled. 
> It seems pretty robust.
>
> It's the same with implicit sync except that the buffer with the 
> sequence number is writable. Any process that has an implicitly-sync'd 
> buffer can set the sequence number to 0 or UINT64_MAX. 0 will cause a 
> timeout for the next job, while UINT64_MAX might cause a timeout a 
> little later. The timeout can be mitigated by the kernel because the 
> kernel knows the greatest number that should be there, but it's not 
> possible to know which process is guilty (all processes holding the 
> buffer handle would be suspects).
>
> Marek
>
> On Fri, May 28, 2021 at 6:25 PM Marek Olšák <maraeo@gmail.com 
> <mailto:maraeo@gmail.com>> wrote:
>
>     If both implicit and explicit synchronization are handled the
>     same, then the kernel won't be able to identify the process that
>     caused an implicit sync deadlock. The process that is stuck
>     waiting for a fence can be innocent, and the kernel can't punish
>     it. Likewise, the GPU reset guery that reports which process is
>     guilty and innocent will only be able to report unknown. Is that OK?
>
>     Marek
>
>     On Fri, May 28, 2021 at 10:41 AM Christian König
>     <ckoenig.leichtzumerken@gmail.com
>     <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
>
>         Hi Marek,
>
>         well I don't think that implicit and explicit synchronization
>         needs to be mutual exclusive.
>
>         What we should do is to have the ability to transport an
>         synchronization object with each BO.
>
>         Implicit and explicit synchronization then basically become
>         the same, they just transport the synchronization object
>         differently.
>
>         The biggest problem are the sync_files for Android, since they
>         are really not easy to support at all. If Android wants to
>         support user queues we would probably have to do some changes
>         there.
>
>         Regards,
>         Christian.
>
>         Am 27.05.21 um 23:51 schrieb Marek Olšák:
>>         Hi,
>>
>>         Since Christian believes that we can't deadlock the kernel
>>         with some changes there, we just need to make everything nice
>>         for userspace too. Instead of explaining how it will work, I
>>         will explain the cases where future hardware (and its kernel
>>         driver) will break existing userspace in order to protect
>>         everybody from deadlocks. Anything that uses implicit sync
>>         will be spared, so X and Wayland will be fine, assuming they
>>         don't import/export fences. Those use cases that do
>>         import/export fences might or might not work, depending on
>>         how the fences are used.
>>
>>         One of the necessities is that all fences will become future
>>         fences. The semantics of imported/exported fences will change
>>         completely and will have new restrictions on the usage. The
>>         restrictions are:
>>
>>
>>         1) Android sync files will be impossible to support, so won't
>>         be supported. (they don't allow future fences)
>>
>>
>>         2) Implicit sync and explicit sync will be mutually exclusive
>>         between process. A process can either use one or the other,
>>         but not both. This is meant to prevent a deadlock condition
>>         with future fences where any process can malevolently
>>         deadlock execution of any other process, even execution of a
>>         higher-privileged process. The kernel will impose the
>>         following restrictions to protect against the deadlock:
>>
>>         a) a process with an implicitly-sync'd imported/exported
>>         buffer can't import/export a fence from/to another process
>>         b) a process with an imported/exported fence can't
>>         import/export an implicitly-sync'd buffer from/to another process
>>
>>         Alternative: A higher-privileged process could enforce both
>>         restrictions instead of the kernel to protect itself from the
>>         deadlock, but this would be a can of worms for existing
>>         userspace. It would be better if the kernel just broke unsafe
>>         userspace on future hw, just like sync files.
>>
>>         If both implicit and explicit sync are allowed to occur
>>         simultaneously, sending a future fence that will never signal
>>         to any process will deadlock that process after it acquires
>>         the implicit sync lock, which is a sequence number that the
>>         process is required to write to memory and send an interrupt
>>         from the GPU in a finite time. This is how the deadlock can
>>         happen:
>>
>>         * The process gets sequence number N from the kernel for an
>>         implicitly-sync'd buffer.
>>         * The process inserts (into the GPU user-mapped queue) a wait
>>         for sequence number N-1.
>>         * The process inserts a wait for a fence, but it doesn't know
>>         that it will never signal ==> deadlock.
>>         ...
>>         * The process inserts a command to write sequence number N to
>>         a predetermined memory location. (which will make the buffer
>>         idle and send an interrupt to the kernel)
>>         ...
>>         * The kernel will terminate the process because it has never
>>         received the interrupt. (i.e. a less-privileged process just
>>         killed a more-privileged process)
>>
>>         It's the interrupt for implicit sync that never arrived that
>>         caused the termination, and the only way another process can
>>         cause it is by sending a fence that will never signal. Thus,
>>         importing/exporting fences from/to other processes can't be
>>         allowed simultaneously with implicit sync.
>>
>>
>>         3) Compositors (and other privileged processes, and display
>>         flipping) can't trust imported/exported fences. They need a
>>         timeout recovery mechanism from the beginning, and the
>>         following are some possible solutions to timeouts:
>>
>>         a) use a CPU wait with a small absolute timeout, and display
>>         the previous content on timeout
>>         b) use a GPU wait with a small absolute timeout, and
>>         conditional rendering will choose between the latest content
>>         (if signalled) and previous content (if timed out)
>>
>>         The result would be that the desktop can run close to 60 fps
>>         even if an app runs at 1 fps.
>>
>>         *Redefining imported/exported fences and breaking some
>>         users/OSs is the only way to have userspace GPU command
>>         submission, and the deadlock example here is the
>>         counterexample proving that there is no other way.*
>>
>>         So, what are the chances this is going to fly with the ecosystem?
>>
>>         Thanks,
>>         Marek
>


--------------777AB12B8A412C556494EA96
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Yes, exactly that's my thinking and also the reason why I'm
    pondering so hard on the requirement that the memory for shared user
    fences should not be modifiable by userspace directly.<br>
    <br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 29.05.21 um 05:33 schrieb Marek
      Olšák:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAxE2A4c2Vy7E165g9ZF4bapw=CGfSvzX-4RB05M9GBM+8E0pA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>My first email can be ignored except for the sync files. Oh
          well.<br>
        </div>
        <div><br>
        </div>
        <div>I think I see what you mean, Christian. If we assume that
          an imported fence is always read only (the buffer with the
          sequence number is read only), only the process that created
          and exported the fence can signal it. If the fence is not
          signaled, the exporting process is guilty. The only thing the
          importing process must do when it's about to use the fence as
          a dependency is to notify the kernel about it. Thus, the
          kernel will always know the dependency graph. Then if the
          importing process times out, the kernel will blame any of the
          processes that passed it a fence that is still unsignaled. The
          kernel will blame the process that timed out only if all
          imported fences have been signaled. It seems pretty robust.</div>
        <div><br>
        </div>
        <div>It's the same with implicit sync except that the buffer
          with the sequence number is writable. Any process that has an
          implicitly-sync'd buffer can set the sequence number to 0 or
          UINT64_MAX. 0 will cause a timeout for the next job, while
          UINT64_MAX might cause a timeout a little later. The timeout
          can be mitigated by the kernel because the kernel knows the
          greatest number that should be there, but it's not possible to
          know which process is guilty (all processes holding the buffer
          handle would be suspects).<br>
        </div>
        <div><br>
        </div>
        <div>Marek<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, May 28, 2021 at 6:25
          PM Marek Olšák &lt;<a href="mailto:maraeo@gmail.com"
            moz-do-not-send="true">maraeo@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div dir="ltr">
            <div>If both implicit and explicit synchronization are
              handled the same, then the kernel won't be able to
              identify the process that caused an implicit sync
              deadlock. The process that is stuck waiting for a fence
              can be innocent, and the kernel can't punish it. Likewise,
              the GPU reset guery that reports which process is guilty
              and innocent will only be able to report unknown. Is that
              OK?<br>
            </div>
            <br>
            <div>Marek<br>
            </div>
          </div>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Fri, May 28, 2021 at
              10:41 AM Christian König &lt;<a
                href="mailto:ckoenig.leichtzumerken@gmail.com"
                target="_blank" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <div> Hi Marek,<br>
                <br>
                well I don't think that implicit and explicit
                synchronization needs to be mutual exclusive.<br>
                <br>
                What we should do is to have the ability to transport an
                synchronization object with each BO.<br>
                <br>
                Implicit and explicit synchronization then basically
                become the same, they just transport the synchronization
                object differently.<br>
                <br>
                The biggest problem are the sync_files for Android,
                since they are really not easy to support at all. If
                Android wants to support user queues we would probably
                have to do some changes there.<br>
                <br>
                Regards,<br>
                Christian.<br>
                <br>
                <div>Am 27.05.21 um 23:51 schrieb Marek Olšák:<br>
                </div>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div>Hi,</div>
                    <div><br>
                    </div>
                    <div>Since Christian believes that we can't deadlock
                      the kernel with some changes there, we just need
                      to make everything nice for userspace too. Instead
                      of explaining how it will work, I will explain the
                      cases where future hardware (and its kernel
                      driver) will break existing userspace in order to
                      protect everybody from deadlocks. Anything that
                      uses implicit sync will be spared, so X and
                      Wayland will be fine, assuming they don't
                      import/export fences. Those use cases that do
                      import/export fences might or might not work,
                      depending on how the fences are used.<br>
                    </div>
                    <div><br>
                    </div>
                    <div>One of the necessities is that all fences will
                      become future fences. The semantics of
                      imported/exported fences will change completely
                      and will have new restrictions on the usage. The
                      restrictions are:<br>
                    </div>
                    <div><br>
                    </div>
                    <div><br>
                    </div>
                    <div>1) Android sync files will be impossible to
                      support, so won't be supported. (they don't allow
                      future fences)<br>
                    </div>
                    <div><br>
                    </div>
                    <div><br>
                    </div>
                    <div>2) Implicit sync and explicit sync will be
                      mutually exclusive between process. A process can
                      either use one or the other, but not both. This is
                      meant to prevent a deadlock condition with future
                      fences where any process can malevolently deadlock
                      execution of any other process, even execution of
                      a higher-privileged process. The kernel will
                      impose the following restrictions to protect
                      against the deadlock:<br>
                    </div>
                    <div><br>
                    </div>
                    <div>a) a process with an implicitly-sync'd
                      imported/exported buffer can't import/export a
                      fence from/to another process<br>
                    </div>
                    <div>b) a process with an imported/exported fence
                      can't import/export an implicitly-sync'd buffer
                      from/to another process</div>
                    <div><br>
                    </div>
                    <div>Alternative: A higher-privileged process could
                      enforce both restrictions instead of the kernel to
                      protect itself from the deadlock, but this would
                      be a can of worms for existing userspace. It would
                      be better if the kernel just broke unsafe
                      userspace on future hw, just like sync files.<br>
                    </div>
                    <div><br>
                    </div>
                    <div>If both implicit and explicit sync are allowed
                      to occur simultaneously, sending a future fence
                      that will never signal to any process will
                      deadlock that process after it acquires the
                      implicit sync lock, which is a sequence number
                      that the process is required to write to memory
                      and send an interrupt from the GPU in a finite
                      time. This is how the deadlock can happen:<br>
                    </div>
                    <div><br>
                    </div>
                    <div>* The process gets sequence number N from the
                      kernel for an implicitly-sync'd buffer.<br>
                      <div>* The process inserts (into the GPU
                        user-mapped queue) a wait for sequence number
                        N-1.</div>
                      * The process inserts a wait for a fence, but it
                      doesn't know that it will never signal ==&gt;
                      deadlock.<br>
                    </div>
                    <div>...<br>
                    </div>
                    <div>* The process inserts a command to write
                      sequence number N to a predetermined memory
                      location. (which will make the buffer idle and
                      send an interrupt to the kernel)</div>
                    <div>
                      <div>...<br>
                      </div>
                      * The kernel will terminate the process because it
                      has never received the interrupt. (i.e. a
                      less-privileged process just killed a
                      more-privileged process)<br>
                    </div>
                    <div><br>
                    </div>
                    <div>It's the interrupt for implicit sync that never
                      arrived that caused the termination, and the only
                      way another process can cause it is by sending a
                      fence that will never signal. Thus,
                      importing/exporting fences from/to other processes
                      can't be allowed simultaneously with implicit
                      sync.<br>
                    </div>
                    <div><br>
                    </div>
                    <div><br>
                    </div>
                    <div>3) Compositors (and other privileged processes,
                      and display flipping) can't trust
                      imported/exported fences. They need a timeout
                      recovery mechanism from the beginning, and the
                      following are some possible solutions to timeouts:</div>
                    <div><br>
                    </div>
                    <div>a) use a CPU wait with a small absolute
                      timeout, and display the previous content on
                      timeout<br>
                    </div>
                    <div>b) use a GPU wait with a small absolute
                      timeout, and conditional rendering will choose
                      between the latest content (if signalled) and
                      previous content (if timed out)</div>
                    <div><br>
                    </div>
                    <div>The result would be that the desktop can run
                      close to 60 fps even if an app runs at 1 fps.</div>
                    <div><br>
                    </div>
                    <div><b>Redefining imported/exported fences and
                        breaking some users/OSs is the only way to have
                        userspace GPU command submission, and the
                        deadlock example here is the counterexample
                        proving that there is no other way.</b></div>
                    <div><br>
                    </div>
                    <div>So, what are the chances this is going to fly
                      with the ecosystem?<br>
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
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------777AB12B8A412C556494EA96--
