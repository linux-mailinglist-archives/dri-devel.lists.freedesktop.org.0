Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DD079E501
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 12:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3BE10E00A;
	Wed, 13 Sep 2023 10:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4723110E00A;
 Wed, 13 Sep 2023 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694601258; x=1726137258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aSLZAhLlCUcLtEt71s9aVgFB3sPUO22k85ZuXX7lIvk=;
 b=WWsqfxo7pz/+Mg/HKs07wEhs2nc5YW9KTJEsVycXBzoXtUs/SP+oUUn+
 hWG3ulY8HHeK6vHeGNAoREqJ1XtQD3PJEF/+hrJNNygIVzvWqtHnKrVBw
 akMX9QKz2Qhz8K//nYhi6iDXIGUo2g+3d3O8gtgdkFMGpmBRM2NTf+LLq
 m8VnS0lfiQY9xDS9DTBzbh91B9ByaeXcysVgjG/urwxAX8kbHIkw41wUr
 tg2mp7SVl8IU9JsbLMp9K1eCTRMrx7gfwyxArovzhWYv62HvgQWQADZYo
 A/JRfz/VcHN/yLKUwCmtmLwOhnScA13ung8s6NxJVetky3YhHW8hxsgsp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377534962"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="377534962"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 03:34:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990870840"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="990870840"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga006.fm.intel.com with SMTP; 13 Sep 2023 03:34:09 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 13 Sep 2023 13:34:08 +0300
Date: Wed, 13 Sep 2023 13:34:08 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH v1 01/12] Revert "drm/sysfs: Link DRM connectors to
 corresponding Type-C connectors"
Message-ID: <ZQGQIGNUq+UL9lpi@kuha.fi.intel.com>
References: <20230903214150.2877023-2-dmitry.baryshkov@linaro.org>
 <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
 <CAA8EJpqUg2-k7LLBL38RHU1sThkXB54ca68xEMd1yMnHQcQ++w@mail.gmail.com>
 <ZPh0Ps9UJ3HLzdeR@kuha.fi.intel.com>
 <CAA8EJpratbBybgk8woD3maA=J_HuQis44Unq0n+c_UvaFs__AA@mail.gmail.com>
 <ZPiAwOf00RREiYPr@kuha.fi.intel.com>
 <6b6bacee-f7b6-4cfe-be3d-24bda44bfbcf@linaro.org>
 <ZQBGD8CY5OVKYX63@kuha.fi.intel.com>
 <a97a33f4-71f3-4610-a59e-0c2d5ae86670@linaro.org>
 <a36d7b75-b072-4202-8f09-9eab0dfd52ed@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a36d7b75-b072-4202-8f09-9eab0dfd52ed@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Won Chung <wonchung@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Wed, Sep 13, 2023 at 11:38:19AM +0200, Neil Armstrong wrote:
> On new platforms (starting from SM8450) UCSI is mandatory to have
> pmic_glink_altmode events triggering.

You can also populate the typec devices conditionally, only if UCSI is
not supported.

However, I took a peek at drivers/soc/qcom/pmic_glink_altmode.c, and
it seems to be mostly is dealing with the muxes and retimer, and
sending the HPD notifications to the DRM side. All that is already
done in typec drivers, so there is actually a potential race here when
UCSI is used.

On top of that, it is sending two commands to the PMIC (ALTMODE_PAN_EN
and ALTMODE_PAN_ACK). I'm pretty sure both could be handled in the UCSI
glue driver (drivers/usb/typec/ucsi/ucsi_glink.c) if they are even
needed when UCSI is supported.

So why do you need that pmic_glibk_altmode driver at all when UCSI is
supported?

I don't know the hardware, so I may be missing something.

thanks,

-- 
heikki
