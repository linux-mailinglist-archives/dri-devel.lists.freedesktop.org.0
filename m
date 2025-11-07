Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E5C41305
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9960910E0D7;
	Fri,  7 Nov 2025 18:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YF534zwe";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RscNwXwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2021010E0D7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 18:02:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7FtAxh3345848
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 18:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NEX2bdhiiRDwznBISb3B1B9zQtcThm0UsQhBXMVV7k4=; b=YF534zwerOasWGzn
 WvFIXYlfKBM4vSAPhixHPdOeTpvuQfVtNYCGvhaTWCB7mTaXIEVvlXEP3/y0AN/7
 CdJLyuM4D4FxbV475biUahILF+teYxgzULAJPwX/idWYpGZSkSDuTIn3hUzcIq7c
 QjShoyL0zUY5u0WK0bVNrzPBHCP7KsiLStJClQ3RrUkUfF6uPDSWNJt5tkiTWOqd
 UdCnV2OZol8zLb46s3YofkcG8iP+z4qXi/MegVpkNaHI6+Q+7OIbCWJx+6I+zfXI
 gC5N+wqi64Fi1vet8gmiOYu0u/5Yqt0iIECzYK1jTLQWIsTgT22BKW/jj18vXfuj
 E1wEjQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9ku60cyf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 18:02:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b6ce25bea3eso1335929a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 10:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762538544; x=1763143344;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NEX2bdhiiRDwznBISb3B1B9zQtcThm0UsQhBXMVV7k4=;
 b=RscNwXwHbvKQpFMOq5DbZrvw5kiWj3ibigNQrbQrVqWAm2K6idxuBETGWRwM7odEN2
 jQ/UtkFGvJmlDSdFeOg4TtG2/Ryo2KnEY95ANe6QMAflEYH0H+XqcYQLBOaNCtOudJ6r
 ZtG5XSGrt585IPAZ3t8SamO0oMMqUfy/i80k5wBit0LUWrwC25lsFQUs+y33Z3QNX6MT
 JciWRxsXTY14cMafNptEmGi3URWyB7WdNyXCnOF+T+cNDv+uhoqYWBTIOPcOOgDox3S3
 Oz2HDkkR4mkJcSnS/hGJ/Zd1Uhf94EU2Adw/io4mixefNPvkUlN8o4qXFpX1LkOaf+Hw
 Il+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762538544; x=1763143344;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NEX2bdhiiRDwznBISb3B1B9zQtcThm0UsQhBXMVV7k4=;
 b=rDysOnzwX4CL3ZOkwh64EnjPL4REAdR9o+Zq5vv9BEX476bBEQ3cV/N9qrY53NLfXD
 rCRnEkrrzsgSi003JjADMvpPCHBzR69EA0juPMfYhom88qOZf3prmpbXbZFQNYgk6lEa
 YknTZ4W9luLG2+PKRKBIm8CUqkuOF79RwojZ6lpU2wLgHGZJT7s/gdGAbjw5cPyoLztN
 wmO8a1VmIC2JtYwP2Vsgi3nH5f5LrP69c4xnoNg60+7Ad7e3tAF+Jv04yzyNjuC3Brj/
 usLpY0d4snwF36Gra0NOuX5mgnR+1jU1gFxktdhwDlvUIcKO6Z1ECE+vx0S6tBbnfzKj
 jSag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSsUrpkciEQC5Cnj2QsuJPwGyOmRKDUEb9kOAytwGyRPvAGx7DQzV4jvfrPalST9izjgxKrq71jSQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMSwRpsECfmbpDMG7IK6RLhfA7CidMFmB9JHN0FnVYzREd9hHM
 OH/Z9wlCzbpH+vatlZExw/sx5bkVTY82lFX0/tpF2YQoHGCs6tj2w/A3uuaUPpMbmQuK3Ii7/Ja
 RPRA5tdR7XoZNSZjaI6Pjiukyt/H1OsTq6Gh4HF3326PQnLA6Fo62dZFV6/TN1ubVOa3uqQM=
X-Gm-Gg: ASbGncuJq2TTZuBvxt7yzXGdOYBDe+nNFM4ab3KoK/A2BJ7gR01IIuIZNRbJvXY3u04
 DdMFd30z1UqaeG16AEi6JAssGbI4gbkPLHqyGbnuEY/6+rZB+YFjWS2RmaUn1tU3ABKnlueBwdj
 JCIbbeoA2NFVDXa/TYhYCP07RnLpIi+5uBWLMEji4Vk3lZGNC+Ucgle9/M+7HaPVJ0apzlup+uZ
 B4wOP0+5FiZSMX9d87ztxSdmeIiVsZl9SpCEqDOrhhpRmkWBEwT0dWMblQFSZEuN7XgRZXou5s9
 9tKqpe4XIKwQc2EGuOtQazYIgLrjm6kps+EhfoNV8RjMUk+5CIXiInNgwpDf4VQFxXZK/B7sgcA
 7kGUGy76RU2V+3JYAGHtRTftXG+dxSohefeJDSv/cLblRnpXoQQ9P
X-Received: by 2002:a17:902:f709:b0:276:305b:14a7 with SMTP id
 d9443c01a7336-297c046d796mr49289885ad.33.1762538543591; 
 Fri, 07 Nov 2025 10:02:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5g2Ian8ZOe9W/bfj+sZWk94MWBEZ0nF8wayXRs4eobe+EjnFmiWfUcV13PaF4PQ/+3T533Q==
X-Received: by 2002:a17:902:f709:b0:276:305b:14a7 with SMTP id
 d9443c01a7336-297c046d796mr49288985ad.33.1762538542753; 
 Fri, 07 Nov 2025 10:02:22 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29650968253sm66147185ad.20.2025.11.07.10.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 10:02:21 -0800 (PST)
Message-ID: <e2f71cb5-9f8b-4f63-9a9f-923a21764e7b@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:02:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] accel/qaic: Collect crashdump from SSR channel
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andersson@kernel.org, Pranjal Ramajor Asha Kanojiya
 <pkanojiy@codeaurora.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
 <20251031174059.2814445-4-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251031174059.2814445-4-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE1MCBTYWx0ZWRfX8QHIw/eDpVZu
 KQ1qu5qk9a3tR8IWLaq58MyojU+J3mapvmPNAZeiSVYayMB+xQEr6JQu+S7m/0d/hcJVAydHFz4
 TNGYck01vcj+Jzo7eKp5q8xosZNEQwTsP4Ss9NGjkhJ20e1s50D5p5p45gWOKUTA4BffrkS378Z
 2gaTEMin+Cww7lCerhsYWgdq6WFH0YUC0bA5aslFSosDOoPL/aX21NYJMkXSOHfj3E0Yg7ElHl1
 EqWJ/65TfxyTK++6EQQnoG1KIGYblSuhHRM42BCmx7A7GD+V6pRuvAEAK/S9qqoXKD0GDUjxMKj
 RhwBJaLdigPUDLPaMCJzzwKn1I2+89sUmY/c4Ybw8ildayfTosILi2oizZievr4nLviA2gfZoEh
 y6tJv4fMwHAqId6WbyRZhm1/QPlRnA==
X-Proofpoint-ORIG-GUID: R53HrHnKGQ1Dc974sOAWBqf_QZkf12B4
X-Authority-Analysis: v=2.4 cv=KsNAGGWN c=1 sm=1 tr=0 ts=690e3430 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=A1UfY7gyCxWr6ct2WGEA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: R53HrHnKGQ1Dc974sOAWBqf_QZkf12B4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070150
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

On 10/31/2025 11:41 AM, Zack McKevitt wrote:
> From: Pranjal Ramajor Asha Kanojiya <pkanojiy@codeaurora.org>
> 
> After subsystem of the device has crashed it sends a message with
> command DEBUG_TRANSFER_INFO to kernel(host). Send ACK for that message
> and then prepare to collect the ramdump of the subsystem
> 
> Steps of crashdump collection is as follows,
> 1)  Device sends DEBUG_TRANSFER_INFO message indicating that device wants
>      to send crashdump.
> 2)  Send an acknowledgment to that message either ACK or NACK.
>      a) NACK will inform the device that host will not download the
>         crashdump
>      b) ACK will inform the device that host will download the crashdump
> 3)  Along with the DEBUG_TRANSFER_INFO we receive a table base address and
>      its length, use that to download that table from device.
>      a) This table is meta data of the crashdump and not the actual
>         crashdump.
> 4)  After we respond as ACK for message received on step 1) we start
>      downloading the table. Use series of MEMORY_READ/MEMORY_READ_RSP SSR
>      commands to download the entire table.
> 5)  Each entry in the table represents a segment of crashdump. Once the
>      table downloading is complete, iterate through each entry of table
>      and download each crashdump segment(same as table itself). Table entry
>      contains the memory base address and length along with other info.
> 6)  After the entire crashdump is downloaded send DEBUG_TRANSFER_DONE
>      which marks that host is terminating the crashdump transfer. This
>      message can be send in both success or error case.
> 7)  After receiving DEBUG_TRANSFER_DONE_RSP hand over the crashdump to
>      dev_coredumpv() and free all the necessary memory.
> 
> Co-developed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Co-developed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <pkanojiy@codeaurora.org>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
