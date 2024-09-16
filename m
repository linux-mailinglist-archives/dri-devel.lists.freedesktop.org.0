Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB3979E71
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 11:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8317010E31F;
	Mon, 16 Sep 2024 09:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n0LoAxo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B961B10E31F;
 Mon, 16 Sep 2024 09:27:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 83CC55C05FE;
 Mon, 16 Sep 2024 09:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04422C4CEC4;
 Mon, 16 Sep 2024 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726478862;
 bh=pUAMi86rwTq+wVgJgsM5jMxxeBpOkJO3emrkyOgd2JQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n0LoAxo0hDsXYtBeVuVt0ft4mZW3HZUYeDl0Q/kED3+MwrED5vAuFGnVpfVemwzM3
 it+g1Hb+0fpACtumqFcyD/RKJSZMR6uYb5c48nuhJbX0x6JV/C6VsS7KL0sfqpieI+
 bmE5p4okg2YXdu0WfJktgHa0Dl6pA8JEYhNNxORslZibW5/7KRyDEs55+yQBWjp8f8
 v+topeF22rxS9vzC5mw+XyOFbivWr8UawD+jIwykyylbSBE882XbA/pWMSHAXc1nzi
 sPCu3LukN9D5uiohLJRHSSm71FWJbu/HKYxMQpScYdtFjmxK6was6MCNK/o7L3YIeb
 AXG6+VEs0IccQ==
Date: Mon, 16 Sep 2024 11:27:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Yuesong Li <liyuesong@vivo.com>
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, 
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] drm/i915/dp: Remove double assignment in
 intel_dp_compute_as_sdp()
Message-ID: <thvv6gywqkygj2tcmbnmpwp7opy3nswphc7n3nxdj7r3roshsf@tm4ntfmv7dun>
References: <20240823023612.3027849-1-liyuesong@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823023612.3027849-1-liyuesong@vivo.com>
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

Hi Yuesong,

On Fri, Aug 23, 2024 at 10:36:12AM GMT, Yuesong Li wrote:
> cocci report a double assignment warning. 'as_sdp->duration_incr_ms'
> was assigned twice in intel_dp_compute_as_sdp().
> 
> Signed-off-by: Yuesong Li <liyuesong@vivo.com>

reviewed and merged to drm-intel-next.

Thanks,
Andi
