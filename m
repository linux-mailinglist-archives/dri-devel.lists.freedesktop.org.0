Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49C1AA9230
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 13:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A2E10E094;
	Mon,  5 May 2025 11:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="noRiAj6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B7710E094
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 11:38:51 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3fa6c54cc1aso3162152b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 04:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746445131; x=1747049931; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9GMQp9j85OZqKlkrHyZMpU/XUq0rYEnvHyaTGQjhBF4=;
 b=noRiAj6rfhfP3XuglDL7t2w+byB1b+DYGAAi3X1KrRL3WRZM4RGwn1DT4booPM3Mn0
 7EdWOfasYhNbuy7YhEg6RINDDf7ho6q0agb5IHkglOl7sOq9VLjDBvYS4BBJovxQWRVt
 7mqdcsJKXxYZ1UrseBSwdDnmGNgqqOMa1FSuKAIj6jVukBn/kpU/O+84531CSS3renNF
 QKmpxEPIkC4Q2JSKH+qyTFUzlh155xLWprme4j2fDofJGfmA9EnpWkdwy70boRvHjkzN
 fX1j/BoyjEWN8v0vtoDqYvF6Gw3KpxzxITPKVARvN18dJML9+4CYWmGc8TD1VXihbhiI
 oj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746445131; x=1747049931;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GMQp9j85OZqKlkrHyZMpU/XUq0rYEnvHyaTGQjhBF4=;
 b=kQAYeO4tDRk3ncmiHQTQ4GA+6QZycrIuKkXh3xZutKUCKtLFjdZdY+vVtdHFqdBIRu
 jl4yMAwPawPCWpqiyZ34JXjE+KgP0nPBxVey+oEeSU6dIiMrfMmseeGf6HpTo2zezJS6
 1RQpgQxN4k29J8r0LOPRM8R1mu6u6a9egNhK60YkDuSlHGWgdKTfUSSX7Plkrt/bWks+
 pi9C5BMjnow3QaIzhES9CWJo+RZY+4bJ4RUdjwVDySpS2KAfx9HFZoFiyPeQJWH/rvwn
 GySV+2Gsuf6edMQTcSdq5KX5RAG5KXHKnJQFjPtUPax0TpSgJNGeO9aTyL0U277SO6Du
 q3rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwdeYn+k/Dnjp5ZRKGjB3xW8FRnwWdDnvhwYuzktgTXcTfuPm5jXQTw0iH+m9WqqoLTs/oT14KVC4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGc1cw+jcZuuxrP/okXn0Pnipx2K8kGP6cfyQ0Fi17wsEHtHqz
 s2rsDdS6FpRWxJ13VUnY/PLVAzSRUMzXzT9GNWS6oO8gp4JdoSuxCxmo+iwsT/abdUK6zdRJ81M
 P+WmTof0jCm48zf20YbV6YrFDh7J1U1jN8tNvCA==
X-Gm-Gg: ASbGncs0CvuTz1uwkFt7OjwFW1WhWURo5SkNl8VyhCyTb6aZU4ABxUfcfqadsXYXz9S
 323BfOiE7rFDsZzQXgCyZ8x0ygN+KGJCnvvbWQocmlCyyyBanSJAk9dCnIHPUmxFxqQ5znrVJrH
 eEw4vbrFG16jRO8zPBjzhpxWc=
X-Google-Smtp-Source: AGHT+IFsXXtVZfrIMVAYeKVEaw/tyOZiD5EOR3pAScS4csZ0mXU9Ezu4MEU3Ox8q9DYU0yBa6wml39ms50QahdcbUm8=
X-Received: by 2002:a05:6808:1a1c:b0:402:11c2:253e with SMTP id
 5614622812f47-403536715ffmr4977375b6e.21.1746445130746; Mon, 05 May 2025
 04:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-10-jens.wiklander@linaro.org>
 <aBTpiMIevmAmp5vr@casper.infradead.org>
In-Reply-To: <aBTpiMIevmAmp5vr@casper.infradead.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 May 2025 13:38:38 +0200
X-Gm-Features: ATxdqUHaC_cUwJGh0_wJGsfxAOxe5bhlKMecpe-U61GAupKguhd7Rz5skfHcbL8
Message-ID: <CAHUa44HOq91O0yUWVUKcUzYv9j3xqOU3WsDg9KDXiExcdPO8fQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/14] cma: export cma_alloc() and cma_release()
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
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

Hi,

On Fri, May 2, 2025 at 5:50=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Fri, May 02, 2025 at 11:59:23AM +0200, Jens Wiklander wrote:
> > Export the two functions cma_alloc() and cma_release().
>
> Why?  This is clearly part of a larger series, but you've given those of
> us who are subscribed to linux-mm absolutely no information about why
> you want to do this.

I'm sorry, it's part of this patch: set
https://lore.kernel.org/lkml/20250502100049.1746335-1-jens.wiklander@linaro=
.org/
 I'll CC a bit more in the next version of the patch set.

It's needed if the TEE subsystem is built as a load module.

Thanks,
Jens
