Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E13797316
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 16:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C4D10E7F0;
	Thu,  7 Sep 2023 14:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AF210E7F0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 14:32:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F227B81E7F;
 Thu,  7 Sep 2023 14:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23823C4AF6A;
 Thu,  7 Sep 2023 14:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694097167;
 bh=LjOKbvV/82aSzI3htAHPz7uDv9ANVHELjK+4PnKTL/g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gKP9BeFsQt7ozkUWNv4n1BdlBM/7y3ZALc00V4LDGWwsmx7F82Axgp6ULm+bEvfg1
 ddzmCnh+C039DfFl3VLi7GD4EZQpfjqABJj7/GZSPTihl0nuUHRU31KdKfBRQNR1C4
 tUAxmQk+9tOwmtZT+nCERD4tPgSUjzrLzvxJ6ATDqggOSF+6r5Q4H/wp1HIz4iqhpo
 wKOZ8b1k6AHHMn0LJFh5J9zp82durlushh3KtncNhv6NsYSB0W9H25btgRZfUVnTaY
 6dD9r7q3U5KpMQz1Nxo8nkdzT5cxuLE5i8eQ4L7hk4YeLsMBVg1/u8HoDcY2M9rjO9
 QW57Z8X3VnZfw==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20230906-topic-drm_connector_doc-v2-1-1f2dcaa43269@gmail.com>
References: <20230906-topic-drm_connector_doc-v2-1-1f2dcaa43269@gmail.com>
Subject: Re: (subset) [PATCH v2] drm/connector: document
 DRM_MODE_COLORIMETRY_COUNT
Message-Id: <169409716450.2201230.1132363284756871897.b4-ty@kernel.org>
Date: Thu, 07 Sep 2023 16:32:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Sep 2023 22:47:38 +0200, Javier Carrasco wrote:
> The drm_colorspace enum member DRM_MODE_COLORIMETRY_COUNT has been
> properly documented by moving the description out of the enum to the
> member description list to get rid of an additional warning and improve
> documentation clarity.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

