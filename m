Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EDD7685E9
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 16:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0615910E099;
	Sun, 30 Jul 2023 14:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 507 seconds by postgrey-1.36 at gabe;
 Sun, 30 Jul 2023 14:05:46 UTC
Received: from out-91.mta1.migadu.com (out-91.mta1.migadu.com
 [IPv6:2001:41d0:203:375::5b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BA510E099
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 14:05:46 +0000 (UTC)
Message-ID: <40a3ab47-da3e-0d08-b3fa-b4663f3e727d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1690725435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGVwrSKPSqOKImBWbZoAx1qzxZDIg0U6/MyAhWrgbuQ=;
 b=iwoYw6Haq+kOYGPuPZKv5wW+uOf7UmUbzIK+dEi5BcvQ8JE87XsTTo3/OaLFjVQBD/o/ir
 fRSrCMrpEvqE0XtHAMIKkjF5ulAwlVSYlFZPhPk/oZ9ZcnH4KqxFkMf4MzqaUwsOND4ZDJ
 4e/ew8GqIOajhMOJNNAbOKquCrq4by4=
Date: Sun, 30 Jul 2023 21:57:06 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 03/13] scatterlist: Add sg_set_folio()
To: Matthew Wilcox <willy@infradead.org>
References: <20230621164557.3510324-1-willy@infradead.org>
 <20230621164557.3510324-4-willy@infradead.org>
 <a2a2180c-62ac-452f-0737-26f01f228c79@linux.dev>
 <ZMZHH5Xc507OZA1O@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <ZMZHH5Xc507OZA1O@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-afs@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


在 2023/7/30 19:18, Matthew Wilcox 写道:
> On Sun, Jul 30, 2023 at 07:01:26PM +0800, Zhu Yanjun wrote:
>> Does the following function have folio version?
>>
>> "
>> int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
>> 		struct page **pages, unsigned int n_pages, unsigned int offset,
>> 		unsigned long size, unsigned int max_segment,
>> 		unsigned int left_pages, gfp_t gfp_mask)
>> "
> No -- I haven't needed to convert anything that uses
> sg_alloc_append_table_from_pages() yet.  It doesn't look like it should
> be _too_ hard to add a folio version.

In many places, this function is used. So this function needs the folio 
version.

Another problem, after folio is used, I want to know the performance 
after folio is implemented.

How to make tests to get the performance?

Thanks a lot.

Zhu Yanjun

