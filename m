Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHD6D8NmpGlcfgUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 17:18:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E581D0933
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 17:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F0D10E088;
	Sun,  1 Mar 2026 16:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jtsr/JAs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RD0ZqY89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7F810E088
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 16:18:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 621Fpp863615452
 for <dri-devel@lists.freedesktop.org>; Sun, 1 Mar 2026 16:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=F5QfJCxHka7DJDYnQYwLZ0aF
 rY/E/QitDZUCV/3u/ig=; b=Jtsr/JAsxuxd3NVVbg6koEB/mqYAtD4W+q1LDMbU
 kgdrGus+Q535f/D63YRah3EUX1o/sE7/0rb/Ao219SgB3loCuEXLnXENF8S4g71Q
 FJIAkyAGeCmKhW9zCX87eM8sfPEJCJKMRs06YyQuJ2XYUu4goa5CZ5qhsFngMZD3
 bLRp+zl15OtT3my/EFWA8TacezRoatOqj+agcExBBTIexff01RKHd97V205+ZfS8
 HKy4qEkKkxfjbj+qZE87JnFYIHKDUm7ljT/g1BfQUxemnQXz5H+m01UGWnT2LCex
 t4wao2zHIUt7FSIdndW2rAI1x21CaYLEMreChnch4N43LA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8jyx6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 16:18:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb390a0c4eso2406342385a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772381884; x=1772986684;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F5QfJCxHka7DJDYnQYwLZ0aFrY/E/QitDZUCV/3u/ig=;
 b=RD0ZqY894yd5IRAOxdte2tMUY+hqacA2A6QunnUq1Zglj2Ez7zwSLAJIiPIl1O0Car
 PBP82tQDjiM/q9ds2X4cxi7hobFIBWEHtZ24Vco+kOIf3wHnDE9Vxu8+nng6NF/VgPI6
 b38uWVX5WWu7hwQEzlDDwEJwIhDRoMM2y5gUbc9yjqpKvUcZ/FnEGdgZx/X5ocedyVwt
 ZfC30ZAQU3HM7rs6H4BGBQzphQJNnbre09Ve3vScbz8x/YEFnUuaLO8d+k3TPTnCCRDg
 Ujhv0mTBFFyUd6AviEEAPAkpbY/t27KlBRNA3fVhzaVpbTTxrBc3deZ0e5Jb2zThqghc
 ULVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772381884; x=1772986684;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F5QfJCxHka7DJDYnQYwLZ0aFrY/E/QitDZUCV/3u/ig=;
 b=giKBEXjZpo98Y8rvQd8xFCzXTJ9LcEj5i13wBbP8eSUGFFOzEoVd5TPMqXoq95GyoQ
 Q+9OAvXrGSvjpsv+SqzmjbJDTdw90WyDuVxxMNbZmug7vQg8B2fGagGWhI/gvMjVQ8+S
 dSFUZW8/xD6PzbuSQ22xE5JHoWif645GO0z7uJRzwwvDuSfwDJVMBlIuyJ2ANA+dHIjI
 LOmHO2+EhwsbMW18DiGsEsiAhnfx4W9B2Pr/s6fVxalGWO5gU6eYoLX6DWP0rc/bWESL
 EJWpOYnNzKkOdPCljj4gWbxklpwzsoUSGrIPzukuPDt8v3UgLDGktj9paGKfKhzzXP4K
 b/jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO+PP78QCLlSgghEKopFUWoRingRRLCZ8pR0YwnQjuYckYIB9MhX4nVQnhfRdBQUahOuhzohIhd7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfVBR7Y2IMM74vLd90JIefUb6uAV8uNgAMtFVtSmeXA23oVSIV
 48wsIHinVTVF+hJW9akjvOvOVa653Gz+kRj1otZprplHBhNiLo/pQJVzoFFcgePLKtIn5sKAEQx
 ocquK5V66Pohb9fQsfCy67IcaC5RjJaGUPwsu67cSNA9r44C6V5Rzhf/FLFsCw4hBLv4d3pQ=
X-Gm-Gg: ATEYQzyqBPD4CMcXWo2bap3HHl9wKCbOCszRuCGis/tBFEEEwmn7c9azR4B+H8HBbJO
 VsG1VClpX9JcAV3Ke6Ah9p2OvhCxqXzYlf0Q7dYx7plKGZ65NL1argWNIXUoo9wbjwmmttc71rG
 IZVZGiGlfiWPQcycmyiUcjl/xIXLB+Nhe4irITLr+fK5nrxCjfjl8yEagBrRe0irwj6EAJ2AlgD
 hgP9NGHb584qz2aX3boBJBLJswufI3Unb9z7KfZERvxHHib1/SlVBWX287E8fKtPsHS8GShRdn3
 VFdRI9qJxoc4MRdwgO5omVc6jLALyk+z8UvpngYjxFpEQDAtSjbwPNgAAbOR6gurO/1h9plgSxT
 gDLS05+bhGvOaLpHW8KAC9iXKWP0f7AgFZbX1YQ4R020Qs4JgK/1ZJxZIEehcLyb7NmZXXeh9mt
 WvKgLCu78Pkx6VyzH5nVpItYAyFN+1SbMO5n4=
X-Received: by 2002:a05:620a:190a:b0:8b0:f04c:9f0f with SMTP id
 af79cd13be357-8cbc8e176e6mr1177099685a.63.1772381884172; 
 Sun, 01 Mar 2026 08:18:04 -0800 (PST)
X-Received: by 2002:a05:620a:190a:b0:8b0:f04c:9f0f with SMTP id
 af79cd13be357-8cbc8e176e6mr1177096285a.63.1772381883685; 
 Sun, 01 Mar 2026 08:18:03 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bd5a5bsm1103957e87.38.2026.03.01.08.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 08:18:02 -0800 (PST)
Date: Sun, 1 Mar 2026 18:18:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display/msm/gpu: Drop redundant
 reg-names in one if:then:
Message-ID: <xilwtm23vanzhpnq7s2ij7uviceoxq7g5pp3o5m2uebruhywzz@vjw6w6dxyctb>
References: <20260301142033.88851-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301142033.88851-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE0OCBTYWx0ZWRfX/7ZBP60EyFE1
 2YDcUBiZuA+8mMMSSPogQx4Ks3dSQMTJlvEhU/O+LsQYAlB23Xn0L5w70fCCCKAtRdDWXvN7t28
 j0PK4BjaCF/8JmGrmFUkkgtkOI5tifaidi7BTxKgaPNmqsCv53wjzSO1D/Iow9m+lOJTjXlIfzo
 3RQ/SsCOkY3ZupPzeFi/jJ1PLBO6IV9BEvl4UlMqaUiMcrbmV98JdPrVzoYfVYTHBDF8595XkZu
 fw3BB4lQjBpzgcMcky3D54roPo2qa1iEgsjkmX+paqkQgsz9m6kpxqV9WUbWtlBR9+FPE6R3QTu
 I8YiQ39PM8wxneVXxiJYmTXGxBY9pQSALmtckZ02v6VtAIJNVRosmNly0aXG1+kTdRvZ/3FuxRD
 ElY8fq+TJx6DPc4IOsOLo+OKOAdXZvoXniHR0F861hnSiFlIzLb0ks6ctD803XDN3x4TCJ/+pPx
 2Ur1rCHFQyE/5RWJDgg==
X-Proofpoint-ORIG-GUID: vlSmRJzb3PyXvW3CuTv5Svs3LspWEpYA
X-Proofpoint-GUID: vlSmRJzb3PyXvW3CuTv5Svs3LspWEpYA
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a466bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ijTtCazmwCW-ujkA-zMA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010148
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 88E581D0933
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 03:20:34PM +0100, Krzysztof Kozlowski wrote:
> Top-level reg-names defines already proper order for "reg-names" with
> minItems: 1, so no need to repeat it again in one of "if:then:" cases.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
