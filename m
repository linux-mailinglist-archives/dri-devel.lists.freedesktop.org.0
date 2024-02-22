Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548F7860014
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296B710E9D3;
	Thu, 22 Feb 2024 17:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g3bU3gKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E089D10E9D3;
 Thu, 22 Feb 2024 17:51:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E830D61988;
 Thu, 22 Feb 2024 17:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA49C433F1;
 Thu, 22 Feb 2024 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708624296;
 bh=87K/BNPSqBHb6jELoUMOfJtoIDQuPJcqPxBFoL7JzUk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g3bU3gKIaYSgFuFLztbB2H0Ku9y1R4b2urmEEKYuO844drG1E8Yqh7eR1G9JXYnQm
 fNrfxjVobpFrODe60hnUYBMn/6Ncvbb1TqStKJJ+jsaMcfkd6pRJYRMlMis3NtbICh
 T4+NxY7VIdX8XHBePmiA/J35OIf0N3GW/BMA+eOF2h8NetPWkul4YlCWSRpClAxR65
 1wc/wvok2fuRtbVJ+qb8o5YCcCqfrwCpD8OBEvpsw/vMUT85ABka5LSmXby+BW4NXo
 mBTWDRjs8+TApItXi865Co2zwkuwb37BG2vEENfTFLCLzkNgZohsmQGfQoNKEeI9G/
 6HJ3xHharN2SQ==
From: Maxime Ripard <mripard@kernel.org>
To: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Fix possible null pointer dereference after
 drm_dbg_printer conversion
Date: Thu, 22 Feb 2024 18:51:31 +0100
Message-ID: <170862428336.2255763.1694631748206983765.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240219131423.1854991-1-tvrtko.ursulin@linux.intel.com>
References: <20240219131423.1854991-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 19 Feb 2024 13:14:23 +0000, Tvrtko Ursulin wrote:
> Request can be NULL if no guilty request was identified so simply use
> engine->i915 instead.
> 
> 

Applied to drm/drm-misc (drm-misc-next-fixes).

Thanks!
Maxime
