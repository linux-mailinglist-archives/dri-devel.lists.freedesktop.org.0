Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADE63D97FA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 23:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9466E48D;
	Wed, 28 Jul 2021 21:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1456E48D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 21:59:16 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id mt6so7298073pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 14:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ry2so8wkWIDOCG/sQogiwuE+9Zyl4IrepEHbauTvq4U=;
 b=IGRqrDLsPrMGIokLAHHitBXrTGx8ldPYhQZ0vhlO7BwqLTxHuG39KqoD+0xySdQDeZ
 wOes72WlsRRJac/rz2gEpxXYvtLZ6bSaZfmQarX0qm7P2LxswesUfd9AKF5i4JhugBhi
 nx2jk3HjG5WlS1z72s2XLwsxgebFqKKL6xJwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ry2so8wkWIDOCG/sQogiwuE+9Zyl4IrepEHbauTvq4U=;
 b=f+f3a8/KD+RSy0Emx/eRrQ0XTJemjsT2j6D7FC7PfG/tFVoSoDYuQcZHvTe20ilq3o
 /ruZMDNUDupLCggSnANyRL1bL9/FJNqSOmwel/RL13qLCn2EWjDYQZ00GSK7LM3KAo0m
 7JxyEVzQ0UFyGCgfpL2szfP+wMt1cpWTq67nNlpFXJpF5yJWtAbEKuPXNHpvdujxZNOF
 Yx/TQvdKwOmudwuPufwP7aJCF3IjnWSG4yMeRuWHW8lnHnvLtu4M/w0jFxRGXTx1HKfh
 gCKytJ3J4Wq4s4Kelh3+iO87qycYNcNTt7uK5W4QyqM5/yqQxInNTaJF1pXkJ/hKSfG7
 uaJA==
X-Gm-Message-State: AOAM533Qlg9Vem3kyCzWMn2Fo1xyEjL2kraAjTpQyp/yGCpVFKgWAgdh
 rvehRiww7DHBO07Ia1DxD72OQg==
X-Google-Smtp-Source: ABdhPJzgz5HqNdUbzYWG/8osCsOtCEP6ipgHXlpT0b4bkWx62GdyxJFdtfEBDYACX8aQ6iHvHf/hRw==
X-Received: by 2002:a65:498a:: with SMTP id r10mr928037pgs.7.1627509555798;
 Wed, 28 Jul 2021 14:59:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 30sm1011862pgq.31.2021.07.28.14.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 14:59:15 -0700 (PDT)
Date: Wed, 28 Jul 2021 14:59:14 -0700
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 04/64] stddef: Introduce struct_group() helper macro
Message-ID: <202107281456.1A3A5C18@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-5-keescook@chromium.org>
 <41183a98-bdb9-4ad6-7eab-5a7292a6df84@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41183a98-bdb9-4ad6-7eab-5a7292a6df84@rasmusvillemoes.dk>
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
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 12:54:18PM +0200, Rasmus Villemoes wrote:
> On 27/07/2021 22.57, Kees Cook wrote:
> 
> > In order to have a regular programmatic way to describe a struct
> > region that can be used for references and sizing, can be examined for
> > bounds checking, avoids forcing the use of intermediate identifiers,
> > and avoids polluting the global namespace, introduce the struct_group()
> > macro. This macro wraps the member declarations to create an anonymous
> > union of an anonymous struct (no intermediate name) and a named struct
> > (for references and sizing):
> > 
> > 	struct foo {
> > 		int one;
> > 		struct_group(thing,
> > 			int two,
> > 			int three,
> > 		);
> > 		int four;
> > 	};
> 
> That example won't compile, the commas after two and three should be
> semicolons.

Oops, yes, thanks. This is why I shouldn't write code that doesn't first
go through a compiler. ;)

> And your implementation relies on MEMBERS not containing any comma
> tokens, but as
> 
>   int a, b, c, d;
> 
> is a valid way to declare multiple members, consider making MEMBERS
> variadic
> 
> #define struct_group(NAME, MEMBERS...)
> 
> to have it slurp up every subsequent argument and make that work.

Ah! Perfect, thank you. I totally forgot I could do it that way.

> 
> > 
> > Co-developed-by: Keith Packard <keithpac@amazon.com>
> > Signed-off-by: Keith Packard <keithpac@amazon.com>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  include/linux/stddef.h | 34 ++++++++++++++++++++++++++++++++++
> 
> Bikeshedding a bit, but do we need to add 34 lines that need to be
> preprocessed to virtually each and every translation unit [as opposed to
> adding a struct_group.h header]? Oh well, you need it for struct
> skbuff.h, so it would be pulled in by a lot regardless :(

My instinct is to make these kinds of helpers "always available" (like
sizeof_field(), etc), but I have no strong opinion on where it should
live. If the consensus is to move it, I certainly can! :)

-Kees

-- 
Kees Cook
