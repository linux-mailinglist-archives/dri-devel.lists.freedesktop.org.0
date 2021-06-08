Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFE639F32C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 12:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7556E0CD;
	Tue,  8 Jun 2021 10:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8396F6E056
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 10:06:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DA2E61029;
 Tue,  8 Jun 2021 10:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623146786;
 bh=/4eo4nvXAKggoMT3u0BA0c4qH/TlfFend4Zs6pd5dOI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=kyRLBa4ikE38jMT59Mz/tMR2me7OnDuB/r0TNQvCQE0NGV7mFGdFYU7SovqNaYAL3
 Rhon7KZ2hQNF79N5oosKt3dVpQ7ClQpfie91H8siShLI6vfC/wnusBlymI+oGzspoW
 4SBGHPZrzxnLWveVtvMTT7xfIBWKFMhT0VAiUiFgTMI/XEpLWik/j7gIHWfKwkTZw3
 sYZZb0GjwtCXIde5dR8Tu4UJF5BLJugPgvDVZWggVdJY/sWK99P7ECu+nZr4CvfkDn
 YmAMxKQqkx9Sgdy3ZwxB8FN/hce1kC9nYG+MNrC3o5CnDipOM4Jobh17zvFWwj6q7o
 rmVZlLl/+cgMw==
Message-ID: <777345df2227533d801d298c518b216c755aec83.camel@kernel.org>
Subject: Re: [PATCH 4/4] ARM: boot: dts: bcm2711: Add BCM2711 VEC compatible
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>
Date: Tue, 08 Jun 2021 12:06:20 +0200
In-Reply-To: <20210520150344.273900-5-maxime@cerno.tech>
References: <20210520150344.273900-1-maxime@cerno.tech>
 <20210520150344.273900-5-maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-05-20 at 17:03 +0200, Maxime Ripard wrote:
> From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> 
> The BCM2711 has a slightly different VEC than the one found in the older
> SoCs. Now that we support the new variant, add its compatible to the
> device tree.
> 
> Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Aplied for-next,

Regards,
Nicolas

