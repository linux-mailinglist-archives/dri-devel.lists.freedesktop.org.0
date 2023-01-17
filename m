Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE06C66DC67
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 12:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE9010E19D;
	Tue, 17 Jan 2023 11:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F6110E19D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 11:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673955035; x=1705491035;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=i3BuCS+pJ4oTm89xGBP/zNyMeh4Xwhz1HQ+sE6hvKJk=;
 b=NYA9Ny5uvIwHvrUwA0427aGFLY1I1to61QUiVZ35ibRFxuc5pIqQN7TI
 jdTtaeVA+uNZ4yjoRCpY3yIsn5i1ojFuaqAYxoTh8aRk0GZP67vCj0+CV
 mqpbiLU8C5JRdwnncVpbODCmbTN4L+Dub5lO1yVLRn+fzWRXyCxqihQjV
 v5Y6xKq64tynlRkhi/c7uJ15f+4cFkUsk6YDxEs60pu2h3bSCPTub0q5j
 878u9NVHaGoXJ1Er50L9T9eM8CxQ3f6c+A3YpjVuiajMmGjoQrt09SSIq
 ZPoHjPRpv6yhPKX/rHlufTfYJyswDl+UwG60Rdy182vNOCEXqNvVem9Cv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="323369012"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="323369012"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:30:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="904615098"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="904615098"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.10.213])
 ([10.213.10.213])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:30:29 -0800
Message-ID: <309b58d6-3b4f-36ec-d68e-f0fc60790118@intel.com>
Date: Tue, 17 Jan 2023 12:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v11 1/5] dt-bindings: display: bridge: Convert
 cdns,dsi.txt to yaml
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230103101951.10963-1-r-ravikumar@ti.com>
 <20230103101951.10963-2-r-ravikumar@ti.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230103101951.10963-2-r-ravikumar@ti.com>
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
> Convert cdns,dsi.txt binding to yaml format
>
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

