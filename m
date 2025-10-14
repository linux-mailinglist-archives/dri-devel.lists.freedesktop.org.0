Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CF7BDA1FE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 16:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8ECE10E14B;
	Tue, 14 Oct 2025 14:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/3XFQz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A046310E14B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:47:00 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87MkC001524
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gfGSxZD0pUjuDtNfiJBnpn0TrxSH7SFM9cz+J2T26ek=; b=B/3XFQz/HGAbCyI2
 fgVQNPP5pXU2no0ZaWGg9jBvzdD9XCDOwBye1xBY30Bvvh0QYfrtJAln3vGgdzQ0
 mQoWaQ238LVyqmAlf04KRiROzGe6wkYo4rKMkZmUV417Qo5O0rpGn42Cq7QqwjIJ
 MccH7tzRCyIrC5IItvE4gcT/kxZcTovLWsvak6cs3eVc1qGyXLViNC63K8Ymx3wF
 p7nQ1wcamp3XeufpddEC5YaVpaxFVcHxLTArA9gEuZCHXaaWqv9Q4bdYrSN0WPkJ
 VwtgdTu1Qs/dlzm2CvkEVclJCL3hNBA2QHzUfsMErz2t+IILWsBdLa+/d7TQGc4Y
 fc6yww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk8txq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:46:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-77f5e6a324fso16243390b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760453218; x=1761058018;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gfGSxZD0pUjuDtNfiJBnpn0TrxSH7SFM9cz+J2T26ek=;
 b=gtTPtni3XIVHnpui/EooWrsKzbTp5tDkGl8/oOSVxjjw4JK0CD+Yrk4oGZiJw1fyf6
 obFIrUAywm+TKOyCzELSo0iIfdURMjobgq9HR4vqY0wncYqjnghMzyF4YDBSKJtTNnBd
 b+34YpGlp6f+KD+i+9nDhcNE1ayE5/+E38KSvnj4doIdXrP69fb7xrcJLYAz8j7m31Ip
 Qxz7pqjcA7OEFt5lDSJgD3+h9arbH0DRj7CSKtWSgaWN+Djoy0mSNhmU0CuztqdXxoOS
 PHgP3mPsF0iCxFp4NPQtewNjWYCLyRojHICWYlBtgs7f2bkdQ44Ilq4k9qGb9MLWyLr/
 IUew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq98qHCItvnc8W5qRhDEavKZFzx6LmWLjiWQpRLWAJAal6+dtaf5Wyxpqf2o0S4Duj4LiejVeMvN8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcmKwPngvJnCln4tgN/04Fg8XmS+gI4LdFc4Mt74bU6DCACOLb
 RRRai2zFc+nl8/CBsLog7HOZlnSJrpUKhQXQ7ujv8PqEJUVY034JTjV/KlBmZoqvCDPzwDeymnZ
 flU6I6mr56ZAW+T9wRppRZun+ePLosEyLHAyOPUQO0un08/EIdYJWEiJ4ncgXC/Vf6DXKd2+hCV
 1Qrls=
X-Gm-Gg: ASbGncvz9+5y/PfLhiSz3DLDe/lDk6jOAGp9qdbYuHyveX1VhVkvAMo6PHUUIopsydT
 velSN6k4toF7Y/gOmMlxbVQfFbsU8HPOvkwHNsGI0UcBfN3AD4Yv8OxnhPeYOZ+7EtaDtlnQmw8
 +vhcHfhIhdAVhTF9jEO1dfFYIS3/6CZQ+8G/lVso6bPP2PpEbA3vpYhahytV1S1r3NWHNvbGTKi
 qSWW2DkWi3tVdWDLV/UTvS3ctrQCLjVlZaVW6jS7ZyOS1kRHqFJQ9M/8zm76/8Q6id2L5daLXj4
 seNt/6MwTCepP18+n01RX1y4tnmtlLMt4FbZv7TUfd4kNTYS8qbTsgnPHdJ4pxCHKaBhFn5hxOo
 ODsZkUFkpeWaePA==
X-Received: by 2002:a05:6a00:3ccd:b0:781:2271:50df with SMTP id
 d2e1a72fcca58-7938714698emr30759974b3a.19.1760453218172; 
 Tue, 14 Oct 2025 07:46:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsV8Su4zb2oR2757D38whcD7yIUZ8bS04uFGMgdKpQqGzSIEG3DnTdJHPHE+uFWtFl45RmCA==
X-Received: by 2002:a05:6a00:3ccd:b0:781:2271:50df with SMTP id
 d2e1a72fcca58-7938714698emr30759947b3a.19.1760453217719; 
 Tue, 14 Oct 2025 07:46:57 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992d6aca6asm15382005b3a.70.2025.10.14.07.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 07:46:57 -0700 (PDT)
Message-ID: <1b50727e-cb67-4098-b951-280e9fbba8f4@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 08:46:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Treat remaining == 0 as error in
 find_and_map_user_pages()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2nQ0s5NLsqVQvKPm0ZZPQL5sWls7xpCP
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ee6263 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FULVd30_qMWwzReR5z0A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2nQ0s5NLsqVQvKPm0ZZPQL5sWls7xpCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX5nZCt+5nYPv6
 SzytdKxLYA3x9mJ56DUjw5AiEZB7tQEaMeaMFh3E2wTTB+a8reOs4PF+5xP73JHI/LyqRa8tbJC
 pCyisxPw1aXZdaK38uZwFZjUPlpnUaCQ5q99OampChGwvEaRITPu9RngI4bWrRvIdDrSOQa0qDA
 hBPeS/1qHq4mSfhS+RZmtI6JIUuyD4kV3PBtXHXzCqecSlZqFBMzv9mfaDpy6hsiG4YNkpVLmb7
 OFTZjphYLyXd3WsXY6KcoWm2yhmwbsicQq8ibXYogUxhVKL+qvhyHstJxdFCbLlEyDfzZ67dDIJ
 wqw8eThGU/G4z1LVxf7SUQqAX85UiosN4Pq2iFSjsazFZUlE7tBgHp5bhoe3wygHZ74+BykjlJZ
 pDC7Jl0bt+70FpN01aLjSPGRbzJFnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On 10/7/2025 6:23 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Currently, if find_and_map_user_pages() takes a DMA xfer request from the
> user with a length field set to 0, or in a rare case, the host receives
> QAIC_TRANS_DMA_XFER_CONT from the device where resources->xferred_dma_size
> is equal to the requested transaction size, the function will return 0
> before allocating an sgt or setting the fields of the dma_xfer struct.
> In that case, encode_addr_size_pairs() will try to access the sgt which
> will lead to a general protection fault.
> 
> Return an EINVAL in case the user provides a zero-sized ALP, or the device
> requests continuation after all of the bytes have been transferred.
> 
> Fixes: 96d3c1cadedb ("accel/qaic: Clean up integer overflow checking in map_user_pages()")
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-fixes.

-Jeff
