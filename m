Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAuoOGn8b2mUUgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 23:06:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8FF4CB98
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 23:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD02510E648;
	Tue, 20 Jan 2026 22:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHfxDql2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MxeOQFHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3752F10E23A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60KHIEce668668
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O/lhu1OktkMj/fzAYJtzU5CncNhyb4uT2JsMqcD6BKo=; b=WHfxDql27/yZhk0a
 fKDW8uJvn8sE0HE9kwHhHpFx10CrONNNIYFEK2LVjM4CWb54CRDtIroOC2382QKo
 NEgBBGETWN32/V/GgZaV9G6E0KvaBeF2+DPj8Y8u6AXv0vRQM7J3TTkK4mBy/+jc
 e3Pzz6w9q4ea4ETqyTCdmPHqpLoDytm1gF2PgyzUDS4iSg3+6GbtRxcn6qSshm6i
 W78dc0+VW9jBOwzfK/r2zlvE+jSOKzPkaibqm0aC342GAa3ReXXcZBvAoW8U2Drs
 WpxcujNRpGFK+sPalZ+h+n80fNzcH96XgSOAIIoCNkSV3ZBYPp1VLK8CLcxtcLsK
 6E2vPQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte04rxke-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-c551e6fe4b4so3604239a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 14:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768946788; x=1769551588;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O/lhu1OktkMj/fzAYJtzU5CncNhyb4uT2JsMqcD6BKo=;
 b=MxeOQFHc7MvgQVJVQGzjR6rDW29l2vEySClyDidwqRkYfd3fCMS4YUgq3kZ/zNhE3h
 j2Ohx0fuzijCSSQuq+uYoEM1sxq22fDNWtf2Xkr+bua+HFC3Vlml49p1DQN30lx4zkr3
 aedK1gwIGO6WgGx8Ai71kSQAwxWzvI//KwY1qiu7OnoAkTsTBMbOZHngjpZTS5nViHwy
 A+sJWcuvUxCHBlETfBuxee2QdIYiqFLCZ4gGFHTKJ7p1gU3I4KtvU+nvRubDVu6+6v16
 POfE1N3U+na3Bqf4iD9VwNQdpvfblXd14TGaOZRmNXKn81Y2gnvJSWLWPMkvtBlURMVx
 bi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768946788; x=1769551588;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=O/lhu1OktkMj/fzAYJtzU5CncNhyb4uT2JsMqcD6BKo=;
 b=Aou30nqB7HACYCybyKQ+Oo+e4gnntLT/5sDh2ZhabcIpls/Zy7njLhuGmMRBP2okN6
 aEZZBnMIcgtos9IRkVjbA3sjZwR/5eWjbPLGjKAQpW+9OPFB0K4soRQxrrKXPTe/69s9
 uYhceUosocNcGKiaDFVY8m+EMBbgmWzI65GKkL2RY65J6SBs9nqjsCKdHxcMluIx1xHp
 kVqLLhGapVLsWu36F0GsyAGwwUkjzIXv0DOjKs5YtAlt5QEBZQZqhXR2s6fMGrF29s37
 Vm5uKVXXmHDfiH/rFtauswgJBCiHe9FJaLpAgOhOcciCKcizYOsqE+s/Xw6xjOtL/wyH
 n6cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXskiXRJRRzE9IlaUxlEK5wW0XUTNn2rjjLKOOTIIzICPMxAaT+V8wkdHXAKbjARY9Ph1DBDyfLpOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrQJ5vbAmRg06ktxkiZMZ9IWrNWk/2kzhR7QJm6DzJmyqXdhjz
 cV7nmNGSS5B9DVhFUexiAjJKtdf1hDdPwv5+ZiYVHjPFRrL9kDc3d0vSVXJ+qzdCTxdOMJwWqBB
 HrIIablPBI/UiYJBfye1dUOixXYvSeycZmiQ51K3Hkp9qpeMwf7qhb1eQaVqnpTHZZgu4vaYtTP
 3HjrU=
X-Gm-Gg: AZuq6aLGse5CkWxGjQE+WrYZDq15bMpfEhgGweqolMy58ynbRPgb7vK1auGY7hDKceT
 wnxhvxNfKKAjiMBhWNFkPtcv61kdroW2RB5lZvsQBVyk+dTdQlvEmPkSlC+crsSAyw89sx/vw8D
 aSvmlAj/3Hc2eLeyTeo4fYw5O9FGCxStd0AS++9cS+IJTBtB8H0UUvI5uM6BH1L1zW12yL7r0bf
 TvKEww5GqWzuhRO1/h/HrIWeakc42UG9UhOkPofYkzb8m5TxNjVdhS16bRe5B5KSYYRoYZXHrj+
 wG5LTHgkb0z7SLupuHKQDkOJOXr6iK7V8oyWrlfAQawa5zHSXpmXYo+1AbQ8nbT6zMIjXQjtZtB
 rJCNtBxkzbFTqz+gOclklVklE970DxwufRg==
X-Received: by 2002:a05:6a21:7e09:b0:38e:5535:bb4a with SMTP id
 adf61e73a8af0-38e5535bca9mr117273637.11.1768946787851; 
 Tue, 20 Jan 2026 14:06:27 -0800 (PST)
X-Received: by 2002:a05:6a21:7e09:b0:38e:5535:bb4a with SMTP id
 adf61e73a8af0-38e5535bca9mr117232637.11.1768946787337; 
 Tue, 20 Jan 2026 14:06:27 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa12b30f0sm12867088b3a.61.2026.01.20.14.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 14:06:27 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 03:35:53 +0530
Subject: [PATCH v7 2/4] arm64: dts: qcom: talos: Add gpu and rgmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-qcs615-spin-2-v7-2-52419b263e92@oss.qualcomm.com>
References: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
In-Reply-To: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768946765; l=3791;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=UiwkofKumZf9SEEVAH7lrQqFwDbHX3J4ezRdExFRo0k=;
 b=may0IiBG/mKqcHReuzu+7gkxMYaE9/ibYfx9MhlMl2kdaPISbiGxg0i3gplrX2vNXQBgHlXMk
 OVnOr9BSTnTAN7EPylm/2NoMQI7VWzOpNjHqOX1njQjJxrxI2XNcArO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfX4s8RRg7QC7vp
 NetiADAujwA+/S1X1uPA4sh5fzpBH38kuX+1jE+IIw/6gam8kdSV6Xp7n+5mWz51X/6ybJTodUn
 DpBpjFXW9aN8UwRWflEBtvJ1yuTegKpu1CmCLk3pUJTA5bxqWEWOXldo9DIX75LEDe+qW8Lr9vU
 ZKL0ec+18XycV5J1RE88ikIETg338DxRCBcvrq5BYSdBaNdLkxdIBtGmVEWRMxGrHA/Y/JYFdRq
 WjNtiQh3J5F0TsuTzyalDMczTGFhqmTpX2SPmzA9OVtYSDnS+Ucd1DNmPKbNSuDuWcEAdKdgAEJ
 VWqpz/QkrY32JdWtnOMuQNooQYJGHNrIMJpCSSmTF2edn2gd80veVOTIpDd9sRjJfQ4weTd/Jjk
 +wtpzPK/xHfY3Aw+W0XFU5UUzUPunbRc9iPfKL+1AS8ljd1e7UfddDd4SOgVz+qpthgkbANZpkx
 RWjmiP26TKpQa1TNhwQ==
X-Authority-Analysis: v=2.4 cv=bZ5mkePB c=1 sm=1 tr=0 ts=696ffc65 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZVbKXAHQyaCcsPw5kAfeDKTDoGcGIbw3
X-Proofpoint-ORIG-GUID: ZVbKXAHQyaCcsPw5kAfeDKTDoGcGIbw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200183
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:jesszhan0024@gmail.com,m:gaurav.kohli@oss.qualcomm.com,m:dan.carpenter@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jie.zhang@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:quic_jiezh@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 8D8FF4CB98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jie Zhang <quic_jiezh@quicinc.com>

Add gpu and rgmu nodes for Talos chipset.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 110 ++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 9495514dda1a32e21f53f4afca677dc13fd9cd5e..b51a8f173e1c89e75be2f999ff96fb63247accfc 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -651,6 +651,11 @@ rproc_adsp_mem: rproc-adsp@95900000 {
 			reg = <0x0 0x95900000 0x0 0x1e00000>;
 			no-map;
 		};
+
+		pil_gpu_mem: pil-gpu@97715000 {
+			reg = <0x0 0x97715000 0x0 0x2000>;
+			no-map;
+		};
 	};
 
 	soc: soc@0 {
@@ -1830,6 +1835,111 @@ data-pins {
 			};
 		};
 
+		gpu: gpu@5000000 {
+			compatible = "qcom,adreno-612.0", "qcom,adreno";
+			reg = <0x0 0x05000000 0x0 0x40000>,
+			      <0x0 0x0509e000 0x0 0x1000>,
+			      <0x0 0x05061000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>;
+			clock-names = "core";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			iommus = <&adreno_smmu 0x0 0x401>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			qcom,gmu = <&gmu>;
+
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&pil_gpu_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-845000000 {
+					opp-hz = /bits/ 64 <845000000>;
+					required-opps = <&rpmhpd_opp_turbo>;
+					opp-peak-kBps = <7050000>;
+				};
+
+				opp-745000000 {
+					opp-hz = /bits/ 64 <745000000>;
+					required-opps = <&rpmhpd_opp_nom_l1>;
+					opp-peak-kBps = <6075000>;
+				};
+
+				opp-650000000 {
+					opp-hz = /bits/ 64 <650000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5287500>;
+				};
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+					opp-peak-kBps = <3975000>;
+				};
+
+				opp-435000000 {
+					opp-hz = /bits/ 64 <435000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <3000000>;
+				};
+			};
+		};
+
+		gmu: gmu@506a000 {
+			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+			reg = <0x0 0x0506d000 0x0 0x2c000>;
+
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "smmu_vote";
+
+			power-domains = <&gpucc CX_GDSC>,
+					<&gpucc GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "oob",
+					  "gmu";
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@5090000 {
 			compatible = "qcom,qcs615-gpucc";
 			reg = <0 0x05090000 0 0x9000>;

-- 
2.51.0

