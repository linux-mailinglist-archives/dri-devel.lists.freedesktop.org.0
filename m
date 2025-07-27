Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA994B12D42
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 02:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94F010E2EC;
	Sun, 27 Jul 2025 00:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="j2vuk7+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Sun, 27 Jul 2025 00:55:49 UTC
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09BE10E2EC;
 Sun, 27 Jul 2025 00:55:49 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bqNKv45Bdz9sp0;
 Sun, 27 Jul 2025 02:49:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1753577379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a53d9aoObtRCbPa9u0Apg6/R/vHkZ8x0X/h8IvjYC20=;
 b=j2vuk7+GWuCAFVpKwcj3x3aDvD4pPz5yXqelaXlmCp6BaLoqTjHz3oCMaS51zq9PGpiUXZ
 8hAg2JYYbi2ucuT5MMHxLAOfqqb+QvHJS5ZWgsq4SsP5zzxszpAZ/Q3b8u4ZnMvu+6uuKb
 gMUDQEiR5hOgGrsgW4WVkyPFzzpTJtJqxxCY/K6m+P4NgJVAXMV4KlOatdAvPx8kJh0cyk
 OXIBQ7yUXGpy3JI4BH6112sstA0NFtEze7Z+cETIPtXe/hvmUhlkM6zRhPzCLgWVHUW5oH
 H91zhuesb1FrFvf0nhH5diKJ3+rzC4X3HHpL5gyjCExIvWqCR2C2KhrqJOv1oQ==
Date: Sun, 27 Jul 2025 02:49:35 +0200
From: Anthony Ruhier <aruhier@mailbox.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/17] drm/msm/adreno: Relax devfreq tunings
Message-ID: <acawiyjobxkmvgmjcr6ct6lkkoom66q6tn25wyrsqusq2hh2hq@t5di44stzbp2>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-17-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-17-9347aa5bcbd6@oss.qualcomm.com>
X-MBO-RS-META: ez5yztpbkr5h39tq1gyjgfyzemm7pyy9
X-MBO-RS-ID: 9ce0f1739a2f2abe88e
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

Tested-by: Anthony Ruhier <aruhier@mailbox.org>

Thanks for this patch series! I tested in on the Yoga Slim 7x, it works well on
my setup beside this specific patch. On Hyprland, it makes the animations
stuttery (in particular workspace changes, which are by default similar to
Gnome's).

Dropping this patch fixes this problem.

Thanks,

--
Anthony Ruhier
