Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5AC19CBCE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 22:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A586F6E162;
	Thu,  2 Apr 2020 20:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391366E162
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 20:43:38 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id b1so4755637ljp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 13:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b+sg1IKvR7UQ+P+0PCBeB0y4Q0Z6zSnVzKwNNzIYfpI=;
 b=BdX1Y/hZi2MjhDmwunvX3GgwarGy7zBfCrMFBwDkrtrvJ7Dt24JOgvxUi6i0qQnp7t
 paezfz2PsP2dl0MorMvZGKKGypox6m4fxOT6lUKujnk8zz+rs51qD7Va9JFfnTsUPaLr
 m+jfoJ+31JUR6/cYG8huhVA83tz3nLYvzg4RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b+sg1IKvR7UQ+P+0PCBeB0y4Q0Z6zSnVzKwNNzIYfpI=;
 b=UTPriDAmyVP2f4Mg6pb9DfzTeeLsjBuOl3q9tbVpvJcRQtnCA/QveqZtgA0oNFIzIo
 OogI9h+qZgDKWRJCSuK90pTlrq9DbW9cVsHvtcEP9x2m+hkC8eWesalzGmN+Ojh1ZKuM
 J+QbPZ016cG2OjVZu/w+AadYZZ4CBeUAoNT4yYYRyAXrOQL7ufv8J4J3TmUZr4C9GJxb
 YxfKN+ar5Fxz4+92CHtSfFwr7A9utnzXsvLBw8Z42sA6h15Mq4G5CVTix03kPMqnqAIe
 6S3JeRevBKZ/joXh6eJgHZwVcDBCCw1IJ04ntz8+htxe+UkYitV2zt6ioI+C0jRviPPW
 hUUQ==
X-Gm-Message-State: AGi0PuYyhoLhZgFWQms+RGDe0r9iorEiR4tkfO/W2KILtidpY2MuYzOt
 7ldBlg4sUYhGnyD0bCoLcSE7SUEgVrM=
X-Google-Smtp-Source: APiQypKMI7mVoOdeNIelfPhwAzenxX/aH6p08zMT62Wqb+KZSYulVjbvKgu9KWBYvvv2tg7e9SKoDA==
X-Received: by 2002:a2e:8105:: with SMTP id d5mr2996316ljg.196.1585860215764; 
 Thu, 02 Apr 2020 13:43:35 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id q6sm3939980ljp.21.2020.04.02.13.43.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2020 13:43:34 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id c5so3936369lfp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 13:43:34 -0700 (PDT)
X-Received: by 2002:a19:240a:: with SMTP id k10mr3320923lfk.30.1585860213940; 
 Thu, 02 Apr 2020 13:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twza_DeycOEhT+u6Erh0yFTAUe447J6bxWCLq5+QW8ZaA@mail.gmail.com>
 <20200402203317.GA34560@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200402203317.GA34560@ubuntu-m2-xlarge-x86>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 2 Apr 2020 13:43:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjHEOHCf7kAOJOY9bOr9O0CRzxds+8YcXVVGbMZ+7kyXg@mail.gmail.com>
Message-ID: <CAHk-=wjHEOHCf7kAOJOY9bOr9O0CRzxds+8YcXVVGbMZ+7kyXg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.7-rc1
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 2, 2020 at 1:33 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This fixes it but I am not sure if it is proper or not (could be
> problematic if CONFIG_PHYS_ADDR_T_64BIT is set but
> CONFIG_ARCH_DMA_ADDR_T_64BIT is not, not sure if that is possible) so I
> figured I'd report it and let you guys deal with it.

Yeah, no, that patch can't be right.

From your build failure, your configuration has dma_addr_t being a
'long long unsigned int', and map->offset being a resource_size_t is
for just a 'unsigned int'. Casting 'unsigned int *' to 'unsigned long
long *' is not valid.

You'd have to do something like

        dma_addr_t temp;

and pass the address of *that* in, and then assign that to map->offset
(and verify that it fits), I think.

That's kind of what the old code did.

Or alternatively, the 'offset' field should just be of type
'dma_addr_t' instead (see include/drm/drm_legacy.h). But I didn't
check if something else wants it to be a resource_size_t.

                  Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
