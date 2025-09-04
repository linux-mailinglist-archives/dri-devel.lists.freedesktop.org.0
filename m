Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA40BB42FE4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 04:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F86C10E3D9;
	Thu,  4 Sep 2025 02:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iCAkafBm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA2710E3D9;
 Thu,  4 Sep 2025 02:43:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E7D2F443B3;
 Thu,  4 Sep 2025 02:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B86C4CEE7;
 Thu,  4 Sep 2025 02:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756953782;
 bh=zPXfcP6u5ldvZ0n0AJVf3O40vfM/a3dstYlcI1bi8cU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iCAkafBmBXwbyBz65mxgzRKbaJ2jy9doEOh4i669NW6QqmvWF30A76KQuQNzPvbTb
 mZoVQJcI4e/vFmesyozumwb/xWZ52kUGC8AN4WeQonRBlD8JURgBDtTLvcziZNWbp2
 LaAbuJAPF+sKB4xHZHOysRb+mmf2/SqCeuYgTIi8aKl4LlRj0url5bR2qlO/oBAWWc
 KtN1+7NgxKalF0YHIt2pJaRD4uNkRGmggHdRcnYe8oJgTRgoUMd+dfhvk4zOdoKXMR
 pJcr6amhOTmjZFcqBg6SxzjA+c9WhnexgGsd7bdC3H7mwYUjdhVtHmfHXmEQDfLPsh
 XmorXH/sYYCXQ==
Date: Wed, 3 Sep 2025 19:43:02 -0700
From: Kees Cook <kees@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/3] overflow: add range_overflows() and
 range_end_overflows()
Message-ID: <202509031942.A1669D10F@keescook>
References: <20250829174601.2163064-1-jani.nikula@intel.com>
 <20250829174601.2163064-3-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829174601.2163064-3-jani.nikula@intel.com>
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

On Fri, Aug 29, 2025 at 08:46:01PM +0300, Jani Nikula wrote:
> Move the range_overflows() and range_end_overflows() along with the _t
> variants over from drm/i915 and drm/buddy to overflow.h.
> 
> Cc: Kees Cook <kees@kernel.org>
> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Looks good to me! :)

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
