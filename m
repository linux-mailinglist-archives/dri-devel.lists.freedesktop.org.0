Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C229CC56CC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 00:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31F010E6D0;
	Tue, 16 Dec 2025 23:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tYBSC/fw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE40010E6D0;
 Tue, 16 Dec 2025 23:05:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 693E044036;
 Tue, 16 Dec 2025 23:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA53CC4CEF1;
 Tue, 16 Dec 2025 23:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765926334;
 bh=6XblpDM2MxyVpvF5n4JXCD7alP+SzrEDDA25rJ6+9xI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tYBSC/fwrhtoRVQhaE51ArXpL5id0Ypq8KNmimLyGpqM1db25IVcpzgylePudhwqq
 QO/n6FdN8G+Ml9Wsj4wQMtAd+SgWRX+pVjrXhZsCEfsu48bQkOfNP0AnRTv+0egdln
 B61jCTAH0Nk3PdmkKYIji131Rl9MlvkutEdlEekdZjpf6rWhrxdpNK3NUfMdirzp8X
 oGVoyB3RpOI7IARPOskgeBUH8rWRwcb0fQJLQiWKDTY83P1mZrsvCtOec0m2SgbUa/
 gWr+hLqzrZp1BNkyVLs9JEV85TIMK1DEJUYAwzrlUFBo6wVTJOKF/CrqnJGHpm7Nv5
 Lu7vwnseu3hKA==
Date: Wed, 17 Dec 2025 00:05:29 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 stable@vger.kernel.org, =?utf-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v5] drm/i915/gem: Zero-initialize the eb.vma array in
 i915_gem_do_execbuffer
Message-ID: <cawjzyb3alintifoolf45ykiu726guasc7jnj6niwpbprleci3@i6ueo3ppmxsy>
References: <20251216180900.54294-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216180900.54294-2-krzysztof.niemiec@intel.com>
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

just as a confirmation, a question for Mr. Kim,

> Reported-by: Gangmin Kim <km.kim1503@gmail.com>

is it Gangmin or Kangmin? :-)

km.kim looks more like Kangmin.

Andi

PS no need to resend.
