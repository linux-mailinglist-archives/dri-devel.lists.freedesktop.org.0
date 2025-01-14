Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D15A10B2A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 16:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC8810E3B8;
	Tue, 14 Jan 2025 15:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YV67hLS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD0F10E3B8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736869292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xqmc4JqRCRjuTXMj6uCnUXvyXgljI74YchgEbr0/MWI=;
 b=YV67hLS0TnvRBwKYppCVaFlbj/0ckKxgMAcBIIJpB/Sn2G87CY6dj7aftntSAN8djLO1re
 SSbH92Fhd9pGBSSd4zn9leaRCTOg3Odo5Y9GA5EiY4MiAKCRp6jBdeUnXHzL9Qm4cjU1QT
 /3IPVTsYlKmoVe9128t4qzqtb2vZXZo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-xqKF3Fy0P1Sa5HrLwTQ0kQ-1; Tue, 14 Jan 2025 10:41:30 -0500
X-MC-Unique: xqKF3Fy0P1Sa5HrLwTQ0kQ-1
X-Mimecast-MFC-AGG-ID: xqKF3Fy0P1Sa5HrLwTQ0kQ
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7b6eeef7cb8so845188285a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 07:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736869290; x=1737474090;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xqmc4JqRCRjuTXMj6uCnUXvyXgljI74YchgEbr0/MWI=;
 b=DXOhpyqJXP7orbyhkucAhODxY2Ok7D2kDE63wpi3xBxEaC6sh2tmBnnlTz8wrfMC+1
 su01XbGlr2zGlXwMM7m0oL8/ovDNJno8XgNyvwFsLgUiebjzXyDjgpP2hfFXMWW0WH7D
 9AF2RGPs1ha0LfJXeaJJfyipuRHRXmwAE1f1QftWEDmLzUQP7eobXaICMChoZW8h81Ol
 bCZZ90cdeqPqwlS0P+OGwkJdJTHLiCEKN6Xkd4tuTeHp2wK+sfsbBDZg7FLDN9QVKoYm
 +n7qICvEjG6A7FFW3TxOf5inkdF3f/gbLp6TfblgeAG29uMIbWNDgzMSPmBAGj6xCBXi
 ykRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDMfAv/bfci1J5xnxRCsFoD7U6W2SAqsRTkIM7oYbZ24d6O105WVC8opcmNbCtQuiJY4bITlJdwyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWZVLYx5e5xdRZ9znA3C5egvyKBOPWt7UJVNaLcY31uhg35gfA
 rNf9F8lRyKo4oIaY8RsjxcbbjBd2IaokOBMq4seKM7UC6s0NirTTYjACzu2pKJMWTpDEtffhvIk
 W7kClPGq4ujhbsGdZgc/ZPDSHNl9Ja4x0oiKgGjTpnPnVrNwgwZzbzxUvYYxLECGW4w==
X-Gm-Gg: ASbGncvtNYbPGMmesIgmPFce98zkuNy4IqvYM4VGu9Ro6qQelREzrpOr5v75y9OpZws
 t1izUMkmTN/5JTJq+Ml0uEfaoiLBFgbjA6TJiIErf5ChyvkBc2BAl7osD68sxUMPegSVFp4cqqj
 CZhN99VYTfnVivDUTnez7FD6g4htwCEgyQqGCZ7mBMKWcdE3UlvZ8YjXZ2qOJH16ZcyI2hwSN1e
 EsMf/fBc3RXLxB38Z65/NOz6bU5vBxG4EAWpGvgRkX01wn0vtnP0qTRLwI/7VtiZ9anODwMprCz
 r/0I7//iRKa5vBGjgAjsXkm5
X-Received: by 2002:a05:620a:404b:b0:7b6:eab3:cdd4 with SMTP id
 af79cd13be357-7bcd97705fcmr3971956785a.50.1736869290300; 
 Tue, 14 Jan 2025 07:41:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoF8KflFQkBU1z1CPRdQUSNcytu3l6aQTRzFXvRsUMgy6cBmJFQ96jGR481AFHGK/TUIo9Gg==
X-Received: by 2002:a05:620a:404b:b0:7b6:eab3:cdd4 with SMTP id
 af79cd13be357-7bcd97705fcmr3971953385a.50.1736869289999; 
 Tue, 14 Jan 2025 07:41:29 -0800 (PST)
Received: from ?IPV6:2601:188:ca00:a00:f844:fad5:7984:7bd7?
 ([2601:188:ca00:a00:f844:fad5:7984:7bd7])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7bce327b8a0sm615290685a.60.2025.01.14.07.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 07:41:29 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <f502ee68-7743-48c6-9024-83431265a6b8@redhat.com>
Date: Tue, 14 Jan 2025 10:41:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] kernel/cgroup: Remove the unused variable climit
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, tj@kernel.org
Cc: hannes@cmpxchg.org, mkoutny@suse.com, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20250114062804.5092-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20250114062804.5092-1-jiapeng.chong@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tDQsk8ng4jQA4t7hF1l4c9NCQC9drBOBzI6oezwRehM_1736869290
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 1/14/25 1:28 AM, Jiapeng Chong wrote:
> Variable climit is not effectively used, so delete it.
>
> kernel/cgroup/dmem.c:302:23: warning: variable ‘climit’ set but not used.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=13512
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   kernel/cgroup/dmem.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
> index 52736ef0ccf2..78d9361ed521 100644
> --- a/kernel/cgroup/dmem.c
> +++ b/kernel/cgroup/dmem.c
> @@ -299,7 +299,7 @@ bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *limit_pool,
>   				      bool ignore_low, bool *ret_hit_low)
>   {
>   	struct dmem_cgroup_pool_state *pool = test_pool;
> -	struct page_counter *climit, *ctest;
> +	struct page_counter *ctest;
>   	u64 used, min, low;
>   
>   	/* Can always evict from current pool, despite limits */
> @@ -324,7 +324,6 @@ bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *limit_pool,
>   			{}
>   	}
>   
> -	climit = &limit_pool->cnt;
>   	ctest = &test_pool->cnt;
>   
>   	dmem_cgroup_calculate_protection(limit_pool, test_pool);

The dmem controller is actually pulled into the drm tree at the moment.

cc relevant parties on how to handle this fix commit.

Cheers,
Longman

