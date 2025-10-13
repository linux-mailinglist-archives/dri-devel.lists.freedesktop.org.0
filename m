Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D7BBD2FE3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 14:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CE210E04F;
	Mon, 13 Oct 2025 12:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHKE6Szt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E47410E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:34:35 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAUnv4023971
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0c/YLYaDMoEGnP2p+UDoLSwW
 bwVJnzjUv4KnwNKCfEY=; b=cHKE6Szt423RB8gknU+LDvdj0Cuw4qswyTZSaxAw
 3Vln1wH/aKoGO3yopYn8nbYnpcw2S5NHX7Sm79VwKwLYqcQLc+ZXI9mJfef7hziV
 AKyPZ2BlBcuN5v238ZNwTY7D5BQ55vFbmhOXJXLfe40w7C6yQPCZFlJkWD+9Scay
 ynngzBZIK4MUfj9Pj6V8NhLYw4l6QgLJ27bWbS19Ao6+8gDR/kWDmmWrjCyZLQJS
 Drz4A2m+5QZP+VC6nw07jEHuiMMqSvOsKt+L4sJGzjlqmM7rq0O7DHaJwuV9FO5I
 WjOXqD+QR0hcatHH0bdFdVzbAjOv4iTSBuOaVcQi0GtIuw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa84j3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:34:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-78f2b1bacfcso211138616d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760358873; x=1760963673;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0c/YLYaDMoEGnP2p+UDoLSwWbwVJnzjUv4KnwNKCfEY=;
 b=owGv9NtbLzEgqhSKbQfg4ZoJoWfYiagLedop30Q7EsIrd9geMgIg4DZmErAeaeRREJ
 SuKbI4+A+uUrhzhM9o0UmhzlZ67CKALy4RTbbYZULbbrXxRqEonWgt64EScRXViXUZlU
 mg2sdsJijyaCOzpr3oHbxj27LeDjRfbPDY4EmddeiEJFxb9dYkvudkC091QTyzuL8JgV
 DpMsTovlSGS6RC8dkawcrXbvECc/dvvPD3hRB2iyOoDyiUE59rXfb/ab2p5rF9nYZ2yG
 CkPeUN9tc2fyJJwjvy9xact07dEnzlCxCsTToP87s/FOmDpvjf39ocVt+nhiozZ9Iu0Q
 5XsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpil/DMiIlf0izAQ9r5U2FUesTE//E1TD1OHT6ngJpl1eSDiwnNs9DbuL7bbXlkURUPCD4wGAQMg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzgh4Rayu1atMPzTq1FGGDky2M+IJb7f1bG9RhfRBUQxtOob0+b
 f0zzxLVXZo5YH15diHvarFw6N0F3fg45FEU0K4Ri81GYKF5/bEidJ9zUWbjoyGWGcPA42WTZy0w
 5rTyh1zLM0UTOOf8n6WSIzWC1fIvc4vc3Uzt/wrclYf0eS5gyE9pqFS1yqR0UPBf6RB+dEN0=
X-Gm-Gg: ASbGnct/pmMtiqSBvfgR5NTyhjyzwQKWTtl/dIcLSQGWw/rHk1/C6Jv0H3zO2zgI3TT
 CUkDhOAekXoACnUUqlkUgUqTBIhBuXlt/omtd6YHYmMmRsU5CfbnI/Gs4VT0QJ4tH3rkkBsFKjd
 YGbIXi29ltGTgsIDQWO4e8m5tcb38kJPgku4mgijVDBe2T1CpTmbdGQDb7MW8rHarPH1y+FfcIz
 TYL5rbJPsci0PufaPskuIslH8u+lADnYDUrQjpgi77UCNNTMQQZUmdw7MeqSUZjVwWZf+bNzpm4
 YlCe/3/yA+xUi+s9ahmXgYPQ/PVLHwibcF37mwesI3cQqYDPIkqxvDUPtk/5Om3eWA90HCQG6HK
 Rs8G0jOtYsn+9m9X00lcyYI9qidcEuttJ4IcqRUl2lSdrFyoz0aWu
X-Received: by 2002:ac8:5d46:0:b0:4ce:9cdc:6f2f with SMTP id
 d75a77b69052e-4e72122afacmr71752531cf.13.1760358873385; 
 Mon, 13 Oct 2025 05:34:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNbh12YwL4Iy4NRipEsFChMHtKqDe+smfm+D7B0YFilvKsxmQIYfhkB/7L1zjAmITtmN+oiA==
X-Received: by 2002:ac8:5d46:0:b0:4ce:9cdc:6f2f with SMTP id
 d75a77b69052e-4e72122afacmr71751921cf.13.1760358872891; 
 Mon, 13 Oct 2025 05:34:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881f862asm4116608e87.27.2025.10.13.05.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 05:34:32 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 0/3] Add edp reference clock for lemans
Message-ID: <7jmk3txdrnit6zn7ufra7davmomggd3graizdu6wqonp3lljza@mfnxt2owpknq>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-1-quic_riteshk@quicinc.com>
X-Proofpoint-GUID: Hak8Uotm1IFjQZy5o3BCZOHBDSJWkWDv
X-Proofpoint-ORIG-GUID: Hak8Uotm1IFjQZy5o3BCZOHBDSJWkWDv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX5CVDh3jaAjpy
 VLHpo4BQXM8RvautsIwmCKjfbqL1ALhcRxdNRgTIXIYeM6tAh+UdwdVAq2epubiFrETx4c5Nebp
 8dqdu8RwIFnvkOboq/RH1gfdOJVpOHzg0w56wEZ5MkNpLcbhfIXbcruDKIiWpPgSsHb3Ny9zHzY
 ejEdMZQzxVWbtS1xVriZU8UUkqRWV1y98D10H09HXSmUw0o5v2S7wSxfaTkU+PLQ02GYdFt8aTo
 SI0yH9ggJZ38vGLKNDz5b4NQUwU1PPdDcSNmGqtiEq1pnDI0yFGKi0qRMAu1xUTCToJzqp0h00z
 BXZAW29kSb+cNve5oI5pXw5NdyxIeYN/EUnKW2rPq0TbRsFHzmZHVgau5l1N+JF0HSTKFshUhkW
 tc9DHPW7pUHACYT2sWuMRsv8PjEl9A==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ecf1da cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=sf-Njp88EExxdhEklOUA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
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

On Mon, Oct 13, 2025 at 04:18:03PM +0530, Ritesh Kumar wrote:
> On lemans chipset, edp reference clock is being voted by ufs mem phy
> (ufs_mem_phy: phy@1d87000). But after commit 77d2fa54a9457
> ("scsi: ufs: qcom : Refactor phy_power_on/off calls") edp reference
> clock is getting turned off, leading to below phy poweron failure on
> lemans edp phy.

How does UFS turn on eDP reference clock?


-- 
With best wishes
Dmitry
