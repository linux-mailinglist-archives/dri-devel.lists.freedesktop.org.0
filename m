Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B381A742F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11FD6E462;
	Tue, 14 Apr 2020 07:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5798C89E0C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 20:03:09 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id o19so3531689qkk.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 13:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OEtNtfUfCfknsSkfuodbs8GxJYII1GNua8MgFwL7K04=;
 b=juG10l2QIUDc0d5n1SeOUdB0siwuJQOGCU6pnQRUaf/usairEJnMWI4NCHxVUL2frR
 HT8Dj0G2KFCEAuDZkPEiGVv3NLV5ooo7kJcA7V4T4xV81925vc++8cQ5KHVSBI1+By+5
 +/+66XSDZZW/XkKLCzanTlv78m+KRuVYwmVlKC0N09gqxCMtKrGm1srU2i7+Kw1dkX5x
 DPoyq7kDqoEsqgMu8qGEr3vtIBlmiQWaBKBOz/tbp3ah+kvBa7aU6x3A1gaLlMlwJUeg
 hUM97swfra3YIkYNCDFX0ZcS8Au+7KacD3c88l4X9gBMGqiNfPjeT92Va5NYJ5lvz0rD
 aygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OEtNtfUfCfknsSkfuodbs8GxJYII1GNua8MgFwL7K04=;
 b=it2PmSZWuvHDEVf81Myxztt9bhKY9ykA1DB4Wv73V1cgJ+OCB9Mtz0NmRX1kQiC8Dq
 pDeLlnNH57gOyY3oJmkU7nZQ9ZyApbEtoXuStK3BQ55S3c2QUMQxK8hG2K06t/I07yAo
 0xfs498Sv39UCj/xYUCVPviwbYOHzsht5G8fV0SgmcVay3rzucB3qjN3jenTRg7CuhSK
 O3YU2dsFtNn8wWkIz3uT5buyjKjUDI9mF4mbU+o5z2yP1IRAWiqmoWRKOspDEKNq6yKF
 Cgrd9mPhAY9lGIqDstCGWs2HCIcBNDuULyIBzgV30xvyrFgWr6oRKhcfd8OOlPOSv2Gv
 IVgg==
X-Gm-Message-State: AGi0PuZVt3BUv9DWoYODUT80vFDK44lDg1sQ+RbA5/PjlYPHkp5CliYW
 lH+CDowj7g5HKzo9KlENrFaCGA==
X-Google-Smtp-Source: APiQypJVwvSR1oEkK4bhCoeIIw8batoCJN92/jh4PNjnx+deBvO5XKiPj+RRAmN7IK2twvZnNWUNMA==
X-Received: by 2002:a37:d93:: with SMTP id 141mr7293908qkn.32.1586808188246;
 Mon, 13 Apr 2020 13:03:08 -0700 (PDT)
Received: from localhost (70.44.39.90.res-cmts.bus.ptd.net. [70.44.39.90])
 by smtp.gmail.com with ESMTPSA id x66sm9119423qka.121.2020.04.13.13.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 13:03:07 -0700 (PDT)
Date: Mon, 13 Apr 2020 16:03:06 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Subject: Re: [PATCH 25/28] mm: remove vmalloc_user_node_flags
Message-ID: <20200413200306.GC99267@cmpxchg.org>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-26-hch@lst.de>
 <CAEf4BzZOC2tLrqt_Km=WQb=9xiya2e31i6K3oJuzgYQt6wp1LQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEf4BzZOC2tLrqt_Km=WQb=9xiya2e31i6K3oJuzgYQt6wp1LQ@mail.gmail.com>
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, x86@kernel.org,
 Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, linaro-mm-sig@lists.linaro.org,
 bpf <bpf@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>, open list <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 09, 2020 at 03:25:03PM -0700, Andrii Nakryiko wrote:
> cc Johannes who suggested this API call originally

I forgot why we did it this way - probably just cruft begetting more
cruft. Either way, Christoph's cleanup makes this look a lot better.

> On Wed, Apr 8, 2020 at 5:03 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Open code it in __bpf_map_area_alloc, which is the only caller.  Also
> > clean up __bpf_map_area_alloc to have a single vmalloc call with
> > slightly different flags instead of the current two different calls.
> >
> > For this to compile for the nommu case add a __vmalloc_node_range stub
> > to nommu.c.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
