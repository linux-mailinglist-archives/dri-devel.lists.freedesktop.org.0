Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DA3A5FB9A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F08210E1F3;
	Thu, 13 Mar 2025 16:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QVez04eq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAC310E1F3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 16:26:35 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2ff784dc055so2082202a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 09:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741883194; x=1742487994; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6Dj58qb5Fdu7jAiSs8njputJgR05+QajXZnrH30MR1c=;
 b=QVez04eqyZ5usQddcekS9t7WDGwk/stgq6PNq9Iljs3wd5Zb6oYcHXjcLKHJL0hN8f
 1YtdTU1XIgoNoMy05Z3AEKPb2KmS+UxuswUYtE4tYOX12iRe6adK6sYYLKslAhXfdt0C
 6chkyn+iCokojS1gt2HsjWIaq8Vf5Jy8lwZ8g7NYFCcqlVBMgPAayzSPLc/mX5GC89ZK
 fA+p1pa9UpvuxUVM5hYu7xnrakh9ZnEyqROwF1UgTU3MRlNRoqLqdrYTY1s6J7ed10HZ
 aAOOsTW/qTxhjmx7tn8aN7W9BiBaq0PwELGRdSb1gluMZHpxG5MNqirzaSEZJYbNGmdh
 0NJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741883195; x=1742487995;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Dj58qb5Fdu7jAiSs8njputJgR05+QajXZnrH30MR1c=;
 b=ues8uZfCi/vJ9M2J0L/cjpM1Xy18oI/koi7UlFcNMu0icODhqvohCO6aaXTDV6GqqW
 OS0LlsYyEnQLT+NTBnaeyXcLVwLUfsrCZGXcBaFRiBnTafoP3wAYBqs8z/QYeYN/cwcr
 ESMJS3z4kpSFY3VZUOllnoZSocgfFtMxtLrx0hVjr7fOlsZb4xUvIcdLL6PFhdv3nOuT
 vOvFS8LqxPoFcHWHlwDbN0QHyoV52b5mYwfLIAdo/g4Q4oaA6B0FWkW1uAJYYYElAnWo
 HKBIa+bTQyqgShpQmL4yG9K5jk2mjkl98roubcQAFeG+zaevPw4URBxMFHxVqEAm67Z1
 fleg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7UhqlFee24Q6SPdQXt3BZ11ci+ja5PZxfOU5dEGALQJkTRWfqnjMlsIpqNLKUdPTx2xG+EdeisIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHJl1RCz26kXzqa+yZwOKWBqKZxioZ3R/1yQtC0XVR8xrG4skS
 NFMvVXU6g+3VW2QSzYqC8PWttbKBw3rtMXxtMa0GeFVfe7GK3awy
X-Gm-Gg: ASbGncvKJkoHFU2HRWQBXrJVwIpTcMQsME0EBabOmr2NnZjH6ykcIhxCKXhAdCiMLwC
 t7M9/mtaC1B7M6YDRiFJihRb6Xrm78xcZgvHXp/RJKRNtdcHKNNus6rAdljx9OA5ZwWqAiaxaOC
 0vcsxBzLgHaVlLr2HTrr3J1j+m8ZtOgFEzGn4xTq8pujBRz84y9xkmtHwOFirqzd1GylcKXu1mh
 JxHX60ewwpzZfp5j9Y6E2wd2z1qvoA5j3Nn2EQJMqpv9f2ZSB9SYLOPZ/oRUkhtB03D1phVAybp
 xRA9Xy+5fCsmb2Ux5RRFNWVMBRx6LCadhSXyS4+mrZ/c
X-Google-Smtp-Source: AGHT+IGQ1B1r23bHH1y7f1P01LiOEnbRiq9HK7MEAu/5nbXG5vCyYer48OQlR5RqnwzzsBUWrNiOAw==
X-Received: by 2002:a17:90b:3906:b0:2ee:c6c8:d89f with SMTP id
 98e67ed59e1d1-300ff0d6160mr17644409a91.14.1741883194498; 
 Thu, 13 Mar 2025 09:26:34 -0700 (PDT)
Received: from localhost ([216.228.125.129]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6888a02sm15453765ad.40.2025.03.13.09.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:26:33 -0700 (PDT)
Date: Thu, 13 Mar 2025 12:26:32 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 akpm@linux-foundation.org, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <Z9MHOOfnHnLsnhxu@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <Z8ri5h-nvNXNp6NB@gmail.com>
 <04AA7852-2D68-4B3F-9AA7-51AA57E3D23D@zytor.com>
 <Z8tJNt83uVBca0cj@thinkpad>
 <783456A8-67F9-47DD-AB15-914622A921CD@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <783456A8-67F9-47DD-AB15-914622A921CD@zytor.com>
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

On Fri, Mar 07, 2025 at 11:33:40AM -0800, H. Peter Anvin wrote:
> On March 7, 2025 11:30:08 AM PST, Yury Norov <yury.norov@gmail.com> wrote:

[...]

> >> Instead of "bool" think of it as "bit" and it makes more sense
> >
> >So, to help people thinking that way we can introduce a corresponding
> >type:
> >        typedef unsigned _BitInt(1) u1;
> >
> >It already works for clang, and GCC is going to adopt it with std=c23.
> >We can make u1 an alias to bool for GCC for a while. If you guys like
> >it, I can send a patch.
> >
> >For clang it prints quite a nice overflow warning:
> >
> >tst.c:59:9: warning: implicit conversion from 'int' to 'u1' (aka 'unsigned _BitInt(1)') changes value from 2 to 0 [-Wconstant-conversion]
> >   59 |         u1 r = 2;
> >      |            ~   ^
> >
> >Thanks,
> >Yury
> 
> No, for a whole bunch of reasons.

Can you please elaborate?
