Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFEE62195B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 17:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596EA10E4BE;
	Tue,  8 Nov 2022 16:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D0410E4BE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 16:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667924865; x=1699460865;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=h78vCa8Jt3/b52JPFCVtECZg21VRPdjuo2bou/9Cpy8=;
 b=K3zad+n65tjPGtHXfztBvnDFH+xChIO5DLZs6m7KLijlzYuUNf1AP+hB
 FUxwsuL4qOLi5b45abCMSsl+9ujEK1Jalli+nkCMo7x+WbVAo6/TKCQJx
 Ar13AfFLv4S9S1H2qjlU16zFANtYMtrXVSylLY5stSUAKd/hxTmDS8twE
 coosU7m1Gl5i1V7sLp5UJxbvUrItVC3Wf8mBvFkgEXp8SMytIPyzfBNjs
 XwNg4duCPwykWrbYoXjHa/H5k3oIA250Uo4gGjq0RBX9hCFNJN4QRMIQn
 FZyHITyKoR72G7aZ1Src1JjBZLXVl7DRjG34Rr/JcF9VSC4dv2fLpdWP/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="308360748"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="308360748"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 08:27:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="669606468"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="669606468"
Received: from smoriord-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.16.110])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 08:27:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sandor Yu <sandor.yu@nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>
Subject: RE: [EXT] Re: [PATCH v3 00/10] Initial support for Cadence
 MHDP(HDMI/DP) for i.MX8MQ
In-Reply-To: <PAXPR04MB9448612AD6C7744B7C706D6FF43F9@PAXPR04MB9448.eurprd04.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1667911321.git.Sandor.yu@nxp.com> <87iljp8u4r.fsf@intel.com>
 <PAXPR04MB9448612AD6C7744B7C706D6FF43F9@PAXPR04MB9448.eurprd04.prod.outlook.com>
Date: Tue, 08 Nov 2022 18:27:35 +0200
Message-ID: <875yfp8l8o.fsf@intel.com>
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
Cc: Oliver Brown <oliver.brown@nxp.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "penguin-kernel@I-love.SAKURA.ne.jp" <penguin-kernel@I-love.SAKURA.ne.jp>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, Joe Perches <joe@perches.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Nov 2022, Sandor Yu <sandor.yu@nxp.com> wrote:
> Run get_maintainer.pl for patch 1, 
> Your email address is list as follow,
> Jani Nikula <jani.nikula@intel.com> (commit_signer:2/8=25%)
>
> And I add the email address that comment as "commit_signer" into Cc list.

Please don't do that.

get_maintainer.pl gives you no less than *eight* people as designated
maintainers or reviewers.

I've acked two commits with one-line collateral changes to the files in
question.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
