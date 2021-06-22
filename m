Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D423B0CBE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 20:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C9D6E871;
	Tue, 22 Jun 2021 18:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12F96E87F;
 Tue, 22 Jun 2021 18:20:08 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id s17so434613oij.0;
 Tue, 22 Jun 2021 11:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=29hikt8SUCNhjVnea4G3Tt6U2VKimPI9xOdyygn6y2o=;
 b=CZ9m2GCYl3/yRI7h1IWxxp6TOejM4xOmGC4KpzjeYdz81AHrXtUWyI89o0oJoZEqEO
 4M0lSdJJLM09L8Iu+QVRYMyvzCwO277e5L2CFRffawfY7hti2B+l01moMiqeK6VYIfMy
 xipBv2IcBYtsXCTXc4P0t6+b9PbMayyeC9h/Rtow4aXXkqlqUHIsJZ5rbH2IHoG0qNTV
 3i1Lg5Ep7aavjIc1coARhze9+h/4cP9P7IJTVr7PgXluFZ0cvGNPeb60iQu98O5T86PA
 wOUsSWE71SOtJEbFESRfEOs+Vh5hNmKwQjMMRE0HdP2wXKTosk4iXMis11i+oxQslA66
 dv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=29hikt8SUCNhjVnea4G3Tt6U2VKimPI9xOdyygn6y2o=;
 b=kS9RQQzIMNaP4XkkehPKJRyx5ZlfcomIQ+zfYJ0L0VlA5zGI9ZjAiq5JobY0hWxQnR
 RFh04YBTg5AwnGxrxKv5UMXCPM39TwKojGjACNeRIYKXaroIE3IHArxMmgcHG+octPBh
 4Lo8+AuA+VmnrwHwGvGe/X0saJBNimrrg+WHZ2yUrofTmqipiiojmBRIktXd03s8HHBH
 Nok5m6zCAWtFKyqhFTPykZC0AqutwDo3YoyqLhlHR89mbFp2WQ4YeY0JN9BBCdw6GyM3
 2uDBvgm6ft8BexdjyZj96w/PRo1M2F0EZGsfZy8pB7qzkhP4/KylHSJ58HWd81TMWMd3
 U/ww==
X-Gm-Message-State: AOAM531nt1ydQwTASi4son0XLVnDnXCQ9TrT9NgFVlJ+xk4sSAU3yox2
 F2hw7T5xnplquTBnUlCDL96bYrNrtuqYffi+1vo=
X-Google-Smtp-Source: ABdhPJyUgVQFlY0rBQR5TacbcyoHIMybYd5BiSysGFReHN0iSspTqQlRZ1YcySHqv8KLv5Rmbaa0C9Yyyx8ixm9qE9w=
X-Received: by 2002:a05:6808:c3:: with SMTP id t3mr71122oic.5.1624386008138;
 Tue, 22 Jun 2021 11:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20210622165511.3169559-2-daniel.vetter@ffwll.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Jun 2021 14:19:56 -0400
Message-ID: <CADnq5_N00p5VSqj3gEkFSEALOU2qbD=WkHMpsW0saz9iG_RZnA@mail.gmail.com>
Subject: Re: [PATCH 01/15] dma-resv: Fix kerneldoc
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 12:55 PM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
>
> Oversight from
>
> commit 6edbd6abb783d54f6ac4c3ed5cd9e50cff6c15e9
> Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> Date:   Mon May 10 16:14:09 2021 +0200
>
>     dma-buf: rename and cleanup dma_resv_get_excl v3
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  include/linux/dma-resv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 562b885cf9c3..e1ca2080a1ff 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -212,7 +212,7 @@ static inline void dma_resv_unlock(struct dma_resv *o=
bj)
>  }
>
>  /**
> - * dma_resv_exclusive - return the object's exclusive fence
> + * dma_resv_excl_fence - return the object's exclusive fence
>   * @obj: the reservation object
>   *
>   * Returns the exclusive fence (if any). Caller must either hold the obj=
ects
> --
> 2.32.0.rc2
>
