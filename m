Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7EE8816EF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 18:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5201410FEAA;
	Wed, 20 Mar 2024 17:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KUa9IiQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B917210FEAA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 17:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710957574;
 bh=OLIlm+4ZTPagq8o/1Qi5L3WM63hVyALNAjPdM0f3KmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KUa9IiQk5TaRLmTCBkQ/WkeBcGOUCyenDXyhAMvXpQaUN4slysqtcLvGI2dzsI4cv
 B+fNumajmDJtWROd8H4839sKd8B1la2dDBpwrsrnmAPie9uKiudRKoObJuFcgUhCl7
 oTkKBQrJJhY6W+r+qwYXP8fqzgy5h4AFV8MjY1xFnXjfi/W6UxwUKWBO08ds7lALl3
 S4I3b6NADcwCoErNBwqU1Y2ahJNOZeLhzwLP0dmzENHTfFYJNL7RkZiyF1K2c4znXk
 McSJNjlAgsZZJxLOSC2RXFgk/b1IBJAPUPIxe1l/GEX61xGUMK9mxw+gW9iYpQpweH
 1QtoiBgVkMNsA==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 40B3A3780C1F;
 Wed, 20 Mar 2024 17:59:33 +0000 (UTC)
Date: Wed, 20 Mar 2024 13:59:30 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: Missing commits from drm-misc-next on linux-next
Message-ID: <613c60d8-2652-451d-91f3-bde84219bf48@notapiano>
References: <39ad88fa-449a-4aa9-ac6a-902d8d531984@notapiano>
 <20240320-sticky-shiny-mussel-5da3cf@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240320-sticky-shiny-mussel-5da3cf@houat>
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

On Wed, Mar 20, 2024 at 04:19:51PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Mar 20, 2024 at 11:07:34AM -0400, Nícolas F. R. A. Prado wrote:
> > I noticed that there are some commits from drm-misc-next [1] that haven't been
> > added to the for-linux-next [2] branch, and consequently haven't made their way
> > into linux-next.
> > 
> > Namely, commit bf0390e2c95b ("drm/panel: add samsung s6e3fa7 panel driver") and
> > commit 2689b33b8864 ("dt-bindings: display: panel-simple-dsi: add s6e3fa7
> > ams559nk06 compat") which have been applied almost a month ago [3].
> > 
> > I noticed because running 'make dtbs_check' on today's next is showing new
> > warnings, but with these commits applied there shouldn't be any warning.
> > 
> > Could you please take a look? I'm guessing a merge was forgotten somewhere along
> > the line on the for-linux-next branch.
> 
> Those commits are in drm-misc-next which is now targetting the 6.10
> merge window. In order not to disrupt the oncoming 6.9 release though,
> drm-misc-next is removed from the for-next branch, it will be
> reintroduced after 6.9-rc1.
> 
> Maxime

I see. I didn't realize that's how drm-misc-next worked.

Interestingly enough, the reason why this happened is because the for-next
branch on the qcom tree [1] also includes changes that are queued for 6.10. So
it seems that every subsystem has a different view of whether linux-next should
include only changes for the next (or current) merge window (6.9 in this case),
or if it should also include changes for the following merge window (6.10 in
this case). The end result is that in the time period leading to, and during,
the merge window, linux-next might be in an inconsistent state - it's neither a
snapshot for this release's rc1, nor a snapshot for the rc1 of the following
release. This seems to me to partially defeat the purpose of linux-next, so I
wonder if it's just a matter of better documenting the expectations for
linux-next.

Anyway, at least for now I'll keep in mind that linux-next can be inconsistent
when looking through future results.

Thank you both for the insight.

Thanks,
Nícolas

[1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=for-next
