Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DD67A0327
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 13:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE31F10E568;
	Thu, 14 Sep 2023 11:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E7C10E568;
 Thu, 14 Sep 2023 11:59:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 75219CE21D1;
 Thu, 14 Sep 2023 11:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAB7C433C7;
 Thu, 14 Sep 2023 11:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694692765;
 bh=gssHXPbJz0czz/j6r72eiOm6doPN5TsZmH8mlKsgcDk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FxkcUmh2KpdyeHOsKSAohYWvVqmSAApyXLB1F0DdTIRaqWXrG/0cldwaGBAOCgODb
 TJYCGzoHZi7dsiPahtYeIyJ6VX0klyR5YWpOxF6pjNX1bdFp+vzot0PV5aZ6DsKtN1
 SUmtM8C0hA2RMcejE21hh7eEnEHeXiMEX+eLKFR0t3CX0aTodbQfjxu+6FfGEU6LGW
 T2sBD5QJU9kyxEEJJQEWDZ1/KJSadcXmTsffYgO3Sry/p7iqkhWPCDiRl4PCVrt66B
 kfiflZxJXeBm54W507E8+Xx63k7XsgYc2iDqvrx/LwO70S7b9AZYu22M5/LaSRvIlf
 iTrQjdI0V9Gcg==
From: Maxime Ripard <mripard@kernel.org>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230907135339.7971-2-thomas.hellstrom@linux.intel.com>
References: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
 <20230907135339.7971-2-thomas.hellstrom@linux.intel.com>
Subject: Re: (subset) [PATCH v3 1/2] drm/tests: helpers: Avoid a driver uaf
Message-Id: <169469276263.950625.147303108903470167.b4-ty@kernel.org>
Date: Thu, 14 Sep 2023 13:59:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
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
Cc: stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Sep 2023 15:53:38 +0200, Thomas Hellström wrote:
> when using __drm_kunit_helper_alloc_drm_device() the driver may be
> dereferenced by device-managed resources up until the device is
> freed, which is typically later than the kunit-managed resource code
> frees it. Fix this by simply make the driver device-managed as well.
> 
> In short, the sequence leading to the UAF is as follows:
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

