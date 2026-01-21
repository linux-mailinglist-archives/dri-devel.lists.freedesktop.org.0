Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHnxMhoGcWmgbAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 18:00:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D955A410
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 18:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4172310E869;
	Wed, 21 Jan 2026 17:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKi/9ny7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfAQkrz8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5663E10E864
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 17:00:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60L9iVf83481440
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 17:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=Of1XCp4w1IY/FWfBQqk2YMMCDqdBBDLtge107x8YzfQ=; b=DK
 i/9ny7u6sYA3xbSXbIQHGKSgaSeJxqF1CQpODMhYJLhS9hlss1d8e6vpsgPmAq6M
 OUCTtwcZSlrgqTTEfRp0ot0c9upyzZ3agHCzJ4izV9QA9HtfoYDsz1+5sq4xyXlV
 WqEeTKFxHUpGHzpwQV8CmihLIlOpO33U3duwJaT8uxNEH2ZY1TVo36Yp2vjOIYdW
 w8LC86fSNSGWc4GbC4oi7L55J+zLtLU3YANJ+FrrGyxmHW3uXwdA4Pt572UMyrOM
 jsedXPJ4CfvusCELtzQjx2ymDTDv+Xk75Y99HC+/uqFrouioImZBg5vX1LStwHHk
 zw+arwhsAZsvMDM2YZBw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvef1fpk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 17:00:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2b71041d135so723957eec.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 09:00:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769014805; cv=none;
 d=google.com; s=arc-20240605;
 b=aTWxZvlI8Wr7w/URgKh3FOrmdVgQpNQPUhOrHOMRhHLVPN5yfzdkgaJpR+F6NcMnhN
 Jc6/tRab7ZMQY4DGQAA8+UrdkE3VXIpio6lNyDQTZI+KTf3WxglpmC/+HjeC11caevTB
 z95gdg1RhnaCsjUD+eEz6NtgX7soOUEWvMLJwptgO6Fg7ZDJZ4wGsiOGamEAhHEf+00q
 cB7Pfj5uD6BJgmmVYMgrdvbYsa+6Lhl6FRfZSV5n3HHmQFHc06j/oGckYEAEURlnWsW9
 6YLHOq1pABIpjoIu1BiMbLtPOWI+csWi6bQ2nZogILvTh+/VKDa5BTKFK8pbG3ttR0+b
 qq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=Of1XCp4w1IY/FWfBQqk2YMMCDqdBBDLtge107x8YzfQ=;
 fh=S0Fx2ehdB/WA7ptUNzGxWDP8GS0H9jIDeNXm26IAB1M=;
 b=R7yx7p2efjXrB2z67FMw24kHtXXdDXRY4ajRij7PAPFXh6W4qbOFiJ6CZAoR+p7Pvo
 Ep1GbHufX6ILovEaGjPKYohLD+Mv6c6s65ThjeXpcxDN3MzQ6dZL9IXT7ANbu1WkazSY
 XEjWT29r4z23VEbPnKChAf5sf4qK+Qw90dfC41cKJ4IWcs6MdrjBbwnNyXXEf3ZLkqV3
 1mrxOHKjo/rn5cRfWdipHTxo8Cu9hJ0sxEfOWVRtF6Uh1yaoe0bZ2o72CTV6qvkspGd3
 z2OJs2Kd2A23doyIah8QrxijGbOwlINUS+gqMzvlRsX5ZsgBIJlnEgwIpivyZyzSTASX
 WRsw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769014805; x=1769619605;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Of1XCp4w1IY/FWfBQqk2YMMCDqdBBDLtge107x8YzfQ=;
 b=QfAQkrz8ZFc6xdJSO2dD9Ezw4k6YI74TJy3BfDdNIvWSru3xxhS2x1yMBF4prkP/Rd
 5uVnd8rKrirF8cAV9OOc/cmQdGxdlykPmcgbAN9svbTIydqp9jvq98XyCRF+/JAqeqWV
 FA2W/80BBhWqxtW/vswUneaTxtPoXC32GcpkwKE+s0lg/83wiEVn6mty2q5GGWGj5oqg
 vnYGvfW+pawL06FRXRIwBrOD97BZk6smawV9GgYe76iCykUiRBTfU9CKYOO8bAu4dhHl
 a8+zNI75bfWn0lecUNpP6Merb2ANB2vVGmLvOokmDbiWWvYPPjl9ERZzOf7wcY/WH4z7
 LI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769014805; x=1769619605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Of1XCp4w1IY/FWfBQqk2YMMCDqdBBDLtge107x8YzfQ=;
 b=DqGkJa/Dsct2mr4fLSJd3uOfp/gRPmspnDhXcaktvuH7YkCLrl5ndytsaYkN6tVZpl
 qLpOp7wdFN9X7U63bojXpbmYYEBCmRW55i1JG+ASm2KNQfRq8NTfZc1dqxaLO2VQS1Od
 tVEjsMJP09a2+DR+qlZNzIqVo1aoa+5iBOJ6m0BdOsCeoZyf+VcsCb3DWHqMoG9cCnIV
 ZAqD2JdMXzO8H80eySNPH/7jeNx4gzTHjwsXWmo0ROhRIDkmXz0T/5YIUtMg/cE/oRSG
 cd6s8Lb4nO6mJbn5j5mdlofLP5XmxRirJEug4y3f9lg6yAbJti+jl+zCWt43vJka16nL
 Ru4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjAIIBvFZVaHR7qTkJiSrOtnN7YfdsFpR55NgzxYQOOzuXoTH36IeXp3euKkxtuw8kY2ZajMKjqeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoXMWW0JcjdA5wuRtyQFMUh50WDU6fOIuRBW8QvcmMaBxb2qLp
 66VeDtpXat00mC5NJVlV2Zsip+ET26D0gW/eDFb9cBMRoKU73A3HN67xFvbg3UTLpvGcouAHbLD
 g1tb6ElYn6URctjJ9iH47Y3VgsHbw4bgTGhwFRjd2qJ5l7d4+REBki/WJVCZohiDEcwj7Au9HzW
 j14o+nJ42z7aAQWJwAjiS/B9N55BbX841SikqIaBH8fBnMrQ==
X-Gm-Gg: AZuq6aKh50PJaRNILKgnce+A20TPwDnIQEEAaDFKvG5TfNGAedLr+0ImYiwngOT4/Kq
 NkexYB0LX9pNjXn3W+89Uvu7hTkrTA5KhgLG9ur0dKXoa/IWyPEq7+NachNGqPYi3pLSNdmtTx7
 +dVNlrSnNlJTZc6UYLrgiC6vT0EVAAfN02QQqL1KVRvO8GFo+d4rnmNxxWJlwQJIy2xz3nQ7olh
 ul3DOFG4nMmh4snf5m0GpBXVg==
X-Received: by 2002:a05:7022:a8d:b0:123:3c24:b15 with SMTP id
 a92af1059eb24-12476b1215amr24649c88.19.1769014804745; 
 Wed, 21 Jan 2026 09:00:04 -0800 (PST)
X-Received: by 2002:a05:7022:a8d:b0:123:3c24:b15 with SMTP id
 a92af1059eb24-12476b1215amr24635c88.19.1769014804017; Wed, 21 Jan 2026
 09:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20251221164552.19990-1-johan@kernel.org>
 <aWdaLF_A5fghNZhN@hovoldconsulting.com>
 <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
In-Reply-To: <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 08:59:51 -0800
X-Gm-Features: AZwV_QiWj0yuZPjfl5AAb2tqkVbhX91Ozb0ASrKflC4IjkW86-eixAz2tomYpLw
Message-ID: <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
To: Johan Hovold <johan@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 505JYjhjhjgEZRvDYT5jsm-Knv2vaYuF
X-Proofpoint-ORIG-GUID: 505JYjhjhjgEZRvDYT5jsm-Knv2vaYuF
X-Authority-Analysis: v=2.4 cv=CYgFJbrl c=1 sm=1 tr=0 ts=69710615 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=RcnqT8zevFU4LWI_uFIA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE0MyBTYWx0ZWRfX8HOy2mMindOc
 lDFSt/tsQ6dd7kj61pvKuWOMjmGNotcbn8AclYX96oclpToxWucU/uXDeNzsmSYaxqo2UAnrJ9K
 wSnjQNceiikkz20G/ih7yY2YLTMoZvHy9ghZ0FfyZhX1LoE/2h7DRpFYotiehhJt+/3YDI528MO
 iQyHQyIV3fX0wiMma3Ved3yV5mT7MksQUNPE1fJD/gC9HkALh7/MAHypvnDLUh1Xmq50mqazHzy
 J8wiS6Zrl9PxQ8C7oKsV5PqFnrKYC+d6jFsM9k94TCNtYEuL24L5HZCRsJ5OBnCXwD9JVMJRzQo
 k//w4aybRU60jPqVpJk6MrrDbqZCwLIeu3S3yuMOgLzU1WHdI0YeWY4y2rWSGUV+uUehqU7lDX/
 Aa5vMnp0a1f/LI/pb6usRpNcyszRX93A+apJj5HoKFCq03CXhDsCNFSXgSPxDlgXjTT/iNzJzUn
 qNNFr4cSwXM0xOYFcrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210143
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 74D955A410
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 7:17=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> > On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > > The hw clock gating register sequence consists of register value pair=
s
> > > that are written to the GPU during initialisation.
> > >
> > > The a690 hwcg sequence has two GMU registers in it that used to amoun=
t
> > > to random writes in the GPU mapping, but since commit 188db3d7fe66
> > > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> > > the updated offsets now lie outside the mapping. This in turn breaks
> > > boot of machines like the Lenovo ThinkPad X13s.
> > >
> > > Note that the updates of these GMU registers is already taken care of
> > > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> > > properties on a6xx too"), but for some reason these two entries were
> > > left in the table.
> > >
> > > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> > > Cc: stable@vger.kernel.org  # 6.5
> > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > ---
> >
> > This one does not seem to have been applied yet despite fixing a
> > critical regression in 6.19-rc1. I guess I could have highlighted that
> > further by also including:
> >
> > Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets")
> >
> > I realise some delays are expected around Christmas, but can you please
> > try to get this fix to Linus now that everyone should be back again?
>
> I haven't received any reply so was going to send another reminder, but
> I noticed now that this patch was merged to the msm-next branch last
> week.
>
> Since it fixes a regression in 6.19-rc1 it needs to go to Linus this
> cycle and I would have assumed it should have be merged to msm-fixes.
>
> (MSM) DRM works in mysterious ways, so can someone please confirm that
> this regression fix is heading into mainline for 6.19-final?

Sorry, mesa 26.0 branchpoint this week so I've not had much time for
kernel for last few weeks and didn't have time for a 2nd msm-fixes PR.
But with fixes/cc tags it should be picked into 6.19.y

BR,
-R
