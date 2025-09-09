Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55345B4A5C9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 10:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6155310E663;
	Tue,  9 Sep 2025 08:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkE1o8KV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF1710E663
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 08:45:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SZVa023939
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 08:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Fa2kQFxYmWf21zOyKAAlQ46RUigKSHEniPLTl0DpNvE=; b=hkE1o8KVzS1Y7pef
 cxBBP/fMEkMfU37evIwBNfO6mpmoR+fu/q4MVQqOETTeaWOZvwcHIEGZYwGRsTY0
 +cfHkxArRvympOPyHk0/rH/JkRJhWTmha9EMAUaQ2QDbfwyrCLPAZxZjhaCAgMln
 2mywVmvvhLHGmMcsyzvCZeB0VCDKjzaD72JNNwXCXbV49vGI6oJxagiYHL2CbLjo
 4TRzj9Lfn4QPcxPG6670XG8xGBYISDjkVhEmK2KU9eazuBVzRdc4Ri8Te/X0NjfU
 sPL1WeTQREDSNkuONoAGpZXWsPLvC58jjo151qQUWi00Nvj0r/NYA0sQTPFxkWPO
 sSJQaw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws7p6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 08:45:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b34c87dad0so151718601cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 01:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757407538; x=1758012338;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fa2kQFxYmWf21zOyKAAlQ46RUigKSHEniPLTl0DpNvE=;
 b=uR3DU9sIoLRPDG/T5y0dXqqkWR2eoK5XIPBmbWG7gYlS8ln2Dhz+E6ZkhnDT51smz2
 CHwlwRk094y0Gay0OryUzy99u4NCibkCGKwHxxwwSrpf+EdpFmZ6hznkL40Pjb5/NfMe
 fbSIG3m28+Zzzy0ijSWNH5E8BMUwUSADfFLThfgKLpZ+zmNlXH+ZABbIZhtwInxKwfU0
 cTyMDbDzu3PFmbJgOb+TRhOwqAYX/0SKL35BdTgIJihLmacsNDYIfvSHI3Y8cPx8u7i0
 7mQjS73oRWu0qguOo9hM3hkVYYJYSIe0kKVMevcMbjLfXeicFvf02euKtbjC1msF0+L7
 SPQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8X3oFPx9y6W3f7HwvguJCQuz80JzHzzWFY0RdbptwRZIgqe6k3j0Stw79ne1TKGrmHIYC5l06bU4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZcKGmtbf7voW5A6vBrurFnjABHS+UpwhMLdiNdj7mCubOy0fb
 /hCGHrhpRObTYrOzLCZ5SjfsWjkz31Grf8+lZYfeotTECoBNF7ENylt1OWoZesMJJLcAWVWwugZ
 gUOyaUbiXnupgKMh5yUZWToHrWIVWk63gTMG2j4YUE3fOBY0G0y980WGkyEiOYQO8eSWyomc=
X-Gm-Gg: ASbGnctV8GLaUTFRPWjPRd4n+ZE5CSSdrrcQMfhweS3YxVwP66ejdKU07BBNq8hofuX
 0++MTD1smdGasjL5LKioOQ2Pzrpwh0R1ijIVSZ5Qtt3OJMcig53TjX6ZvqA9uD93Oq/2PbInaI8
 fLZEsjKCTpukbpnZ/mBzGx2GpH4X83stzX+B85Fftm0gh5OdrddAi8NFc3oUrXBUER1R6yqBLRD
 W/XBoOwzsRLSIIbjobtHlBVHYA7kj9bVeUXkhmv01pVr22HSRpw6ftMi9qI3N/c6Woacmb9N+Hu
 v8qf1DxvVZyS9iKhKV3q2cBEu6zfR8kTmvWrksuvWHGNhlaKqEms0fcYNlwAlXQ8CKf8xl9LZLC
 +5K12UdR97GdpedyKXEiU84Q/xHTTxd8MAnWBHXKAzZelxnW9+HKu
X-Received: by 2002:a05:622a:5e05:b0:4b6:236:3f32 with SMTP id
 d75a77b69052e-4b60236429amr79524381cf.77.1757407538520; 
 Tue, 09 Sep 2025 01:45:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER5hHlXx5UTU+e+w4PLfk659mk/2aAhqRlis8BzleBfAkcCxzbcmgNq7E4vUzOfp7AF/REfw==
X-Received: by 2002:a05:622a:5e05:b0:4b6:236:3f32 with SMTP id
 d75a77b69052e-4b60236429amr79524091cf.77.1757407537960; 
 Tue, 09 Sep 2025 01:45:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34715db904csm5157031fa.2.2025.09.09.01.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 01:45:37 -0700 (PDT)
Date: Tue, 9 Sep 2025 11:45:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
Message-ID: <3zi57uvggw3zgrj4bfouzjnf56yywjnw46f5ru7krihyrw5bkc@c3xf73ianksa>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
 <xurpc3mk5kksx7lfpsdqgasov5gc4dpsmz6iv2hjhsp5tewbue@dvrupbjzgxle>
 <c4eeb8a8-2819-4ac5-8dc1-cce209d7cbc4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4eeb8a8-2819-4ac5-8dc1-cce209d7cbc4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TUeXthP84tu2CMV2UOSMMqX5jJGdU7a3
X-Proofpoint-GUID: TUeXthP84tu2CMV2UOSMMqX5jJGdU7a3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX2PdXC7nY7ixC
 RqZ8G3mIp7Q7Rl/eVWxF38Sa0OSOBWRD+CRdGNM6tVWsoaHCv8+hfvhVwkvaJyCfTGA7DVx5Y1s
 2XxNwJZo7VRbXKgYjFW2QiJdTzlIU1lymla3/LMPtJddUl1C3JytlnvXqM1TfV+oNxssx2yuqKz
 n7dm41xuWZIGnx4EkVAmj7np5CQFr53BULYNI55jET6n0JpMr5lSW+lpIFu4rMdt90b/38Nbx2M
 8kgKsHrpT0NsCPN7MpLmgCAcfIsJd4kmNpVHJ9flsb1iibmxxFHKAT1Rxane1WnIbWAiTSMf4i/
 C0OQ5Adzofkh33Msr+fZnmKXG3sSaXvFfqXgdnqqkxy3lz5c+MeEtbHUFMioqsjZrysTX70LQBr
 +cvA5r8V
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bfe934 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TUuSr-ulYHZ9osfFkC4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Tue, Sep 09, 2025 at 04:39:26PM +0800, Xiangxu Yin wrote:
> 
> On 9/4/2025 8:34 AM, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
> >> Add DisplayPort controller for Qualcomm SM6150 SoC.
> >> While SM6150 currently shares the same configuration as SC7180,
> >> its hardware capabilities differ. Explicitly listing it ensures clarity
> >> and avoids potential issues if SC7180 support evolves in the future.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> @@ -27,6 +27,7 @@ properties:
> >>            - qcom,sc8280xp-dp
> >>            - qcom,sc8280xp-edp
> >>            - qcom,sdm845-dp
> >> +          - qcom,sm6150-dp
> > The DP MST bindings were A-b'ed and R-b'ed by Rob, so I picked them up
> > into msm-next-lumag. Please rebase your patchset on top of it and
> > resend. At this point I'm interested in DP bindings and DP driver
> > patches, the PHY part can come up separately.
> >
> > As for the compatibilities, I think DP on SM6150 should be compatible
> > with either DP on SDM845 or DP on SM8350. Please choose one which suits
> > better.
> 
> 
> Sure, I’ll split out the DP binding and controller compatible parts into a 
> separate patch series.
> 
> SDM845 seems not support wide_bus, while SM8350 looks closer to SM6150.
> But I noticed SM8350 is still configured as SC7180 under dp_display in
> msm-next-lumag’s top, so this change will mainly about the binding, right?

Yes, it's only about the bindings for now. The driver support for DP MST
is still WIP.

> 
> 
> >>            - qcom,sm8350-dp
> >>            - qcom,sm8650-dp
> >>        - items:
> >>
> >> -- 
> >> 2.34.1
> >>

-- 
With best wishes
Dmitry
