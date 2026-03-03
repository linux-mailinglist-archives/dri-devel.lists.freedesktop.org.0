Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBzQCmbmpmnjZAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:47:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4407A1F0A46
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68CC10E81D;
	Tue,  3 Mar 2026 13:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtoxKDAP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBjL+uFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A598810E818
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:47:10 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239nH2H3349616
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 13:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oKgmqL1YCMPv2o6NC8rarGbo
 mPdgxNVvsx/kVplRDBk=; b=ZtoxKDAPjQYaJkMtZodUOrx4EtRFn1y9eFTgplZp
 fcV2xPKmJzWL5QPt4VxvtzIHdIEd65EzM7q4Siv7m5vAfzV82qEpPJq9epyF17ms
 5e8oz2M7sXzpN17CU+bd88Y+4te/SQMRNXZc9+aXAWWAcfa0vwF34IAtJTcsHgzU
 AZBshHqu3MkMneDgKiTCNC1fWkjXYXDWylb1smKU4TtchvrFhBRxCW8f7D19nM3y
 l1dVGeer32Ggkx1fQxTzIOHhMqCDxBsXVRoZ4kZoNieUpi5S9jAdiIExPtEYQ0yf
 b1n01/Xob1cuNL9bfgjZX//cSv7eT8vA603/XH260AyYcg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsay50-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:47:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb3a2eb984so4180526685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 05:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772545629; x=1773150429;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oKgmqL1YCMPv2o6NC8rarGbomPdgxNVvsx/kVplRDBk=;
 b=dBjL+uFzfyO+WaOxJ2FX9htDKZ9XUpvDqF3yqSEqUJRVMl1IT9SIXHkEK3Jc3BTPaw
 zZG5eVzRzkcKd+9iXQh/XlsBNAskSDrnaWXAg+NnY/uPrvofO/NmUhzUqaruUtkYnn+w
 +08glI8g77nK9+Wtkqd7uX8NF7o5c2G6wY/LWk3uv+XGJ/bz0SNlanPywOTp60RM55f0
 f/rgSH9kOP+1SYhzxRebeAHv7t7k5ncetZFksU/MBgkssRSecSE9XFmU+b/ZujF5+bmR
 v21UXkJzK52AxIcQowCl+V8QjTFg8jjGAuReFOvmxUVPkMFY91ytfuQGaWmfKnICyl5q
 kFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772545629; x=1773150429;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oKgmqL1YCMPv2o6NC8rarGbomPdgxNVvsx/kVplRDBk=;
 b=So9odgn+6fck8UXAklYOnVEVtasOZ8viz2PVT2lVIowFSva/UbcD0UXPrG4h/bOj1+
 RMNt+JppGzhPNr3oLPS7Dtg0jtfk/1KgFvUEu3CYS9k1zItfZJmJPF0c4O1iCjDDmd4I
 L4iOKgGhlLCthNy3+nTM4X63/deNcUT3NdxASjhyTUxIM0mgJttS5R7NoyQLyFE34vEJ
 po1x+uV+1YJ+Kfk+MzdsRpEglOnKn6BF/jmrQ3mWWdc5c8AWf+vP9jGld1hqW4sDw4XE
 KDIu6WxXFv6qacFlFSskfHU3aSwUkdCcfeOi3z3OYfnLZ4O+/wyGpyfffiurCKVJPJ1z
 pVmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmW3J3kFpkod++KE+peHeM97T3C3PsfuDmVo53yXiv+dqPnJDy338cd+HRVBrli5PgTcWFOZibkrQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmCqTZiz23CgTerW3/VnAkL9LCRdgZgZg5dBFVkjIOoShH6lw3
 9idDh8x7tzC7at6bE3BDo6JhhHcHr0HGFo981gIBQ7DsnBgBeb3uHpvrw6zs8uFwVraTBJzA1ow
 GiCHKdZix7OTImBnbAiXcYhLfZEcQdpzcxwkr8tXVeafIKS3fW1qp4RFt4EecVoAyo4vTnCg=
X-Gm-Gg: ATEYQzzevMiogr+i8ZDw1J/MGoMc0R3pCVfvltM2HjZmtSef3rqEAihsMMLdq4SSvCH
 QQVZXfboFFnJOuf/UJhzfe0pPkAS+dz3PTnEV13lOBFNy2h+kfJKOO7gMRCH3iQ8rBxfrfHOTaz
 H3YQaZVP7vMdjUg1ugzCYhBsrHWuu/8e2Sdk94e9eSHXp33U9u1BMPLMdONsWX5Tg4ES6LpXFXW
 0kQmouueMQxMZGxpYij+KDoxxF7HtNAE/IaYalCm5zRi4io39Dc17aXxU1SpodHQpzCbxHCfXXZ
 RuioDqScqEhyYTS0E0HzNlKDr3MxwUMrdQhln9nxkrnoTr0lj+jrMQszHj23lYuuYLyDc1UBYbj
 Ue5ivlirTY3PHPrb8TVNIrGpCkeF2l0D1IrpGTKbEBNiNSwtAJ0nnrU7o9Fyc24EjCWqpUMotsa
 6wOQH20JPI/Oi9DCl9vSTU/vZ2W93Xv38jf1Q=
X-Received: by 2002:a05:620a:28c6:b0:8c6:afa6:2700 with SMTP id
 af79cd13be357-8cbc8df09d0mr1830333885a.47.1772545629074; 
 Tue, 03 Mar 2026 05:47:09 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:8c6:afa6:2700 with SMTP id
 af79cd13be357-8cbc8df09d0mr1830329385a.47.1772545628539; 
 Tue, 03 Mar 2026 05:47:08 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a123578897sm597948e87.63.2026.03.03.05.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:47:07 -0800 (PST)
Date: Tue, 3 Mar 2026 15:47:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: display/msm: dp-controller: Add Eliza SoC
Message-ID: <s27pxj2gcjqbw27xslxzrhwl5nx4vez3z2bw423b63ddks6bag@hy55hk3hvefy>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-1-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-1-814121dbb2bf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RiuLGxOVAz-g2VmvEs1e0dfexrLGouP7
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a6e65e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=28-unnAo_Gxf_zrB-rwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: RiuLGxOVAz-g2VmvEs1e0dfexrLGouP7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOSBTYWx0ZWRfX8X/5v2R3Gu6/
 +2tz9vbBkQs8JtE9Pj0GFd3fS0GGHvgJNRSQY1scBsnm9G9WjhQe2hDZv8JCJp8+OuUFPsNW04X
 ESQQtMFY45EhAWHKib0N9RTlFF2lNxdcz0moNjyKk+C0Y55GV/8QNrQO6hJJzAhZ9QuAuKXE8jK
 t5Pnfxv8tEFDAxga4PIHDJgFSn7aXrvY3XXC82KSc/N670F73zypuu9HJAEOJBgXV6XV2vefQHt
 iMXgeUDpB9f2uGqF+O1rR6+lvAjEBa5uWoLEMsbnAKu6yRsmx2aAduwU4eYJFvTkrZOAjVjeHxZ
 2UEFiESzzvL4jFQWq3ZqhufZ5qK0n1uAt4wD5p+Qn+zlwKJUSHE4ELahwrngJYZrFOMQ4thRGhl
 3rLj2ZevzyifX0P9Ql7PSWXMOwUL5OpDna7ou85b5mPGq0kEJZkOE+E4/pW6EAJ49FpyxCblxvp
 rZnFWE9acMRaFBdh+rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030109
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
X-Rspamd-Queue-Id: 4407A1F0A46
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
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:51PM +0100, Krzysztof Kozlowski wrote:
> Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
> SM8650.  The device looks very similar to SM8750 (same DP TX block
> v1.5.1) but with few differences:
>  - Eliza and SM8650 use DP PHY 4nm v7.0, SM8750 uses 3nm v8.0,
>  - No MST (according to downstream sources).

Don't trust downstream sources. HPG shows MST from INTF3.

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index ebda78db87a6..d06d396df4c0 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -67,6 +67,7 @@ properties:
>  
>        - items:
>            - enum:
> +              - qcom,eliza-dp
>                - qcom,sm8750-dp
>            - const: qcom,sm8650-dp
>  
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
