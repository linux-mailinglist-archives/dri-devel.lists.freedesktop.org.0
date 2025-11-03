Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AB8C2C182
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 14:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A59E10E0E6;
	Mon,  3 Nov 2025 13:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="LrpAneyB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D359F10E0E6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 13:30:45 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A36s30f1265134; Mon, 3 Nov 2025 13:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=p
 ha4iqzjLRhIK14Ep3HX/+oxy73O9OJMBOJe+Wnyn98=; b=LrpAneyBQgmlSXaAC
 6PgP4rS0pAlg52uKttIUkxS6DYWtgB87AMyGhZTBeEvc2ShPOleCvDTYl965wjAh
 Fr6mKJhBp5vYDd9w9XQtPCSet0Nfx4GtrNQMHRyq9hxTbbUxBKGtoDFksb+gkHNb
 p0mJ/po+vSGwGUVaA4sbnv3aZR9iJaYmNcMcnuTRXypr99aZc83TT0f4OWtzzfmn
 5pAgB/zTX7PD+WfY5EVUf7uqD+fy0mCdonRwD1Uniwd1x9w98olAjGwVCyYwyHoj
 l2u1kcwEH/IbHBl+YhAEf0Q6z7AuBD9I3l9GCoMR3Uk9P6iZSDzdjiy9U0/MSZTC
 Uov1g==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4a59bss9px-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Nov 2025 13:30:28 +0000 (GMT)
Received: from HHMAIL03.hh.imgtec.org (10.44.0.121) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.36; Mon, 3 Nov
 2025 13:30:27 +0000
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.134) by HHMAIL03.hh.imgtec.org (10.44.0.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 3 Nov 2025 13:30:26 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Michal Wilczynski
 <m.wilczynski@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matt Coster <matt.coster@imgtec.com>
CC: Frank Binns <frank.binns@imgtec.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, kernel test robot <lkp@intel.com>
In-Reply-To: <20251014-pwrseq-dep-v1-1-49aabd9d8fa1@imgtec.com>
References: <20251014-pwrseq-dep-v1-1-49aabd9d8fa1@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Optionally depend on POWER_SEQUENCING
Message-ID: <176217662645.4491.9524914948435472872.b4-ty@imgtec.com>
Date: Mon, 3 Nov 2025 13:30:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Originating-IP: [172.25.4.134]
X-Proofpoint-GUID: 2Mi1LMmksvkuRAg5rwahs4ajV7TIH27v
X-Proofpoint-ORIG-GUID: 2Mi1LMmksvkuRAg5rwahs4ajV7TIH27v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEyMiBTYWx0ZWRfX5+T0LQ50f6gI
 Xov8i3k16qnn4LrK2wyPsYui34gX2dRw7luzWgTfl+bBkSQAMNm6ulew6bNP7oGAsaP8ybcrsfN
 96dg24+PgMR/UqBR8BwW8DzUH7UhX5ao19hPnLlArcgbMi6yDTSWWjaMnoyb2FNwyeyHbk80i1H
 gsIv18mOcKZ6Nq1CUGtm9FWPUljY8pvQDICLHzJUQPCCFtJiMf4P6RyJKAFZi25bvAroFPW4GvI
 ZttMUJ4NiI/MbAZPEHfvCPxg/F3DsrPWFiZxiFVgJjbFPxB8UondVCHiyvEJBe7/B/AYhyMDkMg
 LjSkZ8ERXidMdJi49pdODn+biogHkr4yG0Uj3kfB2Kg25g9W57QQv2qwYHmAZYwY3IV4uHNJWdP
 NnYygmRjiZGK85DOP8UGMuZqdq/o4A==
X-Authority-Analysis: v=2.4 cv=Yb2wJgRf c=1 sm=1 tr=0 ts=6908ae74 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=0einROue838A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=IMCeZBfq-HFVmF8d6oMA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
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


On Tue, 14 Oct 2025 12:57:31 +0100, Matt Coster wrote:
> When the change using pwrseq was added, I nixed the dependency on
> POWER_SEQUENCING since we didn't want it pulled in on platforms where
> it's not needed [1]. I hadn't, however, considered the link-time
> implications of this for configs with POWER_SEQUENCING=m.
> 
> [1]: https://lore.kernel.org/r/a265a20e-8908-40d8-b4e0-2c8b8f773742@imgtec.com/
> 
> [...]

Applied, thanks!

[1/1] drm/imagination: Optionally depend on POWER_SEQUENCING
      (no commit info)

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

