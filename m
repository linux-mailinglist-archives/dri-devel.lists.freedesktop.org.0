Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCimJLB7oWkUtgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:10:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED84F1B6613
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539C610EB05;
	Fri, 27 Feb 2026 11:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="M/5pNHKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 512 seconds by postgrey-1.36 at gabe;
 Fri, 27 Feb 2026 11:10:36 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8DA10EB18
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 11:10:35 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260227110202euoutp01e351d55f106686fc51916182f4a89d40~YFYb7rmOt0224002240euoutp01X
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 11:02:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260227110202euoutp01e351d55f106686fc51916182f4a89d40~YFYb7rmOt0224002240euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1772190122;
 bh=qmB4sCKpzc9WGUBY+s4LrtK7Wne1fnOCrPQGkz1WNpQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=M/5pNHKqIkVkGoDP1PzezE763s5faG4KqECluWlRICgzKB/6EWpRNfG4Gva3RM6sc
 X31ZVHemcHaZgEE7HUXhx+FOA3bI7x7+FKk3c+HFwf/ro8mF8kfCawgIw403zpkaKx
 nSyUxRSlAemgAjrLS4bmgaab5vdHeSN/STQI87/U=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260227110202eucas1p2d215d27dfd75dd66804d745e315931aa~YFYbpWV6o1379713797eucas1p2A;
 Fri, 27 Feb 2026 11:02:02 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260227110202eusmtip23d0ed369975394f190c72bcb53ca092a~YFYbL1JMe0830708307eusmtip2h;
 Fri, 27 Feb 2026 11:02:02 +0000 (GMT)
Message-ID: <873c2755-1903-4760-b09d-498060b7dfc3@samsung.com>
Date: Fri, 27 Feb 2026 12:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: verisilicon: DRM_VERISILICON_DC should depend on
 ARCH_THEAD
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, graham@big-grey.co.uk
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <893289430f07a1e89be4932bde0dd3d700366e02.camel@iscas.ac.cn>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260227110202eucas1p2d215d27dfd75dd66804d745e315931aa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260226153654eucas1p17a1a671532fe3d6d6d7a0fce19843060
X-EPHeader: CA
X-CMS-RootMailID: 20260226153654eucas1p17a1a671532fe3d6d6d7a0fce19843060
References: <fd65d4c53463e9579f59d7532ac6cce795d57aca.1772103393.git.geert+renesas@glider.be>
 <CGME20260226153654eucas1p17a1a671532fe3d6d6d7a0fce19843060@eucas1p1.samsung.com>
 <893289430f07a1e89be4932bde0dd3d700366e02.camel@iscas.ac.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:geert+renesas@glider.be,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:graham@big-grey.co.uk,m:linux-kernel@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[m.wilczynski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,glider.be,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,big-grey.co.uk];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.wilczynski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:mid,samsung.com:dkim,samsung.com:email,lists.freedesktop.org:url,fireeye.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,glider.be:email,big-grey.co.uk:url]
X-Rspamd-Queue-Id: ED84F1B6613
X-Rspamd-Action: no action



On 2/26/26 16:36, Icenowy Zheng wrote:
> 在 2026-02-26四的 12:00 +0100，Geert Uytterhoeven写道：
>> Currently, the Verisilicon DC-series display controller driver
>> supports
>> only the DC8200 variant in the T-HEAD TH1520 SoC.  Hence restrict the
>> dependency on RISCV to ARCH_THEAD, to prevent asking the user about
>> this
>> driver when configuring a kernel without T-HEAD platform support.
>>
>> The dependency can be relaxed later, when adding support for
>> appropriate
>> SoCs from other vendors.
> 
> Michal Wilczynski has verified that this driver will work on StarFive
> JH7110 with some extra glue drivers (but without modification to this
> driver itself). [1]

Yeah I managed to test successfully (not all resolutions worked for me
but this does seem like HDMI driver issue). Additionally Graham Markall
managed to check on his VF2 independently [1]. Hopefully will find some
time to send an updated v2.

[1] - https://big-grey.co.uk/2026/01/26/testing-starfive-jh7110-display-controller-patches/

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

> 
> Although this can be considered as future work and changing to
> ARCH_THEAD seems okay now.
> 
> (BTW the hardware identification values is taken from the vendor driver
> and it should support different variants of DC8200)
> 
> Thanks
> Icenowy
> 
> [1]
> https://protect2.fireeye.com/v1/url?k=9deb3bf5-c27002f9-9deab0ba-000babff3563-0751fbe2749df7e2&q=1&e=1bdc71ee-fc93-4f72-a715-c25dc3497820&u=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2025-November%2F535442.html
> 
>>
>> Fixes: dbf21777caa8b8c8 ("drm: verisilicon: add a driver for
>> Verisilicon display controllers")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  drivers/gpu/drm/verisilicon/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/verisilicon/Kconfig
>> b/drivers/gpu/drm/verisilicon/Kconfig
>> index 7cce86ec8603c596..f2edde9e0037ebcd 100644
>> --- a/drivers/gpu/drm/verisilicon/Kconfig
>> +++ b/drivers/gpu/drm/verisilicon/Kconfig
>> @@ -2,7 +2,7 @@
>>  config DRM_VERISILICON_DC
>>  	tristate "DRM Support for Verisilicon DC-series display
>> controllers"
>>  	depends on DRM && COMMON_CLK
>> -	depends on RISCV || COMPILE_TEST
>> +	depends on ARCH_THEAD || COMPILE_TEST
>>  	select DRM_BRIDGE_CONNECTOR
>>  	select DRM_CLIENT_SELECTION
>>  	select DRM_DISPLAY_HELPER
> 
> 

