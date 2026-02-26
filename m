Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIjPNCFcoGm3igQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 15:43:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DF81A7CA1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 15:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732DF10E96D;
	Thu, 26 Feb 2026 14:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hv+w9+1v";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekQxYXlf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72C010E973
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 14:43:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QALCdY350073
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 14:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 urofc3orCSX3lD3Xa99/h+MZ/sVw1Y2QisAYKWEofpo=; b=Hv+w9+1v/5KMtX5q
 eEV02TftjDlfno9pQubVjXu9lj8qO2PcVwInP+nxDXtijEUe2ojVu10BzzFdBsrL
 ievKXUjJm1s+Vz2dYGfIMR26Be4upZWBOZZzDNlIwrfOIc+FgzFrFUQqUXubIQNa
 RNWD+LxOl4AhBOQh4Ed7yf/7vOifPsItMTRcPV/8DkY43UrQbqoxtQ7gapB9nggM
 yLI8tobvXUjCzLI3KZLAlv7qOQYf11A6RZSY2YlbvF/P9g4xfoeUzcGQJnTkEQNN
 G0A1a5RI7nAqj8lbcKgrAy8PngVxXOrzhYlVX0iPPA9b79jsm1oFpfMNMp5m55Oz
 MbKq3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjc0gaaeu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 14:43:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb38a5dc3cso79260685a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 06:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772117019; x=1772721819;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=urofc3orCSX3lD3Xa99/h+MZ/sVw1Y2QisAYKWEofpo=;
 b=ekQxYXlf50XYTpNMbdOCmg2uBiQyxFzkUadj4ER+mBHyi+2mxAmm9lCh9NM8k5nj2Q
 zSrW3ykqrFB1indv+/2s70aoKChwbig1Y/ZoDIL1d+b+D7c/4ZE6rHg5VyMBz2U7ZqAn
 Iu9MsTOu2P76UcuHjtNMbXC8tkm3mPFWLg2MQuR0KjR0ARZEFpeW5Ys3OAm8ks+k0e76
 J0cI2deslWJ1AaSqtUFKqx7BQO1SXDhVNLTWuJqrQTgzVeYfOf2Ahkqpqul/M2hl8h3p
 jfnx6Ke6HaD4iKB5BQEoy2h2RTrh9Ebmi4wmz8U15O6MmRLjf7hIyY1el0YwDjGXIsUp
 Vf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772117019; x=1772721819;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=urofc3orCSX3lD3Xa99/h+MZ/sVw1Y2QisAYKWEofpo=;
 b=gRh9t9CAZ992MxEM9+4abpYZqvrkRnRo4KkQTPZb2h5RYS0gHDeSBTuPiwIjlx4S/R
 ZSUTBDvAskK0hApjgFuVBCHjb18iPPZnGSLOkRTRiE/eplLIT4yuElzRvmJLDwEh4XWg
 Vqzj+9GO69iIn1jZzJ0Txse9Vem6w7L48QKp8fzPVXl+KwC2ZIzMRlqCF8+hDF/9lDo+
 YnzpyMN2VZsqBE6nv5bU6ro9ttqYklw9vkDjYsizTWhxzUjDND6HZwhBVzdlnyt3otOR
 ZKog1NPnGFF9m8N4gUtW5qj5+SoY9E3DxmmtVlkfgpbX5i+msUjZBfhtMBaW/e56irT1
 3ViA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpW7Z9iH1jx6P0B4sYmY+k1+x590vbEjQ+GwKb49Ob6ksVfZ8IyjUFvePPdGC+3t2h1ATq+VKzJw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFGu4vOmUgiEbey8N4SAeHgiTxOnBTFUgOVK9k8TP2t/nM3ulR
 3bVQPSGWJ/+cg82ZSx0OsCUCbLsRXetfjH1Otw1AJQt80bpDdBxdE8lIJ0V4IA7XqE9IE2YkXvm
 DLZEey0Wbdb5YuEfVJOXbflKOk0nOI3weqI7JZS4d21VGMSQeSEtg7q7XCS9PHm75BuZBkIE=
X-Gm-Gg: ATEYQzzkONaMBxNYPA7UykpD61wK04zTh9778UhLP4HGZOaOweO67ZMkjXwNsPxuCnD
 QKsPLDUtu7f2LRiwPAMQ0chqK1h0mXMNYLIPM5VnIn/3qQoQ+ATBzYogc8kQWcHEXDDo6sS+xvX
 chudaYRSeWvNQxytEIPVfiGkcgxU10AU/tB4770lrDBovYCmtmNDfBayrTQs4k4Xsk7QHJokkU1
 UVoOvK8AAlA68XEid8wpCMwx3V9zY2lOhuh0FmqS1vTXAoYmKq1XEyyh5lJkI9qv8U9+e6e1Nme
 ZCs2SMrdU4OSUIq2x4b5MhrGeojsWK/oVhl6ORp+BFXuxnQYTzieADyY6d+/Y6M+TgbRGytl8d+
 kw7c1J5YYiGbi7l9n7q1cPxeFwN0P20dKi4i5i+6X0JCuDh89p6MDItiBDwk4wp6HOTrU/k8cGl
 ey9GI=
X-Received: by 2002:a05:620a:c53:b0:8c7:9e6:3a4e with SMTP id
 af79cd13be357-8cb8c935646mr1876742185a.0.1772117019198; 
 Thu, 26 Feb 2026 06:43:39 -0800 (PST)
X-Received: by 2002:a05:620a:c53:b0:8c7:9e6:3a4e with SMTP id
 af79cd13be357-8cb8c935646mr1876738585a.0.1772117018718; 
 Thu, 26 Feb 2026 06:43:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fabd36219sm519402a12.3.2026.02.26.06.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 06:43:38 -0800 (PST)
Message-ID: <b2ace86a-85cf-4498-8c96-21c9a2fed2d2@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 15:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: lemans: add mdss1 display device
 nodes
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_riteshk@quicinc.com, Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260226111322.250176-1-quic_mkuntuma@quicinc.com>
 <20260226111322.250176-2-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260226111322.250176-2-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XI49iAhE c=1 sm=1 tr=0 ts=69a05c1c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=YQTEiYD7NngJoS-z9XcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzMiBTYWx0ZWRfX1k1wElNQB144
 RVtVq2QWCCuU+eejrvx6CJzE/+eAsTP/2Bm1w6wsJbquXg7+XXHRFeu963kPPjxl/jExEfw2rLS
 lSxI1juznB9VlrIvXL8BgUnyyXgwc9VsxnJbRpJFfQcnMsl3mfmxNNIRtZGXIEZ/uPz5wrDRad2
 XzXTI6e50IlE//fZXnodTQPEeb4c2vunUHWotEUeW8hXFmsMUsDl4Pd1T3XhDbEKurcJVuRk+Bx
 iCHFp4XciaeUB/GzZYNavhFgIduVsLnduO/vgjoCzTT0IR9w8Db4dLT6pHn2pMPb07F7xIRSXfZ
 inO2LcTjzHohc70LYgGYZDG+uHInu1DQ1DasC485aRSpPo17vFRQ55YlgzZW6T3MmDYMVhJPKqz
 MPWBaXgEHznc3bNh+s95vyQppwNJNWd+Bn0HmIp+L5izVhr+S7NItevGV+n0J5y7CVjkPQzWkvY
 rnacQ+ex74eO3jNvzkw==
X-Proofpoint-ORIG-GUID: eBW44rV_58NshU6xd4wuNwntha-zLIvr
X-Proofpoint-GUID: eBW44rV_58NshU6xd4wuNwntha-zLIvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260132
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:quic_mkuntuma@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,m:marijn.suijten@somainline.org,m:swboyd@chromium.org,m:mripard@kernel.org,m:abel.vesa@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:jessica.zhang@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:airlied@gmail.com,m:simona@ffwll.ch,m:alex.vinarskis@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:freedreno@lists.freedesktop.org,m:quic_rajeevny@quicinc.com,m:quic_vproddut@quicinc.com,m:quic_riteshk@quicinc.com,m:mahadevan.p@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:alexvinarskis@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_TO(0.00)[quicinc.com,oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 70DF81A7CA1
X-Rspamd-Action: no action

On 2/26/26 12:13 PM, Mani Chandana Ballary Kuntumalla wrote:
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP), Display clock controller
> (dispcc1) and eDP PHYs on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 381 +++++++++++++++++++++------
>  1 file changed, 305 insertions(+), 76 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 1da8e7fb6775..fd4d524d0890 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -507,6 +507,30 @@ opp-2553600000 {
>  		};
>  	};
>  
> +	dp_opp_table: opp-table-dp {

You don't have to move this table to the root of the DT, it can
stay where it was (now the nodes are not sorted:
'o'pp-table-dp > 'd'ummy-sink)

[...]

> +					port@0 {
> +						reg = <0>;
> +						mdss1_dp0_in: endpoint {

I'm sorry I didn't notice that before, but please keep a newline
between the last property and the following subnode (patch-wide)

Konrad
