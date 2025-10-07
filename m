Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDF5BC1ECF
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5BB10E6DC;
	Tue,  7 Oct 2025 15:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4f/MGlV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA6110E6DC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:24:59 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET5us017434
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 15:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XcSSDSVb5D1JDm2vjIOTSOnm3O/zL8MK741maSSDVsc=; b=n4f/MGlV3i6pFs4F
 Yx1VCC3Ur/urkVYfX3GjW8yGZHgGAXtvZsNGa4O+SBFtcae7z1Arzt/pH2gZGHIt
 lhmrivLpzOrAQprqMXYOZ2Xk1SkYMRsn0s06BMzqQKsTl9eHixG9zVF9xQ44gSBp
 vHSUDDCmoeBm9iaB4Bg1SEdCDj9UKHC6F/f7ZcCyvqvAlZL5+Y/TMxSkWG5Ghq+L
 5khHEx8NFtN9L2Je0SRuKk4LD0PCE9+d6KbLbravLCVbWlljZ3pYckXntVBws3ql
 JrzqQFg8wCalx2d83qj6mDYtPgmsAtRW5SIuKaUGUj/XhwJwHn34B5DlH8Bd8bUU
 st2xMw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn80m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 15:24:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2697410e7f9so130231985ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 08:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759850697; x=1760455497;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XcSSDSVb5D1JDm2vjIOTSOnm3O/zL8MK741maSSDVsc=;
 b=EwV271gz+TMmpFwLAl81ThLiY4rTp+ZNezfNMQHUJsCpEcTXmawmv+N03k1nrv9RnV
 I792VdZmVpVkEdgEG1CjW0o01f4bmpf90kaK8KUH4PlwRbENFTUeeNlYFJ9NqTOhuXGF
 W4wSCulLGDnxmvdEKFhDf3Ht4NC4bIg0hP21OMiFDYSohfT1N2D9Zg6w4Y8uXADlFLT4
 N1ZJ+lnMZV3KtbGAX9rPPlmvzHFk8gKmvUNEzVHKtRIguBCYwGgSdvnq5KjpFtZPHOIG
 jxDHSKbqW/zdbEHXPbnB9TTifZCVzM+EX54vhv3418jMKXPy6qGihb58Vf7uvQGrWjZE
 ctaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYq1V+f1vN9kPXxOO5MfCB61H3pcx4JKScDYDZMwgr8fFfFHC7qx0TQl8D3dSJaBqzWpdlU3D8x2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypbxNhGl2PaX5l5xGVjGz5EIHMHeSX2d3zi0dxiNlB1GG/z5o8
 vFmi0aF8+oaDt3bUEFkbx+pLr5tSGYcptovPk+00TsYvQIPZVp1HJEgf23yY38ckSYMnoeOjotj
 xUW99QuNPRI3iwN0aBBuuJnGsx5p/ro9F0oLzHTUneIsZWMga7gcfWGq3XqyzTlTgx464GfQ=
X-Gm-Gg: ASbGncshnVu4tdrUbIRVQrs1eHYRq4WJKm9X4GpGfv5ko9HbfqjrHMyPWGgJz1SXYsw
 UjV38ZGBMoT1gfl/bUv2VKyr5G423L0z27bf531WuJ5IBRJd89ykR4m6Rm9HQZoMlpWKiH7Dtdn
 C9jQgq0h266b+HTu4SyNqyoE1yGuNwi23DQj9X7/wPQt76IefusYWTGnXf/GJFsRbgHD783WwaK
 jXV6+MT62j6MmC/r9N0aBcYGCGczyTgBERgiK+A9mw8E3DEminxvtwUtdDdcID4l5/Jc+adiH/p
 bcs7W+8SKZr1ToWqSTxcQyvWcz5uu4q0AdVdFPQ17HnQap1i6zO4ji1nGQnSaplW6i6HZ+p+77c
 b8zUfmKbDHNvXhCSVxY8=
X-Received: by 2002:a17:903:2c0c:b0:24c:cae9:77bd with SMTP id
 d9443c01a7336-290273032d9mr2018785ad.54.1759850696979; 
 Tue, 07 Oct 2025 08:24:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpQdvk+bnK1od4ze3Y3yevCGcGPudiSAKRvYlPBUT2nEB/5pbIwu8CQRtOTQlJUw7+Chn6mQ==
X-Received: by 2002:a17:903:2c0c:b0:24c:cae9:77bd with SMTP id
 d9443c01a7336-290273032d9mr2018435ad.54.1759850696571; 
 Tue, 07 Oct 2025 08:24:56 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d5e36sm169284865ad.114.2025.10.07.08.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:24:56 -0700 (PDT)
Message-ID: <e392ec32-b547-428c-bab3-d6ba0940d5d2@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 09:24:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Synchronize access to DBC request queue head
 & tail pointer
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com
References: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX7hGaWt33rN2t
 gvI2TO1oOr5FsodJiM0SpNIS5J7Fctzx2cASjh7Q/Mr2JCKyejTvoZ61tr5T5Vqh60nRlxxPkHL
 mAPnFQ2B4HgT4vDutmQAUJL0Fa6wkbEfd69HfrCqyIu7aoMxDcfyNLsgmU5dV++b7laTxq1kmpz
 QhkEuL3II2XW6hu0fTHOh5384FSFYhKM5+9wN/yj2c33JZDzAd6HhfTGZSvp73mIUElTzOlABOg
 0o5XRuhqVDzXjtbZameVao1ybvOebMceobS1e+7v3IAuf0/Dttgu9CkQCyH3yvp3Z3E4qurhrTr
 XVFstO2yqzViyC941N23xt1qBFU14OAE5Es/00A0H7m3iOPE1FpA1PusNF30c/B7rgWLkZyAPVy
 98xQ029SMrCPZSwFWK1j69AnO7BIVA==
X-Proofpoint-GUID: g6J7KkzT1aOnFrmTYe20bNElsMf7-qsv
X-Proofpoint-ORIG-GUID: g6J7KkzT1aOnFrmTYe20bNElsMf7-qsv
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e530ca cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Oh1Qi44SMlBjVNmzfBIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
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

On 10/7/2025 12:18 AM, Youssef Samir wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Two threads of the same process can potential read and write parallelly to
> head and tail pointers of the same DBC request queue. This could lead to a
> race condition and corrupt the DBC request queue.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Looks like this is missing a fixes tag.  Can you just reply with the 
right tag? No need for a v2 just for that.

With that
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
