Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B02707912DE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 10:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EEE10E2DE;
	Mon,  4 Sep 2023 08:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B174110E2DC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 08:00:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 36E62CE0E3F;
 Mon,  4 Sep 2023 08:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8251C433C8;
 Mon,  4 Sep 2023 08:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693814450;
 bh=E2sdQ3VRZz3ffzE37I9XdXa3InB+72fEKo9Caj92rks=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=lGHu3MaezN0uZe/YAn6VmTf1ABx7OeJls8Nu8zSTwlu3Zzn1YrT66LrpsAWedGpW2
 OKaZ1acUSVGs0eY9FRdXM1s3KoO9EVLwh1X7X+7yQBogV5WBUfZSbuyv0EXBtmlEO9
 fdHXndrxwKMGtvNfcQTXZhfRBdNNuF6wrich4VRqL2JAfPikHeEdenZS3RIJD+/3cp
 fW4hypAu9WRGGk2C0f3xIt5FuDHbpA9ZDOSL+oVu+c5imKXlv5GNskX6b6Chv1fj4U
 klRzu6aJuEdXQwhwlwZESGiB73G52SGhOXjav+KN6HNv4K1Ih3yxnHh651WhpcfhyL
 s2XQDdJcA8Jww==
Message-ID: <fa6a0d6500369b831ce0329a2fe43571.mripard@kernel.org>
Date: Mon, 04 Sep 2023 08:00:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 6/6] drm/hisilicon/kirin: Call
 drm_atomic_helper_shutdown() at shutdown/unbind time
In-Reply-To: <20230901163944.RFT.6.I21e0916bbd276033f7d31979c0da171458dedd4d@changeid>
References: <20230901163944.RFT.6.I21e0916bbd276033f7d31979c0da171458dedd4d@changeid>
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
Cc: yongqin.liu@linaro.org, tzimmermann@suse.de, xinliang.liu@linaro.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kong.kongxinwei@hisilicon.com,
 jstultz@google.com, Maxime
 Ripard <mripard@kernel.org>, u.kleine-koenig@pengutronix.de,
 tiantao6@hisilicon.com, steven.price@arm.com, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:39:57 -0700, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time
> and at driver unbind time. Among other things, this means that if a
> panel is in use that it won't be cleanly powered off at system
> shutdown time.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
