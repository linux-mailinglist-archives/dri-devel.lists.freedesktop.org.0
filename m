Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5307467B1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 04:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6896310E264;
	Tue,  4 Jul 2023 02:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8012E10E264;
 Tue,  4 Jul 2023 02:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=W2tT5qdGcqTnb2PXnVB2OqDvEuLQMx09FCGDSKlyHHQ=; b=VZZOlr5mDQGDoHVZujGXf76/0s
 IlTLx5zauQkdH1eTy3OfcXU+Ad8UR/3y4x/2IiVJLL1wanNVHCljGn5GeMFpCW4LHtin9qzyYazIc
 k64IaL+uPjeS3JKmY/6wfhmoQcQP0d7xS1gofLRgL+KoAV89WI5XkLq9gPKqsYR28FXCOVxEF/02e
 ylBSpfqmAGYsn6IaRBG8yQGLmD+lo9yNBCXwnuyNQjYat3vkSuZY2AkPXM3aJGZqG6RHntlmvI5a9
 pniPUn7GNnTR5PU2e2nWYDxG7V7O6iszUBVftZSnn5F3nT+/tfO8pPQMg/W3A4A+QiO5DX2r/ElSM
 Hb0UD1/Q==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qGW5P-00BxeL-1a; Tue, 04 Jul 2023 02:48:15 +0000
Message-ID: <c403fae9-a716-f746-18f9-4d72f83fdd32@infradead.org>
Date: Mon, 3 Jul 2023 19:48:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
Content-Language: en-US
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <CA+hFU4z1pc=KUVVqyqfXEceUqMXQgh-qUnuB=1nkPELghvQO7w@mail.gmail.com>
 <CADnq5_MNVdtdcWKSz6dgmsjg+kEu8p5FVE+fkw_5BaXeG3QGow@mail.gmail.com>
 <afab1f5a-e581-3416-e2c2-238ea120655b@mailbox.org>
 <CAAxE2A5C96k5ua+r938VA_+w7gHHNTdF3n8LwDb98W0Bf9wCVA@mail.gmail.com>
 <7c1e6df5-1ad4-be3c-b95d-92dc62a8c537@mailbox.org>
 <CAAxE2A7RGDY4eRC85CsqfszNzyKvMU2MX1wa+3HZ1hgNeAw3cQ@mail.gmail.com>
 <ca7ec187-ffbc-0779-0dbe-21238a566e7b@infradead.org>
 <CAAxE2A5UizddTTBWtuL480bDxgniVcBq7fjRGQhoC-5FG9vKpA@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAAxE2A5UizddTTBWtuL480bDxgniVcBq7fjRGQhoC-5FG9vKpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-dev@igalia.com, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/3/23 19:44, Marek Olšák wrote:
> 
> 
> On Mon, Jul 3, 2023, 22:38 Randy Dunlap <rdunlap@infradead.org <mailto:rdunlap@infradead.org>> wrote:
> 
> 
> 
>     On 7/3/23 19:34, Marek Olšák wrote:
>     >
>     >
>     > On Mon, Jul 3, 2023, 03:12 Michel Dänzer <michel.daenzer@mailbox.org <mailto:michel.daenzer@mailbox.org> <mailto:michel.daenzer@mailbox.org <mailto:michel.daenzer@mailbox.org>>> wrote:
>     >
> 
>     Marek,
>     Please stop sending html emails to the mailing lists.
>     The mailing list software drops them.
> 
>     Please set your email interface to use plain text mode instead.
>     Thanks.
> 
> 
> The mobile Gmail app doesn't support plain text, which I use frequently.

Perhaps you should consider some other mobile app for kernel discussions.

E.g., it looks like the K-9 mail app works with gmail.

-- 
~Randy
