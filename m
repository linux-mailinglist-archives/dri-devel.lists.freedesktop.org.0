Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG8WNr2FpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:42:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB9F1D8DF3
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE04610E4CB;
	Mon,  2 Mar 2026 12:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKfUUMmS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjV9F0sG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAFD10E4CB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:42:35 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62285YFL662249
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 12:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HIKO5P6PmTvp8kuGDeHMIKG3uzkbrKKydli4TZkIbn8=; b=DKfUUMmSziS2BGL6
 xQKGtQDJ4BZgoC9mtoVksPB8R1C8a+kZmSosISUyr03TYtD1H6TR+jDUCi5D6+St
 FZyQkuUe4pENsKrtPKr/ISJYJGxlFuCFdPRuoUSneyGTSWwC+BXnDWnDRVCJFRKN
 LSE22BCWj/P3IuFoB+pp9MXOepk5IjVvbBsXPF+p+dG9JcQkCaXGeCcZ8LyKs7ek
 kj6rl74Q4AWg0CbGH67miBC9nI87Q9A2QIP72LA1cHnSXoA7g2Etjs9i5hzQ9w78
 hyxDGk9nvCFjEJgvGbM7vBsty1ZDvxHfc9YYHXW6EMekIiXefcs5MGvW4zfUvrhN
 QTz+mA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2s0nc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 12:42:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-899fbe67875so4207866d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 04:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455353; x=1773060153;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HIKO5P6PmTvp8kuGDeHMIKG3uzkbrKKydli4TZkIbn8=;
 b=KjV9F0sGjAxmaqtOb5GE93SdXeMWY4iw/a1JpXw0t+X0iyiC97q4UeD0gdKeBffiSm
 0rmxUhCBcidqCT0bzcQtVM0q8eTxWfS2JnBSsJDIwoa+S3PGvYqy4QQIcAiGTnL6QXJe
 YshmmTuLCws7hGIkgQ6aqze1ZjIkS7j/ph9bYGKtsmc5ZJNVs0YEoubPYL6DKLhksY3k
 +u86HN5pD97wTWdVyU1EbhixIT99MlZuAVqSALr12T4+oXsbATvL/e5K59hDFr+/2fqf
 /aPlxTu/ED7V6g9AhFcOkSC4YWPtI2hotSo5X3Oy5RWc/zxhW9/wGw4hmR9NpVk5IbXU
 UcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455353; x=1773060153;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HIKO5P6PmTvp8kuGDeHMIKG3uzkbrKKydli4TZkIbn8=;
 b=v1eWArio7KaIivVTJNO0jij2dbAQe220SJF3vdlILgqJVU8DUR5pyecndSFlqStSD4
 9oTrGi6AeijAzJL/gpa6h4hZW2dKcEkVWK1g7cq1UWa/zQfZQMLkWJWQT5ZIAKIpy1fC
 o18Y9wwD+ShG2yajmJmD75c9FffmMhuz2Y5DcUKb+G+bqIQLZfgSTFpzuFENP84DEB8u
 ObNwTeE2GjpXV34Ljjo03rIsZnEJ8qccn/Sk+sGjOvJLhwURhdk9UgDRRrtB3zScY7Vq
 fuDQ0c/xOl81sXwnnsw8XdFx86rIYxqeaYS7Mr0VyRGqbkUuiMPxAom999hnH4FK/Eas
 67XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfYYr993Je2MHV/K7CevXmvH5N91eCf8GNTdhCntVo5uhZprrYYL4dxLSZHbO4SdvcASboeurIPyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0+XMK7mq7r8FmrPOQCpZTRKzOsuEwjnhUZZ46Y/ghNnard5AL
 fx0G3u+GampxkVfXgbKKbjDtzhCtlCe+8LbyQqXourfWhYiC3TkdOnq/bsMOv/VAm7fLCWCT1jr
 7GboTkQwsefmLEW6HZt6SAC3BPtNmrHoijut7Ud6yqxnYx0c9FANJPkpW4iw0bBz7wwt0QCc=
X-Gm-Gg: ATEYQzxfu38xLUdPV8j2equZEHu3S4i2a7xR4ICYj2FBG2iXDLFze4Uhne1yWScTY0z
 QgeE4fyQg3s5itimZc01OTEMPS4EFbKv/MM2Ptk/ixjNli7fqHKhZ5j0Ru5sABoAAccqfJ0yQyD
 FrDektHYNPm7sxojciNcygmutGPI3mbikjSFFiKTWbjSfaVWf1eD1I5iLNDlDCPe47zcC4gVkFd
 fUC/6o1CvCHLoeXOQFGRGNulIcuz4E9oYqZGf66FM40e90q4qbf0GsrvSONz3zKA19qrHp4+BVK
 UPI90jZKxyYFvTHTVHPdAWJOYLuQduBWraoET8GO/XZJaG6oCf+vgyBvQePYRZHutOWIRRiBRUG
 IlTHZdlhOTfa4UV9Khklu/QyJnEhA6mczqFOfoRfkEDpenwJGbU24P1L5IaBnILpMPKfD6L/Xd7
 MfK2s=
X-Received: by 2002:a05:6214:5e10:b0:899:555c:cb2a with SMTP id
 6a1803df08f44-899d1e5bb1dmr127337366d6.3.1772455352597; 
 Mon, 02 Mar 2026 04:42:32 -0800 (PST)
X-Received: by 2002:a05:6214:5e10:b0:899:555c:cb2a with SMTP id
 6a1803df08f44-899d1e5bb1dmr127337106d6.3.1772455352166; 
 Mon, 02 Mar 2026 04:42:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae93357sm460111566b.48.2026.03.02.04.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:42:31 -0800 (PST)
Message-ID: <b1ce41c9-2532-45ac-a883-2de442188d3d@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/msm/dpu: drop vbif_idx from WB configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-5-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-5-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f1WgtzvYVO013Irnd7i4237e2oWwuhJp
X-Proofpoint-ORIG-GUID: f1WgtzvYVO013Irnd7i4237e2oWwuhJp
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a585ba cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TNk1r7c1s_7MY2k-MSMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX4190COV6Ay03
 nxs4sfEkQMRWDNmLXhTIdpar6Lz1alxf3ldEMP7iwureFe3FwWp0f93reYe/Coycwy6cXAQTeOc
 RbrxNeJzYyWhyNswUgh+I8cYgkWE/14wBIKxLpKrWDVcoMwyfBMsl1+uhfv88iM7efX4fl2Xo2A
 WbeDx84JZ4pf49kJGdbD5p1B6J5MRdIh6kBzUFFAvraRj/OIbvjWtcT22LGkJqsy7IMoGhcSUWo
 4SsGXHHvc8livxELxK+BRyp4sEeIkFnomJCIaPGODSmE/1P4C8F/rk/etwEZyfXLXYVQfmJLHX6
 ilzoYiqnudGYm2SE8kJjbH16slBr7WobZUuxUI17wdGa98o84S0Wl+5V03n484/mL/hN+7fpxAe
 ziioboNxkK9aHaguvxRmBbZ6lnC3XF/LMsREOcAiqTTyKq4XIhsLlB1GydJqM9+obNwOMPpdw3l
 /IHvnLoxWlC9Wh5ol3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020106
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 8DB9F1D8DF3
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> All MDP / DPU implementations except for MSM8996 use VBIF_RT (or the
> only VBIF) for WB2. Writeback on MSM8996 is not supported (nor planned
> to be supported). In order to simplify the driver, drop the field form
> the struct dpu_wb_cfg.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
