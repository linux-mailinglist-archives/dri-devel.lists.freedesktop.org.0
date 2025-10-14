Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71425BDA11A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 16:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC2A10E628;
	Tue, 14 Oct 2025 14:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPdTp7s7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE1B10E628
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:39:57 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87K4g019963
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ULnRTYSsVts9v3XcRMWD8601G0J1/kMUydXq5rNhZ2s=; b=mPdTp7s7jUkcxREW
 2yV9S0ULJJ1B7//7aMu26+unJim0Zmn7WXihxn4f/Pc8iqekh6msnnepo6S9Darl
 uzwRRxk5RGTVIAPyW/qMGE1WyiqQY5/8eLvMbnPOOLZpTaQGyySHelO2uflfsGT8
 Ii/sXbOSp1mcE0mDDKfeYn0dz4xiEscYBDvtR4HszG0clzr1zQRDhDlvJA84TMJr
 uucbDeJqNSS14pYibCsyqdMeiJE1SRwpi/cqSY9aD+tLmuhjKunxccMLnwYhL+iS
 tfC7rcRJXCCV20taployI7Cbauw6xJcyYrHP2tvNsqTn41zUhiD45QN5zXx2GgQZ
 BK3pvQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c0tbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:39:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-27eca7298d9so241774265ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760452796; x=1761057596;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ULnRTYSsVts9v3XcRMWD8601G0J1/kMUydXq5rNhZ2s=;
 b=Bh1jaf/a5ecS0HYbZ5TftI4sEmXGZvnpvHctY2Nv8DD88vmd4ir5SH6cythJb/iqJ+
 McDDl2RoHb/7vb9u+krQgWo+J3u6ZoeEVkmOor1pBWOe2jAu2BZ3pUSwXID3vopzDrpx
 F1xIACPBKeeueDgRVSBukqDn/woFI5oxe1jUKoyc7eAGWSMVkeNYl7Mjyn6m0P6JT6VU
 2IqdvkqQw0J6mTIJ82ASd4gjW+Eh6nVpRo6j7ndPZPStokT9S7G4Yv57gsPrpK9vjfhY
 XKC3pSZvHJmz9K9aOQnk57o2MnYOuIvGKcetS993aPi2m1+lcEeUvvxCymY+snaMI/4Z
 9+mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUePiGsse+LfHeGwtG99XIVpj7hmWyqv4C9ABpGnsbkkicTc4U9pT2gSWRduC6cu+22DCtPye4Wqew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx2lbzI2WLddce+FZquDFcRnYfVHGtgKyJxlWn/NXULIxCiADo
 Qs+mjs7UnMZsQn7iGb/1B16s22KEj4ewekDDY7sFOpe176pDgBXBsCTBC/TZizMskksxLLH9V3y
 c60GbpJmPdmfA1y9muwTlCoxZIJEo0Td+PugrlUEO84NpKVqo0nNKGsrJ3bZ1FieP3XV9mAA=
X-Gm-Gg: ASbGncu0IjsicfkieTMKBFu3FGip5IFoSYTHUl7p3XnMYiE/HE7OtWmsOV8klevUs1N
 6MdaAtu2neibZrMkfy5s1o5nKssYgNYV+gCpvab/8j3LbQdXxmwFljDV4DNY/isbq2Cmk/ggjeH
 xKJISqUcm5+QJNle0DvLwLcm4YhiylTso9NRhOjmLWvJw6vlyC54IAlf2w/ZN1OOJEAXYG9w0kN
 onCg11sw2j1NOTFzR/rfdt/J7Qa93hLK1m3bgoV28ZyrvmTIAsDdkInCNg13JFvTrAsubzo7UH+
 lmOFIuDJODC9PpN/Kvj6TfUpwSyENro6nvXL8knOt4rYJYw6zf1szaHRRsimbiZoDygFVPIxLlH
 w2pWMIEoDBjGWLQ==
X-Received: by 2002:a17:903:2408:b0:261:cb35:5a08 with SMTP id
 d9443c01a7336-290273ecaebmr341067945ad.38.1760452796418; 
 Tue, 14 Oct 2025 07:39:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKq9vxO93TlLeulIeZOeTM879NjUW1wZDc1Bri7Rr0e2MzZj/xLBlQf2YeUS6W3UYIhS92Qg==
X-Received: by 2002:a17:903:2408:b0:261:cb35:5a08 with SMTP id
 d9443c01a7336-290273ecaebmr341063155ad.38.1760452789527; 
 Tue, 14 Oct 2025 07:39:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f95ecbsm161292495ad.130.2025.10.14.07.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 07:39:49 -0700 (PDT)
Message-ID: <ec7426b7-c6a5-4a5a-b6a3-abe75fefbb00@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 08:39:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use kvcalloc() for slice requests allocation
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4psl86WRbaBAKiSgq2pl3xVEJUoeUkW8
X-Proofpoint-ORIG-GUID: 4psl86WRbaBAKiSgq2pl3xVEJUoeUkW8
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ee60bd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=57TA5eHKvZbov0TpALUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX9Pw9xvmOYMF/
 Sjdqn5PVB9hqwknAtNV/5iv19MNFqnszUl+PlHsFcmEmPJrzxHxsWKU+TPaZr1keHQWNtcqGqmU
 AY3YMWzXeSrkq5aA/J5eXd5o8gdkypaLQEqtbrkcE6OzQ+wTGWqv1sgIjkYTdz5MM5Tkzs+3XgT
 tU0KfjvJdT9XAh2vqwsE7iqXGrxe3bdocNjGKvC+GG5XlkNbNKgmYZ3Ih86rruQaOxRcjHwQBo4
 r6dAAVuKr26J0r6yBkw9i9hTdKKX/+4DaPzWbZP1igvmn9xUtxbKpIdnijxWMKfRqmC9DN/Q3zb
 PW7F5DIJskXJ0Ef4zutA4m5p/4eMH4PM9MtH4hogwpXLf9okN8ctJgsx1C646krUWwo/UYuhDCV
 B7TN7RYUXAimbDO7oj0qeTvWmcg/Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
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

On 10/7/2025 6:18 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> When a BO is created, qaic will use the page allocator to request the
> memory chunks that the BO will be composed of in-memory. The number of
> chunks increases when memory is segmented. For example, a 16MB BO can
> be composed of four 4MB chunks or 4096 4KB chunks.
> 
> A BO is then sliced into a single or multiple slices to be transferred
> to the device on the DBC's xfer queue. For that to happen, the slice
> needs to encode its memory chunks into DBC requests and keep track of
> them in an array, which is allocated using kcalloc(). Knowing that the
> BO might be very fragmented, this array can grow so large that the
> allocation may fail to find contiguous memory for it.
> 
> Replace kcalloc() with kvcalloc() to allocate the DBC requests array
> for a slice.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff
