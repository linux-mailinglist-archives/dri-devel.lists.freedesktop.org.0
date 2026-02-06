Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HlEIkYohmmSKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E35101480
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F309C10E88A;
	Fri,  6 Feb 2026 17:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SdlL8yv8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D7E10E051
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 15:06:13 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6505cac9879so2840465a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 07:06:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770390372; cv=none;
 d=google.com; s=arc-20240605;
 b=daGKUqaGtlh0VWd31qKPlGLZiOASWqrS/M+6EBFvm7lmvlVeoPWOAu6yKkT1o7QZtk
 UIE/n6NUFbdRDHuXaybdgbU1yEojzcf5KrHXMzGpPbnOBe9DPxNPg5zrv+10z51A6atJ
 bXNZXsGpxBEAml/V4GZFn5rKolw6Rpt4Tzj8qxu0TyTfnFdZLikL0xJIFXHfGZ96dVYJ
 9RY6gbJEoT5faZv8hlEcbnNXmgApP4Me7SoMV9e9inzjRrwc6zm3AFQq1mktxQM4ak5K
 LKpqImHt3SCKZ+ERYWfFjwUkYOe08pzth9wBcziHtHvsx+v5MvyyVwqK80FE1QWhzYZu
 49vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hGQBxRDZvTlf47Wu9lDxdnyR2cqQuj+x+M/+cDeQX7w=;
 fh=65x5NjkLK0+EsgbleZhe9PtInksy76v9wwpL4m41+sg=;
 b=Yyg/V5qujdDU7Gi048kL3skI+7K2gsGRkOFK6flgeY/gD3wTI9UNPb/K3h6ESxrk5u
 2LeVarSeI18mGzzqi8RiXMdZal7TDQLrLUZPDr+8YBFzSWRazpI1yNT6ypCno04Y52vq
 6trkzl9hOgwZReU3mF170pivw5Fdgzz1G81Z5snT670aHMovX918yK3EbLgcBeObtbxe
 xoboW5hsFXIWvcTCC8ixrJFO+bU4hR0RMRTb4WD4nPwIsELY5plAuUFBCfXvSTrfi3g9
 RfIkCdawWgBWsE4Mn6FlNssYWWkrizLILalkqq3/yBxipwLen53PkmdKr1nMvcG64GVN
 +w6w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770390372; x=1770995172; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hGQBxRDZvTlf47Wu9lDxdnyR2cqQuj+x+M/+cDeQX7w=;
 b=SdlL8yv8oUXKdh9yJZpm4UU4JeboF1V2UW0m+2st/DTgYeHPDgndV31RPYSN0bimCp
 ejBzQWkb6aBxH3xrArPC/bVAkUvkZ+AMQBrr0T0IQ0iE5ewDpehNLtlVRuXOFbhL0NpO
 fdCTFCrfvyBSBXRBPzOS3Nni6SSO1Gk1Slaft/OVMzAHJOxS8YjWgZzOx7Id3HPqWHfB
 qt1h5ZMK/yoki4uD2wOKZw4P2tsCX+F21vvnuYXtrYQLsK9N59qXddfDmbSDsuf4NDSs
 WjCDY56+be/Sn0MZ4hx4rbZUtkDJ5Lr3JQWwLcB6HmWEmqtKUcw9bR1uCUH/YW2avddE
 Ln8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770390372; x=1770995172;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hGQBxRDZvTlf47Wu9lDxdnyR2cqQuj+x+M/+cDeQX7w=;
 b=iILZRskoFxpRBihkmRL8vLv9LvTArswWJ62GUEociJSO/mlwqZP8F7U5XVyp2yXZsq
 Dc/Tqb8m5/6fpE8vteJMmQPYzq0M3gwqGuHX80Vyt4EfTPaUMH4K8yW1EdYJSFcoep9Y
 Z4UyKww2N6q7RyrXTTo9Bho1OihYZe9cVXJn74cTitrWUq8vMa3GA2PZ4vMAZUjXugwg
 6sCn/gApk2smbR3OVtQuWmIe/byS3+O4zs/qvrx/+SrHAokhYpCUX/UCrNW6gQ3EEHCo
 CWRqm8sdEm6Zyd12DG8k6JadIKcqfz6nkLEUE/QXZakrN7PMOZemtVN1vusECn9++R6W
 viAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrhvpEh0cXnGxwkTLlagRZhlSaPG0p2NjDMabbMiETbDdTkh9m9AviLfHcCZn53eUqoOfnI1E2xm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/bAbsGT0zZlz5t1wH8XDN/c5hzs70ve+7ZKZoBtC7a7j9nLvm
 d7Pgw1yTIWg3hmY0oG0JUxsO0ndz4CwlTq0cS3GrzbkV4gD4vYxIACGor/JYFZdOgtMmTjl4092
 JBNSfE+b8/axSeYDs3uC50aOO1LgrKw==
X-Gm-Gg: AZuq6aKJkj3s68qmdE60nqmjkJfCMlXhwynrv8/RvqH8rz+O8GRO0sjPf2bSP3fJgr9
 6C5IO94uMxhUsYG5IMaMsrFVRzNhLhWdeJbHYUJo5bGiOjC8zUJWUAn2lE1jw/K5f6Zeq2UId0y
 QvS4W7p9IyQ9dOyYeJcuepSEfDOarrnPmFLY2wGf3uHapSdU1b73dhD5ZWMVJpYmusILAN+rYwa
 S7CW7O2rVUhoc0DUwy8iuDJ+Odgq3C2hAceBILu9B3im9IYC38V0m73TEHuTegjCzVqe1fp5Uim
 Yh1GD5wxtVtWY5TMAJN0041HQPGd0FZohTnC8QhUV0hf17MfxH7hqy0bNOtphM/9VVNH
X-Received: by 2002:a05:6402:5113:b0:658:dbf:d1a0 with SMTP id
 4fb4d7f45d1cf-659841a2f31mr1582224a12.30.1770390372219; Fri, 06 Feb 2026
 07:06:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763725387.git.asml.silence@gmail.com>
 <12530de6d1907afb44be3e76e7668b935f1fd441.1763725387.git.asml.silence@gmail.com>
In-Reply-To: <12530de6d1907afb44be3e76e7668b935f1fd441.1763725387.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Fri, 6 Feb 2026 20:35:34 +0530
X-Gm-Features: AZwV_QhZUfBhtu2huNeoyo9GkYijd3hbyMiyHPwiXwArHA1o3azl0x64XYjc0yI
Message-ID: <CACzX3AuNL0g_VvxMSbUu185rvn97+NpZqOVj246-9q9hAVPa9g@mail.gmail.com>
Subject: Re: [RFC v2 04/11] block: introduce dma token backed bio type
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
	NEURAL_HAM(-0.00)[-0.903];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anuj1072538@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 29E35101480
X-Rspamd-Action: no action

> @@ -328,6 +328,29 @@ int bio_split_io_at(struct bio *bio, const struct queue_limits *lim,
>         unsigned nsegs = 0, bytes = 0, gaps = 0;
>         struct bvec_iter iter;
>
> +       if (bio_flagged(bio, BIO_DMA_TOKEN)) {
> +               int offset = offset_in_page(bio->bi_iter.bi_bvec_done);
> +
> +               nsegs = ALIGN(bio->bi_iter.bi_size + offset, PAGE_SIZE);
> +               nsegs >>= PAGE_SHIFT;
> +
> +               if (offset & lim->dma_alignment || bytes & len_align_mask)
> +                       return -EINVAL;

bytes == 0 is a dead check here. Probably you would like to check the
length of the first and last segment to match with what the normal path
below is doing.
