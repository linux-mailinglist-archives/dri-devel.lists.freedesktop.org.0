Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B7A87B864
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 08:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA0010EDBD;
	Thu, 14 Mar 2024 07:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UVEJXWXW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C76910EDEB
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 07:19:43 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-4d36c20d0f7so914138e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 00:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710400782; x=1711005582; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ojH9YgZdQsTdhM/5DOp0sR2SpKlzVwEvHTXac3BNoo4=;
 b=UVEJXWXWWMgrQ/aHKNKus5Vd/XjYlWyLe8Dd8hYSiATTDW/vlA9BdXc3XwqblNeE/X
 DXYR3GPuzsUBgV8VsdQ2WTCZ4xncp/nFED8rqRPKMVceoGzQ6K7qBHMRXq92GYgCT+jo
 ZpMnAG/QDZvcXzpbOddERNjz/XnmFLRdZVjkZiM9y5KpfibtGXxFejzXrfc/60oKpVk5
 x/FWcJVhrbfCMT3bSLupq34eXKJ2F5jByOI6vPcww2MJ8QbZ7NY9AyRvyjaR99Z1fuqT
 ddMdLTN5Nl11ZjjgOUi/9t+eZkYNQwzYP4GoeK7IyceBWg63xQUKmoQBNLTlqjaV3YkZ
 Ftpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710400782; x=1711005582;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ojH9YgZdQsTdhM/5DOp0sR2SpKlzVwEvHTXac3BNoo4=;
 b=Z9fCvWGenmQGjUL500YMUJoW50Ejj7pHx6X2L26ckGPbRfwWKOLNHc7cst4+kitbOF
 i2pLyKcVRcecVULjC4IsisJ7bWKaSWSe1hVITjq4gRm2lHyilyVJmRsNUJc3XkE2Cd4w
 UsfrPLHErkiUU51zXvJ/MhEhA8BrMjM5Vs3rg51qPx8p7i5Yd7taIDfVZi6YP6tAwZEe
 JG4Hw782JVpSoYyNzb1UMBeUwWVzQW/GXB5NWs/EI3PEEZkSi4a9Yf3oqXmiM+JsIEGF
 Gwt3eiw3QeGnS/sk7lYK2oc7AQ2HuW7Ea66gPkCYE3pC/5RmzLGZr1UiI/OIup1PvShI
 fPSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLqGRGB4EtbCZ+imUD6yu4tXqloJ+KhVjc46OhOcQGGmObhyQdA/C5ViI2Y1gGwHIU4e35Nx3ret5olMe3sC4Rc4Sx1JyS63/HqR/3rbzg
X-Gm-Message-State: AOJu0YzjXYP4oqPeXtjrKfswMroirTg7sQ5mT9JhQn+tlWfraEwDEGOC
 4R245lSbmZzb1WmKepG6AMM+/5dx+PMQf57Mm4p5VEFR1M6t5xidlyqmItRtQrv8sKeqb7sycsZ
 lNjfatRnpoBG7RDasq6mTsS6McD7vJ6Gk9CQfKQ==
X-Google-Smtp-Source: AGHT+IEu7MNUInwIY97dleYnWeWXfcA+5F5T/ApvKi6n0MwxHEqr/RR8abTAy2/zINbSlyHB23weCyfflgDg+RLDw2Y=
X-Received: by 2002:a05:6122:1296:b0:4b9:e8bd:3b2 with SMTP id
 i22-20020a056122129600b004b9e8bd03b2mr431224vkp.2.1710400782181; Thu, 14 Mar
 2024 00:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240312170309.2546362-1-linux@roeck-us.net>
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 14 Mar 2024 12:49:30 +0530
Message-ID: <CA+G9fYsHhTLw3c1Eg-L6G3H2g7-mPf9zdR+hKDCV10RhHk5vhg@mail.gmail.com>
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, 
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 loongarch@lists.linux.dev, netdev@lists.linux.dev, 
 Anders Roxell <anders.roxell@linaro.org>
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

On Tue, 12 Mar 2024 at 22:33, Guenter Roeck <linux@roeck-us.net> wrote:

<trim>

> This series is based on the RFC patch and subsequent discussion at
> https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
> and offers a more comprehensive solution of the problem discussed there.

Thanks for the patchset.
This patch series applied on top of Linux next and tested.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


--
Linaro LKFT
https://lkft.linaro.org
