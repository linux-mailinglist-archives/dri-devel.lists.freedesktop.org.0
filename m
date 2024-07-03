Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED39C92537B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 08:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE6310E732;
	Wed,  3 Jul 2024 06:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="msqADFNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1AB10E732
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 06:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1719986667; x=1720245867;
 bh=1Tw2pPg5VcTqdZV+dstC4dUr6AJmx6XOfqPDGcrnLKQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=msqADFNGzz+QGisVihmrsWXDDg+9XIP/sd7IIj2xHjU4DxetwlnXvTzA4eFo35XL3
 ogYq2hwD2QmhAzYm3JCeVEUHh5UoyZM9ZbBi4MdvE/hCZz9qUoLvWpuVkHwdnCWFp2
 fuPYP4Rc2I1iG5ZeDglhBAiSHXeA0E3ABlaRWDHVjdFLQDtqI+aGHxIy4lliPYC/V9
 w9S94uRry3rOpsANQFvp6UbRCodmxMmnypguiAg6Y6tYW3QlInYLDAjfojsWz5SDv/
 k5U+zhKF5gbUepeFp87VXFn9xe5YZXYpUwJfkmAPczaiqljksXvw1++iAYVadqcu+z
 ihdClS3v3nKVg==
Date: Wed, 03 Jul 2024 06:04:21 +0000
To: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/atomic: Allow userspace to use damage clips
 with async flips
Message-ID: <Y7XXNRZbyuqt9XZPtxVFRJgywsSTpsDwdWZjhxWnYH3lPSwa0-hVV1kgXzb0q8BAMRvH8eEMdPHOvgAn2KI5HcaWazmQvRyfI7NvQBAU4Z0=@emersion.fr>
In-Reply-To: <20240702212215.109696-2-andrealmeid@igalia.com>
References: <20240702212215.109696-1-andrealmeid@igalia.com>
 <20240702212215.109696-2-andrealmeid@igalia.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 0dd41e430d756e207182de869cba7ff4f635e530
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Looks good to me as well, thank you!

Reviewed-by: Simon Ser <contact@emersion.fr>
