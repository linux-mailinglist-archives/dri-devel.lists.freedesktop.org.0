Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76FFCACC17
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E633E10E40A;
	Mon,  8 Dec 2025 09:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cQ0loGPS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D2810E40A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 09:53:05 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-8b2dcdde698so654069485a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 01:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765187584; x=1765792384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1sM32WeH2jVyY64qANlJiXgkX22XEyx8ykYLFAD02P0=;
 b=cQ0loGPS5uM7Mu/OJwl6CU/Cv+g16Zcxf4u7oN3hXm+ec3Pwl1uGH61Sh122mJdB66
 cWENwPci3dXl8vw0iVV1lXuk4RmYuiu2+Xm8Wh3gvCuJ4HyJ/S6WXHhF7haFU8kSl/z7
 JEhgROz8FtfjL0iXztdI3COv8KzS3AS65x1fJLEC8lCF5V8/BoeJ4Itss33oBZoP6BJJ
 0IGTpOD0mUGznL8lejNL7PKoWfxEpahYiMPYDJlaIRKgI5fIXSwzMtDpke9BJzjpfEqI
 rel4g6IfnFAUcy9Lo4r5hc5Eybo3LTv+Y0qxo2WbI08h1INdNR6isid3P9W8Vb4DZftP
 Q0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765187584; x=1765792384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1sM32WeH2jVyY64qANlJiXgkX22XEyx8ykYLFAD02P0=;
 b=UhkAsf2C5AN+Jfw2NDv15H9vC+WahZiUSqJHqixRfNqalkWwPSlIJZ5k+fzKFE/2T+
 w+MwA7lLxygLBu+/7UmdVVwY3+hyLxTzAbA7sleVZqSaDjSpXxiE5vazJtpS8GbyDD6o
 sAwSRjsnGxzBRmR6H8sAtiiXFWAyjryqSbb8TKqz+lrCWjA2UV223Fh/4P0a8ZB6dsIn
 1ZoF7zoz2fDh84iItMsWCN7cbcIja443a4zDBZ+wY1weIIAvfEjESX98dXPgyY36Ml20
 EEpsvNFx55Ev5YmZHXXjpVvEd3RlxTKd5dEBajBlbroEWJ7htwS/4rppSlpL5ER7JpHt
 PaMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbAfSvRRpkLCPNK4sU3hL2BjD19I7hPuKAnABMW37MVa4i2W9DGKKy95qULq3s9lyWSCdaRmE/obI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1iifG1QzQNwoByHT5KdMVIj2aeFB9i59NoOUHI/ZPW1RPrxjy
 NkN32T5sEzjd9UzF+ZNpvt4BCLZlHP+lokcCR3twvXo5er0LUqok4NQ4wa1Abh0jFF6Ga3UI0ts
 zTsfuaV+8QpgfjjRH90/zGH1cGoHlof8=
X-Gm-Gg: ASbGncudx0bijhP9RzxiId7BDSJX9eRIxhqnjEtnvrUQ5HfmHQEoOvLnrP3nnO9tM8m
 GYrcSephR5fOg20ndmfbTpObcEGpliR2rAsKBsfWblGtJDSlGi2yczbin9uhcB4C+FLlTGyEx/w
 uKJL4kkMSVgeDKZ6d3SfD2kEN4AsqajddZ2MXuvwNC2hWzrnuZ5wS9pW1OVdo30WjG4MuXNmQoT
 7IADE2TTR+Pw96izf1BU3+qYc/MG4iOe+D5vaVjMzW3fjJmIMEs0VDXeybt1CkgzcTcoSYd4A==
X-Google-Smtp-Source: AGHT+IEj0uEs1F+oCvQ5shQtijjpsWvsSqk9ZVjqw/l++cRkIyOaTUZ12XYt+1ixgyp6ULVPgxQ401UwCx6PPQGEOzY=
X-Received: by 2002:a05:622a:c6:b0:4ef:bd1a:501f with SMTP id
 d75a77b69052e-4f03fe048dbmr114802141cf.23.1765187583850; Mon, 08 Dec 2025
 01:53:03 -0800 (PST)
MIME-Version: 1.0
References: <3da6a916cd6d489690b05d2bd64a2b3a@honor.com>
In-Reply-To: <3da6a916cd6d489690b05d2bd64a2b3a@honor.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 8 Dec 2025 17:52:52 +0800
X-Gm-Features: AQt7F2owj7J_9alWp6aSKrVUcQg6W4ytaT9Dh3VtedFYj__73ne_kDrRjgoOen8
Message-ID: <CAGsJ_4w-XtJ8zzc8H4OwW4XV21T8FWGxeoMnfAxmAgBhzrvxWQ@mail.gmail.com>
Subject: Re: [RFC] dma-buf: system_heap: add PTE_CONT for larger contiguous
To: gao xu <gaoxu2@honor.com>
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "surenb@google.com" <surenb@google.com>, 
 zhouxiaolong <zhouxiaolong9@honor.com>, Ryan Roberts <ryan.roberts@arm.com>
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

On Mon, Dec 8, 2025 at 5:41=E2=80=AFPM gao xu <gaoxu2@honor.com> wrote:
>
> commit 04c7adb5871a ("dma-buf: system_heap: use larger contiguous mapping=
s
> instead of per-page mmap") facilitates the use of PTE_CONT. The system_he=
ap
> allocates pages of order 4 and 8 that meet the alignment requirements for
> PTE_CONT. enabling PTE_CONT for larger contiguous mappings.

Unfortunately, we don't have pte_cont for architectures other than
AArch64. On the other hand, AArch64 isn't automatically mapping
cont_pte for mmap. It might be better if this were done
automatically by the ARM code.

Ryan(Cced) is the expert on automatically setting cont_pte for
contiguous mapping, so let's ask for some advice from Ryan.

>
> After applying this patch, TLB misses are reduced by approximately 5% whe=
n
> opening the camera on Android systems.
>
> Signed-off-by: gao xu <gaoxu2@honor.com>
> ---

Thanks
Barry
