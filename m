Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DEMDUhupWlXAgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:02:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD501D71AA
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC96610E229;
	Mon,  2 Mar 2026 11:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RyKMWc+E";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hywtKsQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3902A10E257
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 11:02:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6229EnMA3630795
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 11:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZrD0+e5gZel+3U94lcHkfGnkgY2W80Bgk3xf+Y1/Kck=; b=RyKMWc+E4j5NIRM4
 HEZwyszG/T+2pgnQ7BFXanDC+bNdvvQrkRFt8v9QgpM6OrjKF5M/TMA6HPlpgPnC
 M+xjRDMGJu4M3m5N3D6/IlUK/TO7ofzg4kiCJi0LlhZtBhvyvOruPaupUYJV50rL
 HjCN1dpkQzrSlKhhsMaD1ddebh1++KnDs12AJ2kMCC2K3dgGZsG0RNTwlZyKC18t
 W+MXm1SyfY3ia5ib8mFKY5T1WKIJSVnvAX+7tO1zqiOhFGw8c8t5ZytXGfdNorHp
 XR6daooBGon0CsAN8EueovnfycIuvIbmqtOi/7RYd95br4wfBewHvt++xBh2b23p
 /bN32A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhrcfc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 11:02:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb38a5dc3cso436648485a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 03:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772449347; x=1773054147;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZrD0+e5gZel+3U94lcHkfGnkgY2W80Bgk3xf+Y1/Kck=;
 b=hywtKsQRjk5MdmxttWLRKiteBrjFw990ueO4lf18nZKBUQk0OsjFfi9sMt7oGQOjxf
 C9olMwJlncDGTwn3m41FLYTg1WYkG7wIkl8QMIbhNRPFsXfCy3Ov0iLT90mHBEhUHIUb
 6LcxAjP6X2B5PJgVWQ3oIW8ggN6/DFJiBk/dlgOcCLsmILDky8pVCMje/uZ9u56EeHB1
 JSEzxPFVoBWBnsL/SB9tgj/bFEg59E6X+hZxiZPIPxZxAjMVL7rnsL48b29NIbimN+nI
 WEQr+mGNeOTqUa0ZjGupkB9pcunjp7rF6ZMbIv9SVXvP8KhmO++4ygozxJMjLu3NVWEO
 wSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772449347; x=1773054147;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZrD0+e5gZel+3U94lcHkfGnkgY2W80Bgk3xf+Y1/Kck=;
 b=mLryQ/6o2iYzBNSxslbZjL8mCBpc4ngnWXBYfjXDgkzObNu3NodZmXEutIrHrONR1e
 avm+7XCZcaBJuWZ43EgBLgzP3ZLnFsWhHnoArUQH0DkC3fH5jBdBENFOmkCzhPdrE8Kk
 7oZt1b/oQsrUxSHeSz2GNf8RSfoS3XUERlMgERe+FJ1RFrqN8EN1lwFgysfWPyHYHWrE
 ZSo88+TmvVQ8m8BxzQwlNbGFDd5E7O6/1J3yu7yz43IVOn7G6m9HG5DUym9rEHlFjpLv
 JLMRrGwwDTLir3r94HpZZ+++r9AR46HWBH+ZLkQL33rE4wYI8IWLWWvCl52FMrISuTQt
 ynEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYO+g4GR0aLw0aAv0ewQtnSXSoyF91vGeemj0XgFInfffxCPvLHg2ZtDPn1CC7kRnv2nrHM3Np1+U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzuet9gFIDnV36bZ/KZ+1/TtvhnLD58zwKhDomcPUbxKRoV9ljH
 h40d6rmJd4d5ZDObTUQWDK4W1I1RHVwg4Ub2ol/91fIE5jrFpZU2qrvwukw4Fe+30r6K7ZoJrQG
 8IKpV2QLVTn8QhIXJN1iIK01gKE3yT6QQXDPqRVD9/QM7YXp2s0VTmAJVaf2Mngy+6HZdTaM=
X-Gm-Gg: ATEYQzxrEskjKxm22AFqn/aLGAtFH6/O25IGajirmYQHyzKGxuVe0VHUEuzT5MwfIPE
 WsAK7K9HdFd5NFNrLIMvManP2J0lN4blUJ9GfNnmZXujO2pEo0DmX0vvoEI14T6KjZZk2mIccfu
 eN0Zw8hjQ5ZpGN8SZe4YOSN+Ug1pBAKUBZEbQDChiFRDel0hLP4cAynw1Y+ZGP8whWiYR+73rIP
 peqP1mnqtPdePYbYXMln+c7nqMguABCakMxwPh/egB9H7bvOn+BhdxtsWt+AQmSp8xQw1Mn8Pqv
 sGBkpJTXXTURFzdMiuED2ZSWiWH7luqRRCnLKfZRQUK7a3q1yAb6fiukMywTDJ3V5lw78T5puM4
 NYfbR+0uaFbXta7XUIlcjX/TD3CoCUvwnq+O4qs8Bl/QbMu5zeNVBZI6591XuFDwIhc+3Oj5oWf
 dnOd0=
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id
 af79cd13be357-8cbc8e79d8bmr1104215685a.9.1772449346396; 
 Mon, 02 Mar 2026 03:02:26 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id
 af79cd13be357-8cbc8e79d8bmr1104210385a.9.1772449345842; 
 Mon, 02 Mar 2026 03:02:25 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fac06dc16sm3314925a12.23.2026.03.02.03.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 03:02:25 -0800 (PST)
Message-ID: <4489ff9c-a3aa-43e9-92b3-d1a52fdef92d@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:02:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on
 SC8280XP
To: Pengyu Luo <mitltlatltl@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
 White Lewis <liu224806@gmail.com>
References: <20260228141715.35307-1-mitltlatltl@gmail.com>
 <20260228141715.35307-5-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260228141715.35307-5-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _wRFLy_oUUufazP2CSN_FU69pmWpH5Rr
X-Proofpoint-GUID: _wRFLy_oUUufazP2CSN_FU69pmWpH5Rr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MSBTYWx0ZWRfX8EqsJkrxiI/p
 MXsRBh6WXKUXtBZxYrx3TjSzXnMILoaseiD12sN5KxzdxXjEZTTbG6Q9+FMje6wvjPm2mb+1CzS
 wflasn4p8sFtYfDLwepj/xQlJEkKvCSKgQX33dFmWhnH8F3xM1eoq7nIXqkiqEYmxy0LrIC/CHu
 nUnr4z0aJcceSs/TJwqLdkvlocZQE0kS4IjpcBhNmAw/sSbiWA989IVFgbp1enCedX6RPmm/jDa
 3y34V/5exYzOo/y9JE1ggUjsyDLpmzVmNf+7tzcBuhK+Ky3MO3byV9WhZG74wO/hyH5crAio7qs
 VTY3XmiOiK8mPc67oUOmMGjS738pJlRLsvsve9BXUqsT9cYxH17B4wq90L1KffIRtEszWk+GK0a
 V7j1qA6fmRPj20tPq/CONOZrjW2anSKaWA0caFd/ZEgSle1xfgW1Z5J6N8dznFJ8JAHwNeeE8ZV
 Fk0hjm8UVdbYK1jrhJg==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a56e43 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-LkXMzDxGcKDj-WG6ZYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020091
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: CBD501D71AA
X-Rspamd-Action: no action

On 2/28/26 3:17 PM, Pengyu Luo wrote:
> The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> utilizing the same register layouts and clock structures.
> 
> However, DSI won't work properly for now until we submit dispcc fixes.
> And some DSC enabled panels require DPU timing calculation fixes too.
> (hdisplay / width timing round errors cause the fifo error)
> 
> Co-developed-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Tested-by: White Lewis <liu224806@gmail.com> # HUAWEI Gaokun3
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
