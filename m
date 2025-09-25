Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B14BA1E23
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 00:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48F810E144;
	Thu, 25 Sep 2025 22:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XtNme6bA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B571E10E0C6;
 Thu, 25 Sep 2025 22:46:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B3C46612C6;
 Thu, 25 Sep 2025 22:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02007C4CEF0;
 Thu, 25 Sep 2025 22:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758840391;
 bh=t2DsUEPm6qWKRIYXsk51iv6HWgPNGA/4bnVm6JkTUTA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XtNme6bAqZ56DljVoyNeIFX9xfpuzXxAfvWBuYPk2rj6v4yjbt69eZiBKDpKuusFb
 1kJxMaN+j0MWG9SFHMM41jBVEFO3yaN3FktUcQ4E8agnwnCmQtNPzX8qLYrgVhWDWP
 wUa0IRM+oCfQld/PFMjYaI/BhxQyLKmlJOywoH6M3aMciDwdCGz6s+uV/CQ/RxwTqJ
 cl8qnVONtxuN7T4fu7qCKy4nIWvCqnDy/KidHWne+5iECjmjK+X4uoMFmQg6GqMTqF
 dPapGfb6LF4I4vPdmZr2kbTs6cyq09wBw0QSoatCmVUTsRnHBDCszfwhLgm3PdtTGB
 hAIknYjcy4gPA==
Date: Fri, 26 Sep 2025 00:46:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Madhur Kumar <madhurkumar004@gmail.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: i915_pmu: Use sysfs_emit() instead of sprintf()
Message-ID: <wg5yvklahbnicpywephsnqaktzuqji2hkekaeztsrtsvlta3fe@emjicnigcmpo>
References: <20250923195051.1277855-1-madhurkumar004@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923195051.1277855-1-madhurkumar004@gmail.com>
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

Hi Madhur,

On Wed, Sep 24, 2025 at 01:20:51AM +0530, Madhur Kumar wrote:
> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>

merged to drm-intel-next.

Thank you,
Andi
