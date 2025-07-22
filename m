Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31472B0D88C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 13:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B1910E663;
	Tue, 22 Jul 2025 11:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqYDjf2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E4710E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 11:49:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7TbpR019401
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 11:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=B5yI/2W/uYPNoZ/4GmFrmy4p
 o+IDogR9AhFLE+hirtk=; b=GqYDjf2t2uVqAHUeg3Vd+LkW1TXtE4eAV0g/7vUs
 6jHuV78xQ3CAewTGWj8qF74gcbU2tLapuvs3S1xhEeImjZySEk3Y2gK4z9rrXO0u
 mCcsGJ6zRqEk+KnldI4G5YOeYfwOySeckQ886d/PnjfQjenMoY4M2A8IbOZG7r5a
 Tm6MMDQqJlnNhNYX0r6GdNfUmymuA5eiVE5e/XP2ZYP2Ww6XH01/ujjG93SpMyNI
 y0FQhwkUbjYkZlurh8UQyjZqhpUhY+8vsut8KE9PDBbnAznLsSs/jx5/f7xUqX5F
 fF8ShTYqTp3rewB1P0XS2xOfk0JHgdSZlcrihCn0QKm8dg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9ynq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 11:49:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e33d32c501so1245574785a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 04:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753184949; x=1753789749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B5yI/2W/uYPNoZ/4GmFrmy4po+IDogR9AhFLE+hirtk=;
 b=Gsg5xqz1dziUysflVzyiN34/b4gr4s26NRakESzmXn/XfGYNAI1vVxnG4F/dxArhtA
 Ev0+OCd9bjYnzicBx0yMNqvf5wP7+L37F7jbwyO0gq2gOr08gX0P8hvuZnS3alHZLrq4
 fjWDT8GoUb2XbQvtcfUaqrCG1ZLW0JjdweH4SO5jS5zY2rf36wJOFhLa9I5VwlsWge9k
 1lyc4kacbNfE+kuynHb+rgRGVslN2meCRH/KNiiCLSNemQEHrU4jxt3xQ5YwWt8MsK9T
 o75qw53pPr5irpzeQ2NSxgqJiqgiy7t9YN7kYiDoQ66JMzhktb6/Yaogq7QBR9Lvpund
 eIxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVphvrCpPspIpn3pveM8CnYXc0Ps0IyIRYYTlps5d9snhZ+kRcTKFSoKTS7s3KwgIEL8s/XOCpza0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlBn5o/FjLxN9Sr75p+3Peu8pWfQI94KBzY99Jq2noGHU8Nu6q
 v6OvRtybXhvMh6IxH8MjN2zB5ZNvgwxPEV1UBi2ZW9kdJJPKBYspzw0CJc/d6DpoqHORx2fdB+R
 eodFS9msrQD2T5vU9S2Apasoer0+KXJzn2jL+oCr75XAHKLzvxIAw/IrHaYQ2g9vKCvX8uRw=
X-Gm-Gg: ASbGncurkBG5demanRXVnyLGUzwrSAgaM6mhmzEONn+9F251C1DBU77JF1atQCbxaG5
 sSIMt+4ErOXq57jAx9HE/9HhzrF6Nozpfkt3sjxVXxfJlwV/NBS40l5E59K4YnA44l+I48Wtgz1
 zRaczzK1JYH7lLZkqHkECxvZsupSjAwOxN1Q9MspevLEuCZaJgI7HKICRmUxIw4j2Of9anjcDds
 dhKMQaoIjhtkBmSfPg7VoW7nBV4LvWrZVAJ5y1ZlhOEdMY/kN/ayS0SvUhKR4nOHXd09WQU4prM
 WpmNsx+YlcZAVXau9SFPEbQ9QNQnGXKX15HmETT0cuVUauaQh0NKaSSWwJxrZlNOfaKdE02oMwl
 uB19KxEHwjCsaaC1WvR3JKjho32KLHPmSBBXu/w1wZKb/LSoJjQMI
X-Received: by 2002:a05:620a:318b:b0:7e2:733:542 with SMTP id
 af79cd13be357-7e3435e9e32mr3649940785a.36.1753184948564; 
 Tue, 22 Jul 2025 04:49:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEePpw0gnZfgOgD+EN9ULc+lx2jNFrznEEMSRNdte1hYVihbfjQ0YCdAjzvf6azH9JLj3QIsA==
X-Received: by 2002:a05:620a:318b:b0:7e2:733:542 with SMTP id
 af79cd13be357-7e3435e9e32mr3649936285a.36.1753184948067; 
 Tue, 22 Jul 2025 04:49:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31a9cb18sm1909407e87.20.2025.07.22.04.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 04:49:07 -0700 (PDT)
Date: Tue, 22 Jul 2025 14:49:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
Message-ID: <uh2lkqa26lavl4evsckiontkmjaiiwvz6jj7zjwylrfojtd5ne@ibk4ckgrsygn>
References: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
X-Proofpoint-GUID: _b2Ribq_KXOTN4R8teppxROpZwVP0zRX
X-Proofpoint-ORIG-GUID: _b2Ribq_KXOTN4R8teppxROpZwVP0zRX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5NiBTYWx0ZWRfX17B6vNlynXp+
 iUBN5ItuqhDa+auYWdKh13Mb7iyFduNjJKRX+/IukcsRsSHrI8T4s+VMQsQ6hp7Goza/qsFlh14
 e+lzPOUOYmTY119W6D8LjrPbZRyge1ueOrWtAzWh5wEb3n70K+cNg37mtgqtMWP401ewPfUn9gO
 DOIOMLcuBCn0Z0UX144QmmR8xN6W+xEW8HfcRJqV1j8xSyaAcJWSy85CrQk6w3ceVS4/er05wQ3
 /79fuAu2U89TDGNAnpZiMxixpujPDMlbvLszBcidgNd53ZnCSDBTeQoFW+6dEUlVHp5AGCz1JZt
 JbAVOBiZ7cvsi0GYs7FHaSSmvmfXGIcEQZPKFQTEpX1tnXinJIVV47PIfe/idx73Vxw/7LgzFZn
 0FT7eSponjAdc6F5Cl4/eXaBhv9ZNRTrQsKeOX65eKuvqZdxjeqRWtIwbBxDHlJ6zgDo4NfA
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687f7ab6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bYW4DojQpC9BwyScwp0A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220096
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

On Mon, Jul 21, 2025 at 02:35:04PM +0200, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> Declare the Bus Control Modules (BCMs) and the corresponding parameters
> in the GPU info struct to allow the GMU to vote for the bandwidth.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
