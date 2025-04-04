Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFF5A7C01A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 17:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64F810EBE0;
	Fri,  4 Apr 2025 15:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IfCpqS/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1842B10EBE0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 15:00:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534Esk9C003535
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Apr 2025 15:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gjuyoH+MYP4Pq4+GkSx/VuHD8dO1if8oAqk8qkcguRw=; b=IfCpqS/t0BYVcPka
 q5cG481iLwzPfLn95w5h+Wr7YyhAJzPovQvZTn60kofMJOxZwSOxT6VCqXXv7EXm
 hohArShJ8NHcAp1nxE4xU46VGzstU+x+yW4Y4qSs7ac0mtUA9zCuFuGymg0hgBWo
 lPkdl4OcsYvMdNoZyd0iSfA5dQ/fgNTbNkieLrl1s73Q/uirCTPK20DxiGRWZ3Xq
 Ke5M1yRF7urQ+TZHp56z04j6sHleqkJdFc1+TcTlucOh3AF2GrOzMMu0x8/oDURf
 p6pnmK9CQe3Py5+u8APAwn5iuYFNaLGa6jC2OCeHOutVAmilS5HsgfrDiLoCSrcC
 /zF5Cg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d9a87c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 15:00:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-73691c75863so2672560b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 08:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743778847; x=1744383647;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gjuyoH+MYP4Pq4+GkSx/VuHD8dO1if8oAqk8qkcguRw=;
 b=oH3uqEWcHoFO/dhTgba+0Vu/2ONoe0qUXS3PItpmgjt9wY5b7IbGEu4SFUleOO3Gbv
 Vw32Uk4dfdftOphgEm2WcYu36qWZ4FZTyWxje1T1Yhnv2uhrVkeUPvKpr/1FHgMdaR2G
 ircnPd0AhmwN5nO8h5a6/C/Q1lF9S0lLJePSIxLmw67c66J9jOqDmM5L0S59XOngBbQE
 o+p3KCKWDo6TdnTujvDGCjXxpMIk3T2nA4wqv7cOs3HgBWYQg1Te9L8y/C7HQkdSABQo
 bEh2nd9qS+gh39Y2axUB/X/xscm5aveYrNKfpgM3IL+Fl0uv13tgkcJVi3i2nmJPHvhz
 Cndw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUE17D7wuYtbC26+wngli/W7vbyCPtAFAxOkY5EByBI1LPg+KTW8Gm+9CxJXTww95NTZlBiDNWD4o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9iioRiBa4FoeLZPltsHHamFZupjMvBwY1SmCIaqeyWgFuI1Yh
 FuVkpHvFJlQ+REvV/F4wU8FlA6pi5th4F2fO07C+3eLpT8xBieBDqigIafe0jEAgl/dA1GwbxuA
 z0F4llx75Oitzp2dKVV+GHl2lsFdzfp77Cm0rc2fohsBGimUW85c0WUMZ/FKoMbazjl4=
X-Gm-Gg: ASbGncv0liZsJrA3Q3V5Cogi6U7JlAqNaq6VXiU2yZq5yW4png2CntwFz0XoHPo3ws+
 FpkOLFHkgNW1gGw0MlYMdk9ApZw5Ma9EVro01wEOSLLgO6cv+qtsjqfRf0Fh4lCYC7Q6Vy3weO2
 hiTa8rj7CqQZ6cuCmLaSc8rCOu69b5O0ED8Y0QwxSfcmf67YRdtP8IoqhVc+zCtGNyWVpMHwr5s
 Q7QRn0eI7G8G9D64Y0GA3DBXZj8x1yebQkvG2lIBtoFhHnKoCrkyoDIy3Bn0hLdI0lCfl/tKVRo
 So/72dKtOStEcy7uRruRA8I8hgcBrMAQOpCD0FM1doq9zOA0kQ4rgT1ZKI9Icw0dig==
X-Received: by 2002:a05:6a00:3a12:b0:731:737c:3224 with SMTP id
 d2e1a72fcca58-739e6ffdfcbmr3985292b3a.10.1743778846610; 
 Fri, 04 Apr 2025 08:00:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE203/Bmi1ZmAOOt+4MDRB6hLiMoXA2WaAgJ9KUICX8GFlPHyvuWIXmCag6UWiwljs8ylYtQg==
X-Received: by 2002:a05:6a00:3a12:b0:731:737c:3224 with SMTP id
 d2e1a72fcca58-739e6ffdfcbmr3985225b3a.10.1743778845957; 
 Fri, 04 Apr 2025 08:00:45 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af9bc2d04e5sm2953653a12.4.2025.04.04.08.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 08:00:45 -0700 (PDT)
Message-ID: <d1c263de-bece-44f1-bfb0-c5f00404abe4@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 09:00:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Flush pending jobs of device's workqueues
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com
References: <20250401155755.4049156-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250401155755.4049156-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ys8tYoJ6YnJodqEk4xOWURwzWG_3wW-6
X-Authority-Analysis: v=2.4 cv=cpybk04i c=1 sm=1 tr=0 ts=67eff420 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=MsQOr5fAwB8mij_F7o0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Ys8tYoJ6YnJodqEk4xOWURwzWG_3wW-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040104
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

On 4/1/2025 9:57 AM, Maciej Falkowski wrote:
> Use flush_work() instead of cancel_work_sync() for driver
> workqueues to guarantee that remaining pending work
> will be handled.
> 
> Fixes: bc3e5f48b7ee ("accel/ivpu: Use workqueue for IRQ handling")
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

The fixes tag suggests that this is a bug fix, but the commit text 
doesn't really tell me why cancel_work_sync() is bad.  Does it leave the 
driver in some incomplete state that prevents later recovery?

Put another way, "why is it necessary for the pending work to be 
handled?" appears unanswered.

With that
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
