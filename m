Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D02BC2959
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 22:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316F510E37D;
	Tue,  7 Oct 2025 20:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXFuihzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFDF10E37D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 20:05:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETNXF022625
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 20:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IoDPH+wTfwtuvStswvFGoT4dXqTUMaHE2qAkUsYf+Jc=; b=cXFuihzm/lPoih06
 Kby1agkE2ZRzp8o0IapSJg125FMFstSV1yhAptvzG9yA9WrzCBifg5xJohinn6Nx
 JTmasvte0xkPVmAvjU6Lk8m5uw3Tofa+zO3gHPwiFJ43hJjZeTReLUGiONcldLwr
 RyM+3OrSrJwfQ4JJk1Hx+LkbAhu9uM8TyW7GvBF9LLNQY2yPZDEdRZRA3tWdOIqZ
 qwrKn9VGQZ67lM3bIadLD5QVIYUwhpK0TbkVKBRZmnI9YSvuOB3I6kiJLLggKQYz
 mtF316Qic3iu5EL0dVhFjTtPd/BtYU/5Izc0zjCOPgMS8pb71lI1BnWFLnEoxZxO
 aZHTUQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu8eq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 20:05:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-780f914b5a4so6032223b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 13:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759867545; x=1760472345;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IoDPH+wTfwtuvStswvFGoT4dXqTUMaHE2qAkUsYf+Jc=;
 b=M9DYW81EA0eUIzcU6ZdcEu60M4yPY9jYWC3RHbfpPZR8wFMxMB4koEBqH5fjZwCgau
 7IE7FvWiswCummyAxZUmHTKJP35Si1/cuZ1ohFVFhyeREbfWdXg3FrQVUxBD5CKfgzL4
 52dOtq4/pJ0NzXrJjUm65urLXx7rM+TkVsFMk5Pna1bhTkaDlNQYbW5Weiicz/VuaRyA
 X3QAmIgu38U080sCvcgoJ8sp2efORAjkznT4aAHwXi2aJRIqlpZSxj5iJtwyxmgnEWFM
 XGBHaSbI/fQvqPCTEKP+//By19lsM1oJ89tJir3ZskQd537d0OSXK/3iM+J8S+UP+0Ey
 Uplw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViCW6jBwKZ5XTsaQu02XHljM9IaQYdrTRcmEHW7rc7+wfgtDv6B6AROsBAqDEWx5GrrHFLhT4kQoQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuWdgwkYxyWbSBoA0aPVnWCkozOCZ0AjklyKjUQhsGZ2c60f4U
 ySiPMx3tS3OH3FaQrBl/aWzeLcEGQL2iPManHUQmQB6XT6bpFoQZW9Ufz+LUywZ7ty36MoWAY0k
 t34SbmyyHcdm/CUkOSnf8jk+2XdjVaOpioBS69WlsLKiqWQZ9StpLuDhusrQ5mXqsjPLEECI=
X-Gm-Gg: ASbGncv3NUdDuxyrMhX4AItmA9usTO3ggz8g570oUETG59JwJ07X0uwtTjKnWK57o3V
 rO+JpdHpzuE325titZ33P5P7jqW9VCqjNG0SKS0MMFRlQnSLSMHIzbqMsxMji05kFI8x+Uw8TBy
 /o1M3oBh//1fy0ng5pcQwN6lxZVIyKWswa9eTxqBdLVk8y2fccHKHmHJVIj55Pw8y+8UyrNBf4T
 tv5Na/2jmH+CtkPYSttEe2vYfzs6dKPvgEr9KMhIxY/EcjuUbZwe3B9lySyGAo8/e60EIK4xV5s
 qaQBkU7DGvPxzQIHA2di51QM3kOufvgy+pXiwIZH+J9GsuG+wPtHyuTdEMajzIwVWN37sP2Shb+
 UeWE4b/aallMbWDOdgAs=
X-Received: by 2002:a05:6a20:918e:b0:261:f6d2:e733 with SMTP id
 adf61e73a8af0-32da817d154mr1048536637.16.1759867544933; 
 Tue, 07 Oct 2025 13:05:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8l70aiodUmZ54xERjc1Cbl6PHEPvR9gXUdjABZD3bJEqnABNFeiUwROTx5szqU2jJ1eAy4w==
X-Received: by 2002:a05:6a20:918e:b0:261:f6d2:e733 with SMTP id
 adf61e73a8af0-32da817d154mr1048498637.16.1759867544350; 
 Tue, 07 Oct 2025 13:05:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053767sm16529325b3a.52.2025.10.07.13.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 13:05:43 -0700 (PDT)
Message-ID: <e6311506-59da-4728-a711-0823cae0d0b9@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 14:05:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix incorrect error return path
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xVytoSaSP1aQmJXN6NvAXUuQD8YsC4zA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX1c8uC6CMSyCr
 kV1ULzOWaPZ+OfJM7hSKgeVWnnKa25usaJUwNFwh1GSlrMLi5Q0mSfw/6ne5Dp3b+CJ1LVK4mGt
 UQW7rMIEynatvAztPiP8fGav9l5gQl+oBPtffm3Iue7T4kcHujzkUoayw0gEP4Sf0XN7p/Ad9Hl
 ZTcbXzV0U0XL6geui74L28JyLGnJouqeG70HTIyj87Niz2oh2CydY54eJ317s16QmQY8ev8+ZBz
 pErjVtUmER580AbmPR8i7CWnwWClg2nyG54IBUrFrIjOp5jYCKhp4PKN+W3KYQP+uWsHZFdZSwJ
 HA667cJV5PK35k57PYuAjdMoYT2qr6NLJEIeg3RAP1Bo7kidVDlhutNNHTFHg+8af6QnzjYFoEt
 B//2JXRPoTCbybTbSQ6DsV5XINYCYQ==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e5729a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=owB73EMJWWjvXzXBjV0A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: xVytoSaSP1aQmJXN6NvAXUuQD8YsC4zA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023
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

On 10/7/2025 11:01 AM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Found via code inspection that when encode_message() fails in the middle
> of processing, instead of returning the actual error code, it always
> returns -EINVAL. This is because the entire message length has not been
> processed, and the error code is set to -EINVAL.
> Instead, take the 'out' path on failure to return the actual error code.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
