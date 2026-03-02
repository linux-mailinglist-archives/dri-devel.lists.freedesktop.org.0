Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NQuBOyEpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:39:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DBC1D8C93
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF6E10E4C6;
	Mon,  2 Mar 2026 12:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zjf409ld";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlfT9g+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A53510E4C1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:39:04 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62294WYc3752736
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 12:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eQna04IhPNINhdUa/X4UZuWsEJV5qIs3HUGMu8ECfb8=; b=Zjf409ldqsN5tiwF
 foHlYNVcL7NHrdBHqoaIT9TslddQSfOcc6B7qiuOXq4pN3E7WPBgW7M9WWei38z/
 7KCJWrmlkL99t9K59J6GmvDwc3qZjRM86XOy9+PVtDS2tdvMsDXM4VHFTb9fIQJx
 GISpnaGJyYrLzY2qfKlrk+wYLCdnJaiosP6sWDbrrUe+FiJRAhofImR521QxTnua
 jyB88tzboBDyLFeo5FaxFnR4g+NaXrNeYthNnETTKk1oi3d0/bZeOAZ1MYDxy1fc
 hagtWeRCqK4CyM95baWvLNgE/vXFl+AcSGMRdzFhhxnEy66OwKofbnfSxaBZOMpR
 5ErYlQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq8qc8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 12:39:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb5a76f13eso313137885a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 04:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455143; x=1773059943;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eQna04IhPNINhdUa/X4UZuWsEJV5qIs3HUGMu8ECfb8=;
 b=dlfT9g+UfjD2fEBQlIUIZ2US14zC6mrGARQzkZ0KiAKrN51bmdUYs7tEbsJTG1mfNM
 usxZ56irtxxVt+dz+v9iRxA1HZ4a6mlm6MON1BuOhU62o1nDRdfn3KEg45GkkMV3PKN7
 UbiHQbCFcgoq71uwUM+R4fzBEWndS1zOGQ3dlRYb+2DiPWMqIDoo0jyXqmOrwmGyLddw
 DsPrSsrtSJSDzghNdEI7KIgQKAKnKiIlsy7ZZtQ/PoIUf2JQc3WpCaXaxMvYbEgsOjfT
 L7qW+DyNzhEXpymoLBUDgBqmeBnWk8XNcBqrKeBt4ZRYDjr4Kz07dGTbaNhM7yJS/sVM
 RVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455143; x=1773059943;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eQna04IhPNINhdUa/X4UZuWsEJV5qIs3HUGMu8ECfb8=;
 b=fQRt+0ucr3k3KIW6VeiQP77KTmmBLQOHy0zj8+dLRArk6CfMUiFDPk++vA1wCugTzt
 GP2aLaNuP586uc9qR7wKa6Xlfr10uKOPA3zoV636cwpEaYsJGPDS+q4mKhxvlMNjgvGZ
 b0aFgS/TrpVxim0WmGOIVfpSg6UtsaFm7v4RyGKESAbD2gDkf4D6BIH1vdKmLPlVboJi
 Sm40wWg98KwvYXrO2WvFYv0f2UT5rNl8y4bIeY9D+wstf0xnKwqLxd7ixup4JAOMNOWN
 2u9YAJxFUITibDBNMMOY3hAo5fiXMp9CyMr1D4/OGzNLdfW3dW6Ps7+n++bROJq9U+Ci
 2aZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULaBvdiD2MjBK4vm+LTcIFqYZeQ6GYPu+29ZM20DUO09O9ySTM5zGPHG8MYMoWdsUUd7VlfQZZNJQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFuOCgvotYnGQtPHF5TrjJzqz2sHFCAv0W0LJtjrfMOsSDYaE8
 K+y1WAAJxGxm05Z0snqQ3YzXES8d4TfsoFmf4ICD+TStqCTmNfxYWLGaH8YERYaesXWfWJ1TfNh
 zG2P8MoUef4m2ETbIHaTKymB/ue+4xJI4YTkkRqNnvDIhlJZB2+Wr2lzSPdRxNuW97DCLRpY=
X-Gm-Gg: ATEYQzwyS7i/0H8G5jNNZalte3pWTwtvgUYX60uETTPgCCHrmEP6XTyExmyG2a+CzYM
 +vROb+8K+RUKxZ6jIkkuKPnULFJGLl917Kves9W6kqXDIr7MSnXOaQtj+7ceTM2NWmnISINbN5v
 6mWtPUf/dlzZRWy4knDO0y8buvjkDE0lGNyexm2xMeX4aEQcpzIoQXwOwTv8UTwXlRuEzTh3WLS
 B73ghrKb6fGLDJ4LRhppCnkWYoAUdmyAkgJ/OoNWYKLNT+SdFhOhLqq6uo8WHa94rVq8zHQGtst
 3bwwenaYB+lv/dWFkR2T8EZG38AwDoqzu9rsgFDXh+qCaaofL/a3mJxoYVDlqhjLljvXdAhh70n
 09ZjWclOOJFml/2HJTV6ntrle0HZQmmkvgqIvCA3NrG2GvRxJjYro90SxaYsZ5jdJViOCCeYguq
 3YCJ8=
X-Received: by 2002:a05:620a:1712:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8cbc8dd163emr1221192785a.3.1772455142941; 
 Mon, 02 Mar 2026 04:39:02 -0800 (PST)
X-Received: by 2002:a05:620a:1712:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8cbc8dd163emr1221189085a.3.1772455142347; 
 Mon, 02 Mar 2026 04:39:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae613ddsm465043166b.33.2026.03.02.04.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:39:01 -0800 (PST)
Message-ID: <136fb7f5-6574-475a-b30f-e5770abfd51a@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/msm/dpu: stop declaring VBIFs as an array in
 catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-2-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-2-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JPVBPaRgs83TpuV06fDpYitZDaV9TNXE
X-Proofpoint-GUID: JPVBPaRgs83TpuV06fDpYitZDaV9TNXE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX8zQ/odmTQWwh
 LPP1qZusARZhvID+0G9Jd58l6dg2EKwff2aqc/JJ27OIpSrDm0qI47fbbOUawGGlBis2/ZBs9a7
 0xHjhLkqzAlz9rsQHh7xYwyW7b0mcnH4U9NG06FtEH0odv3tvIcpZFrjEIU4/1V/C/W6M+vHuPP
 T4aqwMEcvjPbt3y4wnwD9ERPkb3kdnoUvWdlgrf0r3Eo7ero0Rau3L0NnlRzGdiBZg6lKskMjSg
 BiwZsW2DGlMU/xwo0jPvqMbmVfRP3d4GVqmLtlt254Bx7zxjC/DztyOmleBSH+wxgPGCW5e3kjA
 iMsHaNM/XTe+OX7OoWDtvrdMxRHeT78Dx9PJw8wM2ej61IrDNUxSENlHX9AKCPKmVzDNCewAHal
 b9Ae+9t0F2vABWxSGo0qcWqWKKxhNrkLuCbv2YfMXCwA89vj3iDWSWK0GNQDnxKpkUBgbbDv+Sq
 fxFRWfAvN2JVk10T1iQ==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a584e7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xtCnSr9B5oVFkYUcn1YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 99DBC1D8C93
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> The driver handles a single VBIF instance, VBIF_RT. Stop declaring VBIFs
> as an array in the DPU hardware catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
