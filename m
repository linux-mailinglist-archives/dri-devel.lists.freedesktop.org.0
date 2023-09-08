Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C20879922C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 00:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5420D10E12B;
	Fri,  8 Sep 2023 22:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622DD10E12B;
 Fri,  8 Sep 2023 22:23:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE72F614EE;
 Fri,  8 Sep 2023 22:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A49BC433CD;
 Fri,  8 Sep 2023 22:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694211792;
 bh=FXFywUmdr66jPdXbOtse+6CoPTgnOO4WDOyT1/edOc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GUllkcuAA6OyvDsH30Uytppb/hFBGFemmi/pQaPbs/vnGevzWD4lqXdLr43b14KbY
 hR+HeuEAzPIU/etiajYFoxTl0o2g7IVYsVtctZNCbsHvlujkFJ/zxmr6MWZ72zR+G7
 dzDZ9qTxTUK7HX2lBDe19Y0USS4+E0GuAMySeqMnwwubq5jbPbfVrSbvsa8kGIEAn5
 iYeZE7sNinGxOYXGAMVNQXkU+cYsuDOv9hl/GlX9OZby43/pu5Z8SIrhhQEJw9q93Z
 GeZ4hB5E8MKzNEJa619SnnOfm51A6FnmriT2xPQMxrWzUWHmiN7d7mJuHFfctMVJ6h
 szUzjxexMARHQ==
Date: Sat, 9 Sep 2023 00:23:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/i915: Run relevant bits of debugfs drop_caches
 per GT
Message-ID: <20230908222308.qjgmxagczpcv6rus@zenone.zhora.eu>
References: <20230907125808.186088-1-andi.shyti@linux.intel.com>
 <ZPnUZ6uUmyWnSdKK@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPnUZ6uUmyWnSdKK@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo and Nirmoy,

On Thu, Sep 07, 2023 at 09:47:19AM -0400, Rodrigo Vivi wrote:
> On Thu, Sep 07, 2023 at 02:58:08PM +0200, Andi Shyti wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Walk all GTs when doing the respective bits of drop_caches work.
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

thanks for your review, pushed to drm-intel-gt-next.

Andi
