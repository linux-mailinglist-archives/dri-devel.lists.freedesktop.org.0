Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84218A5564E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 20:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA4310E8B8;
	Thu,  6 Mar 2025 19:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNVN+TTK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC1410E8B8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 19:12:57 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526FVsZR017829
 for <dri-devel@lists.freedesktop.org>; Thu, 6 Mar 2025 19:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fb3of7w9Ie3DB6n9UGY49aYrXPyhRGq0wD8JUa9GVqg=; b=aNVN+TTKmbstWgz4
 NeRQlPry+8vIeEBDsDA93osB6+tzRBilnc3FJHDpczpMUTUNd1vhQGv4qrgc48DN
 RKHqvh1Svun1Z7eKib3rj0f5Dl0THgKgPTSkfj1zLZgqqHluN5MQJvaMIY8Exfxs
 tRl1ssdpr1LcHa9mDZbI6fWBvDtntMgULz+OKm5hGoe7t1ESBVZyeGIz9YPY3a8G
 JLGhk55Knx5/BA26RKfqOaWZge8/N8kfcurF024Q9d3n22uZ+GnrtRJkjnQNcTEq
 sqAvs/D42CngQ5bVwHtsa8LROLatbZPA02IVt9dWwZXri6celDyGwGcSQ8pfif63
 TiCn5w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45778ta1x7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 19:12:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2240c997059so22685705ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 11:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741288376; x=1741893176;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fb3of7w9Ie3DB6n9UGY49aYrXPyhRGq0wD8JUa9GVqg=;
 b=DWWT41UzzcRnI+FYk5llfedcZJ/tX2sdf0EfnPcHZXo2On1Q8fhzOWd2yUjIo6Sd6c
 VMze62VDMih20u3UyWm9XpiKmBYPKWV1WV69mi6MIKru9iRKFXoNpyu3GBk5UH+j+BBz
 IQH7KAL4x67S4/eS3lqf2srt63mGaDnhozUGWCx+fsuB8c2rWe0f02lcsGxb4wZ5DuF7
 TuL1HUT9t2M4LA9kEpFWn0XlMMxDH0AP7E7I3TU4KOJLGAKTGspJJEhsVFEzor2NJWAT
 f43tvAtkUabda1b0oCG0vPTO11BuP4jqPyLh29fd0yLCopc16ypeycLXxv8nGH7qFMIb
 UlOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo/1BUKt9/BaulpeJz9fGHh+C1Xc7H6E+XJVs9Hyt7utu/DSorur1aav1lQDWlScJCvLkyCF6Gkac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1h4QgO7YzkcGdcPIfAGGo33TckjZtER/0sj9lx9tgewy1aRe1
 CawGB27Lh9o/fKkF/pGNtNkH9TJn/b6kqP+veozx/+fVIb4i0JgwK3saKTPZjaN1u7W3U934tGI
 z+veX8ead5MmPsMiccFih+nsfSsUn9G9NsgbYLTK0TLJz25H8HfDsVG1bjEIndafuJxo=
X-Gm-Gg: ASbGncvsFvY8+ivym4rHH2Kz66nnFSnYSdfEfiF450pHhDMy5UREDi/dFbCn6ghHLWA
 Ba3VGtLcPDxnaSpNys4l1Gnn4SUzay/GI6aGoX6tWNY5Mg4jCDyLOm799a6FXtAB9vMUboAv4Q+
 fG4tYg2BZnQrc3mNWWa82QSUEttlTo+80T0IvGY9ke80jpvxixsv3NMKMf/jQ7f58bIKuUpyRJg
 LhjQyYnHyZ6RxtaueIFNSCzuWCAZYnZfl1H99Eaou6xac6rb67yFreYHoWgFPLmPohsb2oKC5qR
 ymbDWzxMRcag4MM51x5CALwnfnJRm3IsgAPcC+hWocYejfazBfqUN2GJiBM82e6UaA==
X-Received: by 2002:a17:902:eb81:b0:223:517a:d2a3 with SMTP id
 d9443c01a7336-2242888ad7emr7775915ad.17.1741288376400; 
 Thu, 06 Mar 2025 11:12:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAx44BUCXx+xU4NJjeRySwsv6RYLFJfvyLsxvcs0xJneFlHm5kPRPA6wLw2vuLOUiAu+gRDQ==
X-Received: by 2002:a17:902:eb81:b0:223:517a:d2a3 with SMTP id
 d9443c01a7336-2242888ad7emr7775535ad.17.1741288375935; 
 Thu, 06 Mar 2025 11:12:55 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410aa8a86sm15958525ad.240.2025.03.06.11.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 11:12:55 -0800 (PST)
Message-ID: <03bfed13-c541-4a09-8330-ca3563be0f77@oss.qualcomm.com>
Date: Thu, 6 Mar 2025 12:12:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix integer overflow in qaic_validate_req()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <820aed99-4417-4e4b-bf80-fd23c7a09dbb@stanley.mountain>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <820aed99-4417-4e4b-bf80-fd23c7a09dbb@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zhi9PtGia-6PURnP9H3YLUeru7iT5axq
X-Authority-Analysis: v=2.4 cv=U5poDfru c=1 sm=1 tr=0 ts=67c9f3b9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=UIlczW43xpdIlxS7G2UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zhi9PtGia-6PURnP9H3YLUeru7iT5axq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_06,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060146
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

On 3/5/2025 8:53 AM, Dan Carpenter wrote:
> These are u64 variables that come from the user via
> qaic_attach_slice_bo_ioctl().  Ensure that the math doesn't have an
> integer wrapping bug.
> 
> Cc: stable@vger.kernel.org
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/accel/qaic/qaic_data.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index c20eb63750f5..cd5a31edba66 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -563,7 +563,8 @@ static int qaic_validate_req(struct qaic_device *qdev, struct qaic_attach_slice_
>   		      invalid_sem(&slice_ent[i].sem2) || invalid_sem(&slice_ent[i].sem3))
>   			return -EINVAL;
>   
> -		if (slice_ent[i].offset + slice_ent[i].size > total_size)
> +		if (slice_ent[i].offset > U64_MAX - slice_ent[i].size ||
> +		    slice_ent[i].offset + slice_ent[i].size > total_size)
>   			return -EINVAL;
>   	}
>   

I agree this is an issue that needs to be addressed.  However, it seems 
that overflow checking helpers exist (include/linux/overflow.h), 
therefore open coding a check feels non-preferable.  I think 
check_add_overflow() would be the way to go.  Do you agree?

-Jeff
