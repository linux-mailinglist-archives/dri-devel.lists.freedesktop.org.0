Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8C9AB437B
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7C210E48F;
	Mon, 12 May 2025 18:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxlVfcyi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3277510E48F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:34:56 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CABnVt016074
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z/fKDyk+1NUrhAEQiirhFI4X0w+Ip6zFM/5bjbQI4wQ=; b=DxlVfcyibTphmLpq
 ipPx6oIcfhLXP0aSu22MgtSTUVY9aRMI4mosUkpt5LjgHIIVtCzrR20UzteAG05L
 2f7oauNnPQQlH+iIOx6NVqGilAJSkwIlCxZiCnr6nmgEpXuQSHCNPc46xOIIa44L
 +xEYyhCVOURLZ0m1X+YTQhUs4iuweJ2U8km4d2uGk6reW715VQdQ2RSo6gXbYCKq
 RG+YQvhVsu+chswppWTH4vo8hYHzc4ez47c3uQu6iIRKuslDmutwm0uWwD1hnipT
 hwAGwNHOPkhv+gZ4Zf0wHUtnOLn0Yf3Ib1SXEWfCoF9lhFSqLOCBufzRJk1MftDm
 9/2izA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hx4k5amt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:34:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-22e3abea7e8so50583225ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074892; x=1747679692;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z/fKDyk+1NUrhAEQiirhFI4X0w+Ip6zFM/5bjbQI4wQ=;
 b=Zvnd6C8/21MpLe3gmDpetlmEozANlRuaGRkxtMeBkSXvd7HFMMNFhvlvVUPIpcEa/e
 iYaoyfvT0lNMFc5wuLlon9DbyEDA1x/jLscC2HAyrwQqu8oXPZbp0uttZxcxf6OmWRz+
 +z2anALKJZP0RW+KbZyvrVhh2pk56tevrjLugq3w3JHz6dztHOc6s773sQM4WIkYx94G
 aSKhjLdC0XUnmqD1v3gHa0BY4yQmY9DQB3skB5tDfyzZdh1QSbGfOtpZZ46wwfNCjOga
 b/WhmzmcUBraVxfUAk4cdYWIONoIY86Ss1sm4pPhnA6EbdIbreGOl504XPchwttT2UhY
 9v3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT+m93H5CJWMUyBAteAWswK2I+xzsQw7f2nQ3NbZf/u6I3iFryZ9NFq2nbEtDbJsCuHpNYpYwK1ZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJp7vj1Kd+DpL+EvlqMIWyjSMdShUvV0fm1y0OGvY4k+3tp2SB
 tEYr9PWJnYQEqa9iN41bmkHJwI7chYMsWcnnyAMPKxXqI1O10W7lD3MYcIzaPhosgzC/wPUa/G/
 EyXhHOjWBWQ74uvBJP8XsMDefvEoA560UeKplpod40oPxhjURiipOUeiogr+f3Z4CszE=
X-Gm-Gg: ASbGncu+bbuz65Y6zFcRuvH7hQ/CPcc8KhALW3pr6+u6bQQHMHnNgvPilZaZALGq+6A
 BU8LC+3ItRiE/Ik6TUCNTF2wTFV3X1qUshD8kKJxU/Gi6iVUkE35thu8saQKFOp4bkQ9vGXVnWt
 Oe5ORs/t2uORoj9HOwG2Eh+blUuwKb7aVfRg36KHZ4JCmFzZDMeHkgYmDnP6uG2D7hFX+UCE7Yo
 5UtoCoGKWCgYuWaJQHzmEneF8dOZzZ51TtGta5sh7sMdA6eHS021uDoHBRdMZV4tu4frJe3D/3B
 XkaK+o4EJqDSdKWRCpul00G6nmC3osH6AYqQkJAuPjwJcs7/9nCf7V2PJ+prAQ==
X-Received: by 2002:a05:6a20:6a15:b0:1f5:80eb:846d with SMTP id
 adf61e73a8af0-215abb03109mr18896282637.10.1747074892228; 
 Mon, 12 May 2025 11:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl1Huc+lrMfWf4OQM+9/66B5hu2RcVCrULPeB+GGuAdM5kY6UYxXBIPpfmvONXzHu3iiBlIQ==
X-Received: by 2002:a05:6a20:6a15:b0:1f5:80eb:846d with SMTP id
 adf61e73a8af0-215abb03109mr18896251637.10.1747074891776; 
 Mon, 12 May 2025 11:34:51 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30ad4fe23b2sm9208527a91.37.2025.05.12.11.34.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 11:34:51 -0700 (PDT)
Message-ID: <6b87e6c8-33b6-4476-bc8c-934d93bc1f86@oss.qualcomm.com>
Date: Mon, 12 May 2025 12:34:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Improve buffer object logging
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: lizhi.hou@amd.com, stable@vger.kernel.org
References: <20250506091303.262034-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250506091303.262034-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ReqQC0tv c=1 sm=1 tr=0 ts=68223f4d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=iKTJfPOwawMBF07lcpsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: kmcH-UhPieUCnUszqQpCRpWkkX3_mx2R
X-Proofpoint-ORIG-GUID: kmcH-UhPieUCnUszqQpCRpWkkX3_mx2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE5MSBTYWx0ZWRfX/EvqzBU/LmHB
 QA2mG8H7nFSUXOzVuoyx7aM4yhlt8qJtJjjaacBejRP9eBcg+AGtQgkbeyl/+tOnuVrFYZgpOoX
 DNcg8Oj64ai8HDeyehaX7LA+eL/EJW1Wvseb9EEWrcrO+p9R7XZp8PYM0ObfLSbZCLMHO0fin26
 DZI5FSEiPDO7CEFx4IzJRZYILaMcRCfzzRuIUiS4qUwTOg8c16AiD2Z7CEOL0qCal9vSz0xHvFL
 bTtm8A+QaVkEwfjFdMfQGHB+NgWo1K+KyUglPcBEOD51PiRJFELsNuxm3XHW4dwoMnGAvgINZHR
 o9j/aET2UO1zig7nAeI1bLOyZPhWyIdrSjCK9PiyIeIua/SkNlLQ/wy0wD6bWZbrLMTN8sGLjLo
 U6Zi5XFS5VEyjjNWbFU2yF/6n/9WKg0smXjkwbZjhGK61aLiB0/GdWDgN1mltfPa/TDP8oX+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120191
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

On 5/6/2025 3:13 AM, Jacek Lawrynowicz wrote:
> - Fix missing alloc log when drm_gem_handle_create() fails in
>    drm_vma_node_allow() and open callback is not called
> - Add ivpu_bo->ctx_id that enables to log the actual context
>    id instead of using 0 as default
> - Add couple WARNs and errors so we can catch more memory
>    corruption issues
> 
> Fixes: 37dee2a2f433 ("accel/ivpu: Improve buffer object debug logs")
> Cc: <stable@vger.kernel.org> # v6.8+
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
