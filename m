Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A67FA90D70
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 22:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BD010E059;
	Wed, 16 Apr 2025 20:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="QjEN8QTy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC4F10E059
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 20:54:53 +0000 (UTC)
Date: Wed, 16 Apr 2025 16:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744836884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BdCAA4szi1rLY5SwDTelw4P+GCAkgmWINWKCkQGRqDk=;
 b=QjEN8QTyP48jcL4UQEKChxD75utKPwS8ffWRPIGkozSSjm5Zrcm7lrV+ykCPpHxO6v2DA/
 IKqpong1eLMRy6uaAkfJ7jJkHrr3ZGy+kpGMQui7JPEc9G4PVslib9WijiSuLnnh0ctCyV
 JCjHNwhmsTB0sdiEbfMqAaTd3+Hv0bBserGu3ABrh3LjKxk/LQ1PZXO24/p3SQVcIORwp0
 OOuH9RSEt+/JQ9KiErqjVyjXiRAyBPlJFaDnJVxp3RPXWtrGcq4z3FV2/vznHxKOngQ5mj
 UlSawL3oCg2DrfRrdivrbX5EwWVZu/kDRbiMViBGQB7t491BMwU9csets/Qz6g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: j@jannau.net
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Apple Display Pipe driver fixes
Message-ID: <aAAZDuuj64iLJevQ@blossom>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
X-Migadu-Flow: FLOW_OUT
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

> This is preferable to driver changes since keeps the device powered on
> if the adpdrm module is not available during boot.

Struggling to parse this sentence, do you mean to say:

> Driver changes are preferred, since that patch keeps the device
> powered on if the adpdrm module is not available during boot.

