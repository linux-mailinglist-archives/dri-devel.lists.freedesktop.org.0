Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B197A86223
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 17:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA1610EC01;
	Fri, 11 Apr 2025 15:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUkBpeWo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB12310EC01
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:42:49 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B6GBSC030646
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +G6S6fjYAcXLJvVxUHf1XHcvPAFX78OEzJRwUIIELqg=; b=PUkBpeWo7BvgPhjU
 v69V+AnA4PcnHP9PecksV4VDqI3QboKOwSdj1ONlEE9LcKM5ICXULiHVq7I6fMcu
 WX10gbnKQ2MHJJVVriOYU0yCveqVI1+n1LDdnQKgPfRtjp+vgg9jCtf9aU6/mE3M
 9BS3dd0ktqI1SDOIUgH/07OhS7wzcmMvHOCVAgBPPxmil5xHAmimTkSToihJvkC9
 aqsDoRmXo1UoB65QCCPAj1T25KMlHj6CkZEJqz65GRhlF8iWl+QGpBXIM3xFPSZ5
 BtHZTkJ36vcbXWiHu4pORbF8ZExVSm4ew0zid751QZLWlaJ27UeSSFI2zTK4snHi
 dkjHfg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfttnun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:42:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-af9564001cbso1434786a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 08:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744386168; x=1744990968;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+G6S6fjYAcXLJvVxUHf1XHcvPAFX78OEzJRwUIIELqg=;
 b=B7Ot2vNc7KTmFrn7K1HFRYfX915/Zyvq30R6uL5m0qzakHuVglaFYh1S5+sgCQI2MQ
 N1QwpXp9P4OIuEU3djl2mnNnR7GqoMiA8j3WOtMGaAjVm7WAiAmDa8wEaTJL1V9saP10
 iAG4K4HMXVTwpBz8/Cw4VzT9wjKQDyO4SO2ZvZFJLEWrQSV6UyiFHFHBLStQB9BZ4K+2
 f3hkPPBpp0ZdSU1+mupT9EzZfj1TC7MjV0F5S3UD8ZfuubvMpgc7PEAJNLgBLTF/9Dfh
 ccqu82FtfQMldxVa2clw1uvGe4SA6tZtptW8eWUdh4mQPPw/LNN9cpTkWcp2o/mZX4GZ
 cLrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMMBkDeinI6n0OtazWlkzJuNZd51XognHtdVoEcQLK6NBkYEM53/TufjYrkNCmgGwieggew9Y6/LY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6UtVEaxtwwQkzZXwrvenyW4t9x+6E8mG9kTd9Gmlip+XvCHxE
 NoRtFb46jV6/NOYesgMr2HXiabPT8vttUFcy47XN5BUbv3iswk8FNsJF6HZxsRUkfZFZxdvHw2z
 wi0EW58N0g1kZ9yrwuz2cyZZGRDUG9Q3mxKC4qy3rZoBtbOwYYxSsMqHJ0VJ/p6cQOiSZPcYdZC
 c=
X-Gm-Gg: ASbGncswAeTqTRVlxr+3RksEdds3ODBvdyE+XJlKiN+pHJOlVLb2S+hLVx85Pj4e/v5
 AP9pIdXxMuUSWSlaHluzat3VxNfy0xTEBo0OfRtmP3tvVyo4QjTTBwzRPkcl81XN3ED8McAbkiA
 mlB3dsBt9yb2cl5DfbzrnPn7Fsz+oj17l6Li7iqVDlrpXstaQih3YonL9GzrNkaIJOOWc7Y68Lr
 +vlNDypRgCd5st1glxkh56Tt+jHxltoSTiFc3w8M+SivK1stmA3IdJICo2CPrRsdFbizOMuE1kV
 Jtklp1yicK4uO2nUF7yCvIYv6IM4uQ4mzHx/+H2eb4QgUIYnDfr4rcIGkwsOsQ==
X-Received: by 2002:a17:903:240b:b0:220:d601:a704 with SMTP id
 d9443c01a7336-22bea4ab69emr46195245ad.18.1744386168399; 
 Fri, 11 Apr 2025 08:42:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS6DIuCGq+n7D73U/Fkn8oMG3w3zcYaPL0gpjJqD5D2dhmd558+r2q83LYGhuNF9aG8mtrfg==
X-Received: by 2002:a17:903:240b:b0:220:d601:a704 with SMTP id
 d9443c01a7336-22bea4ab69emr46194945ad.18.1744386168027; 
 Fri, 11 Apr 2025 08:42:48 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7c993b2sm50738955ad.135.2025.04.11.08.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 08:42:47 -0700 (PDT)
Message-ID: <32676fb5-ccab-403b-b426-9c05502bbd1a@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 09:42:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>, quic_carlv@quicinc.com,
 ogabbay@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250408115237.428985-1-tzimmermann@suse.de>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250408115237.428985-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f93879 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=HMLxokm-dE5sQ3OGyH8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Z08zmUim4vpXGkGnIFhbsqguMzySnRlR
X-Proofpoint-ORIG-GUID: Z08zmUim4vpXGkGnIFhbsqguMzySnRlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=901
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110100
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

On 4/8/2025 5:52 AM, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Applied to drm-misc-next
