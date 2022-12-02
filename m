Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18223640C98
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 18:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A893E10E19E;
	Fri,  2 Dec 2022 17:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC7C10E19E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 17:52:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B2HqDt4013855;
 Fri, 2 Dec 2022 11:52:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1670003533;
 bh=1OG3smuC37RqNdYlEMCo4ORzNBg03hc1dJ9bK3UC26Q=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=WT8xujmjIvrWqYGtgOu5UdLJ2xI/hCcOy5xhkpUuiQPf2fFVOzsIjbkTi/EFT4OPk
 OhYtVClMOtl4vngouNYhbBnf/sDHD5QIn8LVZ0o3doO8oFWdheWWSG1Ks5XyNKqpdF
 Ocs68kjTg+q/AQ9/k5JSAr54vf+iAqx+I+QGE/LM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B2HqDob047625
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 2 Dec 2022 11:52:13 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 2
 Dec 2022 11:52:13 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 2 Dec 2022 11:52:13 -0600
Received: from [10.250.38.44] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B2HqCPF006857;
 Fri, 2 Dec 2022 11:52:12 -0600
Message-ID: <49761fcd-7cef-9c41-185a-0a6d7e2b4a5e@ti.com>
Date: Fri, 2 Dec 2022 11:52:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm: tidss: Fix pixel format definition
To: Randolph Sapp <rs@ti.com>, <jyri.sarha@iki.fi>, <tomba@kernel.org>
References: <20221202001803.1765805-1-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221202001803.1765805-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: a-bhatia1@ti.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/1/22 6:18 PM, Randolph Sapp wrote:
> There was a long-standing bug from a typo that created 2 ARGB1555 and
> ABGR1555 pixel format entries. Weston 10 has a sanity check that alerted
> me to this issue.
> 
> According to the Supported Pixel Data formats table we have the later
> entries should have been for Alpha-X instead.
> 

Fixes 32a1795f57eecc

Acked-by: Andrew Davis <afd@ti.com>

> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index ad93acc9abd2..16301bdfead1 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -1858,8 +1858,8 @@ static const struct {
>   	{ DRM_FORMAT_XBGR4444, 0x21, },
>   	{ DRM_FORMAT_RGBX4444, 0x22, },
>   
> -	{ DRM_FORMAT_ARGB1555, 0x25, },
> -	{ DRM_FORMAT_ABGR1555, 0x26, },
> +	{ DRM_FORMAT_XRGB1555, 0x25, },
> +	{ DRM_FORMAT_XBGR1555, 0x26, },
>   
>   	{ DRM_FORMAT_XRGB8888, 0x27, },
>   	{ DRM_FORMAT_XBGR8888, 0x28, },
