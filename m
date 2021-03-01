Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A10D3283E9
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 17:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1D36E83C;
	Mon,  1 Mar 2021 16:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F876E7D2
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 16:28:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2195D8A1;
 Mon,  1 Mar 2021 17:28:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1614616092;
 bh=zIQKsEQSeYt0vM1IDXx2S6ybJAbk8gSLvOd303Cl3/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JO2+atOWKb+gad3wBZ7G6cybVMCz5eLCxzSGspZ+gSeelTmdfnGHY9kTcLfA3KjbD
 pPwLjF0CnSLZThDUGGQ3YSiJc18Wo13Yp4mWb6Gnzuk3/Ov8Rqa+LXLyssboPmxorZ
 +rJtWmfB1u5Wca+dxML/R8OLpRxBBelyi4qBa/9M=
Date: Mon, 1 Mar 2021 18:27:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Parshuram Raju Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Message-ID: <YD0WAMySrv53lxFR@pendragon.ideasonboard.com>
References: <1614597685-4192-1-git-send-email-pthombar@cadence.com>
 <1614597746-4563-1-git-send-email-pthombar@cadence.com>
 <YD0LKg3Jl5nauMqF@pendragon.ideasonboard.com>
 <DM5PR07MB319661E8BFEB251CE17AF587C19A9@DM5PR07MB3196.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM5PR07MB319661E8BFEB251CE17AF587C19A9@DM5PR07MB3196.namprd07.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kishon@ti.com" <kishon@ti.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>,
 "nikhil.nd@ti.com" <nikhil.nd@ti.com>, Milind Parab <mparab@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Parshuram,

On Mon, Mar 01, 2021 at 04:14:54PM +0000, Parshuram Raju Thombare wrote:
> Hi Laurent,
> 
> > Is this a property of the hardware, that is, are there multiple versions
> > of this IP core covered by the same compatible string that support HDCP
> > 1.4 only, DHCP 2.2 only or both ? Or is it a way to select what a given
> > system will offer ?[] 
> 
> MHDP hardware supports both HDCP 2.2 and 1.4. So, this is a way
> to select the version of HDCP, system wish to support.

Then I'm not sure this qualifies as a DT property, which should describe
the system, not configure it. A way for userspace to configure this
would be better.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
