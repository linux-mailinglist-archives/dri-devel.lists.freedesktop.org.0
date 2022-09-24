Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D019D5E886B
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 06:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFF110EBC4;
	Sat, 24 Sep 2022 04:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB85310EBC2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 04:57:49 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id u69so1998463pgd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 21:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=v7kWrPbPEQnUozxdNS5JdmbVNWJ4CHYPrZUZ4V2zRBs=;
 b=enyqEF6ygA7V87gDWotsh10kd6fPVz5rTFRXsc8xm7ENhXrESwtah2QDneBSLsG1Ix
 KzZUA+2b81cD+ep20K1LmiSzAQxvp65GCkZaCzRv6RENRU5LRCtVo+aecNTwn/7ZguoZ
 z4ogI8vGaQeq1Bk+y2dUEOMuIwJpIpR7h4BSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=v7kWrPbPEQnUozxdNS5JdmbVNWJ4CHYPrZUZ4V2zRBs=;
 b=CqGFtLWtlj02Y42dDDAjFiClQ0RjRWnpkyiiViIWF5b4FXAnkx1AKaMn6P1wt75+gT
 SFR3k/1nafK679O/khmUlYJBAgDFfcHrb+GVYfjApXYsw/mBr2C1N1iIauJgJiNK/P4y
 mRxqH5Cht3TxiTjX4FFdCQKO9rQt+nivS2mu4+KqqKmtPOc/mFHwa+VAhnj8IKcRFI6p
 qao3qag+foVoMOvn8/0Y7KJ1sraC0gBcvuDxwkj+OzN1UpuieMGEfrKYNleQHb7n4X9E
 /+NimRQMVfC62oqgkb4Lnb14PQeIwTSaoVeJDGAmllAJoaczhvl1l9LEpbhi00d3fzzA
 Bc9Q==
X-Gm-Message-State: ACrzQf0UUNJAZwXIy3Z2NN/Axcoy9YChDXh1MdNUP29nT3tlSXkoGkOr
 0KG03pzFdas9qjrJfOyFHhje3w==
X-Google-Smtp-Source: AMsMyM5ALGEW52BP/WsgdiSVqzxe8HxFAHDE8Rb8WicdYa03ISm4MLjN1PxlV8W1MXz8rEfQ7pygUw==
X-Received: by 2002:a63:1546:0:b0:42c:50dc:2115 with SMTP id
 6-20020a631546000000b0042c50dc2115mr10662678pgv.613.1663995469373; 
 Fri, 23 Sep 2022 21:57:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a62d108000000b0053e984a887csm7497176pfg.96.2022.09.23.21.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 21:57:48 -0700 (PDT)
Date: Fri, 23 Sep 2022 21:57:47 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] drm/i915: Fix CFI violations in gt_sysfs
Message-ID: <202209232143.172BCCDC4@keescook>
References: <20220922195127.2607496-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922195127.2607496-1-nathan@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, llvm@lists.linux.dev,
 Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Sami Tolvanen <samitolvanen@google.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 12:51:27PM -0700, Nathan Chancellor wrote:
> [...]
> To make everything work properly, adjust certain functions to match the
> type of the ->show() and ->store() members in 'struct kobj_attribute'.
> Add a macro to generate functions for that can be called via both
> dev_attr_{show,store}() or kobj_attr_{show,store}() so that they can be
> called through both kobject locations without violating kCFI and adjust
> the attribute groups to account for this.

This was quite a roller coaster! I think the solution looks good, even
if I'm suspicious of the original design that has the same stuff
available twice in different places. (I have a dim memory of rdma
needing a refactoring like this too?)

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
