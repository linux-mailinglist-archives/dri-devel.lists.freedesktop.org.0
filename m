Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1DDAD3CC3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 17:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9533510E290;
	Tue, 10 Jun 2025 15:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7/7CAy/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A63910E290
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 15:22:57 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9kMq1009358
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 15:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e114YZ488PyX5H8bdxjDah+KG/E0gP9d9huL6plo+H8=; b=E7/7CAy/wq7H5+zD
 WnX8GlFw5fc5XZz1GaHLYnYgQYBlw9d7t/vvCNU7Ata6F2W7hZH0G0VEIhquY2FU
 emqXoMl/Neq2Y2P20jr6UP58GPTSGEQTRyVhBaY40i64cCTKaKjFrJHksSQKQ/nh
 xmeey4Z9nUX7NnAxMu5mXnjcmyyWyz8a6KvpNTZEkc2y4kLsbhsNfJenKcheklFV
 Cct2stKsbtxIFebaJiPoNLcJ/samSt32ueGQbzbctSgy1KWp1/cUVNlu6Gq282+a
 rAE/hFxC+WZtaIK/orhKBpYxaK/7zm1dGI6A6AZsVLuLSV5qt12sqNh8Cjh6ewCF
 0wyToA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9symu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 15:22:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7429fc0bfc8so5400550b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 08:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568976; x=1750173776;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e114YZ488PyX5H8bdxjDah+KG/E0gP9d9huL6plo+H8=;
 b=vr5CI/ybm+uVUg5bReTWF1IxlUkzEbnQJ++kA61X5obUJujt/M5y1Wy8XN8jPbsqPH
 84qL9Oea1vhyCva4ZrCiSyjT67uofBd+DxfMqEvPatrKtNy0pYw0/w0G9RH2FTbxzrM9
 E6dcDqRyurucADu43PV82LIFRX0akE0yafD1GT1sQttfjkcOYQbdZQvDi47rvfHHWY7t
 TTG3W/AvEhxhqG4NylPpg/R1pnoGceRouoRivkn+noQYHBOteVuZu0mq0Iv2mxPLTcp1
 2+zQY15RmuS9MN+dGKJIFzyJe8DuNwI2gg+ypA29Fk8CCLGVV+xE43kbTDr7HorZULze
 y1lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcsF4/Tq24O3nNjEWujJmWCd11Ks/jY8M+8NWKYTDF570OYYgVm3sSE7UFA4K/BNbWs1vkxcHERfk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ57n/wo/KrDi8JmjnZxAJ46CCAUziA/aQMLxZknXlqdnJNHfk
 ph79jjImhQmsxuQUxKN7nUjppjYRBx3PJZ620ZtP+Et7bHG31EtSQ1KBuISjzj8Y5GdU5/LLwGQ
 jbh+tltfmAedR72GUKJXvOkgvsVWvQSWJ6hdUTfX4aeJ/taFwmVCar3uLHy4qcqjKnf+JJrA=
X-Gm-Gg: ASbGncstLGYP1/h0nto6hw2Qo+RN0OungmRHcOIYKafy3xqgwo6EU7TylXLZLxvXn0W
 sgheByR1riryuxpL7MU0Ehd542zKcI2UKZ9chHcZYS9dOn48SRsqO3kln5woifBP7PpqJefkDRZ
 2R5v4lmjM4y3L9F/aK6cNF3QZ9pDocyCT11S1CQzY+hql8TFKxFzlXv8PSyqDTqnzlrudPY61QB
 uEtk39Zi7tiZywCEOXgo4XIDRDixMDeVxkmNUIWqfOQxaJWER7s1ecSY5KJnAA9/uWPl8rA+tYS
 NH5IWILobPfqdqCDvN2aZumR+JSt3bWh/sYkI8rjVt+jZDMDQ4YPj+bdoI1Xpkk4T+2IeUYI
X-Received: by 2002:a05:6a20:6a05:b0:21a:cc71:2894 with SMTP id
 adf61e73a8af0-21f7696b725mr5956493637.17.1749568975804; 
 Tue, 10 Jun 2025 08:22:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRW9TAgrPxwCJk/o8eP9DoS0GIWBXXYaSbfoHboYL0uaKLdt5ZmSeDkSVqNYVQEjp5EHKv7w==
X-Received: by 2002:a05:6a20:6a05:b0:21a:cc71:2894 with SMTP id
 adf61e73a8af0-21f7696b725mr5956462637.17.1749568975426; 
 Tue, 10 Jun 2025 08:22:55 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af7aa6esm7780346b3a.59.2025.06.10.08.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 08:22:55 -0700 (PDT)
Message-ID: <c0bea584-10d1-4afa-a80d-594179f3a734@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 09:22:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: semantic conflict between the drm-misc tree and
 Linus' tree
To: Lukas Wunner <lukas@wunner.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250610124809.1e1ff0cd@canb.auug.org.au>
 <aEeqkw670ZcuDdZO@wunner.de>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <aEeqkw670ZcuDdZO@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VXZL8VNQTnNs25yf3U5BfpXH-h6hYeHP
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=68484dd1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Ho3n10bA_UD04d3nvKkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: VXZL8VNQTnNs25yf3U5BfpXH-h6hYeHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEyMiBTYWx0ZWRfXygTe9hy6qu6o
 wZangisjdbK6sFJ1gB3EQbb3CdI3/Dt+TPWOez6h+Oj4Mbl9Whb8nYpvxYf9wCBByY81eI4Qyda
 XN25/tWxyqB5hw9xEr4tEXgW9F9im5lHkMIKomAhoYkuQLZJzUvEbL1x+nMZ43lPO3GJgXlGgX8
 0UYfRf2H3MZiwbeeWlyGeBzacCi/+fHbAZ2VuCi5wbR2rLppKaOkGPJEvf2htPvHyAJJSXkWxkI
 7GfE/Yvlbmz/cnV3z6z5nGvSYO6+QfXHjcncdod6+cxXM/VoiQ6THeZFzB5c+jNZVgRzUW3hiZr
 KWXkUkuhoK9n5Xhwvc5IkDUjYSaSbFFNPN7YJB9R1l1ob8h67tPNTUYYV2N5SrQkK1fIV0sS47y
 6JZs8sNJVAP6HxIfiBcYFLAPS7nWMDX8WKiEORniP/EMmL2HMYYSy0Re1Bd5pR1KAD9n2erJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100122
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

On 6/9/2025 9:46 PM, Lukas Wunner wrote:
> On Tue, Jun 10, 2025 at 12:48:09PM +1000, Stephen Rothwell wrote:
>> After merging the drm-misc tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/accel/qaic/qaic_ras.c: In function 'decode_ras_msg':
>> drivers/accel/qaic/qaic_ras.c:325:17: error: implicit declaration of function 'pci_printk'; did you mean 'pci_intx'? [-Wimplicit-function-declaration]
>>    325 |                 pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n",
>>        |                 ^~~~~~~~~~
>>        |                 pci_intx
>>
>> Caused by commit
>>
>>    c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
>>
>> interacting with commit
>>
>>    1c8a0ed2043c ("PCI: Remove unused pci_printk()")
>>
>> from Linus' tree (in v6.16-rc1).
>>
>> As a fix up patch would be a bit of a mess, I have used the drm-misc
>> tree from next-20250606 for today.
> 
> The simplest fix is to use dev_printk() and replace qdev->pdev with
> &qdev->pdev->dev.

Ick. I agree, this is the quick fix. I'll implement it and try to get 
-next unblocked ASAP.

> The PCI core already contains one occurrence of dev_printk() in
> drivers/pci/tlp.c (introduced this cycle - 82013ff394ea).
> 
> Additionally drivers/pci/aer.c goes so far as to define a custom
> aer_printk() for lack of a pci_printk().
> 
> drivers/pci/controller/dwc/pcie-tegra194.c contains further
> occurrences of dev_printk() which could use pci_printk() instead.
> 
> Those occurrences suggest that the removal of pci_printk() was
> perhaps uncalled for.
> 
> Thanks,
> 
> Lukas

