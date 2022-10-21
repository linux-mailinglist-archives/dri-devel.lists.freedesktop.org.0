Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1412B607430
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 11:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D7210E652;
	Fri, 21 Oct 2022 09:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C3910E652
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 09:37:14 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w8so1310529edc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 02:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uLumIEzZqB5oHuTgF20N392OS8of4fBsMhHlXcUS9cM=;
 b=MmBfkn9VzdF4CTVqMrgJ6N0xQAWkyWJyeAT4ER2yAbsLNDkuGnh+bkMBYYEHr9ZDJu
 Qts17gcOwV6nSgKFqANSFy/zy4SntBBunPkeDiZWoPB73JVi0fMsACaia79t9MepfIVx
 BLto/61SayjfsIGFDlq8e1jv/YbTshh31AD4NbON+AOVkLzX3Kbi0AedzBwQy1cIftXU
 54JeAtIJKUDZk2GNqv5RhDcCTS07w8LAgWfJeGtqU4u5AV080IxpdnkKOXpgiZJ2Qqek
 RufnMR7QIHkK6dXKO/I/Zi6VZC4jHBurKfHvhmiF0nqn1LxsrgzeG0NlNsK+/QVDF589
 XuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uLumIEzZqB5oHuTgF20N392OS8of4fBsMhHlXcUS9cM=;
 b=Zx0coKwGz7yyT3l5jayYqAQPpLCFnEL1JQ8/iZI5TExhEWJGP9m21u5a+GFda3ZIVt
 Tfx5y+MFcuVhzhqRjR2l9FwEueQ2eezV4pJlcJ/7hmhYkxA3Ro+NZWt7YI4PSqJPvS9u
 jgGUULrb5AAGLCYsutynP8HZ4PhtaO0h6IyvuMlIgYMuMJR4kpu60alaFFFTeUHmzrog
 5DfJ3gAlKK12FYGV5ONwJRgL/0r9UL/WCcb7KHpsQAy7mludHsX200CXPBu7vmq//fMR
 13vr7KQVGXdzIN+SiBnksrYdz1rihUoP1kl6tDaHqO9/DofkLsgihOfBqwWd5habzCK9
 WfQA==
X-Gm-Message-State: ACrzQf1EpiLdacN40BhFVGyEUUJGMmLdDniCNLQItXsU9R3KmKKlk7d4
 xKlwqGtpMmvW1c31MoMQdibq8IwcpMgF0uPX4EdkDw==
X-Google-Smtp-Source: AMsMyM57kKVITQPsQ/QZcAW3mwKmSY3ZENjz8oy8gvrS0ka6DR5S4eLYMtb15By3csnvUwLFICxj5CXRPOqXLXgQEmQ=
X-Received: by 2002:a17:907:1624:b0:78d:d61c:2b4a with SMTP id
 hb36-20020a170907162400b0078dd61c2b4amr14435147ejc.208.1666345033067; Fri, 21
 Oct 2022 02:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-10-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-10-maciej.kwapulinski@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Oct 2022 11:37:02 +0200
Message-ID: <CACRpkdbWx=oSudfL6cFLj0_XyN3UPfC_2SGs6WC_n4zF6eiVrg@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] gna: add power management
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 7:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:

> Implement power management in GNA driver
>
> Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
> Co-developed-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>

You probably want Rafael Wysocki to review this patch so you
get (runtime) PM absolutely right.

Yours,
Linus Walleij
