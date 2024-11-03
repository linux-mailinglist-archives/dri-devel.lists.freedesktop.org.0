Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF29BAE92
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 09:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F5610E392;
	Mon,  4 Nov 2024 08:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jIPJQErn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535FD10E294
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 20:04:43 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so566878966b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Nov 2024 12:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730664282; x=1731269082; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ed1fUs9cipLw4D2Cdk2KunVDPlAIArUaJR4k7ylfCoc=;
 b=jIPJQErnUMJ/MgC0LojLdVrytGbHC0futEi6Qz6n5c0b3nnyXtDudE5NDHi+EdIFaE
 RXJ7IRAXpJ3cf3yaQBehsuMmmlHq5EN99nKvczZJgVvrU4jsUpEAfrnmV+qojH6WWjLh
 udXZJNAP/OgiLg6zHO6qxUGU0xVIEjyXDmSKn2CosUnEf4y8lh0p+fP7aidPHgoDTC/L
 oW7k1Qmc6L50q51INAJGXP+HKcmIgyuKlolRhLueXfJzbIDrLxaRvfWen6+BYhp4qgAp
 dW1sP7WRGiBFFhuPicyGPPVtbyuMjBsISJLicMPPfDZlFEmRhkHoQsHYfRSs1zsdG9tx
 CKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730664282; x=1731269082;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ed1fUs9cipLw4D2Cdk2KunVDPlAIArUaJR4k7ylfCoc=;
 b=wUhfUuwZHplcWOsg33OGZzOam3Bixc/+EXVEXLFCpHzHRX8Uubrv+sabieyOSw5I33
 1Q9ujHLnvfZIsCL2nVras6+H6r5acLdGJueqjuLDbV0f2YuM0WKxYQt+DzW6d2Ue4TUy
 6KMb79of45ACC7agcOqEpk2L+ZRWGuh7hvxzI/aioYBxXeoKJsnSoiYgNXBjb0ufgj6M
 sRSBt0AmnskTQGVWBj02IeulTmvzRTbih8pTBom3SlcjRblIMdEDyMOnt1R/+33bPgJ6
 mdR+zYnn/c78OlsLAm+btsm6MzmquZyREUEImXUJS17Rwc4VUiZldgSNjYyIL1syzmJl
 iDjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQWTllJC0W37GpAVMKmn/v8bbC40BfiMGiZ5N7ScWNGj31Hp11QB5rKLK+FjnuTLdE2n0SXTqEbJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/IEqGRgGJILQqaKUOxCLkCKgPHJ0Min+480ilXIVZrcnW6/LH
 D3catTRpI+2WJ0RQsAL6ett6m5KYTdVd0cowc/E5HzDPcjCLacvGLVXNDDXkS5F7IaKvY+MGpOu
 AMOPDDbKLfd28LTmxNqre8R45kBg=
X-Google-Smtp-Source: AGHT+IGvMeMZZG5WnvX923vw8VNvJWy6oEdmgmCRS89qoZP6PnjmWLuG26fUriBqj/Om2jcfxIJqkPNPiqQApr3B5Iw=
X-Received: by 2002:a17:907:6d17:b0:a99:fd2c:4f06 with SMTP id
 a640c23a62f3a-a9e50ca30f3mr1506324966b.65.1730664281457; Sun, 03 Nov 2024
 12:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20241101235453.63380-1-alexei.starovoitov@gmail.com>
 <20241101235453.63380-3-alexei.starovoitov@gmail.com>
In-Reply-To: <20241101235453.63380-3-alexei.starovoitov@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sun, 3 Nov 2024 14:04:05 -0600
Message-ID: <CAP01T76dWp7=Ci5o=PLfv-4nA_DPxwCxoGeeJzAUbi5F6WJ4Lg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf: Switch bpf arena to use drm_mm instead
 of maple_tree
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 kernel-team@fb.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 04 Nov 2024 08:51:53 +0000
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

On Fri, 1 Nov 2024 at 18:55, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> From: Alexei Starovoitov <ast@kernel.org>
>
> bpf arena is moving towards non-sleepable allocations in tracing
> context while maple_tree does kmalloc/kfree deep inside. Hence switch
> bpf arena to drm_mm algorithm that works with externally provided
> drm_mm_node-s. This patch kmalloc/kfree-s drm_mm_node-s, but the next
> patch will switch to bpf_mem_alloc and preallocated drm_mm_node-s.
>
> Signed-off-by: Alexei Starovoitov <ast@kernel.org>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
