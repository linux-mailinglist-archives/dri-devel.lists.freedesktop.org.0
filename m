Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60A4AA0DEF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 15:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D05010E49B;
	Tue, 29 Apr 2025 13:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="Rkam68wZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C7710E49C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 13:54:02 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1745934839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E1lLURUsSdwGQwA1DpK4H0AkncQTf8FYKvvqWja0pLQ=;
 b=Rkam68wZr3GwpXXOltzrIfaHGz2wSBbLk2/ZSBAUayXSEqmhoO/gBRFhfe4VLJDH8ENfO9
 q5WtRKdHRG7MawzWAugt8HQAIqpI8TcOTxjK+/7R0aBVQU+YdK6Fj6jtgVHt/Xircm6rKz
 9ZkygCJ6CotJd7YZXS5c9QvU4jJF2WiBimV187N0GyJZ4slP3OS4BFmj3JGCg+lMfOsnLq
 KinrflfSea4V8hqRo22O2lfgWCjexZHiHy6CXzWLr2ATANxhJLCpgjAPoNaK5Gvpiw+lDt
 6kzHaMAU/kse2Ffku084rc+bJaMhUFEIj0txBCZfd8UhIsd89ekxlb70exK+PA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
 Maciej Falkowski <maciej.falkowski@linux.intel.com>, 
 Lizhi Hou <lizhi.hou@amd.com>, Aun-Ali Zaidi <admin@kodeit.net>, 
 Aditya Garg <gargaditya08@live.com>
Cc: dri-devel@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
In-Reply-To: <PN3PR01MB95970778982F28E4A3751392B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB95970778982F28E4A3751392B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] drm/appletbdrm: Make appletbdrm depend on X86
Message-Id: <174593483784.171975.17962822910849331538.b4-ty@rosenzweig.io>
Date: Tue, 29 Apr 2025 09:53:57 -0400
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


On Thu, 10 Apr 2025 23:50:01 +0530, Aditya Garg wrote:
> The appletbdrm driver is exclusively for Touch Bars on x86 Intel Macs.
> The M1 Macs have a separate driver. So, lets avoid compiling it for
> other architectures.
> 
> 

Applied, thanks!

[1/1] drm/appletbdrm: Make appletbdrm depend on X86
      commit: de5fbbe1531f645c8b56098be8d1faf31e46f7f0

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

