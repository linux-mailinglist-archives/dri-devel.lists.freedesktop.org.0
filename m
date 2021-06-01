Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3340396F7F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 10:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7EE6E9A2;
	Tue,  1 Jun 2021 08:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EC96E9A2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 08:49:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E53F61375;
 Tue,  1 Jun 2021 08:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622537392;
 bh=BWq5NprmRBFQsgZo2g232l4nfkJzik5TZeKrg2RP7A4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=iGXAAQHTjaMW5jK32eeGWC/RMFFgzjIrcMr7psbh+zR6Q2/OwOLt/jUrgAkIts5eI
 YE9mqsBPPxfXMllInKg/lzlcvQL9pBDGUUKDpK3bANr+hzYeKuYwQsRZ1azVlrjV60
 L9ZRjWo97oGa5w+Gja4vghuhWY7d/iByP3bkn3Ok4Cx/gH+j+MtNRmuAoN/QBTXTcj
 joE5KshjA13w2AZoHznmYqMMMcOIdld5uK/Xt6IbKrb/I130zBtSJw0uDaqj54TMVk
 mvFA3LqaeVz+EXflPqjPNu5e6bQuYjhGykfyPXILyn5ZZKnlaqDmODJtrzmviALaKp
 9mYgKvZ8Yr/vg==
Message-ID: <90338d5fbc55f80a8cd28ead24791f3edc247ba4.camel@kernel.org>
Subject: Re: [PATCH v2 08/12] drm/vc4: hdmi: Set
 VC4_HDMI_MAI_CONFIG_FORMAT_REVERSE
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Jaroslav Kysela <perex@perex.cz>, 
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, Daniel
 Vetter <daniel.vetter@intel.com>,  David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai
 <tiwai@suse.com>
Date: Tue, 01 Jun 2021 10:49:44 +0200
In-Reply-To: <20210525132354.297468-9-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-9-maxime@cerno.tech>
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
> Without this bit set, HDMI_MAI_FORMAT doesn't pick up
> the format and samplerate from DVP_CFG_MAI0_FMT and you
> can't get HDMI_HDMI_13_AUDIO_STATUS_1 to indicate HBR mode
> 
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas

