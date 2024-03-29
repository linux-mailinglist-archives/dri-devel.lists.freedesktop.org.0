Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB7A8927DC
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 00:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6726B10E413;
	Fri, 29 Mar 2024 23:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sytESYdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59BE10E413
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 23:36:28 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dc6cbe1ac75so1820018276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 16:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1711755387; x=1712360187;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z3ws0GiqfaPCvaP9VcCCnewH75CZLc5KkLizkP97z2M=;
 b=sytESYdhL7OQlTkqpVfM6y3c+f44yDdTOyf4RRN/Ph0pO2zj1d8DELkmGFul15dQRj
 ziV9W53KiQigDzqlji9QMUtdVKFKlI8zZwkeq3eUGPOJSK9Gv2Qgu88Kq19s7vDoDP/v
 0+1QnroxBugqO92sJzUFWv1YR+kkC1jfuTHjkf6grTxc1zrY4zCdF5a6wJLDdI6J56z0
 iNStqyNY7Omr37iDxrM6KkldfGP7nCjBO3TWz+61yvNCHvAx0vN1D+rQZKv+wFRkrwRX
 NMRDoEzVx1IONVlXV6UhAoiv0scRs+XGb9l7OtfNTnkGDiPIXizs+J0FesJ1DEiG0oM+
 itaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711755387; x=1712360187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z3ws0GiqfaPCvaP9VcCCnewH75CZLc5KkLizkP97z2M=;
 b=hJeCnca8/7V8D4lMU6tK+n948955hxYoavlYMLfgxZnbpJrGcLqQGayMzDyAVvYfIi
 pun11qb7HFbc7P2GFCgMDM2UxtA3z5/luj/xkGIfm7CtapBpmvjHgifQmmpVeXk8gBbT
 DhT2L36U3gJ1E+W1I7m6Xu9p66GjJfqyqeYG7WmZXkGKuI3cwBBnTpxQnBkoKscgPMvb
 3ErS9/29wPw+A6PEmjuNXYBNIwe5ueLBp/0GFOMfqs0LmyHCEshgngAc+kz9eOBMFDSM
 ptah2jg9gPtr2b49LrPRYGJD1oAG9zTqMV4455maedIN/Xx4/topXi4PV1lnWQQrrncv
 Vbxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+WK6LcoIR6wPS2jvOgtLRhQiwtkkTSz4X2E4f1IGN+HAsLKEQ/zlF1n4NqJYZqbwW9NliQSkOBscbdj0lQAo0jKtkn4kFIRGoUEUa1WcF
X-Gm-Message-State: AOJu0YzPpa2Z9IP5sCIUpdutGP0137XLlMvA3w9VzmLLWaYO+b6NWQlH
 VjdRlTnNjV8j9upex20snmA9MD+WbnQ6SO6N9jUucJKI4DDo3NU3JbPhh7CtTkHPGrkbHi7qtmu
 yVbHEw7Kw81kL/+sDmYmm8LQKZskzzxTL/uxc
X-Google-Smtp-Source: AGHT+IGJk7NU8MrL8Rai4C8fdDlc24klJyWnbefpAnU4Fv6NNUTsRsocqC1LxHZ94PST37mhkloThVc9PuLt5FEG9B4=
X-Received: by 2002:a25:f912:0:b0:dc7:494e:ff33 with SMTP id
 q18-20020a25f912000000b00dc7494eff33mr2512234ybe.7.1711755387188; Fri, 29 Mar
 2024 16:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240327022903.776-1-justinjiang@vivo.com>
In-Reply-To: <20240327022903.776-1-justinjiang@vivo.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 29 Mar 2024 16:36:15 -0700
Message-ID: <CABdmKX1swVO1=6cs+CW_g2g4g7woB5-Ks1gBzCA+iLcvpLmkvQ@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: Zhiguo Jiang <justinjiang@vivo.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 opensource.kernel@vivo.com
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

On Tue, Mar 26, 2024 at 7:29=E2=80=AFPM Zhiguo Jiang <justinjiang@vivo.com>=
 wrote:
>
> The issue is a UAF issue of dmabuf file fd. Throght debugging, we found
> that the dmabuf file fd is added to the epoll event listener list, and
> when it is released, it is not removed from the epoll list, which leads
> to the UAF(Use-After-Free) issue.
>
> The UAF issue can be solved by checking dmabuf file->f_count value and
> skipping the poll operation for the closed dmabuf file in the
> dma_buf_poll(). We have tested this solved patch multiple times and
> have not reproduced the uaf issue.
>

Hi Zhiguo,

What is the most recent kernel version you've seen the bug on?

You are closing the dmabuf fd from another thread while it is still
part of the epoll interest list?

Thanks,
T.J.
