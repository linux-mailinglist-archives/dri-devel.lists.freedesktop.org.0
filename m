Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD57B45A8A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 16:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796E010EBB4;
	Fri,  5 Sep 2025 14:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVUyYcmt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8074010EBB4
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 14:31:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58574Xku003172
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 14:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=j9ZApnUjN7UsOQPoKIdWyAJT
 kwjuDYwDGZ/yh60PLK0=; b=bVUyYcmtDDh8VETAunA3B0OectvFAsIqsWfiKlX1
 uOvQW/i78nrmmgu3q2BOT5h54wiVCDkEsDXwbOX7eg09RNa+PP56/nNrsBMPzcz/
 +FTUS1PaMFGija2DLNlSNn2Y05yWCxeI0JOtjYLaggsFg3ElLM2TyGjTini3OwXd
 oP+saMrRRtel3EmHg7pHx3TQpQQq7nZKj4Uo3ooNOkJXx+r+L3zEuocV1czHFLfw
 5QcmDd1X4bznBSRiB/vRAa0B0pkysBYJoYx+K8nSvLgFJwrtrcVrPAL9d/NKAPKh
 kbBV17PqOWfJ+FXoCXeBf+uL88iwnQPwWjl2Pcb3vZdFHg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush3b9u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 14:31:07 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-899a854e99aso630820241.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 07:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757082666; x=1757687466;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j9ZApnUjN7UsOQPoKIdWyAJTkwjuDYwDGZ/yh60PLK0=;
 b=v4t2ubMvsn7BWMwgo/vp2veVzzwAL3lgHoKXtnmlWNCLOc8tzExGdB3X2aziGyIHq9
 FnnjvA5yyj31zUTDst3gfTNJ4avjMTJzEBnuSdKkJ7MZC55avxcADYwNwt2kLW9Luk/Z
 FAok0Fp9jNw5tr4r8FnpGRLYXtiv2C4UekSCmKxF/KoZDutFQFpb5L/V66ZgWDnnWJTI
 Q/yt8wMGMGt+KnDwZdFcMijhsZx7Iroc5zmbQ+JWQvfvyG8aD/bXQnlpG4BvmTsVxRuC
 uJB/soVXIaZ/KcRhgUiB2tr+G8D39D6cgnBJjxrLVlsJR17BfphDng7lcrEEN8VkDsrj
 OnEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJduIeHdpdFXl0nqlGUfxVl2pA3QahuB/oWVFMUQaGapF0bdPj5S9BtN6fu4Q9l1VIcMoFCqxS/3g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypI4Ya+hDy1dBlRX/a9Bw4SUQg0wAkc/Pz1rgYoP7YIaCZJl3f
 Oo67YcF1GxBahcSYVkHoO1lQ9/WAFDOon1mbVZksrVV/kF5QvzV882LBMlRxtKSJz7LWVh+/gHC
 BavxNzAjkPj8CmXPxsLu/70DvspGVkcGhQgLDvYYf8mXU+ALjTl7FxUyRMCEe144yEWeFSJs=
X-Gm-Gg: ASbGncuPtoo/oiegUDbM++q8BcaueJpojXQVv2BV6YoQoRPh3OsZg7oj3jd/No1rkUQ
 UmirxgX2DRaJ0mGj76L7mbd8ke4s8OnnFI3nRAz7+fRwrthDMp0hckb6kV8QHZghVy3cdu0PWVF
 nBrJoYUXsoNm8EsYURZ1sutznHbsk6A6RLx3Lu7caVawguvkK81ZbIlGC59p5c9hs/omuj1/T8F
 1nnh3ejNM8UYp6E5GDIxb60Eie9lvTCTaxmuyj2Df9Y3ET34UUGx6sbwPEnvByvWTLFk0y7U4Pp
 Fl8vuaki3a9lojbDpoEf76H0jLgHePGMcv/10c+VTLZWKj5Su8s2kwJSPuf/4iJrfX7OgAwzYKH
 fT2J+eYyFp6KwYfdJ3zg3uiyFDuohpPyasLIkMmE6ijgLLFdAryT1
X-Received: by 2002:a05:6102:6118:20b0:534:cfe0:f83e with SMTP id
 ada2fe7eead31-534cfe10551mr3152017137.3.1757082666038; 
 Fri, 05 Sep 2025 07:31:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLl5AOay7y0G17NEbLZcAoeTfq3O897cD1Qf/UFv9YwhDugTyucF2mNCmpTGSNe50uSomnRw==
X-Received: by 2002:a05:6102:6118:20b0:534:cfe0:f83e with SMTP id
 ada2fe7eead31-534cfe10551mr3151970137.3.1757082665027; 
 Fri, 05 Sep 2025 07:31:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ab93363sm1816654e87.41.2025.09.05.07.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 07:31:04 -0700 (PDT)
Date: Fri, 5 Sep 2025 17:31:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support HDMI vendor specific
 infoframe
Message-ID: <jaqzhm6oi6emkpqrysdgxppfndge46x5hsarczplboyfaw7p26@o5nr7xvtrxp4>
References: <20250904-it6263-vendor-specific-infoframe-v1-1-6efe6545b634@nxp.com>
 <6i7eyxajmelu3x4ckvwifmizln6jzybt6ykpwlefna3k3noop4@e5zdvzor24fn>
 <023ae7ec-77a5-412f-bef5-105350561354@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <023ae7ec-77a5-412f-bef5-105350561354@nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXzZGyFLVhNh2/
 9+51kt71uxe6vsK33eJ1fZlSYSFhognQ9QTVC3/jsweQhnamJSAjOv3VLKfUl8GqnwXcK+Z8eYA
 H9btw38Qpocrp9T5EkuS5OhvT16vekgaKVBxQkQntdossUq8KPT257OAwrPYm1oTIKOv2zMRWOF
 gbhBEYE6S08HeU4KZK0X/TPTES9VkFT5JhBjsp7KHp2RDZ9+mVzhRfhsnNTr1ajWfiyjx9iM9G1
 Np/F/dDtQ2Kot+QG3aMjKWGBmXH+kHW0Kytm1Pb/7keI/R4x1JqcWEeJTDae24n6NlLpgVGJJwX
 KamkVWFh5N5GhGls75y+RUyB3s/6vm8mOkpEoAFMNoTSGpG5zUV2hLUaxNec/tpCjZ68Xbd6ceN
 BZJkBYGj
X-Proofpoint-ORIG-GUID: ETuVYvhUbwLO2vyg2iecmBkCGuxJZ98g
X-Proofpoint-GUID: ETuVYvhUbwLO2vyg2iecmBkCGuxJZ98g
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68baf42b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=Ns9eNvu6AAAA:8 a=QQB7br6kf_taGTjKchUA:9
 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=ST-jHhOKWsTCqRlWije3:22
 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
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

On Fri, Sep 05, 2025 at 01:46:56PM +0800, Liu Ying wrote:
> On 09/05/2025, Dmitry Baryshkov wrote:
> > On Thu, Sep 04, 2025 at 05:10:02PM +0800, Liu Ying wrote:
> >> IT6263 supports HDMI vendor specific infoframe.  The infoframe header
> >> and payload are configurable via NULL packet registers.  The infoframe
> >> is enabled and disabled via PKT_NULL_CTRL register.  Add the HDMI vendor
> >> specific infoframe support.
> >>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >>  drivers/gpu/drm/bridge/ite-it6263.c | 72 ++++++++++++++++++++++++++-----------
> >>  1 file changed, 52 insertions(+), 20 deletions(-)
> >>
> >> +	case HDMI_INFOFRAME_TYPE_VENDOR:
> >> +		const char zero_bulk[HDMI_PKT_HB_PB_CHUNK_SIZE] = { };
> >> +
> >> +		/* clear NULL packet registers due to undefined default value */
> >> +		regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0),
> >> +				  zero_bulk, sizeof(zero_bulk));
> > 
> > What if you move this to the probe function? Then there will be no need
> > to write those registers each time the infoframe is being written.
> 
> Good idea.  But looking at drm_hdmi_vendor_infoframe_from_display_mode(),
> hdmi_vendor_infoframe_length() and hdmi_vendor_infoframe_pack_only(), the
> payload length could be changed in runtime according to display mode's VIC
> and flags(see DRM_MODE_FLAG_3D_MASK).  And, IT6263 supports HDMI1.4a 3D
> formats according to it's product information[1].  So, it makes sense to
> clear HDMI_REG_PKT_PB(5) and HDMI_REG_PKT_PB(6) here which map to ptr[8]
> and ptr[9] in hdmi_vendor_infoframe_pack_only().  For v2, I'd move the
> NULL packet registers bulk write to it6263_hdmi_config()(i.e., it6263_probe())
> and write zero to HDMI_REG_PKT_PB(5) and HDMI_REG_PKT_PB(6) here.

Then you don't even need to write zeroes in probe(). Just write
something like:

regmap_bulk_write(regmap, HDMI_REG_PKT_HB(len), zero_bulk, FRAMESIZE-len);

But as a note: I don't think other drivers zero out packet memory. I
think it's expected that displays ignore the frame after the 'len'
bytes.

> 
> What do you think?
> 
> [1] www.ite.com.tw/en/product/cate1/IT6263
> 
> > 
> > LGTM otherwise.
> > 
> >> +
> >> +		/* write header and payload */
> >> +		regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0), buffer, len);
> >> +
> >> +		regmap_write(regmap, HDMI_REG_PKT_NULL_CTRL,
> >> +			     ENABLE_PKT | REPEAT_PKT);
> >> +		break;
> > 
> 
> -- 
> Regards,
> Liu Ying

-- 
With best wishes
Dmitry
