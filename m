Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D2EAE2A1A
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 18:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C4010E107;
	Sat, 21 Jun 2025 16:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u+fEWf3J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C6810E2DB
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 16:03:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7BF36A4EA6C;
 Sat, 21 Jun 2025 16:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37C1C4CEE7;
 Sat, 21 Jun 2025 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750521835;
 bh=fK0szu7oKlcx4ykmNjXo08CHT5AcRlE5UnCS2Rd0ivU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=u+fEWf3JpwaQFvkurB2cj92/djRgmEnGIJEl/mdWXIDbOTH6jDwNn+smq87gvEsye
 AHgqB+9DY9lSohUc8SQeXlqHSMdQx+vXQzyGbvLvCVQgfTqH8+y3Bky1JitoAOr/8d
 vikt6nrEmTk7LevSkyKPD4S/C+UQi++L8dBwQzFJGhBXZzM6y0k1KvOQqw4hjvdgo2
 /mpgXcomEDj5y/vOKWA1fHDoQcQH2dEZN2C9tm+lCX/en02EmtVDx8tCXP9o2GAdXG
 BeG7V07ritbMdx/ZOP7zS9wNpTlqdOt7VpBnlpJgtqG83FrdoZ0GfD6t+aLV9c9ydg
 0TmmFq8UUK0pw==
Message-ID: <5e0a5cac-b88b-4721-a516-b179f9cfd3a0@kernel.org>
Date: Sat, 21 Jun 2025 18:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: Add Apple SoC GPU
To: fnkl.kernel@gmail.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250613-sgx-dt-v2-0-fb2b7d1c3ff7@gmail.com>
 <20250613-sgx-dt-v2-1-fb2b7d1c3ff7@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250613-sgx-dt-v2-1-fb2b7d1c3ff7@gmail.com>
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

On 13.06.25 23:17, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add bindings for the GPU present in Apple SoCs
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,


Sven

