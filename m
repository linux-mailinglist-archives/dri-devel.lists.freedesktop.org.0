Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E02546E70C9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 03:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE6B10E061;
	Wed, 19 Apr 2023 01:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BBB10E277
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 01:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Lms0C4cT+76fgagWleJqEZcrYl+boMnYrcMJr37IMKM=; b=XU4aeWxty1DBSslTGWkRcU1mrm
 T0cqHBLDYAbr7oK0uIUwI/s3ejCbybWEj1WbaM2EsGGK7koPF+irsx4ouxGne/f/FxPXILPpHrRcj
 6H/6VxYeNU3I2FptzANzwq3XyNC6OCxyZUCIwvuN3zuPTCS++SgiFq/lGwcY5BxkjGYQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1powHB-00AebN-CS; Wed, 19 Apr 2023 03:06:25 +0200
Date: Wed, 19 Apr 2023 03:06:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Justin Chen <justinpopo6@gmail.com>
Subject: Re: [PATCH net-next 5/6] net: phy: bcm7xxx: Add EPHY entry for 74165
Message-ID: <c967927d-c9ec-4453-8452-6e90f797bcfc@lunn.ch>
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
 <1681863018-28006-6-git-send-email-justinpopo6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1681863018-28006-6-git-send-email-justinpopo6@gmail.com>
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
 richardcochran@gmail.com, hkallweit1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, justin.chen@broadcom.com,
 linaro-mm-sig@lists.linaro.org, edumazet@google.com, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, krzysztof.kozlowski+dt@linaro.org,
 kuba@kernel.org, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 05:10:17PM -0700, Justin Chen wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> 74165 is a 16nm process SoC with a 10/100 integrated Ethernet PHY,
> utilize the recently defined 16nm EPHY macro to configure that PHY.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
