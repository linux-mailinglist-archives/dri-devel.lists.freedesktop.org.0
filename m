Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43195621217
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E7B10E450;
	Tue,  8 Nov 2022 13:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F2010E44F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667913346; x=1699449346;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=V8a1s54ki0Du02Crq9QZu279WBYeboXOkqd8m36ok38=;
 b=Tl2D9JtP+tKzBoZ5ip/xbtUwQPlPN6gbQaN/k5y5Yk/tpEcbrHswhYKs
 zALvlTfFe5WCCyK/GDZ0E8jDCQa5ZU+yHnS2GzkNx/r6kc/w6s68lAVab
 ciYUTuACMO2PqIEKTULPjiMKl2B4CwVQtxdAbxgxCOCkGDDPtGjnMEnKM
 7OutSS8fAFtEP5n0sJkrctDamr1k0aBOvsPWkY2WgH4WQvBIwNiviXEHC
 /kKszd923cm/p1Nhvmzq7MqxknPkB6xVN0Yj9UwSbblwi2wJqfz/QxN7E
 VWg5aj07v6DduuRBa3SCattzHjgeuicXRBI1tH/9//cLeJ1ObRks7Efvb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="312479948"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="312479948"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 05:15:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="614275786"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="614275786"
Received: from smoriord-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.16.110])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 05:15:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, vkoul@kernel.org
Subject: Re: [PATCH v3 00/10] Initial support for Cadence MHDP(HDMI/DP) for
 i.MX8MQ
In-Reply-To: <cover.1667911321.git.Sandor.yu@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1667911321.git.Sandor.yu@nxp.com>
Date: Tue, 08 Nov 2022 15:15:32 +0200
Message-ID: <87iljp8u4r.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 penguin-kernel@I-love.SAKURA.ne.jp, tzimmermann@suse.de,
 s.hauer@pengutronix.de, javierm@redhat.com, robh+dt@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, Sandor.yu@nxp.com,
 shawnguo@kernel.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Nov 2022, Sandor Yu <Sandor.yu@nxp.com> wrote:
> The patch set initial support for Cadence MHDP(HDMI/DP) DRM bridge
> drivers and Cadence HDP-TX PHY(HDMI/DP) drivers for iMX8MQ.

Has some get_maintainer.pl guidance changed recently or something, or
why am I increasingly being Cc'd on patches that are largely irrelevant
to me?

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
