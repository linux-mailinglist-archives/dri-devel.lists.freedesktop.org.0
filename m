Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC04B793BE2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 13:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49D510E61A;
	Wed,  6 Sep 2023 11:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2E010E61A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 11:55:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4D531CE149F;
 Wed,  6 Sep 2023 11:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1072DC433C7;
 Wed,  6 Sep 2023 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694001341;
 bh=FDZb2P6B0ZGwz9DnHq2oQkdMxKB5yoZzWthnXB71JxU=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=jhhnLlTyoqdIJqEsBEzcRyQzk5+hGjuuSb/2wrdwqMn9IuYUxHaciHhF6nIkY6VjQ
 VH9qX4Zw31P6hfNBw/Qy7oMaadRuC6kDSqG4q+g76JE/cmIm/sY855HKXvR8xyRGEa
 ZBEHR8ahL4Ha2z247Q7L8FNYnbSc1sWRjXVERfIHw3vJHhjIrg2wQU47v843C39Vy1
 Y0x5A7JtA5Uw02Lw0zFBzYwMn3/X+clluAgYvrukVOlEh50NIGf9GDvHwA1p3/DuZu
 4jClhytET6ay7v47gtPknSh5LW5Grhx5VQ6W7+qMBLloOo+wVZ7yjBWtaTavkPEXv/
 STDBDqEhplRVw==
Message-ID: <54a97af7c14f23ce12be9eb40075733f.mripard@kernel.org>
Date: Wed, 06 Sep 2023 11:55:39 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sarah Walker" <sarah.walker@imgtec.com>
Subject: Re: [PATCH v6 08/20] drm/imagination: Add firmware and MMU related
 headers
In-Reply-To: <20230906095542.3280699-9-sarah.walker@imgtec.com>
References: <20230906095542.3280699-9-sarah.walker@imgtec.com>
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 matthew.brost@intel.com, corbet@lwn.net, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 tzimmermann@suse.de, Maxime
 Ripard <mripard@kernel.org>, matt.coster@imgtec.com, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Sep 2023 10:55:30 +0100, Sarah Walker wrote:
> Changes since v5:
> - Split up header commit due to size
> 
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
