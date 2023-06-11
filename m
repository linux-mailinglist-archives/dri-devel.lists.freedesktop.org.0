Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C071272B4D7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 01:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F5E10E04C;
	Sun, 11 Jun 2023 23:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E16D10E04C
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jun 2023 23:37:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79DA56115E;
 Sun, 11 Jun 2023 23:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72205C433D2;
 Sun, 11 Jun 2023 23:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686526668;
 bh=HUPnwjEAIGQ9+N4mQszwv55VbKW7Sw0b6GYfoP+HjQc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=krM3kHyJ5P3PodeMVGW9sVPGUxbFqdPw+8ZwM//VD8tqhH2qtMdrI1tBsLXRGZZAo
 uJMREsPdZBr16T/a7K7wUy1tF1HvlgNzcFPxJfdd3AKGF67HKwXYf3XAQwrNOc7lHJ
 zMGbOSskeQTo+2+aJbHqmvGGchnX2A4arbbO08kNPjWXnZxhWWcwm8Oe1ejsLT4bva
 mniR6f5uyPD/BCEeV5rEQPJuDOh6c48Lo7BWCVe9uV4A2P7GOJTbHDc5Xq1F/E8twL
 hmcLqMQeXaJh1+iH7W4B4iAXQp5pENiYU3muBXyVXjA41t6vdovMz0MRRBoXWHVd+a
 TEZAi62nuyQWg==
Date: Mon, 12 Jun 2023 01:37:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] drm/i2c: Switch i2c drivers back to use .probe()
Message-ID: <20230611233745.icz2glebdmp7jvjv@intel.intel>
References: <20230611202740.826120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230611202740.826120-1-u.kleine-koenig@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On Sun, Jun 11, 2023 at 10:27:40PM +0200, Uwe Kleine-König wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> commit 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi
