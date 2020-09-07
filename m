Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BB72606D5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 00:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEE66E0D5;
	Mon,  7 Sep 2020 22:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75706E0D5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 22:16:50 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id h20so10070768ybj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 15:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F2iD1QtHAhHrgcfoDph7b1wzr8tUhCnrmgan+Oj2g9A=;
 b=eVGbu8G1wp1hMe2dgrdG+NI2ykxW27H5o0jRwf8T4vinwNCtglXD5gkA6RqSBTpZdE
 QZKkbQyhATsRC61eEDheRC60xe7SzGg8fOuWkxirEU5fPH+Jpn7N1t/9RK3kaay+i4Ua
 rBIWbGbGw76bS7UVSauI82vZLQElrsB4ILp6OirZxGxcWpg/IlL10qqSqzXsqyLP6oOo
 cdHgC5Gr3A8fJ4izKZ4vmYQl4SkirR7iLJU19iqbx5N/EGuUcw+mKdsx9f1+SIPZdze4
 dzRdxDe6HrG9s01AZZWRsKrywNLJUgx17jF97Vm8pR/AhQQBOu/uJdbn9aTWNo7FeSIR
 rN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F2iD1QtHAhHrgcfoDph7b1wzr8tUhCnrmgan+Oj2g9A=;
 b=RTiG8oI0Upa2csEI5vtcXkFNMnKPGFhrrUod8W3W2Qba4ZRjP/TcZjeLSXuM0/jfd0
 xra1vD37PRlkw3SxSi8reK2W7/ZorV/KxwyYc7uqzA8RTBpafhEaECKwfn1P9jvUL7V8
 smOgKeas7NuuuizO1bBu19AgltS7h2p+ix9xCknWY3P/wqlxQjmhrLPwdSsuwAnrEa58
 wgBczYJZRVacKRlPKvWofPGhdHzNDCCJ1VFUQK3j/PJB5Zyc8F8XsNiuF7yx6w/sChrb
 EhV7WjOeIALqCN7bP5eUySFdJgIdWTNQEeKm/BzGkVebiELuRrf95zrf0i9HuATNnt1f
 1ttw==
X-Gm-Message-State: AOAM531vbPe77qO7b+U+DAfraL+ZjAITGIMl3iJ/T9A9jA9M0NsB6Zbn
 sH53nrfh0kfgcQBpNjWD9NX0CvZfy0U315ST/cI=
X-Google-Smtp-Source: ABdhPJxaiSAYSR3HrT8vaeZ76h+0F17rebZ0yRBVgnp5gPCXs9HZNzj4pAzs25ukFRo5/m4sIcd0xk2OOQPuV3f1qiE=
X-Received: by 2002:a25:3803:: with SMTP id f3mr29651415yba.470.1599517009888; 
 Mon, 07 Sep 2020 15:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200907204630.1406528-1-airlied@gmail.com>
In-Reply-To: <20200907204630.1406528-1-airlied@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 8 Sep 2020 08:16:39 +1000
Message-ID: <CACAvsv7w4fdPic+pqm5gK9j9HzwEy28TfR9cARz74T-gzB1vRA@mail.gmail.com>
Subject: Re: [PATCH 00/13] ttm tt refactor repost of part 1
To: Dave Airlie <airlied@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 sroland@vmware.com, Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Sep 2020 at 06:46, Dave Airlie <airlied@gmail.com> wrote:
>
> Most of these have r-b or acks already, patch 1 I may have
> posted before but found in my tree, so reposting it, and patch
> 5 for radeon I think were what needed re-review.
R-b for ttm and nouveau changes, A-b for the other drivers.

Ben.

>
> I'd like to land these, and I'll revisit the remainder of this
> series.
>
> Dave.
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
