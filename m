Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D698093CE24
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 08:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C7D10E1C8;
	Fri, 26 Jul 2024 06:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RHxEZDUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 88936 seconds by postgrey-1.36 at gabe;
 Fri, 26 Jul 2024 06:27:55 UTC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D1D10E1C8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 06:27:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47900FF803;
 Fri, 26 Jul 2024 06:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1721975274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hOzzX32ozd6ZbK5MOx1sx+5gHj893tCji8oqee/N7ds=;
 b=RHxEZDUR0tkMO08C7OBQnwGgiEvEQdW2IB71JStgjKKOuItoWWzwxGd6J//LeLD9f1NDwr
 L/RViXbdOwTg1ICMSbYbUDWZjhvl7cNaazU5i+3V/2pQcOiVK2ybFNPsMHRjkzEY/nYMqy
 GkypQelyEBDP72i38ccAFJsAhqGk474Fcm29DERFfNNGY2N0fdWM8ZNd0mypbmhtNCSn9Q
 iaAP+ad3pgeJyg33cNk9LzMgsui0dn66zuHF1dDthyYCdu29Q5uelUXFrRx4xrwWgHpkNF
 rnM1+hIU4ktHsKdd1ONdXevmV3oqc8KzFK+J5vpDxghDI0ktnS21xfBxEQzjMg==
Date: Fri, 26 Jul 2024 08:27:51 +0200
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
Message-ID: <20240726082751.74d349dc@windsurf>
In-Reply-To: <vlhicmhpvqkvdbyq2dsgqmofst5a5rjztr3uhp3bwyjhv3kqog@lu5lqtey262n>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240725074532.65616a26@windsurf>
 <vlhicmhpvqkvdbyq2dsgqmofst5a5rjztr3uhp3bwyjhv3kqog@lu5lqtey262n>
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

Hello,

On Thu, 25 Jul 2024 20:07:01 -0400
Alex Lanzano <lanzano.alex@gmail.com> wrote:

> What would be the best way to go about doing this? I'm guessing appending to
> MODULE_AUTHOR and adding a Signed-of-by or Co-Developed-by?

Depends on how much you've changed things compared to Mehdi's version.
If you've mostly kept what Mehdi did, then I guess you should keep him
as the author of the commits (i.e the Author: field of the git commit +
the first Signed-off-by), and add your Signed-off-by underneath.

If you've made very significant changes to the point where the code
isn't really Mehdi's code anymore, but just inspired, then you should
set yourself as the author (Author: field of the git commit + the first
Signed-off-by), and credit Mehdi via a Co-developed-by: tag.

In any case, thanks a lot for this pushing this work, much appreciated!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
