Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90377A6366B
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 17:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DE310E17A;
	Sun, 16 Mar 2025 16:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RuwQTQhg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67DA10E17A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 16:41:14 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4393ee912e1so45025e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 09:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1742143273; x=1742748073;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7GBF4hrYNg5S2oageJXSHFRedLtcB0fhaX79E6KBaak=;
 b=RuwQTQhgx+FF2EWAXj27v0TY6RmuAKH0xDYd5qYkr7tjV2jmr+m7Zxg/1w2FQK8ihY
 Tj9IghW6ZjWGFO0NqBTFUg5qYjkMWD9NZJy8/KLlpTy2jrCzkuV8ho/zX+2wup03XSsD
 t2VK9/Qf0LiySD/iWertrYnaN32jLvhC6AMCogumcXf1DvyUC0CVNWg/oCKEMvq/Cjzp
 hi9MKuXmoUdpJ+mViu6blAVyKHC8X0A/YV9JDVH4y8ERV7zk0uCEBCffo+qEIEYzBqro
 k4C+YTbRmk550ox2JRmKr74JV/8SRGEujONffxeu/eIHIQOFSdWvIPcxculOS3t5sakW
 MFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742143273; x=1742748073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7GBF4hrYNg5S2oageJXSHFRedLtcB0fhaX79E6KBaak=;
 b=YoJvE2fybw/jKZ8TYUb7S0ghMNmOXPiPPeBhg4aBk6FZcqyuIHrK5YXv8f0m90ahVG
 uJq0uSh8wlZz4lB9XS5Ei6VZhnbnQQmblYeb/pNfwpRmhecS4b212i0kzqUU84D4mM0z
 onAIKSPUyISsqwHoRGfWKjpezHiMj1hxy4g6C+vLFLuFmhcKQ6dU+H+kQff3tY1Z0Etr
 9UXUNEPvmwczzE7rXbNPTfda6ISw9hHxr42aBrugp3iwBvSuDD7ssPiuV8Dsdemsfjnm
 UDd2hw6R/HfQY2IIZ7s77mL9ADGYCQ7dl2X+HEv7t18/3ZeUdPDsuLVRPOgxKabDBMvL
 uA/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnr5jFGQK2BTMhs45L7KRBuiALmEcKWV8ga2USy51Y7Lcrz9QeYiR7tlsy/E1AFVgDTYYSDpZNJEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9fY6/o52tT9c7ExPYRvSZsCInx+xAk32xVS8l5L7R1X3rrwHp
 OflHYLShCRnY1HCqKlZH9EkCWlZh4qZwfPi7i8Bsm3Sh1DpO9zxjN6vgrVlbySpHLsOF6Eh3FLA
 A09as4Ley4iXMZNyafk3/Wz92P6SVTIjhvoXq
X-Gm-Gg: ASbGncswbkf8pQie8DuFaAidqToARY644q/N+UAY5Ijg3yEWTMzgYf4PLogsIaLyw6m
 MF8t8i+ZqaNnfr//L6SuZzKu4VHnIrqMU1DynKQp0gujeuVULa604cgcg7kt+rJh5h31f7/+Axq
 7DALENjEUzCzjpIY+6SAx+0pOK
X-Google-Smtp-Source: AGHT+IF01D4Ob7pcCq8yAjLqxY9BCY5mwz1iWe7tPkMuZuzOjPrqhF7cEGLklDlZvCaLJveOXlkJJNWEbV8nPmuKJPg=
X-Received: by 2002:a05:600d:14:b0:43b:df25:8c4 with SMTP id
 5b1f17b1804b1-43d251f360emr1754805e9.4.1742143273244; Sun, 16 Mar 2025
 09:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250315130201758KxKWj6Mb7bgN6SqVrzu94@zte.com.cn>
In-Reply-To: <20250315130201758KxKWj6Mb7bgN6SqVrzu94@zte.com.cn>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Sun, 16 Mar 2025 09:41:01 -0700
X-Gm-Features: AQ5f1JouN29fy-ISQChV-CR0419-uR30-ym4OBM0CsdHXmZK3sOodPrtzjtePzw
Message-ID: <CABdmKX02xw+bDiW9ruXO+nLtDdidQsfKOp-N7NgvACHKyYq8xw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Replace nested max() with single max3()
To: feng.wei8@zte.com.cn
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
 brian.starkey@arm.com, jstultz@google.com, christian.koenig@amd.com, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Mar 14, 2025 at 10:02=E2=80=AFPM <feng.wei8@zte.com.cn> wrote:
>
> From: FengWei <feng.wei8@zte.com.cn>
>
> Use max3() macro instead of nesting max() to simplify the return
> statement.
>
> Signed-off-by: FengWei <feng.wei8@zte.com.cn>

The commit subject should include "dma-buf: heaps:" as a prefix.

With that:
Reviewed-by: T.J. Mercier <tjmercier@google.com>

> ---
>  drivers/dma-buf/dma-heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 3cbe87d4a464..96cb9ab5731a 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -147,7 +147,7 @@ static long dma_heap_ioctl(struct file *file, unsigne=
d int ucmd,
>                 in_size =3D 0;
>         if ((ucmd & kcmd & IOC_OUT) =3D=3D 0)
>                 out_size =3D 0;
> -       ksize =3D max(max(in_size, out_size), drv_size);
> +       ksize =3D max3(in_size, out_size, drv_size);
>
>         /* If necessary, allocate buffer for ioctl argument */
>         if (ksize > sizeof(stack_kdata)) {
> --
> 2.25.1
