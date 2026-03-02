Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBsjL3t7pWm6CAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:58:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5D41D7F72
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D40110E4A8;
	Mon,  2 Mar 2026 11:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="psr0z3p7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVUuMvse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6200610E4A1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 11:58:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6229JZ4H3742057
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 11:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3WNHECvu/6QeV24p8N9UVzc9af0Iga1Zc8PGZ6Ufnc0=; b=psr0z3p7AvzLOiTM
 j+SlRSR7fCcF8tyEj/kaQ5VfiJ3BN5mKSD2ucuqEQ4F/uS9eQInsOF71bc9dEIEi
 dLcCNHcCiAiKYOemwblI9MLozAl1mvcMd7SNi4xunW4CTy5xXz5s9f8nmURw2PpP
 tLO5POrCKbxTe2aBlPrbLlYNEYZkwXAPIG3nE8fDKRlS6/WjFEwP/WQymDC3gOi8
 Hf/3XM4+/AmV7M1P4e/VOIOrKooyXd/apgRea0onJnbHzJOTxjwZRP891/HZWCBa
 TOM5rx7KUgmGEOzuM8t1+4QnzMWzW+X131MGIq9FdqXWjEAEZTaw59b+eWBgaOti
 qj+EEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trgh6j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 11:58:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c7177d4ab4so472269985a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 03:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772452726; x=1773057526;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3WNHECvu/6QeV24p8N9UVzc9af0Iga1Zc8PGZ6Ufnc0=;
 b=ZVUuMvseBAhWRdGLW9fMPgwDBAvMvh3fQvCS5CAifqZ0X26eEVpqEXwfJfB5keUhyV
 wvo1qtxHIETjfw2TBqSa5kwuureGF6McSfdfLZ/m77RYfu7KrjGg/x+Ti0GraA5A+IbL
 DlxmaT2DVF+ynm33hkb1sEr3qIu1lPt8Yf9zIp6vCx0IMkhH0DOL9T3xlq/+4Fywx0p5
 1/F8jyHlrKcRyrAMW7KfpW045/MmpK0a8zdXO4w1smkMzg60MThXYFU/3TcRr5m8JYPs
 vH4yU+i4CWysP8btzNmNnDJ5BCtXqJmSvL7Y11VGA4xzh+xES0DZeRtsT0v3U38YH8eZ
 n4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772452726; x=1773057526;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3WNHECvu/6QeV24p8N9UVzc9af0Iga1Zc8PGZ6Ufnc0=;
 b=iPO5UnpUcLfiUINYQX0Y45kB1vFJQr07YLHUue/4KPuFbmPAIQ+hFZvVn3UfMA9UvW
 BDM1rRXYZkUExq3c/Q+SkFsgIquHhRz9y7yKxW3J/oixRzKdENrk40brmmeeywh7X0Ed
 sisnSSiLKrXB+bXm4m7gGs3BBGamG336rcflu9se/1lEW+9Nqbjp0maPaxIVqQMc36yf
 q/evQu3S3KnOXhW6If9xL1+qY+LNkCfH2Py5Z0iQQSTlsDIzUjCnbHz/BwV99Rp9gAGK
 daSpJrFASdpwXmizbZFx393o6/9GmfZMHueZ270oh41J7Pr4JCzj0LLJaWkeudqXdqHH
 hrhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHSaTB7fO/g7u6KWlE8w1wgjPC6CPtmX7CFwb/U1sEN+uE4uILUz5cBe1/tcp8Og5vRVxiCBATu/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze/gI7lGkTJbKh8JkaVZqJml1R1XK/3dysOFCt6uXUfG+hq17R
 LwSiJWPVrhnozCQOMYJwMXu4vFl9CmNMUM/6Acz+RMSiN9EYq/jwDH4mLryPBfk4v+Ck+d45qbI
 NkvbfvQqO6QsTNqHXixoS1C/hSzIfqDIR2P4f+P0VHoQGUUUREcbrxPsbYjEq3E77mYjdpwo=
X-Gm-Gg: ATEYQzw91bYkjmdI3p2iZ0meDq/eohNK1a1e3gnpSo7IY0auwhCx0dJ30td8+FZrSRI
 /5cJYvt9Xd9QjpikS+M7oS+xCBrIiQ0kgZ+wa4uySMYUdSWCyfQ0iAUlFwyR+K+IlDtqqcsZ3sQ
 ON1ULLv+nPsWPNhNHSFeGx9iwI+p+rPnaX2CXbx8AHqLVq4BNjZ95aKVj+ycxrwaSxjtzoapjxY
 Awqdd+/4hgry9z0moZUFmGgkUOdaNDsROBqOII5RHQocC8aWak9evycasTojyRbE2HqLnzpy6RE
 SYtD7U/ZhhnVlq8qSjxWGfOJ1eZ/ivT+SygEJQZ6Q9f6UB8ArvWWY6EnNjVl5uXl391zZqLMSqG
 tyqFWgJ9nsENs8SZsqqRQtYAiB+pTTTmM5wemQdpmCJQHq43CEBvZ0bInlwc2eME7TFxcMrZvID
 ns5p4=
X-Received: by 2002:a05:620a:4014:b0:8c6:a707:dae7 with SMTP id
 af79cd13be357-8cbc8e44f42mr959408685a.1.1772452725856; 
 Mon, 02 Mar 2026 03:58:45 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8c6:a707:dae7 with SMTP id
 af79cd13be357-8cbc8e44f42mr959407585a.1.1772452725444; 
 Mon, 02 Mar 2026 03:58:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae60c16sm461969766b.38.2026.03.02.03.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 03:58:44 -0800 (PST)
Message-ID: <385d044c-29ef-44c2-9faa-0c306af44772@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5OSBTYWx0ZWRfX0IP5XSf/m2jv
 GhO969IzW+goq9gqFKUvtxXSNmiunTvlGf5smsDin7l51qfVbYzDGWqGLvBm+AW6ulXB4d7aREF
 8Hsft4uAP1fIVCki7RkkFGqUwU40mugKVK+wtT2QNDURie5+0Sruw53wu4kpCUHSSLUmkSsNj/h
 uTV+9C7m6E/ysu0/VOfAZX/xHGfGZ52RUGXTL9wcR27BxXwA9VVO4WdCFtu6mt4ZpV8yj7bEUV+
 wl5/jKsGxFsuujBDsSnbbvtriRnmBu+Xfl0a67QGk1of0P/c0za5weDMdHwo2N68lW5YP6/zQXm
 VL97ghMOIoQSBRArLrsOy3RuQArmppg/q4EB6D9sGPcY2T5A5W/DYSigy2BE6i85CtZllmRbpu9
 /Qa3hR+rAm86S/PtVFUj//2IC4Gj2wPTx50MyRIgm04WcE0aVVgpR+YZsMoYT0bUB8/+SEn7PoI
 AJmGuIdLMt3mg8voHLA==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a57b76 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=plQLfFj-HSFRXCTsVOsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: dLmjvzwJy4t0JZ_l7BCqEJ15b7e2F9gP
X-Proofpoint-GUID: dLmjvzwJy4t0JZ_l7BCqEJ15b7e2F9gP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020099
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 6F5D41D7F72
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> Once Konrad asked, what is the use for VBIF_NRT. Answering to his
> question revealed that it's not actually used by the DPU driver.
> 
> There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
> VBIF_NRT being used only for the offscreen rotator, a separate block
> performing writeback operation with the optional 90 degree rotation.
> This block will require a separate isntance of the DPU driver, and it is
> not supported at this point.

(in case someone interested is reading this - patches welcome!)

> The only exception to that rule is MSM8996, where VBIF_NRT has also been
> used for outputting all writeback data. The DPU driver don't support WB
> on that platform and most likely will not in the close feature.

Unfortunately, it seems that way. Fortunately, it seems like it's indeed
isolated to MSM8996.

This patchset is tearing out a lot of abstraction (which would only be
useful for that SoC though) - if someone decides to work on it, do you
think this should be effectively reverted, or should the NRT VBIF be
instantiated in some other, more locallized way?

Konrad
