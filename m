Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68680B3DE64
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 11:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152D710E3A4;
	Mon,  1 Sep 2025 09:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="NmRDpvo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EAA10E3A4;
 Mon,  1 Sep 2025 09:27:09 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cFk6J3zggz9t94;
 Mon,  1 Sep 2025 11:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1756718824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vlucI1qXn/i28lahrLwdrBh1MDGe5BAq5K43ycGpETQ=;
 b=NmRDpvo/0m7bAPfBrB74HPBPJq08mK4ak2E2irt06CUbo72lHvLLJ4hLu5/eQlr8nfKvsv
 /SVbyH8qYm7Se58M8V/WEzqNd333tgpFwaT9uXlraRllKvYTwdvhK0sOu/qvvcgkSYIh19
 uFPsMl8RjWXt+OespQuYtNH/8wGqJgiX5VezFY5UDk2FYPLDyCKfHhJo1ims2D3gxAmTrM
 ZLqdr/pQfHoSWSK3UBLln2E2/GWGpr5lytjrdXF1e/dO08sXZkWdNDhdnqJZ5xXQMq7n0P
 wYsy3BaxsFyXXq5ANj1ft/xY51u0iQ57/ql8cKWJoiA1uKwDRdfJVuXGP4CEXA==
Message-ID: <51ae551b-6708-4fcd-84f9-fc1400f02427@mailbox.org>
Date: Mon, 1 Sep 2025 11:27:01 +0200
MIME-Version: 1.0
Subject: Re: evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource
 seems too big for the bo
To: Borislav Petkov <bp@alien8.de>, Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250829171655.GBaLHgh3VOvuM1UfJg@fat_crate.local>
 <CADnq5_Oqonrth+5T-83dnFBZ67GvykkPt-9aUepJd+fUMwnupw@mail.gmail.com>
 <20250829194044.GCaLICPKJcGJRYdSfO@fat_crate.local>
 <20250829204840.GEaLISKGTwuScnDF8Y@fat_crate.local>
 <CADnq5_MbpYmC2PSyOr0gQk7F8mVz0-LG3dZtUZS2HhV8LTgDww@mail.gmail.com>
 <20250830174810.GAaLM5WkiFc2BtQ6kW@fat_crate.local>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20250830174810.GAaLM5WkiFc2BtQ6kW@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: fbb9b5b97304bf83e9d
X-MBO-RS-META: p8bwh9jm4mqhjxsrb7dwcebcgr53kora
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

On 30.08.25 19:48, Borislav Petkov wrote:
> 
> diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
> index a46613283393..6285ff1b1bff 100644
> --- a/drivers/gpu/drm/radeon/evergreen_cs.c
> +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
> @@ -2418,7 +2418,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
>  				size = radeon_get_ib_value(p, idx+1+(i*8)+1);
>  				if (p->rdev && (size + offset) > radeon_bo_size(reloc->robj)) {
>  					/* force size to size of the buffer */
> -					dev_warn_ratelimited(p->dev, "vbo resource seems too big for the bo\n");
> +					dev_warn_once(p->dev, "vbo resource seems too big for the bo\n");
>  					ib[idx+1+(i*8)+1] = radeon_bo_size(reloc->robj) - offset;
>  				}
>  

Like all scenarios which can be triggered by user space, this should rather use some kind of debug output API which doesn't hit dmesg by default (can be a non-once variant instead, that's more useful for user-space developers).


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
