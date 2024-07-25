Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F5193BC21
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 07:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FEF10E63A;
	Thu, 25 Jul 2024 05:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hfjfeaQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985F610E70D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 05:46:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 0888CC34E2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 05:45:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B52121C0005;
 Thu, 25 Jul 2024 05:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1721886335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxK8XBeQTTR4Tc/s5qyrrLBlrioJMMBQezGw7qaqjmQ=;
 b=hfjfeaQOKrpWNaZD3IcFOlJIkjVOgvkaiWSMzkV2yY5PMPM6c2Siytc5wgXWO5vYEtQpYo
 NVVZkByFOiWeCAmlEVRdVaFUardAELs+DTPPZHei7/r2fqvdBz+P8OxiC9uQGLUhWx8b/s
 OOUxcvcwXjZX88IiKm54WgToaQRzBP/6B6eeewn8VD0kQfr5lojJCUFcbTQnlaJnRBCBnV
 UIZskIUF/lrZ8ZM2t0P4kJE7/g9eHh+/x0Vyr+TqY+9WHBGIJdWkLui9vZk445NBe6Khv/
 Cx+u50e6OfJ4lYbg33OGQP2wiAHh6ZBorzIjm3ls9/TO+LwsMMqvU1ZMyLDjzw==
Date: Thu, 25 Jul 2024 07:45:32 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: mehdi.djait@bootlin.com, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mehdi Djait <mehdi.djait.k@gmail.com>
Subject: Re: [PATCH 0/2] Add driver for Sharp Memory LCD
Message-ID: <20240725074532.65616a26@windsurf>
In-Reply-To: <20240725004734.644986-1-lanzano.alex@gmail.com>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.petazzoni@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Alex,

On Wed, 24 Jul 2024 20:47:01 -0400
Alex Lanzano <lanzano.alex@gmail.com> wrote:

> This patch series add support for the monochrome Sharp Memory LCD
> panels. This series is based off of the work done by Mehdi Djait.

Thanks for resuming the effort on this patch series! Since this patch
series is clearly heavily based on Mehdi's work, wouldn't it make sense
to preserve Mehdi's authorship for the patches?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
