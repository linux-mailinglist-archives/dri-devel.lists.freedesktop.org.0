Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129BBB04A97
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 00:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE7110E0EA;
	Mon, 14 Jul 2025 22:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAIJedhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4549C10E0E3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 22:28:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGLAK4008069
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 22:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=g58Cwy9wjp0YmHwQ5wI0oyKa
 mpOyzB7ETzY1FZOvoHQ=; b=mAIJedhUanJ7jP4mKdvJ6tRPoyd+7plz2X6m9FbV
 Zvhr2F1k9wtyF7hxTZgtRf1/0wpipMaTjmq9HwzAbzetO/xoNaNJMlhQo+kZNjZS
 XyXIY6tEEBBflXcE48EiI9I80vHVn+tAuao51E658I4vlp0RveJN85MHvtdEU/7G
 4heeLbD94Xovb+zTwgmNZF0PBkDpdjFO+JV7e4KFuiy39CFgGzlUrgXjmhc1JgF7
 oW0NwgUUzekoS2SPs3W4j9bD08v44m8Cq9jp+r3++vh9ya4GXmdaK0wDZ/BryP6X
 mSURlvxegggCAKZdLXbilUSadw02PS7o1z9AOS/r4Xb0+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37x5nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 22:28:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d44d773e23so1080163185a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752532091; x=1753136891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g58Cwy9wjp0YmHwQ5wI0oyKampOyzB7ETzY1FZOvoHQ=;
 b=a6wyz14Q36x5r4vDRY2EwnUGgN2Dl9/EDoEV+sN+JCuU4eRN2AqczfER3GtaKxCHS1
 z5uAfXa7UBihX3YYfDLQJ79xXnGY4pa0UUeZt7Io7eoEMxYrqrH369IKyai6iLsihZ4L
 cbke5gdgwcA8uJ+4c23vCXXLtP99EV0heNxqow/bpi1oA8OEDCjMmv0LYmhYxyQRwjv1
 dPT6QH4ZM23FkANlQ3bYcsv+si+mwK2t39pudS2bg1R79GU4YRA5Z9XY1hJX+TcWgi5v
 LsC0Q9xY9QygPlZ1nRj1jA2T/gznGbJhlwozr2cCbm32eXF3AkpbrrsLlSY2OeQX0Ldv
 a91Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj5FDewRAlf55nonBRyrgCjWj13bRxGm1/u2luCkp3DkWL3cIcnp4fS6c7F33ui+woCBZEz7GWO38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7VrgJMoQ1TyfWDZIjwoK8oa0QTpxAeWw7SJ++Woi5XX3KICkz
 KBB1Ag/o4gyQlG8lKkqmVfqWy9wGC+9KTbfLNn02H1CG7PjlGD0ZZ9uBG3gb5tvL8TIPJiFouV9
 f+pO5V+oKWR6esX5sXUP3vtCtuaAsNq+SJv5U6djboAGdVBxEb5UXXhvbqSYHHGgYleKsXBQ=
X-Gm-Gg: ASbGncukFv/Ddk+NNZG3nN/LIRFEY8xUOQ2hsHIAx6JEoU13qXopQTewGr3OPu6YsKN
 9lVcC3DaeixRGGJzHBn64Oe5CVBCMxqPj/q8GTmS3pG6wIhYpURiEfXQM/JnFwHlip99JuB8QZR
 D10lgj2Nn18nzPdvaj/df2Z/2sj0SOZCBEPOllxhSnOLzof7FEkHAaiFLnbmoyFu5vU1A2GrgBI
 vfKvPL/TGOWIHradR75+g7BZWYZ0Yny+rharRk3WexS9tvKml+f6BTyMbKq5+1cC1Y/s2w/mg8i
 hz2hxJxjx8X4ZD+z7gE6u4IIA5grORB4zHS0+SUY+J+JV3aMwE99pfj2adtYDPf9EydCtDpwY9/
 ZgdhJuciFLT0UeWNJTNfCnmSXeCmrGs6aIIgGzl48pI32GwMGfER2
X-Received: by 2002:a05:620a:318f:b0:7da:e6e:dac1 with SMTP id
 af79cd13be357-7dded000eb0mr1982780985a.58.1752532091235; 
 Mon, 14 Jul 2025 15:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBbqen6Ycp/DBPIss3IXszYn/5lvf6AcTyj9CEOFH1Zo5pXcdZ/lkHLybnpi1M0aIYwXscAQ==
X-Received: by 2002:a05:620a:318f:b0:7da:e6e:dac1 with SMTP id
 af79cd13be357-7dded000eb0mr1982776885a.58.1752532090674; 
 Mon, 14 Jul 2025 15:28:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b72f68sm2093423e87.203.2025.07.14.15.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:28:09 -0700 (PDT)
Date: Tue, 15 Jul 2025 01:28:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 04/19] drm/msm/dp: replace ST_DISPLAY_OFF with power_on
 in msm_dp_hpd_unplug_handle()
Message-ID: <ux7tbizguenr33odq2utqdrdanih2ez6gvm2dcss37uuo6pi7y@qnh4rwrgqept>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
 <rmlgjr3fzb7dmnwmthf5bj67wb6fkcksmn3ouchzsvhhgxiv7h@vwcieejcufr7>
 <6883f346-452a-44b1-b670-3bd514f57b08@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6883f346-452a-44b1-b670-3bd514f57b08@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE1NiBTYWx0ZWRfXy8jYyHKF5Jxf
 /uEFcU6Hc9uRN0mglamd9lLdrFr4cQIp6wDd8LvQuCw0qgqQkmelSBRhQrwysaU/EHveH+uOjD7
 5lscMjVCKwCrlifU+Kq3DBj9lpEpXqTxg0FF81mQP6uejLuVYDFwbhfJMgmsXRfYYUHyUjrjvAh
 ldWNGsAwaZp2ChGTFcHrC8BLbZ/QddwDnZ8JwIw8wjzYunleyy6oDvle+i8wgnfDxakLTNTFREN
 v41jBc2S8JoF1dU8+bt+jRnukyVQBRJJ8IDZ74z8IoOrlvXNFJH4xba5BzTdIP4LSHbOfBG2k8B
 KkjIVhSqs/36sBs+vAwHWYylL3GxCnl7c7tOtWH5lUIqul5KY/U+BOhcyOZQRntYgRgQxt5Ao+2
 y7XpnO6ZIoY/JRlKctOR6Gc2KoXzmqHHhTA1s5svJamkjwulOsEsOsvOPks+45DVzo6kVJSg
X-Proofpoint-GUID: Bo3HC34yopk9c76jLLpmnMUW1C5ni2jr
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6875847c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=V1oTyKxzMZC_ZlTkUykA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Bo3HC34yopk9c76jLLpmnMUW1C5ni2jr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=769 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140156
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

On Mon, Jul 14, 2025 at 01:38:55PM -0700, Jessica Zhang wrote:
> 
> 
> On 7/14/2025 5:27 AM, Dmitry Baryshkov wrote:
> > On Fri, Jul 11, 2025 at 05:58:09PM -0700, Jessica Zhang wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > msm_dp_hpd_unplug_handle() checks if the display was already disabled and
> > > if so does not transition to ST_DISCONNECT_PENDING state and goes directly
> > > to ST_DISCONNECTED. The same result can be achieved with the !power_on
> > > check.
> > > 
> > > Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > > Note: Taken from https://patchwork.freedesktop.org/series/142010/
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Please squash all state-related patches into a single one. It would make
> > it easier to review and more logical.
> 
> Hi Dmitry,
> 
> Ack -- I'd wanted to keep all the patches small, but I can squash patches
> 4-16 into 1 patch if that makes it easier for you.

I think it's easier this way: we get rid of the HPD state machine and
use flags all over the place.

-- 
With best wishes
Dmitry
