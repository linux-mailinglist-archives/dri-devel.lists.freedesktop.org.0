Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A010C3C7165
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 15:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AF26E0A6;
	Tue, 13 Jul 2021 13:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65506E098
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:44:54 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id t17so50409585lfq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 06:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A9GCE1XyokBjHqSgBA/iJEz3drr7IdUuNv0RdsnzLeE=;
 b=EqpBeNlnm4ViPyJwMUgvpLbBGimxy8xUkaxEZarGaWkEXICuUxFFVTvA+wNN/nvEn6
 pgVxHY/63YMpCOFYGKlNZGhhOhRcTKpfiPpmLretPtpO6zu2QV1/4l2yP4QL0ruMFIDX
 6sFSCpc9GeIPsOLFoAb8fuv15fponjyWlCeKQQAsvZ9bJXtvqhhlls4bT3KoRUV4OJX0
 L9CujbEumsmiCetHoMatkDpyaxIt5iOPMCSsJ4LMdsaztrwyJAvPL3AC6oMMA+3ktx9I
 LnugzSh7/SCUe49vfiS+QYKv1GB7FZBy3flf7gn4TtC3NQ271reHq5tX+VBZpE5pUW7r
 uOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9GCE1XyokBjHqSgBA/iJEz3drr7IdUuNv0RdsnzLeE=;
 b=oStf6NV6fI+M5bgoYmtf6x7U3Dm0JgzmnWIOJiDtc/O7eeu9lJqhRV0Gi54lN1PCh5
 TJHmLcXw3kz984JKpNSzN/RG/S1yebZbBesS4vG3u+CK1JvtEsGDB2RpKUqVxwB+dh1I
 rtQHVQ4M6JAGNUZj2VVn8ZwiZnMSN16CojwZoVlN39+ZKGbYd6kHVZSP7/YxbN1ePu4T
 nfxotaGaQ5F/I6dEBGVwsf2cnGLR9+beRM+bnHxE3qqB3GS6DU+Nzjz6jl9fR9vhpeVh
 IYN64Cm6dT/ftrSh1aUBlUNGXPPI7vc5JDH3z/y0/7FI+i1jRDfjKXUkdUmPXweJzZCW
 S/Aw==
X-Gm-Message-State: AOAM531vL7epB9ZQ4Lf5cVffTwP9FKbHOQQNJ9BuQ7H8QoddjlZ6yTc2
 f8v+wfi+YSD7FkP4HJW5OD5q0aEDDzuG5LsAb+Y=
X-Google-Smtp-Source: ABdhPJwWbAqgQWlLJw0BY2EdKR+e7hDanpON3XRb3mTM4I19Xn3x28jmKb62g0+4v6fwWkjtyCsW11A4OB50rjdY6Is=
X-Received: by 2002:ac2:5297:: with SMTP id q23mr3528281lfm.223.1626183893269; 
 Tue, 13 Jul 2021 06:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133230.GA1872993@pc>
In-Reply-To: <20210713133230.GA1872993@pc>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 13 Jul 2021 10:44:41 -0300
Message-ID: <CAOMZO5C05uBJXxg+Vmy1EAxx5rh7UsF-KQFi2w3cBQ-b=tTDOA@mail.gmail.com>
Subject: Re: [PATCH] gpu: ipu-v3: use swap()
To: Salah Triki <salah.triki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Salah,

On Tue, Jul 13, 2021 at 10:33 AM Salah Triki <salah.triki@gmail.com> wrote:
>
> Use swap() instead of implementing it since it makes code more clean.

s/more clean/cleaner

> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/gpu/ipu-v3/ipu-image-convert.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
> index aa1d4b6d278f..5f730cd6009d 100644
> --- a/drivers/gpu/ipu-v3/ipu-image-convert.c
> +++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
> @@ -1021,11 +1021,8 @@ static int calc_tile_offsets_planar(struct ipu_image_convert_ctx *ctx,
>
>                         u_off = y_size - y_off + uv_off;
>                         v_off = (fmt->uv_packed) ? 0 : u_off + uv_size;
> -                       if (fmt->uv_swapped) {
> -                               tmp = u_off;
> -                               u_off = v_off;
> -                               v_off = tmp;

The 'tmp' variable seems to be unused now, so its declaration should be removed.

Thanks
