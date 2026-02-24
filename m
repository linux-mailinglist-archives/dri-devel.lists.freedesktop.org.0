Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFEQOo4jnWkcNAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 05:05:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F292181893
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 05:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C0010E4A5;
	Tue, 24 Feb 2026 04:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2Qc/tDw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkSrVBI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD1810E4A5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O3oCAX1395435
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S+bJ33mAsYZM5n0ZwjCITHvHibRXbLW59LUKfr9cSv4=; b=g2Qc/tDwAgJXL33C
 X6YMTeqPmi4apI/RMYDzJLoJg2AoNhkHKB4Eju1to0zM+b9WEdK8/LwoJK3K/HQQ
 eSyAklg5be0nwAGU4ml/DUG0ISeY5Iiih5R87lhdp66ydeeIgHbRnavAqzg8g07n
 Y/Hsc0I2g7dK3aMD37FqYaZC9Tqc25NWxH8xysTxKY9SujlZANr+j6pcpM+nUfP9
 xn/be/mI1hGzNq4krmUR6tFvIDK3cKS7VbbLq59Om3FhGOJVWAs6mDLU+kx2Mspf
 r6TqNMwqDdqtKy2v1FLAJdUnR94UieGa9N5yRuVZ3AM8qysemHcVDIquS+QM0xkH
 VkDnuA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e3815w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb3d11b913so4332179985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771905930; x=1772510730;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S+bJ33mAsYZM5n0ZwjCITHvHibRXbLW59LUKfr9cSv4=;
 b=DkSrVBI1rQ1fphjwPVc7nBSPFDEtaiLo8F8qjSrIHDQOqC76g4TbBw9CIYE2yeaKpA
 jN9IcHS4USmsq+frcpo9UecYv/0l2/YuC6kI5CN0Ccal2dRjFfU5ofpO87jcDFexJTOc
 fIWSu/UOlbJm9lLMXlSMBV1g6hEulYS/ssMv85VfaYPZC4CKIh2ePkeu9FEVpdKzPsFf
 +AY3GBep+hXxwwuuCjP7goyXqVsGBNq5d3vjEfX8R84VGnx+RY2SCn8hwgio9XJ0f2DB
 TFJQbCUI2QuxvH2Tr4jhZGw0CHKsgAuDWnLsj3iXEkcOtG1uVOHLo5TTpyf+dw166Vxa
 RVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771905930; x=1772510730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S+bJ33mAsYZM5n0ZwjCITHvHibRXbLW59LUKfr9cSv4=;
 b=DgFxDmm7E7f90/2vJtd6qsVEegxud/dWZEJa9/KljRej1WMgWbwdh8WUICoVa5b4TA
 saNZ6gARCO7tMqWy1i+e4eevD64UqTfk6U2QzVXc60zuhXgmatiVbvE0z27kDWWJdG/z
 nW36OziALgon0Cz6Wz9TABR7N4vPJ0nWGv2Q7yBYOP8poNL413YFP9gGeZOCt/QnIkvt
 MhJuY1Au64u2d0oMzahtbgte8v0H0lZp9T4wm1KbN5w4RxqhZ3THLMs/7q3vOD9BCwZA
 EhyzG8AT8iXcX1Y4yAeTMYesfjJO/wlnHlpGqGsg+pLqESRfMdmN9eAIT0IkU6qpL3wl
 sD8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsWV/zLfk9H6MdwST8k4joA+xYovfNnpJnfJDuFlLaz8e/Jb6dEOThIErz4E6u7X13G5lfJYVflVg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI8wA/u2AJucuAQ6mPia9sOAJMt4uLtQeSOnUbal8nBYeIhDkV
 nuqbXwPt8tU+tV4hTiz7ns8TPl8WCvjtMmddQtTpdprz1tey5HIeaWSDL51+9Xc3JBx9kuQmgQQ
 dX8OQfuaHe22kMaVkUGot1CzSrWryvr6JOrc//v0mCgJdHce8ohWSkB7A3ppLkMEB6Ge3ayM=
X-Gm-Gg: AZuq6aKJBBwOBs4axk6W/PG0hir4VAD9NsLiODnUesgJ6JPZQ32cO28OnJck+me01i8
 fH5GX8kwIOawOCgxkHHiDt+O9WsvmHn4lWE35h2c0Pa2UJBWMtJA7EMOgR07M1YbFklvhKG9O23
 Gz8UraUwiYNF/IM3RhRR5l7CNdr1Pc3oiUK2X6vBLfjK2JvGRGM3NNzIs01U5dtfWjeQ7vN19Ef
 wfLcI42exF1aq5PT09zwR5xFZg+NJtsVH7hSfAZkBSCshVKOLtQO3uzjap0exg9oxiRFSjFdZhH
 I4hkyErh6bDCTFwOxsqQfetJqUYmDWefZJLfM4bZmbz/6vtv/QpffGvd7om0t5p4YKA9naoKlkr
 MlMQxHU1iKfpb37D8SKCjUkY1IWlVW6HxYnu97JW7BCLTNCG94VoIOcTcZF0XNn/r0jinUW+c4+
 8VDXljN1A0YmJKWir72BCi+wZ14qYo3ThpcVo=
X-Received: by 2002:a05:620a:1a1b:b0:8c5:3495:87e2 with SMTP id
 af79cd13be357-8cb8ca6e621mr1163980285a.39.1771905930151; 
 Mon, 23 Feb 2026 20:05:30 -0800 (PST)
X-Received: by 2002:a05:620a:1a1b:b0:8c5:3495:87e2 with SMTP id
 af79cd13be357-8cb8ca6e621mr1163977185a.39.1771905929554; 
 Mon, 23 Feb 2026 20:05:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 20:05:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
Subject: Re: [PATCH] Revert "drm/msm/dpu: try reserving the DSPP-less LM first"
Date: Tue, 24 Feb 2026 06:05:24 +0200
Message-ID: <177190591479.429979.2907662017829617135.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260214-revert-dspp-less-v1-1-be0d636a2a6e@oss.qualcomm.com>
References: <20260214-revert-dspp-less-v1-1-be0d636a2a6e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DfIaa/tW c=1 sm=1 tr=0 ts=699d238b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=46aXZEyc5aAzpVtxjjMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: ycS-sASvVKJIzZ-L5NbVVGSreQS5bQbw
X-Proofpoint-ORIG-GUID: ycS-sASvVKJIzZ-L5NbVVGSreQS5bQbw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfX1+zi9jesU6eV
 iRUrujP8ePQXFXcw9dmFR268Shb3ZER+eHeisI4ZvJqgGDbkMzSNrH26r2tMw3lxrv2qvOb9D/s
 X/2Bmb2Xhu3aIFA98KxSyQIta8szl20r3vk0kx+5Oce/zZBJi3b48HjnWPvsBklrgWsO+nRvYrI
 gEwqcOwUHyphnG/39aQGzZ5ctncwmuWOyQKGfbhwSW1V5JkGLEMH0UbqSJYUj9ATwbHVsiHPY5g
 wn4Fz9YNopI3WEdExq0bjIbCtxsNuSw7qVdwDOwvvXW1srUMH78GcXVDIs0oh8vU85Swe96qtQ8
 Yp9L3jovTtlGc5ZmWCZAvhc92PyMuKhxqA/9D1MqWW7mYVafgUrfjjKYwgfQKdPf6TAJgfkikcI
 4bgSUAmsYjwpq5lvsLFO1DFmGVU8xvFDmiY5iDmQ5FoWWGsysyroVDOGNYLxJTR2sF5baMNypqG
 k/HS/RFy//UaqE7Rc2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240031
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:val@packett.cool,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 9F292181893
X-Rspamd-Action: no action

On Sat, 14 Feb 2026 01:02:59 +0200, Dmitry Baryshkov wrote:
> This reverts commit 42f62cd79578 ("drm/msm/dpu: try reserving the
> DSPP-less LM first"). It seems on later DPUs using higher LMs require
> some additional setup or conflicts with the hardware defaults. Val (and
> other developers) reported blue screen on Hamoa (X1E80100) laptops.
> Revert the offending commit until we understand, what is the issue.
> 
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] Revert "drm/msm/dpu: try reserving the DSPP-less LM first"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9f593419eb42

Best regards,
-- 
With best wishes
Dmitry


