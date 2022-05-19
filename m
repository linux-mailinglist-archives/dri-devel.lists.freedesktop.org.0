Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5881C52D1CD
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 13:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC3A11A552;
	Thu, 19 May 2022 11:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A35511A54F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 11:52:04 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2ADE480FC8;
 Thu, 19 May 2022 13:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652961122;
 bh=/8EnI+4wgi5h4nBm1DKFaOYmA9AsP1nPBFaJW7gJBu8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FWeXSMskO2FUZSkOcwEbfAwUWlGdwIVjZ8/O7c7yN6NVEk1N+9Srd8e3axp8KP9Qg
 ZAKS5r95wr6wU1kyCiB8voNH1WwlarYjIea/+oG4K3k6Z2O0i1Sl2FSSVCNU+uW/yw
 M7QPhv889ZLz5rV71yW1hX1jPpg2W6KL7BbhoKlqeqrOBAZHfGwZUpAfOfB3ab7MPp
 3se5Neds9G2yxbD05a9WCPib6iuXXCZLTOZFeVfqAlJG1zCRaBoETaD1vVSwt7o3Eq
 OhmbEcPSoJrPzP49r+7UZhjdZO9+dWVoMHbLx9aOvDbPYEezMenMQCX+Fq+XuxpE1R
 Lfjs4NtlipRBA==
Message-ID: <59d796d3-1aee-0ac1-8eff-37c881ac97f8@denx.de>
Date: Thu, 19 May 2022 13:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 10/11] drm/bridge: msm: Convert to drm_of_get_data_lanes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org
References: <20220519112657.62283-1-marex@denx.de>
 <20220519112657.62283-10-marex@denx.de>
 <1951f060-bcd8-2182-9950-c86b88e12d45@linaro.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <1951f060-bcd8-2182-9950-c86b88e12d45@linaro.org>
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
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/19/22 13:43, Dmitry Baryshkov wrote:
> On 19/05/2022 14:26, Marek Vasut wrote:
>> Convert driver to use this new helper to standardize
>> OF "data-lanes" parsing.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Can you please also test it, that it does not break anything ?

> Minor nit, if you resend this series for any reason: could you please 
> follow the usual subject prefix for the msm driver: 'drm/msm: ....'

Will do
