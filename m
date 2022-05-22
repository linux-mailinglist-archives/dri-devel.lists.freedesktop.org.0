Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9885301AE
	for <lists+dri-devel@lfdr.de>; Sun, 22 May 2022 09:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E73210E021;
	Sun, 22 May 2022 07:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83C710E021
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 07:46:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5B95CB80781;
 Sun, 22 May 2022 07:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB00C385AA;
 Sun, 22 May 2022 07:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653205556;
 bh=ZCi6RUP/O3kMnsJJu/s4DihkRu9K2QaJ6K93qMsyG2k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j2SSvUKOy/dXqnFULU1QrJO7NvDpQv7gZRJsSJhE2B+R4eyfcrW3goPLV4StJvCce
 ZoSMuWw2+zYlghgVsKUfWTA9P6kpbaHUD85tVkRabG3fxcGMQuaOjlF2WOxHHLlnyG
 mwzhhUbAa7FbMy84xegJ7bnBN57QbbJBYan+n6uSzy1sB8oFBgmbpyXDj24aH0oy8p
 m3FFVw7c2u9snnZfd1Zf6w8zailZVoBrFkl8VXW8AYwtOgQ++IcBZZ+9ibEx6+uyP7
 4T23WtXM01d4KNnpgBUoIlOqLprMtf+GNbUyqbJ/CEC8jJx6TNKEsYTdUPQfhvqCyI
 xDnFgYApavKjA==
Message-ID: <6aa0b632-674d-d9ca-2ba9-cab497aa1f37@kernel.org>
Date: Sun, 22 May 2022 09:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Exynos vblank timeout issue
Content-Language: en-US
To: =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220522000219.GB241035@adroid>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220522000219.GB241035@adroid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2022 02:02, Martin Jücker wrote:
> Hello,
> 
> I'm trying to get Android 12 up and running on my Galaxy Note 10.1 which
> is based on Exynos 4412 with a Mali GPU. For Android 11, I had no issues
> with graphics but after upgrading and building Android 12, I'm getting a
> vblank wait timeout shortly after starting the device setup, which in
> turn leads to my display turning black and SurfaceFlinger hanging. This
> can be reliably reproduced after every reboot, so much so that it's
> basically always on the exact same step of the setup.
> 
> I'm using the following setup:
> 
> * 5.10.101 Android Common Kernel with some patches to get
> the Note 10.1 up and running

It's Android kernel, so not upstream. It is perfectly fine to use
downstream kernels, but with the issues you also go to downstream folks.
I have no clue what Android did to Exynos.

Best regards,
Krzysztof
