Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBA87227B2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 15:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C45A10E1CD;
	Mon,  5 Jun 2023 13:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BEA10E1C8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 13:43:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f6ef9a928fso40510705e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 06:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685972626; x=1688564626;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IEUkzEYr7m1pBcx6mXKhs7CosAHDQjirLncYjpN1wkE=;
 b=RM9uVi2gW1UxT4g686y+ZJMLrotEHL9yf1Da+9zBlDeRo07p0jcMiaGzoEQGGg+6yU
 t6fJ1YcziW17bswZ182I/159Ghho+4UJJTbDQF6M/3D+VJSuptBNGfr2PNbt3ayGUnBR
 6CySp/ajmrNSk9YnzlCEAoAhMMd4uURcw/zCjMiXElKtbY3UECsoAi8GHjxfsLDZ2Gkq
 r5M5NJzZd9hg8acTHOz8I5T7L0qRPg2CCbZK0WbAAjo7PhVMRHVSJNZ6USUGHKO0S6oC
 WQiaRD6BFkH8pBHf67N025l0jM3fco5Asyff7iQt/yRJGlxbLZy9iLmW0y7FdfaCWwWs
 jDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685972626; x=1688564626;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IEUkzEYr7m1pBcx6mXKhs7CosAHDQjirLncYjpN1wkE=;
 b=T8quZgZcOzoqsWfiAvC2w8OknyXxAt/p2vrjZ47qMtNoqUweoPbr5F0/TXiiun3ECN
 B1wNZPq9FOUNjsMBTRrg6AWwkgAIj3g9UMObByDZ1Hor44rFA+DTHiKXdLraxm+ePdHO
 hvBeoj6cIS6pzBBL0zfXcNJWjd6t9F/RhvAark7bY1nZkBVbaiKFCYRnbQR9aUM+xZUD
 cndrqHL5mRjCYB6oFpzL9brKPgCxrX1n7eeOFTak6uT6x+bCOKmGPvkp8VJOuLEDcWX0
 1H3QmRjVeUmbiDqkGQucnZ4TXfolPFHEoPw5t1MPimIxOpj2slD4NbIXnSzat0tUjRsd
 faUg==
X-Gm-Message-State: AC+VfDyxX+ewTvmWwEQ0cuY/he0+fT3KRXTkMtscWaNmqn/4cxBnyBEn
 LEnqotbOG+Nhe+PlD79gudCyxQ==
X-Google-Smtp-Source: ACHHUZ7MwuKEpY+D3oOObQG8yj7MvJ7pRg0t86Ir/yJ0Y401yZo85ifA3qoXAXZ7Ns2nkegvxDTN1w==
X-Received: by 2002:a7b:c4d9:0:b0:3f7:34dc:ed0d with SMTP id
 g25-20020a7bc4d9000000b003f734dced0dmr3367502wmk.25.1685972626381; 
 Mon, 05 Jun 2023 06:43:46 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 q13-20020a05600c46cd00b003f1978bbcd6sm24882376wmo.3.2023.06.05.06.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 06:43:44 -0700 (PDT)
Date: Mon, 5 Jun 2023 16:43:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Add some missing error propagation
Message-ID: <b47de249-085d-482a-afb2-eee82a06aba8@kadam.mountain>
References: <20230605131135.396854-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605131135.396854-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 05, 2023 at 02:11:35PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Add some missing error propagation in live_parallel_switch.
> 
> To avoid needlessly burdening the various backport processes, note I am
> not marking it as a fix against any patches and not copying stable since
> it is debug/selftests only code.
> 

This patch is unlikely to make a difference in real life, but I don't
think avoiding Fixes tags and backports is the right thing.

I would add a Fixes tag and not add a stable tag.

The real burden with Fixes tags is if it breaks someone's system.  But
if it's breaking selftests then hopefully those are the people best
able to deal with it.

Fixes tags are different from stable tags.  If the code is very recent
then the fixes tag can automatically allow us to filter out that patch
from going back to stable.  So for new patches Fixes is the opposite of
CC'ing stable.

If the bug is old, then adding a Fixes tag does increase the chance of a
backport though, that's true.

My guess is that if the stable maintainers thought that selftests/ were
causing too much issue with backports they would add a grep line to
their scripts to solve that problem.  Instead we were having the
opposite discussion the other week where the bpf people didn't want to
backport selftest stuff and Greg wanted to.
https://lore.kernel.org/all/2023052647-tacking-wince-85c5@gregkh/

regards,
dan carpenter

