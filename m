Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FA1791ADE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 17:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074D910E390;
	Mon,  4 Sep 2023 15:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 614 seconds by postgrey-1.36 at gabe;
 Mon, 04 Sep 2023 15:50:03 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFA310E38C;
 Mon,  4 Sep 2023 15:50:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 54E70CE0F0F;
 Mon,  4 Sep 2023 15:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5FDC433C8;
 Mon,  4 Sep 2023 15:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693842075;
 bh=6AHoLhPAyb0kZxC+vtd1mmVBPDeqBePGOJk9DUiE0G4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V5NuA4etrWKvpIRNGsV4jkYCm2uMrcQcHBgXfVXZWFgm4dC6ueiUkQrVGm0V918Mn
 cfc7i2J6fX6VJtROHdDeVNu+/PJaD6q8ZPF8/ijy7StB7BGTf+zEMNH68vzzvcuI6T
 pEY5ozwRg9yGMh6iUry8OSeJkv1W2/5EUGeHHxuzIOU+vq1Of42SzWuQp481fGBeOf
 7S+NrUubMBv9etx0hv3Yk9CDYjOnmv41SqWW5j+7am8GF272eHPbEAb6gRLM4Y7xfs
 qd9A3PEOfkTw3FEwTQ4rW/GGdGjZbijxMdBzS/dxUuI1uW5yTwjmss6DDEH22juDJI
 IMR6cME1sVkDg==
Date: Mon, 4 Sep 2023 08:43:31 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH v1 07/12] soc: qcom: pmic_glink_altmode: report that
 this is a Type-C connector
Message-ID: <skpvgxdkyciuijkv55uh4ircrrarqhdoiocqc6h5gs4dw6c2rj@zv4fwdri4mwz>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230903214150.2877023-8-dmitry.baryshkov@linaro.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 04, 2023 at 12:41:45AM +0300, Dmitry Baryshkov wrote:
> Set the bridge's path property to point out that this connector is
> wrapped into the Type-C port.
> 
> We can not really identify the exact Type-C port because it is
> registered separately, by another driver, which is not mandatory and the
> corresponding device is not even present on some of platforms, like
> sc8180x or sm8350. Thus we use the shortened version of the PATH, which
> includes just the 'typec:' part.

How would a properly resolved path look like?

As with the other patch, I'm okay with this going through the USB tree.

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn
