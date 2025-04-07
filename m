Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53222A7E353
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DB410E4D1;
	Mon,  7 Apr 2025 15:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="ZA7xTOtJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107D710E4D1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 15:09:29 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso29751365e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 08:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1744038567; x=1744643367; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bmsPW/IuCIMhHuegXao26Op7RdiU2z6+4rii+HhvEQg=;
 b=ZA7xTOtJC23Su5JHKKRRhJpZvQ1NFlbSoSXR+ntyz+BqR811exE8t9sBUPb5DXsrZR
 L0CvswECjfItnFVhEf0/5snDiXKkvGEj1rU29pq3R6lTRMb2UqsUcVVsgVlI0GyuZO3P
 nhsNbDT6FU+tzpYcn8MMU3pgMfYzb57PjvyMjHtPGiFg30uYZYME/CE6r/kZ11rz9GEJ
 gzc6eix8XEDO57tsC2zPTEfwz8fNb7aovba8sFSYpwEOahGqH5tBrpeTUB+5f6qod20G
 82hOmlxtfL2spubC62mRjlZ1kyhgVicOADZ/uAmigYwD4fKqtuIGnX6aB8Jns9u0/e+0
 oZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744038567; x=1744643367;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bmsPW/IuCIMhHuegXao26Op7RdiU2z6+4rii+HhvEQg=;
 b=Tb2ue+7nsVBPHFOelaeekhG9BCZeydNNqEwI+HUDhklL4jRLIbhQQMUKEkHsQ3dsHQ
 CNXPEbSbAEnx/QzGwseP/36juOh1YIi4etj0OykH3NdOHBU+q8M2sCvO+IxCAvea+s1h
 yiUaLT+Pae9D6wFJ5ZYSgL0mfThmMHeTZxCAakkRPMqrtR8LqDCzzdBRcU8W0znbdHQe
 joY7EAbIItfrpr03haHn7gmBw3XjyjBu4lqyj1Rz/rzUeja66iWszi/k3geBlCzizuQZ
 EhaDieZXvtQRYYVr6cHW/FydZs+zs0l/myZRctLgNfMZ6vp3HvKXp+9vJsfVihmZlbpU
 SBxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOk9lE781MKiKE+idTMx1CPsblxW54rfo2Xq+tT9BboqaejBwFUJjAx9brBK211/lv7vH30mypqns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVNQmGPVjuA4wCw4TuylISjGC6ZaEoQ+WWr4Ytk2hlvVNviHas
 jKkF0YmaFgK4DptyegHz7RCTrybqUu9NWQbMvq+RNGPrfCsJHwNdMNK8V+c7aok=
X-Gm-Gg: ASbGncvDVJg2bPbvkjIBoN5gJs5L1e14bPeeZ7aLqmIlzeKLbM5Uy952KoomHGNHaz2
 Egx6UZvxnVg5S0Au9tU2nnmYvSYOhagSp8yvwrhuyaR2eCGPQnZmVYcz/SKdDnG/4AH2zpepeRr
 RUT0Z5vJIBDhbSYSaUag70jOukfQGkBzTQsuCVHW5IKuiZtX6IOyIAVJsuc9GM0+gUVLQRUtM/B
 DLREntFfJ6icHrgoy4ZDMj4jbm/kVvJyrWv46L+UmvuEXsJ1LqRp+ztaYCYlin4jFKqf6Q6ujP1
 Dy76smHOcFRDkj3x7qKDS/NSvPiI86iPsfjVR0eYDaRqQgI=
X-Google-Smtp-Source: AGHT+IFKtcPtXIriIebz2GLDNpcyLtI8/d7dTMWyJquEPgAhC6jN+Ozp3zBNOoKwt9alXNTrbKHNiA==
X-Received: by 2002:a05:600c:4fc6:b0:43b:cd0d:9466 with SMTP id
 5b1f17b1804b1-43ecf86ab8cmr107340865e9.9.1744038567238; 
 Mon, 07 Apr 2025 08:09:27 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1660bcesm135136305e9.10.2025.04.07.08.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 08:09:26 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:09:24 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: alyssa@rosenzweig.io, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
 joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
 Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v3 2/3] printf: add tests for generic FourCCs
Message-ID: <Z_PqpEDTC0RPiPez@pathway.suse.cz>
References: <8153cb02-d8f1-4e59-b2d5-0dfdde7a832e@live.com>
 <PN3PR01MB9597E8833F0DCE0C7C360135B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959799C9C343A7F08E04158BB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB959799C9C343A7F08E04158BB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Mon 2025-04-07 19:12:39, Aditya Garg wrote:
> 
> 
> On 07/04/25 7:07 pm, Aditya Garg wrote:
> > From: Aditya Garg <gargaditya08@live.com>
> > 
> > This patch adds support for kunit tests of generic 32-bit FourCCs added to
> > vsprintf.
> > 
> > Acked-by: Tamir Duberstein <tamird@gmail.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Aditya Garg <gargaditya08@live.com>
> > ---
> 
> Petr are you fine with this here?

Yes, looks good:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

