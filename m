Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJLjKZyleGnVrgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:46:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B95093D63
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5A510E54A;
	Tue, 27 Jan 2026 11:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+Mx0Mw8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrHDUOlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5407010E54A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:46:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60R86pg6620856
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MLtuoc2Wd0WuVPEXaciWpMVg
 21wsMqAZRvFbNmrGRnQ=; b=e+Mx0Mw8732J/82KQSPd77PlMhXxv6LteNKSLKCZ
 EPN+hKnhzRqr11bZMm7/aqoVvLBoLlWtHRtBSAXPujK6GcwQFqwpq8lWFfnGIKBv
 Om+P77mSkVxHJCuYaGIbc2tFmWO2W9LPA7dPWjP5LW+PU/fDYLwrd1klMH9EjcqH
 MprOVi9m9Ahk/uxUFmZSFcqE7mZkoNukeAExj+WGWbz/DHDcqxMOJwE7myQA68BE
 IGBIk1Uyuz2+4/aRT8iPjHmgiacADzB7AtHbG3Towqskz2jdDYeu56+kmHV+Lb3f
 Gkd+LQ3BX1hRZMsmwMQ1hwvboNuTrBtzm9c7rDjx2adbsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjegpuv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:46:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c277fe676eso1585241385a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 03:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769514392; x=1770119192;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MLtuoc2Wd0WuVPEXaciWpMVg21wsMqAZRvFbNmrGRnQ=;
 b=XrHDUOlJXy92DDRpBGaEMsP5l860dz99pqcxmAvuwWE5Om0fm4j3sxbdtMve2jUUpY
 nhWFmdvtq+PwLKnoKseQjPwFqYJQ/9ulYrHFl5VClbLhIxUiRIB6VMhCLsT1X+ZLiuha
 h+g+45va7g7S7mzCDEdVgF7WvGEDv5kVFWl5wNaSC7N/kHiYPNjk6NJgfF9m7FSGCFfZ
 cWibCGpmHHNtgkCHz0CVz5IlqQAxOkm6j2MjEyC5iZpZE0v2JzF9iO9aPgnHraRiGFgQ
 1k4QI3KftJ6FeSAXtDa4EXO7DQsJ3JE6YzS6qr5d0bbOTi8V7jS1LRu+W0wf+kkMESeS
 CP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769514392; x=1770119192;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MLtuoc2Wd0WuVPEXaciWpMVg21wsMqAZRvFbNmrGRnQ=;
 b=kegd+3S1tXB9RVtDEuJeelsBlN1BuX162T2jKhJbxLGGvAtI+uIyV0y98c69kSfZjU
 BXSs6u1rKa8SmRCuzX0OBP753dlO7/25OHsxDdkhiB9lFUzbYFMfsFN93Wy21vcUGAJc
 qhWPq7bFSDa/Mo/QDHQfTYxSbnMrz3JrqFCeb/zQrwn+CJ5yvOJE1+QWXLTMf21DkbKM
 AkTmHvUyAB7W7w1qMNS4Oq+1Yjp50F4Q4DTFMnViaHs4nBXPFrRfNdlFcdasx12UT6uh
 r5DrJcPYRZwq7cIHmEDev2Xw/TlWRJNcY7hfk34a8kF8jF/m0+y5/sunvDvBvDhRetdm
 Y6wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ8waerEPBr+mqhX+0I1s46RBf4JBs5dlJKxfY6B+39EeRULPWKtZECMpTBUmgZUzZk34JWuo7Z9g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxXTU9MUEIrafCBM+pJs9IO5UWCEzJk6KjOBaO8fLAVK1Q7GSt
 8DcCoVvasjLSVaId8P69HFvyp8tPxnQ0ACyddqGIsytcIxPQo6fkX3ih4yecHLk0ArrhHXQ3QgD
 qec8W08AEp/iS8H07+US0VZelmvcvL0DjLKIzkpl/nQyjMpGbeXm22+dpCq+Bp7QnPfH4H/Q=
X-Gm-Gg: AZuq6aKTNEd8RZj+rx+nC97yt73+l3P4fifk8Au1WQIKhZzZN54xSg/Tqs5ts+5yy4u
 clnZHNa/QTLHZix0HBKd1WsLLw60WHJLDRLdqiKFOuffKrBQ6gAGna6T6bF00hPgg44HANWrr//
 qwebMDD8tw7WrKbIPYEocCOnI1JkfE9N4wSYvmXmnkiPInSulGDhoVLw0tgoKBOwBdtGzdbncH6
 Ho7pcrSSGgqVGkrWauxMD0JXYJDTxuf5JijxlrShZ4pL5J8KIuGZKj/Z4iChG5i+P2ykVfETa7B
 9kRNZbsJSL/F80TCVmZpQq2ZseAIVZlZIj8TTOvgMJ79p6gQfx5s7G1M57VFySiIm4xBHEKLXay
 n5c6CjPNeyVGkTwVU2CwJF9q+
X-Received: by 2002:a05:620a:1a95:b0:8c5:310d:3b2d with SMTP id
 af79cd13be357-8c70b874091mr156258085a.33.1769514391643; 
 Tue, 27 Jan 2026 03:46:31 -0800 (PST)
X-Received: by 2002:a05:620a:1a95:b0:8c5:310d:3b2d with SMTP id
 af79cd13be357-8c70b874091mr156253985a.33.1769514391021; 
 Tue, 27 Jan 2026 03:46:31 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c24bedsm36091323f8f.17.2026.01.27.03.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 03:46:30 -0800 (PST)
Date: Tue, 27 Jan 2026 13:46:28 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
Message-ID: <h37gfvfbla2uk6sxzh6zhi5uotqhjarsqqrubhx2odpwwxmwb3@iagedhb4kgu3>
References: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfX2B2oUWGSuiou
 Oo/ZxKUggX42EGxsDiC56NsSsKaVrYptpHf/mkIExAD07c+jfJ2k87L84bwe1eGgtSLlhQlTI9g
 pmlTe1xeQErcIXbVicM/r7yV0zQSqSkQrSVRDWDQ+nyhsVmymtuAOjD1iui2bWaH2yR//IZ7qLL
 uk1g86XCIPbXnyg+9AXISDt8ZjYZHAUzyU+iajlmTsPjWnBuhFQmXWgNwUeZ6whwBFeVbQeEk5F
 hH+bBAp1mblRHXEDRiIR0sM5aob02d1Vdu5z5yVYM30p4SDUDN2pi9dudoo0KE9fj9xQGWuCwQH
 16LsS24SCueigAIrrKSEUlj8cyz1KBYUibIDx4urUbs8D9zNqwl/O733CwEJi4b4ZJ3GQmhtcSM
 GTyG7hEwfTtjQ4SW3nzV6wpaTdh7eLyc5yLIQF0gOSR7qtyixyC33hzRjIg9B3kVEYE6g3vF9PT
 QAO5DLGycTv3p1FZUMQ==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=6978a598 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LCUY55zAO45cASmWvjAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gSfP_PVc0_VBge3-hQ5jBhSYjSnw4Vmg
X-Proofpoint-GUID: gSfP_PVc0_VBge3-hQ5jBhSYjSnw4Vmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096
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
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 5B95093D63
X-Rspamd-Action: no action

On 26-01-27 11:58:49, Konrad Dybcio wrote:
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

Quite straightforward, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
