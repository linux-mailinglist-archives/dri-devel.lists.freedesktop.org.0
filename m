Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201245E67AA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 17:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE1510EC3E;
	Thu, 22 Sep 2022 15:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBE710EC3E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 15:55:21 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id b21so9173786plz.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 08:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=5YOa+gv1sIPcp5S2eMDxZrJPz51jsjFGvspNVL+ych0=;
 b=LEFzWbqksCDh4S4OiJrbR7XAYMyOC2rDNgEzxm4wNn6u+IvIuPSxz7ChVzcXYCA9kN
 JUv48f4jgPup+CHrzZf6w+AfSyBn13B+QQpM2W85KtMMefowgfzF6SEkXu9wDa88gO2B
 nN2k3CYK4Hh5e/4TzZfHnbEaM6zaDEwuByIkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5YOa+gv1sIPcp5S2eMDxZrJPz51jsjFGvspNVL+ych0=;
 b=ZUT9tucwa/iXj8yjd61MtKDykl0WM/X0kPE2Vtc1YoDaC0K4wgrpWH/jpjrUOZCrnb
 cMTfBg8REf2241Gx0FyfR/44ftA/uZzS0DiZTjBhUxQPMt/bhy58uP7E7ydCGN5+9xv0
 6/Aj75V8pwwnAz7p/3XzjBS6l7xMIUXMUnmWm8HGd1A4oZesk/sSByLDrMAKQWxq5pGi
 b9AhldGYZPRp1Cey1Bpeylt85QswARNZqme13fm+3oburu8zpVnKbRR0vyY+qMpYUyhJ
 PDU0QC7Hb1pfX9l7hUo5xIUfDMtJM2UCpPPzklbk4rqQq1bNgUm/qynTqhuyTRxFYwNU
 qJFQ==
X-Gm-Message-State: ACrzQf2Gv1S9WPwf9HfofODJ1I+ES0OQWuNG7nAHgrVvmUVaJxlOhONr
 tohc1wgDlLRQBkL7+NQGMdAeLw==
X-Google-Smtp-Source: AMsMyM6pj2YmcAiXg6SonP+gJGRIk20ZQXjacFA/fb+08tqqdtojyBlUHrRZT8F0Z+9OyQ05xLAwxg==
X-Received: by 2002:a17:90b:3ec9:b0:203:246e:4370 with SMTP id
 rm9-20020a17090b3ec900b00203246e4370mr15665429pjb.221.1663862121161; 
 Thu, 22 Sep 2022 08:55:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a170902650700b001754fa42065sm4270774plk.143.2022.09.22.08.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 08:55:20 -0700 (PDT)
Date: Thu, 22 Sep 2022 08:55:19 -0700
From: Kees Cook <keescook@chromium.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 00/12] slab: Introduce kmalloc_size_roundup()
Message-ID: <202209220845.2F7A050@keescook>
References: <20220922031013.2150682-1-keescook@chromium.org>
 <673e425d-1692-ef47-052b-0ff2de0d9c1d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <673e425d-1692-ef47-052b-0ff2de0d9c1d@amd.com>
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
 David Sterba <dsterba@suse.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Vlastimil Babka <vbabka@suse.cz>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 09:10:56AM +0200, Christian König wrote:
> Am 22.09.22 um 05:10 schrieb Kees Cook:
> > Hi,
> > 
> > This series fixes up the cases where callers of ksize() use it to
> > opportunistically grow their buffer sizes, which can run afoul of the
> > __alloc_size hinting that CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE
> > use to perform dynamic buffer bounds checking.
> 
> Good cleanup, but one question: What other use cases we have for ksize()
> except the opportunistically growth of buffers?

The remaining cases all seem to be using it as a "do we need to resize
yet?" check, where they don't actually track the allocation size
themselves and want to just depend on the slab cache to answer it. This
is most clearly seen in the igp code:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/intel/igb/igb_main.c?h=v6.0-rc6#n1204

My "solution" there kind of side-steps it, and leaves ksize() as-is:
https://lore.kernel.org/linux-hardening/20220922031013.2150682-8-keescook@chromium.org/

The more correct solution would be to add per-v_idx size tracking,
similar to the other changes I sent:
https://lore.kernel.org/linux-hardening/20220922031013.2150682-11-keescook@chromium.org/

I wonder if perhaps I should just migrate some of this code to using
something like struct membuf.

> Off hand I can't see any.
> 
> So when this patch set is about to clean up this use case it should probably
> also take care to remove ksize() or at least limit it so that it won't be
> used for this use case in the future.

Yeah, my goal would be to eliminate ksize(), and it seems possible if
other cases are satisfied with tracking their allocation sizes directly.

-Kees

-- 
Kees Cook
