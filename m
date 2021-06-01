Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2764396F97
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 10:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5FF6E9A5;
	Tue,  1 Jun 2021 08:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13346E9A5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 08:52:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1E6F610A0;
 Tue,  1 Jun 2021 08:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622537559;
 bh=8a14SexF0VfpNwXP+zIc3awUdTFy5l9yf6WZSfXTd4I=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=SeAPSMEr+/bCDKDRlUBdS2SixGDGFDoxzjMGL257ErWVAa6CU94zH6YlMgBwVP6fD
 SpbeV3ZC0hIEOxiUjQFDRqnrVF/VcgVSlZU6hHeTH9PVJRgo53rY6JoDbo42y+AP2D
 sUKDU2UUXeeJFvA5FQpGAjHdKxI8daTDoXP4uFFMVhK+AzBwmruEcgr+gd89tJ4nQu
 qpAVfGrH4z/qYfZ/Sn+kmTREboFJLQiJzCJw9/aAQrTyXBmbQ6afiEbsGm2y/0v79A
 38UkEHYcvRADeqz7r6fyPJQhC6jtzLKJQNIIuGlarAT6pw+iVTHSYnVpo+zC6mzJag
 myVcGfquSdlIw==
Message-ID: <813942f4864d87ef0b9c5dff98c23c919bdd88a9.camel@kernel.org>
Subject: Re: [PATCH v2 09/12] drm/vc4: hdmi: Remove firmware logic for MAI
 threshold setting
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Jaroslav Kysela <perex@perex.cz>, 
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, Daniel
 Vetter <daniel.vetter@intel.com>,  David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai
 <tiwai@suse.com>
Date: Tue, 01 Jun 2021 10:52:31 +0200
In-Reply-To: <20210525132354.297468-10-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-10-maxime@cerno.tech>
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
 Dom Cobley <popcornmix@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-05-25 at 15:23 +0200, Maxime Ripard wrote:
> From: Dom Cobley <popcornmix@gmail.com>
> 
> This was a workaround for bugs in hardware on earlier Pi models
> and wasn't totally successful.

What's to expect sound wise on older RPis?

Regards,
Nicolas

