Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA0874B06F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4DF10E572;
	Fri,  7 Jul 2023 12:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B76E10E56A;
 Fri,  7 Jul 2023 12:06:05 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fbd33a573cso18662375e9.2; 
 Fri, 07 Jul 2023 05:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688731563; x=1691323563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tH97G+Fxd149166+beCWOCD5ViFyxxwWOzqhSE1eAxs=;
 b=S37w3T5x8iPoPRL9jBY9Vw0oUI4iUo3WRoFnN90M7EX/xmDWiK/g3V4QR195dCileI
 2vXJGN6rnUbkEn4dCEA1aGc4zUjq9cIPfk4mwyYlOEFaeJvwO78D9tsz4TtuVgX9qjkQ
 IMmIEsQmIL7DtGO7CLadF/md5tajF15uNE1m9AI/ITGx9j7OQ1Q1iK7k/7Oy2OZF5Q6O
 f+F1j/65W2U8ff+tYeTBdBdLXD58jSpMKZ2SCSM/37uWBA6v5CSbPCBNqqfNvd/itxWf
 6XkiJqga05O5cA5Faw8IvFDevaz/U5AcJuPm835nf6m6UjKCVmunPyQmukGah8LSysXc
 5T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688731563; x=1691323563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tH97G+Fxd149166+beCWOCD5ViFyxxwWOzqhSE1eAxs=;
 b=OlizBB7/s9pu9vOejwwyes0DrOZ7gu4YFK+OBdToAkSNmx1UX0/ql9fScmoe4b5iJm
 fybACXApFOVvCzNu/yPRpf9HiJwSwbJ/dQDNV/AJF23mkpkA09cBO+v9gLLXe6P+Kmrb
 +bLnkEQptBi6nz2toSaXn7zwuxgFowcEnuS+sbvhNIrceHTD8fMUR1hgEIyH2Xj6NJMw
 dK01nf13rCzXJK75SBa6O93pRk4YQrPSgD7AtTxSoUJTyCXvmxL0VEXGjN9PfoFR1/i2
 fbg2Udomwi4A8D+zACynW8Ljzkwf8AbhxRfXIY/4Zs5l0FNT5GsukvKsMSMAjVX6cQVp
 kj+Q==
X-Gm-Message-State: ABy/qLZdx8m8xo57DAkjSVu19Xz39axdaBYSktf0inlD7kp0W1IMIU4l
 fbluAp8BE7T3lGZM81B9F3Q=
X-Google-Smtp-Source: APBJJlEYPXKTYQwVJy0iq6CD8oFOltkS0xgL57Vly3zxxiNnAKXiBDY36s/W2TE4ioCtMYxBBbnPNA==
X-Received: by 2002:a7b:c84b:0:b0:3f4:27ff:7d48 with SMTP id
 c11-20020a7bc84b000000b003f427ff7d48mr2306345wml.19.1688731563183; 
 Fri, 07 Jul 2023 05:06:03 -0700 (PDT)
Received: from ?IPV6:2a00:e180:151d:fd00:ccd:1e13:686f:fcec?
 ([2a00:e180:151d:fd00:ccd:1e13:686f:fcec])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a05600c218e00b003fa96fe2bd9sm2283089wme.22.2023.07.07.05.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 05:06:02 -0700 (PDT)
Message-ID: <c13c9974-8903-904a-55a8-4065b43a437b@gmail.com>
Date: Fri, 7 Jul 2023 14:06:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH libdrm v2] amdgpu: Use PRI?64 to format uint64_t
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <8ffa3be3dc7b27345dde3bb32498c4cd3af050fa.1688632590.git.geert+renesas@glider.be>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <8ffa3be3dc7b27345dde3bb32498c4cd3af050fa.1688632590.git.geert+renesas@glider.be>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 06.07.23 um 10:36 schrieb Geert Uytterhoeven:
> On 32-bit:
>
>      ../tests/amdgpu/amdgpu_stress.c: In function ‘alloc_bo’:
>      ../tests/amdgpu/amdgpu_stress.c:178:49: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 4 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
>        fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x, size %lu\n",
>                                                     ~~^
>                                                     %llx
>         num_buffers++, addr, domain, size);
>                        ~~~~
>      ../tests/amdgpu/amdgpu_stress.c:178:72: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 6 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
>        fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x, size %lu\n",
>                                                                            ~~^
>                                                                            %llu
>         num_buffers++, addr, domain, size);
>                                      ~~~~
>      ../tests/amdgpu/amdgpu_stress.c: In function ‘submit_ib’:
>      ../tests/amdgpu/amdgpu_stress.c:276:54: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 5 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
>        fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %lu bytes took %lu usec\n",
>                                                          ~~^
>                                                          %llx
>         count, from, virtual[from], to, virtual[to], copied, delta / 1000);
>                      ~~~~~~~~~~~~~
>      ../tests/amdgpu/amdgpu_stress.c:276:65: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 7 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
>        fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %lu bytes took %lu usec\n",
>                                                                     ~~^
>                                                                     %llx
>         count, from, virtual[from], to, virtual[to], copied, delta / 1000);
>                                         ~~~~~~~~~~~
>      ../tests/amdgpu/amdgpu_stress.c:276:70: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 8 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
>        fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %lu bytes took %lu usec\n",
>                                                                          ~~^
>                                                                          %llu
>         count, from, virtual[from], to, virtual[to], copied, delta / 1000);
>                                                      ~~~~~~
>      ../tests/amdgpu/amdgpu_stress.c:276:85: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 9 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
>        fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %lu bytes took %lu usec\n",
>                                                                                         ~~^
>                                                                                         %llu
>         count, from, virtual[from], to, virtual[to], copied, delta / 1000);
>                                                              ~~~~~~~~~~~~
>      ../tests/amdgpu/amdgpu_stress.c: In function ‘parse_size’:
>      ../tests/amdgpu/amdgpu_stress.c:296:24: warning: format ‘%li’ expects argument of type ‘long int *’, but argument 3 has type ‘uint64_t *’ {aka ‘long long unsigned int *’} [-Wformat=]
>        if (sscanf(optarg, "%li%1[kmgKMG]", &size, ext) < 1) {
>                            ~~^             ~~~~~
>                            %lli
>      ../tests/amdgpu/amdgpu_stress.c: In function ‘main’:
>      ../tests/amdgpu/amdgpu_stress.c:378:45: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
>           fprintf(stderr, "Buffer size to small %lu\n", size);
>                                                 ~~^     ~~~~
>                                                 %llu
>
> Fix this by using the proper "PRI?64" format specifiers.
>
> Fixes: d77ccdf3ba6f5a39 ("amdgpu: add amdgpu_stress utility v2")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Well generally good patch, but libdrm changes are now reviewed by merge 
request and not on the mailing list any more.

Regards,
Christian.

> ---
> On Linux/amd64, the format strings in the resulting binary are
> unchanged.
>
> v2:
>    - Use PRI?64 to unbreak 64-bit build.
> ---
>   tests/amdgpu/amdgpu_stress.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tests/amdgpu/amdgpu_stress.c b/tests/amdgpu/amdgpu_stress.c
> index 5c5c88c5be985eb6..f919351e1f17d70b 100644
> --- a/tests/amdgpu/amdgpu_stress.c
> +++ b/tests/amdgpu/amdgpu_stress.c
> @@ -30,6 +30,7 @@
>   #include <errno.h>
>   #include <unistd.h>
>   #include <stdlib.h>
> +#include <inttypes.h>
>   
>   #include "drm.h"
>   #include "xf86drmMode.h"
> @@ -175,7 +176,7 @@ int alloc_bo(uint32_t domain, uint64_t size)
>   
>   	resources[num_buffers] = bo;
>   	virtual[num_buffers] = addr;
> -	fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x, size %lu\n",
> +	fprintf(stdout, "Allocated BO number %u at 0x%" PRIx64 ", domain 0x%x, size %" PRIu64 "\n",
>   		num_buffers++, addr, domain, size);
>   	return 0;
>   }
> @@ -273,7 +274,7 @@ int submit_ib(uint32_t from, uint32_t to, uint64_t size, uint32_t count)
>   	delta = stop.tv_nsec + stop.tv_sec * 1000000000UL;
>   	delta -= start.tv_nsec + start.tv_sec * 1000000000UL;
>   
> -	fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %lu bytes took %lu usec\n",
> +	fprintf(stdout, "Submitted %u IBs to copy from %u(%" PRIx64 ") to %u(%" PRIx64 ") %" PRIu64 " bytes took %" PRIu64 " usec\n",
>   		count, from, virtual[from], to, virtual[to], copied, delta / 1000);
>   	return 0;
>   }
> @@ -293,7 +294,7 @@ uint64_t parse_size(void)
>   	char ext[2];
>   
>   	ext[0] = 0;
> -	if (sscanf(optarg, "%li%1[kmgKMG]", &size, ext) < 1) {
> +	if (sscanf(optarg, "%" PRIi64 "%1[kmgKMG]", &size, ext) < 1) {
>   		fprintf(stderr, "Can't parse size arg: %s\n", optarg);
>   		exit(EXIT_FAILURE);
>   	}
> @@ -375,7 +376,7 @@ int main(int argc, char **argv)
>   			next_arg(argc, argv, "Missing buffer size");
>   			size = parse_size();
>   			if (size < getpagesize()) {
> -				fprintf(stderr, "Buffer size to small %lu\n", size);
> +				fprintf(stderr, "Buffer size to small %" PRIu64 "\n", size);
>   				exit(EXIT_FAILURE);
>   			}
>   			r = alloc_bo(domain, size);

