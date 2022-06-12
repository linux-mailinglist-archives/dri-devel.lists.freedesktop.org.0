Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CE2547CE3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 01:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D6B10E062;
	Sun, 12 Jun 2022 23:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B63A10E062
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 23:00:12 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id x4so4273403pfj.10
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 16:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=BhZn/YLFjWinGYE1K2OdXmxZD2HyQtebUnbRlvHaipU=;
 b=XQOLh4+5+zhk/9/MVE0hLR0CVKMMlJnhmGFB4iF9a7Ts+6PJ1RuGMXMh3quuBWdtTA
 /kfkAIu/0FNCipUjpi/sBkdUbbMGF68n/2NvBiyEfkRgfH3xKgMm2JkTrg5G9z6dWjec
 sQQ8yQ7EjzRdLeMsrSGINKasA2RSjC4mf/ZmPwA5n1w10+R44nmkZgRI9iZh0vf/UX+u
 B1BTPD+9Dfj1pqeKt8pO6dI+BJeRBynD/9Luk5WqGxOYMHNAoNX8f1q+N6zdq5AXHitN
 BRgeB6blgia/AqqKqGbAsKXG1XOqA1/bVL1RQZaLaEJaBrtKCPVkJCS3voZlu6umMWrx
 31HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=BhZn/YLFjWinGYE1K2OdXmxZD2HyQtebUnbRlvHaipU=;
 b=24O5CgoQZYm0TN9vKCVTswdnw/1XttcMXYyHmHxEVKb5KdujRru3xuGDbYt50YKK3a
 G69hvzXFpZxe9FU1nYlA64crsWh0yN5qQFa+laNxX5/G7KKeOfbJNSYG9PCYNTsfI3Wr
 XCglqleplw0AwO/S7bzM26oBiGzeMSRE4D+dejvphI1/b0gzhJv5jRc3iawcCArl8drV
 o7BfPW5n7l0A+WEslKEys5ulJtsAC3Oki1sOtVGhjUR/Q7DBi90IuTVz+gw/vscND/Td
 /1Hp75DLDlPbV9pJpi4D8/5lTpl+cCw+LLpsUI1DYu6SLptWe96XjXAzos01I25APr4Y
 nAuQ==
X-Gm-Message-State: AOAM532yXltW2YOTrkozCPrRnSY4NAn/e+3ASXhs4oDhHIvAL/uJ3YER
 bHXVMKxwXcZGknTKEca4V/NqkA==
X-Google-Smtp-Source: ABdhPJzpinCR6bQlEKm2X/IvwQ/rLqYYh2mcFdKHwTBVhXMpZRq60C9GAK/pHt07LiGbo9ydZ5OG5Q==
X-Received: by 2002:a63:210e:0:b0:3fd:9c07:7670 with SMTP id
 h14-20020a63210e000000b003fd9c077670mr34791757pgh.222.1655074812274; 
 Sun, 12 Jun 2022 16:00:12 -0700 (PDT)
Received: from [2620:15c:29:204:c274:b6da:d4b1:cf53]
 ([2620:15c:29:204:c274:b6da:d4b1:cf53])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a170902821500b001641244d051sm3531337pln.257.2022.06.12.16.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 16:00:11 -0700 (PDT)
Date: Sun, 12 Jun 2022 16:00:11 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/3] mm/slab: delete cache_alloc_debugcheck_before()
In-Reply-To: <20220605152539.3196045-2-daniel.vetter@ffwll.ch>
Message-ID: <79fc4112-bc2f-c5f5-2e4-975324b69316@google.com>
References: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
 <20220605152539.3196045-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>, Christoph Lameter <cl@linux.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 5 Jun 2022, Daniel Vetter wrote:

> It only does a might_sleep_if(GFP_RECLAIM) check, which is already
> covered by the might_alloc() in slab_pre_alloc_hook(). And all callers
> of cache_alloc_debugcheck_before() call that beforehand already.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: linux-mm@kvack.org

Acked-by: David Rientjes <rientjes@google.com>
