Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7651948C049
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5454112E63;
	Wed, 12 Jan 2022 08:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D79310E402
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 22:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=OQRrkSTzK0n2WDJnypN3nkxt91IMNAOuhsahp7OKxa8=; b=KASG806faBlkocf5OxJutxFfjt
 Q2Rq0vzUYgks/O2fPyDrMfuizAeXHbGXh5Izvf03QMvn2B3RwpB35Esksrmjrv85a9insfOiANy7X
 iy8Zrk7/owfI5HBic+G+Ixs2m099TRUxO/3SD23ZvKDo3KEkg0yAyV/iPgywJQiU89CeHexxMsYuf
 d7as7kWdOJ+D2EqYesK1ndcMFIVPRUxJctobC7V0jle+U2OnvCkDi3yQaOL+NpGorTTtjQQ0D1oHs
 EBseJaH5yao5ZC2TwuQYdDHy/OhZERMlK084dXpQB3hAka/ZxR1E3eWZrT/W5gl29sRcnbHcji1/Q
 gg3A1BUQ==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <logang@deltatee.com>)
 id 1n7Q4i-009nqq-GT; Tue, 11 Jan 2022 15:57:09 -0700
To: Jason Gunthorpe <jgg@nvidia.com>, Matthew Wilcox <willy@infradead.org>
References: <YdyKWeU0HTv8m7wD@casper.infradead.org>
 <20220111004126.GJ2328285@nvidia.com> <Yd0IeK5s/E0fuWqn@casper.infradead.org>
 <20220111150142.GL2328285@nvidia.com> <Yd3Nle3YN063ZFVY@casper.infradead.org>
 <20220111202159.GO2328285@nvidia.com> <Yd311C45gpQ3LqaW@casper.infradead.org>
 <20220111225306.GR2328285@nvidia.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <9fe2ada2-f406-778a-a5cd-264842906a31@deltatee.com>
Date: Tue, 11 Jan 2022 15:57:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111225306.GR2328285@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: nvdimm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-block@vger.kernel.org, ming.lei@redhat.com, jhubbard@nvidia.com,
 joao.m.martins@oracle.com, hch@lst.de, linux-kernel@vger.kernel.org,
 willy@infradead.org, jgg@nvidia.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A autolearn=ham autolearn_force=no version=3.4.6
Subject: Re: Phyr Starter
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Wed, 12 Jan 2022 08:51:42 +0000
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
Cc: nvdimm@lists.linux.dev, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 Joao Martins <joao.m.martins@oracle.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-01-11 3:53 p.m., Jason Gunthorpe wrote:
> I just want to share the whole API that will have to exist to
> reasonably support this flexible array of intervals data structure..

Is that really worth it? I feel like type safety justifies replicating a
bit of iteration and allocation infrastructure. Then there's no silly
mistakes of thinking one array is one thing when it is not.

Logan
