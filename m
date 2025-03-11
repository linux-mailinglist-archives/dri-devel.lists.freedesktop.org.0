Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C25A5BBD4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 10:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA50210E13D;
	Tue, 11 Mar 2025 09:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OsTgjHIS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8730D10E13D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741684571;
 bh=+LmbqfqjpLNk7GtSwJDOFlesjC4+wxWCYVNW6cSONUc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OsTgjHIS83+R6Pd5t0aY4Go4mLKcy3qkW9KB8z7qOB4GPz04tCE6FSVwa5dgq/npa
 /1LkVSwTKzUMjhx8CCJrinfpfkbezJgoVTFSkaFXbUlfi1jUOWOfw6YZmFNOe9Rjs5
 Eq0XeTRxV/W1DYk8H8v8eDUbmgnkYRbvoYqTEymIvlU3GBr7g8pE9UFBsNhkA6qvPy
 B339y6UtlH7KcSwD66lwY5xEvc/oMPYoEc1YuQzYeEJCGZwoXdy6kvs+IF9aGleeVS
 3CMGeJFfsAexILHOhK+ymYTJ9mq5XBD8pmn4I7LNZCkPWbGikXzzcZCTK1eks3NW1M
 3R2ooejUbim5Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8127617E09FB;
 Tue, 11 Mar 2025 10:16:10 +0100 (CET)
Message-ID: <62765c3c-7663-4b27-a839-7fe5ea9a3c12@collabora.com>
Date: Tue, 11 Mar 2025 10:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] drm/panfrost: Set IOMMU_CACHE flag
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-2-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250310195921.157511-2-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 10/03/25 20:59, Ariel D'Alessandro ha scritto:
> Panfrost does not support uncached mappings, so flag them properly. Also
> flag the pages that are mapped as response to a page fault as cached.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

