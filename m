Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C51A61308
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 14:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5527010E9F7;
	Fri, 14 Mar 2025 13:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B6910E9F9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 13:49:59 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1741960196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjqPfczUqBdTMrtHlSDdRiCcbc6NaYyR8NlMI1cTcwQ=;
 b=jxlr/ChDjPwqGapJiMF/He1YHfzKVUiMqMNv7H0p3M0UtfWCDRBd9cOEBhlPYSjyJFjV51
 ZlCc3XNzHLVVOnwIFLCNgnmV70zKjv6ebaA0iJJiWqTl345NSINQ1mwMdO6xj0ZPaV2bPL
 VtoKOG1CVteUhSfIk/qmGDgkq10X0meASCdkC2zwQifHio86wmXC6pjzFVkoogYcq/Q51m
 hmAMOQEJ9644ZkIipQz/eES66hDvLzk6rx/UMBbF2+IJ9yjDVbTd0GSBltj24OaY8Lfzrb
 i8u+aEGn0ESAUkfZlKsQawkaIUZt7GJA0GCsZNywA1u7IDGKexolbP2wnACD4Q==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Janne Grunau <j@jannau.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <14a845e8-54d0-45f8-b8b9-927609d92ede@stanley.mountain>
References: <14a845e8-54d0-45f8-b8b9-927609d92ede@stanley.mountain>
Subject: Re: [PATCH next] drm: adp: Fix NULL vs IS_ERR() check in
 adp_plane_new()
Message-Id: <174196019326.15076.17884484110903495475.b4-ty@rosenzweig.io>
Date: Fri, 14 Mar 2025 09:49:53 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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


On Fri, 07 Mar 2025 12:30:58 +0300, Dan Carpenter wrote:
> The __drmm_universal_plane_alloc() function doesn't return NULL, it
> returns error pointers.  Update the check to match.
> 
> 

Applied, thanks!

[1/1] drm: adp: Fix NULL vs IS_ERR() check in adp_plane_new()
      (no commit info)

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

