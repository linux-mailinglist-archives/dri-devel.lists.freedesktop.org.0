Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88EC397067
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 11:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898696E9BB;
	Tue,  1 Jun 2021 09:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AAD6E9BB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 09:30:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6798C60233;
 Tue,  1 Jun 2021 09:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622539858;
 bh=MzlARME4PT7gZfBfOUguUEgshh64veA8ys2s2SbHRfM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=AGqWFUsJLkcVJZ4LIwG+zPi8RAXRzCZp6K3epM0/Vl7+RdYvCfNrdUu0tXtpBv1HU
 aEjLQMpLDljY3rnnuyLcEqTJpteSYW0J228pFQqE2Wer5K8NVY13c+E4qejYPmn0wZ
 ErR45tsnWiSJH+ZaBDbmgklFcvUBZK5XT3vZYtz0pa/Uq4L++Rf3byso6RBYtg8DhN
 dq17CLatmOoBmLgpSTpr+h3Ghi/6QulAf5+Mu1xrIDvH21ZEQHj8JrnpwJgtLYNEej
 b5Aegteov9mIPeQq0ZD/1m+4anggbpDae5h9ASMFMZk2ux4vG7fjWOIJHMiYtEtFd0
 Xo6Aydw1MUvOw==
Message-ID: <fac8428765f0ad2fdd49407b9d1187336e8cb618.camel@kernel.org>
Subject: Re: [PATCH v2 11/12] drm/vc4: hdmi: Remove redundant variables
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Jaroslav Kysela <perex@perex.cz>, 
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, Daniel
 Vetter <daniel.vetter@intel.com>,  David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai
 <tiwai@suse.com>
Date: Tue, 01 Jun 2021 11:30:50 +0200
In-Reply-To: <20210525132354.297468-12-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-12-maxime@cerno.tech>
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
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Adding a commit message would've been nice. But I guess the patch is trivial
enough.

Other than that:

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas

