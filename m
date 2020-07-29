Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5DF2319E5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 08:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D323F6E453;
	Wed, 29 Jul 2020 06:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE176E43B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 05:30:30 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id a34so6866622ybj.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 22:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=draconx-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UM1kYq2irrlxJjqvtpleLv5gWB5MEHXw+xU5EXyDcho=;
 b=QvVLsteWDq/bcm+aRVZrp/HPm2+8TlviBBzn6js/05c2LZtlpQY6PLc+RJsT5rZKVn
 br8+9hTY1iPjSfIxTOcFqM3hI+P8M7fj5DI2TcWFyLNKgg1qjMrOcRtGniotCx9fkMBH
 Xxv3jbqH3sWQyQJMg7CF/5r7drllem0TgmScyMT/wXga0hbFyz+WgBccO4y6tKpHdcrA
 uYtloxYQ87vghbl6aNBy9c++bLAFSp3F4HSke18EMJWRCrmS0oy8V2NJvxtQRHYOmzpA
 XaxNUbAQ8rSybLoBSXIRl8fzfVBTdCxRyBsPeMBi1aPaFIoNafR2c87VntjdovyUcCSI
 096A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UM1kYq2irrlxJjqvtpleLv5gWB5MEHXw+xU5EXyDcho=;
 b=mdQ07VDhlsLPGbQejZnafcP8L5pprjnU4RnZNGUWfr6lf3BmV7NZuzx1ztiiYUBcWC
 SsmsuKMivYwipVfpVtiReyO7DimGB4WJApHyvdAqT4JA90cz4kuSDrOq2eO3xw6NZvP8
 HiBg51q+BR603M5SqQiEGEzyrR3lboDQCR6kPvCZ9TvHQ09ggp2k+jn3fMuXHkBeQNJ9
 2WZvx+M9uQtMsm7pWxOhRAjwAkN5oX7gWUTj61j89iJ6Z2IXTUHyOXyz2DJ9Mf/+IBwI
 XzSaRgZ60CIP8vwI0GUk0pyTc+NU5JHyU+Yy4KkZxIk4IA54kEL1U9U98qUo1gufwjuo
 msIQ==
X-Gm-Message-State: AOAM532PTmGkJo8shmFTkmtTsNNMchhM6VBbGdsN0/dlmyF33MRgjZpj
 U9HSi6keUl4CsMZ+XLTU8wNqX9Z3I+Wt+wHC1JH73Q==
X-Google-Smtp-Source: ABdhPJwMiRPJlZu73WFTEwZfU6Zfx1DgVK1nD4W414uJDel/riVrRnXW3vqpYLIafNu8UZ2e5C71fPmg+j6u4sm1YfU=
X-Received: by 2002:a25:3411:: with SMTP id b17mr7330506yba.279.1596000629113; 
 Tue, 28 Jul 2020 22:30:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:9b83:0:0:0:0:0 with HTTP; Tue, 28 Jul 2020 22:30:28
 -0700 (PDT)
X-Originating-IP: [24.53.240.163]
In-Reply-To: <CAPM=9twPbHvuu7fOXr+nSuB5GRy1PgY1PR6h5HDvzgUo=bobQQ@mail.gmail.com>
References: <20200729050403.jwbgdmvmc3ajdnem@atlas.draconx.ca>
 <CAPM=9twPbHvuu7fOXr+nSuB5GRy1PgY1PR6h5HDvzgUo=bobQQ@mail.gmail.com>
From: Nick Bowler <nbowler@draconx.ca>
Date: Wed, 29 Jul 2020 01:30:28 -0400
Message-ID: <CADyTPEytPcj6C6uDuHKAiKsWTLFYMuZvnYZoYQvdoggu7N+MQQ@mail.gmail.com>
Subject: Re: PROBLEM: 5.8-rc7 no video output with nouveau on NV36 (regression)
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Approved-At: Wed, 29 Jul 2020 06:58:35 +0000
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
Cc: James Jones <jajones@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-07-29, Dave Airlie <airlied@gmail.com> wrote:
> On Wed, 29 Jul 2020 at 15:05, Nick Bowler <nbowler@draconx.ca> wrote:
>>
>> Hi,
>>
>> After installing Linux 5.8-rc7 I seem to get no video output on my
>> NV36 card once the nouveau module is loaded.  The display (connected
>> to the digital output) simply reports "No Signal".
>>
>> I bisected to the following commit, and reverting this commit on
>> top of 5.8-rc7 appears to correct the issue.
>
> Can you test the drm fixes pull I just sent to Linus
>
> https://patchwork.freedesktop.org/patch/381225/

Yes, pulling this seems to fix things.

Thanks,
  Nick
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
