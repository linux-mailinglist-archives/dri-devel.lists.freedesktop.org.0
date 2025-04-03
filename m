Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9B6A7A70B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 17:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D8110E247;
	Thu,  3 Apr 2025 15:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="6nHCw1L9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D78910E284
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 15:38:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533CWoms014593;
 Thu, 3 Apr 2025 17:38:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JKIe0+aIGjdecJpynSnkAswexl7oru3HsHNJpwNRFbw=; b=6nHCw1L9nFIWS5Gd
 TYAj222BoR7JXEUkMSPWZSsCotEjtgu5+XOiphXuJtW8swOhshEmEjKwxdxpL7/I
 8oWkq6xiBvY5++2b15TVvgSY/EkNFtfuCGSB9Myw5raxTziMAcl6nVueib51KRNK
 aFHalYRCUed7ZfAjUfDRbA//X/uUcKXHV8XLbt2IqCFoZjv8wjv1cjGKRv9UtuC4
 a740IF9IONI7+2RAosC4HriCNKVb/1qLN7NBQP/CQb1N6NUBkmTcNKyPE8Z7epCv
 KQif7J0nS7Smpnv4AVjc0tdSzvH6Eyu6tgnPhMR5DCY4O4c1UqN8Tjc0mq13cnnk
 ESGLKg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45ryyfr53u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Apr 2025 17:38:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3609840044;
 Thu,  3 Apr 2025 17:37:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 61E0A8BF27C;
 Thu,  3 Apr 2025 17:36:51 +0200 (CEST)
Received: from [10.130.77.153] (10.130.77.153) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 17:36:50 +0200
Message-ID: <018d4212-7465-42c2-82b6-8b9a4a9e2716@foss.st.com>
Date: Thu, 3 Apr 2025 17:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sti: fix inconsistent indenting warning
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>, Charles Han
 <hanchunchao@inspur.com>, <alain.volmat@foss.st.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250305101641.2399-1-hanchunchao@inspur.com>
 <ee3989a0-e03b-4947-acef-7174fef9d36b@gmail.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <ee3989a0-e03b-4947-acef-7174fef9d36b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.77.153]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_06,2025-04-02_03,2024-11-22_01
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



On 3/7/25 13:58, Raphaël Gallais-Pou wrote:
>
>
> Le 05/03/2025 à 11:16, Charles Han a écrit :
>> Fix below inconsistent indenting smatch warning.
>> smatch warnings:
>> drivers/gpu/drm/sti/sti_hda.c:696 sti_hda_bind() warn: inconsistent indenting
>>
>> Signed-off-by: Charles Han <hanchunchao@inspur.com>
>

Hi,

Applied on drm-misc-next.

Thanks,
Raphaël Gallais-Pou

