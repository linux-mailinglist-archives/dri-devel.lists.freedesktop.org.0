Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D207BD3010
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 14:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B2310E2A5;
	Mon, 13 Oct 2025 12:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZ5vOFEe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EEC10E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:35:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAcOSm021490
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=m7L3o4Pwi86bgIe35Awo4E+H
 exJtX6srm8LE+iq3Tr8=; b=jZ5vOFEegJlPQpNfq3lTwLEnKM2Ukq9nwYbVRsfM
 XsN1rgjkcOX8zxZOxM4o45s1FEseh78LcztQ+fmeRqquEGP/39OkDCXLVDa7q5La
 +lRHXkqajUk2aR8U5D6n9Q4SmcC+curU7m0ND7GTQC5kok+JNl9UM+1kCXAcNKLS
 /M2Uhl2bsPfo6STYYZ44vvKVk8RCQ8Q7xUEN4KC9RgNujHSfHGJ34ZHFd5WyoDPs
 TgwJbgrZXjTmzbhY9RrZaO52pNzB2GdwdvioGfD5A2X6CvSBGDBZbSoKQ7KA4V06
 BgnMfkx6A4D1htxF2nQFc463c8jd4TBb1b9yxdtas3Rnog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgh64er0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:35:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8544316ef6aso314112485a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760358931; x=1760963731;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m7L3o4Pwi86bgIe35Awo4E+HexJtX6srm8LE+iq3Tr8=;
 b=kxQb1sH5rjSXVVjHQBrJh8LtNSlkmNoN1mz3R/X6N5z+31OFiz4NUhZkkHZfDkriTi
 OPk4Cb1u2f0UkoLLk08GifFAs4y4HXdntPrNKAfmzevHvYQGMbcQgOSF7LPzXvayP3MN
 0j9ArXPjcyK5u9ayCrpFIJePd2OZvdIaeUy1LVsw6ijuB5PA2nfzygcevo2sUyfu8RAT
 r9LgmXMpVsd/nbeWA2ivhSWjAubz5+EvP/m7RaCeK8OaiJxrZt1IAf9jo3uV68e2pl4j
 PK1Pw3b1hbZAUdVitjeMo1KPmU1LMgtc3IGkvuhYjdFJGCDW2A5SNrb+0VHAQWsLJIst
 W5SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOrg4ZIudaPLtlFYyTlJxu+NX3Sapzq9shcoOgRPnUC7YJT+ls3Akm8eWppQWk27UfMHqogi0hHLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS54G/jzIIInMlxjLdRXA3uyDF6PnNwvF49YocLZmbscZpjMNn
 pKDd13i634zAVOz+nejUTe0DfNzt3c/bU5y0uijg9M9jh76HPc0u28NpWPICiv9ZkH+pedktB2G
 4hq48mRioGz4KVAlFM/dqJ0r/pbPtrwJd1k6h013Q/G8jHWpDTOIzAsQ2oRhoYS6IcFdz8ZY=
X-Gm-Gg: ASbGnctu37vzLX2zuQuXFUqTjna2GtaKMOsryFgn6x9TwC1Ls63ukraurBT8I5nehqE
 h0NSYEK9AfwxzO6DaTAv0Cbyql58WjOJDIFMzug6+dfrh9uslsEytIuO4pTF54HXFdlSG8/Ckdl
 aTexr1l0j5d0kYtppPwAqrLYlD7fLtN2JS1b8WjvGhxO8vYCJ4v7cmbztWKUX+91j42zWgL3hF4
 u81TkQWRyf4UAo/ZjFVuEbi9ePYlcBslOF6iCCswkHFdr/zEbdNgga8VfyYGLc3JxqwK8/yIWqn
 XlQNJFrRe+BDgZGP6Uqn217jipd7qAecGRrdrevA+/+kWGQeY4MyxK6QMt1LeS+0fhvhpOwJ3J7
 gUWAxxrkAZx7WU9JQ6EjcVvTwS/hVfZviBTVl4Xo14sD5Rzl+ZadK
X-Received: by 2002:a05:620a:4411:b0:84f:110c:b6ec with SMTP id
 af79cd13be357-883546e153fmr2786634285a.76.1760358930995; 
 Mon, 13 Oct 2025 05:35:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtTA5MLWXtycAaJRA0YpGMVukU6FtceKKwRiGS0eYpqRLVEiT3h5hR82xs7c3USv5CsJzY1w==
X-Received: by 2002:a05:620a:4411:b0:84f:110c:b6ec with SMTP id
 af79cd13be357-883546e153fmr2786630085a.76.1760358930475; 
 Mon, 13 Oct 2025 05:35:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881fe5besm4080369e87.50.2025.10.13.05.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 05:35:29 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:35:27 +0300
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
Subject: Re: [PATCH v2 2/3] dt-bindings: display/msm: qcom, sa8775p-mdss:
 update edp phy example
Message-ID: <cjweltdnffozpi5amqvrfwikw3a4plogjm6ozhbf2lqee2neby@ueoha7dmhpgq>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-3-quic_riteshk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-3-quic_riteshk@quicinc.com>
X-Authority-Analysis: v=2.4 cv=H/zWAuYi c=1 sm=1 tr=0 ts=68ecf214 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=en-7mTTXfYbHl6GqnY0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNiBTYWx0ZWRfX881PFiuEMWd6
 MCF5hsCTs/657T+L0DSdZYjlMMVLHwXIuxkvsEsnYQJEWFQKVsobi27fVe6v6A1ooVyvqYB2Q2r
 anbGHik/2hsihfSju/SDKp145PIbWyM+MEW+wjudhKyn5OkjQyDftxVnPGNHJlVYFfqjL9BSn4n
 dKV3Y3OcThdQD+QJw6bWv85SEiDXsQFscg/5PFzjKoqnLSPc4GyzgZVXdElcjmMkVYBBj3kexdj
 UR/7oFayCeiqTkT82tpwvJrVT62bpaIb7DlUeKq2cM0mcj/c8qpZNJFK+W4LQ6PsG+kQonS7p6O
 PXmYrx0ZauhqOQr3lXMP2aHeDK8B0Hgf6M+EMPTHEwqNAM8ZYv9vHGKPJ9ty+JPBnk6Rw57TEfh
 GgTW3BZCfTithbSb7slHcRra3bNOhw==
X-Proofpoint-ORIG-GUID: 592Azj9dmjFMV_vspkHE_6TGQ7ZExMxf
X-Proofpoint-GUID: 592Azj9dmjFMV_vspkHE_6TGQ7ZExMxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110026
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

On Mon, Oct 13, 2025 at 04:18:05PM +0530, Ritesh Kumar wrote:
> Update clock entry in edp phy example node to add support for edp
> reference clock.

eDP, PHY.

> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml  | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 


-- 
With best wishes
Dmitry
