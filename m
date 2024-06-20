Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75A0910C05
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2FD10EB1F;
	Thu, 20 Jun 2024 16:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nu2Yr48S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADA110EB25
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 16:20:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 20436CE2429;
 Thu, 20 Jun 2024 16:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412CEC2BD10;
 Thu, 20 Jun 2024 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718900445;
 bh=Ei2mXhkMdIXa7FVDgJeUlvKaLLb4XZD4GhWPWTEbGqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nu2Yr48SMT1dEChkQZ4vicJt/c6nYv2Fw6IWSIcipsJAWbcMdGVKjF05YMka0KIq3
 cQDU4SVfXPJx7LUIewT3F/xj9S9fMLKu7L18ycjslIuHn+0wmfiYmmo5jnusXD5h1O
 dYgcJwPXw+fYdUIEhzuXZNoYOlj7XCgUMlRRfNxn3ZprHWDKCC5DuZX+SN5yRTWK4J
 fjedakvvr6In6GUx7mW6m2s/kaWMeGf6SkNUA5lAafrSIuPws0f8+cidLkm18FWTBY
 cvlElmnH/l6zdndlkAzl/4WZNPK4Lit46hXHzM9/IgkfrCm4sZJVdKw6GgKdjlgQYQ
 rSLyTWdke1/Vw==
Date: Thu, 20 Jun 2024 21:50:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v12 0/7] iio: new DMABUF based API v12
Message-ID: <ZnRW2axOg7gtKzz0@matsya>
References: <20240620122726.41232-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620122726.41232-1-paul@crapouillou.net>
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

On 20-06-24, 14:27, Paul Cercueil wrote:
> Hi Jonathan,

Hey Jonathan,

Assuming we are fine with this series, how would you like to proceed.
Would you be fine with me picking the dmaengine bits and providing a
signed tag for you to pull?

-- 
~Vinod
