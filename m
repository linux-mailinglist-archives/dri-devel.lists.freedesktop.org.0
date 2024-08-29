Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E7C963FB1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 11:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DC210E64A;
	Thu, 29 Aug 2024 09:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="N6zHy7ZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339CD10E64A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 09:17:02 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724923011; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TN9cOLTYbMygpuY6e8KQYylACjN/X5nN3Kx71sHXSuKKJGI7ZZovk6OJ5xqvgT3SwEml9g8B56TWWpcFY7v2IwMKr2nYkK+SjVI6a6ljuqoDvr+JPhhwJ4IaqVpcwrIGmVAUh95NQJF7Wk/M6z4ANAdaVhH5zkIvs/rgxGaMyi0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724923011;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CeqtPq4Of6cCwgfNO/CZrPsYGQ8HjCTe8pSeUG4g1Wk=; 
 b=kUDjKMIV42uXa02GpdOttvE9Url0zEjz073WUxLR+V7jHn2MQVwI8HJHtCAcwdLdaYyoWOwZKINH6efmV0uRhl49VBaWAkGWfNXHsVNribZy0kKr0sLT/r1OfpT78XSYIvKKID1WVxrcIPqRmmJTnTdV+n+5fL+jMw5mwhLbwrs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724923011; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=CeqtPq4Of6cCwgfNO/CZrPsYGQ8HjCTe8pSeUG4g1Wk=;
 b=N6zHy7ZLVZDeyQq5h9ClfGGR2SuOLv0olPbL55MI+lW/I2D+F19xPWWYvGQnXyru
 99gp04E15dFLPC/zQSXXFQ8T6qJajBxZrPa7RiypbB5KZcZHshw+iXPT5vzggvlwew8
 Xv8Y4vbFuAYJrT09S8+DxhQrVycQF80HriZVF9K4=
Received: by mx.zohomail.com with SMTPS id 1724923010315143.8140512201934;
 Thu, 29 Aug 2024 02:16:50 -0700 (PDT)
Date: Thu, 29 Aug 2024 11:16:45 +0200
From: Mary Guillemard <mary.guillemard@collabora.com>
To: Mihail Atanassov <mihail.atanassov@arm.com>
Cc: linux-kernel@vger.kernel.org, kernel@collabora.com,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nd@arm.com
Subject: Re: [PATCH v3] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
Message-ID: <ZtA8fRsMgP_5Xihv@kuroko.kudu-justice.ts.net>
References: <20240819112508.67988-2-mary.guillemard@collabora.com>
 <4538ba23-ee8b-4e15-8857-d653d581bc18@arm.com>
 <Zs7d2-NHTy-A_oLL@kuroko.kudu-justice.ts.net>
 <ee2c315c-b15b-4ac7-8cea-c331a60a3374@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee2c315c-b15b-4ac7-8cea-c331a60a3374@arm.com>
X-ZohoMailClient: External
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

On Wed, Aug 28, 2024 at 11:09:09AM +0100, Mihail Atanassov wrote:
> Do you have a link you can share with the userspace side of things? Assuming
> userland has been reviewed and is ready for merging, and the small nitpick
> above fixed,
> 
> Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
> 
> -- 
> Mihail Atanassov <mihail.atanassov@arm.com>
>
Hi Mihail,

Userland patches can be found here [1]. They were tested on OpenCL
conformance tests and piglit with G52 (with panfrost patches [2])
and G610 (with those patches).
 
[1]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30553
[2]https://lore.kernel.org/all/20240819080224.24914-1-mary.guillemard@collabora.com/

--
Mary

