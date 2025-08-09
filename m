Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8677B1F481
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 14:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C2610E1A4;
	Sat,  9 Aug 2025 12:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SJPhA7ty";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2753710E17E;
 Sat,  9 Aug 2025 12:00:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A99325C53FF;
 Sat,  9 Aug 2025 12:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCFBC4CEE7;
 Sat,  9 Aug 2025 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754740823;
 bh=G9Y86yEKl/OQbyDpbnOxMl2AIRYIjfol7N+IaJnktGY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SJPhA7ty3dtS0ZCWINuLv+UkCmgqg8gcRv2ZgfqgMGEO5qycVRQoi3AIfriUnIjDP
 qx+2BoQc4304doOkvyCTp/IXwySULvtwRBF1rfhn+9EHG+3vMOdci8mb8S1fcclbhd
 58bbGM+h6tpNYPZy9A0IVu3/UY5WaREeQZy1oinmeTd4bDUbet/xMjRQtsQOBYiXke
 NZvFno/VS2q9sKG3JhzS7EuH+w7/bEZHcLBPAlpA68IwFWvbBlJTKJK+3h8/iGlr3L
 nSfVjLemXQMfy0nM/8Q2s+JlGXpVteevcDmnHsGabYKUoOWhylquP4oT4kpO+UW5xX
 O8D952sECK5Ig==
Message-ID: <a0e84862-858e-44cf-aadd-31bc6b3fec08@kernel.org>
Date: Sat, 9 Aug 2025 14:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: replace snprintf() with scnprintf() in
 nvkm_snprintbf()
To: Seyediman Seyedarab <imandevel@gmail.com>
Cc: lyude@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250724195913.60742-1-ImanDevel@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250724195913.60742-1-ImanDevel@gmail.com>
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

On 7/24/25 9:59 PM, Seyediman Seyedarab wrote:
> snprintf() returns the number of characters that *would* have been
> written, which can overestimate how much you actually wrote to the
> buffer in case of truncation. That leads to 'data += this' advancing
> the pointer past the end of the buffer and size going negative.
> 
> Switching to scnprintf() prevents potential buffer overflows and ensures
> consistent behavior when building the output string.
> 
> Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>

Applied to drm-misc-next, thanks!
