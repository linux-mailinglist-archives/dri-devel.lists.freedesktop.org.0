Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5AF725283
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 05:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A987610E41A;
	Wed,  7 Jun 2023 03:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AF610E41A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 03:45:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B93B7634B5;
 Wed,  7 Jun 2023 03:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40975C4339B;
 Wed,  7 Jun 2023 03:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686109502;
 bh=23b85ddF74DRpHqNGxTgfBMNcy0hEkGn39jASt7LXGY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KozwMzbBcxqF3yspohCRX5N5zMV5Za8U22w+oHAcz4yDr/yx1eMfv3Zq40lwSaijF
 x0eJyRdVwKLJ5NPv9mpvUfstSDXmaXlFVfo34sWCVZGru8tfdtocvayA4TeNF9Idp9
 UyUJaAe2AgbYmC4GdN/M3yHcRS3KEZ79wX8Oe5mQV0F5bXNFUWoWC8zS5WELlJj4Dj
 obSKgYeqc9TnlFJn/AMk5GftaUWN2PwejIPzl3Z2Tyd2ZANoYWY7TGLx4enOa1SO9U
 GoyaGShdEoxet7hftBuqRs9b9NwWeZs0dDCSJDgrh48NEQnUJO8oyI1tmKgKo6XNim
 D7EnPd94tiBww==
Date: Tue, 6 Jun 2023 20:45:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v6 3/6] net: bcmasp: Add support for ASP2.0
 Ethernet controller
Message-ID: <20230606204500.04083bd8@kernel.org>
In-Reply-To: <024a6733-f552-c538-2b59-26058c750d66@broadcom.com>
References: <1685657551-38291-1-git-send-email-justin.chen@broadcom.com>
 <1685657551-38291-4-git-send-email-justin.chen@broadcom.com>
 <20230602235859.79042ff0@kernel.org>
 <956dc20f-386c-f4fe-b827-1a749ee8af02@broadcom.com>
 <20230606171605.3c20ae79@kernel.org>
 <8601be87-4bcb-8e6b-5124-1c63150c7c40@broadcom.com>
 <20230606185453.582d3831@kernel.org>
 <024a6733-f552-c538-2b59-26058c750d66@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, opendmb@gmail.com,
 florian.fainelli@broadcom.com, andrew@lunn.ch, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, edumazet@google.com,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 krzysztof.kozlowski+dt@linaro.org, simon.horman@corigine.com,
 christian.koenig@amd.com, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 6 Jun 2023 19:33:13 -0700 Justin Chen wrote:
> >> Not netdevs per se, but packets can be redirected to an offload
> >> co-processor.  
> > 
> > How is the redirecting configured?
> 
> Through filters that can be programmed by the Host cpu or co-processor.

How are the filter programmed by the host (in terms of user API)?
