Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4387373DC24
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 12:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3D810E09A;
	Mon, 26 Jun 2023 10:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A771110E09A;
 Mon, 26 Jun 2023 10:21:41 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b69ed7d050so14864821fa.2; 
 Mon, 26 Jun 2023 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687774899; x=1690366899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HeacIq0iGBmlMTVQdsWhJFRPflCyuB9lhDlBAARX9pM=;
 b=MU0bhlG+BLyjbACqov3lAaQ+x/BLQbwWuoLQXFBcrNlTaUiR/oJWoe7If8mNFbrM/a
 KvMV6iQ3ndKT2Suyh/cxeNu4v3aqi07XLFg0oFMSxlyKzitdS4c7H/9KvIkBKskwaP++
 ilkzuD9jrM8gIYUops8xBUT2pJSAYAxUNkIGqHiqMACIbaTvGUD7kzZgilU+NqtJr6qq
 ka8nNQC5CnSkSDCOmFbAoCy0/PBwsreflYYQR35R/SB7KRmRgubkBQ+zAT8WjkkBQy3/
 8fLLCI1ltpyhICG2SNJvoDhiXlp5Yl7PaGueJEIDk/DFKvKBJ9bPfkf/9Ju5D8fRqaXZ
 1p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687774899; x=1690366899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HeacIq0iGBmlMTVQdsWhJFRPflCyuB9lhDlBAARX9pM=;
 b=htdjhWiJJedxIkgN/BcmA+9KlG4EBMXK4iyQvIBZdzjhg4ve9FmSplXScRf3XO1Q9C
 Wacp778+LVxTYldBwEb5oYdYh9Is3Yk0a4FV6z9rcfY17nw0wOiQGtiCb3WR9GFtyXjP
 07vmiV5FrB0iICvBnSmfG4rURhiEayWJO66xN/F0gb8/PYZN8tLHRdOw4ysq++56YQhz
 GCrrUNSFuI/GnsYMp+QQTwcJ3isOBU2MgOXh0M0kevJtC2+Zt43Itx1msIUqdM9o2N29
 APGc4+rmVE7UzzIzdg5QSl83R2cJFKGGasBDA48ZOAitrKJrMrROWvcxV/LmftAsAVkY
 blhw==
X-Gm-Message-State: AC+VfDwNcd4zAA7bDpbGiP7lKRh+aHUxbZghXh1s8wzMAhxLPriStLsJ
 jLT6WIh+o8pKg8tyElETbxG/WHZxupE=
X-Google-Smtp-Source: ACHHUZ4FJTWxVTLMoTaqDFVe37vxY6VWwgHI7xhOcZo5HF8sUgxfA4+6g6TYMz7Wt/q2BtpA2MneDw==
X-Received: by 2002:a2e:8088:0:b0:2b4:7f66:8c85 with SMTP id
 i8-20020a2e8088000000b002b47f668c85mr13594865ljg.48.1687774898695; 
 Mon, 26 Jun 2023 03:21:38 -0700 (PDT)
Received: from ?IPV6:2a00:e180:158d:7600:d62f:c4fb:6eee:7b87?
 ([2a00:e180:158d:7600:d62f:c4fb:6eee:7b87])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a50ef0a000000b0051d8f9ec3basm2024177eds.15.2023.06.26.03.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 03:21:38 -0700 (PDT)
Message-ID: <dd54ed9e-b548-67a9-4998-b969b6d888a4@gmail.com>
Date: Mon, 26 Jun 2023 12:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/4] drm/ttm: Fix ttm_lru_bulk_move_pos_tail()
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230626091450.14757-1-thomas.hellstrom@linux.intel.com>
 <20230626091450.14757-2-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230626091450.14757-2-thomas.hellstrom@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've already pushed the version from Teddy to drm-misc-fixes last week.

So no need for that one any more.

Christian.

Am 26.06.23 um 11:14 schrieb Thomas Hellström:
> The value of pos->first was not updated when the first resource of the
> range was moved. This could lead to errors like the one below.
> Fix this by updating pos->first when needed.
>
> <3> [218.963342] BUG: KASAN: null-ptr-deref in ttm_lru_bulk_move_del+0xc5/0x180 [ttm]
> <3> [218.963456] Read of size 8 at addr 0000000000000038 by task xe_evict/1529
> <3> [218.963546]
> <3> [218.963566] CPU: 0 PID: 1529 Comm: xe_evict Not tainted 6.3.0-xe #1
> <3> [218.963664] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake H DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.4064.A00.2102041619 02/04/2021
> <3> [218.963841] Call Trace:
> <3> [218.963881]  <TASK>
> <3> [218.963915]  dump_stack_lvl+0x64/0xb0
> <3> [218.963976]  print_report+0x3e5/0x600
> <3> [218.964036]  ? ttm_lru_bulk_move_del+0xc5/0x180 [ttm]
> <3> [218.964127]  kasan_report+0x96/0xc0
> <3> [218.964183]  ? ttm_lru_bulk_move_del+0xc5/0x180 [ttm]
> <3> [218.964276]  ttm_lru_bulk_move_del+0xc5/0x180 [ttm]
> <3> [218.964365]  ttm_bo_set_bulk_move+0x92/0x140 [ttm]
> <3> [218.964454]  xe_gem_object_close+0xc8/0x120 [xe]
> <3> [218.964675]  ? __pfx_xe_gem_object_close+0x10/0x10 [xe]
> <3> [218.964908]  ? drm_gem_object_handle_put_unlocked+0xc7/0x170 [drm]
> <3> [218.965071]  drm_gem_object_release_handle+0x45/0x80 [drm]
> <3> [218.965220]  ? __pfx_drm_gem_object_release_handle+0x10/0x10 [drm]
> <3> [218.965381]  idr_for_each+0xc9/0x180
> <3> [218.965437]  ? __pfx_idr_for_each+0x10/0x10
> <3> [218.965504]  drm_gem_release+0x20/0x30 [drm]
> <3> [218.965637]  drm_file_free.part.0+0x4cb/0x4f0 [drm]
> <3> [218.965778]  ? drm_close_helper.isra.0+0xb7/0xe0 [drm]
> <3> [218.965921]  drm_release_noglobal+0x49/0x90 [drm]
> <3> [218.966061]  __fput+0x122/0x450
> <3> [218.966115]  task_work_run+0xfe/0x190
> <3> [218.966175]  ? __pfx_task_work_run+0x10/0x10
> <3> [218.966239]  ? do_raw_spin_unlock+0xa7/0x140
> <3> [218.966308]  do_exit+0x55f/0x1430
> <3> [218.966364]  ? __pfx_lock_release+0x10/0x10
> <3> [218.966431]  ? do_raw_spin_lock+0x11d/0x1e0
> <3> [218.966498]  ? __pfx_do_exit+0x10/0x10
> <3> [218.966554]  ? __pfx_do_raw_spin_lock+0x10/0x10
> <3> [218.966625]  ? mark_held_locks+0x24/0x90
> <3> [218.966688]  ? lockdep_hardirqs_on_prepare+0x136/0x210
> <3> [218.966768]  do_group_exit+0x68/0x110
> <3> [218.966828]  __x64_sys_exit_group+0x2c/0x30
> <3> [218.966896]  do_syscall_64+0x3c/0x90
> <3> [218.966955]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> <3> [218.967035] RIP: 0033:0x7f77b194f146
> <3> [218.967094] Code: Unable to access opcode bytes at 0x7f77b194f11c.
> <3> [218.967174] RSP: 002b:00007ffc64791188 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> <3> [218.967271] RAX: ffffffffffffffda RBX: 00007f77b1a548a0 RCX: 00007f77b194f146
> <3> [218.967364] RDX: 0000000000000062 RSI: 000000000000003c RDI: 0000000000000062
> <3> [218.967458] RBP: 0000000000000062 R08: 00000000000000e7 R09: ffffffffffffff78
> <3> [218.967553] R10: 0000000000000058 R11: 0000000000000246 R12: 00007f77b1a548a0
> <3> [218.967648] R13: 0000000000000003 R14: 00007f77b1a5d2e8 R15: 0000000000000000
> <3> [218.967745]  </TASK>
>
> Fixes: fee2ede15542 ("drm/ttm: rework bulk move handling v5")
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.19+
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/411
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_resource.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 7333f7a87a2f..cb05e0a36576 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -86,6 +86,8 @@ static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
>   				       struct ttm_resource *res)
>   {
>   	if (pos->last != res) {
> +		if (pos->first == res)
> +			pos->first = list_next_entry(res, lru);
>   		list_move(&res->lru, &pos->last->lru);
>   		pos->last = res;
>   	}

