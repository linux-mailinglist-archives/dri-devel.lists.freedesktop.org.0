Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75A9397055
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 11:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2AD6E8CB;
	Tue,  1 Jun 2021 09:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD1A6E8CB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 09:26:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54B5361396;
 Tue,  1 Jun 2021 09:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622539591;
 bh=kKX1yVjitfZZxbdBgzCtdoPBBfSIvUVJzJ5sKjo78qc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=l2A4q7WzOFkiELQ2A3xBy1Foc+wwXt1VLZQ0QkOSa0833GZHZ8vygacZdReblL7ht
 Ocbj4K3OfK8Yu0fIAqvoNyL7l5WSCgOLuBuGjWqEGuJuQE5mXKC++b4CutSSwPxxCG
 2wKzxMkn6OyrNpXyWDrt4ccGiQDQadCLy7JkLFzxhVe1ylYZJB7cbdSwXCxg3fRtoe
 3PhMttL9Lb4EV1TN5w/uHdqz3x5tdHQmP+OQr6bAGmSCw3a08C3uPIgniTeT2swQOl
 GkV6bwR0m+BRdxBOox3bKPuL2ajaomZIqgZcebdZLsjvve14r5ur8ld4FxXnupWFIH
 F5QH/3XlvmZLw==
Message-ID: <c1ee306fbc81da2df7d0041c719fc8cd3302cf0f.camel@kernel.org>
Subject: Re: [PATCH v2 10/12] drm/vc4: hdmi: Register HDMI codec
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Jaroslav Kysela <perex@perex.cz>, 
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, Daniel
 Vetter <daniel.vetter@intel.com>,  David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai
 <tiwai@suse.com>
Date: Tue, 01 Jun 2021 11:26:24 +0200
In-Reply-To: <20210525132354.297468-11-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-11-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 linux-doc@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-05-25 at 15:23 +0200, Maxime Ripard wrote:
> The hdmi-codec brings a lot of advanced features, including the HDMI
> channel mapping. Let's use it in our driver instead of our own codec.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas


