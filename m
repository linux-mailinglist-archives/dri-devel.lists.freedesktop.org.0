Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4D1CAC46A
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 08:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE70410E110;
	Mon,  8 Dec 2025 07:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwASOPEI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0YWqtN/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26B410E110
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 07:08:36 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B7Ke1Et3212406
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Dec 2025 07:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NrCzWgsdVcK5TFuDMmWYSL7yv1kb6wtdUuJ1kXKqm/g=; b=pwASOPEIrrF3p0aX
 5ITlcVDt7cXftYiKmAp2paITDAGHdirBQAsnPbpVBbY/AEPqJv9+lZQmndBQ2ku2
 QwpeJ8JND29WMnkDwz5dx+FZKWBjzNYXhC1MPexsdM6IVnFTN+zdz5r5KQcyFZ27
 ysJZsbNYwR4rPzvYY35Tu4puJlCdoghJGXoXQVsG28Z9ZRmxtA17yxgCqDXmSfHW
 0I1sEL5KG8/ihYEBMKeV0CD0UtHv457CuPZJV8agkDbFavDARVT47WW5XL2MbIHe
 avSUFDpr5CwsId2sEYnxqxEc0Lzc5v5Gc3VjE7vlk3EAS9zSdh1lS5dBHgyFar4U
 Ks3DOw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av9upv8fe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 07:08:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7b9c91b814cso11114721b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Dec 2025 23:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765177715; x=1765782515;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NrCzWgsdVcK5TFuDMmWYSL7yv1kb6wtdUuJ1kXKqm/g=;
 b=L0YWqtN/Id8IKLfW1PeLD590dIb+B9SM/2+BnkGOLe5h/q2V7OXOUQQHvSR5QGoKYr
 B6ivuyNYYJTOcvdpb8hwLfKfpymVZgpL/y4RZ9a7NzfRerr/EbMeVa8wCI7naD/Ye40y
 CLdkA93AdOVlN28N/wPXZ1LwWz8wD0mC8h8PxVtb1JtclL2T7/qAPqN35rRKbeQpGAwn
 y4gVYKf/oUz+RG7RM3AKAUanTIH/vyEmDcwds2rzx6fFKznfwSDbBGJbIhvA+/fHqmva
 fy/ol9pdkcf224FsT8lH5sW/tjF/ZzOgjFtz8prhTHDX/I9OqpGFIxn+5cM4gPjWA7Bx
 +mOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765177715; x=1765782515;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NrCzWgsdVcK5TFuDMmWYSL7yv1kb6wtdUuJ1kXKqm/g=;
 b=cyvvGlVxLEoC7u18fY9KTY5oCkT+W+KKHszY4O+o1XXSM4ve503QGSlSM1VWwiXP2E
 z0+yJQ0zzss1pl3EWR1VumXDGM+kesYAKpavfVLGbO/iZPqpqTKRJ965IA1wa01QOsVS
 mqsgoU6GInqpqFJh1X0ZuUkpMcEYK0QvLqINWMY2YfCNr5JZawZdMjvLkL6qhrMwzIXp
 PDlmeAyhOMJlc7ElwKcSLQNAUDwzvssKxeJ/9K68R0fpg5Vc9XBfLWysLcMg+NTMSMUR
 8Vih9kJRkA6mYx32Z5PVRdtsBRSBOzdHisV9FzsQtzXuOkFWuSYMOR2AJWEf0oEcdKqg
 6vew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKtFAAEV2nMXu5aASd98wGolinu2SCIandKnCPMLyPRLY5f3+tyH247B5AAhDpDfRWpRpJFqYL/Ww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQJ7PkI9QUNay2v/wDqo0yRT3EuyFT+nuQA6pWAHotdw6N4nCJ
 drAqQ2FOznGwg57/bSybjGi8KNjxKvVFMW4gEjZsnAoMbAdtyduwdo26GjQNAF+cnPMyOHHAjvc
 e69Iq1q6s2wQoGIhI8U1UgGQAlmigrDPfpVpDrNEoCdGmPQfQCFFbU7p1HlQTYtw/YSUlD+U=
X-Gm-Gg: ASbGncu0iOnA9chAWR+Niy4qwJf38r9lJkNSNFT5UZiuYA48XZN5/UZrnTYt7/WgUTG
 AJpU642T/EwzB8w56An1ubw0s0LILWFdEctrr9ZtVjjTjdxd64H6CQEUE17tYvXEXzKKI0Dx6T/
 10fXhpe0XWptiF/trOwHSpmzzapgtffpiyh7wT6deWc6FPTIC4Rfaxbgk2jEtum94ERKvRQ54Zg
 SdtLdMh+NAaFKd52tz50GC2eAGQRTErI4+h0EpOLBiFCbrJi4s74Oc0oH5czWDYgMbvwY0tjFVu
 HmGfKQmMnUuMddhtt5YQALSXiQUA8hNeJtuXG0bQfTLphPwZIint9JP9Y0mGBpAetcLHrjuK5TJ
 n6LAVNRtoBNa8KBW0+VIUD6nRrrD+qvJFv9ok63dZ
X-Received: by 2002:a05:6a00:1a90:b0:7ad:386e:3b6d with SMTP id
 d2e1a72fcca58-7e8c3628762mr5743425b3a.21.1765177714719; 
 Sun, 07 Dec 2025 23:08:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGWRBD4V8JHyA/GcqxpCyzDbxDkWZj0rh1476foDQID2Nz2CNPRb5T/1mOwu9CQt2+VHqTTw==
X-Received: by 2002:a05:6a00:1a90:b0:7ad:386e:3b6d with SMTP id
 d2e1a72fcca58-7e8c3628762mr5743404b3a.21.1765177714267; 
 Sun, 07 Dec 2025 23:08:34 -0800 (PST)
Received: from [10.204.86.50] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7e2adc5c17esm11991962b3a.34.2025.12.07.23.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Dec 2025 23:08:33 -0800 (PST)
Message-ID: <2c7d183d-1e1d-4789-b799-5b0f02c4921c@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 12:38:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-3-kumari.pallavi@oss.qualcomm.com>
 <xefaz7ljox5drnf7gl4aymwp3cygc4fhxb3mksarqpjxm3ozrh@co4e4okm6hzf>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <xefaz7ljox5drnf7gl4aymwp3cygc4fhxb3mksarqpjxm3ozrh@co4e4okm6hzf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZsBUd2hVNkMsfGuhsGNGQyNHPq4RI8EO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA1OSBTYWx0ZWRfX2ukTeEosObs1
 NaLLU2hRqqaKIWmD5zUyDY8dHl49nJ+0Xyj8AIbSkQ7LmQWNV9UqUNByJSAhh5nbX9LDnMcIFCp
 k5wEo/xRbHVDvMVufkzCY/fiwcTAjfr3NfDX0Npn2Eyj2C5ewiULUb8aJERWkRBzCzRrH3SeUU5
 ZGufcUGHPjca2ktpir3645rlz/NYkhUzmMQ5Ej2LF2rsmDVDi6uTgcyfql56NPuYhMfKCeux6x8
 abVvVaDWHVlzhHs84mb0Yn/Sz1r+BdYYHSMGAD+mo/U9IR5fqyyMd/7OzpLg9C5/Cgt0SNW9QnP
 wqZce0Hu9+spNnsCseYDP+wn8VGTFu5vsxOJDc4WZrDZZ2yD4Kb6nxuQYog7eSjEUZ7DWi/Oeh2
 iHCadDCf3OkOZJGQH5dxLnW7t5hl9Q==
X-Proofpoint-ORIG-GUID: ZsBUd2hVNkMsfGuhsGNGQyNHPq4RI8EO
X-Authority-Analysis: v=2.4 cv=NsHcssdJ c=1 sm=1 tr=0 ts=69367973 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TGxxbsFBFhonqYEHZgkA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080059
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



On 12/6/2025 7:56 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 02, 2025 at 11:36:26AM +0530, Kumari Pallavi wrote:
>> Update all references of buf->phys and map->phys to buf->dma_addr and
>> map->dma_addr to accurately represent that these fields store DMA
>> addresses, not physical addresses. This change improves code clarity
>> and aligns with kernel conventions for dma_addr_t usage.
> 
> Please _start_ by describing the problem or the issue the patch is
> trying to solve.
> 

ACK

Thanks,
Pallavi

>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 77 ++++++++++++++++++++++--------------------
>>   1 file changed, 41 insertions(+), 36 deletions(-)
>>
> 

