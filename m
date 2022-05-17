Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8057F529B75
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 09:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48967112EB4;
	Tue, 17 May 2022 07:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12D2112EB4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 07:52:02 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4L2SwJ0nT3z1JCGB;
 Tue, 17 May 2022 15:50:40 +0800 (CST)
Received: from [10.174.179.215] (10.174.179.215) by
 canpemm500007.china.huawei.com (7.192.104.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 17 May 2022 15:51:59 +0800
Subject: Re: linux-next: Tree for May 16 (drm/msm: kconfig warning)
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220516205718.2c5a52f9@canb.auug.org.au>
 <e61b5844-2595-4138-bf64-5b4d48ec8a4f@infradead.org>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <65ec4f4f-5fba-73eb-e73c-81366d94ac0b@huawei.com>
Date: Tue, 17 May 2022 15:51:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e61b5844-2595-4138-bf64-5b4d48ec8a4f@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
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
Cc: linux-arm-msm@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/5/16 23:10, Randy Dunlap wrote:
> 
> On 5/16/22 03:57, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20220513:
>>
> 
> on i386 or x86_64:
> 
> WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
>   Selected by [y]:
>   - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=n] || QCOM_LLCC [=n]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)

This is fixed by
https://www.spinics.net/lists/kernel/msg4349168.html

> 
> 
> Full randconfig file is attached.
> 
