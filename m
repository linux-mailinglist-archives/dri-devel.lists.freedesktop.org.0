Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF3TKpMjnWkcNAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 05:05:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC41818A8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 05:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E35010E4AA;
	Tue, 24 Feb 2026 04:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCRRUHKZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BbFd+JFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723DC10E4A7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:35 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O3KvMJ2442613
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C4fvuYxVjNpUmJ0ryko/nP3p8aeV4LlMrsvq7BoATTg=; b=VCRRUHKZyEj7g2Ei
 o1jvMPoTyrzmXILs4k2jjAWaKDlXMNhXetJsHOd6NgfO5Q5NFc1VscLgsk7Aqw4+
 1UajcLaIXaPD3Pq4AQm/vqcdBaD+58lv6LYAFB9sMorLNRMdK6nbr6j7NeB0MnY8
 GV/zYWBsvykHROsJ1I1fiA/g8N+gytAF2eM/KRJdYTheEunZsHl3Z8EMQNt+GSOf
 mjbV9m08EDPgopYSeU+9zry6kHn5ffBmRSxZ8+VuomAtglB5jwEIkwMyEyisil11
 +7iCh24mheFK8U2qva3Ijc+nvp9y0TrBcx7LaHvUbnfuM6YEczI/0xvYA7tzwoHP
 FlRtVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y2tv2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c70fadd9a3so3054075685a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771905934; x=1772510734;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4fvuYxVjNpUmJ0ryko/nP3p8aeV4LlMrsvq7BoATTg=;
 b=BbFd+JFnU+aX2CH4avAcNCZq1wxsNS+Kt0lpyeeL8g4jM9q3UWKK9uUITL+pqbi9SB
 jFw1CCzuyvlzr2bofRDfXZFDpL6nia7O9qi9VBO88O9duCfmUspLoM9p3pz95Es9gCyY
 z9RGINZhA1m1DF8rcj247w530uDyRdS5iqk7zyLdCQDJVpsXCryIG9i8pFl3agFkrqNy
 z4fhoXFqCIgx/8kZO3E6a+iDnjksFOCSydcoKKifiJcNtKWIt02GdePAxTj7ZT57rMTv
 Z/RUKU3HhvqbXLelO3kq7EGdhPq/sZkK6+0f25X/hSDEdDsZ9x6/cvGVkqfP2UuxSrI0
 QJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771905934; x=1772510734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C4fvuYxVjNpUmJ0ryko/nP3p8aeV4LlMrsvq7BoATTg=;
 b=Isfx60osgOmFfoqo1ONoRXtNu5x1jxryvJl+JUCuzJeSQUNuvtXdSF7ytLc3+ARgSF
 1Amnj6gVVxxKq6fJBk9QZ3FJP9cB87LhQ1rFmMmX8xRZdVQnMFbomhKvk5N+lKd1d9LL
 YYFmtzwcDC5g4vn+/pDumj2Q/8N9J6ixHrMeeWB7dVGQcHcFrEWDYFOOVuLEtvoUzv8b
 OoN5wbuQSAGDt7K+O0HSPycXk84ylz4crUpOaLwcsQ3QHAht1yrbzEZyVQnBIj+Czs79
 cZ+2VR5WxkXKH5+ZTez7dS2j8w1YKfKAf+WGSaBIqEG2XNO02QDtu+DL9Eocxir4tgM9
 Nc1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPy+gMAJlXLeaZAUzZLw4fRQl6MTXp6WRwCGUxGrmNU/ZwxcqditxfO/fYX39UPWevG6ZFk9zpDCU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4aqbgAqoDQrDhrcTaGlVHcnWS/iFHf1v7mcWWig56wbLU69W5
 QuSf6WUzhQoZx9nIMlbKav0mlcEyViFckheqoCfl8x6U0coUQTLu7lkcxLUmJ3kCKzl7xJqiPi1
 AM3TNJ85ScibabR1paNTaidk6Uokr3Mdi8q/jrtsGI7zuz0SMFHzNUmq12sigFyoJJc0rZTQ=
X-Gm-Gg: AZuq6aJD34xxO4WW62RcnLaCeJOnLjcCwdr5RByeKaExoYV/IzztGMUjAN2N6G0Xdo/
 YdjO4cIRZZ4F8MAUXYKK6UIuMVQQ4xTvkTuN7Yn4cwSbWF8ko6fB6Roto1E81RXdNLYv+yeQzcK
 qma7O5RmcRH9Pjl2MVtjaMRNPdEMl22bRsUrhHlssBzZn6rKPdz5B3uzl3p4DSDYGzTFt8mkIdS
 vEBth8M1064//Ct4OVI1WrhznxjMw90yKn2jw4Vs3l53TvGOQc9rNDKHWbXbXchStKPpeIIjcig
 qX+BKK4iw7oHv/17619PTTHVB3LdagQOhFC1jj84OQ7IUIrdQe0MpthSYOhwv5zflHE+hYvsSSz
 XTRCcWZ0EGIACpGEnoSGtz+grdff+5ogNiwYTCIRIc5buwrBCzHgo/h1MQ1GC/7gnrw6sfN+aty
 LK6NSEoeaZ+2LcT44mDLWX1YPBD2sVEjwRTbE=
X-Received: by 2002:a05:620a:c53:b0:8cb:72b2:2a14 with SMTP id
 af79cd13be357-8cb8c9dfda9mr1415441085a.16.1771905933750; 
 Mon, 23 Feb 2026 20:05:33 -0800 (PST)
X-Received: by 2002:a05:620a:c53:b0:8cb:72b2:2a14 with SMTP id
 af79cd13be357-8cb8c9dfda9mr1415437785a.16.1771905933106; 
 Mon, 23 Feb 2026 20:05:33 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 20:05:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate()
 allocation type
Date: Tue, 24 Feb 2026 06:05:25 +0200
Message-ID: <177190591481.429979.14151274658881021527.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206222151.work.016-kees@kernel.org>
References: <20260206222151.work.016-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfX6koA+PuS+8EA
 8IDOmh7T7GfTT2Ez/NpFzcg2GbJQBl5Tvw5N9fTL3azM2+QnaJB3gTPNSS/GhOj4IMmqe9kkA2a
 JgGdis12yxN5XNSuDv+pybmXgmnYLof5qX/mDwFE8JAjvXswG6mydnRhqUpTQ+nI6GbycyrAF28
 bGPOmdspetOJJfevNtgvO4ncQ3HWVyaJqbb24vJhZ3yJjJyoAMBB3LW2qGvjGQnU0YWmH8Ow6+Q
 dBU8XjqcEl8DItE2kcWCQFbOh/Hjoc0zgG8nxtnX1Zz0TGFDL2QI+Au4jQiSK30RYVeD7SMJAOb
 W3bcxlExS6D6Lnb5dXN1FpDSV++lDQY453O+jnsmbKIhJ7CKUuX0IbYqHCakzADyG1NdMCc43YH
 eHIjdDyk2vJI5KPtFTFZFW5hpFVr/uKeCRthNWWXQ71TrENI8jj6gKB7ZzoF8E5X/f0MjivE/Oa
 R+LG+AjFlVPOjGO3cYw==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699d238e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=HIUXOl7pohhbnBzAbCMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: N00CCHlRrZLjP6YbbXvlTT_X-Z2PbTrK
X-Proofpoint-ORIG-GUID: N00CCHlRrZLjP6YbbXvlTT_X-Z2PbTrK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:kees@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 51AC41818A8
X-Rspamd-Action: no action

On Fri, 06 Feb 2026 14:21:52 -0800, Kees Cook wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
> 
> The assigned type is "void **" but the returned type will be "void ***".
> These are the same allocation size (pointer size), but the types do not
> match. Adjust the allocation type to match the assignment.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation type
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6f6f3535192d

Best regards,
-- 
With best wishes
Dmitry


