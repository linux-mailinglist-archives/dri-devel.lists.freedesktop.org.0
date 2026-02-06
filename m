Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCf3LDsohmmLKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5574E10142C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DAA10E869;
	Fri,  6 Feb 2026 17:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VRroKTd3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A54F10E051
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 15:03:27 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-64b9cb94ff5so2908131a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 07:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770390206; cv=none;
 d=google.com; s=arc-20240605;
 b=ZMStWa4KWwgFyBuILi3QbjvTdCEfUzvQleH1euf8QWO6ZPdg0GGgIwRiecTB3TFkW5
 pbVFvQ/oneOWeQYU4/idE/fgyD7fC9HJDa8b3nJ0gUQ4jj/J4TTx65EOlzR4ydrfc+g0
 M/QoxEkpMkn2TZZ+RKKjMR4Tg8zuxfEv1lQA8kLPThwBbVEJQfb29r/KHsjzNkvSd3Uu
 MJdZjyaUyzjDCQi5tMoz8DpIwiyLZthFzwPPyqgA/GIAZf3ZSYGaiKYtEce4XYGY+0dv
 cBvztJhJo+IBOWM88H2KFMxIHe6GdDNHqwFzNncBTCntyRT2sj+K4PMtoo2kQhyacPla
 cPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cbNYgILYh6T0L6GkBJIakhSOuBf8eodDKh7A+HpUyVc=;
 fh=m4jGoA5kJZANn0xpBBVBlYNDY0LPAMkt2wjx8TXTBxk=;
 b=hbt65KOJz9+cSDDBeDb7BzzwCWOnaQ1ZHa7YxyVjtWmx+97CPYxdJDTivD1mOyEzNq
 8VwpB2BM5vA9Fa7ZWSm+iUUVFalSKO6x0jK5yf6dWetbqMnxJyvDpPE/Qz+TwQYhlbwm
 PHGO7WAH5AahZEq2edyyVekRN7wXiPLStH8Dm+103niqhcT7l3ID0gVp1Rte6IQ6O+Ov
 vW0Ljk45hdBSAwfgd4AgKXrf79FsRv2ZF1JzrJlV1iwW7JNcVOVP7tAhXGBdIIh0BhXh
 +arYu7X9b5rElKziMKl3tyAP464a5pz+aTsc+t+A8zdXWqNfmWNcIg3/JNvHE4VLPE16
 H8kQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770390206; x=1770995006; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cbNYgILYh6T0L6GkBJIakhSOuBf8eodDKh7A+HpUyVc=;
 b=VRroKTd3aIUyxHe5ublr+77eWuyjHxoOL6IsMLL/LYZt+xWMMHKIh9Fu9P4wLiiFeE
 Y1BmpabQfvuPWBQV1EP2pjpPOvYV2UY9GsH64xsINnQOWeky234SfNbcCqmXdNQ+P9uN
 G44TJQEcZpQ+Jj1zNJP+Nxa5VAP5jf3QRabyHHE8cWhydl9xjHRGhgTKMfvkKFJpPYQG
 kM5GdFfZTX5/FUbQZKnjf44mP8R+aO2+UKzwvo5zcghUFqyPSIkYobrLAJGA9uDdGXw6
 QqpSt1GWrvoecl/PX7G/oQxGlHaFd5QmpQPyU/4mpRA6mq707dq8sWz28bmtng3YoFDD
 53+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770390206; x=1770995006;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbNYgILYh6T0L6GkBJIakhSOuBf8eodDKh7A+HpUyVc=;
 b=WRKkmNhbSIQJTBnr3JyyxNYpUu3s4lctDvgAMCAvje9eP+tAp5dnTdcGPd9rVQhic2
 Y3Pd+25XcKfcPNUv4W63sCFcBVjpvSdbyGix/0/wqWn+aOlzE1ftBHKL1wYNsp8K8jTj
 EjrblDfu93v++tK3YyaTzqrrYCfCTUzolOh/2P7b9iYGUPq0gqRIO6VQg3zW751bGjch
 prbPSn6X+/huPrAMzEP0EaUMmmUyX8Z04BuTKVRYh+tXdaRmNCA2siTCziJ8zqAITxDW
 YRbaimIpVAB3FYZfZ6sZx57bui2IXICqP9rMavRWd2bK8PUqMs+KZriuQFTFOBQ5mrZh
 yApQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxKtltJbSSop75FlR3LH7wXcuCvGHru92YNIWp220YQ5bstU87ex/ZqM1XfdufF27rDNqpAKRx590=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYwjrUjFFQd/6GQJfaDRQOTXZNHZX1LvifZ9sWZ50Q+U3QX75F
 L17uMelyP+rwJlDnm5oVnozBlJ/kDQn/E1+pABXYQYYjFErdwQ6N0rmbk1mR6gRb3f1uYYi/Cyq
 Zm3sGDc2bp5wxKdAVdhjAa7G95SegMA==
X-Gm-Gg: AZuq6aKYtCk+mCehrCTsQxlrXN8rVaywjA5ecKzUy5TOkpCb1v84w1u+4Zk2urliqNi
 8m+mBWO3rA85ZzYOQYDif+PwFhyHTMuUEZTxrLsNyr1CREtNrH200rvhLt0n5d1OVWYIHW6e/Ts
 eqctKCTkI6zQCzWsWRrD3WarA3JrS/qv2LQiezov79fQlcS0GKCu/xXfrii2UGI/yWPqzujyVJV
 213bI81daDGGUWRe7dQpHvdYXjlihULe9rFk3yIDZ1WY5c3o+OSOwPWUemuY4uZCXXFlUKODH0Z
 Diads4XfAhpxBK961YHg09FXylSsaLfx2idTcra63+WCV0C/TccTxGvqsw==
X-Received: by 2002:a05:6402:3583:b0:659:4383:c491 with SMTP id
 4fb4d7f45d1cf-65984193946mr1569160a12.33.1770390205748; Fri, 06 Feb 2026
 07:03:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763725387.git.asml.silence@gmail.com>
 <f57269489c4d6f670ab1f9de4d0764030d8d080c.1763725387.git.asml.silence@gmail.com>
In-Reply-To: <f57269489c4d6f670ab1f9de4d0764030d8d080c.1763725387.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Fri, 6 Feb 2026 20:32:47 +0530
X-Gm-Features: AZwV_QgZhDOY8h13FRDtMZqnV6_xaqir1VOWq2MTchb4BXyrN5R68VQhosU9bGY
Message-ID: <CACzX3Av_g5g=ssfSjHzkosEj7DMU=+xY5fpdU-zYGYc0cUWPSA@mail.gmail.com>
Subject: Re: [RFC v2 02/11] iov_iter: introduce iter type for pre-registered
 dma
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
	NEURAL_HAM(-0.00)[-0.911];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anuj1072538@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5574E10142C
X-Rspamd-Action: no action

> +void iov_iter_dma_token(struct iov_iter *i, unsigned int direction,
> +                       struct dma_token *token,
> +                       loff_t off, size_t count)
> +{
> +       WARN_ON(direction & ~(READ | WRITE));
> +       *i = (struct iov_iter){
> +               .iter_type = ITER_DMA_TOKEN,
> +               .data_source = direction,
> +               .dma_token = token,
> +               .iov_offset = 0,

nit: iov_offset is getting below too. can get rid of this one.
> +               .count = count,
> +               .iov_offset = off,
> +       };
