Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E69D394455
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 16:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4286E1F1;
	Fri, 28 May 2021 14:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4D96E1F1;
 Fri, 28 May 2021 14:41:55 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r23so5154916edw.1;
 Fri, 28 May 2021 07:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=iEH0VyXqt5KfTGEfpG6FnxqFGAjOZ2SB30W+2uM2VF0=;
 b=cNxwi1WPj6isGoiTxJT8pFhQ4TSY/A41+DEfpkIWQ9LTIZ8FaoO4iV2Kqq5+Ws65sl
 vPKZGlAg80yXnwYwUfmL58coOEwi/1kE1fX9zj9f/TYwbisUX7sUOjRxm/To0v1vdmQ/
 yC09iji4Bm6Fg+mB5USh6A0+FcXMQgT+WxPDijKFllz910ij/uHSQOZx7UOZ82dwLJbP
 8vhzB/d9+0i7m9UzGtI88LwCsNi+5YiQ42c/d3aRe8G/98AGZ7xEklyUOGeOE716yvgZ
 SWHfkAIHwz+YPSBw7kdfNpU7/ZVDNGIT1gTsLSc5ZaGQ49yiChSOoqGM+ITogsBCBBsk
 pleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=iEH0VyXqt5KfTGEfpG6FnxqFGAjOZ2SB30W+2uM2VF0=;
 b=cS64D5BrhCywelpCvEkJgP29vNZqFegXiM4cfmKuRghQvFN0xOnEzdOMroHNMow9mk
 IEfMCqBkbODKlzAjsoCOzqpu9IwKHhxBGeba6l825ZD8tGWIiJ45eGw0hvlHMx1sittn
 6xnP9DD+b03rZ4WPGaGqA9QKv75h//5Y7oRYC32uBntcsD1rFd0m9dVkN/u1CI6pLmgw
 XKv8S3rN7N1GQZ9qpvjXK6qB+o9NGwrpgXaCLpllltXjTC007Rw6TBIJbAQi6ceuwJGy
 lBB1UHkiz6mgzg2paaHb8eZS6mdw3I2kuEZGII/uGZkDXognGn3o5mlLjxiYmxyFv096
 xhpQ==
X-Gm-Message-State: AOAM533JPFY8ZwR+FuLkvcnVR9q0ExvDz3ixbl8aaBe00m5Nly6TQTxI
 woW43BTtMV7npTJSSezTXo4=
X-Google-Smtp-Source: ABdhPJxV0j9yPgq4BxdcNlaRmCGI9C6y8Ou09gDP9v3bxOTlUZsd2rOvbmInLIaDU2IdSXYiMg8aew==
X-Received: by 2002:a05:6402:48f:: with SMTP id
 k15mr10027268edv.262.1622212913886; 
 Fri, 28 May 2021 07:41:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:a878:922a:f147:ebc?
 ([2a02:908:1252:fb60:a878:922a:f147:ebc])
 by smtp.gmail.com with ESMTPSA id yr15sm2490822ejb.16.2021.05.28.07.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 07:41:53 -0700 (PDT)
Subject: Re: Linux Graphics Next: Userspace submission update
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c0c61805-7e13-05a0-ed7f-9cd61ca2b209@gmail.com>
Date: Fri, 28 May 2021 16:41:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------2C55DCE99DAFE7E8DEBC9579"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------2C55DCE99DAFE7E8DEBC9579
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Marek,

well I don't think that implicit and explicit synchronization needs to 
be mutual exclusive.

What we should do is to have the ability to transport an synchronization 
object with each BO.

Implicit and explicit synchronization then basically become the same, 
they just transport the synchronization object differently.

The biggest problem are the sync_files for Android, since they are 
really not easy to support at all. If Android wants to support user 
queues we would probably have to do some changes there.

Regards,
Christian.

Am 27.05.21 um 23:51 schrieb Marek Olšák:
> Hi,
>
> Since Christian believes that we can't deadlock the kernel with some 
> changes there, we just need to make everything nice for userspace too. 
> Instead of explaining how it will work, I will explain the cases where 
> future hardware (and its kernel driver) will break existing userspace 
> in order to protect everybody from deadlocks. Anything that uses 
> implicit sync will be spared, so X and Wayland will be fine, assuming 
> they don't import/export fences. Those use cases that do import/export 
> fences might or might not work, depending on how the fences are used.
>
> One of the necessities is that all fences will become future fences. 
> The semantics of imported/exported fences will change completely and 
> will have new restrictions on the usage. The restrictions are:
>
>
> 1) Android sync files will be impossible to support, so won't be 
> supported. (they don't allow future fences)
>
>
> 2) Implicit sync and explicit sync will be mutually exclusive between 
> process. A process can either use one or the other, but not both. This 
> is meant to prevent a deadlock condition with future fences where any 
> process can malevolently deadlock execution of any other process, even 
> execution of a higher-privileged process. The kernel will impose the 
> following restrictions to protect against the deadlock:
>
> a) a process with an implicitly-sync'd imported/exported buffer can't 
> import/export a fence from/to another process
> b) a process with an imported/exported fence can't import/export an 
> implicitly-sync'd buffer from/to another process
>
> Alternative: A higher-privileged process could enforce both 
> restrictions instead of the kernel to protect itself from the 
> deadlock, but this would be a can of worms for existing userspace. It 
> would be better if the kernel just broke unsafe userspace on future 
> hw, just like sync files.
>
> If both implicit and explicit sync are allowed to occur 
> simultaneously, sending a future fence that will never signal to any 
> process will deadlock that process after it acquires the implicit sync 
> lock, which is a sequence number that the process is required to write 
> to memory and send an interrupt from the GPU in a finite time. This is 
> how the deadlock can happen:
>
> * The process gets sequence number N from the kernel for an 
> implicitly-sync'd buffer.
> * The process inserts (into the GPU user-mapped queue) a wait for 
> sequence number N-1.
> * The process inserts a wait for a fence, but it doesn't know that it 
> will never signal ==> deadlock.
> ...
> * The process inserts a command to write sequence number N to a 
> predetermined memory location. (which will make the buffer idle and 
> send an interrupt to the kernel)
> ...
> * The kernel will terminate the process because it has never received 
> the interrupt. (i.e. a less-privileged process just killed a 
> more-privileged process)
>
> It's the interrupt for implicit sync that never arrived that caused 
> the termination, and the only way another process can cause it is by 
> sending a fence that will never signal. Thus, importing/exporting 
> fences from/to other processes can't be allowed simultaneously with 
> implicit sync.
>
>
> 3) Compositors (and other privileged processes, and display flipping) 
> can't trust imported/exported fences. They need a timeout recovery 
> mechanism from the beginning, and the following are some possible 
> solutions to timeouts:
>
> a) use a CPU wait with a small absolute timeout, and display the 
> previous content on timeout
> b) use a GPU wait with a small absolute timeout, and conditional 
> rendering will choose between the latest content (if signalled) and 
> previous content (if timed out)
>
> The result would be that the desktop can run close to 60 fps even if 
> an app runs at 1 fps.
>
> *Redefining imported/exported fences and breaking some users/OSs is 
> the only way to have userspace GPU command submission, and the 
> deadlock example here is the counterexample proving that there is no 
> other way.*
>
> So, what are the chances this is going to fly with the ecosystem?
>
> Thanks,
> Marek


--------------2C55DCE99DAFE7E8DEBC9579
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Marek,<br>
    <br>
    well I don't think that implicit and explicit synchronization needs
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
    <div class="moz-cite-prefix">Am 27.05.21 um 23:51 schrieb Marek
      Olšák:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Hi,</div>
        <div><br>
        </div>
        <div>Since Christian believes that we can't deadlock the kernel
          with some changes there, we just need to make everything nice
          for userspace too. Instead of explaining how it will work, I
          will explain the cases where future hardware (and its kernel
          driver) will break existing userspace in order to protect
          everybody from deadlocks. Anything that uses implicit sync
          will be spared, so X and Wayland will be fine, assuming they
          don't import/export fences. Those use cases that do
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
          won't be supported. (they don't allow future fences)<br>
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
        <div>a) a process with an implicitly-sync'd imported/exported
          buffer can't import/export a fence from/to another process<br>
        </div>
        <div>b) a process with an imported/exported fence can't
          import/export an implicitly-sync'd buffer from/to another
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
          implicitly-sync'd buffer.<br>
          <div>* The process inserts (into the GPU user-mapped queue) a
            wait for sequence number N-1.</div>
          * The process inserts a wait for a fence, but it doesn't know
          that it will never signal ==&gt; deadlock.<br>
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
        <div>It's the interrupt for implicit sync that never arrived
          that caused the termination, and the only way another process
          can cause it is by sending a fence that will never signal.
          Thus, importing/exporting fences from/to other processes can't
          be allowed simultaneously with implicit sync.<br>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>3) Compositors (and other privileged processes, and display
          flipping) can't trust imported/exported fences. They need a
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
  </body>
</html>

--------------2C55DCE99DAFE7E8DEBC9579--
