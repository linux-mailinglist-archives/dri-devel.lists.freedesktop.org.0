Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65C45E6EC7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 23:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBA110E483;
	Thu, 22 Sep 2022 21:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B59D10E477
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 21:49:11 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id fv3so11184754pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 14:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=HR7XDnra6aPtamhjv2ZebPHNXJTov7JqNOvsimryjio=;
 b=SzXIxv6C1tCw5E3cmrWDJ/hT6jlBfbW+dFuRj81LBsGuMMA1AsgUJRpxwVsVSvwR2s
 HjojE3kOc43go5tDIXGrMTl5j+2eCPTyOeyLkDKEdQ6zWs58EaHgr7cs3m2ezx/7gyPH
 QYSAs2hvSa7UX6V/rYFn8OuKvubD7Tx83ZZcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=HR7XDnra6aPtamhjv2ZebPHNXJTov7JqNOvsimryjio=;
 b=kP2UKmUkm4L5r5sk41DO+3ANjo1kC1V2OJ+iH5SkJmXb6Zs8tf660UJSrUtelC3FkR
 Kn1l8qXzUJYxMadMm6C+FoP5tw2Cl7rBqSYWd9MOu11SxcY0e6z4rmEcb7kA30ppQAWL
 APShMh3TAqJ3kGQ0qrnmVpDeXSQAXyJj34NIzApSfpahMyQcK9qjx7TddOGhgRZYKyEn
 ZwyHFjyAi45rQ1q92O8DQF+9KHz+RTCo7fLnAd/eZN52/k9sUd5wreXGTUIrn7FpxFrn
 kBFi1lpdCOo5oQqBKAn3+ooQC4hoRklpOSUlynVKYLmD+QPpQppYeoygTmyMNZXrDqsW
 EJfw==
X-Gm-Message-State: ACrzQf0dTcRs8+EXLgcgcbDWaqhgq2AJN1hfNlr+IWgjboprpsRJ5RDs
 QEU1VeufpfN6Dd/aP/7omNqCHQ==
X-Google-Smtp-Source: AMsMyM7EVCvewBY8ReI9lCX0qEaIkOeoxfNJfZf95NgQUB74fHJwtUZioqBUOFwe31SWjNTGJEPjqg==
X-Received: by 2002:a17:902:d2d2:b0:177:4940:cc0f with SMTP id
 n18-20020a170902d2d200b001774940cc0fmr5257349plc.4.1663883350927; 
 Thu, 22 Sep 2022 14:49:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a170902da8600b00176acc23a73sm4597636plx.281.2022.09.22.14.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 14:49:10 -0700 (PDT)
Date: Thu, 22 Sep 2022 14:49:08 -0700
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 00/12] slab: Introduce kmalloc_size_roundup()
Message-ID: <202209221446.5E90AEED@keescook>
References: <20220922031013.2150682-1-keescook@chromium.org>
 <673e425d-1692-ef47-052b-0ff2de0d9c1d@amd.com>
 <202209220845.2F7A050@keescook>
 <cb38655c-2107-bda6-2fa8-f5e1e97eab14@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb38655c-2107-bda6-2fa8-f5e1e97eab14@suse.cz>
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
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Jakub Kicinski <kuba@kernel.org>,
 David Sterba <dsterba@suse.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 11:05:47PM +0200, Vlastimil Babka wrote:
> On 9/22/22 17:55, Kees Cook wrote:
> > On Thu, Sep 22, 2022 at 09:10:56AM +0200, Christian König wrote:
> > [...]
> > > So when this patch set is about to clean up this use case it should probably
> > > also take care to remove ksize() or at least limit it so that it won't be
> > > used for this use case in the future.
> > 
> > Yeah, my goal would be to eliminate ksize(), and it seems possible if
> > other cases are satisfied with tracking their allocation sizes directly.
> 
> I think we could leave ksize() to determine the size without a need for
> external tracking, but from now on forbid callers from using that hint to
> overflow the allocation size they actually requested? Once we remove the
> kasan/kfence hooks in ksize() that make the current kinds of usage possible,
> we should be able to catch any offenders of the new semantics that would appear?

That's correct. I spent the morning working my way through the rest of
the ksize() users I didn't clean up yesterday, and in several places I
just swapped in __ksize(). But that wouldn't even be needed if we just
removed the kasan unpoisoning from ksize(), etc.

I am tempted to leave it __ksize(), though, just to reinforce that it's
not supposed to be used "normally". What do you think?

-- 
Kees Cook
