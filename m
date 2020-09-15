Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE291269DD4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 07:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80016E839;
	Tue, 15 Sep 2020 05:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBD06E839
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 05:30:32 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id nw23so3176161ejb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 22:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=f2NTtk0AArHkg9JS1U1Ck0v8Vcc8qCQSbAsipnfcVDI=;
 b=BnQQfRuSifwA+nsMPQD2tTvr747CRExQ8DqE31LLr7PQnng2Hw7C0LmKGo3WSkmBAg
 9o5ks8RXBvUgxSznIpMdw6zUo4Y08rwuwc3XZEza5AWAyOiVAZuUsI9PX45CEJXq56hJ
 mlFNh8lUzxtb5Wfs8eiHcKmR7JlKaxJtcnQPVrqOoOXqfh/pO9Pb2VXQ24gYNhRWTaaL
 UOOsR9elX/WdEswqI6hdsPyYoUM3c3ASC/m1c0RQwMupm1WJ5o7yhGMF9e8aafgQeu1D
 tfxztUccOfzs5uAIv5cqJNfSx/fLsa3IO/8ON8ZwsXuQVAycA3/W1Fl4bmBeu/35dJ50
 hfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=f2NTtk0AArHkg9JS1U1Ck0v8Vcc8qCQSbAsipnfcVDI=;
 b=rlSPS60iRjSjGdp0ANfx77bYZSFbdkAB1sX3rMkcITXmIHkxdljT6VKySHdJg4dqW3
 caILzeRXBgRVNrlGp5JkZ3JPXijgZOuedBuhkTZ7TpdKUbocrpeMhp/XxdpZo5ZM7KZ8
 GPowK4WRUsOgOn1HZKcB+pS/I3H6DzZeq1U9T5wVVnkQV3XLFAXA0uXYSNfgmQ/ye+wU
 +dSywBdPCLTtf1Fs9Y0JNryND5OKqI+U2+rVSv7n13CdpdEdexqnUHsZIRN5HlaqgudW
 EI+n+asiTX7m0j0eOxVfmKHX+pPR/Pntqx3sqcgp9Hket6oFiwYRyyvpEzqGqncI7zPY
 4/oQ==
X-Gm-Message-State: AOAM532Q75UeQSNdEXtQ/HXpxTt0LJSa57PjeBLZVjwspjTLWhr51Bm7
 hxi2M66fZL82tzvx7nd11UamWzLvZhnrcTgVB9I=
X-Google-Smtp-Source: ABdhPJw0mapY+hc0N42nk1rzpo/gyIsAYbmzosGTjMLhp+DrExiJjgWBF8zPFJVs4f7zx0qXaGxQ71yk3JGjqbdaAQM=
X-Received: by 2002:a17:906:f92:: with SMTP id
 q18mr17662068ejj.237.1600147830605; 
 Mon, 14 Sep 2020 22:30:30 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 15 Sep 2020 15:30:19 +1000
Message-ID: <CAPM=9txcrHC77Quj6ufUHn0FD1-7b4YKO2MWFZGwJy8Tmj1i7g@mail.gmail.com>
Subject: some half-baked ttm ideas
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I've been trying to move towards the idea of not having TTM manage the
global TT, I'm still not sure what the result would look like so I've
been randomly trying out a direction or two,

There are some patches in :
https://github.com/airlied/linux/commits/ttm-half-baked-ideas

a) it splits use_tt into two flags, one for system memory backing and
one for binding, and tries to use them correctly.
b) adds cpu_pin/unpin hooks for the amdgpu/radeon drivers to use for userptr.

I sort of envision being able to set the use_tt flag to false for
drivers who don't want TTM to maintain their global TT, but I'm still
not certain how that would look, I'd welcome any input there.

Thanks,
Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
