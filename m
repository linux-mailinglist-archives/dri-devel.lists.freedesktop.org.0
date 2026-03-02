Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PrCDRGIpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:52:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C131D930E
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBC310E4C1;
	Mon,  2 Mar 2026 12:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnkQCPdu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7ocF+gP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BC210E4CF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:52:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622CVZ8C2504657
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 12:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PY/aFPmpxL1Cv4MW6Rp2db4i
 u890188ul3o8vC4hqY8=; b=mnkQCPdudJNKqTfUxFZZ1006pFADQe1v2eS+r1Sr
 eEDZq7uwdqOp4QB86aw4pG3nLQw6RvSg24FaCfalrErpQatqxPiDQeNWJ11SMSo1
 39dFnWArmrkn9wAzK25dKvgp/s1SbzK+h839axGgvFvsC9+TsqtqjZwcJpsgiK7Q
 0U7S9T1U7zz4l2PizQUql+TH+UScuKznJcr1c0E467qEo3f5UzaqWMKgm6G3WBis
 E0TcBgdokfoX2N7/ET7YubNLQCaaVujcR9cqAFRgyA+R1q7CHcB8knRzjqBDSHpr
 wxVoE0yq0WWC57v0m2c3O902lUBKaly/HDXH9SPbQ7gCAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hes9r6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 12:52:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c70e610242so3619895885a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 04:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455947; x=1773060747;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PY/aFPmpxL1Cv4MW6Rp2db4iu890188ul3o8vC4hqY8=;
 b=G7ocF+gPPcBND42zZ1EwFHT5B4DAS0WJJV+TtMTP8TTNo+gKo1NfZeNCYTEm3/ysZ1
 Cp1taiVBRNUp4XAQmDBzisIBR7f3F8xR2COJCxzysCN2QM207Ryojpir8awct7BXpR8h
 QgEWymbPftO/EIOFLEjMFrAeNGcbeaWBY0uUqLd5wq+JvIrlnLL8rFIzAnPgqB/IJ24i
 GBL3TTUjbEkO3LcrL+haIzO2n8UIoJXTWr8XY95j8BpouJEYIVqvSkomNs03iiuhRLfm
 s1iwXFjl+/oqdBz3tUMHLr7RrTsmmulcdjrHa1uWKHcQJJXhB9lQ8nFB3J4Dhd3dfjuX
 HeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455947; x=1773060747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PY/aFPmpxL1Cv4MW6Rp2db4iu890188ul3o8vC4hqY8=;
 b=GaS+WzLbYj5N1dZ5vgwSMYhSi1Z9U4ZsdoBQ6DkH2/lg3r8uIvXNKD79hVtNQwf40p
 qUl6SxJC4TFfTXSgQ5G0gVMkwn0U7y619zyqoo+EJHyNun1cysbmH/uQewEhK82Pfxfg
 kvum6uTjbC+ELGmFBNn+QdHj8So//0hqtxhhnFwdsgwP28Hle2m6erieWFlWA+oxrCUD
 nWxTZ+nRoCKnGzIgSOiQw3NNkihu8r472sWrrfYykCbgfOLCvqqxwYNnKxfO+tY5ppqd
 Ye8eYdtA0pJBw7hJtEsVNCF15Uw0xtEAST+8z0N3M/n+nA1NQeJ6YtSnjgRfdc165WCe
 oxPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu1O1Eed0Kyw7caFH0yykYpXr1wf+VJgcNf9C2ZzXDdO5vyjlqtFxSmSBUjJDRVb8S+or3po61FrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQXYIAQ/b88k7aBxIq+k8JNK9XY3ocvUzpwokpsLU4Zelp66L0
 77Yq/S+bui3dpRbu8Pd+1iHBpYoOTN1bdigXj7HfWxLF9ghVRbm/ezlweCrIrd1ho8TUoHlAqyD
 NsY9H/A9iwqKmdJiqQh2w/+/vKAalCcGZDnT9WFXsQsg2UYW8kGI0e7ZWdv2FQQw7kmS4jS4=
X-Gm-Gg: ATEYQzy54kIB1B51W+4N37IbecZXYyYdDMirKxIiV9gr3R6c4vgshfN2hwVlqkOttjQ
 wVvE0fFEfupBdyeUyAZuA7Ayk3VbxB4RTaTMoazgv7T7oUhqsTBf1Rb8vr08EeqWcYLmGPu1Gti
 LfVM/LbnupSbP4uUqVJv+AZDQ/cy96+rfDeU3NiFPl+PI2pA4ZPVJIvqVnA0HE7JtmYC0hScrvP
 aQ3emUNvrP4ZIq1IdjrpqPPsgdEP+2i87/lEVjfEGDyXqxvxl4QCmp9xIAu5kxsDKvXZmAXNCVa
 65XXhPfbX8EojpBReXJ0EuhOkVOs4tD0xMSZl54pOPo8e5hUp3vA7tVfVmW51Zjr5+EEXiA/jJe
 HrT4H/g0wCVkCTYzVUY09wk3mILtSouYBxd3uM341A52mukQUlrOFP4jU0Bb2DArNcrQYYkh5ol
 gM3xwFVpXkd1dz9jMIovpZ0wpAnodug5HePGM=
X-Received: by 2002:a05:620a:4041:b0:8c6:a723:77c with SMTP id
 af79cd13be357-8cbc8e2ce2emr1527900785a.60.1772455947258; 
 Mon, 02 Mar 2026 04:52:27 -0800 (PST)
X-Received: by 2002:a05:620a:4041:b0:8c6:a723:77c with SMTP id
 af79cd13be357-8cbc8e2ce2emr1527897585a.60.1772455946843; 
 Mon, 02 Mar 2026 04:52:26 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a11c857c5bsm921805e87.62.2026.03.02.04.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 04:52:26 -0800 (PST)
Date: Mon, 2 Mar 2026 14:52:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
Message-ID: <lpydx2i46dqbawmbm6pgst4bc5gg433xgdsfm2f7zdpdn43lil@jeuavkqivp6l>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <ae03232a-49da-431e-baad-c5ae7b85eccd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae03232a-49da-431e-baad-c5ae7b85eccd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a5880c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=xMFMbcVZH8Q603apdYEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: N1J0JLiGH0n-DjvlwfQRaF7HHtnUMpXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwOCBTYWx0ZWRfX8E8D151Ozpf5
 D24FF4q7llquK9uKxH53uX7KelDbHtET8TxXHfsFrwPM1WgANA6Lmg9iti/eKCxSc/4P2zcCxP8
 8RY4SqokpKKuYZCo7P2mfpWwO3xhsAG6c+dTjdUFqZMJlcHyOfxz0JX7FY4SS49ZGusrRAmBtqZ
 ptJX4kFqsqMc0vG7+nYvSO+Pao/68NVwwwt9Mk3fcs3Y7qPPII3a32HV5/f6gk+Va2zFyGFIeoT
 7S2r5XB+UXUuv/czJCeRPX1R5wuz6Vcpyul0c1zPX72y8vYxfV0FxhtRB0nFFeGBPuB2nZextVr
 pyN+6op7mqQo1RdP3zTYiQ/mCSVgdz8vmqPYYrBkJZIPVHIlG+OeHrKqUqVckrakummidfgcn5y
 HKG1A0UMpmd+ahbkgNY9ZN71tjlCjiDJ4vO2TYVEVmcZK+bW3SJYFQ+9wT8sVKAPzcR54khApFB
 oeeMDQU4qXYpBhhLxnA==
X-Proofpoint-ORIG-GUID: N1J0JLiGH0n-DjvlwfQRaF7HHtnUMpXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020108
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D7C131D930E
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 01:45:39PM +0100, Konrad Dybcio wrote:
> On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> > Once Konrad asked, what is the use for VBIF_NRT. Answering to his
> > question revealed that it's not actually used by the DPU driver.
> > 
> > There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
> > VBIF_NRT being used only for the offscreen rotator, a separate block
> > performing writeback operation with the optional 90 degree rotation.
> > This block will require a separate isntance of the DPU driver, and it is
> > not supported at this point.
> > 
> > The only exception to that rule is MSM8996, where VBIF_NRT has also been
> > used for outputting all writeback data. The DPU driver don't support WB
> > on that platform and most likely will not in the close feature.
> > 
> > The missing features don't match the extra complexity required to
> > support two VBIF interfaces, so drop the second one and all the options
> > to support it.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> This leaves a trailing 'bool is_rt' in struct dpu_vbif_set_qos_params.
> 
> I'm not sure whether/if we're going to use that specific set of functions
> with rotator support, but we should probably retain (and at some point
> recheck) the dpu_vbif_cfg->qos_nrt_tbl data that the catalog houses

is_rt and qos_nrt_tbl are related to the WB support, so they can't go
away.

> 
> Konrad

-- 
With best wishes
Dmitry
