Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDi/E6bsgWkFMAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 13:40:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B4BD91E1
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 13:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08DF10E244;
	Tue,  3 Feb 2026 12:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8UYK0aH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvA6+7l0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48D910E244
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 12:40:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 613CO7hc1777166
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Feb 2026 12:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ufTr7+wzZ2/b+1pjL/6eFzV9
 KL+yNiviwWGyOeRQjGU=; b=M8UYK0aHetEUsxaG2LKBeqrC86ZIxw86xY0exxR1
 MmQSCmtaJnsc2+0l7c9AqteOJkcg5TTdN0TuKWZCWn1h+9a3zazZ01IPJQ3y8W/a
 mhiK4XEYLr61lGwCE+ML+OOwHGN/cpVKOovI8VQneXxeOlGerMvq6iiKyF1LOOZG
 MZO+KrgK0guLWIboSrECV3GDPLdhToXpe0vLb3zCnXsyv88BIbaysXmqm8VH1ILt
 Lg76EyAKw0Czm9ROfXSd5m4yc103QuFS5vDKSZ98E6MLAyxwZ7M2KBUe01YSCTVk
 ia8jcQ7PuX52Tw9EEInwOhv8i0Lm5j5L6wwXeZTe2u8AhA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3h07g1dc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 12:40:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c7166a4643so1485300085a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770122401; x=1770727201;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ufTr7+wzZ2/b+1pjL/6eFzV9KL+yNiviwWGyOeRQjGU=;
 b=MvA6+7l0s8/FXgj3yRTetLYyU8ODLverwsLBf8CIIp6BT/rJRIOfd36ipOtd+TsodT
 loCNo/HZRxgt6zTwsITdg1/bcUEGNed2zW/hcYHQzDe5jaHlxhLfTXCdXhiwipvfYMG+
 T/9fiX7RWaqKa+6LX2vM9VaosMeGkbCKRRT4cVr/+YgAk1j0AVr69qT1GrgTQv1MMMfT
 BmJTTXOuXyrIvBQsXtsqFrbIuDs0JOFEGop9pEoZ5YWymXDJwzrdgefPwUdSAzrg3Kwe
 fozGL9qcA7ivPZNwRbMVrZlkQv6T0ZxmCBUPm3bq061aNZiyANpamnf9nYEAgYKYwgNN
 NHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770122401; x=1770727201;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufTr7+wzZ2/b+1pjL/6eFzV9KL+yNiviwWGyOeRQjGU=;
 b=NREjfRMjVhm0zrMJPnNJF2ACs/ulhXo3ynZOxzZ/RI/b1ayM14TamQnaLmJt6qgj6B
 3MnXdHnGI+K6RfEbZAHHQR4gYeVdhArhrUNB0NVKU9K5CZJUrZprwtTfy3gmDiWHpWiK
 u97Da7qDoGg0lHGXfZZ3f/HwvffV02DRrCByhGASlnV1GeBLHGaQkjTpZI7wzir354rd
 QDqcuKkeRz8RyxG88HI6sIqhoqSr4+H364r7LJy4puzo8MTm5VfRQ79MMVDy+WngkoGt
 23lst1sjCIbICYG9SpFpa+EMVK599HDWGlQ6LpTv4w86t72J3a2XwG9avKwqVVXu1M8k
 OtJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqtxiVxhdAcA0Qo7g7dTisjvaxUf4pMBuzeia/+sqWLdfHM2o+DfdARdS2Y1FTaDDAtDQmGM5xAm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX+7phSjnBgrFd/uysAs4VvjrfVM7vAQsOAG2hJS2mm5s+UH2C
 UpI/QoB3lfSoPbyVmhIV1M4QgJtmnokQ67/0wsA9lv/VYbosWL4Hvl4MMzgOHBSIjZ+ERKhkM79
 v5KMd88lRE+6HaN88DCsef5tHO/2Zb1tahS3Dv/7nDDam+2L1Lyf0QupVfKhHajJHM7dd/XY=
X-Gm-Gg: AZuq6aJwSrw7NWwfV8esVkyr+PXnHxRoYe6xtOa6vy3goW0YuhDvjpo72KZ8iI4OGBL
 BWaFW5OEfW1n+CzRY8LyvWDPFK+unBDJnO7ebAoR7OAEql97Ah1O9XRzcEtWi1QeN4mElgzs/LG
 W9NOh1EU0eFZx3YhjXYekxv4Gtj/oUzOMElXj7KoOE90cKBrIPMIvecCyOj82yuL+9IR2DAphRt
 GAn9Ajmv90+m+/XqA/QAUz78FgglEbOYakRI9hCvQGd1IQZXk+NOpQijiq6xKCk6qxiWoge94/h
 Rh8xyt8Lbi5Mwx+WOxFaZRrqOMqZQJmtZiZDLL3mbsxNjY5cwxe1pi0Diy9SWMO1YPRUR8QkaeP
 Jfr/xRuqFA2or8rT15BOAbcblzDZkbmpCfisu9aGIeFupP+t5ZrNppkZCV6UOqwYM7+vjrFwlR6
 2Z4/NMeoxvWq+2OCbKR5NhfUo=
X-Received: by 2002:a05:620a:2906:b0:8c6:a8f8:9645 with SMTP id
 af79cd13be357-8c9eb37278bmr2010935985a.90.1770122400879; 
 Tue, 03 Feb 2026 04:40:00 -0800 (PST)
X-Received: by 2002:a05:620a:2906:b0:8c6:a8f8:9645 with SMTP id
 af79cd13be357-8c9eb37278bmr2010930385a.90.1770122400389; 
 Tue, 03 Feb 2026 04:40:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e074bc9b0sm4187258e87.91.2026.02.03.04.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 04:39:59 -0800 (PST)
Date: Tue, 3 Feb 2026 14:39:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
 srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Message-ID: <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEwMCBTYWx0ZWRfXz5Dp8YjQ98N6
 HHWclxQ3k+VO8lfO8NUo+VGDYHY+CCTRUygpqL0SspnKh1t/THbZgkjVy2u0VgnLc6vmA+YWY9C
 twU85ncfW+C3d8xaUTcylWJrhVe/DLE3i2w5O/y1ArrFW8b59pAowJPxJ130j0fPIOtFltI6k1H
 Og5ybZur88/8uHb8VIymltjCBgKSJhirtaeedBPnZbeNPqyfzgBvd1WEQRTQy932oXvcO3eDY/Z
 DP6pkgAsfDeGmv2C/JAyEPDN2XC79Mlz6ayPQIGYIsLxN7GhC0ex83mJjoy8JA1eKDji5S5A6fW
 Q3hoWVm8SRhObCSm+ahPtjj7WWENoqI85AlImM7K4DerjA+OU+2n23DJaZEFiyMilYJQrPul3x9
 PjWiYdRpYFU+OB17EFu6pPoh1ZM0yHSjxBtcSXLI5yMl9K6F+XWABt5qrFbG//QdwywVdrIA0Tg
 aHA/hKcL5sfu0GilohQ==
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=6981eca1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fMO12ABWoyO7-lQLxlUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: uFQEJaMr20cZlhrhm5f0VFH8Edlg_0pV
X-Proofpoint-GUID: uFQEJaMr20cZlhrhm5f0VFH8Edlg_0pV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030100
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B3B4BD91E1
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
> On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
> > On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
> >> On 1/29/26 1:13 AM, Sibi Sankar wrote:
> >>> Enable ADSP and CDSP on Glymur CRD board.
> >>>
> >>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
> >>>  1 file changed, 14 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> index 0899214465ac..0eed4faa8b07 100644
> >>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> @@ -487,6 +487,20 @@ &pon_resin {
> >>>  	status = "okay";
> >>>  };
> >>>  
> >>> +&remoteproc_adsp {
> >>> +	firmware-name = "qcom/glymur/adsp.mbn",
> >>> +			"qcom/glymur/adsp_dtb.mbn";
> >>> +
> >>> +	status = "okay";
> >>> +};
> >>> +
> >>> +&remoteproc_cdsp {
> >>> +	firmware-name = "qcom/glymur/cdsp.mbn",
> >>> +			"qcom/glymur/cdsp_dtb.mbn";
> >>> +
> >>> +	status = "okay";
> >>> +};
> >>
> >> Please make sure it gets to L-F (only Kaanapali is there right now)
> >>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
> > but the firmware in linux-firmware is (now) targeting IoT devices,
> > should we use WoA-like names for firmware on Glymur CRD instead
> > (qcadsp-something.mbn). It would match what was done for the SC8280XP
> > CRD.
> 
> I think it's simply time to stop pretending the firmware is generic
> (some fw simply isn't and some fw may come from different/incompatible
> branchpoints) and include a board name in the path

Well... CDSP is usually generic, except for WP vs non-WP.

-- 
With best wishes
Dmitry
