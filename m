Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD4970EBD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0202410E2DC;
	Mon,  9 Sep 2024 07:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="7ymmRER4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF22A10E2DC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 07:02:00 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488NJcI3004295;
 Mon, 9 Sep 2024 09:01:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 e9ORReuSJ12+IscNIptFNf/Mkrft3JTYJ/7DOdslGQU=; b=7ymmRER43PNFeJqX
 XsPv/MQu+krLusDvyyjX/b26RXKmSiMW5EoZERbn1WpA9zltUTyDf/71SBJ0RMth
 ipNqez2cQigCb7QIYj/Y0lRXvHneEt4P4uqbiCilHf0ojTaDsM4sP/cTMSjA2OcL
 1f1TQ9Xn8Q0uopGOJFDJ3gTyGy+RjyAkV6PbuhMpcX1gkDd5XAuPvcsS3p77vMdM
 v5LA2N+nIIlCgZt8JZ7V8OCpS22BYwOobq85dquTjXny/1T/eYCp/j1qT+Dvwla3
 zyWtNhg5jz2p2iWGgUSk64Yk1Vl58q0bYHN6Kjh3y0XqF8w5o2cnCNnI1UQM0mQ8
 iLdq9Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41gy7s3rku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Sep 2024 09:01:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A163D40044;
 Mon,  9 Sep 2024 09:00:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60761246F19;
 Mon,  9 Sep 2024 08:57:58 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Sep
 2024 08:57:57 +0200
Message-ID: <544a633e-de53-493d-9c29-de8ff52630da@foss.st.com>
Date: Mon, 9 Sep 2024 08:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dw_mipi_dsi-stm.c:(.text+0x8db9a3): undefined reference to
 `clk_hw_unregister'
To: Borislav Petkov <bp@alien8.de>, <linux-stm32@st-md-mailman.stormreply.com>
CC: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240905081902.GAZtlpdlQp5XOm5XtO@fat_crate.local>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240905081902.GAZtlpdlQp5XOm5XtO@fat_crate.local>
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


On 9/5/24 10:19, Borislav Petkov wrote:
> Hi all,
>
> this fires in my randbuilds here:
>
> vmlinux.o: warning: objtool: adis16400_write_raw() falls through to next function adis16400_show_serial_number()
> ld: vmlinux.o: in function `dw_mipi_dsi_stm_remove':
> dw_mipi_dsi-stm.c:(.text+0x8db9a3): undefined reference to `clk_hw_unregister'
> ld: vmlinux.o: in function `dw_mipi_dsi_clk_register':
> dw_mipi_dsi-stm.c:(.text+0x8db9f5): undefined reference to `clk_hw_register'
> ld: vmlinux.o: in function `lvds_remove':
> lvds.c:(.text+0x8dc605): undefined reference to `clk_hw_unregister'
> make[2]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
> make[1]: *** [/home/amd/bpetkov/kernel/linux/Makefile:1156: vmlinux] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
>
> is there a fix somewhere?

Hi Borislav,


Arnd Bergmann sent a patch regarding this issue on x86 that I merged several
weeks ago.

https://lore.kernel.org/lkml/20240719075454.3595358-1-arnd@kernel.org/
https://lore.kernel.org/all/c3d0757a-07c0-4f83-9f06-c3ad205aa1e9@foss.st.com/

>
> People love to do
>
> 	depends on ... COMPILE_TEST
>
> but then if no one takes care of it in time:
>
> https://lore.kernel.org/oe-kbuild-all/202407212000.rpDH64jP-lkp@intel.com

Now, I'm not familiar with PowerPC architecture and toolchains, but I think this
patch should fix your problem.
Do you have the above fixup in your tree ? If not please try it.

Thanks,

Regards,
Raphaël

>
> that COMPILE_TEST thing is forcing me to simply blacklist it and is not really
> helping.
>
> Thx.
>
