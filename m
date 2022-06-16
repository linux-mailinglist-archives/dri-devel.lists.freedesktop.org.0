Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1FA54E02B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 13:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4881211A4DC;
	Thu, 16 Jun 2022 11:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 528 seconds by postgrey-1.36 at gabe;
 Thu, 16 Jun 2022 11:27:02 UTC
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2E911A38A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 11:27:02 +0000 (UTC)
Received: from hillosipuli.retiisi.eu
 (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi
 [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by meesny.iki.fi (Postfix) with ESMTPSA id 3DD3A20223;
 Thu, 16 Jun 2022 14:18:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1655378290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UUep/sgKumAUsqr6plkU9Uit353tpr6e7VY52A43bZ0=;
 b=YiAxJPvvV+VFDy2XSr6BR5cdbKzD76jQII3SIj5C6MB9vm2znMEgKDIWYzacLLMmF22BCa
 2P4Fj4GcyFRd30U/MQKTPEhLpkqnHCaHQNhkFkSDyk922sVXWm3s5eQ+0goo4GUSvksfwL
 vEOXB5MlTAnJd6t5jVutTxtM1GHdNHg=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9E3FB634C91;
 Thu, 16 Jun 2022 14:18:09 +0300 (EEST)
Date: Thu, 16 Jun 2022 14:18:09 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v9 00/14] Add some DRM bridge drivers support for
 i.MX8qm/qxp SoCs
Message-ID: <YqsRcUsdZzcwqplJ@valkosipuli.retiisi.eu>
References: <20220611141421.718743-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220611141421.718743-1-victor.liu@nxp.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1655378290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UUep/sgKumAUsqr6plkU9Uit353tpr6e7VY52A43bZ0=;
 b=e6Al/EFgjGfUA3ffYQXqQ+pB8jfciIVCkr/eD+HwQH6a28iLeoT9qnBnxvDrWlGDC1G4bC
 TAL1Q6kVagX5RYOxNDpFWm5GRKyYpoyH/lbRI8lnU0IaxOt0UEHvsehRrdGh2jDjrCmlbF
 dWaPE0w3Suw0AqxzNlPev6mdneTk4Fk=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1655378290; a=rsa-sha256; cv=none;
 b=Ii1gQgxWnUvB0ovIO8owoWaYk7l8CClPi05NutKtp2BooN+OCcp1h+SO8xtvKtUi3AwY6S
 JuYhzUIkO+r5g+PKmvZ96rYRNc2Rb5XPPu0FpKN5LohB6Xz3q40dZPfhsguz748iYkogqc
 KmCsgUVajSzP3ZwLBJ46j70A4siyNrM=
X-Mailman-Approved-At: Thu, 16 Jun 2022 11:41:09 +0000
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
Cc: andrzej.hajda@intel.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, linux-imx@nxp.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de,
 jonas@kwiboo.se, s.hauer@pengutronix.de, robh+dt@kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 11, 2022 at 10:14:07PM +0800, Liu Ying wrote:
> Patch 1/14 and 2/14 add bus formats used by pixel combiner.

Thanks!

For these:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
