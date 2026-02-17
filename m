Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKNNEt8blGn0/wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:42:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB63E14941C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A552510E00A;
	Tue, 17 Feb 2026 07:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hz82HG9C";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWc1lS6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D018F10E00A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:42:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61H7SD5T3394685
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2P+ECG2vxZRApWW3EQOfpyiF
 thEBPrS5O1JGmhWTvVU=; b=hz82HG9CNLKnvW1q+EWyiLA/LZredeZN2J90x/qh
 dy4px04E/HNbPuq36qX1J7rOKW8e7CHt3IsdF9WYD2/6tw0gXMYPRuSvqRJaTadr
 pvdtO0SN8agIJ8p2RA4N0FVo6CI5o1vs3vxakzP2cXrKzFeEIuVNwNKu6lBOvTTQ
 QAZQ3bakDSXz5RqnBHE0VPE1Je6DyXOeYZvDMaMI+IH7gm5H0nEBAJoUU+OxVwDJ
 Ygo6j3/Idpivkt0CZixyqRQ03sAosTt/HjvWV7l6CU0wLBzczd8Xu3Mk/B17KRP2
 0EEb4XFPojmqhBUXmfph7uZUglaRI1S9s39BJ9GBISbO3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5kh9qmf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:42:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c70ab7f67fso3935180985a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 23:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771314137; x=1771918937;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2P+ECG2vxZRApWW3EQOfpyiFthEBPrS5O1JGmhWTvVU=;
 b=IWc1lS6eGTg6t/rED+6yR20xtsw6S9LVCr2VLzItOZNdsSZ/YylD/TeNcyDtWT5WBa
 tRi7hguN0zObCAFl8OmZMDVoXewvwpnaTk5aHIc+ZHZ6WGNzIPoGz3biThJYR9VBzx8K
 DW070G66bqZEdXqQAATOzULcdVsOVF/22cUGrQg0X/+DsohjFcWVJgHDa6eEABz98pn6
 jCT0RpjKXjnLO4r58vZeX910EWWCIDH3lRUgauXLGObIUHKlxpJsb1KbI4gK9vLs8LrM
 hKa9SwoIn5e8BAvR8dtwgGHg/44AVLXMQI4Md4kZfWD3NQbJoU98OV892kxhGfh4lC5g
 wvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771314137; x=1771918937;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2P+ECG2vxZRApWW3EQOfpyiFthEBPrS5O1JGmhWTvVU=;
 b=l12dd35xzScAEn0FyOWDiZzRWbLMI1KmejkqLGrl6VwfRbCiTSg3sb0Co74h1AI+G3
 bvr/IK4eLFN5laqu8ksCu7GvkwYaDBR/v1Lrx0RzoeO8g4LqlwvxZdcNoeLxY1yW6tXP
 zdredJuFmvJ85lNJP7ouPIg/lkhjSuJryJchFXoJEv6a96oYBqmPcz6Bq2sMDspBUuk7
 wlG3VKhoH7SkJW6vyMn4wCq+ZoaAEDOCyznv1mpDFdTK2azOE5WTAvCznW5hLlstdgcn
 lzXZzSqekY1lowivvK4nwxfuEdCA44w5bewjaRF0DG9ZvwQ3jAaF4hYavX0NMyVTTtKr
 nuvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXssQobeC3iQbxe/OkxqK5XVo/EcZHQiLnqhyhfOYyqviHEgqPwd/qBvFLk/DIoQi0ZpQD7ODqPHxs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvyfpA9vXRErO31uhO4YzZzQBEaTww8n1ZCsCJ/fab5+zG8Bk1
 TuBm3+0Z9QGZdQMU6i+s/xJwfol1qKtGn3nTjP987T1WDdarGROSUSHIwzUzDQ4AZZcwBDfObSI
 A7oRC7nD21h+S9Ae8o8aHLeknujqKUhO7zv3qRevcpGD1Vg9lOrBHcjxSNKdIb1kLA0IOfJQ=
X-Gm-Gg: AZuq6aKVCG1LKymZ38fkFyI6kSM32AH7O/CHY9v9O8NGjQPbZ8h6AP6h5r19j2NjLPs
 WgYsddiJM7/DZDoaw7c1E15n90rp7xG0CJl2ytqSIfbxv+FTizpHlvXbETRrGZcjhtdPV8z13ju
 AdzpLLsJWQJ4+bcfa9KeumW0k9BhnoGLtp+lXT6Pmm8/xXTIjMtfn2JtuIVj9RBDLzOhbjz/RWX
 c72M64lG37oY73GgpT4Y3Mbeqj3YcZcPc8sYxcA9A6If+clvoPpB2qoWUWYBC/PuWeN+AKkxb3x
 cD8T3eo4xb1xcmc/3PQui4h4VEEyugn7ZBTpg6NwYe/Xn++D/NO5z176BLCyhEY7nTWnrQmgsOK
 LKxeCVhH36GhM/WkjBG2idB1/PUhq9KVsY5VrMuzThc8sXZNTTkIfMlOOcks6r2vCy9jBF6WPb6
 c5lCzxaAoUk7tkUjDdF+tacaj5dUlIJomIGFg=
X-Received: by 2002:a05:620a:454c:b0:8ca:4438:b8ef with SMTP id
 af79cd13be357-8cb4c025c1bmr1178894685a.69.1771314137244; 
 Mon, 16 Feb 2026 23:42:17 -0800 (PST)
X-Received: by 2002:a05:620a:454c:b0:8ca:4438:b8ef with SMTP id
 af79cd13be357-8cb4c025c1bmr1178891485a.69.1771314136799; 
 Mon, 16 Feb 2026 23:42:16 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5a4fcfsm3692473e87.46.2026.02.16.23.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 23:42:16 -0800 (PST)
Date: Tue, 17 Feb 2026 09:42:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_riteshk@quicinc.com, Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: lemans: add mdss1 display
 device nodes
Message-ID: <konkomahmiuuqn757wjpsxt722lcbzougoqyxhzaskqquuzbfi@unets5hlsw7k>
References: <20260217071420.2240380-1-mkuntuma@qti.qualcomm.com>
 <20260217071420.2240380-2-mkuntuma@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217071420.2240380-2-mkuntuma@qti.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=69941bda cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=SI5dRhP91uxaG1B2flAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kCN609-ocKmXImnazi_qVr1mk1128UnY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MyBTYWx0ZWRfX+hXVnNwaLL0G
 OtTFrWNyNLYASWNN7nvp2QEK7wT/dkvEepHbNOm3AKle5wRdFnL0liQRIGCmhuBYrgzTxo27pHG
 citaf3sQiQK+wf3Vl7xfwDwFzXpDXuooo7MHKNysRLyHgWM/AZg0kPwq7LIDbMlRBLEXAfb7EzS
 +ySNFO/ZRfKP0+U0ASJ+yq3ajRJMTSdDyHYdsrGBYcje2O+itP8pSVpCiRRMVQxssI+N8Oaxt7u
 INsmwTMBmu16l8sfEgx6UsPOpo6TKZMGPb7uEMeh7IlrbtmmV3MWFkSsfOBQnOQliOvHvFDJW0Q
 Z4L0ww0PYoFnvN/nFws/TYssiCHWwduhTZi1KQttgoRt9OwQlDF+CjvSxRBp5G1/6z80jAQCpeR
 93LE54H1Cvj9Lcguexs7R6IBfxcd4jvOvQ/YahO6VABkFcfB9tK1kj67uuJWUTJpvJMJ/HS/9Jt
 QPJX7kudA6jl0Nd7JSw==
X-Proofpoint-ORIG-GUID: kCN609-ocKmXImnazi_qVr1mk1128UnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170063
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[somainline.org,chromium.org,kernel.org,linaro.org,oss.qualcomm.com,linux.dev,poorly.run,gmail.com,ffwll.ch,quicinc.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mkuntuma@qti.qualcomm.com,m:marijn.suijten@somainline.org,m:swboyd@chromium.org,m:mripard@kernel.org,m:abel.vesa@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:jessica.zhang@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:airlied@gmail.com,m:simona@ffwll.ch,m:alex.vinarskis@gmail.com,m:quic_mkuntuma@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:freedreno@lists.freedesktop.org,m:quic_rajeevny@quicinc.com,m:quic_vproddut@quicinc.com,m:quic_riteshk@quicinc.com,m:mahadevan.p@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:alexvinarskis@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_PROHIBIT(0.00)[1.94.243.192:email];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1.81.56.32:email,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: DB63E14941C
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 12:44:19PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> 
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 315 ++++++++++++++++++++++++++-
>  1 file changed, 313 insertions(+), 2 deletions(-)
> 

> +
> +				mdss1_mdp_opp_table: opp-table {

The OPP table is the same as the one used by MDSS0. Please move the OPP
table one layer up and use it for both nodes.

> +					compatible = "operating-points-v2";
> +
> +					opp-375000000 {
> +						opp-hz = /bits/ 64 <375000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-500000000 {
> +						opp-hz = /bits/ 64 <500000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +
> +					opp-575000000 {
> +						opp-hz = /bits/ 64 <575000000>;
> +						required-opps = <&rpmhpd_opp_turbo>;
> +					};
> +
> +					opp-650000000 {
> +						opp-hz = /bits/ 64 <650000000>;
> +						required-opps = <&rpmhpd_opp_turbo_l1>;
> +					};
> +				};
> +			};
> +

> +				mdss1_dp_opp_table: opp-table {

The same comment, use common OPP table.

> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +

> @@ -7055,13 +7366,13 @@ dispcc1: clock-controller@22100000 {
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>  				 <&sleep_clk>,
> -				 <0>, <0>, <0>, <0>,
> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
>  				 <0>, <0>, <0>, <0>;
>  			power-domains = <&rpmhpd SA8775P_MMCX>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> -			status = "disabled";

This needs to be explained in the commit messages.

>  		};
>  
>  		ethernet1: ethernet@23000000 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
