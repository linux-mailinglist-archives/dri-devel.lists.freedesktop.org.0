Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG76EYAshmnkKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:01:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845DE101910
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1574010E87E;
	Fri,  6 Feb 2026 18:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dYFj05Rs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D14810E87E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 18:01:31 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so29427585e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 10:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770400890; x=1771005690; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=chld7W3Rbl2PUp6cBiIbC1iT7uESUsO9DngY57S8hBw=;
 b=dYFj05RskD3X9X8R2bjKy5yGdETkmFk+vpc6jt1VpmBcen4f9a35iaBvwj0hyQp375
 3Fnac0yOmljuZo8iG+VlHbqVwLsCMjsRTxgxhmvVjLc/eSCnUcR78BWVSvMJooh98DJd
 87Clxlytl3JslG1anFmnV8DcjIKzKAZJJfzIalLjVmkjMBSXEW3jnDi8yRHVdZxqSEl9
 mY/1HNTpV/+zctRFv47A3jMbbmJMQVDQcy6faVCcaZei+pSZoZgpLrs/6JqtmlN1+bir
 Lx+ht6BWrEeMJOevIMM/v3eCWb1pwNaBJ9824g52j/Sc4bm2VBVFfOkIXzB7KV6Ew6kG
 zFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770400890; x=1771005690;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=chld7W3Rbl2PUp6cBiIbC1iT7uESUsO9DngY57S8hBw=;
 b=kNNBEeerKNzf1YYUoAF73Dl4u5h1/hOd0LFi4HOxqfMu7NQ+Bh+u/mnsvpH7aSsvdG
 oRBDA78tTr4/faJRssvFvH4+jw6VIh+S2HY/QKIBH8xxmhWCr+U4vdtqQaimjWCsdoQV
 vK5uNDl9D5+4++dkGQZg5oAbDsfLSbTz9g5Une79SXe7E2VHvQqGkXR1LrA6FO+mzhkm
 nO9BL87jXOcfOTcRVBWOICwDDS4CjzdBeb+oGPm6b03hAeAK1QB+dW01bW93zcMC+Uwd
 +eEBWKJA2oKtseEN6CpgASV29+pjD0E0MbyoagmhocwNUdFhttgV6o1yUekR4rtfshLe
 b0Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5YxBHcEP1qD3L39QS0gKFdQVpIn5185wNGaIw/v+rhRahQ9aNbT0tod3kKZGux+0l4soChr8xMMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtMxTg2RyuEgAP86G8PZ+wD8L1FVitVERE7HdHi4Y8EjnoK8pc
 OroITC+zo42kLEGpb2dqNkzOrozZQzhWwRUB0rTbjmxknpmlSbn9O5uY
X-Gm-Gg: AZuq6aJsA48CArazzwOIv040ACrvQMbyXadmO/ClKLOiIQDjq8rPQ1J+04Kqx5S1UZA
 NCr5JEtFHlz2tMM27zmayFEnw3yR1ygLAl6HE+TeZSPt1UzHP0IcP0yXzxj40B+m1NemQ3wUwa+
 udqEwhrKGcUfz5wNURG5J8it4usV+1KBUmeYbUgAeWQ2wZb/0Q251r2Zk7JU2UHKf5QoIoz45Eu
 FQvX4fdBjD63/mFuR/3Xue4ur4SF8RdVaS8y/xcGHOLnSIBXf8TLNWjHBVxyHDwbWhPrOEw8gBt
 Qzsc4YWZVnsCCN9NqlUNgO/C3X+K2CyvUFeuACHjEtk++4MAZvWPnUT599wLC9f/cl2KHdU/uLf
 faL6gFH5SQonKt6Dw1lF1fouOshHYg4QDiYsoLBQGOvAE3ntndFPnkjvQsFNvyrXIyr4PzoLt0h
 1Te7yZCnHELnhYHwYYg72lTf/gKzO31GVIH4MEEgO0SakTgCDa0whe0s60bTWfY8XDFcnQ7Ua3Q
 CwP4s2TuyhIxtyEHpcJCmYiDwlFQUa+PucfuDwOc9Jqfyjg3MMPr+PI8sxhngPXFA==
X-Received: by 2002:a05:600c:628d:b0:47d:6856:9bd9 with SMTP id
 5b1f17b1804b1-48320216d31mr49104765e9.23.1770400889507; 
 Fri, 06 Feb 2026 10:01:29 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c?
 ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483203e126dsm51230805e9.2.2026.02.06.10.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 10:01:29 -0800 (PST)
Message-ID: <b0ec01bc-4cbd-431b-bcdd-084cc14553be@gmail.com>
Date: Fri, 6 Feb 2026 18:01:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 05/11] block: add infra to handle dmabuf tokens
To: Anuj gupta <anuj1072538@gmail.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <cover.1763725387.git.asml.silence@gmail.com>
 <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>
 <CACzX3AupFeAy0-pPsZ51ixd7qW++LYYjiKBZ3aK5Y2JDrB_JWw@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CACzX3AupFeAy0-pPsZ51ixd7qW++LYYjiKBZ3aK5Y2JDrB_JWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:anuj1072538@gmail.com,m:linux-block@vger.kernel.org,m:io-uring@vger.kernel.org,m:vishal1.verma@intel.com,m:tushar.gohad@intel.com,m:kbusch@kernel.org,m:axboe@kernel.dk,m:hch@lst.de,m:sagi@grimberg.me,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:akpm@linux-foundation.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-fsdevel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[asmlsilence@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[asmlsilence@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 845DE101910
X-Rspamd-Action: no action

On 2/6/26 15:08, Anuj gupta wrote:
>> +
>> +       dma_fence_init(&fence->base, &blk_mq_dma_fence_ops, &fence->lock,
>> +                       token->fence_ctx, atomic_inc_return(&token->fence_seq));
>> +       spin_lock_init(&fence->lock);
> 
> nit lock should be initialized before handing its address to
> dma_fence_init()

Good catch, thanks, I'll apply that and other suggestions. And I still
need to address bits Christoph pointed out during review.

-- 
Pavel Begunkov

