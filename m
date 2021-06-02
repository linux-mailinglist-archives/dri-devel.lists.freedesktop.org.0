Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAFA3985E3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC4D6EC38;
	Wed,  2 Jun 2021 10:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46216E3B2;
 Wed,  2 Jun 2021 10:06:17 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ci15so2949633ejc.10;
 Wed, 02 Jun 2021 03:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=E+ez80GbKSal0gKiUJp3Axd7NuAXUfpuWcv+1pQPff0=;
 b=o44A6KSicmphKBBTRnYcTtBfKHRgVE1N5U1d3jHyhOQN8xzZiaX1uSr7LzXEltLeq6
 PIQtbQM57GMSXMIfLraI2acC9yuTlbXBzy1ow1Fqx3b1sX3CtQMh6MDHLYZxrXOjXnGK
 m+M0jRloQacd0oDscayzH5IiAOUEA8Rana11cMNvAQd0M6Xe3jWeCNh117Kbz9/b9Qpn
 S/iXOVTb0TlZ5Xma3J6xmvCTJRPyONI9I8mAu3E/c06q6U2vdYLD/pUC5H4DdPErW7pG
 p/2P2L5YQTFanjwdCpWczN69Ni/5ZPcD921PK2zJKvKV0hIbCdUwCRozCtyC4ZVw50tU
 JpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=E+ez80GbKSal0gKiUJp3Axd7NuAXUfpuWcv+1pQPff0=;
 b=DRyFL9JJQjOIVcIwySnW8yGXuJcMoqief30uvQJUy6CLH2AwrfEO59yaFHciKJRQnO
 8P1Ns3MrZILt0O2G59HAThasbmAx/BiNEoYt0GX/gD2Jus0Pmztbd+yQ4MvcaJFIxt5k
 huWexmKiVOyzGFbUWU1bF6rskkZeHtBBddDmPQu87UqMh7k7ZtxPIomsKHAFD1Q0miLl
 YOzEzKCHwWKkZIW/+wJAZnnpxMeUVrDurrze+SELBfY+qDKZExniZDfgXILZ6fj0oF9e
 +2T+vmh0wTxy4sc0NXYA2MJ76jJBf85zwbwNP+XZcvxj0xIvapwND0miNJOr4sarhcom
 rkPw==
X-Gm-Message-State: AOAM531GYStox70zrDxwr3xDgLzgn8CNOlaXvl3BRX3EyrUxO0vzCcpr
 t1v0/dw+Or2ad0lOMhWyn46VY8kCvHs=
X-Google-Smtp-Source: ABdhPJx20oTyoJSd2qaQME/6sZWKzF3MYMDwqAX2GQzQmSWx2WG30IjCy0ZwPbEzN66x2H824PuByw==
X-Received: by 2002:a17:906:d97:: with SMTP id
 m23mr24133736eji.392.1622628376536; 
 Wed, 02 Jun 2021 03:06:16 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00?
 ([2a02:908:1252:fb60:cd07:2759:3eec:1d00])
 by smtp.gmail.com with ESMTPSA id v18sm984854edc.76.2021.06.02.03.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 03:06:15 -0700 (PDT)
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
 <bbb990cf-008a-e4d3-93d3-a9adc2f202b7@gmail.com>
 <CAAxE2A5Hrw7oqYKttEYBdd7k6onqZc8ksak5T-Ry1oKJEZtSbw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <60b9d30e-736f-4957-5d78-1ad75b762665@gmail.com>
Date: Wed, 2 Jun 2021 12:06:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAAxE2A5Hrw7oqYKttEYBdd7k6onqZc8ksak5T-Ry1oKJEZtSbw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------6735816253177075B8FCA2D9"
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
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------6735816253177075B8FCA2D9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 02.06.21 um 11:58 schrieb Marek Olšák:
> On Wed, Jun 2, 2021 at 5:44 AM Christian König 
> <ckoenig.leichtzumerken@gmail.com 
> <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
>
>     Am 02.06.21 um 10:57 schrieb Daniel Stone:
>     > Hi Christian,
>     >
>     > On Tue, 1 Jun 2021 at 13:51, Christian König
>     > <ckoenig.leichtzumerken@gmail.com
>     <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
>     >> Am 01.06.21 um 14:30 schrieb Daniel Vetter:
>     >>> If you want to enable this use-case with driver magic and
>     without the
>     >>> compositor being aware of what's going on, the solution is
>     EGLStreams.
>     >>> Not sure we want to go there, but it's definitely a lot more
>     feasible
>     >>> than trying to stuff eglstreams semantics into dma-buf implicit
>     >>> fencing support in a desperate attempt to not change compositors.
>     >> Well not changing compositors is certainly not something I
>     would try
>     >> with this use case.
>     >>
>     >> Not changing compositors is more like ok we have Ubuntu 20.04
>     and need
>     >> to support that we the newest hardware generation.
>     > Serious question, have you talked to Canonical?
>     >
>     > I mean there's a hell of a lot of effort being expended here, but it
>     > seems to all be predicated on the assumption that Ubuntu's LTS
>     > HWE/backport policy is totally immutable, and that we might need to
>     > make the kernel do backflips to work around that. But ... is it? Has
>     > anyone actually asked them how they feel about this?
>
>     This was merely an example. What I wanted to say is that we need to
>     support system already deployed.
>
>     In other words our customers won't accept that they need to
>     replace the
>     compositor just because they switch to a new hardware generation.
>
>     > I mean, my answer to the first email is 'no, absolutely not'
>     from the
>     > technical perspective (the initial proposal totally breaks
>     current and
>     > future userspace), from a design perspective (it breaks a lot of
>     > usecases which aren't single-vendor GPU+display+codec, or aren't
>     just
>     > a simple desktop), and from a sustainability perspective (cutting
>     > Android adrift again isn't acceptable collateral damage to make it
>     > easier to backport things to last year's Ubuntu release).
>     >
>     > But then again, I don't even know what I'm NAKing here ... ? The
>     > original email just lists a proposal to break a ton of things, with
>     > proposed replacements which aren't technically viable, and it's not
>     > clear why? Can we please have some more details and some reasoning
>     > behind them?
>     >
>     > I don't mind that userspace (compositor, protocols, clients like
>     Mesa
>     > as well as codec APIs) need to do a lot of work to support the new
>     > model. I do really care though that the hard-binary-switch model
>     works
>     > fine enough for AMD but totally breaks heterogeneous systems and
>     makes
>     > it impossible for userspace to do the right thing.
>
>     Well how the handling for new Android, distributions etc... is
>     going to
>     look like is a completely different story.
>
>     And I completely agree with both Daniel Vetter and you that we
>     need to
>     keep this in mind when designing the compatibility with older
>     software.
>
>     For Android I'm really not sure what to do. In general Android is
>     already trying to do the right thing by using explicit sync, the
>     problem
>     is that this is build around the idea that this explicit sync is
>     syncfile kernel based.
>
>     Either we need to change Android and come up with something that
>     works
>     with user fences as well or we somehow invent a compatibility
>     layer for
>     syncfile as well.
>
>
> What's the issue with syncfiles that syncobjs don't suffer from?

Syncobjs where designed with future fences in mind. In other words we 
already have the ability to wait for a future submission to appear with 
all the nasty locking implications.

Syncfile on the other hand are just a container for up to N kernel 
fences and since we don't have kernel fences any more that is rather 
tricky to keep working.

Going to look into the uAPI around syncfiles once more and see if we can 
somehow use that for user fences as well.

Christian.

>
> Marek


--------------6735816253177075B8FCA2D9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 02.06.21 um 11:58 schrieb Marek Olšák:<br>
    <blockquote type="cite"
cite="mid:CAAxE2A5Hrw7oqYKttEYBdd7k6onqZc8ksak5T-Ry1oKJEZtSbw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Jun 2, 2021 at 5:44
            AM Christian König &lt;<a
              href="mailto:ckoenig.leichtzumerken@gmail.com"
              moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Am 02.06.21 um 10:57
            schrieb Daniel Stone:<br>
            &gt; Hi Christian,<br>
            &gt;<br>
            &gt; On Tue, 1 Jun 2021 at 13:51, Christian König<br>
            &gt; &lt;<a href="mailto:ckoenig.leichtzumerken@gmail.com"
              target="_blank" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;
            wrote:<br>
            &gt;&gt; Am 01.06.21 um 14:30 schrieb Daniel Vetter:<br>
            &gt;&gt;&gt; If you want to enable this use-case with driver
            magic and without the<br>
            &gt;&gt;&gt; compositor being aware of what's going on, the
            solution is EGLStreams.<br>
            &gt;&gt;&gt; Not sure we want to go there, but it's
            definitely a lot more feasible<br>
            &gt;&gt;&gt; than trying to stuff eglstreams semantics into
            dma-buf implicit<br>
            &gt;&gt;&gt; fencing support in a desperate attempt to not
            change compositors.<br>
            &gt;&gt; Well not changing compositors is certainly not
            something I would try<br>
            &gt;&gt; with this use case.<br>
            &gt;&gt;<br>
            &gt;&gt; Not changing compositors is more like ok we have
            Ubuntu 20.04 and need<br>
            &gt;&gt; to support that we the newest hardware generation.<br>
            &gt; Serious question, have you talked to Canonical?<br>
            &gt;<br>
            &gt; I mean there's a hell of a lot of effort being expended
            here, but it<br>
            &gt; seems to all be predicated on the assumption that
            Ubuntu's LTS<br>
            &gt; HWE/backport policy is totally immutable, and that we
            might need to<br>
            &gt; make the kernel do backflips to work around that. But
            ... is it? Has<br>
            &gt; anyone actually asked them how they feel about this?<br>
            <br>
            This was merely an example. What I wanted to say is that we
            need to <br>
            support system already deployed.<br>
            <br>
            In other words our customers won't accept that they need to
            replace the <br>
            compositor just because they switch to a new hardware
            generation.<br>
            <br>
            &gt; I mean, my answer to the first email is 'no, absolutely
            not' from the<br>
            &gt; technical perspective (the initial proposal totally
            breaks current and<br>
            &gt; future userspace), from a design perspective (it breaks
            a lot of<br>
            &gt; usecases which aren't single-vendor GPU+display+codec,
            or aren't just<br>
            &gt; a simple desktop), and from a sustainability
            perspective (cutting<br>
            &gt; Android adrift again isn't acceptable collateral damage
            to make it<br>
            &gt; easier to backport things to last year's Ubuntu
            release).<br>
            &gt;<br>
            &gt; But then again, I don't even know what I'm NAKing here
            ... ? The<br>
            &gt; original email just lists a proposal to break a ton of
            things, with<br>
            &gt; proposed replacements which aren't technically viable,
            and it's not<br>
            &gt; clear why? Can we please have some more details and
            some reasoning<br>
            &gt; behind them?<br>
            &gt;<br>
            &gt; I don't mind that userspace (compositor, protocols,
            clients like Mesa<br>
            &gt; as well as codec APIs) need to do a lot of work to
            support the new<br>
            &gt; model. I do really care though that the
            hard-binary-switch model works<br>
            &gt; fine enough for AMD but totally breaks heterogeneous
            systems and makes<br>
            &gt; it impossible for userspace to do the right thing.<br>
            <br>
            Well how the handling for new Android, distributions etc...
            is going to <br>
            look like is a completely different story.<br>
            <br>
            And I completely agree with both Daniel Vetter and you that
            we need to <br>
            keep this in mind when designing the compatibility with
            older software.<br>
            <br>
            For Android I'm really not sure what to do. In general
            Android is <br>
            already trying to do the right thing by using explicit sync,
            the problem <br>
            is that this is build around the idea that this explicit
            sync is <br>
            syncfile kernel based.<br>
            <br>
            Either we need to change Android and come up with something
            that works <br>
            with user fences as well or we somehow invent a
            compatibility layer for <br>
            syncfile as well.<br>
          </blockquote>
          <div><br>
          </div>
          What's the issue with syncfiles that syncobjs don't suffer
          from?</div>
      </div>
    </blockquote>
    <br>
    Syncobjs where designed with future fences in mind. In other words
    we already have the ability to wait for a future submission to
    appear with all the nasty locking implications.<br>
    <br>
    Syncfile on the other hand are just a container for up to N kernel
    fences and since we don't have kernel fences any more that is rather
    tricky to keep working.<br>
    <br>
    Going to look into the uAPI around syncfiles once more and see if we
    can somehow use that for user fences as well.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAAxE2A5Hrw7oqYKttEYBdd7k6onqZc8ksak5T-Ry1oKJEZtSbw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote"><br>
        </div>
        <div class="gmail_quote">Marek<br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------6735816253177075B8FCA2D9--
