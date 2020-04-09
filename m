Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABD1A37A3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 18:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBBA6EC04;
	Thu,  9 Apr 2020 16:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31296EC04
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 16:00:03 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id n10so4316797pff.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aQRKpekxDIbOTQGjAcEIQGsYobF8qM0SxjsCWTw2ZsI=;
 b=sih21yydVRFHZsFGgg59HNuBfeOLWxP9lrEPMN105FfVz58rnW/GDEcO4zsmsi+D4H
 wfVsCAsfHYhb74tml4QNYR7f9EYK10v4PgVx53AGyktrCWIvgakaRU3DkpUR+Lp5/V+G
 lLb/WOY+7lne5P6uJPBpxjiGqkkRjtOHRD+VYpIGgdyip5zJPYNfganUG5rlt+iX65Ia
 G+O1XkANhyv7aIffHK9DPrr3KKB0tuS8o3hYzz5dANw43pLgXhhewQpf8p3UQzu7jaUX
 vklovoYaq3tUs05JhS/KPyXwPS2z6JKDw0gxXTNpi9Odm5NtE18/784OJMXo1euPhq2F
 NSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=aQRKpekxDIbOTQGjAcEIQGsYobF8qM0SxjsCWTw2ZsI=;
 b=D4smsXsi8bTPBcOGs9RIrX6sT4FrdBcDd8a8NIsfGKwsRCn5qJS9xeEfJxMSItPMmh
 nKsKActCZC59jy2jh4LdvIicAnrfMyrbGWujzMQTV6DI+xrJQZB4oqnSW08GVtLLT0MI
 iCbX1mM4PX58/Y6POAOv2lA5BFKV13BoI6BsbhGBzq89cbRX1u88pBqV3byinSeF1sEr
 KKYBwAjecMf9h8pBLUUXLu0jVlVrS2LxfHmzCiVslCSpAZlIygb43BT4z30EqQFtjp9Y
 NU6sc1LRJl7AnaXueyHtv1odhcOrnwZpQnSqZuDNoq5QB1pDC2olKYq9gR3SShG3WtW+
 J7vA==
X-Gm-Message-State: AGi0Pub07QI5jO2aWa4UmBJFa0H1jKu5qc99rhd+gZQ4yUfbqQHnScEQ
 wzjIKc3i4tuJV7/wapneTp4=
X-Google-Smtp-Source: APiQypJjp3TKUZfafGLvg6qEU9KISYf3/iG0IoFzAvoBFmETLO9Bl0QvCAR/K1DmpfYnyGtmiu0e2g==
X-Received: by 2002:a65:580d:: with SMTP id g13mr110923pgr.45.1586448003209;
 Thu, 09 Apr 2020 09:00:03 -0700 (PDT)
Received: from google.com ([2601:647:4001:3000::50e3])
 by smtp.gmail.com with ESMTPSA id a24sm10081726pgd.50.2020.04.09.09.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 09:00:01 -0700 (PDT)
Date: Thu, 9 Apr 2020 08:59:59 -0700
From: Minchan Kim <minchan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/28] mm: rename CONFIG_PGTABLE_MAPPING to
 CONFIG_ZSMALLOC_PGTABLE_MAPPING
Message-ID: <20200409155959.GB247701@google.com>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408115926.1467567-10-hch@lst.de>
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
 Peter Zijlstra <peterz@infradead.org>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 01:59:07PM +0200, Christoph Hellwig wrote:
> Rename the Kconfig variable to clarify the scope.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Minchan Kim <minchan@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
