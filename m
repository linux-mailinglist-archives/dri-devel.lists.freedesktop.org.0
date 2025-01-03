Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4798DA00FF5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 22:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB5210E05C;
	Fri,  3 Jan 2025 21:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X/xUqUhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A47810E05C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 21:44:59 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-216634dd574so117888225ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 13:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735940639; x=1736545439; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YBVjV7oMUvYtGohtGs9sGbVaUItsCP+eOtBsDk5Z1aM=;
 b=X/xUqUhV3z0ImzRx3gQa0K+BgFABAzwy2TTC2bdHWl6M8d6wkSmfheHwoHWceWK2hf
 6/U4EpQvsC2wyUX/HkhIiMkn1I9GdWnGYO4YZ8VjqdAqruG2gzTa3hLfhqj3ZQ4uYtxZ
 DYmqDpGKMnaEUEiQIyhmAJl0Y0od+L9o1yjA0HGyupVyfzJOAQW2No4YhECs39ligrNs
 nPDhI6TzDg5GiIN5KZSUZXqe+u5/C56/74bdgGyH3vOVfUq+f1Kr9tLpKKj14bSynRq+
 FpETz8KnBZ+51iPa2IryTZg3+mGPkWUxYULRBfPo7A+CBTR1V39YFHlWNiHDkRgiwBti
 VtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735940639; x=1736545439;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YBVjV7oMUvYtGohtGs9sGbVaUItsCP+eOtBsDk5Z1aM=;
 b=IgQdtH14af+Y3pj6HkNovNnTeFc3O9IgCw41mFhRmHgU5SHINBsoG2/rsIhOauOpEk
 3qlfFV9Mi6aWmYvcJbHarvjIXU/5SgfdwKG/GDaxaJbgnQvjE8nN4eTwm/SVVuaY1kNv
 p5+m6Tf8ozhp+k1HYHke7VvqRm2s28kviU28pacZy9utlO8qyA5Pg5s/ewfB1cGvADpM
 Wb2xYeW3yVWX0CrnoTsk7oUNABgOpfi0tEdljzAFkT3JmiePKLmwbn97Rzh0sISi0mcj
 +XK6pWFNdlpBtEXkPDXMIsX5N2QRtN9VporfnjOAcUXBBJ6Ea59maL4kX4iO0BZI92zj
 ChiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx9wVpxHhyTPsFRBttekDDtilfwUFERt2007Sx0LWdc4dnlchdb/tFh8JDfd7n6DtC9wJEpwkgZMA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz42X6RiZMdi1/Ufat9Qu41FxPja8Fk3+DUUifsFn8MdrY4zvY+
 Q+7H82fJvPTcerEu/enGrGZwX0jYXS2Vql42mmOwBXR/mFZrejOt
X-Gm-Gg: ASbGncuaYVfzqZW/ebhoJBh17O08PZrnT55uh5uCTlV2RltNj2RDelSJpzDv6QlqgSW
 bTHBVqrMkztTcOyevTYaEPjw39M7fRHAQ57krRNPeFdPsbRcKDisSwgwU3RBbbnT6K3I21J7sGv
 jdFTjUWRqOrUXh0+iujzMEX4nzr4XBXXncd/2FV8Y+qxT3CjE88dIYxRPUBv35qJYG18O7G7dqP
 xw+dehLwhJIbaxDhr28gaCAYn1iAdHzZfzPGh9uPe4Mzl2FQJAEa4YB1UkWuNUIdAJigdsKk208
 lhAie0Zb
X-Google-Smtp-Source: AGHT+IGRF4jZAad+rllk07+Vs9S921Nvj1wCkaEBwtQXzDSDaGrFmJY7oFRXjecjSLSV0UZ/0CiPbg==
X-Received: by 2002:a05:6a20:9191:b0:1e1:b60c:5bdb with SMTP id
 adf61e73a8af0-1e5e049f2d1mr79966858637.26.1735940638757; 
 Fri, 03 Jan 2025 13:43:58 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-8529e78a55dsm19601743a12.80.2025.01.03.13.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 13:43:58 -0800 (PST)
Date: Sat, 4 Jan 2025 05:43:54 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Yu-Chun Lin <eleanor15x@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, ruanjinjie@huawei.com, jserv@ccns.ncku.edu.tw,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/tests: helpers: Fix compile wrarning
Message-ID: <Z3haGne8A0sJHnFF@visitorckw-System-Product-Name>
References: <20250103161758.1097313-1-eleanor15x@gmail.com>
 <rpeh5mcy4xumebqojfoevvfar5dw4jmvuwt3btjklr4gohqhfs@fjqt6nbcpf4k>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rpeh5mcy4xumebqojfoevvfar5dw4jmvuwt3btjklr4gohqhfs@fjqt6nbcpf4k>
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

Hi Dmitry,

On Fri, Jan 03, 2025 at 08:14:20PM +0200, Dmitry Baryshkov wrote:
> On Sat, Jan 04, 2025 at 12:17:58AM +0800, Yu-Chun Lin wrote:
> > Delete one line break to make the format correct, resolving the
> > following warning during a W=1 build:
> > 
> > >> drivers/gpu/drm/tests/drm_kunit_helpers.c:324: warning: bad line: for a KUnit test
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202501032001.O6WY1VCW-lkp@intel.com/
> > Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> 
> Reviewed where?
> 
Yu-Chun is a newcomer looking to contribute to Linux and asked for my
help. As suggested in the last section of [1], she asked me to review
her patch privately before sending it to the public mailing list and
include my Reviewed-by tag. This improves patch quality and reduces
the maintainer's workload by minimizing potential issues.

Although I'm not a DRM developer, I have been contributing to Linux for
some time and wanted to provide support.

[1]: Documentation/process/researcher-guidelines.rst

> > Tested-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > ---
> >  drivers/gpu/drm/tests/drm_kunit_helpers.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
Thanks for your review!

Regards,
Kuan-Wei
