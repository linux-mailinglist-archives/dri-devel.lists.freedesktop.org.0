Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DD39936A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 21:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7026EE35;
	Wed,  2 Jun 2021 19:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236C66EE1B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 19:20:32 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q5so3411860wrm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 12:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=H7wvn8P3RiL4d2oA5tB0Q0JzGFE6JYi3t+j4USI3KUs=;
 b=Mn8DlgT/40U/oqKOoH10bHBPd+zRCOucUAGE4VtuclCVfHaBZU0LBjn3aRCOdLSanL
 v9vHsemJRIGOvvaX0tK/0+lM4sseaMi2pv6syFYyk4Yl4a+SM0ps9DTy+8lJGSyLHZpl
 JJ3bsZsebTb265SzMhJdt9kFjSclUcEv+4lSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=H7wvn8P3RiL4d2oA5tB0Q0JzGFE6JYi3t+j4USI3KUs=;
 b=Zxp7PFkBbM9pF45NN1Ot2cMPO0byciBeT1ZJpWlk6tVNvHRINYyFs6R8bbn3f233an
 lU0VYggT5qyN1iAaqAhS2DB331GSPbItU1JwF1vNNhKEoUqSnwVaQQDA+frcdwSbErlK
 Sj0AaiJ+h6AY9KZQNFOQ5a4JARtBj6UdsmoUJB5wryejAYb/d3XtnC5qisSlQYeR1qDZ
 EgwXQCYyx4CKYMPmJVCnZW6cb+Zlfn/NK6JiTIVaEglhM21HA3f6V8e+BHM4GCA6aT3A
 Lv1lZjxc9sjoXfEUt/ltFZ0mmVyB3zH2i7ZqROb3oWYr9xraiOfxYp5nIHqLaSbtaupa
 4h2Q==
X-Gm-Message-State: AOAM530ByoBOMu8us9g02EB9raNeUHUaaeFsKGy19nY/Wyawk4iZMPP8
 iPEZpkpsmO6noznz+VwIHsZV4w==
X-Google-Smtp-Source: ABdhPJzNHtDJDlUxBl4h2cbsGjZvvHKaFdJVTASeecRN9w4y1ccniVeQQXBRpE5SMxyM/R2RHZBCpw==
X-Received: by 2002:a5d:6b09:: with SMTP id v9mr34917898wrw.297.1622661630838; 
 Wed, 02 Jun 2021 12:20:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q3sm886405wrz.71.2021.06.02.12.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 12:20:30 -0700 (PDT)
Date: Wed, 2 Jun 2021 21:20:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: Linux Graphics Next: Userspace submission update
Message-ID: <YLfZ/DAanQoP2T+q@phenom.ffwll.local>
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <bfb76361-c06e-71c5-6c6e-4d65373e58a1@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bfb76361-c06e-71c5-6c6e-4d65373e58a1@daenzer.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 10:09:01AM +0200, Michel Dänzer wrote:
> On 2021-06-01 12:49 p.m., Michel Dänzer wrote:
> > On 2021-06-01 12:21 p.m., Christian König wrote:
> > 
> >> Another question is if that is sufficient as security for the display server or if we need further handling down the road? I mean essentially we are moving the reliability problem into the display server.
> > 
> > Good question. This should generally protect the display server from freezing due to client fences never signalling, but there might still be corner cases.
> 
> E.g. a client might be able to sneak in a fence between when the
> compositor checks fences and when it submits its drawing to the kernel.

This is why implicit sync should be handled with explicit IPC. You pick
the fence up once, and then you need to tell your GL stack to _not_ do
implicit sync. Would need a new extension. vk afaiui does this
automatically already.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
