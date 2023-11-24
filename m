Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E338A7F7195
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECEB10E19C;
	Fri, 24 Nov 2023 10:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB2B10E19C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:35:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 55260CE0023;
 Fri, 24 Nov 2023 10:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F50EC433C8;
 Fri, 24 Nov 2023 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700822122;
 bh=H+nXekQkf9XBvY1ESMqyZIEqP3DaxDh+lS5/L2SdOxA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=JeAVkrlT0JUtUSZHnsWzFlVtrXd1jk4LmmlEePsz4eSdJSF8ECxx6slpyiS7xTSOQ
 XLVdMkamyEMILzaPLP9l2OoAPhYAMBum4iSEl40sOaT9Cd8mkbPHhsHnX6MXaeVNm1
 pGrxLhUDuTpeFOMGoufKLUDNkMX8iFP4DS/O7HLe9OiDF5QQI//y3KLwfqtDIMdhSp
 vLQAVDwnZm6KkPgHXLIAZ5oxN+WJhAz2gE9Yzro1Mv9UuqXZF2dbrXfpmtl87MvGuM
 rSQr8NecK7JaxZ7HIzrdEFjEeCRY6mdY1Ww8G6aQ2tz5JQj6yGrUgDRuxbptA82BH3
 dpyeIFuqI2h2Q==
Message-ID: <a8383fc4d59952d74816b16a1a1c322a.mripard@kernel.org>
Date: Fri, 24 Nov 2023 10:35:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Osipenko" <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 02/26] drm/gem: Add _locked postfix to functions
 that have unlocked counterpart
In-Reply-To: <20231029230205.93277-3-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-3-dmitry.osipenko@collabora.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Steven Price <steven.price@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Melissa Wen <mwen@igalia.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Gerd
 Hoffmann <kraxel@redhat.com>, kernel@collabora.com, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023 02:01:41 +0300, Dmitry Osipenko wrote:
> Add _locked postfix to drm_gem functions that have unlocked counterpart
> functions to make GEM functions naming more consistent and intuitive in
> regards to the locking requirements.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
