Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGZsJUIohmmLKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3987C101464
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1120010E873;
	Fri,  6 Feb 2026 17:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J82k92xJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3C210E051
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 15:08:53 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-658078d6655so1269246a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 07:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770390532; cv=none;
 d=google.com; s=arc-20240605;
 b=L+QffUI/IWZhYPIKL4EKvf8T5TDwUUdMzmO18k7mfDYGu0iw3bH+jHSr0WFuPLEPGd
 dcYIjSkJHUTD9yQ0peg5tiz/Htwe6hjnbz1B4AsVQv7Mwy1zrOlwZD5yLIaHV3tPiBE/
 qYRdHnMVw87ZAi8iBwV9y9/Xgkp94m07Ipg6LZEbyJn8MkF32Dj5wEorbdw3XSeEcuGb
 sxZzNpFW2GDtIATf12izzxAG3IMYSIhFRNFhF1FCrIoIzEZk1gscyQu5Xfr3/skGEOaR
 4vDhpWSPCXHJxb84ZjVG66/9jDo5EVAmWwskUzIyevo2M/fEJJ6EBnEdcOcA1bhjoNRy
 EqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=IV2wXVQGGux8HdfCehvXRHDBtsaFVEwot7iSA9nA38k=;
 fh=eKatEehblfoO/1rmgoGu1Aljs6Z8wO+r/Ua58stLMEA=;
 b=DM7RyHO/qv5V8UsPPCy3wyzxVGTmuTRYxR6z9glrQ+9wprBeKhFXjRFWo3tcLDiaIj
 T2M/I1p2+N0oVXle5/CGufd7cINNAxKxxfXLgEATOGA61jU4MvI2G2zGfEfWUsiF23BD
 VJQE2dsDvjOhpZ/B0SlyUOoGZY63L+a0l4r/P/97xdqEdStyho6ww/PnaqbUeyGwOiGI
 Gffb6/2ruTmRltZNRLMgng1WOXehafgyY5c7wKxInQKDPKcUBMAVrTsvVMKFVkOPzHvq
 Ri+Z8+AxbgoQef/8vTrxZudvLvQ/AIvBo4oMvVe1sHEfjH1TIl5lxnCmLEIp67r8prxP
 9QLw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770390532; x=1770995332; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IV2wXVQGGux8HdfCehvXRHDBtsaFVEwot7iSA9nA38k=;
 b=J82k92xJyKPxEeFQW/NZVDb/abWykJmqHMuvcMLBx1pGqD4DDA/i+cfh93dkN2rBXq
 gCTRSX1hCsg44SUj6uRRADns8QbnEM/QLSNHN6Pw4K7joTNHPzt5Otw5qckMFfCiiq6I
 iRTNicW3UGmJdd1OZ9AfRqcFLNP+tZkXilR6Y69UAMQa/f2vZaniZZAWRN1ZzklwVxzG
 0gJUGgKq7bqy4JGJutMzpTr9bBdjCP7MAhwTSM5dHsrUCKC5kS1ExJLZI62kD6UNaEnk
 AigJiCdQ+YK0/TR8Kdp1XvtM/o/BTvJqULTRXFDbcAHvM87BLxv847lg2ivVArQOqsTH
 yvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770390532; x=1770995332;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IV2wXVQGGux8HdfCehvXRHDBtsaFVEwot7iSA9nA38k=;
 b=K9H8mKIGkxZyDkFgslxGC6yR82x3V6U/Sukk/y0ALj+O2TiPckB8LwXq8U0z8vtnM8
 ckpJmjnbC6Xy+RzLZohoFhLS8HyCvGsyykIdZH6Q0pKagu5kF+/QRRPYKxgGmUQuaKbl
 4C5MYIbdqj/knHXH25a2Gd5Vvc9Rk+eJa/5kVOeMKrmKY/6h9Xn7l+I+039Onq0S83HK
 1wVslrOaW3GfLokEz6JjhAr+rfehicn5Xfg4cdUNv4IADy3HGL04tY93/zZscq7q1n2O
 8EL03AqgwKYWc1rPh1aeEtbN4IwjzDdm72jphblZceQNnBx5xLaxsVPUwJOdh6NDGOZD
 LY+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+R7TNhuv0aMZay8haD6LVYpmUdmMEH6EufGOVL/OErM0KPz/HSazmvpKC1e68wJO4jY+z6KZhi6o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywdOD8WAJXGp3B4TCk6CFMVVXA+OzCwAthwNxSVJgvwEG6Hkva
 +C7W62K8RXW/zneaOJWnCqTPxRHaULGupUniiJi8ZXrqdNmcE6+3TuOK3e2TfytdwqS0faqBcbR
 PkUCtb/vKZeBytwVFNSsmnIj14AAZKA==
X-Gm-Gg: AZuq6aLUsv81Al8RpwzXhs+ZcaKEofQ0Wx3GxVomP8xRnCFA3RwbByvk1mH5vmqLF9i
 ivLNEXkRqtYEkTt9/1SshFKBecYClub3gqjKsZRI7n3/nKXrllZrsa8Z5y0E4UZgyvpwxvzDErN
 76STwFa4ErwddnZUKhiDRiwma9OXJcoZVfPCc6XAnBq/YBuiOLybnzBmWncxCr4LYX6LdiL3+U5
 OkCjwcfkh1DnFIqSA5rJgb6GrQbLwRa1V9RDlkNQSArbfDvrOK3/WLQ9+0kADfeoub/Kov9KC+u
 Qz6H2ZwnMdkoAsSnc61gB1BR7J2OX99ep0BpnDuznIqkvH+JJgZvZds4kw==
X-Received: by 2002:a05:6402:278c:b0:64c:69e6:ad3e with SMTP id
 4fb4d7f45d1cf-65984192b46mr1665335a12.33.1770390531549; Fri, 06 Feb 2026
 07:08:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763725387.git.asml.silence@gmail.com>
 <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>
In-Reply-To: <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Fri, 6 Feb 2026 20:38:13 +0530
X-Gm-Features: AZwV_QhSbcTXF1vOFniIsckdgf0WRvSvELPcT6UCzLuL9aGCZaYlbLnCwaCB9sE
Message-ID: <CACzX3AupFeAy0-pPsZ51ixd7qW++LYYjiKBZ3aK5Y2JDrB_JWw@mail.gmail.com>
Subject: Re: [RFC v2 05/11] block: add infra to handle dmabuf tokens
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org, 
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com, 
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 06 Feb 2026 17:43:15 +0000
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:asml.silence@gmail.com,m:linux-block@vger.kernel.org,m:io-uring@vger.kernel.org,m:vishal1.verma@intel.com,m:tushar.gohad@intel.com,m:kbusch@kernel.org,m:axboe@kernel.dk,m:hch@lst.de,m:sagi@grimberg.me,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:akpm@linux-foundation.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-fsdevel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:asmlsilence@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[anuj1072538@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.916];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anuj1072538@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3987C101464
X-Rspamd-Action: no action

> +
> +       dma_fence_init(&fence->base, &blk_mq_dma_fence_ops, &fence->lock,
> +                       token->fence_ctx, atomic_inc_return(&token->fence_seq));
> +       spin_lock_init(&fence->lock);

nit lock should be initialized before handing its address to
dma_fence_init()
