Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D07B919DC78
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 19:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C906EC2B;
	Fri,  3 Apr 2020 17:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748FE6EC2B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 17:14:55 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q5so6410221lfb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 10:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=grpj0ioyBlxfvZVIhSHFEGbyw0eKO0PYVgnSLJ1Zi5U=;
 b=USJaYqvnjKaYaTBS/r/rCBpDSvrybarlYMXWDZ4smu5ERFEX76FwO8PSUnqIvXBDHe
 fxU4v99KZWfszXYDthM2Yxwm11W54+ODFUUnSQdz/wdNZcFZpMrve1HEMLaUSB3rdylF
 gxpS2dTMAeiwybUkwx/+2QdK0J9IwYNihRNs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=grpj0ioyBlxfvZVIhSHFEGbyw0eKO0PYVgnSLJ1Zi5U=;
 b=CsGNWWslpG0olZZofkazsM17V5GyhHbol3C9mS/vyaxImO5Vp90qwCMsnmHmSxGFtx
 RSOURkT74T/fOKWdeRHVkT7ee9yiluiqNIo+tAMBiCUeDl6CFs7At+5zwaVKgO2SVIYG
 CkgI31QL37hlcFeCQ7KqgoSupxZleUQns7n48t6pbUDWlmrIqXQa1lOMbsYxiethGUNu
 HORtthbBPuoC84TH52hzqDNTci5DN5TNfB3ngbVpkJtIGDkFaHkTGm/gT1c3hvUsIfCY
 NG9iL/ZKpWSUQvQas2/uGuUPBt456bZKhr3D56J8fgI58GBnIe9+O/4jTg+hHBaSCLeI
 U1QA==
X-Gm-Message-State: AGi0Pub6u3nm7eqtJ0vzeT8WZXr9aLxxjzMu5iHzbQ7a2Zg0jPXQKIFA
 EDkHpiPrRPuza8HfIlXZJk9eC+K7duI=
X-Google-Smtp-Source: APiQypKvYDK+76/yiMP2aG3ES4ALlQMu6li/G5cvJLCuDP5wm5h/7C+v6+ZnyUDEy/LwfFY3jdPh2Q==
X-Received: by 2002:ac2:4295:: with SMTP id m21mr6232760lfh.132.1585934092366; 
 Fri, 03 Apr 2020 10:14:52 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id f6sm6406034lfm.40.2020.04.03.10.14.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2020 10:14:51 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id z23so6431363lfh.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 10:14:50 -0700 (PDT)
X-Received: by 2002:a19:7706:: with SMTP id s6mr2379958lfc.31.1585934090257;
 Fri, 03 Apr 2020 10:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200402203317.GA34560@ubuntu-m2-xlarge-x86>
 <20200402215926.30714-1-chris@chris-wilson.co.uk>
 <20200403013420.GA11516@ubuntu-m2-xlarge-x86>
 <CAKMK7uE9pv23edViQBC=Jy5fQV=-NQTNdk1qi91Z8shpeuL7FA@mail.gmail.com>
In-Reply-To: <CAKMK7uE9pv23edViQBC=Jy5fQV=-NQTNdk1qi91Z8shpeuL7FA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 Apr 2020 10:14:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=whMhCTdx0fDRnNT4doKGYw1BBBei0KcXDZcmtVpk_GvEw@mail.gmail.com>
Message-ID: <CAHk-=whMhCTdx0fDRnNT4doKGYw1BBBei0KcXDZcmtVpk_GvEw@mail.gmail.com>
Subject: Re: [PATCH] drm/legacy: Fix type for drm_local_map.offset
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 1:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > Tested-by: Nathan Chancellor <natechancellor@gmail.com> # build
>
> This works too, missed it when replying to Linus
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Linus I guess this one is better, but like I explained it really
> doesn't matter what we do with drm legacy code, it's a horror show
> that should be disabled on all modern distros anyway. We just keep it
> because of "never break old uapi".

Ok, That patch from Chris looks fine to me too.

dma_addr_t and resource_size_t aren't the same, but at least
dma_addr_t should always be the bigger one.

And it does look like nothing else ever takes the address of this
field, so the ones that might want just the resource_size_t part will
at least have enough bits.

So I think Chris' patch is the way to go. I'm assuming I'll get it
through the normal drm tree channels, this doesn't sound _so_ urgent
that I'd need to expedite that patch into my tree and apply it
directly.

Thanks,

               Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
