Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C841B87851
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 02:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8162F10E917;
	Fri, 19 Sep 2025 00:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbwM6KZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B2C10E916
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 00:42:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IIL3V8009857
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 00:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=c7p3i6sjQr+k5zoECzCA+ef/
 jRyUe4RBthVRq4DMzXI=; b=XbwM6KZOqXzyEz8KzdDURzw2BB7Vu91bxft5NFC7
 x9zLq5LP2nmwrXoz80c1wonccflMEroPzX0qDuWKgegirFU/fri/lHri9hNxIN4z
 F5jGzy/BvQGaUulzCYLbZ9p2qsnuRiq299ObLf6hhzP90mGlSzlusGMGQNR7fUty
 d/rNh95cDabvbOEc42qYYwBva4YqgQh2gTpnUaRsDDmP96XV7MxytIP/dpr7EO9/
 zUSzhY/olZJlzomaKnecIHPGTlxcsYrAXPiJ2ZgdyU49X1b25As5tT8xZX3XpmuY
 uewp+VpwHCOz8wnP9nKc5h3icSQETxBMHkRlIr8BfKKkfw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498q9d8ybf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 00:42:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-78e45d71f05so29933556d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 17:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758242520; x=1758847320;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7p3i6sjQr+k5zoECzCA+ef/jRyUe4RBthVRq4DMzXI=;
 b=XtWaJHI46UECTCu8YDfsXNU8obkXCxsBFBizTGY/v9cFnsFl7UdBDYpL986gql4ruJ
 UdzseBJK/Cg0fG4/9o5ahVLF42ortwUQUfD3HWkoMtoKwaTHr1b7RIo0FoksuXSzdTv8
 nR3Hj6YYi0y5mjO+cYepSaep32hKVIfXLGb3X7+Tl4HrDlcdIhZPARjMsaTSjuiIYxXP
 qsl2uK6w0zvvW5C9ZIZyu3gxA9dltfpbonK1QV45iJDq3WmEQUpSr7Pg3Z9wfzo0i6yb
 q5imw12vVD9eNt1OO2l8tGqS1uLi+MfP7dIlx3NlYGDfZq+d8fbG3HZaZ/J9IsktgIbo
 bTQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSMHuS8+SDGrcqSyI4Qp9pRkO0vffWFvPvGmxmdTY1UP19e7OXF4w9S+TpPey82EENwEz7IhmQDTA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHWNAnuGhIAIOuhe3LJYOeFvq1Sj66NjO/bc2wbhtRLrLS2j2r
 tkpIzTauosBJnWPR82N1hXvV4gwEy/g7RsTQnB+k/Ks40QCwwhHOJiByCEha4Z+XVcyt1xHqvHo
 roQIjCZxqWT6lYT+se10FNzSr5H+qyixPZctwu/ZAFatncV00GKhflxQdc1DzlvVPpdrzPVc=
X-Gm-Gg: ASbGncvryM3kFCJclk+gOD30B3Y84f0sBpk3rJFdwL7J4pZAlhtE1RfbXmoFuyctOIi
 oE7CC3ZLR8mz/Xa8Rj58xrE4Qq2ywR4j3IyJqHeo7flrMqtNHF7JFxaRFRYozS+u61Fk3uA34dG
 8jwdPv0x02XPe605FId9jSoO8wMX7M6+/1YxFeTpUwc7MI98wOSmy6nNE3DS6wGe2qdvjnajrmG
 gZhtTpO2sUMgchtDdQQttsujRUnFkkmNJlQq1PJ9LMeMB+Tywma3fWpKTxAougzyRpnu/QhPC3Z
 e4KToitUHDldkkdMGFMYJBBwChtjZASMk+ITfFA7esJnK+kw1qtTSRei7Y0bYt5Rg4qq2RCxnsX
 KmvzFckmI03YPV4bKsXBG+ya5EzgIyRg2W6gCoXN5qqaSyRkAh5Ek
X-Received: by 2002:a05:6214:248b:b0:721:7749:5a1a with SMTP id
 6a1803df08f44-79912a779a9mr17102236d6.20.1758242519510; 
 Thu, 18 Sep 2025 17:41:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHw7U/FdFUi2wArZIvt0T4wFtimMyyezA0YZtnzCSrMFgWPiguKlZZ7p/fkDAhwAWXS6MQZA==
X-Received: by 2002:a05:6214:248b:b0:721:7749:5a1a with SMTP id
 6a1803df08f44-79912a779a9mr17102086d6.20.1758242519072; 
 Thu, 18 Sep 2025 17:41:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a6507462sm1052227e87.46.2025.09.18.17.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 17:41:58 -0700 (PDT)
Date: Fri, 19 Sep 2025 03:41:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v16 00/10] drm/msm/dpu: Support quad pipe with
 dual-interface
Message-ID: <lkpcsed5wkyztbysmiks5xk3ojr3dw74ef65cpoycclxjmbnsp@5adctm46fc3z>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
X-Authority-Analysis: v=2.4 cv=YsAPR5YX c=1 sm=1 tr=0 ts=68cca6d8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8
 a=SLu1AeIDhlxv97n4O6gA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 1VNyMTC1-Jb7iRNJv_Cjzlb_HKVFYfxy
X-Proofpoint-ORIG-GUID: 1VNyMTC1-Jb7iRNJv_Cjzlb_HKVFYfxy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDE2MyBTYWx0ZWRfX77uGj/ewxk8M
 suNGhHBZ+FaLgf/F7svjeiJfWqQ41EiyJlJ3Dpmn5pr40/7i5y+wYed/j7sEuRSZXE254iLkete
 +dvmHfxpyUkloI6DQGaPXtDe4OCAauChwYOZ7SGbovfujM49EX/etj100pYOojNZfiyTpGh2ube
 xPsFTis45/5pL7TB/iz72nTNgdSQYKXMxW2xQyV7uB9gRPp/x12rAq4nR4kwCsCtuPhqNvFx+R9
 nGi5HbwbxeSns2BJHiNiogV65CQR+XxPVTUVMjxRGk78DqdjufIdFjfd8ietBlGT8bDthQg762J
 t9aaGiVqpJGBwxwghvRc2Cb+6oEmAGcl/lMQYRTGHB2soacjyy/Uxwrsf3eZuRQKYR9YgQbL55g
 kUL/P3J1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180163
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

On Thu, Sep 18, 2025 at 09:28:52PM +0800, Jun Nie wrote:
> 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> And 4 DSC are preferred for power optimal in this case due to width
> limitation of SSPP and MDP clock rate constrain. This patch set
> extends number of pipes to 4 and revise related mixer blending logic
> to support quad pipe. All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
> 
> The first pipe pair co-work with the first mixer pair to cover the left
> half of screen and 2nd pair of pipes and mixers are for the right half
> of screen. If a plane is only for the right half of screen, only one
> or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> assinged for invalid pipe.
> 
> For those panel that does not require quad-pipe, only 1 or 2 pipes in
> the 1st pipe pair will be used. There is no concept of right half of
> screen.
> 
> For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> the single SSPP and its multi-rect mode.
>     
>     Changes in v16:
>     - Rebase to latest branch msm-next-lumag.
>     - Fix IGT test failures.
>     - Drop patches that have been merged.
>     - Link to v15: https://lore.kernel.org/r/20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org

Thanks. It's too invasive and too late for 6.18, but I've started the
test run at https://gitlab.freedesktop.org/drm/msm/-/merge_requests/191


-- 
With best wishes
Dmitry
