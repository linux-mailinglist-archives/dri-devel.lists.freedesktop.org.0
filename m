Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F9CAA0EDE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 16:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45C810E4AC;
	Tue, 29 Apr 2025 14:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J12JJMR9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8191010E4AC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 14:32:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAJdeL011895
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 14:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bPriHSZx3KQJP/KsDQOWzlOT
 mChm8sjxQPQzHrr/5WY=; b=J12JJMR9Q7NMWgxDtjREBVcwp4RzpJ5+02SMlUX4
 qVgDGXteJgupzg7oZ5a0Ewx2671aEd1SzhiO9/H8SGrnSsAstywaK+KnSTQCzMKm
 OzVftgwcJoCv0VCRLjooCp+6O4EDafmLLWX51ffh7cYkAScLWyaM0ZePtOWz8/ya
 Wj6QrtpRz0croBpfkTmRT63iScrCDoUAgHAan7vVwxILXq0AbfMLgLYiACH2GKKZ
 G0eyAoprIyDtOryovl9CY5A80QgjWUwM2hdCS+PhY00qa6C9kcwh1dGR0ulSkhIj
 lnAzHx9VnmbmM2ECcHfPNQIhrus7mEpk/56biYdFgdo06g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q324sg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 14:32:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5c82c6d72so986203685a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 07:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745937163; x=1746541963;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bPriHSZx3KQJP/KsDQOWzlOTmChm8sjxQPQzHrr/5WY=;
 b=Gr3nJvXh2Z4kQbgzLw0oZic2ygxYeCgQNBVbY85OEQH5Eqbqupp8RTogth6PWkF6en
 QessKA6iSb9SVeAdrvdczOZ3vtOWEmbEYHuzE6/zaT9QVTocGRKHgt0iH0IB8PqqLwsx
 Zzax+6E8GCDDW0HP7NeezrndcU2WTtAlRDxgZdJhO4wjTpymsIfiBQvzzu6nOh3sSWw/
 oVvw+Pmi7u4OoBsQBXE1Z+8d/SFK8IG/wy5bek8y/2sRdSRr6QaU5VnihXgNK/o8MbJg
 2NJ3Sq6KGcNhB4zV0UxtDQfNXZn71CbmBm/lcnL7NwTpe01w0a1vmnjhImtLWxVV7rgY
 iOhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQNMeaSLM+2e26iI3egS0P5UQXyINSr5jChi6xp0cDFWPap2jJZysXMdBDBqIhyL6/1anXt6UtLW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygIY3SKcATvs+ImCD57EiSiRa2i6xlib1nGwTG2PSdkq/tiynS
 rgzm/jdrWI0IENBVL28/h5S/hNPlctKcmVPfjQCM/nQIsH+PlznlWKqL/eXHwvYk3fSJsD/9Re6
 San80pEhVIaKgOh5anLpffISxM25KegRQs7gTmfa9cSbahoc3tj7ADf++Qhe+1njx5fY=
X-Gm-Gg: ASbGnculaLEE7UdRmGGH+NRuE16Q1rbX0IAeMYnn9Id2IpPemWbQx0PCkhrbsaWxW21
 fXhGlcSFXj3m+xT0//vk2nyPgyirnN8WVnHEaXMkOZyFwO4Fzimo9f0FL9HfBcpPjoOt9DnYYLj
 WwWacZ55eKvkrBT6skV43nlU17jHieKfj/qi8Vv8u7rbNsXjj6m21xbQtA3RFNZecYGQASQVyr2
 VxQLGeWK7i1jo7MVatB9TVmaoBYBB1ymU/503AClg8qTVEeqJamKz4WiNc8aKel8+sTQddCHm3j
 sPxitNfBDSk4C/nnX/7cQFInHj1S9LTVAATbzcFUyH4l8Urwp7v3AlupwnGUCKDgAwf4B/Z+fUk
 =
X-Received: by 2002:a05:620a:3184:b0:7c5:5003:81b0 with SMTP id
 af79cd13be357-7cabdd823cdmr635637185a.23.1745937163019; 
 Tue, 29 Apr 2025 07:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWF2xshAzyNqq5fdOAsbkOvEB3opt7kXShCLYeUNW9cmZ74LfQEMRBALbW7HQGg1CwIOtf9Q==
X-Received: by 2002:a05:620a:3184:b0:7c5:5003:81b0 with SMTP id
 af79cd13be357-7cabdd823cdmr635632385a.23.1745937162672; 
 Tue, 29 Apr 2025 07:32:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cc9eb8dsm1880507e87.135.2025.04.29.07.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 07:32:41 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:32:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v4 16/19] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <oibskwq6gk234lu6bymqlrtgt2yd7o4qbpk46snhba66uqbupi@lwwcfmgp7bul>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
 <20250311-b4-sm8750-display-v4-16-da6b3e959c76@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-b4-sm8750-display-v4-16-da6b3e959c76@linaro.org>
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=6810e30b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0cLWEtKbF7AIdJ2SciEA:9
 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WV_FdMcFcG-VyK3TfuLKL7Jx04J358Hu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwOCBTYWx0ZWRfX8MdXyn4pJZEU
 KaZ7c2IwtjFkZKEY958aWVYltYv1XqHqI7Eqc2pNYV6UmXfWLdi5gasYbFVac9od138DrkpfiY3
 KpvQg/XBSbx3Idx5OlPBDoJrrnryajZaWiOhxosUYZOU81R0g55JU9HA9y51lBYv15vLfSIuTj+
 oEhF9a03nFB0M9IrhGKcI6d/M/wQ29y7WIOhv6L7Blm9NYX32RowehNwHN2yPvw6Oag8qOkXkP5
 M9Q0u7EZri1Ns/Ko3C5BjjFSQoPNpnHLim7gtLZb9LAlIUqnxKDiGAva0A4WbJCRUtPps4yk4EP
 MB4vim3Vw39x54rYASifczi4GgIMQcbAc0x2xyhjYplmaBMNuSci02r7O9cpVYxNj+vOM85udDX
 1ZwEx5yOXGEZNoM/zKPygaQg0EB7sClexPEmTBf2Sv+YqnRhUCGXY/qS2J3Ibn8bChMxfKEv
X-Proofpoint-ORIG-GUID: WV_FdMcFcG-VyK3TfuLKL7Jx04J358Hu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=905 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290108
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

On Tue, Mar 11, 2025 at 08:02:06PM +0100, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> differences and new implementations of setup_alpha_out,
> setup_border_color and so one for this.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v4:
> 1. Lowercase hex, use spaces for define indentation
> 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
