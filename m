Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2541B83B000
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 18:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6641A10F7C6;
	Wed, 24 Jan 2024 17:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BDE10F7C6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 17:31:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3AC80CE09E4;
 Wed, 24 Jan 2024 17:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B501C433F1;
 Wed, 24 Jan 2024 17:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1706117497;
 bh=ZSjxwNZxgQqXe2BOuCzNUYDMffDoamSMVJAvz8N0Jp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OhL4KZBxcp2t0yMZMoCBrGcfBBoXaQZupv4MvaMDjAzB1kwV6ho5n3yY4ANGiv7cj
 L3/Sz895iSgeKYbttN87BY05nBeydlLwSvKzLV8L9QoZfDeKXemE53FP3mijJ0tpxM
 eSGUnVjCug4tUzAQ1EZ9ZhQGA1GXWyAzrinFo+9k=
Date: Wed, 24 Jan 2024 09:31:36 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 25/33] staging: fbtft: Follow renaming of SPI "master"
 to "controller"
Message-ID: <2024012428-annex-destruct-1c92@gregkh>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
 <d486dbb16fafd93a00013a555658a44e975115fd.1705944943.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d486dbb16fafd93a00013a555658a44e975115fd.1705944943.git.u.kleine-koenig@pengutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 linux-staging@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-spi@vger.kernel.org, Michal Simek <michal.simek@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 07:07:20PM +0100, Uwe Kleine-König wrote:
> In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
> some functions and struct members were renamed. To not break all drivers
> compatibility macros were provided.
> 
> To be able to remove these compatibility macros push the renaming into
> this driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
