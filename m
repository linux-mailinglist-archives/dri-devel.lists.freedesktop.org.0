Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D267912DF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 10:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D9310E2E1;
	Mon,  4 Sep 2023 08:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5AD10E2E0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 08:00:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A8395CE0E39;
 Mon,  4 Sep 2023 08:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D61C433C8;
 Mon,  4 Sep 2023 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693814436;
 bh=msH+AlW1tcnzrzUkcVH/Gu9dCYW/mw+O6xT2pWlSs9M=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ka9xt4kMgaXoKCttn3PTsy/pLUsanMSnIUZu5nMztBnSY0Wdzf6Dew7ALC7I+Rqdb
 ZtFVsXZ0oRdRFZ097j4GXusIpKe6qP1i8uQ060FdShTuPNNV7+Cf12ScsnQLXx2O6k
 hJsXvyjbbEc/2PmpFJcdizh2eKOeUXKmg+lxtLBmnQvq4kDO7fATE0ZI5V/EbxvIeo
 /hf0eGtgU7PesSck8b14tvH1M2iSyEmpidZw0ou54S9x+U+JsZO8IozatJNez+bGKq
 Q2T9/AIU9uHcBmHafOGNfIuDXOb1yZhv58vQFjLoAjQ9cBhnENTAk6MAlYEO4zn25J
 RTzUxL16SoUBA==
Message-ID: <1506b6324d05084097f1971520d76fa0.mripard@kernel.org>
Date: Mon, 04 Sep 2023 08:00:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 5/6] drm: Call drm_atomic_helper_shutdown() at
 shutdown/remove time for misc drivers
In-Reply-To: <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
References: <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
Content-Transfer-Encoding: 7bit
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
Cc: linux-aspeed@lists.ozlabs.org, tomi.valkeinen@ideasonboard.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, emma@anholt.net, joel@jms.id.au,
 airlied@redhat.com, tzimmermann@suse.de, raphael.gallais-pou@foss.st.com,
 Maxime Ripard <mripard@kernel.org>, hdegoede@redhat.com,
 linux-arm-kernel@lists.infradead.org, jfalempe@redhat.com, andrew@aj.id.au,
 yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com, jyri.sarha@iki.fi
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:39:56 -0700, Douglas Anderson wrote:
> Based on grepping through the source code these drivers appear to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time
> and at driver remove (or unbind) time. Among other things, this means
> that if a panel is in use that it won't be cleanly powered off at
> system shutdown time.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
