Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FC7AE732C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 01:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC0910E647;
	Tue, 24 Jun 2025 23:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U+D62ww3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B1210E642;
 Tue, 24 Jun 2025 23:30:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9C2955C5E0D;
 Tue, 24 Jun 2025 23:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CB5C4CEE3;
 Tue, 24 Jun 2025 23:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750807801;
 bh=MuzVbQeTY/MUN0sWtEjlmOlmM96ThH+TLpj57VHfoOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U+D62ww3XWpPedTFfWKm2DY5A2b4tFVE9lgbghBxWP8V1Xjmryr/7ZKESIutXEO6G
 W4RlAUYs08I5HDHC4dR0Jrq6aMfndbbSWx26zEObCvawQz/lzFV0hl0WGP9QHn/0FG
 QOx0iVXrfTC8f3eG8IkH3Xu5qJdU7DIOLJnchdgIs2oJWlAaxhZXpxVq/oKBzlHn2B
 X6s/tAB4kXV/aEFX/JxJ44OjkNti0XB7OwBkQoWkA0/6hfEcnX/lRm2Suh/w8kc/7G
 S5tNP8suQ0DNSKZr9cuF5xpiqVG28u0oQA5t3Z7WCbUrfJ6fFvXUo0gsG3NpUhJzK2
 cV+XD+ofiu48Q==
Date: Wed, 25 Jun 2025 01:29:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: consider `clippy::cast_lossless`
Message-ID: <aFs09WPfK1i-zwCC@pollux>
References: <20250624132337.2242-1-dakr@kernel.org>
 <20250624132337.2242-2-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624132337.2242-2-dakr@kernel.org>
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

On Tue, Jun 24, 2025 at 03:23:23PM +0200, Danilo Krummrich wrote:
> Fix all warnings caused by `clippy::cast_lossless`, which is going to be
> enabled by [1].
> 
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com [1]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to nova-next, thanks!
