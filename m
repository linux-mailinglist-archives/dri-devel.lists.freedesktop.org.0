Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D8A7A72C7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 08:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AB410E439;
	Wed, 20 Sep 2023 06:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54B810E439
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 06:29:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70E0BB81ACE;
 Wed, 20 Sep 2023 06:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E88C433C8;
 Wed, 20 Sep 2023 06:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695191386;
 bh=2wuCQSkylz9QSMdbFh7QrwaeAka4CUawgsgVJN9yMuo=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=pWleZaUv0HwBbTmDCrmPy2HWqvGtedgCEo1fr6WPp6t5fz3l8y5PkqIKzQ30qTUAk
 1wXCVwQvGZW4LTK8D1v8p2DNIzw374U6ODp1dWWMvYR720WpRIeG7/fcwhlpiR1D4f
 brgFzHWoWj5clrFFaW9gskr0rqNlnf0I2L/QNPL3jSuR78uwLE4J43Rglgg0Inh6oO
 HApOPNA8UlyhDelA+T5w+UWDfjx9Ms0vZ4Pv6B6c2j/Sr6f8HVB2h6sEYMQN4cL0Tc
 opVOri2hc66XoGVkOTflnubb3ypGFr34DTjSSZ718f7UNlT8nGa9nKnB+/qyL8p0lF
 EedpViyWR6Vhg==
Message-ID: <cf7df9564146d47476d50d43f7b0bbff.mripard@kernel.org>
Date: Wed, 20 Sep 2023 06:29:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Arthur Grillo" <arthurgrillo@riseup.net>
Subject: Re: [PATCH 1/3] drm/tests: Fix kunit_release_action ctx argument
In-Reply-To: <20230920-kunit-kasan-fixes-v1-1-1a0fc261832d@riseup.net>
References: <20230920-kunit-kasan-fixes-v1-1-1a0fc261832d@riseup.net>
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
Cc: David Gow <davidgow@google.com>, Brendan
 Higgins <brendan.higgins@linux.dev>, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Javier
 Martinez Canillas <javierm@redhat.com>, mairacanal@riseup.net,
 Maxime Ripard <mripard@kernel.org>, andrealmeid@riseup.net,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Sep 2023 03:11:36 -0300, Arthur Grillo wrote:
> The kunit_action_platform_driver_unregister is added with
> &fake_platform_driver as ctx, but the kunit_release_action is called
> pdev as ctx. Fix that by replacing it with &fake_platform_driver.
> 
> Fixes: 4f2b0b583baa ("drm/tests: helpers: Switch to kunit actions")
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
