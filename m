Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ7zCqWoeGl9rwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:59:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE87893EFD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BAA10E555;
	Tue, 27 Jan 2026 11:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVNhGpNr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEuNZMA4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0090910E555
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:59:29 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60R9pMfJ1269418
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Eo3XBVAezIW+Pl/mv1qSYsEu
 Y0LGy16QnUk9fgbCnfE=; b=fVNhGpNrT6yoHjf0HMpLShURopOlMc1CbPZpLkDF
 249mO6SYCMjBk0/fz0C2lV0d1nENDDVwDn9bJHpwqLf9B9qzW5PiVfq8dglV8ybk
 MEyqQvpc+H243PHUfm+zMRVNhfPd8PMb3dLitrXy6wQhThipQOjB1DkJPm2LFLqs
 ZSay4NePjEaiLsoO2Vt7ZoObkphLWuDYl7CDx7P7c3NWhFjTkdaqDzo2OhGhdiTP
 pkl+o9AqJqexsmFEgaPyK9lkqk4U+cfXVMGjMADzoERW4FgG3TALTNwiyWvYpkln
 5+zC0UDL4DdzyXAFNtoglXjHlxIkYKAavGzBHB7yvXyn9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyasj7v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:59:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c70ed6c849so36862085a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 03:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769515168; x=1770119968;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Eo3XBVAezIW+Pl/mv1qSYsEuY0LGy16QnUk9fgbCnfE=;
 b=cEuNZMA4W9H3XIcE8n4F2Hp+EYF1AIFjejpWffJZTvd12RlMP/g1IQVlj/sogP3oH5
 PQKOlcMVIq907TJVoHjclt4qx51hSob8gTdURuBqraSQSpTAcHFu5s/a5TxUKvpkxniH
 4dv6PGilW5vlwsELeE22aW06OuBDnj7a27rkxLfmZBwqacW7cLraXhnT3HMz2GWNEj5i
 B2//l07sDXKAdhs3BQ+BuYjAVv9NM3Yd+dulPUzjkxwKmcweffYUwFuEya6/D8ao6x/V
 vkOTUj3zWIgcQeFP23isMdwKHGvWI+tjMsZkd1T3PX6DJzQzAgx+30/Fz1rSyUEqsLLP
 gR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769515168; x=1770119968;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eo3XBVAezIW+Pl/mv1qSYsEuY0LGy16QnUk9fgbCnfE=;
 b=XbKNpAL7ooCz60YAfy/zRc2fJOPzB9wRqNzAwcqo72Jd4x2LIpYOS9tH+oVDWfOeLs
 Ug/pq9rLC5EB9Qj1eLytGjwhglhqCqvrEyCETEjF+9Vf08kVrRhQeywZ36D5GKhZm2sl
 wT9EHsmNp4ubcStTdHU66LAddZ5P7dD/va4Hq0NUKF/dGA1V/PevIrBXjyTPveFbrsG9
 ltI3YEaVytJjhA/8ggBLYBJOnNDKu6783aNQPOqWb6b88LJeg2PIYc/B/z3ajtiXvjvm
 92du16ZW84CRr+DUdEHleBTqJHBQZgQUJYVQJhg3oTnl6JwR79IjtR1Rpbd+XLJx6eJw
 pHmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhDcuIDQ92635vnoCS5p6qzp/jRAFZy3r7dhnTHHO9IMEDoYKvH2gBVp3xspYiOZnJ+Yd7WSVuTlI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJpJs9a/aHQ//vFmO84cIK0dn5QOW7+CBS6gT9x21pROOL72RE
 UBHCn2aGl3oVwyDvp8qbcaKzLoMa4f958OrNY577BKwOxRKniRHjkFp1RLaJw+wF1y1JDJJBJ+/
 9OeJrgHatVMwOxwUcZMOLKwqPPIxQEPcRbiqLW8b4xygf70CbDunBr3M0OJSqXY/DIiNfOLc=
X-Gm-Gg: AZuq6aKklpqQ11W9cJcyQYIdNESB5YXzKeRWPRBnHWPV/EDk0VC+JiodCTdqKKkJYlP
 h19Y/UAsReCK2fOAxps4rw+YJDo7DryKgzplB+gsK6l6VfQQZggMD5jfpF3KS4NV/P6/m4dkcN4
 30nzOXVxxRHh80ZKRztXOp2kY/f6WRxsOeYx9w9l26dLdzM9Ua8keQ1KV98CgynDcptY6bBoJAN
 iOkXvoAnyqMzAVcd2OLAmumW/MGpnTQ2EKu0NjT/cgGyeLsUtqgwkDiUTFHUkO0W/8WAY6RvAU2
 UNZwd7YF9g5qsX6juqWWlB5moR9ejyJ7lSkTicGb+uAyxU/lACUPCD93C3nD2tQP2EB/3Wj9/Nd
 doMuHrJS6OZGh0ZNOf3Zj1JQOGUWhofwV5794pWPUUComtjhcAyG4j+hEhhQqK8EMu+ZXQqbcgl
 3lNudJhe1LuwNjLvaVMuw9Eyg=
X-Received: by 2002:a05:620a:370a:b0:8a2:ee8:e7cc with SMTP id
 af79cd13be357-8c70b8411a5mr147108185a.5.1769515168463; 
 Tue, 27 Jan 2026 03:59:28 -0800 (PST)
X-Received: by 2002:a05:620a:370a:b0:8a2:ee8:e7cc with SMTP id
 af79cd13be357-8c70b8411a5mr147105785a.5.1769515167989; 
 Tue, 27 Jan 2026 03:59:27 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385da1705f7sm31844261fa.26.2026.01.27.03.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 03:59:27 -0800 (PST)
Date: Tue, 27 Jan 2026 13:59:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix LM size on a number of platforms
Message-ID: <5sb4agmjs2xemn6m4zetab6qvf2xatwkkwesayywvm4zx76bt3@4myarlti3jku>
References: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
X-Proofpoint-GUID: G-qyL2YSUYpaR-H_GJYIVQMJshPsz-fL
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=6978a8a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4POtUoziGYp5d_2QLlgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: G-qyL2YSUYpaR-H_GJYIVQMJshPsz-fL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5OCBTYWx0ZWRfX4A7rLF7tMynL
 auEOmxefFWsS8Vju5vdKQiy4u8KP9azRdqnddnc/p9e+ZuR4F1QTKe/pZ3jVixqx5iJhiojHb/9
 aX1dGq1x0poraUWNLxBy9OIcvfeHfnOMp7cujK0CdWQCmu6AKkhQsNH699j7jA1gJwSq0zaa71t
 7jHyu3GlDq0w0XXluEpXB6TdwIXQu/F/V9jTm064c9eUvjxHeeplRN7XSrhhs5s56+d3i5awjAg
 UqC2j7hhMI4aIs75Q9UE5wKYzldbhOs467fLsRXEXuFVXMRdYRBnzEERpuVA0qp/7L2LiGQBBi5
 wZOvvQ5+nIoPPNl9GDuLyn0LVCg0YriEcxqNzhEsrmuwS6h1A2/pn8YyHDVYa19d78cS3hrW0UI
 XyaAMQ+B5d0+Ul7WAdmpcJoXAD6c1TQ4tBooM+4+YjtyC5YSBDtV9EM7iMbimDpv6O388IXL1Z0
 YDX49lz2xp1GNzmBXow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270098
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:abelvesa@kernel.org,m:andersson@kernel.org,m:quic_khsieh@quicinc.com,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: CE87893EFD
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 11:58:49AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The register space has grown with what seems to be DPU8.
> Bump up the .len to match.
> 
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> compile-tested only
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
>  5 files changed, 30 insertions(+), 30 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
