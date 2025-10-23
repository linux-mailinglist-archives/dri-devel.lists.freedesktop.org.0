Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B08BFF543
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 08:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B0B10E887;
	Thu, 23 Oct 2025 06:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jookia.org header.i=@jookia.org header.b="MI3EbTcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 437 seconds by postgrey-1.36 at gabe;
 Thu, 23 Oct 2025 06:23:20 UTC
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D480E10E887
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 06:23:20 +0000 (UTC)
Date: Thu, 23 Oct 2025 17:11:18 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1761200160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OaSLgSDNZ5V/tZyuc4ElhbmLojmIUJ+b33N9cozmVbc=;
 b=MI3EbTcYJCv3U3L6qyQC2/BvBNHhVDD66j3MSni8vN+0xjwo/J+edDMA7VVnC/zaBF8kT/
 kcGDKjFQVWLNVLqAdC47Ri9u609HG3Pr0ZnTmkldmR9RlQpjtbW4HJRgsKmG36h0bxXnAz
 +I5SF0E0HRahsLxQZHGGoTLyr2SM6a8y4hdB7s3P/ic35RjE2ddLb5dHsn0RV9KKbT9Tsy
 mo0TXLmUPtayKBsL0Q8wpe6hNVCrAn97VvAG69W/kmQCxQ1sfxZNVZVz881vzV53iejaWG
 Tb0H71AwhaehE96pwd0D0LxPutiQ2pBdYfqdS9ZtDtIFDx1rr6BrTJz1RJoiUw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Priit Laes <plaes@plaes.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ryan Walklin <ryan@testtoast.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: nv3052c: Reduce duplication of init sequences
Message-ID: <aPnHBpyhYhMFumPO@titan>
References: <20250619132211.556027-1-plaes@plaes.org>
 <a6d1e281-2ba4-4b47-86b6-5bf57fa0b71a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6d1e281-2ba4-4b47-86b6-5bf57fa0b71a@linaro.org>
X-Migadu-Flow: FLOW_OUT
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

On Mon, Jun 30, 2025 at 05:32:04PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 19/06/2025 15:22, Priit Laes wrote:
> > Although there are various small changes between the init
> > sequences, the second half is common for all 3 currently
> > supported displays.
> > 
> > Note that this is only compile-tested.
> > 
> > Signed-off-by: Priit Laes <plaes@plaes.org>
> 
> If you can find someone to test this patchset, I'll apply it because it looks good!
> 
> Thanks,
> Neil

Hi there,

Sorry for the very long wait.
I finally got around to reviewing and testing this on the FS035VG158 panel.
The code looks good and works on the panel. I don't see why it won't work on other panels.

Tested-by: John Watts <contact@jookia.org>
Reviewed-by: John Watts <contact@jookia.org>

John.
