Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E214EBB78
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 09:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED48F10F291;
	Wed, 30 Mar 2022 07:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28DA10F28F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 07:09:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n63-20020a1c2742000000b0038d0c31db6eso2841309wmn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 00:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qiED4Qk72kYFMwtbD+Q9ldYh5qrdjiXwvR6z6T0AKC8=;
 b=LmMJKbmCwNNNOzUWk8XjIntZSWTp/GKc8Ib8H5z9XdbR3WfbB5BYB2ZdSk+BW6JkC2
 BmQJ4nBnu0nbARR63z3NR6U5aGfkiKPt3UGF10RvJycq6fgxJfOlbOWO4WPZyp0wgP2D
 JkiAGNFvUgFOQ3tMjObQTeD727Gv+ruD98anTYAzyiv2L+VKxSVbByX3iD4yUFZsZ5xP
 ii85ryFTK5GvUTetjlWqJnS6LP6OsoEHsLaxyqLPdr7iD8bIql7fgkWLkw4V2/NrpyZR
 38qBXG9o9QjHvYFHU+fy9ZXNbDPlGNhHDqcejSTlgs8oKPb4fv0ti1jL6AQLMY8vXtgr
 5i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qiED4Qk72kYFMwtbD+Q9ldYh5qrdjiXwvR6z6T0AKC8=;
 b=Ux/ZY0ENwlqcKnX6C3hBfwAbOKonB8Q4RcyDbxrPJ62YWRMALzNj797fAGjAFGeWBy
 1Sbrbo30EaWgxQur36KMGowbTsx8ecGoa5CBqY0tZ+woxH7R2a5d0Iz41KMibGZDjibs
 Ft8xyVegsRFTmlm5NCC86fFKIi0IViyu9GJLpQzSedYMcgsdWKW0MtpZPOt1BGFKd5+A
 f5GRPi18POOHZU4IPuQpw16+U0s4Pl5F53WW1RTzX/e5ySaQ8AkU4J35qjRT1bW1RE27
 oqNIY06qiUj9mvW7cPvsliWOP+u7XwLV8itOinpdURpF2udc2/5BtXw3zWLRU9lmq9LP
 NfWQ==
X-Gm-Message-State: AOAM531ySX/7K7ns1+lyRTeIFdHIkvpKiOB6Jmvk3uZ+xYJTw39KPjcI
 SPiyivObHuOwDSI5iE1nxRU=
X-Google-Smtp-Source: ABdhPJz5BEoqm+tnf5aMdPY22Psk9PtsaVfU4xJO3OsNPxofrQR0V6Ti0M/ctJ5lcktmKtXzRBTSxw==
X-Received: by 2002:a05:600c:5023:b0:38d:1261:aac6 with SMTP id
 n35-20020a05600c502300b0038d1261aac6mr3033337wmr.180.1648624156241; 
 Wed, 30 Mar 2022 00:09:16 -0700 (PDT)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 z18-20020adfec92000000b00203f04ed4a8sm16144206wrn.13.2022.03.30.00.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 00:09:15 -0700 (PDT)
Message-ID: <8af3d213-6cb7-a021-c198-e1bd37c47e7c@gmail.com>
Date: Wed, 30 Mar 2022 09:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Linaro-mm-sig] [PATCH next] dma-buf/sync-file: do not allow zero
 size allocations
Content-Language: en-US
To: Pavel Skripkin <paskripkin@gmail.com>, sumit.semwal@linaro.org,
 gustavo@padovan.org, christian.koenig@amd.com, daniel.vetter@ffwll.ch
References: <20220329221425.22691-1-paskripkin@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220329221425.22691-1-paskripkin@gmail.com>
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
Cc: linaro-mm-sig@lists.linaro.org,
 syzbot+5c943fe38e86d615cac2@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That problem is already fixed with patch 21d139d73f77 dma-buf/sync-file: 
fix logic error in new fence merge code.

Am 30.03.22 um 00:14 schrieb Pavel Skripkin:
> syzbot reported GPF in dma_fence_array_first(), which is caused by
> dereferencing ZERO_PTR in dma-buf internals.
>
> ZERO_PTR was generated in sync_file_merge(). This functuion tries to
> reduce allocation size, but does not check if it reducing to 0.

This is actually perfectly ok. The code above should have prevented the 
size to become 0.

Regards,
Christian.

>
> Fix reported bug by validating `index` value before passing it to
> krealloc_array().
>
> Fail log:
>
> general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] PREEMPT SMP KASAN
> KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
> CPU: 1 PID: 3595 Comm: syz-executor814 Not tainted 5.17.0-next-20220328-syzkaller #0
> ...
> RIP: 0010:dma_fence_array_first+0x78/0xb0 drivers/dma-buf/dma-fence-array.c:234
> ...
> Call Trace:
>   <TASK>
>   __dma_fence_unwrap_array include/linux/dma-fence-unwrap.h:42 [inline]
>   dma_fence_unwrap_first include/linux/dma-fence-unwrap.h:57 [inline]
>   sync_file_ioctl_fence_info drivers/dma-buf/sync_file.c:414 [inline]
>   sync_file_ioctl+0x248/0x22c0 drivers/dma-buf/sync_file.c:477
>   vfs_ioctl fs/ioctl.c:51 [inline]
>   __do_sys_ioctl fs/ioctl.c:870 [inline]
>
> There was same problem with initial kcalloc() allocation in same
> function, so it's fixed as well.
>
> Reported-and-tested-by: syzbot+5c943fe38e86d615cac2@syzkaller.appspotmail.com
> Fixes: 519f490db07e ("dma-buf/sync-file: fix warning about fence containers")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>   drivers/dma-buf/sync_file.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index b8dea4ec123b..aa744f017008 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -212,7 +212,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>   	dma_fence_unwrap_for_each(b_fence, &b_iter, b->fence)
>   		++num_fences;
>   
> -	if (num_fences > INT_MAX)
> +	if (num_fences > INT_MAX || !num_fences)
>   		goto err_free_sync_file;
>   
>   	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
> @@ -264,7 +264,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>   	if (index == 0)
>   		add_fence(fences, &index, dma_fence_get_stub());
>   
> -	if (num_fences > index) {
> +	if (index && num_fences > index) {
>   		struct dma_fence **tmp;
>   
>   		/* Keep going even when reducing the size failed */

