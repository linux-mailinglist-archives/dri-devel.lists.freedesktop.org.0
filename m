Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE01D90F0D5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD9510ECDD;
	Wed, 19 Jun 2024 14:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fIHMhKvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF9610ECDD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:37:52 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-57d106e69a2so538540a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718807870; x=1719412670; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mW6qIwgaMhv1Ukx6IUSceUqe9uJpeRHrbJHiEQy9EwE=;
 b=fIHMhKvkkQicC7ryLkrL7q0tH1wyF/By85AHAYTXDj4TuKZHl3GY4suOsu1DKT8J/8
 Tu92l1dUQBHn5auw+PLwuBrIwGEZGHfAIyIJQeiWMgO035kYQnGQaJu5EVQhnGS2AEyd
 N8mnm9pzsEmcH+s+blpiuEzN4Tt7XfwhZwjWhHulT562rYiDlgefvBa/6UMk21/oD/Cs
 LQQpBlPMST8VMZL+0jRxq56AGfHptz6ST8GErv5J52QFRi/nYai4mgM8Rmlk6D6HviQz
 jk8+YYyzdObhD1DbLHPs3FmoLi8Rj0Jf5MxGBPqwjgKWOwtXRW2xJwuiBKPlYfjcLTnN
 FR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718807870; x=1719412670;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mW6qIwgaMhv1Ukx6IUSceUqe9uJpeRHrbJHiEQy9EwE=;
 b=dLNwhWofvCF5iwHIgZernh1eCQESxRUKtdGYQX7jMhdJN3Y/v0QOrjNS5HlxbGiYvm
 asIKpQQnJdwFyDGrM+a2A2AL4MkTGKnKG+BK6UoMUlwbsEfqzuX0lw8ivJVjgOgzrlt4
 qbFdESg2bff+6QjgyCmaQ8NFoxSk9kjceQ6/4U/rXAdOtZFsKnA7c8A+5WhKuSB1f5cu
 AFmBEgMLuV5DZ0V2ptDcrx8b4TThQe++ZdjlIMV0HUI7b42pzp1HqSh5sEskd2Ekz0vS
 Il0jqUhjJ8F5k7XW+iH634FEud/2457g4fasaZEkPlQpqNiR4zPjov+93FQWWx5jL1cR
 eTOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXonzDVtjHRk7K5+V7bRhOJKLz6AA4x0A+g2TUpYwDTGEUOB4WKvE6vqRLtY1in8str44f7FPJfZJguv9i4aF6eD5tvH56cqqVklSKQ0j7
X-Gm-Message-State: AOJu0YyT1O5kKnwPlsohtNw2ACwy53aB7HSn4HAn88nph5a6wY8XWOaA
 CLZN3TUVJLJJwW2Jlxh8fQCEO5MaiMPXffJoPlLza1CRQkZoseJkOpmByuGEj2Tx4RlhQU6+ZoJ
 NmRxzx5lvaCnCeY1QCchRFcjWys5nQkl/5Q/uWQ==
X-Google-Smtp-Source: AGHT+IHuis2PWxnbeePb9S0U1LQ2x2sGfOwuZsNdXB0g7qlMm761qcR5dMpoqfdYtNv6UIguJ9ZLskZKA13dNPaiPkc=
X-Received: by 2002:a50:d4da:0:b0:57c:b82e:884b with SMTP id
 4fb4d7f45d1cf-57d06ade10bmr1620556a12.19.1718807870558; Wed, 19 Jun 2024
 07:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240606020213.49854-1-21cnbao@gmail.com>
 <ZmctTwAuzkObaXLi@google.com>
In-Reply-To: <ZmctTwAuzkObaXLi@google.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 19 Jun 2024 20:07:38 +0530
Message-ID: <CAO_48GE_YHFFjKBb6hhZQ4--3j3H3+AUTaPkZWfHTGgBa=b78Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/heaps: Correct the types of fd_flags and
 heap_flags
To: Carlos Llamas <cmllamas@google.com>
Cc: Barry Song <21cnbao@gmail.com>, linaro-mm-sig@lists.linaro.org, 
 linux-media@vger.kernel.org, Brian.Starkey@arm.com, 
 benjamin.gaignard@collabora.com, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org, jstultz@google.com, 
 linux-kernel@vger.kernel.org, tjmercier@google.com, v-songbaohua@oppo.com, 
 hailong.liu@oppo.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Barry,

On Mon, 10 Jun 2024 at 22:14, Carlos Llamas <cmllamas@google.com> wrote:
>
> On Thu, Jun 06, 2024 at 02:02:13PM +1200, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > dma_heap_allocation_data defines the UAPI as follows:
> >
> >  struct dma_heap_allocation_data {
> >         __u64 len;
> >         __u32 fd;
> >         __u32 fd_flags;
> >         __u64 heap_flags;
> >  };
> >
> > But dma heaps are casting both fd_flags and heap_flags into
> > unsigned long. This patch makes dma heaps - cma heap and
> > system heap have consistent types with UAPI.
> >
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>

Thanks for this cleanup; pushed to drm-misc-next.

> > ---
>
> Looks good to me, thanks!
>
> Reviewed-by: Carlos Llamas <cmllamas@google.com>


Best,
Sumit.
