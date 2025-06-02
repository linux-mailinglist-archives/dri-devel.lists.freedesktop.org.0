Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B01ACA9E3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 09:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4097610E1A7;
	Mon,  2 Jun 2025 07:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qgsBHgJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DC110E1A7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 07:24:25 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so43382965e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 00:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748849062; x=1749453862; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Cx0RaYDb88MYeeNdBYIWya8sxL0SHlDdzkxwTt2TDWc=;
 b=qgsBHgJAPFyqQ+A6/qjip3sPIZlT6lsxaT1X8zLAaA1zlh1vqHoYfb4so2hMjB1wK8
 Gjkky6t59jmE1HGUe79HijP+S8gKHpld0EMcegD3EaGo4h3a/EtO63na3OWvF18fEyPu
 RAT7uMj/bLC1VytO72JmXZDJS+Sw/q0wPtWfIOfY+uENYCkgaMqX0Uosn0rcpyQ7VinC
 zkhkGhowevK5ELYExML98n4ZMWZgfgHa4Qs3dFvF7PRoHWUn6zhPLpQQyAzBfYmVM9PV
 dKqs1ETztNk/x9ecRq59x5fZmDJ8ImHaJBOX+Wlkvu4mobgp/YIh6pCXCKQq0liIKmpj
 /TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748849062; x=1749453862;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cx0RaYDb88MYeeNdBYIWya8sxL0SHlDdzkxwTt2TDWc=;
 b=tCWvjucaCqY4/vLQhE4T56l0DAkAGrluRYGNIw00fJdaI4NWVZ96HKfvoP02T0BBSY
 U8Ckzp8LPhL+/2Urt7F/EIDtJgaYoNpJMqYfDK6leq7lRsoUjYgH2sLgR/Le2gj0DC+d
 wWMcxLMfCBllj254m03iaznVZ1vzz6ot+W1aaIThQfFU8dkZxHVkyegZl53l8BbBj7lH
 gT0Ib2oshijgByD4y4StqGVAYe26i1uyw2pjBCc/eJYWxVhTnei0DXYbSg+5IwfFkBR8
 Og1J4pVpY3G6dnGxFHfWwkC3yHHaV4NGSGdGb5QK0lNKX9+buTvX2QBbc6yNaH9HoLmv
 qkuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ46tr6j6XxMSJ0NTLFoywErZ1MhDaQcMXWq6VsSCwFvAILB7VRw6StEHQykWh0nP54bFkY2c3gjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxaqzxy+QSaNbsTkVuBNgOvuKhi5hFX90j0+fLpee2jlAR8zzCW
 umW8w6MW2UOm0UuNn5Gkoo7e1biM3/nW3HGWDNIVzWVrh72LIN/MIs1WjLdahomEt0o=
X-Gm-Gg: ASbGncspq8lNwsSbh+fRxD8CHQQsZh0kKZlU0dW/0LdqWnqQQAo0rq1bp503Tmvy+mW
 Zu7cS4iNU8fcxx8YA6YMXijoAPe8ppMsP/KRRJ/ehO5iCmXPCtV9fL6CW2LXGLcBTgkrkv/8UJV
 A6jVO/rKqUI1dF3NrJpZLRXkA8u5PmCqW+PyggleQCeHepbp8rZQ9H8gyUXX9oJKaP2K/2WbvEY
 xiYN6idxzSWXbQdECXKFSoWcIjm+Gl+pfPXKsDfr1dUR347WOrUhGqUSrH8If5o8Lnkb3fkJMj3
 W8+3t+YNKmsvxsrQIyi0PvkLgLOOt80otbto6VcsoGP0lB37avQrGdE=
X-Google-Smtp-Source: AGHT+IEVNyhdFOejr0L1LpDA1g7jRxs4kNrwm5NxBxAJbrQF2oeNR/IcwKlZ4fxQVZ9FMa1DqjLp8g==
X-Received: by 2002:a05:6000:144e:b0:3a4:d6ed:8e2e with SMTP id
 ffacd0b85a97d-3a4fe395675mr5771680f8f.41.1748849062063; 
 Mon, 02 Jun 2025 00:24:22 -0700 (PDT)
Received: from localhost ([41.210.143.146])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-450d8006952sm109189995e9.32.2025.06.02.00.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 00:24:21 -0700 (PDT)
Date: Mon, 2 Jun 2025 10:24:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] kunit: Add support for suppressing warning
 backtraces
Message-ID: <aD1Roe-z6o1Y5K2V@stanley.mountain>
References: <20250526132755.166150-1-acarmina@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526132755.166150-1-acarmina@redhat.com>
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

I like suppressing warning messages but there are still many cases, such
as mm/kasan/kasan_test_c.c where printing the warning message is the
whole point.

We should create a standard way that test bots can filter out deliberate
errors from unintentional errors.  This would also help humans who have
to look at test results.

#define intentional_warning_marker(type) do {				\
	pr_err("Triggering intentional %s warning!", type);		\
} while (0)

intentional_warning_marker("KASAN");

regards,
dan carpenter

