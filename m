Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6127BAB632
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 06:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137E410E264;
	Tue, 30 Sep 2025 04:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJhhCOqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB81010E264
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:40:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HOoj030548
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9otk/yGXgsUm0pXvg0F1/ZcIsa5wQIuaLE+2nOJ/oEw=; b=NJhhCOqZw8CRTxSA
 5ZJvcIEy8RSG5o4+4tRgPUI+Db6XpniPWM0DmJ5mv2cWDSduU4Do9/LQbo8pX3NV
 doJhS9/pVq+BH1cy7xNCiAgOpLze9Aquk1mTNuPvyazcYjQGlY7kk1MQ4WtHROP0
 1xkwlAnKIxsIuOLtn6/HhF11Bj8KhgcbdvFwDTljjc2wXp0CA8lXP9U7+6YQGnOj
 JVJ/569zFvQm1YtIeLiJxLl8An8OCHskF1JfrQUhB255au6HhPArm5VK9GofHTdg
 YhGq027steHn5jCQz/n5zqAgVuERLOD1f52o64LE6WUSaYm2gAoy2NERh9JrQzpc
 gG0NnA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdfe2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:40:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-268149e1c28so50807855ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 21:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759207238; x=1759812038;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9otk/yGXgsUm0pXvg0F1/ZcIsa5wQIuaLE+2nOJ/oEw=;
 b=PZ8mRQIIuf0rGtW6pbITeq1PlZ1hiZ5frLNHRBWi0J2LMuGLtAmPE86JYWqWoapmDH
 RmndVRlx+xo0jslzumf2AqiLqGIixxUa2wJaARev2zYsMyGfyejRyTIACrqJQJYSSbEd
 EvoT1rXbtyRCyF6pVAV/Txd8+EzXKi18jCIX+lFYuSph2r4IC7rRxS0r2J5NgzG15yDU
 SwCQVvBHc+wQ8mjZozC2QMgW2LsjoPusa9J8iMUqw7qXpsxXuoTJUX88GqE+0iT9j08c
 Y6hdsUadyd6yJdZkyAq3o84O04Ry13fbcO8otpnf7yqAEx7t6CODp89jhbuVtKuNWBDC
 tkRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAQev6LKyIgIFTPp7sfNT0XjzSvaDpjmjdTVF+0PtGL9wgjVbbEWwGZCfhzcIThjX9pURNRamTunA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfP5wE075g4kiyD21sfCdxdw+NjkXSaJl95BF4TyTL3y8eSNYW
 asFSj5sWuvRU+00DUDG7enDfmEZ39S3KpyIS81qdZuD4xZRYN3tQYtsUBOKlHrFDaecsNGMIDLH
 7JELJsemj5kv9KmjJ9KdjOj0lSCV7IqO/9thykK9WMtGUoOh+lRH/0ujdkFQk07+Coy/NqLc=
X-Gm-Gg: ASbGncuBvB04t2zJgcd7kfY+udk5msNBiDxUZlhLi/xu8aP1uSWohVvKLZinOC3c897
 v/V1eCb6qxgaixjz5+AqUf+eS9SRTdUchigVAEd7IhXUe8QcGDgYAcRaEPvV3uchzLlgiouS1EJ
 BIo+iU+Bf0L9cbci4ruRuYail3EuLrw0ckirf+YURDs15X5yJI25f62b5PItLvAXFGANFmTCAlX
 dwRsEgu1DMXnImkiUop9c+5JqlFw+51Ko0nXSsm7jPndQq23B8n9vcRfJtpZfd9spkUceP26Gbw
 yVCLXZ4DSXH0iw7oKwNErIs1nUycXg4kvYEzFyp4BkTV5JDizZTAwrSkVaK3bfz1I3qahDdSVv4
 j
X-Received: by 2002:a17:903:ac4:b0:28d:18d3:46cb with SMTP id
 d9443c01a7336-28d18d34807mr26815175ad.20.1759207238525; 
 Mon, 29 Sep 2025 21:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHurZVJdThhSMRhfXgQ+q0mqPgl7u6/CKCTRFKAXoWSFaDtn5ulaKgD9EWxKFZKgpufC6A6w==
X-Received: by 2002:a17:903:ac4:b0:28d:18d3:46cb with SMTP id
 d9443c01a7336-28d18d34807mr26814245ad.20.1759207238067; 
 Mon, 29 Sep 2025 21:40:38 -0700 (PDT)
Received: from [10.204.86.68] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed66d43b8sm146897755ad.9.2025.09.29.21.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 21:40:37 -0700 (PDT)
Message-ID: <37ac6311-bd88-4b8e-bf78-06fcdd8bdf6f@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 10:10:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] misc: fastrpc: Add support for new DSP IOVA formatting
To: Arnd Bergmann <arnd@arndb.de>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
 <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
 <969bdb49-0682-4345-98f7-523404bb4213@app.fastmail.com>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <969bdb49-0682-4345-98f7-523404bb4213@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wVtYxnViokfT-YQEQrRxIhXSyA41kLkz
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68db5f47 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=bqvQEXuXJtI6iJ33JrsA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: wVtYxnViokfT-YQEQrRxIhXSyA41kLkz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX7M/gLFXd6ryS
 w6f2KNqW9HAc5Zq3Bb2H6vbC7yF/rjxt91++hIHoL+/JoE3UosV7dJfEy3ZUA6BdlOJ1G4waZIe
 4qgW7HgFGI0oiFxxXLaeLcgq2ThY3X3sHmS9Pl9rPOI/F/8NRO4G3zv3Mu66m/FIYgwo5v+uw2V
 qFw7KQmOer8mKw0/LNdtqhzOfkdS9RhybOFlmd/phpvAauPd66rurGLdyLix+qIBzeVEzyNFPGt
 rVz8mpieWTkyn0LXlRJDbqqrF5x0lLHxzay8/a5S58mHOeAUWEeByPUvxTDQNLiqGwU0IuZ2Drz
 R0ycA49Kg6YqTOhRX+EXytWJaefSI3ynGulCfHpZoc4H5chDIBUiE1o1w9bLHtGA4WekzDorZAv
 d7PP490JQGjlPawLaaZq7h4Z5vl79g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
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



On 9/25/2025 11:54 AM, Arnd Bergmann wrote:
> On Thu, Sep 25, 2025, at 01:46, Jingyi Wang wrote:
> 
>>   	dma_free_coherent(buf->dev, buf->size, buf->virt,
>> -			  FASTRPC_PHYS(buf->phys));
>> +			  IOVA_TO_PHYS(buf->phys, sid_pos));
>>   	kfree(buf);
>>   }
> 
> I understand what you are doing, but the naming of the macros
> seems a bit confusing: dma_free_coherent() and the related
> functions are designed to take an IOVA argument, not a physical
> address, so calling IOVA_TO_PHYS() before passing the
> address sounds wrong. This is made worse by the naming
> of 'buf->phys' that is not a physical address at all
> but already transformed twice into a dma_addr_t and
> from there into a dma_addr+sid tuple.
> 
> Ideally the SID handling would be abstracted behind a custom
> dma_map_ops implementation that treats this as a custom
> iommu, but if the fastrpc device is the only user of this
> address format, I can understand you want to keep this as
> a local hack in this driver.
> 
> Can you try to come up with some better naming here, and
> replace the 'phys' bits with something that is more fitting
> for an iova/dma_addr_t?
>

I will improve the naming for better clarity:

- Replace buf->phys with buf->dma_addr throughout the code.
- Rename the macro IOVA_TO_PHYS() to something more appropriate, like 
IPA_TO_DMA_ADDR()
>       Arnd

Thanks,
Pallavi
