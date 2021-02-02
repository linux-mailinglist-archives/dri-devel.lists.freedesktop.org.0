Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8D130C7F9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 18:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDB26E1F3;
	Tue,  2 Feb 2021 17:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE096E21B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 17:38:51 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id i12so8606774vsq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 09:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eHAW1mrB7zvHhh97f0tcropb/e113NgWFEAjP6gLbCQ=;
 b=P5+gYqPz5l2mFlVKQREHmz6Kr0fA/RiH9maBRKb+UIPpLrmJCqO0uZtlprkvOcVC7R
 zfLNlUQD86NkP+ifjcEWmIBbuauC+qpY41TpCmhwHtmog0l7nn9JmHrn+u+THmtLIdRH
 0KnCTzdZzCy8vq0biUzKHV1wh4EBiZ9oAhpnAVrPJLt++k/V0XTB8bMDbd3Qdhisf4xn
 zldT4XKEDyVCBwD/nZj1eNAdMGt3Bg7tXjS8x0Jxcv2kvkr0eEq97P/HBzukApwh349g
 hMt5JK//cZJtHt8GTmxsjoMa4oHwEaTmQsEBjy8RLtIA7UYf87pdqgL7wYkBBpfw2voR
 5vXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eHAW1mrB7zvHhh97f0tcropb/e113NgWFEAjP6gLbCQ=;
 b=i42YdWDtetL9Cnzpz4pNGc9sYFlwXXu8O/wTKK3XNbtY0SAHOCnDzgdjchQ8pT4aU3
 Fc3wywuhz70B3v+StQ5nhtbkjVo4hOtjt4NfT6cKxIXMjCey1o1luQItvmJ8gZeWqDGJ
 cwneBD+fGBZAOhbKAW/Z/sZkJ7OD0B/WxbOZrr7qu+6hW0gdws0ZRdO+qTdreibzDv0d
 DyRH0obRch6NTzXCTBw12CoH/fX3bO44ViUSWBHiS7QvcIPeYCXeWVzfEwnGukit3pHH
 wxu5WRrGwu++sTJ+sVgJGrhEq/cS9GcCUFqOQVeMFZ3AF05Sgh5ivsP7JsmFIFskd7VQ
 f/Uw==
X-Gm-Message-State: AOAM531CiJyNqURfTWpUS0ryI4H+t+YpRw6kykrUDoCpPMbfZnTzcqrI
 NeoelyYfANP2G5deOXuQwos1aO4t2Kct7u9Xg4k=
X-Google-Smtp-Source: ABdhPJxr6UuPLfiTQWU0PtI4KjGAd7lT5wP47Eg2A5ysqKhDWcwimMgCtP8JDHk8rXFO/C2SX4AsHulH76L2ZXyS3BI=
X-Received: by 2002:a05:6102:96:: with SMTP id
 t22mr13599418vsp.22.1612287530852; 
 Tue, 02 Feb 2021 09:38:50 -0800 (PST)
MIME-Version: 1.0
References: <20210202121334.1361503-1-hch@lst.de> <YBljkDgMFcqKcH8H@gunter>
In-Reply-To: <YBljkDgMFcqKcH8H@gunter>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Feb 2021 17:38:39 +0000
Message-ID: <CACvgo50f0d9fYZ+n4nSBOCgaGpe=x6_tfXPPGB2FiDVwGgaAJA@mail.gmail.com>
Subject: Re: module loader dead code removal and cleanups v3
To: Jessica Yu <jeyu@kernel.org>
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, live-patching@vger.kernel.org,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jessica,

On Tue, 2 Feb 2021 at 14:37, Jessica Yu <jeyu@kernel.org> wrote:
>
> +++ Christoph Hellwig [02/02/21 13:13 +0100]:
> >Hi all,
> >
> >this series removes support for long term unused export types and
> >cleans up various loose ends in the module loader.
> >
> >Changes since v2:
> > - clean up klp_find_object_symbol a bit
> > - remove the now unused module_assert_mutex helper
> >
> >Changes since v1:
> > - move struct symsearch to module.c
> > - rework drm to not call find_module at all
> > - allow RCU-sched locking for find_module
> > - keep find_module as a public API instead of module_loaded
> > - update a few comments and commit logs
>
> Thanks Christoph for cleaning up all that aged cruft, and thanks everyone
> for the reviews.
>
> I was curious about EXPORT_SYMBOL_GPL_FUTURE and EXPORT_UNUSED_SYMBOL
> variants, and found that most of that stuff was introduced between
> 2006 - 2008. All the of the unused symbols were removed and gpl future
> symbols were converted to gpl quite a long time ago, and I don't
> believe these export types have been used ever since. So I
> think it's safe to retire those export types now.
>
I believe you're spot on - based on reading through git log and
checking the ML archives.

Shame I didn't get to finish a similar series I had locally. Patches
11-13 match what I have here so:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

HTH
-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
