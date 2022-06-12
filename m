Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 843BA5479C7
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 12:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BBC112655;
	Sun, 12 Jun 2022 10:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7BB112655
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 10:37:27 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B91EF84414;
 Sun, 12 Jun 2022 12:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655030246;
 bh=uanTPSGGFuVl2Va6yoXCyLMLlQ0kr7s3D/vz42vdEFY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lzru7bwSEALlX1Tu8LZPs+PxNxDC38ESICAQ73Un1A67o8ruMJbnuV3xg41yv6yvb
 91pDx/FnS1ykyRDm+ijVHlxYmvBm9rD0SaCfhF5GMkRfnzXGNx9ugp003y2GkI7Hs5
 bX+6lN0G2+M4eP7/G6HFzt8CZWbk5GnFoXd6fv/FdVcxfBeW9AUTo/Vq3hNFstcDXZ
 les16vQMWueuiA9oxwvv91WswkJ+4MPJPx4vfzguYjcT0eXgDwldNLRMDoKZjd67yV
 3QHMsgiOM661OjDpHT6rkQZa35VCEQCu8iKP1hInHV+Kfayici9251TWYbCIkfK0hf
 mezKpXj8zKKDA==
Message-ID: <9a1bfd31-8dd6-ff79-96a1-81c935fb35a3@denx.de>
Date: Sun, 12 Jun 2022 12:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 08/11] drm/bridge: ti-sn65dsi83: Convert to
 drm_of_get_data_lanes_count
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20220524010522.528569-1-marex@denx.de>
 <20220524010522.528569-8-marex@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220524010522.528569-8-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/24/22 03:05, Marek Vasut wrote:
> Convert driver to use this new helper to standardize
> OF "data-lanes" parsing.

Applied all to drm-misc-next except for this particular patch, which 
depends on yet unreviewed deduplication patch. Both remaining patches 
are resubmitted:

https://patchwork.freedesktop.org/patch/489197/
https://patchwork.freedesktop.org/patch/489198/
