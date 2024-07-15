Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242959310E4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 11:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9256B10E0F9;
	Mon, 15 Jul 2024 09:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="sL2kg5Ba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B964D10E0F9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:11:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F7nQAY011784;
 Mon, 15 Jul 2024 11:11:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 EmBq4iYlhep3ZGRFPwGod6Rwi9HusrX/rf39e4GhoPk=; b=sL2kg5Ba5l3zIKIy
 72wYw8A4IqRvX627qjMpEHz7ZHHqYknfLccmEqqCnITeHsF4XFSYAETGftsGw9Ly
 RMh04G41xx5AkrFuJzLtL4oDkqVQmhLgZrJlbjnPVsn4MPpRTevLXz44+uDODwgb
 G0oGgZp6ygZ/c3zGmZP/kQpxmgv7nj61EJbhk8cDqH9PbDfaAkfHQX1fEaNecV/O
 LMuuTOKKmeNx/8AfL6yqk4vfIOlM9jLc3Tegf5WGAiXyLHNe7HirMBzCEsOaAMsd
 HuUwWfrvki2m+98mmdRqnZ7ZRhlOJMWn/A5yQDLeXTTyrX0vliPZWQ6AXucNHdyB
 zWyqqA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40bgfddrdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jul 2024 11:11:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BC8C84002D;
 Mon, 15 Jul 2024 11:11:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC568210F72;
 Mon, 15 Jul 2024 11:10:19 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 15 Jul
 2024 11:10:18 +0200
Message-ID: <aa8d12a0-1cf1-4f83-aa52-e0f3d8e3338f@foss.st.com>
Date: Mon, 15 Jul 2024 11:10:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/stm: ltdc: Remove unused function plane_to_ltdc
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 <yannick.fertre@foss.st.com>
CC: <philippe.cornu@foss.st.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20240624024113.54850-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240624024113.54850-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.17]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_05,2024-07-11_01,2024-05-17_01
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


On 6/24/24 04:41, Jiapeng Chong wrote:
> The function are defined in the ltdc.c file, but not called
> anywhere, so delete the unused function.
>
> drivers/gpu/drm/stm/ltdc.c:494:35: warning: unused function 'encoder_to_ltdc'.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9403
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>


Hi Jiapeng,

Applied on drm-misc-next.

Thanks,
Raphaël

