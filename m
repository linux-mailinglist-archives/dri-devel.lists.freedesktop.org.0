Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K+0HpIRoWlwqAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 04:37:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3C81B24EB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 04:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A5B10EA2C;
	Fri, 27 Feb 2026 03:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtgaSaDz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NlnAOyhk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2A110E5A6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 03:37:49 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61R2Jxcb2403007
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 03:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DYfpyHdyNliHmcdKTDNlDNAZ
 DoeBzGtHN4rbDOCoQWU=; b=AtgaSaDzPeBrWb606AtzQUNVgokvGyQ9Pmeoq233
 bDPrhHI+JWerYpAEqUr81cT3bzja9u7+1yc7RWQQdPpmsH4Mgwc2bw/RT/IO4tYq
 gtWE5qQ8HjxRDWN/drmy4NOESbX/xxQiEijH1edd+IWsfekJeEyKKPk5egZLmxDd
 0pYYSdzojDmyhlDKI0Ka3KwkpAQrBbpSJIxxBIBp4ol+0uNn0gZ7+88Z1SUHPPq3
 b10EAtU3IHbT8kNX7zqFJP0avrtMDmi2C1zK4I4WLgWuz61lTnlhvHRCDufgT0ut
 YfUe0gS16giEgQdohBtUQeJigm5UPeDiEiMBrod8cDLCAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw23950e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 03:37:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c71156fe09so1100399985a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 19:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772163467; x=1772768267;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DYfpyHdyNliHmcdKTDNlDNAZDoeBzGtHN4rbDOCoQWU=;
 b=NlnAOyhksFqTScGcs6dwxehLlsnrYdcGA56JoyPSt70KlkLiOzPVsEDwKgo/7J0E6q
 mMV/3kCCaBjw2Qh5tor9i1H8JgO8oKERreNN3jpUi8Qjf7ax9Qp9ZSvUqoHtpLkolOiu
 DejCPjgRhXe3O7X1FXGyWUKmfWgOneY/vgtwaD1C35cnCMPxeTC5RXKomorZdBv3rF2d
 0v0oI9sqCZU7TWhoa/6Y+06LFq2I7Wb2ltM38gWw0mdclw9P68pNHO1pYsTAExCNqOvC
 sWgVHbRk4rpgpPgaiqXflZAIGBOfDtSq/a6Qkhz0MQS05+EFHrksiOKRNUvJreTKXgsq
 Krvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772163467; x=1772768267;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DYfpyHdyNliHmcdKTDNlDNAZDoeBzGtHN4rbDOCoQWU=;
 b=MOfwCXEBVyCDddhho5pjjW9o15C3AZGxzlZ/TCjGWPx5E/SUwdTkc/3Mju5zdnhbul
 rJAwR1T6Hze6dAxWla6+qwTyzgZ7cb8IYQL53syMNgxA1TN+GoA79inKebjs4EsLqwIa
 LJTkCLML24Ygt7bz0E+Kat2jiwodIIT6asoyaC5xfy1nIEzl/zdUQZMQCoLqsBAL8AJR
 Qos6coMrUphDPXviJJtT2355tKr29jT0bze2nxouyGS7fCwh2mAYyV7aIZ8IHS/fH6CK
 eCMzktQfcyKWC5GudRkBpPtO+0LhruCvsQuAgqNVp7JVUwpwhD5TAMPb2H6qYZFYW+WU
 t9eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/N8pOqD1IYVcZ59skMIqWCIqpu6svw5Zs7btVXXsNxhz7qxQyZMaK+EDbA3QKRimzutalKPWv9hQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNTefIiF8JSZWnl/rOZJVHLa0ng/54G6/mdUyD9QPWAqG1UzY6
 iAqNfYYBBXbJR0PlvjyP4bqirrJ8fNGU/K9/EGOEwUDbJIwq0RN7oXgDf7zjbtGBiDCoQ8WDOw6
 LxKhVEXgOL9DCfv3LyWAsydIMbVYLX9ubpMOMtEq+f38DMezCqhRoAiXe0D6xCIh2gY117Mo=
X-Gm-Gg: ATEYQzyjPHVnSTjcO4PTYPUm/CsN4k2FAuQC/ax30tqL6DRKVORcVqIgLq4jKQ+wIBE
 r5kAXguDhX2Uz2IlSY54enQ+uqRke433SNsi2meCJJayDLgy7JQLBQl9CvJSdZ7z8vAAHgxV0Ab
 fTcmuGzTbXpcqtIKTKQcgDGR3V1n9zIz0iPa0Q1GFsON4QBBDp32NYvmNG+Di0H11cGLwpGKOVB
 CDDtSgBA7Y6Icxw/p3haAipMetitNrITwnk9vFWVyQns19/mKL1nE2ehD8j0Jp5avNCn4E6Y5D2
 wpDHuLax3Sw0EftwKHi4ZDAxx9ReMe0w9O0o14rtgYMbMcgpAMAh7Q2qi9chCLUFfkBFg0/sp0w
 2sAW/Rkc8gx7ejFEsw2v9gAZuL/r2ugoPs3sTd5aJC7fkXcowUB+RmqrgInMo1P2pBRReXAX9bU
 jDM9Ed4E0=
X-Received: by 2002:a05:620a:1a21:b0:8c6:a539:55cd with SMTP id
 af79cd13be357-8cbc8df1ddcmr161576585a.41.1772163467142; 
 Thu, 26 Feb 2026 19:37:47 -0800 (PST)
X-Received: by 2002:a05:620a:1a21:b0:8c6:a539:55cd with SMTP id
 af79cd13be357-8cbc8df1ddcmr161574685a.41.1772163466554; 
 Thu, 26 Feb 2026 19:37:46 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cbbf66b9d9sm375661885a.12.2026.02.26.19.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 19:37:45 -0800 (PST)
Date: Fri, 27 Feb 2026 11:37:37 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <aaERgXWdmX1MT2+l@yuanjiey.ap.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
X-Proofpoint-GUID: 55zx5Z2_ePdl-zt368ahbKRNDO_f9L6m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyNCBTYWx0ZWRfX7Y5Azpt5iNhT
 MBcOb9vHFVl++f5v2Tl5FDWVTIAmFomE0a1952zD9xDZ5m3LqDdDAbPLP/KvRAjVLwPoutnhdEM
 wrm8B4EpbO0MTGFbAOnXTIf3RMnO5eqKgFJz7xHegw3ER9rcwQTi4SpAKxyXNPqC3v06oqRJ8Yy
 tNNVOsW8w6uP0k+GYa+z3cvjf4mA3IwnuhbJk0XGt6lwZG4+EnHrYknHQTgoXvnnFJ5BPLtptfc
 7c7nIGkw5YvGFfAXICp2R+VHLzwO3+nMVw0pg8MjS9Cyt6nFRuGZ9I2lF0gVIJ/wKmdDatlL8we
 CYr7iUuRdbB/9r80cYU97P3aaSjeQRG+yKtKRmSlBN5sM6o0m/j48bRc32Wiy9le7fir3qNJ/JK
 /vZuA7K3m9wYhCobDFHSpLCY7cp5LYbY/ggpqLcCejPbIVpg+xexiBCsyE95mH7JbBd0/Qu1k+j
 dD+F4yrZGw87ik5JbOw==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a1118c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VgLlj4axOkVC7TBc3uoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 55zx5Z2_ePdl-zt368ahbKRNDO_f9L6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270024
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
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzysztof.kozlowski@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:yongxing.mou@oss.qualcomm.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yuanjie.yang@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[yuanjie.yang@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,sc8280xp-crd:email]
X-Rspamd-Queue-Id: 2B3C81B24EB
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
> On 1/12/26 9:25 AM, yuanjiey wrote:
> > On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
> >> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >>>
> >>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> >>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>>
> >>>>> During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> >>>>> the MMCX rail to MIN_SVS while the core clock frequency remains at its
> >>>>> original (highest) rate. When runtime resume re-enables the clock, this
> >>>>> may result in a mismatch between the rail voltage and the clock rate.
> >>>>>
> >>>>> For example, in the DPU bind path, the sequence could be:
> >>>>>   cpu0: dev_sync_state -> rpmhpd_sync_state
> >>>>>   cpu1:                                     dpu_kms_hw_init
> >>>>> timeline 0 ------------------------------------------------> t
> >>>>>
> >>>>> After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> >>>>> to stay at the highest level. During dpu_kms_hw_init, calling
> >>>>> dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> >>>>> fall to MIN_SVS while the core clock is still at its maximum frequency.
> >>>>
> >>>> Ah, I see. dev_pm_set_rate(0) transforms to  _disable_opp_table(), which
> >>>> doesn't do anything with clocks. I think we should have a call to
> >>>> clk_disable_unprepare() before that and clk_prepare_enable() in the
> >>>> resume path.
> >>>
> >>> I do check the backtrace on kaanapali:
> >>>
> >>> active_corner = 3 (MIN_SVS)
> >>> rpmhpd_aggregate_corner+0x168/0x1d0
> >>> rpmhpd_set_performance_state+0x84/0xd0
> >>> _genpd_set_performance_state+0x50/0x198
> >>> genpd_set_performance_state.isra.0+0xbc/0xdc
> >>> genpd_dev_pm_set_performance_state+0x60/0xc4
> >>> dev_pm_domain_set_performance_state+0x24/0x3c
> >>> _set_opp+0x370/0x584
> >>> dev_pm_opp_set_rate+0x258/0x2b4
> >>> dpu_runtime_suspend+0x50/0x11c [msm]
> >>> pm_generic_runtime_suspend+0x2c/0x44
> >>> genpd_runtime_suspend+0xac/0x2d0
> >>> __rpm_callback+0x48/0x19c
> >>> rpm_callback+0x74/0x80
> >>> rpm_suspend+0x108/0x588
> >>> rpm_idle+0xe8/0x190
> >>> __pm_runtime_idle+0x50/0x94
> >>> dpu_kms_hw_init+0x3a0/0x4a8
> >>>
> >>> dev_pm_opp_set_rate(dev, 0); just low power to MIN_SVS.
> >>> And freq MDP: 650MHz
> >>>
> >>>
> >>> And I try change the order:
> >>> from:
> >>>         dev_pm_opp_set_rate(dev, 0);
> >>>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> >>> to:
> >>>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> >>>         dev_pm_opp_set_rate(dev, 0);
> >>>
> >>> But the issue is still here.
> >>
> >> But which clock is still demanding higher MMCX voltage? All DPU clocks
> >> should be turned off at this point.
> > Yes, no DPU clock demand higher MMCX voltage here. But next time pm_runtime_get_sync
> > need higher MMCX voltagei due to high freq.
> >  
> >>>
> >>>
> >>>>> When the power is re-enabled, only the clock is enabled, leading to a
> >>>>> situation where the MMCX rail is at MIN_SVS but the core clock is at its
> >>>>> highest rate. In this state, the rail cannot sustain the clock rate,
> >>>>> which may cause instability or system crash.
> >>>>>
> >>>>> Fix this by setting the corresponding OPP corner during both power-on
> >>>>> and power-off sequences to ensure proper alignment of rail voltage and
> >>>>> clock frequency.
> >>>>>
> >>>>> Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
> >>>>>
> >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>
> >>>> No empty lines between the tags. Also please cc stable.
> >>>
> >>> Sure, will fix.
> >>>
> >>>>> ---
> >>>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
> >>>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
> >>>>>  2 files changed, 15 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>>> index 0623f1dbed97..c31488335f2b 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>>> @@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *ddev)
> >>>>>     struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> >>>>>     struct dev_pm_opp *opp;
> >>>>>     int ret = 0;
> >>>>> -   unsigned long max_freq = ULONG_MAX;
> >>>>> +   dpu_kms->max_freq = ULONG_MAX;
> >>>>> +   dpu_kms->min_freq = 0;
> >>>>>
> >>>>> -   opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> >>>>> +   opp = dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
> >>>>> +   if (!IS_ERR(opp))
> >>>>> +           dev_pm_opp_put(opp);
> >>>>> +
> >>>>> +   opp = dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
> >>>>>     if (!IS_ERR(opp))
> >>>>>             dev_pm_opp_put(opp);
> >>>>>
> >>>>> @@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
> >>>>>     struct msm_drm_private *priv = platform_get_drvdata(pdev);
> >>>>>     struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> >>>>>
> >>>>> -   /* Drop the performance state vote */
> >>>>> -   dev_pm_opp_set_rate(dev, 0);
> >>>>> +   /* adjust the performance state vote to low performance state */
> >>>>> +   dev_pm_opp_set_rate(dev, dpu_kms->min_freq);
> >>>>
> >>>> Here min_freq is the minumum working frequency, which will keep it
> >>>> ticking at a high frequency.  I think we are supposed to turn it off
> >>>> (well, switch to XO). Would it be enough to swap these two lines
> >>>> instead?
> >>>
> >>> Yes, just clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks) to
> >>> disable clk is OK.
> >>> we can drop change here.
> >>>
> >>>>>     clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> >>>>>
> >>>>>     for (i = 0; i < dpu_kms->num_paths; i++)
> >>>>> @@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
> >>>>>     struct drm_device *ddev;
> >>>>>
> >>>>>     ddev = dpu_kms->dev;
> >>>>> +   /* adjust the performance state vote to high performance state */
> >>>>> +   if (dpu_kms->max_freq != ULONG_MAX)
> >>>>> +           dev_pm_opp_set_rate(dev, dpu_kms->max_freq);
> >>>>
> >>>> This one should not be necessary, we should be setting the performance
> >>>> point while comitting the DRM state.
> >>>
> >>> No, issue is during dpu binding path. And in msm_drm_kms_init driver just
> >>> pm_runtime_resume_and_get enable power and pm_runtime_put_sync disable power.
> >>> But We do not set the appropriate OPP each time the power is enabled.
> >>> As a result, a situation may occur where the rail stays at MIN_SVS while the
> >>> MDP is running at a high frequency.
> >>
> >> Please move dev_pm_opp_set_rate() from dpu_kms_init() to dpu_kms_hw_init().
> > 
> > During dpu_kms_hw_init and msm_drm_kms_init and msm_drm_kms_post_init.
> > 
> > There are multiple places where pm_runtime_get_sync(pm_runtime_resume_and_get)and pm_runtime_put_sync are called.
> > And each time after pm_runtime_get_sync(pm_runtime_resume_and_get) will access register depond on MDP clk.
> > 
> > Do I need to add dev_pm_opp_set_rate after every pm_runtime_get_sync and pm_runtime_resume_and_get?
> 
> So I took another look at this thread and I think the correct resolution
> here would be to stop calling dev_pm_opp_set_rate(dev, 0) altogether if
> the clock is getting disabled, since the PM APIs seem to take care of
> removing the vote during runtime suspend:
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 61d7e65469b3..ddc6aeae8f55 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1462,7 +1462,7 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>         struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>  99
>         /* Drop the performance state vote */
> -       dev_pm_opp_set_rate(dev, 0);
> +       pr_err("!!!! SUSPENDING DPU\n");
>
drop dev_pm_opp_set_rate(dev, 0) is OK. Test it OK on Kaanapali.

And I do some test:
1.drop dev_pm_opp_set_rate(dev, 0),

2. when rpmhpd_sync_state runs before dpu_kms_hw_init initialization.
[   11.123830]  rpmhpd_sync_state+0x9c/0xec
 
When pm_runtime_put_sync is called: it can set corner to MIN_SVS.
[   11.546084]  rpmhpd_aggregate_corner+0x170/0x1d8
[   11.546086]  rpmhpd_set_performance_state+0xc4/0xec
[   11.546087]  _genpd_set_performance_state+0xd0/0x1ac
[   11.546089]  genpd_set_performance_state.isra.0+0xbc/0xdc
[   11.546091]  genpd_runtime_suspend+0x144/0x294
[   11.546093]  __rpm_callback+0x48/0x1d8
[   11.546095]  rpm_callback+0x74/0x80
[   11.546096]  rpm_suspend+0x10c/0x56c
[   11.546097]  rpm_idle+0x11c/0x1a8
[   11.546098]  __pm_runtime_idle+0x54/0x98
[   11.546099]  dpu_kms_hw_init+0x3c8/0x4ac [msm]
 
When pm_runtime_get_sync is called: it can set corner to correct corner(here is TURBO_SVS)
[   11.784091]  rpmhpd_aggregate_corner+0x170/0x1d8
[   11.784093]  rpmhpd_set_performance_state+0xc4/0xec
[   11.784093]  _genpd_set_performance_state+0x190/0x1ac
[   11.784096]  genpd_set_performance_state.isra.0+0xbc/0xdc
[   11.784098]  genpd_runtime_resume+0x228/0x288
[   11.784099]  __rpm_callback+0x48/0x1d8
[   11.784100]  rpm_callback+0x74/0x80
[   11.784101]  rpm_resume+0x480/0x6b8
[   11.784102]  __pm_runtime_resume+0x50/0x94
[   11.784103]  msm_drm_kms_init+0x1a4/0x340 [msm]

>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
>  
>         for (i = 0; i < dpu_kms->num_paths; i++)
> 
> 
> [root@sc8280xp-crd ~]# XDG_RUNTIME_DIR=/run/user/1000 DISPLAY=:0 xset dpms force off
> [  163.099585] [drm:dpu_runtime_suspend:1465] !!!! SUSPENDING DPU
> [root@sc8280xp-crd ~]# grep ^ /sys/kernel/debug/pm_genpd/mmcx/*
> /sys/kernel/debug/pm_genpd/mmcx/active_time:159146 ms
> /sys/kernel/debug/pm_genpd/mmcx/current_state:off-0
> /sys/kernel/debug/pm_genpd/mmcx/devices:ad00000.clock-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:af00000.clock-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:ae01000.display-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:aea0000.displayport-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:ae90000.displayport-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:ae98000.displayport-controller
> /sys/kernel/debug/pm_genpd/mmcx/idle_states:State  Time(ms)       Usage      Rejected   Above      Below      S2idle
> /sys/kernel/debug/pm_genpd/mmcx/idle_states:S0     67845          3          0          0          0          0
> /sys/kernel/debug/pm_genpd/mmcx/idle_states_desc:State  Latency(us)  Residency(us)  Name
> /sys/kernel/debug/pm_genpd/mmcx/idle_states_desc:S0     0            0              N/A
> /sys/kernel/debug/pm_genpd/mmcx/perf_state:0
> /sys/kernel/debug/pm_genpd/mmcx/sub_domains:titan_top_gdsc
> /sys/kernel/debug/pm_genpd/mmcx/sub_domains:disp0_mdss_gdsc
> /sys/kernel/debug/pm_genpd/mmcx/sub_domains:disp0_mdss_int2_gdsc
> /sys/kernel/debug/pm_genpd/mmcx/total_idle_time:67846 ms
> 
> (and the correct vote comes back up as the DPU resumes)
> 
> At the same time, we *do* need to ensure the correct level is set *before*
> clk_prepare_enable and any set_rate operations (the latter is already done
> via dev_pm_opp_set_rate())
> 
> clk_prepare_enable() happens in:
> 	msm_mdss.c : msm_mdss_enable()
> 	dpu_kms.c : dpu_runtime_resume()
> 
> (they refer to two disjoint sets of clocks but both cases need the fix)
> 
> I think the easiest solution in the MDP case would be to set the clocks to
> the highest available OPP (lowest or *any* would work too, but going turbo
> seems like it's going to give us a stronger foundation for adopting
> cont_splash one day, avoiding potentially momentarily undervolting running
> hw) during probe and count on these votes being adjusted either through
> suspend (if unused) or to the actually needed frequency (via dpu_perf)

Agree it.

Thanks,
Yuanjue


> For MDSS, we're currently generally describing the MDSS_AHB clock, the
> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an OPP
> table.. The GCC clock is sourced from (and scaled by) the NoC, but the
> MDSS_AHB one seems to have 3 actually configurable performance points
> that neither we nor seemingly the downstream driver seem to really care
> about (i.e. both just treat it as on/off). If we need to scale it, we
> should add an OPP table, if we don't, we should at least add required-opps.
> 
> The MDP4/MDP5 drivers are probably wrong too in this regard, but many
> targets supported by these may not even have OPP tables and are generally
> not super high priority for spending time on.. that can, I'd kick down the
> road unless someone really wants to step up
> 
> Konrad
