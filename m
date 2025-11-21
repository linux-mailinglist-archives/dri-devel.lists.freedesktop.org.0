Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9DC7AE81
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 17:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8CE10E8E2;
	Fri, 21 Nov 2025 16:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJPRmsC7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbtCmi+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECFE10E8E2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:43:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AL9VvOl3048095
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=09MGYUy+aC++hYJhkqJKDpJA
 umAjMYKueV5atsqaQBA=; b=GJPRmsC7oO6yeYSQvm7n0aJ3wi2LduGMR3Xp2Yu1
 NndVPVzJCC3UFEdIUAhSl7YLwDCvTqKfBoSTvNkaVzUbs5qpMP7lx45947nZdGEt
 JGIkq0dVfU1M4V7OdpStEeJLcsiNZ2VSsa8VtrENVqXFS3zGK74cV56R+qqDXSVd
 O7fauNnnl4dhsEuymX91j6iu+8HXhvKkDpoAPu0Y8G9XFmzQ1EZ1bQa/+3fAKQRi
 CXFDLlz3QNZbO0LWgSu+ti9GLXuj3Fa79qEYqziV75at350GsQq9jUyFThJ/qELh
 ecd+NRnUqgtyQfooUUxCgPOdjEGbkmpPufQd+KogOvSFHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajnhjsarc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:43:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2dbd36752so683334885a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 08:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763743379; x=1764348179;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=09MGYUy+aC++hYJhkqJKDpJAumAjMYKueV5atsqaQBA=;
 b=WbtCmi+MVeGAeJZcODUinjtLafqmUZn+I6B507Y7b3F4Dayrm3rvzR3EK3uZ/YnTut
 /FTluUr1VIktBV5UGFCwo3Tm03k8GIqKOJhookQePd8RVUR8bQ320HSqMoqYj3kZLw81
 MPJYXD5K0TZx0zmp7dlZsz8VInIwAryeuX9dkGDF+6VTlWIvlu/e2BoB/U9P67F5Fe06
 Cp+404LQgqHOnnITbEAvLJOOqwDp/0Jh8xe0ljiqebwn8RkMyzk5+nqEsUWIVFNT1QOo
 Gw+uAdfuJ8FQjIW+fLlwberrttNZgSPNpxi9xOoMlfQUAPf1fGflL4sYx04d+No7s70L
 8TJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763743379; x=1764348179;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=09MGYUy+aC++hYJhkqJKDpJAumAjMYKueV5atsqaQBA=;
 b=f8HUTD+8Cx/D9wc/immrY3kg24kcVKB9JMqEiv4x9wntxyomGqg9+0hZ9i2m6fO7aG
 zn0PhNSU7RLlFU2yv0MRq1iD6EGa6WNCJ864KVTikFiSergPeLvqQaGJn9/gQtRuQVLA
 ioqfE+cdImha2vokhGojnYc+8lG8JHg6v2ybCKhZKtw4DvQLboCgA5dN5w1+hE/IQuK/
 SStSTUh83e2t0JPHL/2cG7KBIEtVJ2PXU2Rm22QJSGW+DrWH1GHVmbMT00pYfbHZwunG
 /1iNpMRjn4j5pS3L546q+HR9A0lcU8WWe0A/+Lhg8dwGQDInaLDahV+sFEB/PxG7eYrB
 tGJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLyyHgxZX2YZFQ08XouOpyCrfqVdGeQI17TbEpFS6vl5Y6dgmtYo6O4pRCnjDDBW/NF0chePbAVWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvCDRirpxtJn0lUwE/ZNwmNt+5Riu40gJZMqHEjelkXAi0+UYz
 yOGLg+wh+vbnB2qzi3Wqpu/FvFZDJgBX4N2nvhBAeuzvrVtWbkKK4YyvEh/atDZIUGuwDpmx7iz
 /D31/QUmwktfGBIFwWyPY8MjSAy4MzhxfAUsOZ9mmvMFi1FcalV0KWg99YMYat8ETNzTAl10=
X-Gm-Gg: ASbGncuJxHKXplfLdg7MLIH5rYK0zQ2pW9rSB9nbEM/SGrb56WTU5Q5xazULp4B8zfW
 XnAH8k4S9WgDTSSE4mZzpug6DucR/vvnzoHgOdJs5mv6bR9RQvPMXC3mwWESU7/VYBZRqBepIIq
 CN1B590Nuw0XhJl/dOIJW0vmsmgXtqc1YUkXvBGPDrXowRLbKdJYNY5/UzFZXQ93sh7Drxe5Yir
 BFMmO9F3Xiso6qeZTC+WpxLG8PtgRxi0rQtsNiGv2gEV+Htp89LAwUM55wPQGeanKejbbVplEdL
 IHAYqNR8ROuAn16SEkgfI6tCextOyqLT8DvripCGMGaNC+l2iSepgk0Q6t/aZ9FM0FXJEsPRml/
 l9V22ppcQL//lbx+jVujwziCii6gSumgTnQNwXAnsMSGEVWCGYMyew/AHL/vT9LhUJlbFoX2EbV
 xBi0eIAX0kZyN3hw5d/BYVWQE=
X-Received: by 2002:a05:620a:4494:b0:8a3:fa43:321b with SMTP id
 af79cd13be357-8b33d2639acmr332538085a.27.1763743379185; 
 Fri, 21 Nov 2025 08:42:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIkTPz5TB8xN3lLtop+PT42zQtIBGl03bkK0iuHS9jXAS96lGvlh3BNb2mfJskgsh+6Sec3w==
X-Received: by 2002:a05:620a:4494:b0:8a3:fa43:321b with SMTP id
 af79cd13be357-8b33d2639acmr332533485a.27.1763743378634; 
 Fri, 21 Nov 2025 08:42:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db74711sm1761230e87.12.2025.11.21.08.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 08:42:57 -0800 (PST)
Date: Fri, 21 Nov 2025 18:42:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicinc.com, quic_amitsi@quicinc.com
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
Message-ID: <vc2hen5r7xdaj4nepkoy7pk2jmj4y4hgog5o2nfndrff4yti2m@g46svhsdyy7m>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
 <5f52beba-fca6-4dc1-ac6d-ec0a771a291e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f52beba-fca6-4dc1-ac6d-ec0a771a291e@quicinc.com>
X-Proofpoint-ORIG-GUID: hLJX0ZMZUkzOtxBTQaoUXNpr8mSx460_
X-Authority-Analysis: v=2.4 cv=SPlPlevH c=1 sm=1 tr=0 ts=69209694 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=WPgZoJjWRBIEHdDhQE0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEyNCBTYWx0ZWRfX+QVo9AM0oK/v
 iHgAuj1bdd2W0fFEZOZ9sxQlgRIZ6NoUkZa2P71HMSA91PBqj9EpzxWH/yfnPvenufPOfYo0duA
 eJ2bgNjT5ktZYEtoT62ZW6pFlneXYxYUQbbsp+S2SqhV+lLgAFAtBXXucVqWDbwbzcU3p5ycXDO
 arAmEIE4g4Lco6gqCioPYvN3oHUEjTYjTu7QN07Z2V0KEyw3cpv5CCLa03mXqbRK5lXDonCRJ8Q
 HHgX9Z09ImSDbjG2I9AsQxh1DXG919BDtW7UrhDq3Zq/hiL/pLHgJI7gmObYJZjwtbxmjabk8aM
 2JOBRqSkUz+XmEMVVyzoo6b+iEKWgieQMBRFicLIfrEVqeSkDxmSZGUvsZZIkjBG7iCrWxeX3Sk
 byOZnjobe1OLctruKRhnI76Jjup7GQ==
X-Proofpoint-GUID: hLJX0ZMZUkzOtxBTQaoUXNpr8mSx460_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210124
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

On Thu, Nov 20, 2025 at 02:25:01PM +0530, Mani Chandana Kuntumalla wrote:
> 
> 
> On 10/8/2025 6:10 PM, Konrad Dybcio wrote:
> > On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> > > Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> > > with their corresponding PHYs.
> > > 
> > > Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> > > ---
> > 
> > [...]
> > 
> > > +			mdss1_dp0: displayport-controller@22154000 {
> > > +				compatible = "qcom,sa8775p-dp";
> > > +
> > > +				reg = <0x0 0x22154000 0x0 0x104>,
> > 
> > sz = 0x200
> > 
> > > +				      <0x0 0x22154200 0x0 0x0c0>,
> > 
> > sz = 0x200
> > 
> > > +				      <0x0 0x22155000 0x0 0x770>,
> > 
> > sz = 0xc00> +				      <0x0 0x22156000 0x0 0x09c>,
> > > +				      <0x0 0x22157000 0x0 0x09c>,
> > > +				      <0x0 0x22158000 0x0 0x09c>,
> > > +				      <0x0 0x22159000 0x0 0x09c>,
> > 
> > sz = 0x400 for all 0x9c
> > 
> > > +				      <0x0 0x2215a000 0x0 0x23c>,
> > > +				      <0x0 0x2215b000 0x0 0x23c>;
> > 
> > 0x23c -> 0x600
> > 
> > [...]
> > 
> > 
> > > +			mdss1_dp1: displayport-controller@2215c000 {
> > > +				compatible = "qcom,sa8775p-dp";
> > > +
> > > +				reg = <0x0 0x2215c000 0x0 0x104>,
> > > +				      <0x0 0x2215c200 0x0 0x0c0>,
> > > +				      <0x0 0x2215d000 0x0 0x770>,
> > > +				      <0x0 0x2215e000 0x0 0x09c>,
> > > +				      <0x0 0x2215f000 0x0 0x09c>,
> > > +				      <0x0 0x22160000 0x0 0x09c>,
> > > +				      <0x0 0x22161000 0x0 0x09c>,
> > > +				      <0x0 0x22162000 0x0 0x23c>,
> > > +				      <0x0 0x22163000 0x0 0x23c>;
> > 
> > 0x2216_2000 and _3000 don't exist, there's no MST2/3
> > 
> > sizes should be changed similarly
> 
> MST2/3 is supported for MDSS1 DPTX0.

This is MDSS1 DPTX1

-- 
With best wishes
Dmitry
