Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B84755DF9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402AB10E1FE;
	Mon, 17 Jul 2023 08:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27DC10E1FE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:12:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA50860F79;
 Mon, 17 Jul 2023 08:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C525C433C8;
 Mon, 17 Jul 2023 08:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689581549;
 bh=5EaNbrHyiKLpgyLhNgjwTrv6amVL8zxsRSEPi1Z4vYA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=XQyzQxlhMEhfdXWGHj8U9NFK3KjlwIlgE0uFVIu9mvQeUSU6nd8yklLb0/+1aP8EC
 9EAGyzqvE97D85P6sFULkd8bzvSkgOoxmbIakDBxTPyq/TTaKSiAFDac3IzAFc1l9t
 sxMTTSqe/Tkok3hqJnKj92sQRXu6WCh1JCi0Q7Y44DnhAKJpYCtah8IY+zFLrUrS+v
 PxoHKJ3GVEuG5S22b+Tme9E+WSODCZSn6Y3MRlKpeg+1NIfs93xys9OHJPzez1edDC
 4w3oXXAGoijiw+RINrqCtnv3I+EU4hxINLAmsyMwNZC570fVZ4oYJZ5uHZpEtdAjSG
 FLDCH0521gnKQ==
Message-ID: <23951965908df9775ef3437e852fbf35.mripard@kernel.org>
Date: Mon, 17 Jul 2023 08:12:26 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sarah Walker" <sarah.walker@imgtec.com>
Subject: Re: [PATCH v4 04/17] drm/imagination: Add skeleton PowerVR driver
In-Reply-To: <20230714142602.111681-1-sarah.walker@imgtec.com>
References: <20230714142602.111681-1-sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, mripard@kernel.org,
 tzimmermann@suse.de, hns@goldelico.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, afd@ti.com, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Jul 2023 15:26:02 +0100, Sarah Walker wrote:
> This adds the basic skeleton of the driver. The driver registers
> itself with DRM on probe. Ioctl handlers are currently implemented
> as stubs.
> 
> Changes since v3:
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
