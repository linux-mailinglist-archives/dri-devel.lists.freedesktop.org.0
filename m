Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A5A3E472D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 16:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D38B89BF8;
	Mon,  9 Aug 2021 14:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2385E89BF8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 14:06:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso14782980wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=lNSeB72xwfEDG7NSCSN7DcWJa7Xwkv52vfkg5maE5iQ=;
 b=OpRfMH6izgVEDg7K2VDH5oaZAsJl/S1Sah7pHgP0QqMr5GYj5pgsGeQ8HjJSp28jaT
 QKKRbUXb6QbfFhJdVKKMZaWQ2Z2jUgVw3f5wv5DQEW+1pBgDJ2ALKUW+Zc1d/qRSQjg/
 kO38gj/jrcNyIzqgQLQuIsKIgc/tUt89Uu5AY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=lNSeB72xwfEDG7NSCSN7DcWJa7Xwkv52vfkg5maE5iQ=;
 b=dtqqkKhP5qhbUFnQB6v/1tJovfFBYef5ko2CP7JX2sgUIUEscz9bxMjhLljeaaZHzc
 LlFiblVkIZzAqAMPWj8zINAhAsTIF4dz8gy1HMsUVKwuUGZBUsWUmmRebdd3OiyW8wO/
 mwTvSh+Xa8M/VyrtutN8+CA8qAzyhJZxfoQq5gCBFvmdvW9+QYncd5K6Vlruwk5EBNZa
 3JGbFnIz7+tGaB0hFOY/kyvd7lcGVI7OPE7sgszgXK4q66xXJcvVrPIb8WBNs3gycTth
 rjCYTXx1HhgCHKkiC4yUPgp9MmczLGEeuGoy3PCfYeV2wBoEha72o5xG+fwCAZIfeKek
 JAlA==
X-Gm-Message-State: AOAM532eGA4Xe1hh5sohMUDsYDjYVzQOrE+u6pJAgkzV9rsKTZXQab5J
 A3dZEl03MDYzv0rRuDkDJRUneA==
X-Google-Smtp-Source: ABdhPJxtN7hvGNB1+/RtoxcA9RAkOM8/syk57Da6EYadLpJdvS+VEMTr6VCyqxOUp3pKgRGhV2cUyw==
X-Received: by 2002:a1c:43c1:: with SMTP id
 q184mr33027913wma.173.1628517961710; 
 Mon, 09 Aug 2021 07:06:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e25sm6423516wra.90.2021.08.09.07.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 07:06:01 -0700 (PDT)
Date: Mon, 9 Aug 2021 16:05:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: DRI <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Matt Roper <matthew.d.roper@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-intel tree
Message-ID: <YRE2RwQ6XlUqbgmn@phenom.ffwll.local>
Mail-Followup-To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Matt Roper <matthew.d.roper@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210715141854.1ad4a956@canb.auug.org.au>
 <162823181614.15830.10618174106053255881@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162823181614.15830.10618174106053255881@jlahtine-mobl.ger.corp.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 06, 2021 at 09:36:56AM +0300, Joonas Lahtinen wrote:
> Hi Matt,
> 
> Always use the dim tooling when applying patches, it will do the right
> thing with regards to adding the S-o-b.

fd.o server rejects any pushes that haven't been done by dim, so how did
this get through? Matt, can you pls figure out and type up the patch to
plug that hole?

Thanks, Daniel

> 
> Regards, Joonas
> 
> Quoting Stephen Rothwell (2021-07-15 07:18:54)
> > Hi all,
> > 
> > Commit
> > 
> >   db47fe727e1f ("drm/i915/step: s/<platform>_revid_tbl/<platform>_revids")
> > 
> > is missing a Signed-off-by from its committer.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
