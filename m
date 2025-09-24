Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9704B99739
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 12:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B90410E6E9;
	Wed, 24 Sep 2025 10:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iIsn9hQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1BC10E6E9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 10:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758710353;
 bh=VQ8VOZmpdDGrQxu5JvAU61J13zwKbyZ5/3P7rrRWAdE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iIsn9hQ+xV1cS8Kxaeswc1Kb5Tok5ZzW/txEt4ryXjW+JVbp7UaVItzTWHQ4jlK4w
 uebVDe+MvllN4sLMmJm6Z+49p741d0gJLkwk5zLcauI5m9ziG6/ly5fR0RHpM10eY3
 WQuzIeI6o2hNgQcTK4TCDkDkF2qHeeDue3ZUAGblrJ7r1fYPIcl7Z4RDLMImq2lEi2
 tu4OBaQ6bDvXdohCkZ+iXX24RnGPvlv3ge+agRzrnnp3WM1N1zWnrkGvoULwp7kIn2
 ledvoYaWcTDWSEO2TnlqdwQvZMsIvf7RNFeS8A9sAAjPr9/HySKxb1FwjuXybrNkf5
 nG6Y1AKpGu2Qg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E46817E068C;
 Wed, 24 Sep 2025 12:39:13 +0200 (CEST)
Message-ID: <7f3a096a-fb49-4d43-be60-9cb25c4e1d16@collabora.com>
Date: Wed, 24 Sep 2025 12:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/mediatek: fix probe resource leaks
To: Johan Hovold <johan@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250923152340.18234-1-johan@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250923152340.18234-1-johan@kernel.org>
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

Il 23/09/25 17:23, Johan Hovold ha scritto:
> This series fixes various probe resource leaks in the mediatek drm
> drivers that were found through inspection.
> 
> Johan

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


