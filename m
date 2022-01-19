Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874BF4949DD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B1A10E8F4;
	Thu, 20 Jan 2022 08:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1603 seconds by postgrey-1.36 at gabe;
 Wed, 19 Jan 2022 11:24:23 UTC
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E74210E71D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 11:24:23 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20J5aNQc003098;
 Wed, 19 Jan 2022 04:57:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=YeXjvt2a/3UPggig0LgeC8zG+kAXAN5PBZnu2EVj7xY=;
 b=LrPgXwdH8VKL3HwRWaA6o8fKipetDIcgkbBL5GAST84W3pDLptBnYV5kxG7+L+BbEBid
 C/Kjm8mA761mT3PTXrMT6e2sJhJhnYD244TOsdNmGn+NRzc8LW0N6W5mbj0Kp77ZK0vy
 eg+1iuwXVygQPud3lxG8lHsCtImFhokOD9Kz372YX4Y2m9Qkj24Nd34Dah9erEYj5Ppt
 tw9PMtj8Fdj9uEXqGIth5cdSwAYKw4vbuKmE2Fz9kuj3JEAcwzaTwdpX7Rh5UP5chgwo
 knQP6V666OzxQe8dcg4399G7genTjTRx6DRYBytS3Fi4tggXiLKofGKaTqQ6xyxhj3aM lQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dnaxhtd5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 19 Jan 2022 04:57:27 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 10:57:25 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 19 Jan 2022 10:57:25 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 89617B0E;
 Wed, 19 Jan 2022 10:57:24 +0000 (UTC)
Date: Wed, 19 Jan 2022 10:57:24 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop unnecessary pinctrl properties
Message-ID: <20220119105724.GQ18506@ediswmail.ad.cirrus.com>
References: <20220119015325.2438277-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220119015325.2438277-1-robh@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: qX5Mw540ExmwrU_vS7Og4PEUG2Xrc84A
X-Proofpoint-ORIG-GUID: qX5Mw540ExmwrU_vS7Og4PEUG2Xrc84A
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:47:25 +0000
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
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, - <patches@opensource.cirrus.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rockchip@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 18, 2022 at 07:53:25PM -0600, Rob Herring wrote:
> For a single pinctrl mode, it is not necessary to define pinctrl
> properties as the tools always allow pinctrl properties.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
