Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919735E9D99
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 11:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4C410E352;
	Mon, 26 Sep 2022 09:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFD210E352
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 09:29:26 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id x21so8116305edd.11
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=RRTzEh4eX7QJuMr9PBYcSE6qe2YnKNQ4s+EeI3ZLOR8=;
 b=N2CdQZ5DidOd7rXorrAHwsU7REyGYjsVLRQw24k5i/zVnwxTVLXi79SokmwMPQ23dG
 ltHADiZ2Xdl1ZpGJHcq9sCz91HuEiXsn5cgUkN6cCcc0qhs3gJdO6JtWSNxOVKAm2maA
 RUP45w5trMH4BmzGD7P4bYWDoQ80fJ5gk/tTcqUWNZwxEVqilkjzRE/DXJj2o9eLrnMT
 Eibb/G/CFzTjUYyiTkzjs9+xpKaddZrQr2Ady4gPnOt6q/+8sfnBsKlTNnNA0nWB58c5
 OZTJtHQ5pIa7jnF722Q6qFBJveO3Wd9eH06jY4XW0T30bgmjP4abl+o8prFN+WFIDcbp
 QH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=RRTzEh4eX7QJuMr9PBYcSE6qe2YnKNQ4s+EeI3ZLOR8=;
 b=jSA+sKifuy9okE1mduic/uDwj8zyzZVwnSkpUu+EFO4DzCL1nsikqed7KPFNF0fCCn
 ky15z4+P7++RKhyCNKg/f3Q19UR4cNQYUFFrDd+J5pQDtu6hk92lzXS3mgqUxmf1kEu5
 HXB/FCQ8eqWoBoEblRmSQuM/SfZQ+q8Zx9MSS0OUtf7OANJNK6O4IwbJOmxTfn9mim1j
 w34Diq+PX+OX+vZdn+nPqvKgMWhdOUOCI7EYj3G12steJX3vviqBlqiNvCaXgBcWmGwK
 GF9ESEbgJdImpzjbtMJIEiK8OpFsnVEOB1nlMHrYeNPNhaFUyCr4fHcjLAeM2eylr9dT
 4MXA==
X-Gm-Message-State: ACrzQf2jqsEu+Ms+JAPkvZMEHNvE2d0w70nHFg8+xDZt1S9NzPym5hKB
 P1USuMfr064UWD9mc+xAiog=
X-Google-Smtp-Source: AMsMyM7SuVBgSYWy5kh1HhAcVXy6Llss6obNUjIA/ZoXJgkE8T8RGaoTb9VPoRu5QX3Pg6i6kN2O6A==
X-Received: by 2002:a05:6402:2489:b0:454:11de:7698 with SMTP id
 q9-20020a056402248900b0045411de7698mr21490387eda.214.1664184564514; 
 Mon, 26 Sep 2022 02:29:24 -0700 (PDT)
Received: from [192.168.178.21] (p4fc20ebf.dip0.t-ipconnect.de.
 [79.194.14.191]) by smtp.gmail.com with ESMTPSA id
 lh3-20020a170906f8c300b00782ee6b34f2sm3710039ejb.183.2022.09.26.02.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 02:29:24 -0700 (PDT)
Message-ID: <a07c4a5e-1668-3609-334c-8aee2834ff90@gmail.com>
Date: Mon, 26 Sep 2022 11:29:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] [PATCH v2 08/16] dma-buf: Proactively round up to
 kmalloc bucket size
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Vlastimil Babka <vbabka@suse.cz>
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-9-keescook@chromium.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220923202822.2667581-9-keescook@chromium.org>
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, Eric Dumazet <edumazet@google.com>,
 linux-hardening@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Christoph Lameter <cl@linux.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Oj eda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Yonghong Song <yhs@fb.com>,
 David Sterba <dsterba@suse.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Alex Elder <elder@kernel.org>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.09.22 um 22:28 schrieb Kees Cook:
> Instead of discovering the kmalloc bucket size _after_ allocation, round
> up proactively so the allocation is explicitly made for the full size,
> allowing the compiler to correctly reason about the resulting size of
> the buffer through the existing __alloc_size() hint.
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-resv.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 205acb2c744d..5b0a4b8830ff 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -98,12 +98,17 @@ static void dma_resv_list_set(struct dma_resv_list *list,
>   static struct dma_resv_list *dma_resv_list_alloc(unsigned int max_fences)
>   {
>   	struct dma_resv_list *list;
> +	size_t size;
>   
> -	list = kmalloc(struct_size(list, table, max_fences), GFP_KERNEL);
> +	/* Round up to the next kmalloc bucket size. */
> +	size = kmalloc_size_roundup(struct_size(list, table, max_fences));
> +
> +	list = kmalloc(size, GFP_KERNEL);
>   	if (!list)
>   		return NULL;
>   
> -	list->max_fences = (ksize(list) - offsetof(typeof(*list), table)) /
> +	/* Given the resulting bucket size, recalculated max_fences. */
> +	list->max_fences = (size - offsetof(typeof(*list), table)) /
>   		sizeof(*list->table);
>   
>   	return list;

