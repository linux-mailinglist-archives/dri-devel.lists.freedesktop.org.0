Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0727442FA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 21:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F387D10E0A0;
	Fri, 30 Jun 2023 19:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E82510E0A0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 19:54:55 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-bfee679b7efso2220624276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 12:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688154893; x=1690746893;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qwJVEajk6sjD7pKhMJ8nLrUS9jcG5+GhwtGSJo7hXhE=;
 b=tMKxA1rvuVOfttdgJoZv6MaLRnwVg8j+/TriQO8mdTDOazSNrNi+WwUi/Gc1aPop/Q
 U5lyBwHF2Pk0gd/bvRv9zHYMvRDFntewjNDT1HtD4ZzrqkZMDoIyRWK/obI/N2yKBfmN
 lJpSYB7jO6SRcGocpniDZqWmTKW4Ztx5SXeoLT60DQcH82IfKlOxlFt7ntLGgi6/3856
 G+2R/94O+RPc8LvSRFH7hymsPvDQbs+sYiTuTBzPR5gMz5VTJN8uhHDfIRGRyGqkPfgv
 3MTlbtcKL+5CdJgViSLzkPHkLbXjOJkwyUUHaNvp2xegLtSvJY8YjXt3PdY9Rk6tm1FK
 nKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688154893; x=1690746893;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qwJVEajk6sjD7pKhMJ8nLrUS9jcG5+GhwtGSJo7hXhE=;
 b=lIouWNVuce9bIKEdTdpRj4nFPPH9iw+iPAYKlwteQ5ghFX+Ju3wB7JP9+zkAXy/4T+
 bRQoYrpZ3hoCb0xpHxABBXKw0xQOxwBT3HZPTQ+jjEFGlAd5/GJK6hSHd0DYNhRb7jIN
 +Q4Zh+DiD4CFW8hLcLmbWj5/Lc8XYuEB+Xw0jW+uK0w+Jt6KmiEylIIfukv8+v6XwQc3
 7orOgJ6LI0HBm8DwCmah9bcqDc5vXefXeVEsPtezOWGbRtw+10QWj9FBriLCwma3b9i5
 5l+3S0GaeHZsyjka8cZ234gYRV4keXA00lczRPDjmZsMt4j6Ppf7ODada3hBb85DkuvH
 OgYw==
X-Gm-Message-State: ABy/qLZTNUMo7PUh/FlFOZt4f+LqrEaF68tUhTPrc5ymTN1jly2w9vpL
 bTLn+PiNSKAXn1rG7Z3f3UqFvDgTYK+1S+WfwvRgQQ==
X-Google-Smtp-Source: APBJJlEQ1nYLUOhJ/Uuqs45GkvzI1ma7uVmZgBTHXjG9xRnpwZWNf4CfnE8yBJ7BW9uSQfZJSO3GHFjEeUi7rjPlsK4=
X-Received: by 2002:a25:add0:0:b0:c01:55d:91d with SMTP id
 d16-20020a25add0000000b00c01055d091dmr3427876ybe.45.1688154892929; 
 Fri, 30 Jun 2023 12:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230630162111.3051783-1-jstultz@google.com>
In-Reply-To: <20230630162111.3051783-1-jstultz@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 30 Jun 2023 12:54:42 -0700
Message-ID: <CABdmKX1qpMTaT=NaG5B+43gaWtoNK=jR5yysKNXMyeyYW10uDQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Laura Abbott from DMA-BUF HEAPS
 FRAMEWORK
To: John Stultz <jstultz@google.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Laura Abbott <labbott@kernel.org>, kernel-team@android.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023 at 9:21=E2=80=AFAM John Stultz <jstultz@google.com> wr=
ote:
>
> Laura's email address has not been valid for quite awhile now,
> so wanted to clean up the reviewer list here.
>
> I reached out to Laura who said it made sense to drop her from
> the list, so this patch does that.
>
> I do want to recognize Laura's long time contribution to this
> area and her previous ION maintainership, as this couldn't
> have gone upstream without her prior efforts. Many thanks!
>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: T.J. Mercier <tjmercier@google.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: John Stultz <jstultz@google.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: kernel-team@android.com
> Acked-by: Laura Abbott <labbott@kernel.org>
> Signed-off-by: John Stultz <jstultz@google.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
