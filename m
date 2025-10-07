Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1ABBC22AF
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 18:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A469010E6F2;
	Tue,  7 Oct 2025 16:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kzvsv10b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC3C10E6F2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 16:51:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET5iE016027
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 16:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2q74mSrLLOh/c/D0ZogrVikAVBufS9gKuTHbKM6spo0=; b=Kzvsv10bO6liXqbB
 AoOnVDQSrqQW1mg6CglVcdvqyXoGAWqVggANm2UckBTV6hKkRTE4Txb5MjEsTAwo
 ZjfdtdrJJPQobXtApXavU/MUbW1yFKdM4wVd5d9O6VjaItN2l7uVeZHzQfwzusdC
 T3A1dWeH6xjKxmxMxN3kW/o1/kjs93iG1m0fwjub2J7I21xPpxJjwjztiiRZqlb/
 O89s/gqSjx0VyVeiJ5MwmZ3IojpWpeIDGt+u7TeDxbcFgfd8mDiqzyg+BAc9boUX
 7esq4sdZvstOaHjdXyhGlR4q/PAtwBSoIpVET6rb7YbjylCPC/hiuJ5ThIVUQkg4
 Bwakpg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6abnjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 16:51:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b6097ca315bso10625683a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 09:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759855865; x=1760460665;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2q74mSrLLOh/c/D0ZogrVikAVBufS9gKuTHbKM6spo0=;
 b=qFO/ERH8/O1MEJ3rhYaH8GJAvDeyLWIdKipqauXUCP/EFV0ezBfClp+iO7XnbvRSXm
 CSsAkRKKG5uAVNf8EMjEq3/G1sCJ+jZNTnAwiFV2K16KG0sFnEF5CJXK1XmArUG+//jI
 RWEPqkZWixpJn0N8VxNAxHCcRwDnt2RGS3h5IYJGm5lqfaRyMI9/LlVkQF2Mnm9PNIH4
 wpiR528owbuIOX3PL4PFZfZlDN49R9N/NGmxONP2QjplzsxE5Dsh/YpbTLh8cqCNTxhZ
 O/Xgl65uWOBzeYpwAOhx55My/PDEheKY1NVbz+4yklz4Cz9v+UozlsTkkTFzMs8kQFMc
 vCvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5rs98gFgVr6qWUabG45EbOFgcrUgZdbKBTH35xidGd1dDTDoQzgSDFgBdvd9KA1mRhxXpeGorVXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzf2e3JgL3pKJjRYTKyAbS9NUEUfGFz9y/oEMPkZc9+gErdfz0Q
 iAtZtMrdF50Mq0GsRX+SbKWVJ4LDYEnm2j23yWWoCpgSec9W+4Rio3q5eNjC2T7+QP5Xowq7Vgg
 Xajejp9zavjzkYsukDXDOYFoHG1spkZpv1NZKRgzMGLOKAsBznV52tFr44z2n6GT0NOZzywc=
X-Gm-Gg: ASbGncsCpaNA6rZ3Z/yPE/uuQZpxMSsHFKJk5rWVGzf51FtdUNnN0EN9X7rUbEWKuxp
 FpdWT4blqPeYKl8xxHhWCQadQzwzu3lvKAWg80RismpAx/Av1KADdxRjZvaO/QDbfPC0sXjsPPm
 ChasV/dr5NiGUKmWOmZeUt5no3cHoKZe/sXRbRA8xy7NIkaRUl5no6zQsOUQc/Vs5kakP26bCws
 HguQ4zzLohsGMI5ylfzxX9/uTC0E/KAzb/tljLkyLWbn3X5fs6YmbM0XSGgfo5/znWUBziNNm+6
 uVmVut9RmVCR1RpcSHIBlxi8gHURUDz49A5gtADt9i1vYmW7U6hGyvFP4e07k44so1ITzacrRPt
 bgIN0Ol3fjZIsdhBb6U8=
X-Received: by 2002:a05:6a21:6d8b:b0:2b5:9c2:c596 with SMTP id
 adf61e73a8af0-32da80db37emr244343637.6.1759855865091; 
 Tue, 07 Oct 2025 09:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6Qk1pAcv0B7eg6TkHXi2dwkaUi1KqbTRCXSpXXXF2Arv1US5Hsfp1aDj9UByTjuCgrlqezw==
X-Received: by 2002:a05:6a21:6d8b:b0:2b5:9c2:c596 with SMTP id
 adf61e73a8af0-32da80db37emr244309637.6.1759855864634; 
 Tue, 07 Oct 2025 09:51:04 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b0205341esm16118369b3a.42.2025.10.07.09.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 09:51:04 -0700 (PDT)
Message-ID: <5c0bd33c-f6d4-4db8-beea-cc797bc9ba5f@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 10:51:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use check_add_overflow in sahara for 64b types
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007154853.417114-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007154853.417114-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e544fa cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=LcUbNKWctW3TofkTIeQA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: LT6PR3EdbAD3Y0scX2DW6PBOjaemmNgt
X-Proofpoint-GUID: LT6PR3EdbAD3Y0scX2DW6PBOjaemmNgt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfX2bYjKNjFEPHi
 VzU/dp7P1UwpPBq6eDhfnZTcM+LcvmS5bg2NDxQmgTqEXSca++BffQPQb7JiqrUL/VIeCwAiUAo
 F+dS1Bth8gRpHTfVUuzHeiYKQpfRD6xHnLP03puscadfYsjNcAATlQubgGkv0BfhiRf0lJ8tjVO
 n19raGJWf46elqWyUeNJqP5vKcScdDDwvznL9rVM3tFWGsvW2DwffEgne04qutqK//jr1rzLrau
 bPMIoB2cAQk4Nq4ES/mTQIYaV6z+oipabe7jhMq98yTZAbPGzxXc5SoKvHs/UeJ4OSOCQX84b2Y
 ZF+ezoWMT9gYAIU4IFyVO0EE71a5tuvMvO9q0flAp3KZ1I2ZRlkjCSAJ9mikYHFmHMk0IzoUXiW
 0NOTjXr0cn1ffXhNu4ku6VMY7nHRjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121
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

On 10/7/2025 9:48 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Use check_add_overflow instead of size_add in sahara when
> 64b types are being added to ensure compatibility with 32b
> systems. The size_add function parameters are of size_t, so
> 64b data types may be truncated when cast to size_t on 32b
> systems. When using check_add_overflow, no type casts are made,
> making it a more portable option.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
