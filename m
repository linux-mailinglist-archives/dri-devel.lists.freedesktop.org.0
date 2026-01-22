Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDiaMzwOcmksawAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:47:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201016633B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E354789D7C;
	Thu, 22 Jan 2026 11:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aCF3Qhsz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE3410E995
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 11:47:04 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-435903c4040so575572f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 03:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769082423; x=1769687223; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/c04FssyRzWAvFZbUZZ5iSwy4KaO1b4NaDQ9GK8JLME=;
 b=aCF3QhszJqNUWruG5n4Ml9kSqz7ph3e1QzZVpuotB1LuUoFro6yS8MMSE4sXp7LMDU
 97Ys2+FPdlfPwz5Nhz4wCvH+H9OyIoPPT0+NvdLGXfjIzYJwHczl3Rv7292xmxoD+7/K
 y5Vt6XqOc/ipeg5TCwYLOpYf1qlePkTHX7nF1st9Y2krSykH2gblV6/zrCc9MUrluxc1
 dRUr+I9ZwHbjd3FKut9XP/GtfSiB/7WsPKmJkql4DB7z7wsoiBww2s09fKktL5Hau2r0
 L6KC9RlTJZoz2sig8RBZ7k+0su4vFaY84Qmhc51Q/XF5LtH+ytr/DAnWnK7BFcqp8wwM
 942Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769082423; x=1769687223;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/c04FssyRzWAvFZbUZZ5iSwy4KaO1b4NaDQ9GK8JLME=;
 b=YxwPqhEvamipGdwvrNZcpT5s6Qd8qs4u/ZxxRXNpYUfO7PDlB4cj0A14vJal4T2EsE
 E/E8SIWOwnoGngygve2KGtu/FfKdsFKO7nocqvHNyoax6f9mfcstRT0A29Hkce7x3lyr
 nES0GmELJN9M8ztREBHkWn/nfvu1mODi63MAWayzOzXLS0iBnT/c26IajNQqPSK+7Js9
 QbUT3PLKCx0xbcUL+QqSFN6VayKpPvhOTLqU+fcLU+HR7VaJznZ4/nTmTjFd79xg+9U1
 r2OihqRmAl6FqUapGnnQ/nGwxYX0H5HUkocmi235ypGhMNDeL1/iIgryCKFmYfXCseAR
 yVeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZBosMwuAvGYghKZkYs0+KX9BLqEpRro6knv50Z0PRbbWNc3a2TiglnC1cX/QeZ40NNViLgVNdsg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu1QcVQlUkfkNSX6Lx22Acs2F0Soq6tJRp93C3SeDhaar7Us9X
 p5IqDDcIOGEv/r7ue6jfMu9tVnjyU39pO6rnJ5RRDA55aP/fA7+flcLj
X-Gm-Gg: AZuq6aLGmSkQ0iM/jyjqcTT82K6Wipc/jNQ6//1JOhDJZyGlD4robwJRzMQCM/N3Hqn
 EagS2oA9gGA93KjmhTxKR08PaO0/Xvj3YCJWRw0SYt5DN6noiTpaPYBV6dzhcB7Xg1bSy9EVmzQ
 JaO1aFJqlAUSducw0+PsLz3nQ6Mb0m2smmh3kIBuqSqPZ2LYVAiOAhIdnmol+VTn9xXXMkMF1J7
 s/RTI0ZS/TqbI2q1hyIpDxiRlllX8vvBbcd9D6hi4b3P/6UNu/j4JiTYIfpEeUmCmzOiYHvXNzr
 Xh5Jh6UH8pcWNxmyGSaRJC/m/zfs/DVMHJiMb9eBoFkdlzt6bnNzWz5MkGstzp3di5AtAIn68DU
 LAvS/X7nv42oVeK4A6IFCOZghDT5c7pneaq543GSodp2eVEchQ2IgeL8RLVS0LFkiZ3DC2MnppO
 ZKppIkzEYgcMJNIX2aMVsYHL9GspWjAf2h7/xE0f1RTiHZW8AcQTZg9C5NHFyqAW49CRz1c9DK6
 Qq/1zp7Zrs6nsS0T0HbTByAu5hP3lRDZms7VxT8z73KP+w=
X-Received: by 2002:a05:6000:144b:b0:435:95ce:836e with SMTP id
 ffacd0b85a97d-43595ce838amr11818024f8f.55.1769082423045; 
 Thu, 22 Jan 2026 03:47:03 -0800 (PST)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87?
 ([2620:10d:c092:600::1:46c4]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4358f138e26sm19447555f8f.17.2026.01.22.03.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 03:47:02 -0800 (PST)
Message-ID: <d3389449-f344-48ae-ab13-697e01d1cc46@gmail.com>
Date: Thu, 22 Jan 2026 11:46:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 05/11] block: add infra to handle dmabuf tokens
To: Nitesh Shetty <nj.shetty@samsung.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <cover.1763725387.git.asml.silence@gmail.com>
 <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>
 <CGME20260121074135epcas5p2eeb621d6acc9b4b73e6d45f5a40c078d@epcas5p2.samsung.com>
 <20260121073724.dja6wyqyf5apkdcx@green245.gost>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260121073724.dja6wyqyf5apkdcx@green245.gost>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nj.shetty@samsung.com,m:linux-block@vger.kernel.org,m:io-uring@vger.kernel.org,m:kbusch@kernel.org,m:axboe@kernel.dk,m:hch@lst.de,m:sagi@grimberg.me,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-fsdevel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[asmlsilence@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[asmlsilence@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 201016633B
X-Rspamd-Action: no action

On 1/21/26 07:37, Nitesh Shetty wrote:
> On 23/11/25 10:51PM, Pavel Begunkov wrote:
>> Add blk-mq infrastructure to handle dmabuf tokens. There are two main
>> objects. The first is struct blk_mq_dma_token, which is an extension of
>> struct dma_token and passed in an iterator. The second is struct
>> blk_mq_dma_map, which keeps the actual mapping and unlike the token, can
>> be ejected (e.g. by move_notify) and recreated.
>>
>> The token keeps an rcu protected pointer to the mapping, so when it
>> resolves a token into a mapping to pass it to a request, it'll do an rcu
>> protected lookup and get a percpu reference to the mapping.
>>
>> If there is no current mapping attached to a token, it'll need to be
>> created by calling the driver (e.g. nvme) via a new callback. It
>> requires waiting, thefore can't be done for nowait requests and couldn't
>> happen deeper in the stack, e.g. during nvme request submission.
>>
>> The structure split is needed because move_notify can request to
>> invalidate the dma mapping at any moment, and we need a way to
>> concurrently remove it and wait for the inflight requests using the
>> previous mapping to complete.
>>
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
>> ---
>> block/Makefile                   |   1 +
>> block/bdev.c                     |  14 ++
>> block/blk-mq-dma-token.c         | 236 +++++++++++++++++++++++++++++++
>> block/blk-mq.c                   |  20 +++
>> block/fops.c                     |   1 +
>> include/linux/blk-mq-dma-token.h |  60 ++++++++
>> include/linux/blk-mq.h           |  21 +++
>> include/linux/blkdev.h           |   3 +
>> 8 files changed, 356 insertions(+)
>> create mode 100644 block/blk-mq-dma-token.c
>> create mode 100644 include/linux/blk-mq-dma-token.h
>>
>> diff --git a/block/Makefile b/block/Makefile
>> index c65f4da93702..0190e5aa9f00 100644
...
>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>> index f2650c97a75e..1ff3a7e3191b 100644
>> --- a/block/blk-mq.c
>> +++ b/block/blk-mq.c
>> @@ -29,6 +29,7 @@
>> #include <linux/blk-crypto.h>
>> #include <linux/part_stat.h>
>> #include <linux/sched/isolation.h>
>> +#include <linux/blk-mq-dma-token.h>
>>
>> #include <trace/events/block.h>
>>
>> @@ -439,6 +440,7 @@ static struct request *blk_mq_rq_ctx_init(struct blk_mq_alloc_data *data,
>>     rq->nr_integrity_segments = 0;
>>     rq->end_io = NULL;
>>     rq->end_io_data = NULL;
>> +    rq->dma_map = NULL;
>>
>>     blk_crypto_rq_set_defaults(rq);
>>     INIT_LIST_HEAD(&rq->queuelist);
>> @@ -794,6 +796,7 @@ static void __blk_mq_free_request(struct request *rq)
>>     blk_pm_mark_last_busy(rq);
>>     rq->mq_hctx = NULL;
>>
>> +    blk_rq_drop_dma_map(rq);
> blk_rq_drop_dma_map(rq), needs to be added in blk_mq_end_request_batch
> as well[1], otherwise I am seeing we leave with increased reference
> count in dma-buf exporter side.
> 
> Thanks,
> Nitesh
> 
> [1]
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -1214,6 +1214,7 @@ void blk_mq_end_request_batch(struct io_comp_batch *iob)
> 
>                   blk_crypto_free_request(rq);
>                   blk_pm_mark_last_busy(rq);
> +               blk_rq_drop_dma_map(rq);

Ah yes, thanks Nitesh

-- 
Pavel Begunkov

