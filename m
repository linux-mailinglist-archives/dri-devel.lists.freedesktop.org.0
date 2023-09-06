Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9C7793B9A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 13:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD6810E615;
	Wed,  6 Sep 2023 11:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CF310E615
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 11:44:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55ADBB81884;
 Wed,  6 Sep 2023 11:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B468C433C7;
 Wed,  6 Sep 2023 11:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694000676;
 bh=XnFe3s3A3Ru8jKj/08Ae1zwa7j3vIpvIRhg0ZwHTLbo=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=VhSCjapFeoOW/31gOJkdyFgRuKBq+wWe+Xy0etG8NPeQsvRViNPS0zIeEOOYOHce8
 vhHsUDj8lmCNidhNiR/xtlf8xuaW3gzgQzq9TAkm+bbaAWt8s6lZXC2q22whefz+EI
 76y7rZ10DCeq7KGbKkvssYsM7rzxOi54AQZ1oulYIEa/XpyCRnPlrJL2x8Nik+4XPe
 9xuvoq6KiXGK/Z/7Amx803WrJ5wu8zORrYjb1OAq2St5RSTl8z+FOBhVXAhI423+Hv
 kX+ssc5Qm0fCWJ6oBwxCHvNYzBUQZWH23zuComnYJH/XftnecEIJIqcsrjGwqqhFNp
 zm1ZY3WDpczMw==
Message-ID: <7f766389e365ae3ca23772ac9aac5254.mripard@kernel.org>
Date: Wed, 06 Sep 2023 11:44:33 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sarah Walker" <sarah.walker@imgtec.com>
Subject: Re: [PATCH v6 09/20] drm/imagination: Add FWIF headers
In-Reply-To: <20230906095542.3280699-10-sarah.walker@imgtec.com>
References: <20230906095542.3280699-10-sarah.walker@imgtec.com>
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

On Wed, 6 Sep 2023 10:55:31 +0100, Sarah Walker wrote:
> Changes since v5:
> - Split up header commit due to size
> - Add BRN 71242 to device info
> 
> Changes since v4:
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
