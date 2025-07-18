Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB357B0A8EF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE55710EA16;
	Fri, 18 Jul 2025 16:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/vBc69j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621EF10EA16
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:52:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IG9F8p020662
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i/jJS211K+91WfPtzNzKrjWRU80MmsvCM3rgFx21dfM=; b=P/vBc69jyQvb8sow
 lV/WOYxFLnnzhJsAqu/H721IYea+wKWldZ4xEYW92WXsZSktINoRbl0ftsHf3RFw
 x/1FLPFMwXwG9xAzrRr1gn/M+wzs6rR9jrpm7PFqfcpCe061m5PGDozIRfvr1fSV
 x5Ip0dkql6htf1/vbpv662dOR36r0VSNUp2XahM1HQuwQknuXgRAi3EeWFMXbo57
 ZmW4wtfDwMEKlSGkHEK+X61BYZv3NI767se+yb0V19LFavGHalln4qC7+6fHfQWf
 oi/SngOP17bMOcXoOE/IKlfcsFXN9g9wlPOWUOZyhdmB/pJowmXiJOiwODcz6jUd
 +PHV0Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpqdqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:51:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b38fc4d8dbaso2448397a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752857519; x=1753462319;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i/jJS211K+91WfPtzNzKrjWRU80MmsvCM3rgFx21dfM=;
 b=vHLzYU3MExmEeB0PDbk7N5//1z8VodrB9Ri46wFWJ9fVwDTFTOYrfMhS65EPGkddq4
 q9uQ4hgeZKL7HEXRmsqMPXHfcmTj/TC4m9M1Sfi7rap0smq5tOP5GHOUqwhDIfKpCmxA
 4YN2UtgkaKJMzMamHpCoeT+gHhcTkflyNvi4f0yIdriaB4UgdingbE+7MI6JEiAfLRiC
 ojwqVKOrdOgdnKrsDLNJxdGx05Si6Sqte9V/33EMd38p0geHL2qM6VeM+973lQRkqQjj
 FbrZhpXv4GqFh7M2kVHBpi7D9q946qaDrN7zKHmuvRi+d5IpaAYAS+9gBhCBn1r8LHLF
 l0cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZZgHwZWymd2dXnhTdy8xPU1o/GntuzL/uGOBEDdYIgglnzKKSUDzOuPLtiIuJ76yxNqI/S7DG0yk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfZKHxJf7sufaE5G1ceYsCOUdAkUlqBOzZccZW6aO26R6VeIPH
 sNU3lmHJEIPpboKQP9Z8vNymkRc2AMwy0wNGxqCZp007xsiHlc+IO5lkMZSGbDq6NgqCLHKoowH
 pN8OAxs/dX3RnggAprFo3VnxSkdXhJr7y/VFlRnY2uiVaD9182ynl1kPY7XqtxCKObNFp7KY=
X-Gm-Gg: ASbGncu9X/BXx1EOzTKtjoTf/Tn1itAdthE3UMTJFdKGK1emoWiRaJHCkC0TNvs+HsT
 Ly/f5myGIhkBaa9BRdtdxbJKBcvn+WtHoMT8FHm9K/cRu+E0JviTsuJ9cLgzm3xfCa86TUoQ+bl
 Of/z0HRPWqgWdyyQ/EYTZrfulyZIKcu+8HA7IGp5c26RlsXwVLDB0rHo8jE7h/tvQmCoMwnc/FE
 2YKo5Wuc+Jun5wo6HDKvSyZY4rWmkMjaI2jfPN7xyzPiShBU3pjrGSPkfWruTNhCSTgjtTXV1is
 +2wIgLJLZH5j39WR4zSmMOr4Ew7XPEAURN0uDuYgaJIWaSjcNSAsUidqpxBDvaw+mpo+jFanbpJ
 YkG+ZJQ8tfJ/QJA==
X-Received: by 2002:a17:90a:ec8b:b0:312:1ac5:c7c7 with SMTP id
 98e67ed59e1d1-31c9f3993d8mr17038308a91.2.1752857518918; 
 Fri, 18 Jul 2025 09:51:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9NIA98X5HRDDVuwcioD+0TFYXDcZBMvtr4Luz9HPLr/CXztRxjI3u8ZOFya8id3YrAIy6yQ==
X-Received: by 2002:a17:90a:ec8b:b0:312:1ac5:c7c7 with SMTP id
 98e67ed59e1d1-31c9f3993d8mr17038273a91.2.1752857518544; 
 Fri, 18 Jul 2025 09:51:58 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cb6ad7257sm3078809a91.42.2025.07.18.09.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 09:51:58 -0700 (PDT)
Message-ID: <2de96bf3-0c63-4db9-b581-f011bc1446c2@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 10:51:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] drm: move drm based debugfs funcs to drm_debugfs.c
To: Sunil Khatri <sunil.khatri@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
 linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20250704075548.1549849-1-sunil.khatri@amd.com>
 <20250704075548.1549849-2-sunil.khatri@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250704075548.1549849-2-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzMyBTYWx0ZWRfXw748ycqci8i1
 Uvu3OuiHMWyXk91CgRQxyoAYpi1RZZKCS14tH8hVf5vWZBfxlKCBvSdxHRNJqlC7+VheGA2TeGL
 ewTzwt2aXXKQV1quDDtKieXqBscYJ2AXdnnoJ7jgMn1ImdM3yWK9AaZzv4upno74AtBtzbW67ho
 aXSllFeznGepiXo/sLqxqW7Pi2On8Is/cxzYARvGvHCz/2KoQuWOeLhzo+1k/DYeUKi4dlN+emQ
 dt3ldNYDxu4JhOMGCyBr7qlAUZhaYh85jHkeNmJFc9O2QNQ5y04IzPI6GP0T2dKHljLloBVh/Ch
 Vh5qobXmGITN663FQ/h8LTHFm/TXbzOtvkrCpxrU9nz6A61Ta7XfBCT6xsDEIKJdtv1ZmfupJrH
 8Ch59i/aq31RS/h53ujAKcFYWkDMs28CDGIkWLzWl2C4OiyaAT/JF3nD262+jSAVL7PqL7hI
X-Proofpoint-GUID: e2MY0YHenuSyEaSoaWBRZc3m72e_FRSt
X-Proofpoint-ORIG-GUID: e2MY0YHenuSyEaSoaWBRZc3m72e_FRSt
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687a7baf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8
 a=qFjxPv6tQ-BECiE8w1cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=772 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180133
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

On 7/4/2025 1:55 AM, Sunil Khatri wrote:
> Requirement is to create per client-id based directories to
> hold key debugging information and for that access to
> root debugfs dentry is need which is not in one place
> and that information cannot be stored in drm_device.
> 
> Move the debugfs functionality from drm_drv.c and drm_accel.c
> to drm_debugfs.c This enables debugfs root node reference
> directly drm_debugfs.c and hence enable to create per client-id
> directory.
> 
> v8: Create drm_accel dentry only if it's config is enabled (Jeff, Hugo)
> v8: Merge drm_drv and drm_accel debugfs patches (Koenig, Christian)
> 
> v10: Since we moved drm_debugfs_root, hence to handle drm bridge
> debugfs add a new function which call drm_bridge_debugfs_params where
> drm_debugfs_root is accessible.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

 From the Accel perspective, this seems ok.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
