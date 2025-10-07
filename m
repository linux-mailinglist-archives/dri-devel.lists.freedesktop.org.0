Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40D6BC2312
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 18:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB5710E6EE;
	Tue,  7 Oct 2025 16:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="efOu44gM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FAE10E6EE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 16:53:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET4VW017414
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 16:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lQtZdEHBsUHjjpKVaL7JSL00ET6bJeqQ3HvFIqWIaPU=; b=efOu44gMlNAbBcNO
 HdlrmI94twT324C+M8P6Dy61rbvPN4o4seMUvhvkm89/vb/xPwMNcaEb4K02Ykf2
 FwJvg1RvgdVaSavYmHCGv0D1dc47cpMlnfxFeBeahbdox2U+94rR1lyFTjUv/2VC
 c/2e0eDseo3CHT5pTvPGxQNPlQ9GhpitnaCUtb60GDdgzX3v2TNGpTmp55UpxZ4O
 CqK/EGuyadySWAaN8RBLd5SCGzBWSaHkD3Tu165AO+fO7ajrCo44i5iDN4/an1Zd
 Um7hU3/BQc4/ZxY6ylR1jC2w4uB9wDWsFiJCpc+nvnoGXFI3OGCaSa6D0+dpcg+M
 lhMZbQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn8a2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 16:53:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-78117c85670so45757b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 09:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759856021; x=1760460821;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lQtZdEHBsUHjjpKVaL7JSL00ET6bJeqQ3HvFIqWIaPU=;
 b=TrhqdBVTRuZpyrM9A9h1g38vV+NLb1AKBWB8631wrBM3rVvePGbXXh+0JjkYMVsn22
 Ofq+rwxACmb87YnvLfrIs3yIXdBkY7mX8YYa4bdmXQsBaD8FVkpzN6h6pKjMNrRvN8z5
 YM0GxqRjXJrWi/C/APUAUpf+zGqG0B57ey2gMZX+eVBbwO+IT2OG5y8VfnmrnwV/slfQ
 12xcOCKvrsE0nSHZiaHEjI8czam3/0+yqeNIoP8snVQ3Z6jQim1kuM26u4pmEl4Bn/I6
 L6b+HiLINcowK+nFTJ6joEr4Dk3oVVosYXKSUklZKFJPYwkZh3KtJJWV4Uld8jsSVev0
 gDlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLTqiORllvAB9BUB+pynhwSlIlcD4WMPCCJZinTXSu+v5zhUtd9uENv/MDFMCJZys+/IDHrEGj79A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymaIFesHqQzoByPjVXDsKoHVew9l0VJrA80xrseKsKx6NDSMyv
 Y/pqRhP4Eb+AC0Mr28FVnXkQl/b7Q35c2i1ThONXGN+YUDIoQbyiYBuOSU5o8/9i5ZrtrllJXJ9
 I73rfSFwa+2aVyaMh9ahEnDKm+uzoyAxoGPK9tAllX/tg7haPMzRX53/Z+dC3mmshTVlVJJE=
X-Gm-Gg: ASbGnctFlNhAMYRWAtgkYCjZdg8Uq65XVYUg5k1nBJcKlpTiHwHFUg1d4DWOPiPXIrv
 esYyOuL5MYBVhYuTQFwZxyLOtwATXTaM72og7EA7QtwbAZInySPqpNe8ju1oxOCq2egbjXmXbjV
 0ILhEWzwC6DROxph3nnNMsH1ddDvSjpfxBQIcn7TYmxMLf1kfB8Y4E3w6qiRps82XXYInxiFdwI
 EqU40c9OM2HMD/XLkyjg5RmmqzeerheVGV094uwLtiYTvagJQ5pkt4+5glm2l/PtX5suPz+v+va
 gA2mS0rDFtcsFf/nzq5MtdnoO/XMSjey3IPiYl8qBgLucjBUQ5R/OOW39DXC48vICqlZTV0XR97
 sRORT4GZSypDVd7P/DH4=
X-Received: by 2002:a05:6a20:7f88:b0:2c5:6682:d9a with SMTP id
 adf61e73a8af0-32d96ec2adamr6224589637.28.1759856021218; 
 Tue, 07 Oct 2025 09:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHreoUx5tNEMY2AIWGEaQAkLa2qLKH7Ia0NtRGWNHj/vLjQvX6NBvA9SPEtJ55nDTnxYWNTvg==
X-Received: by 2002:a05:6a20:7f88:b0:2c5:6682:d9a with SMTP id
 adf61e73a8af0-32d96ec2adamr6224556637.28.1759856020713; 
 Tue, 07 Oct 2025 09:53:40 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b62e3508744sm12099840a12.30.2025.10.07.09.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 09:53:40 -0700 (PDT)
Message-ID: <f185979d-029f-413d-9e49-b6b3237b19bf@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 10:53:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Remove redundant retry_count = 0 statement
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX7SAtjUdQ6hG2
 Zp7a+H23EM7DSTtaiKEJ/9KZ89m3KapG8B29enLFA6H83WPeu5fZxx489sHHJvsLqJMGzPxcz57
 2gTYSUSp+RY07r5KyNydh77hqMJ5zQas0bbcthayFrGvVx5mD2Dl4LgfFCw498cV0GNLWdMApbW
 V2qMvZgJUpJg/QeBnwzVZ8USxgT2nP6OP38VWU6nVfL6RAiXLFtFEXAcZmPn5R+iVE1fR/OHma+
 Sf6LKmdNxgXD2quPaKEne8hJUctkaPKdLjsHU3FvZhfLLxUUQJKx8lAJZdrnwbg+wv2pckDvEl9
 1tSyTKQsNdMv7SxG8/driCtwHlW5wFSPqVlsrLP2wv4FlAGdfac+ZH54faazb4zeUcqE37wMutx
 +EO5ejBTgBMOh41V6BptnuAcJ/knKg==
X-Proofpoint-GUID: n9mePgWb2Z73t2Hbe0rmIaiOVXDd91-x
X-Proofpoint-ORIG-GUID: n9mePgWb2Z73t2Hbe0rmIaiOVXDd91-x
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e54596 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mnYluDPEoM_Hn9eIMYsA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
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

On 10/7/2025 10:11 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> If msg_xfer() is called and the channel ring does not have enough room
> to accommodate the whole message, the function sleeps and tries again.
> It uses retry_count to keep track of the number of retrials done. This
> variable is not used after the space check succeeds. So, remove the
> retry_count = 0 statement used later in the function.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
