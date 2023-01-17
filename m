Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AAE66DC89
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 12:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47B210E49F;
	Tue, 17 Jan 2023 11:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FBB10E49F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 11:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673955289; x=1705491289;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mH1LIiq7Ergf44/MXT40cMfHwTFQC5bpCpuGbuueu0A=;
 b=CQfvJ9syzf1GM8zdx6wBWCtQ1M+RXvS2SYLerJAp89h8hGfPWBb4E6oy
 UD4k2iRkAGaKHtTIPmEv3+xSsNf3tsQGEillKY3ms8MkjSrPUtktawp40
 pEANTqxrNs+Yg6fcfZBYZOp9HM/+ZnkfQXQvYu5QOoGrwect7Vl6lDvqb
 jA0aZbwrx+NwIwm30rQ/waywp/KzCdC9vAZ//LPndXYWovdaJgUCH04BE
 T2HzlJMW+egqNh2aV295l4veJEtmmKDd72kl+Ny/LEzQO7zu2/4M0RwlR
 zEfwbW5kGCSZCL0LNe/qwzVjP0+s9KMMWrxbHtfuVKWbpSReEezqjKIBH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="325947962"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="325947962"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:34:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="652521320"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="652521320"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.10.213])
 ([10.213.10.213])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:34:43 -0800
Message-ID: <28feeeb6-c9e1-eb67-caa8-b0d2e709fdf5@intel.com>
Date: Tue, 17 Jan 2023 12:34:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v11 4/5] drm/bridge: cdns-dsi: Create a header file
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230103101951.10963-1-r-ravikumar@ti.com>
 <20230103101951.10963-5-r-ravikumar@ti.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230103101951.10963-5-r-ravikumar@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: mparab@cadence.com, a-bhatia1@ti.com, jonas@kwiboo.se, airlied@linux.ie,
 tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, vigneshr@ti.com,
 devicetree@vger.kernel.org, robert.foss@linaro.org, jpawar@cadence.com,
 lee.jones@linaro.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03.01.2023 11:19, Rahul T R wrote:
> Create a header file for cdns dsi and move structure definations to
> prepare for adding j721e wrapper support
>
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

