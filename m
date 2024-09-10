Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CB897358C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 12:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5845010E781;
	Tue, 10 Sep 2024 10:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="GdbIfRJP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13B510E781
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 10:52:17 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A7dsqE017268;
 Tue, 10 Sep 2024 12:51:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 GTXIqttQsTFPl8RhA+OuEhkVjdhqa/BUezdHeMsd0Wg=; b=GdbIfRJPuU8F36gC
 WGXi8Xtn39pr/LMPeX7E6Ge5LKWfgz6967HXE86UFD5HPiKUase7aUfuViEyK63V
 URMFwQ5iLjSxL65ebj+ZUeVHTjeLxJe3Cn1oRJ1GD9LDeY4NS0Q3inWSL/jn3OZA
 MduPLVb20pTW6bn062RasuZG9WDJT19dN6/WZ5OWihAUxTxqzz4tO4sZKaLXTuk+
 sbNmQBHB1Emzcsc5Qa51KSUZ0VMZooa0WHwQgS3z+1p87pKPCs5NOHjB4vr/k2cA
 vNJTMQT1rQ4uhA+YcOHZKiMe5/7zkmA29idhQK/m/TjcoXgE6Saw3emsTbT6uZ4K
 87DIwA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41gy7s9g89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2024 12:51:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0E8E440047;
 Tue, 10 Sep 2024 12:50:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 194A7260266;
 Tue, 10 Sep 2024 12:48:50 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Sep
 2024 12:48:49 +0200
Message-ID: <0e9018d0-c49f-4dac-aa0f-b05504f9c6f6@foss.st.com>
Date: Tue, 10 Sep 2024 12:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dw_mipi_dsi-stm.c:(.text+0x8db9a3): undefined reference to
 `clk_hw_unregister'
To: Borislav Petkov <bp@alien8.de>
CC: <linux-stm32@st-md-mailman.stormreply.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240905081902.GAZtlpdlQp5XOm5XtO@fat_crate.local>
 <544a633e-de53-493d-9c29-de8ff52630da@foss.st.com>
 <20240909084506.GBZt61kqqGVUTqjKc4@fat_crate.local>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240909084506.GBZt61kqqGVUTqjKc4@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.17]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
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


On 9/9/24 10:45, Borislav Petkov wrote:
> On Mon, Sep 09, 2024 at 08:57:57AM +0200, Raphael Gallais-Pou wrote:
>> Arnd Bergmann sent a patch regarding this issue on x86 that I merged several
>> weeks ago.
>>
>> https://lore.kernel.org/lkml/20240719075454.3595358-1-arnd@kernel.org/
>> https://lore.kernel.org/all/c3d0757a-07c0-4f83-9f06-c3ad205aa1e9@foss.st.com/
> Thanks.
>
>> Now, I'm not familiar with PowerPC architecture and toolchains, but I think
>> this patch should fix your problem.  Do you have the above fixup in your
>> tree ? If not please try it.
> Not PowerPC - it is an x86 build. I do random config builds as part of build
> testing and when a driver depends on COMPILE_TEST, it does gets built in some
> .configs. So some may fail, as in this case.

Unless I am mistaken, the link you provided refers to a PowerPC linker error:

[...]

compiler: powerpc-linux-gcc (GCC) 14.1.0

[...]
   powerpc-linux-ld: drivers/gpu/drm/stm/dw_mipi_dsi-stm.o: in function `dw_mipi_dsi_stm_remove':
   dw_mipi_dsi-stm.c:(.text+0x664): undefined reference to `of_clk_del_provider'
>> powerpc-linux-ld: dw_mipi_dsi-stm.c:(.text+0x66c): undefined reference to `clk_hw_unregister'    powerpc-linux-ld: drivers/gpu/drm/stm/dw_mipi_dsi-stm.o: in function `dw_mipi_dsi_stm_probe':
   dw_mipi_dsi-stm.c:(.text+0x98c): undefined reference to `clk_hw_register'

>
> So I think you should send that patch to Linus now so that such randconfig
> builds do not fail anymore.

What do you mean by 'sending it to Linus' ? If you meant to do a pull request,
then no. This patch is already in the drm-misc tree, which means it will keep
its usual pace of merging with the rest of the drm-misc tree.

For more information about drm-misc tree:
https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-misc.html#merge-timeline

>
> Unfortunately, I cannot test it right now because I've removed the triggering
> randconfigs but when I hit it again, I'll make sure to apply yours.
Thank you for this. Do not hesitate to reach if you encounter any problems with
this patch.

Regards,
Raphaël

>
> Thx.
>
