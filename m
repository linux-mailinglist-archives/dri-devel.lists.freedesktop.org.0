Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CX3IPZ6cGktYAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 08:06:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20EC52947
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 08:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE0C10E132;
	Wed, 21 Jan 2026 07:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RsPekQey";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCeuZz2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30B510E132
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 07:06:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60L4FFdZ2840458
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 07:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wS697AlLlTI5I2rx6gQomDTl/ODEiTsxa8n7kkpH7+g=; b=RsPekQeyUu1YbCLK
 FPkLnIMQOiIHVsx/4PQ1hLvZy/azrHNdLmTPYrs/dmcwlO2CNVuJd4FIg5yy15Ly
 IWfFXhda0/PpRhgWGmw9cl5fkmKG9GeYw2wdDTy/2+H8NhmwDD7y/hX4puP/tycb
 nTowKDAp6KqNcuOS0sVmK/PAzkYqA3B7fTOYxnkM1Y0aOOWgpUYkNoXHTQyeuWSa
 GnfcCzm9c7h9gUn5gbVbKfER8ooOrL3Fudyg9/IMpdGKL3jAKDOI1jHwdej4h+YY
 YJ2uM+UX8nHgLiEMPXcHub3ppnXwxOOPDuwUA3tExt8VCoy6Wtkno0GRiDXIfckA
 mmJrxQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqm1rjx9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 07:06:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88fcbe2e351so22594416d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 23:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768979184; x=1769583984;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wS697AlLlTI5I2rx6gQomDTl/ODEiTsxa8n7kkpH7+g=;
 b=dCeuZz2LCU7MPSn2GO0YUeMcVcz+EPXpGw+CbOpA7NoIe9b5iQGZeHuOJvWl3/iAtS
 oSu1r12Sz1Yz6f18pm8InGBvfN7ggXs552ZyTBTCDc9JyY9il1MhtK2VTWF/Mg1sD4pH
 8F//lK/iE7dYJT2N7QS5U8WAJpwHwhO51vJyG9bxh841fZj2IivMuYlXrZX+FYwtYBoh
 WlPd4T61mrLLNotfrFoIGBPFo/6hzntRKW9GJIjcJf+0Yi5XY6KgQDgWMOed787gixap
 nJXkmsn+guL37ncvg6cfch6WlSROTCrEmghLv2e9cCulBWNpqx2QN52YorhOzuHv7ofT
 vUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768979184; x=1769583984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wS697AlLlTI5I2rx6gQomDTl/ODEiTsxa8n7kkpH7+g=;
 b=Ov7HgcoM7+ninOUlG7GRnw3ZlZY1D9kb7paovt0DFWqGGviFKK23g5xgM3V8V016xM
 SflexJQsXZRvDsgEIVG2LHKkWtfcwu2C1dFZAeIuuHDPJNkwt3eYu6YGYQpuvRJ7R/ka
 Pc/f7ooidBfmh/BAzyYzgDzr8KpqOISHJEJUsuMdm7Hc9JIu5FGcezdDVYwlcpRw7H1d
 fR7nAaFFebCvR8s5saufwbsGbiPsAlhOrmyr/RWjQUYNmHwf2peyg792nOLHh47vWbC5
 rpVG1R/auRWIi1FYzR0HxwkCJN0C10MYfetgrgNzfHbLzbdgrf0kN8/gg3f2XBdeCnNH
 CCnA==
X-Gm-Message-State: AOJu0Yy9dgb4r4SGgszsM4e+PefjjUAAY5JiGeMUH9WLYrcUBI/siKrn
 5WmneewVBfA7OoHK81ga4kF5zKoLLahRQ6ZWi7Pns58A6+1WJ0Z3etAf0pZ//WTtNITkC9tsppK
 uk1z+J3F6AdfMnQkuNi/GhjyTMxuWkGThzA/6bLOdDcOvqt2ALftVR0v11Bi1DvJR6FfhbNM=
X-Gm-Gg: AZuq6aJEIoC6FAlN/qyA9v5MsJojI2KhamaAa5iUZiTY/2OT9jHAGEDy8AtMoedK7p2
 P7EEBigov7kgvS0wJoUp5OZRlTmVZ0pwH9UxusxtHLo+LFx7UD2eOw/7KPWvTatSLckTFpnGCGQ
 vfdIalkfPpyAw0FWsOx2YVlvNkkO92PW4cVeiqM2a5NXQpaaYddXKygEHIeqR24rYhFLMhA5dI5
 naaYnYhZOdcAAvafMsGgYUSzp1DDQyk8O8c9/7wfM8+oU1ynW57Jvote805VHm6dhKbrdQInDKm
 v+ipNuzpVICDVlLgPUf7LEFyPjlxC7ELerRPzHmAFcBCRSigPlIQue9D8h0Ubgw9lcRlzfsudMI
 9/t85ppj1rmu3iHHbz/yovQSRdz8/8ZltoGKZpnnkch/QB+ePhXrqNiQrElCdpt2x5rek2Sw2dC
 ETJfGSmfOtIZX991k+Z6CgO5s=
X-Received: by 2002:a05:6214:2b0d:b0:892:674d:9eb1 with SMTP id
 6a1803df08f44-8942d4e0e81mr259892856d6.0.1768979184028; 
 Tue, 20 Jan 2026 23:06:24 -0800 (PST)
X-Received: by 2002:a05:6214:2b0d:b0:892:674d:9eb1 with SMTP id
 6a1803df08f44-8942d4e0e81mr259892626d6.0.1768979183652; 
 Tue, 20 Jan 2026 23:06:23 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf39c453sm4558158e87.76.2026.01.20.23.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 23:06:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, jonas@kwiboo.se, lumag@kernel.org,
 Laurent.pinchart@ideasonboard.com, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 xji@analogixsemi.com, stable@kernel.org
Subject: Re: [PATCH RESEND] drm/bridge: anx7625: Fix invalid EDID size
Date: Wed, 21 Jan 2026 09:06:21 +0200
Message-ID: <176897917717.3604590.7495394277948071388.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251218151307.95491-1-loic.poulain@oss.qualcomm.com>
References: <20251218151307.95491-1-loic.poulain@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA1OCBTYWx0ZWRfX+audMkZmJEVn
 Sbpzonl2dii4Vv5UEL5so+i3zJSxJPkXkZlwXOJzBnDm0bcmLn0g2kO9AOsuSsNL9KBaoOdaKQe
 2Dr73nDQBPYsZNI/DpRPl3ianzG1+hJLiKwygCNin8Y1efOoZ4afylS7j7HXzrVeKw3H9vVSERI
 Ggej34YjUmmm9zb22rPgnRqZoY5UUgYBLZjhU4MC/AHf7FFHxOlzk3PVYzQ9LbBU3jHksKX8yRR
 QZk+VzelOxatKsKymdZ/l62Fqc5/N7rc+JfF8t0x0YTEHamSvnliCRDDtHgcLDgZi74z9OwrXUZ
 e3bFEGsc0Cv/ip1FLBqJVoMq2kcWS57MsRQG+wpIh3iXCgW4HXNPn3GIOwZkiZQeRLb5NmOs+45
 Oludwm0slnvXPrkqnrRN1jGE3qI6f6rZ1yoqrgl2S7yrrVmhh3vbFCx15neN0k36fX77CvUElyJ
 /0XtiNuYf+f+p2ZXqwQ==
X-Proofpoint-ORIG-GUID: FTjoaAzktYAHuuurq3ZRuPN7ZO751pXj
X-Authority-Analysis: v=2.4 cv=dtnWylg4 c=1 sm=1 tr=0 ts=69707af0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=LmfPj37VwRyBRvA-XosA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: FTjoaAzktYAHuuurq3ZRuPN7ZO751pXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210058
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:loic.poulain@oss.qualcomm.com,m:jonas@kwiboo.se,m:lumag@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:xji@analogixsemi.com,m:stable@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kwiboo.se,kernel.org,ideasonboard.com,gmail.com,linux.intel.com,analogixsemi.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: D20EC52947
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 18 Dec 2025 16:13:07 +0100, Loic Poulain wrote:
> DRM checks EDID block count against allocated size in drm_edid_valid
> function. We have to allocate the right EDID size instead of the max
> size to prevent the EDID to be reported as invalid.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: anx7625: Fix invalid EDID size
      commit: 1d5362145de96b5d00d590605cc94cdfa572b405

Best regards,
-- 
With best wishes
Dmitry

