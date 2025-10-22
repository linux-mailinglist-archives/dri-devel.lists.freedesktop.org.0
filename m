Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31821BFC9BA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6992810E7C6;
	Wed, 22 Oct 2025 14:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7SezIqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312E510E7D0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:43:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAQQvw027450
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +VNIBqXRgcjhXbgHMkSA9HBHXvFnvRAXiqT9puj745A=; b=T7SezIqp1B2o/Ttx
 PMVix5I8DW/uSAvKCSvzavLoDn0Q7MMGXLaZRa7yXAjwR19vWk/C8kzCEZ+NNUTP
 YQB3Woxl7lfOT5mQAQQcoEQarCuieIpNt6U/gc9Oe0YKM4tz9cILvF6ymqip9GJP
 CsCB2oCDqiJGRWb50manu4SKIDuT7rB31bhBHcND2cFMsmPHP7QB3UU4HuZ4qlyh
 IekABV8Hm+pQeJtxuTrSFEM/ycNxpq2XbxzD3Ei4UCSyhRU1JFFN/XeGVgGjtAMl
 C2raH/ttZeP8iIZjQv4u/gwnWlgwnoXVP49IpjbQy2l8INe/k8uv2hC+gIIl4Kuo
 RruyHw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j4wsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:43:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b6ce1b57b9cso504336a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761144184; x=1761748984;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+VNIBqXRgcjhXbgHMkSA9HBHXvFnvRAXiqT9puj745A=;
 b=OkjjVOR3kNvzqMJoEyQahAkLkeevtmo2gsxeSrs4Z3tmd1EqH7HtkbibVnM+b+igIE
 SkXSsAaq77UJnUns/v232JTXvhhNN72myKehKjlbsKvEw7zqsHjnkGY30mWBl9zj0Tln
 BnjBBN5NMNsyt9mxXrOK/l0VfqfdJ8yUrBNbPduSI8a1fuPhhqT7TaAUS+J2o5ceMEme
 +hwAGDYO95ouFxNRfGeLxbIePNDKcrq9VHPX0woQZERzJCgIOt3NhnsGVsBm0EImmnMo
 HQZGhGmWVU2uH1zubkc+FZ7ti4ltVDXqOFiraSyh0+i1iDjDaq8mvwDtq9xTX1vAV7M6
 +wgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmxP6Hy7YpGVQpP6NN8FCbRgz54eTYgfiA9Aaf53x4GjR4qwgliOlCDvWmrEl3WzDQJdGWeFPj0sA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPO4PRl/g9Vh+Sp8VtILa7I9EBgiPhOZy2kpIydz4SPaLR5naf
 KoMKigXUAjfOJTLc91oNO/FYxaQ4lvfkI/1I5ja8vqP33VK7boHBUK6i71tjAIti9E+tgDLIzby
 HRSOpwq+bU/NunqHiqvNDLqF+RVDitHZPmVBFO9ItPyHumrcX6acZuf4Emzfw2tshXzIo40c=
X-Gm-Gg: ASbGncuhnFBuXo3tNODLo2DQsP1/8PahKWognz5g+TzGu05+t6lh7kPv1KCgn2v81nY
 k4thKAYWRa3yYoODv1FgUw1XsTPxzBbzv2EkCgdwpHs8fveJYTsv0EdYcd3OX4/McQHZsIlATC1
 25CABUJciAP85IcEu3ovXqJZAgg9+Aq4tQe2Xiq573zGBpabV2pyxreZdZMqUVAT+aTXXZ5AwMW
 yNJcGeWdNVjrYlh2fnCDI0//oTGatubGsnk86HHifuijJGkeoE3pUdXkDAPMZDZhUXtbiMKV2VS
 bvsz5QHzrr6OIR6i6w+V78o4thI1JokMTwUPmTJWhqLOa7doH7WagXuzAbCjY5cHLetsgpjU452
 QqzUs+0FunUxIIh2qKUt3BkPNdtaL37Fm2mxHTfcFhAPdUxcxg4wZ
X-Received: by 2002:a05:6a20:394c:b0:2fa:516e:26ca with SMTP id
 adf61e73a8af0-334a85ef4b4mr28709353637.39.1761144183845; 
 Wed, 22 Oct 2025 07:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP+Aplf4L3V4dNkRPGcrtEHRxUKdv1Ih4cArfvPipJFZ9qg4LUG5ktr6ZZ6vGgMKwOn4aVPQ==
X-Received: by 2002:a05:6a20:394c:b0:2fa:516e:26ca with SMTP id
 adf61e73a8af0-334a85ef4b4mr28709294637.39.1761144183206; 
 Wed, 22 Oct 2025 07:43:03 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6cdafadb8dsm2704297a12.1.2025.10.22.07.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 07:43:02 -0700 (PDT)
Message-ID: <1f024aa7-3daa-4e2a-8110-e1ac72817dfe@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 08:43:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Add support for Nova Lake's NPU
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, karol.wachowski@linux.intel.com, lizhi.hou@amd.com
References: <20251022105348.2237273-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251022105348.2237273-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX818rCRKr/NlV
 kW8ThieFWhpRbUYSr3icZoFP35iFxRSdMa83R7skTpe9Viv3Aq3FZz9bqr5ItW013v3pLGHJR+L
 3EADrWp6O9Ru3gZeoDiAdT22FAMWDSwBBGSM9RoCMP505gAluQfkin5M3WvCxtf5rkfFjAuQ7BW
 lQvZ3O9WiJlwlXMR7r7OzEuCe9lEe2Urxzlli7qWzbkUBhHZjzfXidCNhJnR50T8QdSHgoxaly1
 73s0h1zBKxEZKJxMI6XwFpDKlyKGuhpvSlf+yMBR08T7QshJPnjoVuezCBkECAL67sIUUb2zNIP
 TyAdc9Jnoi3U0UTVplLVQGTBAVvW737TpD4qFfOXnhvMF1fsDf0MsHp/qjbIwrpL9/uMjxZzIVY
 VC650a09xqKHDHsydQB0EFF+xmZAKA==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f8ed79 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VVJSyEthBQzU0sCDRvsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Zkhl4jQ8zqbTEZiZ7MYKUkkbTvbrLiPm
X-Proofpoint-ORIG-GUID: Zkhl4jQ8zqbTEZiZ7MYKUkkbTvbrLiPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

On 10/22/2025 4:53 AM, Maciej Falkowski wrote:
> Add support for NPU6 generation that will be present on Nova Lake CPUs.
> As with previous generations, it maintains compatibility
> so no bigger functional changes apart from removing
> deprecated call to soc_cpu_drive() function.
> 
> Quiescing TOP_MMIO in SOC_CPU_NOC as part of boot procedure is no longer
> needed starting from 60XX. Remove soc_cpu_drive() call from NPU6 onward.
> 
> The VPU_CPU_NOC_QREQN, VPU_CPU_NOC_QACCEPTN, and VPU_CPU_NOC_QDENY
> registers are deprecated and non-functional on 60XX. They will be
> removed in future generations.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
