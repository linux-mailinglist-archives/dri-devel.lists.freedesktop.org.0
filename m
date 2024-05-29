Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6BC8D331C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 11:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA9810E063;
	Wed, 29 May 2024 09:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="d4MlCvme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com
 [95.215.58.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FB610E063
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 09:34:19 +0000 (UTC)
X-Envelope-To: thomas.hellstrom@linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716975256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DpRFKHa0XzbOjPX5pgDeEcp6EWr73jnfiS3ZPi25OU0=;
 b=d4MlCvme7bEDBjZilQ2BqdxoLUERsae5XWd6EBRFTGfEsWcqazag9gvpDuU9cx7DbHIclh
 V8tBMCpvvdxZR2lEWNq19b5l9hnbuVIvPbO3va4nipHg+Nz7hpaq0oTnrRAX3U1jw6HALe
 I78iQ6ULjx5rhfR9V27ob87/ac3fBWo=
X-Envelope-To: intel-xe@lists.freedsktop.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
Message-ID: <698283d7-be31-43de-9c77-adaebfcf83cb@linux.dev>
Date: Wed, 29 May 2024 17:34:06 +0800
MIME-Version: 1.0
Subject: Re: drm/tests: Add a missing Kconfig select
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedsktop.org
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20240529091955.173658-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240529091955.173658-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi,

On 5/29/24 17:19, Thomas Hellström wrote:
> Fix the following warning:
> 
> WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
>    Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
>    Selected by [y]:
>    - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: 54cb39e2293b ("drm/connector: hdmi: Create an HDMI sub-state")
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org

Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
