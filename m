Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A308C010BB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7937E10E3F6;
	Thu, 23 Oct 2025 12:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="icgvQ3yD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C73C10E3F6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:16:37 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7CKj9006702
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4e4CsJ2qxbzcJTqFCSRdFwah
 q7xIbkuDSSw+M5pcQjk=; b=icgvQ3yDf93btZBjpIalqoLkmXnQ2pDi+Q1TVXRV
 539dPkpkFQMTkL4CilRdyArqe01KPg9kus6yPMaAgoU3BiOF1+UFPgTDUAj4PIIa
 b2278e6v35mn4pjjNchMDN5jUA73hHKhSxWMzox+hikwZ92oCwKbZLyXv8NccOX3
 Bmmpo7vFtSIHlmP7tNvqBMQpKJVH1EDTr+r7qU1Zgyfa9ug1a/81EAXYwm2lSLoL
 iAhIfY0qmYsMuS/e+9EXPHTOgLYRT0cFPKXIbFvMVGRHDOcpfhjBK9Jk/ZtlC4ti
 mbqEJbViiZq5MStIvSRkigVtkz4XqYINo3Lp+ijOhT46oQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j896b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:16:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-79a3c16b276so13972596d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221794; x=1761826594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4e4CsJ2qxbzcJTqFCSRdFwahq7xIbkuDSSw+M5pcQjk=;
 b=Cm9m3UmU99eHm/N/byq2qfFwwc72y2Gm9sCOxsfuX6l95B9R6J59JDuMsOg19W7xmL
 6DRS46hFdjUJZfHw4/87PxvN7RhGmgo3HCXLL5KeK8zMntQ7uymCLQ1O1Nz+MdlV+I1D
 fIRFsqRHZ1RN7nLb/jzFN/K+Jpv4ZFcIKyBTQSIKWOY8QFd1h6bTv4dv98681+31smCG
 BwLLJAKU5SpZOF5exSwNMzh9IlIaHtnjGFdxzt1ETLZOFKKWmGxNs7IAkCC+pc7tMgcU
 fIIJzvllvUizCUfuWp7uuHkaTwF/9GsaysYVzPXuFa8PgvvFMAlQrTPdcC55n542lgEa
 2cHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtb/d0sJkKfHutSgyLI3krHd1VxYYso1I1VfIemVka3ELhEVGtTBWszZ3cvCDllrnoBqAlWdsyjz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvB4vh9AJ+u6cDtPRNqaDULoq+PMzsenlsRmZO9/Y9jSFVSbDH
 w/4PEmLbe1VZb7jlgIJL4pkwT9JvdN+iZnI49xFOZjTc9InxrX9Kn9NCjXRBE/b/JdODziwc8Oz
 yY0KfwwDk59boQEo6hocD/yzSd02fKZ9qf/HYNQy94J7ou37X+riBgvwsJbb5i6anikmrKWY=
X-Gm-Gg: ASbGncsjTH5BkbKrqbcdmYvE+r552rulp2Kqo7O2sx5ulEQWNOJQRGPceg11Q/pH3z+
 XnHAi4nghooXmg3AmbaRxoVXP36NaCC2E/fsgHG1Qv2mAh22ecN95uvCdk9KPUPw3oglgoiwqlj
 lAQrJrkq/V7bYX+lPkJR1FEAHyNZCXv9UjFasLXDOq6GKvT/V0B83FHJ0RlTb1n13jp4yrCTput
 n7jEDN8HSD+30BXz9uDoS8VOhXqS1qzx+iANaJet6PnO/Ni92qIbv4ent2XpyjQwojnhJGzEhY0
 Fma7Xf0bA4xOoE2AirJhyXQ/UUiz6eFmnvQ8dxveE0ooCwUjgTzodzJa3bkSwN0/Nm7CQ8cpLtL
 cQY71u3p66zY97Wx8ep4AkIV4c8+Ihf8ciJBm6UAIfhRF/DZRfaTqBEAbOMgnhYOLk4cNQA+ACO
 01Vq4OICVakaOK
X-Received: by 2002:ac8:5916:0:b0:4e8:a9ee:940d with SMTP id
 d75a77b69052e-4e8b6848072mr186108411cf.65.1761221794259; 
 Thu, 23 Oct 2025 05:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGop9hpBDFFP1MrcMk2Fsq2TpD6+/75ykSiER9cOjUVWtI35/vGRfvOgaBCSCvXp2xBdGKtQ==
X-Received: by 2002:ac8:5916:0:b0:4e8:a9ee:940d with SMTP id
 d75a77b69052e-4e8b6848072mr186107931cf.65.1761221793683; 
 Thu, 23 Oct 2025 05:16:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4d38709sm678359e87.106.2025.10.23.05.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:16:32 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:16:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSi PHY
Message-ID: <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfXxH5yVHPOslSw
 qQZGUeEcRfID5L/XSp9qIjtl10O9xVL4WJkl3wm1UIBxy3Fi9f7z0qwU4+zD4PKQ9//Lom2j4Fe
 mseTHBbfwXEqrDyyh0bRh1+YrsiwG+wkXAmvAhsOLOM5KwYkGobuEReQqCtHcsqaF0a+6/s91Fm
 hhLEi91cdtWiU1ok9O6gKzC7Ov9kqu3v1GT0GukH2HKsk78EJeqtX6jngkE3fJ5wE5YLouI7kkL
 ovbvtVDsdvZaKQOqTkAu5W5T3w4zwvnb6S//whQZ39PDLdnYcWKqSFnZvyy35T5QJeQa53hyvfK
 kWPvlXcZaPPlQJ79BMqotqYVEHAgeiE0EfcINdlN4aIOjLq6qdkMiBObFQOaXorQP4kTIZA1cGO
 8qv3WjQ0F5408cGG+5mUAwpTECQOKQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fa1ca4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=hdgSSxsrCpB_R1hBYGgA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: NBIv9-AcDH8PL4TVRMmx89QHvl737iJv
X-Proofpoint-ORIG-GUID: NBIv9-AcDH8PL4TVRMmx89QHvl737iJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

On Thu, Oct 23, 2025 at 04:06:07PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

In the subject: DSI, not DSi

> 
> Add DSI PHY for Kaanapali.

Why?

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index 1ca820a500b7..a6e044eed3df 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - qcom,dsi-phy-7nm
>        - qcom,dsi-phy-7nm-8150
> +      - qcom,kaanapali-dsi-phy-3nm
>        - qcom,sa8775p-dsi-phy-5nm
>        - qcom,sar2130p-dsi-phy-5nm
>        - qcom,sc7280-dsi-phy-7nm
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
