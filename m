Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA13BD3A9EE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5C710E203;
	Mon, 19 Jan 2026 13:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L5qpIjcl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456A710E203
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 13:09:26 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b879d5c1526so582239066b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 05:09:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768828165; cv=none;
 d=google.com; s=arc-20240605;
 b=QsqfXr3S9Tg8Avlvrc5nZ65NM9pmMEaKFyDvdUHzGb49Sdj1Ge771cy7zY56qkkJ6A
 SOYDnkIiCrvLgW0732UFntKQU7kkmYJXkJDYC1fzySLXQ9Yh0RObdn1niaLpHW0BOJUL
 rnPfH0Bs8ZLRtdEWNcNZ5cwGwl9do431cnQ17IAuoYzz+eflcmbFQiHaZ0IbwrxwdCv/
 pHFB93FKo7MyShhC4hR6x5ZHOrVoQVnoAfMlOUHIQDTTBi4uqjm9p3smDkfDTloywQ8a
 njfJOSluAeai+PGvSU1NBCweuHHedE+5pxgMvsjcK6sHBPgZzRyWLnTxGjCUYf6MyTRo
 Ya9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dq0JDh/8icBDBSEsY1eC6bpJ7R/xK2j7R0ikxEAxkoA=;
 fh=OlclpIb+MtKzbqSDyh+26In40IAv0fC1wuNqg/P+ei8=;
 b=D4WN4GwY8/peMeqSAwfOIFURe/HySCK7C+ermvET1dzy3hPko891FhDqUIIAXj6UHg
 B/FqUue2gI+iqwbid89oF7QaSVQWuYYpVQaoE6fIU1/4BIPuX8Wy/srFa2Eq8s0QDQfR
 Ea/Ao7/X1UzefNK34nNfmLTK8wCXKkp14B1/hsGsoQf4CdoVSBaMRXQn9HON1q+9njNO
 weAVEfHWO7LaHRgBJJ8s/27N/YVW3E0D4zjO9CrnhQiOmP10pDXkWC2zIy9iVKElv7H1
 zrU3+KE+jCCS6rxmQ7LFv4kgFR9roPeoSa4+elfRGgIIyrlcHlUaX/XXSp2akSE33B8m
 TKhA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768828165; x=1769432965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dq0JDh/8icBDBSEsY1eC6bpJ7R/xK2j7R0ikxEAxkoA=;
 b=L5qpIjcl3tSS0pquJyJewAixcfoqgIYdg2AFIHfwNMoBB0FI/85E2yfdekcW0Kd29g
 bBVT4waArej7viFQi+AOIHj3uSRz94bX1Yh55L9OdXuJmxtOXhJ0LHTCuphkJHyWIj3L
 USYQokMce4VXiYi+UF/qMe85k+TEvlRe+lQVR6Im9V5B27eTet4/8or3nnj7O2oGWA54
 TYvjkiyGRTFAZDDFSiBLRksnG9/T8b5R49P88MjkuUNhXNUD9bA26UtjOjW3kDsxp7kn
 9Pd/KXQuxBOJ8tp+k9ZWZOE+P84xeBdGiPDZ/RxYz4pxFfRgAQDjcPLRa7j3vCxe6NOB
 bdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768828165; x=1769432965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dq0JDh/8icBDBSEsY1eC6bpJ7R/xK2j7R0ikxEAxkoA=;
 b=XZ8IOCuaBt1AgkotrsixB58wa9eXFRi6qu1CubXp7S11w5u7h/5JZZel1oRXVGCHVe
 zObdhwUsYCIBFsdAuuWMhu9iqqiTjVpootLg1jXJ0Sqa+UrPBu568z6/LUpYH7MTFNe+
 v1Lo4tbtMFs87CYFtKpCdsncq7m2wMm24Vhqg/kY+o2P1KEu572C4r4ieaxhpDOp9wis
 LsmWJw9QLbc1wK2YpyMrBlihjUia6W/rTbGzb68txaBRT7LLyxKgbOJFAY8+Z38U12wt
 57QG/ACcuhukJrrAn9KJsQJnfN54oOoYcvjT6Hsw/YYbq9mIyQrxtY7fC6LVhc8Ncd3v
 SQ+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkM/scQ9HFeyzAXoHmM5fvhrIn+xOgZXkh3FzKGF0Btgm+B++P0FU1u9r6LQgqQCnTy9/qgRjV6XE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJBWpgSxTywk9/VohWAdmpv+NZ2iVVgEWMRIbY5gVm86PZINSw
 IZ6jth+hlD/1XlhqaVzIUsNhmiRBCFCRMHvR6RtxGNKXYLbc9q0AgoJmrOHAtyWB4xElWQvkDnu
 U52Z24xBbpwiszGF7w+svUzlSfhApUKMgLgU9zfmxGA==
X-Gm-Gg: AY/fxX6LhV82tsMv11tHcqFzykNCqqM4C9muoAkid8azQixOq4NSdEqsQhiyHfrwcvh
 TJBlW+38TSNVADBrbjMgD79qx2OQv+Xk3jjQHDHnKYEirQp2RZUMgo7p+B0PRFgDOxcQZkImQKr
 KUwrxwM4+POiPJ7BvMCfSS2yWbtTdYFrP7pwMKNVKgRC7H8rWmusG9jZFbHTyLyv606IsQvRtb1
 Zm39LuanVe0ztaQZ3IiHRgsNgoCt91CGLHbrJ4cYkAcG5vVm8SLBEhGxQ+nk5mmOHse5GCgVO73
 5d8628OadVTI9byJB0qAlAdiweQ=
X-Received: by 2002:a17:907:944c:b0:b87:324b:9ae1 with SMTP id
 a640c23a62f3a-b8796aee9ccmr1020227666b.40.1768828164660; Mon, 19 Jan 2026
 05:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
 <20260116-dmabuf-heap-system-memcg-v3-2-ecc6b62cc446@redhat.com>
 <CABdmKX21XWwwOWZ969GT=DOu7_aofKR7E6+4iMggbELVM=zYAQ@mail.gmail.com>
In-Reply-To: <CABdmKX21XWwwOWZ969GT=DOu7_aofKR7E6+4iMggbELVM=zYAQ@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Mon, 19 Jan 2026 18:39:13 +0530
X-Gm-Features: AZwV_QirK4eHvVLrlVMfEp91UoJml_vMBrWLaPQVZT2bzdXxn7wRhnkQb0VhLYo
Message-ID: <CAO_48GHqPj_OXd0V-k6YG837wHBKBpOCjRbMN-kbkF=nK+_s2w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dma-buf: system_heap: account for system heap
 allocation in memcg
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Eric Chanudet <echanude@redhat.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
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

Hello Eric,

On Sat, 17 Jan 2026 at 04:07, T.J. Mercier <tjmercier@google.com> wrote:
>
> On Fri, Jan 16, 2026 at 12:06=E2=80=AFPM Eric Chanudet <echanude@redhat.c=
om> wrote:
> >
> > The system dma-buf heap lets userspace allocate buffers from the page
> > allocator. However, these allocations are not accounted for in memcg,
> > allowing processes to escape limits that may be configured.
> >
> > Pass __GFP_ACCOUNT for system heap allocations, based on the
> > dma_heap.mem_accounting parameter, to use memcg and account for them.
> >
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>

Thank you for the series; LGTM, I'll push it tonight to drm-misc-next.

Best,
Sumit.
