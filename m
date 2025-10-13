Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CAEBD2FF5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 14:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A4A10E32E;
	Mon, 13 Oct 2025 12:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXcT0qSB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386AD10E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:34:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D7QgMg013035
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gObp1VGk4sT3wo0aNUTQnaxb
 hlPxOaJ9VK/6dcghZLQ=; b=TXcT0qSBuY5yfp/PNTnIrw7XNb+s9/QYCReqou30
 gtIGh5w1O98le1QLr/UGIlqf0FRAMWKyhoiDDhQq/h5jYDxRoxHhe6PFGxmTGO4+
 iKvu+DfCH4bBE45FfhsCs0Kr6YXrVVfvxA52xvansO5wQ7lI0sOFFKbBRHrR6CF0
 h8H2/uLaBv/6+Iq89Xp4/B79JK/GTDI0ThFUGtYMDBywKpLJu8svaMWw/lmLFzZu
 R+K8n4dJuanKaKDQH7sH9oCVV5sXmIT25qvxdKQhxYsCoq+ieJP5tDS+KCFNMaG+
 OCfDv0LxPObPXHhVyDS8uCiV5xNtoVyaJw4sHJ0TQhqPDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1a8uta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:34:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-859df490f9dso1015788185a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760358893; x=1760963693;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gObp1VGk4sT3wo0aNUTQnaxbhlPxOaJ9VK/6dcghZLQ=;
 b=FBH0AQvthZsanwoHLY85QwdT2rHRjiXCMqTPePGOHBPNd8gpuTlbkd5zS5l+bxehAn
 P64+AXOb4qdYDPxWOxPR/N5P/b2rP3NYrDtcDx7qH2zenrK8SlvEBW+DRVN+wrVb9KQk
 Dw81lSCTMQu+tLBpmnRcuU34pcDrUgEr5Cfn6SQQzosJpZRSrsdv8axnzM2axslD7zuY
 poPsfmy/p7EdMeSeVrpn+oibMH/adStOK9Jejc+LHuAdqzEhwguVtnb3xIWTfKZPqKzE
 vvrnktzTV5HblE1PXxp4Xu48nsLnn9RQ2l8Laizs58E0jfHSLtg2aHplXX9toNAMNjq1
 wHQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8zYoouVPqaEour/r/YqFy2oADUJTcLeHoeK7oZ6WjW8rzzuO9gxAiwsTyaB4MtaEE0g5Z1Dpure0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT/2TptgQGOX+GjfdoRV77MTBFEsaFwaz47RHAAD85nCtX3KHV
 Qa0xdGZCHi8+zYPB6EoF+g+lMQa/0Frly8arebPpgE7oQF7efhspl7e6ZK+dwhUvISiOGqbIx4D
 e3ntkCAa9m2r7JYqYQjhuhu+dqNhsLmwlHlGJuqQkFhc30u/trQCEeGfYguqS7hBmaQTS6f4=
X-Gm-Gg: ASbGncvQXM582XppYgaJ0mUO6pbw6WFa4jHrt0+NhKioXdbpKksVYLYJWWH1r0/dfAT
 fUsLUiuK7OLAYKHApMy9bNBupyJDujwvM5L1GKJ+DstozYLgVy+kDjRmax8HK73UbFU33bn8vMh
 E/Q8SbNf/2rVlPS64/USUicQldUclue2hg7JIji9feTk2zXzVBdRNiKlK2deC+lCFYnNrRsBAUN
 TC3re3tEGp3uNa1NhJMJT7P6G5g73mFiTN5N3UO7j2R3wDCnzNX4xUFNLQ0E9ngl7N+5NWbEUga
 OWWF18onJDmR+coArWwGclbIfyHpDarjsRHRCNgtgkU9TEyF+qRz5fCVPi1H5Ab+BKZEls69Gmy
 318QUl+4Q6NhARxOuf7k5rKdSkotmkdc9k5lqQCRqLfw24pGv6mnY
X-Received: by 2002:ac8:5885:0:b0:4b7:9581:a211 with SMTP id
 d75a77b69052e-4e6eace7e6cmr280428011cf.24.1760358893370; 
 Mon, 13 Oct 2025 05:34:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5+lAIUbag3KQ/uyAYMUw2tzUdGLO9/5D5HdSvdyoQpY7sOU2YLiAsMhiWrQQX23CCsWeehA==
X-Received: by 2002:ac8:5885:0:b0:4b7:9581:a211 with SMTP id
 d75a77b69052e-4e6eace7e6cmr280427561cf.24.1760358892867; 
 Mon, 13 Oct 2025 05:34:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59088563b53sm4075703e87.84.2025.10.13.05.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 05:34:52 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:34:50 +0300
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
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add edp ref clk for
 sa8775p
Message-ID: <aifibm7pjva3rkb4gkzyxun46sraxyeh7jh6vgcirv5tsbf6ad@7f5bbs4ix7sa>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-2-quic_riteshk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-2-quic_riteshk@quicinc.com>
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ecf1ee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=yLsOkrEfH68IAt7CJG4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZgVug3cdCNlxdkxEkM3thxClzwrII_Bh
X-Proofpoint-ORIG-GUID: ZgVug3cdCNlxdkxEkM3thxClzwrII_Bh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX76Wg4v+Dqymr
 CwBNeBkWPlQW+VV3RgVi/Yp5E7/nepInl538TuSU46zh6nHqwRwA+VWPB5hrOoa7IWcyfWZOxPJ
 Kr2IhhqxbIpkdIJoV7hZsP0Jktcit54dyXQ0LHD/N9xXl4N6aCXSeY21OtTu/ricDQg3TNnlobv
 T/pIqNkxYmu5ZHPSg2ZAlLxNiYnqaMbUsL67URhslZrtLNlIfqKP/SPpImwUA3MDcqxWSLAJe7W
 5YVWm1RoapK2HYCwzuewH7p4tymSLSvDcweDONQh+yQgcpnOXe/tGYu7eAqiVTJoCwFIO/6h8Qv
 uJP9pJN//8BQq6jXpVMByHvUKRRsnjiNuXWhHWnErihjeNCMeRs51Q4Nbpplo5F+8MThBSFgzB6
 U0SGx8T0tGnNNoNfxgas3L4BK+Yh9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035
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

On Mon, Oct 13, 2025 at 04:18:04PM +0530, Ritesh Kumar wrote:
> Add edp reference clock for sa8775p edp phy.
> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index bfc4d75f50ff..b0e4015596de 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -73,6 +73,7 @@ allOf:
>          compatible:
>            enum:
>              - qcom,x1e80100-dp-phy
> +            - qcom,sa8775p-edp-phy

Usually such lists are sorted.

>      then:
>        properties:
>          clocks:
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
