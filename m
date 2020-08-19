Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF1424A8DF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 00:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F256E853;
	Wed, 19 Aug 2020 22:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E456E853
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 22:07:49 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id m71so25760pfd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 15:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kf0ZzHRJMAbFMLLUKsjOglGhImKY7cyfAyt1lKaRTFE=;
 b=XdSoOU8bhGfMFDMNkNB0PbGSyC9b/j1tzuVKEsB9zu7tjC2Vu7SEGSFi1W1cIQakbE
 o9qXTs96ee/VmG7efkxn8wb4vmhSq0ewikBueR4YGGz4OVA6fjbIeZISd2TXUVABiNcj
 2cRCBsILsz+/mHHhsf+pfXMZJsKWFTExc0Fuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kf0ZzHRJMAbFMLLUKsjOglGhImKY7cyfAyt1lKaRTFE=;
 b=OZP6D42Oeyz8HxWGQ4wPHInyYbrTYLb08Q0yUsDETc9JXDfbCz7NYdIGe+7Nv0URDF
 DYmPfJV6SnAH0QyHBHKbTn/vwRu5XGBCaQ3qTWytYzoK7QWS7HE4qEFgA0zdfTCXvqdS
 avnA0BbQskGfPGFQTl9cajJCEcdnKC5yfU4AnQG+sjpK6CxD8G0CGdmGZeh754CciZtL
 UiwyRPD0lnCYmsWvQO6HlpkNZIMC0eoicJeH/h1DLPKfP3TvvbNlVHVnd84HKySQ36Zq
 8sRQoTUBk1jvoNIXmmCekd9bIQneh7FUKJjLiwT1VJktSO6wTn0yQq2Glf1PSB90v320
 qAHA==
X-Gm-Message-State: AOAM533m7aUafzXANWfFRpZ0eHDonVJayO8CSxgjtIgX9g/Hu/BhfZqE
 my1YqUyrRnnnAoZXV0JpytJ6qQ==
X-Google-Smtp-Source: ABdhPJxLBSOW/rpsj19Cs2xhJm2vDqZ4jNnT0/9og9Y8mFmIcYvE0rLxvkfRoBix9hXJmZPD7SaZlw==
X-Received: by 2002:a62:6d04:: with SMTP id i4mr10910877pfc.188.1597874869067; 
 Wed, 19 Aug 2020 15:07:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q25sm182088pfn.181.2020.08.19.15.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 15:07:48 -0700 (PDT)
Date: Wed, 19 Aug 2020 15:07:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: Re: [PATCH v3] vt: Reject zero-sized screen buffer size.
Message-ID: <202008191452.0278B57D43@keescook>
References: <189fc902-db7c-9886-cc31-c0348435303a@i-love.sakura.ne.jp>
 <20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp>
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jslaby@suse.com>,
 syzbot <syzbot+017265e8553724e514e8@syzkaller.appspotmail.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 12, 2020 at 08:10:12PM +0900, Tetsuo Handa wrote:
> [...]
> @@ -1125,6 +1134,11 @@ int vc_allocate(unsigned int currcons)	/* return 0 on success */
>  	if (!*vc->vc_uni_pagedir_loc)
>  		con_set_default_unimap(vc);
>  
> +	err = -EINVAL;
> +	if (vc->vc_cols > VC_MAXCOL || vc->vc_rows > VC_MAXROW ||
> +	    vc->vc_screenbuf_size > KMALLOC_MAX_SIZE || !vc->vc_screenbuf_size)
> +		goto err_free;
> +	err = -ENOMEM;
>  	vc->vc_screenbuf = kzalloc(vc->vc_screenbuf_size, GFP_KERNEL);
>  	if (!vc->vc_screenbuf)
>  		goto err_free;

I realize this patch already landed, but I wanted to remind folks to
use the check_*_overflow() helpers, which can make a lot of this kind
of stuff easier to deal with.

For example, in this case, I think visual_init() could likely be changed
to return success/failure and do all the sanity checking:

	if (check_shl_overflow(vc->vc_cols, 1, &vc->vc_size_row) ||
	    check_mul_overflow(vc->vc_rows, vc->vc_size_row, &vc->vc_screenbuf_size))
		return -EINVAL;


-- 
Kees Cook
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
