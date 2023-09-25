Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931417AD65D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 12:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A053410E232;
	Mon, 25 Sep 2023 10:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CE310E232
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 10:48:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 88EADB80D3E;
 Mon, 25 Sep 2023 10:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5213FC433C9;
 Mon, 25 Sep 2023 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695638915;
 bh=/LefVaK2r6dhjQD0FjoLJlEhyV3w7+sO/UDevvSJ9KA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=W37ZhtByQB0sL6ztZ7emAQjxn1oWW/Y46gP91TnoZEQ4UGkZnmMBg1HRmFArrJaQT
 a1y9JCbItkVfSjvWLzjBYWaU9vw5z+TgOjyj+AlFFFylz/+Ifs6gpdJ1Vai2+N0TTV
 8ZfCfxCRi9VIVuBZ3CSGKnbwujqc1mkpzGJ54g3sZ9qHEzvDKaSEb3J/z6+GHaaHjS
 7KcMdd6cycyY9fkrHlRWUzLlIlLMPhUqvvxmU1nIX/HIH82JvJPZRzeeujhRdxcvTe
 QV809Ca5xMW+rG0OsWxtO+mynLG88dyuIy4JXSCZUa0Q4fzIfuLMX1tq3UTNRDEyI5
 cB9bprRO16g6Q==
From: Robert Foss <rfoss@kernel.org>
To: David Airlie <airlied@gmail.com>, Xin Ji <xji@analogixsemi.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20230922093450.3574349-1-xji@analogixsemi.com>
References: <20230922093450.3574349-1-xji@analogixsemi.com>
Subject: Re: [PATCH v2] drm/bridge: Add 200ms delay to wait FW HPD status
 stable
Message-Id: <169563891302.3680913.670156571122914627.b4-ty@kernel.org>
Date: Mon, 25 Sep 2023 12:48:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: qwen@analogixsemi.com, bliang@analogixsemi.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Sep 2023 17:34:49 +0800, Xin Ji wrote:
> For the no-interrupt design (sink device is panel, polling HPD
> status when chip power on), anx7625 FW has more than 200ms HPD
> de-bounce time in FW, for the safety to get HPD status, driver
> better to wait 200ms before HPD detection after OS resume back.
> 
> 

Applied, thanks!

[1/1] drm/bridge: Add 200ms delay to wait FW HPD status stable
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=330140d7319f



Rob

