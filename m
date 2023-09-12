Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF7D79C99C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFA910E3B4;
	Tue, 12 Sep 2023 08:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C22510E3B2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:17:07 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1d549d01c74so1045802fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 01:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1694506626; x=1695111426; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hXU+Az+hQHKnh9VEDVMZv8o4CXQVJXkA/YbFwqve5Z4=;
 b=dUqp74dRSs527urV81LROet1gsn2X8x3Qc+lLuKMjkcXw2K0hkrNCcuc9k2vQ6VSDz
 C9z+GStgztz8yIBYEmn48nSDrLDsyUgNLGNSQPPcFaDGfL+u73pdbr0ReTFT/1hS4OFQ
 7nvhuITOvEQHasczHao+NGtmLtiuOZvzwSRz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694506626; x=1695111426;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hXU+Az+hQHKnh9VEDVMZv8o4CXQVJXkA/YbFwqve5Z4=;
 b=CaRq+kYvY9FzYcsszp5rITRBxYALEfLWp1/eUq3K1E2uSZOaNoVQaCUQQubYXS45ss
 yvvzXxrUhqOR3ZtHxIwTOQAj/1CInuZN1xqesvqMNPelX1cK5MyOq2hIbrrXHve1pfao
 Pmv8GSt1ldDztEsTfgdL+XRQypE7601bCSxIK+MMrxDwRCz9csiRDCrRvrf7He2Qijl2
 a7ykym74Ir+lUXF22+OdaI7xdkhBmAJicCsYDEUB2GdYPQNsaAHTJ+iiXhnF44pNIfya
 +jzJf0DCd3+S4ydwHKNFfpLd5Q0dv2B+JY6r6ZIwO6ShPFY7fk4W8lrzyqcx2/nVe0wS
 Tziw==
X-Gm-Message-State: AOJu0YzLgcSgXRT8ZWOw46tWkTyKCazGR24p9cPbgxmA046EBdjbKGQX
 Ixmgr4jCMfsuxs7mhfPutF762hK403PS9XKEl7UJSA==
X-Google-Smtp-Source: AGHT+IH73ZjXl1JxBUfq9iPq01RsehAlRmnVV7JAFLTQqQFPTFq3qw8XY79jYX2syItET/Es0WqtbTdRyYCVKkdlDk0=
X-Received: by 2002:a05:6871:209:b0:1c8:b870:4e5e with SMTP id
 t9-20020a056871020900b001c8b8704e5emr11309749oad.3.1694506626293; Tue, 12 Sep
 2023 01:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tz=gx2_zrQ2XD8JNwW1dg6b+Byr5FgYAAq+2f29rydcgg@mail.gmail.com>
 <CAHk-=wg7zcmwWwYO=vEVJrTn7fuhpFNmv-6k-MptFYYqFofp4w@mail.gmail.com>
In-Reply-To: <CAHk-=wg7zcmwWwYO=vEVJrTn7fuhpFNmv-6k-MptFYYqFofp4w@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 12 Sep 2023 10:16:54 +0200
Message-ID: <CAKMK7uFZXqykUOAbdu6+vTdm4UukJVKLcNfZFdtxaLUafvoxJw@mail.gmail.com>
Subject: Re: [git pull] drm CI integration
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 10 Sept 2023 at 21:05, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 30 Aug 2023 at 18:00, Dave Airlie <airlied@gmail.com> wrote:
> >
> > This is a PR to add drm-ci support files to the upstream tree.
>
> So I finally had no other pull requests pending, and spent some time
> looking at this, and I see nothing offensive.
>
> I did wonder how this then expands to having more than one subsystem
> using this (and mixing them possibly on the same CI system), but
> that's more about my ignorance about how the gitlab CI works than
> anything else, so that's certainly not a real concern.

I forgot to put this into my write up, but one reason I think gitlab
CI is a notch better than all the others is that it at least tries to
have an answer here:
- each gitlab repo has its own configuration for where to find the CI
files (also out-of-tree if you go really wild for hw testing maybe)
- you can include gitlab CI files

Which together means you can share common stuff like compile testing
or qemu based testing while easily having specific jobs per
driver/subsystem/whatever that do hw testing. So if media also gains
fd.o gitlab support the media stuff could be in drivers/media/ci (and
at that point we probably want scripts/ci for common stuff).

> The other side of that "I do wonder" coin is for when others want to
> use the same tests but using some other CI infrastructure, whether
> it's some AWS or google cloud thing, or github or whatever.

gitlab has a standalone runner, so at least for the sw-only stuff if
you have some other Ci (like distros that want to test everything)
they should be able to reuse the fd.o specific stuff fairly verbatim,
or at least with some minimal adjustements in upstream. So building a
CI-of-CIs should be doable. Worst case one level below reusing the
docker images should be doable in practically anything that can run a
vm.

> Anyway, considering that both of my idle curiosity reactions were
> about "if this is successful", I think me having those questions only
> means that I should pull this, rather than questioning the pull
> itself.
>
> If it works out so well that others want to actually do this and
> integrate our other selftests in similar manners, I think that would
> be lovely.
>
> And if - as you say - this is a failure and the whole thing gets
> deleted a year from now as "this didn't go anywhere", it doesn't look
> like it should cause a ton of problems either.
>
> Anyway, it's in my tree now, let's see where it goes.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
