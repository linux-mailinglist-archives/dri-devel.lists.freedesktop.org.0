Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKw3OdopcGmyWwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 02:20:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6FE4EFA5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 02:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE00810E674;
	Wed, 21 Jan 2026 01:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRXfFwvA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CMCulPn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6107D10E192
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:22 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60KHrJlm2827486
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jTmmo93V7xGePLVLaz8pP3Gj4E1I8Db7ikybXohVsfI=; b=nRXfFwvAt/xui9gh
 SLikcMcLNpmhXShiClsb1lPO9mk81EOyvqH/S++ybTSDAVuJNnesPOC0NTCldppp
 SZ6HhMXfKhOzzBnd51Oab4iG3QFdS9jdMnaL4F4FluSqNOboSqusmxD0DYEUmpIO
 HA3gCd7AbsRL5Oy+cshi0wz6srnz1CAMIZALJ47OwWL7VmMqj/P3W8z/LaiKbW2t
 Zl4y6Xo2jJmB7/+69kjBs618upZMXZZCJgIOL2PrNxj8CbvxeJMibwV4wqMhzRok
 wBuXLVnhdGT5TwaJcvG1YmPQHSnBWr0OkOT/I6a7yRzt1LOv9Sjx4JjOmXnL5naZ
 yyOobg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btegk9d0m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52c67f65cso312729785a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 17:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768958421; x=1769563221;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTmmo93V7xGePLVLaz8pP3Gj4E1I8Db7ikybXohVsfI=;
 b=CMCulPn7o1QwBHf2OBMGV1WKe+zHhTYAHBgVE4UBlYL3elo6kjE/EkShYWZAEHm+Yp
 z/Ur4dCyBkT18g/2665aDqYm0sN3eOsDyCoAi9nrMasrVDMhUjnIDUlKChqpkJD4Sily
 F3UskOxuwMxSdYat6ERuWSqIFw08pGnhaqMM9/9EtQF3WhC8odOlwchqjIca+1Ky7hKg
 a792c+PjJE90t4zDnVEjFf2NwgfOFlH0ozOLQM/tnd44eva7j8bqgbIbA6dHGxcCwMat
 c5I1c3zPB8AKoF4ZM7LgdKQj18dWNHXml7PPLzO03k/FuU9N+8P9UegN/aiiR+frLIjb
 VhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768958421; x=1769563221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jTmmo93V7xGePLVLaz8pP3Gj4E1I8Db7ikybXohVsfI=;
 b=RgExL7FcrqKdT1VjF0wbmhR+HRoLnJGzv0yKh/EERVASMP1Yi9tbaV0XhTIU9+9CXF
 pv2nns/VD0O5/bzh3QMYGJaVAxrPmnB6ul5I+s4YIO3XwuoyfLYeK/m01/6N1JP5QZ3Y
 pu6MkRZKvTpdqLbbxzjM9d5n89k1EOP5dGlMU5uJSlrq8EynukHzsa4P24LiiTT5ks9F
 9qsi8gSPunLPD/3mm3F2zcuNpw/G+wAg1JlAb7IgzECWbH4BmkaHVmQoDYzNAzbbyg8B
 0oi2bLp4ovLxXlbuBst152pXPI4KkCSN/GpRaFI8Pt7FU8zwTvUTg7et0AKzxxEFRa7m
 wPuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtJncbvKpXzy82MfZg7j9HkjgkjfwWzanuHxa70gXNkRJD6TIAXxZ5bjVWDhmTPUFyXx+3FRG185w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjTw4I6RZCsqK0rcedk/u4/T07db6IBUJaTp03tAokthdmivi1
 oJR1H8wv+FT8Z75hnFaveyO1CnUbsxQblOZno6UuPzsH+TCQtPPZ5+micjmFPZYBpnnyDh4GdnK
 n4RQSxN7tkW8WnrAbDQR42xv3L1qWJXI6ESw/8uWG2xtForfQB+x2ARsyH0ocjUZh8yKSSc8=
X-Gm-Gg: AZuq6aKjQrStr6q3+KmAZ7YIyyJBmHVZOlpQb6nRxyodjrQOMGbFcAOXF5uAiDqa+Vs
 ODDARzUizd9fPXrPcmE/KmaP/6OMTUlC9SeItc78EN5tKgpftXtJjq5tgsn34XtWqvVdEkqHSsp
 A9wrPxsg796pxeZxyuCeYUsqYSGBOLqu4XxADO3oLoLdpolU5OJ5VerlasbEyFdPwkO78mriIL1
 5cJfKJA3bbkmPQTVNyA40feO82d0BJz3letqfFj6wUENCBHbW+Q40Krah68/Ks4WoMk0xi4WqMk
 ZGZpZLd6DsN8t2JqTCvVi54ZAmJ3xK0D3Nm77rkbBiAMlEuwXcMb6AQok9jQdwp3dhd3IGsRZpi
 +V5lniLeG78feh5BEUEVnki/a2tUIngAK510imihHc6PPWDb9zKl42GteMqr7+eBOoZapueBNpn
 lalG8CIbfNlm9phESQOrJyRH8=
X-Received: by 2002:a05:620a:4490:b0:8c3:7e05:daf2 with SMTP id
 af79cd13be357-8c6a68d361bmr2197553185a.15.1768958420766; 
 Tue, 20 Jan 2026 17:20:20 -0800 (PST)
X-Received: by 2002:a05:620a:4490:b0:8c3:7e05:daf2 with SMTP id
 af79cd13be357-8c6a68d361bmr2197549985a.15.1768958420239; 
 Tue, 20 Jan 2026 17:20:20 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3543d2sm4383110e87.43.2026.01.20.17.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 17:20:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/msm/dpu: improve LM allocation
Date: Wed, 21 Jan 2026 03:20:18 +0200
Message-ID: <176895840438.3580355.1415508163541607317.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y7nHyt1dc6mlUYZivPT1AkjkfaWU62S1
X-Authority-Analysis: v=2.4 cv=X9lf6WTe c=1 sm=1 tr=0 ts=697029d5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=eItp_FwtO1cFr9fIi8cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: y7nHyt1dc6mlUYZivPT1AkjkfaWU62S1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDAwOSBTYWx0ZWRfX/eiv5wWr0MJu
 IP7ag5dMyR/VIEwWb9opJIFysGVRqBIOUyAOB84E6tdPspw9m5UvN1fHh/HzEun1vMychyWAb7F
 tp4BgqBIYyDzXnYfNs/7qMD9w1Wg4fA7xNu29bRR4/ivDUW63C+xfOP/wILVMPjMlvWhyt4SE4J
 nHb4i1+CQ6WbucIFrjl4fSGAyTId0ircKt3jcuO0wIOiAh9f9DeJDviF98KhwWKg+BIDYBahSsB
 oiytrS7qIne181i8Nc3KMRziVm7RVoREWSV93LZP+GbkKUMKqg4ymvV9v5n9ZSUBx94ZflxEWIK
 zO2Mr7wfPinrDrFDMxFFQ1WKVdx5W4W/L/vkl3QXKNwfgchBl5oWU3JuxRwp+IowBl84YtKfvZh
 hoaVJSOz9mIVv0zjMkkZtLwghPmZU59RQFaDkuLXzLSUyyzxOveg2cH+eelQNWSOjWv25Ia7eF4
 AXublTL2aBN/xNQx1Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210009
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 9A6FE4EFA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 15 Jan 2026 22:05:37 +0200, Dmitry Baryshkov wrote:
> Not all Line Mixers have corresponding DSPP blocks, which are necessary
> for CTM or Gamma Correction. Currently it is possible for CTM-less CRTCs
> to get a grip of DSPP-enabled LMs, making it impossible to use CTM (or
> GC, once enabled) for other CRTCs. Make sure that RM allocates simpler
> LMs first, leaving LMs with attached DSPP for the CRTCs which need them.
> 
> 
> [...]

Applied to msm-next, thanks!

[1/2] drm/msm/dpu: correct error messages in RM
      https://gitlab.freedesktop.org/lumag/msm/-/commit/98c8f146f574
[2/2] drm/msm/dpu: try reserving the DSPP-less LM first
      https://gitlab.freedesktop.org/lumag/msm/-/commit/42f62cd79578

Best regards,
-- 
With best wishes
Dmitry


