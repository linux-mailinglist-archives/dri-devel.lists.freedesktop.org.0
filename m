Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D3D5E5AA3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 07:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61B610E463;
	Thu, 22 Sep 2022 05:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B41710E463
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 05:26:29 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id a80so8191194pfa.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 22:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=1AAj0jz/3WOf/ZinmBg4e5WZyKIExnDIP+4ApRXDWXk=;
 b=E6vw8sjIHY/i68R43dGnMLa/5LLUaNZd7XsoFQWcc3w5wUJdtXNsxsEfsPht7kxdNG
 JJ1tXBTf3XQqnlgOex/RZ+o0XMhSMgfcjsVoIr6koV6H3KyiaZ1lUXPNyODzP4yferwZ
 bLRSqfuB8yrx2QNr5YGtL8EgG0hPZHJq7V7xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=1AAj0jz/3WOf/ZinmBg4e5WZyKIExnDIP+4ApRXDWXk=;
 b=vxmnug+JcritYUslOiMmPZlaqaHWusYb9vIddOnK5Nvaorh6zcAp3oU6ItvG40aw57
 ky2yFDJqjnkXAIHlPYcI8q7PHMgH4L9pXnXlmeb5YUcdfVnklgN8ZvHSI3Ur4QK5lyDO
 99hWGhYoBPp1Au5Knh83+KhYKcSIzC60QHKtv+/mN1b4Z2bUTKCD5SD7+MaRdfm1kW0o
 xiRK581MHccclHCySnNvpQoBSJe1MnhTXIDNj4pEhvyUJI3R2o03Djf8PO/GPxC6ygwN
 oRzmqbJ4cvG4poSO9x8C9QMcFtGp1TaJNfhHW2fiZZ2VqJ5pqPADETQwSTKmojej5vo0
 P9OA==
X-Gm-Message-State: ACrzQf2SqwsCOS/zazyYsDqQ4L3ql7OjWxaNsbzk6L3KEaFLTrqGT/Rd
 FPfFUU+I5r8FMbvIclf66rB/UQ==
X-Google-Smtp-Source: AMsMyM4a+GHcnQt0UeqKstHRefYZ2pfi5aegxBG+GRLeLtm77LwF22DDWI605QZJjTDKHxZFsdcd6w==
X-Received: by 2002:a63:cf56:0:b0:439:41ed:78fc with SMTP id
 b22-20020a63cf56000000b0043941ed78fcmr1597609pgj.419.1663824388949; 
 Wed, 21 Sep 2022 22:26:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a170903120a00b0016f196209c9sm3102876plh.123.2022.09.21.22.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 22:26:28 -0700 (PDT)
Date: Wed, 21 Sep 2022 22:26:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH 10/12] iwlwifi: Track scan_cmd allocation size explicitly
Message-ID: <202209212224.A2F1DB798@keescook>
References: <20220922031013.2150682-1-keescook@chromium.org>
 <20220922031013.2150682-11-keescook@chromium.org>
 <87fsgk6nys.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsgk6nys.fsf@kernel.org>
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
Cc: linux-wireless@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Gregory Greenman <gregory.greenman@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jacob Shin <jacob.shin@amd.com>, Marco Elver <elver@google.com>,
 Johannes Berg <johannes.berg@intel.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Yonghong Song <yhs@fb.com>,
 David Sterba <dsterba@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 07:18:51AM +0300, Kalle Valo wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > In preparation for reducing the use of ksize(), explicitly track the
> > size of scan_cmd allocations. This also allows for noticing if the scan
> > size changes unexpectedly. Note that using ksize() was already incorrect
> > here, in the sense that ksize() would not match the actual allocation
> > size, which would trigger future run-time allocation bounds checking.
> > (In other words, memset() may know how large scan_cmd was allocated for,
> > but ksize() will return the upper bounds of the actually allocated memory,
> > causing a run-time warning about an overflow.)
> >
> > Cc: Gregory Greenman <gregory.greenman@intel.com>
> > Cc: Kalle Valo <kvalo@kernel.org>
> > Cc: Johannes Berg <johannes.berg@intel.com>
> > Cc: linux-wireless@vger.kernel.org
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Via which tree is this iwlwifi patch going? Normally via wireless-next
> or something else?

This doesn't depend on the kmalloc_size_roundup() helper at all, so I
would be happy for it to go via wireless-next if the patch seems
reasonable.

-- 
Kees Cook
