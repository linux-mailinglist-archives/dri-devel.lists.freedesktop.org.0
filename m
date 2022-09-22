Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F405E67BC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 17:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D6610EC53;
	Thu, 22 Sep 2022 15:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D1710EC45
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 15:56:38 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d11so1768444pll.8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 08:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=TZpRIJCCMZKyVUgNnwboEjnHYpEIRQBSXZlSwc7OZ+0=;
 b=lKwDDBjvYm/0Jleq+GCxBaTtwnHH7tK+nJ5dJ9Mroo7Wx2WiOGB/Kmka/kC9bYFq8z
 aE3zrV852KZPixgDhOan1L1Vq5Tj1ydcVjIMjp+7gLHmlIsooLMnRpZ01jzKR4yf16m5
 6AQEJMsyFTKj/8+82bO+4x4lXyaSTMa1R26kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=TZpRIJCCMZKyVUgNnwboEjnHYpEIRQBSXZlSwc7OZ+0=;
 b=YfanI/Ltm19mtVSMOUo+CjVtTjm/hh1UUbhCwAXf3R7ecdZmtXDCdr6JVH3bMD8ca/
 RtssAMzSQ0SuLFYdW1/KPLoFh44gY+rDVxSuPlj5ttfUaAfzpp5nZASZ7eVIqVwuCTjk
 8biLVPHnCXIJcK7o6Lpv4ddOjmZ7qzUM3FZY1EzNw7g0TADpi7yb1k12PuXmfVV7dNcP
 +Ul+Eefd9kgQm7sUBO0yhLh6QqRCCvhWV6zcj9m03ncHWq7WzyfYR/zanc7wh+wz76cj
 xRDdb91a5o+Dr263ZxKuFxPqt1HBjs3ANpKRlm086nrmEspPiX43bCsz34PFQIivxfoA
 DPZw==
X-Gm-Message-State: ACrzQf3fFmtK/4dyQVLA2fv+6/vZv0HudmE7Wb83A6+g79zjUniHAPIw
 QLw5kHBexQcKWMU6ufroKghT8g==
X-Google-Smtp-Source: AMsMyM6wj70ZRZNEGtsTQjOpU6Y4OkbiX+0Wag8Z4tUWxe6CdbDk3WijTof+igifPO84VXufZHizeQ==
X-Received: by 2002:a17:90b:4d8e:b0:200:73b4:4da2 with SMTP id
 oj14-20020a17090b4d8e00b0020073b44da2mr16393990pjb.197.1663862197527; 
 Thu, 22 Sep 2022 08:56:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a170902d50500b00176ca533ea0sm4327600plg.90.2022.09.22.08.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 08:56:36 -0700 (PDT)
Date: Thu, 22 Sep 2022 08:56:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH 11/12] slab: Remove __malloc attribute from realloc
 functions
Message-ID: <202209220855.B8DA16E@keescook>
References: <20220922031013.2150682-1-keescook@chromium.org>
 <20220922031013.2150682-12-keescook@chromium.org>
 <CANiq72=m9VngFH9jE3s0RV7MpjX0a=ekJN4pZwcDksBkSRR_1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=m9VngFH9jE3s0RV7MpjX0a=ekJN4pZwcDksBkSRR_1w@mail.gmail.com>
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
Cc: Feng Tang <feng.tang@intel.com>, linux-wireless@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Jakub Kicinski <kuba@kernel.org>,
 David Sterba <dsterba@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Hao Luo <haoluo@google.com>,
 Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 11:23:46AM +0200, Miguel Ojeda wrote:
> On Thu, Sep 22, 2022 at 5:10 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > -#ifdef __alloc_size__
> > -# define __alloc_size(x, ...)  __alloc_size__(x, ## __VA_ARGS__) __malloc
> > -#else
> > -# define __alloc_size(x, ...)  __malloc
> > -#endif
> > +#define __alloc_size(x, ...)   __alloc_size__(x, ## __VA_ARGS__) __malloc
> > +#define __realloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__)
> 
> These look unconditional now, so we could move it to
> `compiler_attributes.h` in a later patch (or an independent series).

I wasn't sure if this "composite macro" was sane there, especially since
it would be using __malloc before it was defined, etc. Would you prefer
I move it?

-- 
Kees Cook
