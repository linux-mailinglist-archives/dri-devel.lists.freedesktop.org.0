Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C3DB8AFC8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 20:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768C310EA73;
	Fri, 19 Sep 2025 18:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RodICOPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D1A10EA74
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:50:37 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JCppgK030586
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/zVetAH60xiLOOQQabWXMY2i
 CJqLvqOL6orH5OLF1Q8=; b=RodICOPTncKTFzokmFCdDNVaPBJJd6jTyD+ULkYC
 AgRUa2FVVGtGArGXg1DMC62vrdl8/5pxLVdSoHAsbZnuN+DeRZX83Jqb1GPzcTxr
 J1IHk38SJ4JlTHMBE7vJb9Nzz1w2IUfat+WPkiInnAvzev+8IGTWghg65ZKpcTfH
 +VpDg0MGjOnwUd1obLLgo2mPiGn/aShskL7qec3qnHXS2ttLvmbAF0UJws9swRnW
 OJsWBVvH/Jl4jfDjX3Kv6cJehSWn2hprDacPkGnw5GX0nxq1dHTIzj9zoGA+VYBY
 kb4PyzAGIArZkEH9FbNIhatiH5y/DbWkVO854H/++9QDFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49916x2chw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:50:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5e5f80723so43299601cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 11:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758307835; x=1758912635;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zVetAH60xiLOOQQabWXMY2iCJqLvqOL6orH5OLF1Q8=;
 b=rU7jgpZJg+ZXM1ebAXGI28oYSI8v+z7A8lKC4zSxORdvfzsrWcY+FJVO8HJS0yOlYn
 SKJ1WcHphc3tXX23ITITP3KrrarFBD3h1AjJYy0YbULMTDrPwii/F8Nb2ToFb34IYwc5
 aY7C0KHxSvf8+8Lvw4qJ8ZfRflE52NFGnrdbpCNDYk5xdy9El8fSGlx4HVy53W96/kO2
 NLl8Jq51OMjMcuA+ZWyK6bBwnSxnCdo1lbMuc/1pg8lNEHMHJTT0iTubAwUmin4I5tB1
 dDf8si6reO47zncdiM+wYaerTBhZs/qtECQsGx76SEit6Jh+vEhMbgbTFViP2eFK1lG1
 xZxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVczP/ZOsCxrG/eFREmvLNLIU14diVq8YfO9dVofIdPHbIp6j+5dj5zd0+VWMUJIxp+qkFBAx3JmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynV+GxTeDbMTi/eau7MvEgYKYx9a6+q9dpoA8rpcZPCmvA/jjH
 1BADTZ53rTNdXZwmP8Y89fKmaBXg/llkAKUqt4mlk/3ysAeNGnSfYsu7n8iaY03kU/RI5n55UmP
 XGLRL44HncPzjMbm+4GZsQcmT1MQykhw/4yyLuoS++Leqit8xvdpEXOZxZHvv8/vDASCbjwpRVA
 C3o88=
X-Gm-Gg: ASbGnctWu0NbsAlfKhE7CJOliP9lqDSHlddNbFIAbt5ASlVsB3Hd6ZQoRiSTXMuAEt0
 Sj867D45DRY5hf/iqxfxUBvRPxpeA7/MnVTL/0Q3O9kYgK5/DV+vAQLG2ztI/HLxQkmBF9dvfwH
 NyI5m4ro3Q5kHrjOoyvO9Z7TGCqEKb6wUD+e23f0zdRGunTuxqs6S3xV6TUm1ToRgO4jxcyDuEs
 szish74fdGD/iAtfL/qN+GGsKpU+APEj9AfuScoG7CPLNB1s3+W4yfcc8gkyqI8E0nhQZWdxScI
 7dF8gBujVR+mUF41m39bd/TNaZoTpKOkfhwo1FeC2u3tlQQ6BkU45cXmve5RVW1bYOK3a1SC5va
 fUEjr7jZl7CN5LqbUniyomUTu5/FnZqOJcytcoQRM+Z0D4ac0VtJR
X-Received: by 2002:ac8:6906:0:b0:4b7:a92a:fbe9 with SMTP id
 d75a77b69052e-4c074a12ea9mr50089961cf.60.1758307834879; 
 Fri, 19 Sep 2025 11:50:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHvM68mI4vWxxDdRyLwlfnUEBZv557Y2SOJBuuYk4+sFrbV9HcLthdAsZ2WBw6KM4yV7CgEg==
X-Received: by 2002:ac8:6906:0:b0:4b7:a92a:fbe9 with SMTP id
 d75a77b69052e-4c074a12ea9mr50089361cf.60.1758307834048; 
 Fri, 19 Sep 2025 11:50:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361a1e07947sm14292821fa.12.2025.09.19.11.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 11:50:32 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:50:30 +0300
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
Message-ID: <ibmp5mztq6ykktbtbhhxwvejwtaznr3m32u2t7xz3ujo5akkc3@gvdzchiu47hd>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <lkpcsed5wkyztbysmiks5xk3ojr3dw74ef65cpoycclxjmbnsp@5adctm46fc3z>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lkpcsed5wkyztbysmiks5xk3ojr3dw74ef65cpoycclxjmbnsp@5adctm46fc3z>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA0OCBTYWx0ZWRfX7bMWszEBUuNZ
 wx51oENdbBZUEqWxVYssEu5x7Z4g4cdeqaskYnSs8ydnxOOpuyGEu163oLSPNtahvjppArFn+Lz
 1lNMWLa596L3Q3XfT1YlDy9BRpYoWvTcpo3wHVRIRgzgxor0ZBf3H9vrPoAHPN8OzXr6NKDxlXK
 9IUUVPrMNtlUiQnfzg+jUktw99qXPp1IUVccBYyIXd6ET9htGuhrXt5xdNtyppGJPHStjIte5Ln
 hWirvLqdlEW7U69nsjzE7KsiA163xcQvRtWQTOTw2D/hj93+FJeT29kODN/5RzuEzCndeXx78AG
 rmUSyEGX858TZevCG0fJMI6uDCvLqV6r+3MoLi5u0W4RaODRMmZCBsPYfPeDJPDMIkPjPyonMIw
 u6I3qmIx
X-Proofpoint-GUID: 3OCtBlvQcXcQtZDsbSGRWP4q69v-q8xe
X-Authority-Analysis: v=2.4 cv=LcM86ifi c=1 sm=1 tr=0 ts=68cda5fc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8
 a=TzENwY7SnjuQWjFngvoA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 3OCtBlvQcXcQtZDsbSGRWP4q69v-q8xe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509190048
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

On Fri, Sep 19, 2025 at 03:41:56AM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 18, 2025 at 09:28:52PM +0800, Jun Nie wrote:
> > 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> > And 4 DSC are preferred for power optimal in this case due to width
> > limitation of SSPP and MDP clock rate constrain. This patch set
> > extends number of pipes to 4 and revise related mixer blending logic
> > to support quad pipe. All these changes depends on the virtual plane
> > feature to split a super wide drm plane horizontally into 2 or more sub
> > clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> > whole drm plane.
> > 
> > The first pipe pair co-work with the first mixer pair to cover the left
> > half of screen and 2nd pair of pipes and mixers are for the right half
> > of screen. If a plane is only for the right half of screen, only one
> > or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> > assinged for invalid pipe.
> > 
> > For those panel that does not require quad-pipe, only 1 or 2 pipes in
> > the 1st pipe pair will be used. There is no concept of right half of
> > screen.
> > 
> > For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> > the single SSPP and its multi-rect mode.
> >     
> >     Changes in v16:
> >     - Rebase to latest branch msm-next-lumag.
> >     - Fix IGT test failures.
> >     - Drop patches that have been merged.
> >     - Link to v15: https://lore.kernel.org/r/20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org
> 
> Thanks. It's too invasive and too late for 6.18, but I've started the
> test run at https://gitlab.freedesktop.org/drm/msm/-/merge_requests/191

JFYI: this has passed the IGT testing, so it will be picked up soon
after 6.18-rc1.

-- 
With best wishes
Dmitry
