Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE12814A25
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 15:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B37010EA25;
	Fri, 15 Dec 2023 14:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3428510EA25
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:12:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8C8EBB82839;
 Fri, 15 Dec 2023 14:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70692C433C9;
 Fri, 15 Dec 2023 14:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702649550;
 bh=DsbgY/uwwGNpejz1AXvX+dQX7RxzvKOSSNS1eb1nUeE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ij3V6t82jONjn6xc1jPYRViW9C2ERfrm4U8o+m8nry/QuVQg6KN1qxLknQui5gwA8
 Uz1xGdOmyXvC1nQGd9o01hTAfHBW0WyjWneSCVesEHl8fIvAlUGDKhn3cTWBH5KI3C
 0ERXK4DEf+pBM9WhJZ54zA5VsRrBdT4eVJHO/Vg7BsCG0EsmOG41FA9UkNqQ+R26lY
 MD+W5Q8b1xSY5SjYsuzfcWzW8pkgIPUQjaIjopdUetoMcrzlLKGeOvBXw/5ue8NEiA
 XRgZl+RnTPABhJzF1qoy9s05WQjdP1Mel5QPzskp9ML0CJacJOK3cVt2ShFmR8U/Mc
 8IjsHoJiQtsSg==
From: Robert Foss <rfoss@kernel.org>
To: linux-kernel@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231207161056.183442-1-dario.binacchi@amarulasolutions.com>
References: <20231207161056.183442-1-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH] drm/bridge: samsung-dsim: check the return value only if
 necessary
Message-Id: <170264954712.2122029.375265515783012819.b4-ty@kernel.org>
Date: Fri, 15 Dec 2023 15:12:27 +0100
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Dec 2023 17:10:43 +0100, Dario Binacchi wrote:
> It was useless to check again the "ret" variable if the function
> register_host() was not called.
> 
> 

Applied, thanks!

[1/1] drm/bridge: samsung-dsim: check the return value only if necessary
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=045159f5018e



Rob

