Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279CFB56DE4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 03:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0A410E288;
	Mon, 15 Sep 2025 01:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IVnqfOo2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131DF10E288
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:32:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EB2CJZ009700
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ST3b2cawpRPH0esQ1Wf7O32r
 gHyNnZ9xY4/CHojqj8A=; b=IVnqfOo2L2+IlbTtpVvJS9WC4nooZaTrPoOhUi3M
 uLZHFfd4HzCc5wup10LrwEZmNgmHNbEHApCOgQ1boxPLjo8B770uy0HNEJxEE2BC
 wWD4GA4Emvcf1WlzO1mTmuSsiU+YnC0D9YFEi5An29CVsAJExR769Xu29/NWhlF0
 OzM8MKcmwdM9+bhubbb/kntaLNrhLaJ4WmhurTqTG/Y4fwqJr9ykHGMMr25MwDSj
 1OcJFfuas2bp68GsrfjG31KH0jogi4nK48m81f4VR8D7Wi5yPLD6Yy+g/JrbYCtr
 gDLsQQWe1e38V1bTLi/ZDXkh+Xa08uuxkkDvlQqIREqdcg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u531fe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:32:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b31bea5896so44484331cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 18:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757899956; x=1758504756;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ST3b2cawpRPH0esQ1Wf7O32rgHyNnZ9xY4/CHojqj8A=;
 b=USuKgxUinkItFXwndDLgeYVbXE8/zo3CYJDwxybK/wAny4+5AMlezMhBbi6togVo+6
 q9ZS+DTuAvQiQwJ3oTh3S8nV1bh58n712pFkoSo1/ZkYvK20evtJjqfXbh3djDDawbGH
 +s/gdXaFPMRqt7j9l8NZcGc4YF/ja8J9R57udTjB3Xo3BnxQl6PikHNBjcJaRdM9vSvx
 CpfcRNb9nyjvZXH7kLI4N5BxRROaBhqdB2en8lFGWNhjNG1lApRBbQ0/rF4GUa9V+j/h
 AdsAjVfEFmnhkt+qocrFtxr/tGp3CMVdZ/dsr9FR8a5gVoFvFbfS7BtKn4PMNSGDdSsW
 nWqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoYKiCQt1qJ35U0UTBs3sX+vrhVUsEpG5Je1w5N//LjQudq8Wb8v21ILPtkXmNqw0ZdRZRag5XpgI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymMVb/A40X/+FTlgWg1esYVhcHHrFL4XxNN5hW/lGrye8sYZ53
 ujsxV0LxW2FBIXvWr7xxnvdcNoEVgZIvpCWOTGo4BYnays5biDQGHAAgKHquJyGK+H71daRe5tV
 wJIMpjEfYlt40CdVvRZOOWrMlUE2aGN/KYZNZZ3aPuazeWw7vjnmJiFSF0ZinSi7MTN48WZs=
X-Gm-Gg: ASbGncuS2AU9YdtSerA/4LV2rmjTBr4voYj0L55dB5vrz8jQZI8GhVgS/9c4ux2zfLm
 +ux/6MCAeJMQohjGWyESuGik2Qptgis0pPbWAXz6SO9/hn3tOGqtvV+uPNzHQE6RIMzhQy+Ybwb
 ibvSqxQOi4ekWBSlvJwQNZ9lQ+NRWJuTtdnXCRr4htQC81OhPlHWKt4/To4SPJhcnF77/yz90JF
 PBwtA3fyTtxxSCf+pk1MlZwAOUebi7d8MLwy/IiT5h1iezZjnit/rRnGeYRVK5pD/ui/p79vEq2
 87sNza/hyS1iP+O8nJxenWmETz1x3Ef1PRWJvqJ8dJteWWKUwhM7ywxSCg2GghIszeXF8oJZ1uj
 NMxg/gM0TUwVwdI5yhe8+wrxreyiEfmW10aQfiTmX9UjH4Si4M8QD
X-Received: by 2002:a05:622a:190f:b0:4b5:f244:6657 with SMTP id
 d75a77b69052e-4b77d088cfamr151799781cf.42.1757899955169; 
 Sun, 14 Sep 2025 18:32:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn6cF1o+2QP6A8Gn1xpsG9Czqm7Mk4MfMcoDav/2V478LjICYRPSnx2Q6cFIGxKJYVHTsTaw==
X-Received: by 2002:a05:622a:190f:b0:4b5:f244:6657 with SMTP id
 d75a77b69052e-4b77d088cfamr151799041cf.42.1757899954420; 
 Sun, 14 Sep 2025 18:32:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5dba7604sm3253156e87.59.2025.09.14.18.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 18:32:33 -0700 (PDT)
Date: Mon, 15 Sep 2025 04:32:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@linaro.org, l.stach@pengutronix.de,
 dianders@chromium.org, m.szyprowski@samsung.com,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/bridge: analogix_dp: Apply DP helper API
 drm_dp_channel_eq_ok()
Message-ID: <tttt4dlt4qptu74yoqoit7y74agp7miwkohttwaru5moiohlpl@svhtznao7ujy>
References: <20250911112756.4008435-1-damon.ding@rock-chips.com>
 <20250911112756.4008435-4-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911112756.4008435-4-damon.ding@rock-chips.com>
X-Proofpoint-GUID: kREOWIiZThbrVdhD9fuNWErN6qxizz9t
X-Proofpoint-ORIG-GUID: kREOWIiZThbrVdhD9fuNWErN6qxizz9t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX0hJvY+2X1RzG
 HntTLt7hvDzlBWkaqvQ8Mj+Ei8iupNAkfXcBsaPkR3fR65M5K54kpJG91nDmKKb/ZunCP82KMv9
 zkLwT7Fk9lcQfYcQXCWY5i5UtL2/FMWYdZw4X7eLPz1thiP2iKnev3/tzf4vYC9MpILEeChP0ci
 QFkKRVCs3zQyA/nOB1W/IyaZ0mXuZB6rr104oNclXysJB/ENFaF8BwF9jPtIQqCAzntrLE1dwjf
 GAfOpUTgGGAf1mLlaUxULdEm6p6xC1IDrTeqadEWLCw1ph3Kj8bgLQOE+aUKhu32/eux9sSjKe3
 maFioPDUFWVtkC50gA3sU0bjgdeDEGBMsBfHI38BSnchyUWXfrlwkv+e2p2X0M8Dr/wAISCBLXf
 2EflFp6y
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c76cb5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=DaZMDFdP1wNoyf6mN4IA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031
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

On Thu, Sep 11, 2025 at 07:27:55PM +0800, Damon Ding wrote:
> Use existing DP helper API instead of analogix_dp_channel_eq_ok()
> with the same function.
> 
> In addtion, remove unused function analogix_dp_get_lane_status()
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 49 ++-----------------
>  1 file changed, 4 insertions(+), 45 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
