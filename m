Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232F77D6EC7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E3610E67A;
	Wed, 25 Oct 2023 14:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B474310E679
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 14:35:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E9ABE630AB;
 Wed, 25 Oct 2023 14:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4050BC433C7;
 Wed, 25 Oct 2023 14:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698244542;
 bh=xrowzdJuoPWLy4+F0osiOxyyXKE1FAAtg7pQ19/+hgw=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=sqorMOJ3rUhZgItx+PyZBy1wkFFTQV1qWk4Nn/xGwTcSBu8OKa/902XaJotE0rytH
 OdJgbROa5/Ga9ucDDWyZFptBA8fIQjZQa+UX77CuEsIMciMJxQV5ebeS4W5wXcoBOR
 us+KyvmdLq7ERAFF2Eja3977u/8Z+gQV/fqvZ4HpDnAF6jx71TWcZ1iZxcsBxFHWSm
 WSIW9gSIknq6GO+i5EbVRhPTtHHYy0sLjnjLzLJ4l/QiH0RYfBS73YHfnBEg9AwR+j
 C903S2gbjulJZLS4Z7dLmTdZ+YTe0LQ1Kdh0cgbS/MMnK/rikUewtxhhHKu+zPkqlX
 3hwhpP2O3hGsw==
Message-ID: <143f6add9e7eef165b3ad158a40e2b8d.mripard@kernel.org>
Date: Wed, 25 Oct 2023 14:35:39 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Carlos Eduardo Gallo Filho" <gcarlos@disroot.org>
Subject: Re: [PATCH v2 03/11] drm/tests: Replace strcpy to strscpy on
 drm_test_framebuffer_create test
In-Reply-To: <20231024191002.1620-4-gcarlos@disroot.org>
References: <20231024191002.1620-4-gcarlos@disroot.org>
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
Cc: =?utf-8?b?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tales
 Lelo da Aparecida <tales.aparecida@gmail.com>, dri-devel@lists.freedesktop.org,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, Maxime
 Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Oct 2023 16:09:54 -0300, Carlos Eduardo Gallo Filho wrote:
> Replace the use of strcpy to strscpy on the test_to_desc of the
> drm_test_framebuffer_create test for better security and reliability.
> 
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
