Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UVbgOsKUeGnmrAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:34:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C96692DE3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89E910E518;
	Tue, 27 Jan 2026 10:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDiQp0N5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCsUWCWV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346FA10E51D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 10:34:39 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60RAD5gt1268825
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 10:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pSe6m9bpQlKGAyhQeVQfwUOr
 nWUJ9Hu2tKR1AdBPD6I=; b=KDiQp0N5T5oo4vxAdnjXwTA9yxewWrg/BwPHIizi
 WtoZRo4fhTiF6BrPcuoImB3rE7bXgwSrMLBirk8662FK86+UlkMAMU9CZGLSHGBS
 iPiviSG7ijibW3Uj8VbxLEoOVKK7bxGZbuOM24SdeOtQVERgvoAVtU7v9KLCjHMF
 wIy4k2l7+rvXQryz0XYpC20DMcAnhCSUEqrKzHRJeYpfeaKwntxonGQkB+7xGaeR
 P8pcKSL/G6geZCAITJ//T+/aR+wyZa/i3fQdEYKMOOTRufDbLrZB/22S6F2d6IBY
 RnuVABbDh569TfLh5S3Iw3qMTLawRuJXqY43N5gM3Ma5rQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyasb2y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 10:34:38 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5f52597aca4so6084955137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 02:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769510078; x=1770114878;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pSe6m9bpQlKGAyhQeVQfwUOrnWUJ9Hu2tKR1AdBPD6I=;
 b=OCsUWCWV3a/SXKOJ5rcAaUaQljwzDjq/8AqzkcMXbVbaK00ZN9CmG1u/8tsqKprSmI
 A8vACiZRMfpDmMvch2EI8dv4Qm6AKemuXY9gZqkMhk4mA8STMrWOQd8174YO36Kgbl+0
 O556cH8yIGhYN4rPccoNjiRx+W7YzUNejO3vDnkHb5xVGKRwVGKk7aPrB7pex9aNKPuO
 ifeIENq3noGXfDVwRawod13ewcJgPdVQqTnCHE+ugdSo8wvqwgMGVzWKJtuJACI2a52R
 PIcqqFTEUZSdutY1PMGBsCoCOvCbYftWHdil5JTVTOMm96VBVVHs5JKy4C7uHmUx1C92
 7g7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769510078; x=1770114878;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pSe6m9bpQlKGAyhQeVQfwUOrnWUJ9Hu2tKR1AdBPD6I=;
 b=B1v2Y5S1aAB8N4KMweaZAs/Cdfss/gAhA6vaOwRQ75wdg+qPuEBvzf+eUkjdY7lhnZ
 6x+sjzsht5rit2HedK52QwfGEZzdYrX5NIzwk0Qcl7hOMU1mvV5bpIjTXz8pTu/nQVIK
 VKaUjHCLi7NwB3ZVAKZRA7iHHKCgHInTl4UXj1BIb92MhJ+d6I1CxoXmURbZ9aDQG4dG
 UsBfwV+21+z1WTg/F9hqd20EEkQgh8oZ07GZtqqafjESbHVDlTG+FsLMAwR/J6nKPkhk
 NwkTtnCzCmrUo4TjyzblBP8MGqcVzqyQ1tbl5tlkfZLA35P9HxYvNRb6qChooQrC2lrt
 WdpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrkkhIreJbkzyvAk5BrCmsbkzgkCGVXEfswfdoigSUCx0BoU8dFXoB2gLJfcwc6r5PiPNa6gDGR0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVmdaCeSQ3uXY+6Tg+PVlH6wWJbI+djilvpny8A5oBNKnMvHcG
 gC7S7BHPqouaturhuzjkdQUCaLnQjI0KS2vp1qUiDrDpKdHVvkboB7kc6CudcD+X2R3OUN4C9Sx
 PYrpJH38PYM14d9IVBzaSEo9WrZSlArJpS7de0HVmrbIzEJ5mOQog/DfzD6BymgDs/j9sKac=
X-Gm-Gg: AZuq6aJXEagyHdJw8D2Qh/JCPc/3ORL97Z7TArZmAvY0CKrIowmQIP/OllYBZPdAprV
 kJZ5d4AoKxSt5UuFJdHOdnFTpgDZz8TlYvbNg17jRKUpIuve2tmHiSwYTMBMHJSyDh47zUVPJpV
 1UnOQcVgI25tumIZdNm0gafkUEENzvZtCxeubHG8Ma/2HDyRYUls/MqxIPJlKVQ06drRMIFq08N
 zMk1e+52Ou1fBuE33eKZJyxv2kS2+2Ca1lslBZ8kF9PKb/90RyyDjaFlu/JrXFxdl40xJTApo9/
 OCm0OJ5gWlhwgAoTmGpSX1W72zIx/ILpMcK33eEYMnPtldrp/3iMaQan1IQIV69UaK+kkOpdfpF
 0vJ/bvZMGXNmN8eV306VwFd5mR+HjYP82rGHOriGdrvq5U+Fa+kq3BHLjc4nm9oB8eounMsRgws
 T/ExqhjlUTYJ/UsNCfnGPs8Ds=
X-Received: by 2002:a05:6102:3052:b0:5db:3111:9330 with SMTP id
 ada2fe7eead31-5f72379c46dmr540402137.27.1769510077589; 
 Tue, 27 Jan 2026 02:34:37 -0800 (PST)
X-Received: by 2002:a05:6102:3052:b0:5db:3111:9330 with SMTP id
 ada2fe7eead31-5f72379c46dmr540394137.27.1769510077057; 
 Tue, 27 Jan 2026 02:34:37 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de48df625sm3295728e87.4.2026.01.27.02.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 02:34:36 -0800 (PST)
Date: Tue, 27 Jan 2026 12:34:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
Message-ID: <whko2yur7tgutr4qhlbqfrvpcdg7hkyw66koicqvpvfhk55c7z@saj2uxrduv4z>
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
 <33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool>
X-Proofpoint-GUID: ysa-kDtIdIJktv_Mw0SMiGqVZs0WAKGz
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=697894be cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KlTdY6ZzAAAA:8 a=EUspDBNiAAAA:8 a=Vj5JY3D4L5YBHjkz5HIA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=7M2I9cFuLl8dRdVq5wb9:22
X-Proofpoint-ORIG-GUID: ysa-kDtIdIJktv_Mw0SMiGqVZs0WAKGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NiBTYWx0ZWRfX/b4C/OEYcs7b
 /0Dz+lTNbYIhJLzsq6EFJmaXVmItuhjkiyS/GnKJ9yZOKLSA68/pfcg6ZlS/Q5CyJ/87x9h0Ior
 PIO88+z2P+MRmZJdx0je4YPIndFu+PQYPpqO517dhO4Wzsw9WLxN0Lahz1ZjLHiQpfPHuHprKpz
 LC59TdFUic3OkV3V3Dj410RF7Eb1VdIvaYqPSM+8gddj4M8EakbodnfxDpef7dGkB3yoLvrQjzq
 QK9LMriKBsIZ1FnMaU9d5nrP/q1Q5Jg6es29B2iAaTYdaCM+4ERCbyl8RkUW2v7Vc9Iv7tNZlB+
 flr45G73nC6tUW0BySV3qi8CukbqkoKSU69k9fNHLgE+XkGshsOoRJrk8l2/jIxRN9QMY31uXf8
 O5EhVd+2KEfOmbad6UdmWgwfftv7n6FaThk8PHHRomuOg0AJA78YnI9NXT3tSjnYDqjgjpdEIH4
 v0ic5HnnbsRKJ49uvaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270086
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:robin.clark@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 8C96692DE3
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 06:43:32AM -0300, Val Packett wrote:
> Hi,
> 
> On 1/15/26 5:05 PM, Dmitry Baryshkov wrote:
> > On most of the platforms only some mixers have connected DSPP blocks.
> > If DSPP is not required for the CRTC, try looking for the LM with no
> > DSSP block, leaving DSPP-enabled LMs to CRTCs which actually require
> > those.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 52 +++++++++++++++++++++++++---------
> >   1 file changed, 38 insertions(+), 14 deletions(-)
> 
> 
> this has massively broken things on my x1e device (latitude-7455):
> 
> - upon booting into gdm, the internal display is all dark blue
> - suspend-resume makes gdm appear fine, then logging in results in another
> blue screen, again bypassed by suspend-resume (vt switching back to gdm
> makes it appear fine but switching back to the session, it's still blue)
> - OR blindly logging in on the blue gdm makes the session appear
> - plugging in an external display makes the blue screen flash constantly
> over the contents, there is also a flashing vertical gap between 2 halves of
> the internal screen (amazing effect) and the external display doesn't
> actually refresh the contents under the blue
> (https://owo.packett.cool/dbg/dspp-lm-boom.webm)
> 
> Consistently across 3 reboots.
> 
> Reverted only this commit and it's back to normal, so I'm pretty sure it's
> this.

Interesting. Could you please capture the dri-state (only the last part,
resource mapping) with the external monitor attached and with this
commit reverted?

Also, could you please run another check:
 - revert this commit
 - comment out LM_2, LM_3 in the catalog
 - try the resulting kernel with the external monitor

> 
> /sys/kernel/debug/dri..: https://owo.packett.cool/dbg/bluewtf.dri
> 
> 
> ~val
> 

-- 
With best wishes
Dmitry
