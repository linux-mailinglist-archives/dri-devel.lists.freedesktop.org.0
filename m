Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F05FB42FCF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 04:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E956510E3D7;
	Thu,  4 Sep 2025 02:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="isABCT4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004E910E3D7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:37:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9BFD040607;
 Thu,  4 Sep 2025 02:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37414C4CEE7;
 Thu,  4 Sep 2025 02:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756953466;
 bh=bGGamGC/v1xDdqp+gzyDAlxjoS50x3wJ7xGmH8xSejY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=isABCT4LgbDKXvqgX2w4ieBibu6DLFXmgb/ktYmZWmX6Fufc8b94+Bm+947LK5xGa
 JSXxGWz421RRHg1wURcSXPxHyAQtcT2vFUNFmvPleoutcUOe8vbzdxMVYcQP4+HdjE
 mjssz7uidKb4BvrODpmx4A4L8vYZ+X8ho2rZaW2/ezzzsz9+OtNVJvaklAbphKMUKe
 3GtAVpCrRifizDwFD9ndXx+bK/6s/RXzRFqJY3/1LGTauAIpgq8ELXu9G3NFvSzNa0
 fvKb7vifi2xo+LsSPR4WOa24NKgD1oKHUcWvRCFzl7n8DN548t0hST8kd5s9PqtXCs
 EoaWBXkxiTFcQ==
Date: Wed, 3 Sep 2025 19:36:36 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-crypto@vger.kernel.org
Subject: Re: [PATCH drm-next v2] drm/bridge: it6505: Use SHA-1 library
 instead of crypto_shash
Message-ID: <20250904023636.GC1345@sol>
References: <20250821175613.14717-1-ebiggers@kernel.org>
 <CAGXv+5FxXcJxfCUcX2SY-agbi-sr+btXq2-sDx6quwGF2vu8ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5FxXcJxfCUcX2SY-agbi-sr+btXq2-sDx6quwGF2vu8ew@mail.gmail.com>
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

On Mon, Aug 25, 2025 at 04:55:17PM +0200, Chen-Yu Tsai wrote:
> On Thu, Aug 21, 2025 at 7:56 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > Instead of using the "sha1" crypto_shash, simply call the sha1() library
> > function.  This is simpler and faster.
> >
> > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks.  Can this patch be taken through the drm tree?

- Eric
