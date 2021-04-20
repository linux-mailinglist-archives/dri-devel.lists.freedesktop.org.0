Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FE536541F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108496E466;
	Tue, 20 Apr 2021 08:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657426E466
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:30:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618907407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gc2OYO7Gop4pXOyn2eMOrNhPvb4JX9AiP/LihACJjrQ=;
 b=BCNcFuuvbhFnjxTxkMtniV6iWAWam2IqyWerccUoN/HC6fZYKEpWY2rM4gXw/GDh0DIDxX
 7LkSj6Fje6422drCh/GTOBK9zvwW19pEVV9/TN8slkM9hK3/2AmLZN+j3iji2Ohk0CsFvB
 ZDwJHGFz/U5maxLX/pucXx1QLqZm9no=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D66A1AE38;
 Tue, 20 Apr 2021 08:30:06 +0000 (UTC)
Date: Tue, 20 Apr 2021 10:30:06 +0200
From: Michal Hocko <mhocko@suse.com>
To: Peter Enderborg <peter.enderborg@sony.com>
Subject: Re: [PATCH 0/2 V6]Add dma-buf counter
Message-ID: <YH6RDgoJTPWsULDs@dhcp22.suse.cz>
References: <20210420082220.7402-1-peter.enderborg@sony.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210420082220.7402-1-peter.enderborg@sony.com>
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
Cc: Feng Tang <feng.tang@intel.com>, linux-doc@vger.kernel.org,
 NeilBrown <neilb@suse.de>, dri-devel@lists.freedesktop.org,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Sami Tolvanen <samitolvanen@google.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>,
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Roman Gushchin <guro@fb.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 20-04-21 10:22:18, Peter Enderborg wrote:
> The dma-buf counter is a metric for mapped memory used by it's clients.
> It is a shared buffer that is typically used for interprocess communication
> or process to hardware communication. In android we used to have ION,. but
> it is now replaced with dma-buf. ION had some overview metrics that was similar.

The discussion around the previous version is still not over and as it
seems your proposed approach is not really viable. So please do not send
new versions until that is sorted out.

Thanks!
-- 
Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
