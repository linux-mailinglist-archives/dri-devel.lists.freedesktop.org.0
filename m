Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AF8547DEB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 05:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C834310E083;
	Mon, 13 Jun 2022 03:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2862C10E083
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 03:21:40 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 o33-20020a17090a0a2400b001ea806e48c6so4735319pjo.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 20:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qbAkkO2zSW3z0Q8/BVx6T9JB6N1UA+DX5z/rLPoFpPg=;
 b=1NGXFsXFPUAUMfe9N4JthX1ALkYAWYMsOuYDyQtcQeW8WNFwZlcHItd6XrM+lng3UI
 Rt8zNF+zxAVQWenqcclBqxhu/Xxcn8j6sBXL0Vs/E0KHyZDDP8ejdsufZhWWAEQx8IUF
 aPs9uCjcBNIjeaM3oRwnjC7VxRpdjBRyJDmBA3koSCVptEqjkDJAp/clVapRzZK7ivQt
 vvIiT7jbLJuwAp1rHkKsK8q/MFc8GsBuxLrD/3Rh6x7b8DZ/wsoFLkc7jS2kZdxRtLkQ
 JbuYUgDS79x7n4D6hVdrAFjYjrBaho7I6QHY9iGc3X+OP24M9FH+2CgJEl9gSFtl/hNL
 54jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qbAkkO2zSW3z0Q8/BVx6T9JB6N1UA+DX5z/rLPoFpPg=;
 b=rmPxxxjALnWR2BvQX9M+AWMdr8b/yAK0qHafN8XEAgFFudFffuuAhzKbYnstLGec5k
 9uSAbSuazi9cXf3m4fWEtR7VFNTzXeaUub4NPvOIOnATlAfzh7Yw3KGreSCQwGUMA/eT
 PuNs4PS1YPmOT67aZ50lkTxto14i7BsQ5JFyNV7lqlZEtIi5bBVhOhWVyjGFnzu5esnU
 cX9jL97KkQM9rBJfkGXWomCFBmiXb0oth76uYIzyRQ0qoR10hdnKl0rdncqGbBPpDhSA
 SBrIbw3UC03F1c2CBP7ccTYpBgm/ILXhSF84tYUa68cBM2nwjBog+9MCzwmOZ1y+IGVP
 ywQQ==
X-Gm-Message-State: AOAM532NLx30xaNHs/0tFSufB+6qCfgjkHbgaTY3RRKo8BUQcPHeRyCg
 /kZHJYniZkqP3dXScBzqreTexQ==
X-Google-Smtp-Source: ABdhPJzqH8tH9ELakOc22/fn6gukK9gQTVOUDUaR4Qen3wkF/IolOLy916cLAPA6O/e/2Leo1Zot5w==
X-Received: by 2002:a17:902:f612:b0:14c:e978:f99e with SMTP id
 n18-20020a170902f61200b0014ce978f99emr56667491plg.23.1655090500604; 
 Sun, 12 Jun 2022 20:21:40 -0700 (PDT)
Received: from localhost ([139.177.225.255]) by smtp.gmail.com with ESMTPSA id
 i3-20020a62c103000000b0051008603b66sm3967995pfg.219.2022.06.12.20.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 20:21:40 -0700 (PDT)
Date: Mon, 13 Jun 2022 11:21:37 +0800
From: Muchun Song <songmuchun@bytedance.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/3] mm/slab: delete cache_alloc_debugcheck_before()
Message-ID: <YqatQWUmB+Z7BxK3@FVFYT0MHHV2J.usts.net>
References: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
 <20220605152539.3196045-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220605152539.3196045-2-daniel.vetter@ffwll.ch>
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
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christoph Lameter <cl@linux.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 05, 2022 at 05:25:38PM +0200, Daniel Vetter wrote:
> It only does a might_sleep_if(GFP_RECLAIM) check, which is already
> covered by the might_alloc() in slab_pre_alloc_hook(). And all callers
> of cache_alloc_debugcheck_before() call that beforehand already.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Nice cleanup.

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
