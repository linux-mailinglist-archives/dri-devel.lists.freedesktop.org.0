Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PRBEIwjnWkcNAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 05:05:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E599C181882
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 05:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B85510E4A2;
	Tue, 24 Feb 2026 04:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="in5jhdXP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOSlQ82B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2000910E49F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O3VGHw1143997
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cHruPT+MZxPidZtYd/ng3z/8C6BpKuAaj3gZfQJAAG8=; b=in5jhdXPGm+dI+7M
 zRxhPEVg+f8V7PHhb1sN++X3e6fjjKy++Q7aUV8HmubnVCn8QNhe6+xvseF3Lzf6
 o4bR9Gy5yzv/Wb4SRH7FQxBwiOpfp61oyq0MAJLgmb2ZNvzIkU4EbNO2aMzEjMQY
 62+SA0oytzwg/nWCgeSDF820eC2nH34TwtJ/kyHnTPZ18ywKQoWwBrTeP5oknAis
 kEo5FpSlGppaLMFLWvhfPXHI7V7xqaX8SJxnlQkVmbzdWdpk8F+7Xb9mdbKWRbzA
 RjUCNx0bxazBvtCPHKz/I7OAhhBwK2O1Xu7PmKMi+5W5g1NAiRXCjMtFW0mtkTyh
 A+KnKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4568367-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb52a9c0eeso354412085a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771905926; x=1772510726;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cHruPT+MZxPidZtYd/ng3z/8C6BpKuAaj3gZfQJAAG8=;
 b=TOSlQ82BRF8YvJfiUSFvb4xTmuiie4Itg+LnkhnJxh3rWxSFc71cEwjpWLUUkIX7wY
 sTSiirJyqd9h7M2rcpzyX4gHbUbTYViRqnmlrqfovSU9LmHmwNGuiLZ6n5HU5lV/iLWc
 xLWPf2bfSZgCY91+HYFbbnkHeIaAjgQJNp0LYckm6ya4uxrD1lM3dULDuFfBWnUUQ0Be
 6KlwQHwOtNxIk8eZmM6QYKmKNfnGG6Ymp04zOJmYa0k/u+ShuxuWfbWKHqBAvbZsUxRX
 qBeZmEYT1cT8LgW2//0AErNfN8Abvt9VcDvrGOxXbFU/RNDe8GmXYjITwnQeIfO/ArvO
 A80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771905926; x=1772510726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cHruPT+MZxPidZtYd/ng3z/8C6BpKuAaj3gZfQJAAG8=;
 b=NkGnsGqT+Q4ZICtgJC6OZ6r8k/06nxnrgRVoapS1k4lhfaVRHomJkfh/U2wP1GynmE
 soJu1+Pyg4F7QeBxh48ouJN57DN29aVFM+UA0/FSZqTylO+PNGvOrwlwl1gB0WHbb1yJ
 bZFgZSAgDufbqjbfpQQ/2FsT1Pn6SkUd6JqvU5d3CNCu/BqKOv/cJZtJkD2co6cnN/+H
 3j1CnDkxSqRflUIVjDMiV+I7BfvQgrqksXGV+C/XDnsTku/a2aALpejkHKuAcGGBewFM
 ua2yuLzJ+xUW2ed24ILMQ41oOm/tRUwpnz9Om8/yyhppBALr2vz2Lio9zQlzeZLUddr9
 GLeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTkYPfgArqNPjitg2BC6u7+hfSQT10UrUiCXx9IabOvRV4fyVhK9HLEZ0+6a+mLd2mOT1K0a0L10I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkV2RpC+uRVBdJbDHOxD+59E/VRPlj7XvAqAmJdARtP7LG884R
 MW1WSy8Ra8dG6ECBfGVeQSeKzd7ThnGgbxEUOQGyGe4bFj6nu9Xb5z9D9dkh7EIVtIxoAfJzOrA
 k706AVUDteR3+zLsgRS3U/btD2nFtMdhqB/EzaR3TCuFSlOU7xjw/Jg1PVxB3HPEIv+oVEuQ=
X-Gm-Gg: AZuq6aLkuN7j5V+RV1VQFzwyKSKB4UzTKmX9zVH8d8vvd0OVEbBoXU9L+7tmN2TAiGf
 RYSs9wdhdX7lE6YOXmhT2cjYQwDdOvBybYoyceycJ0jv5uaLxHWn7b/3+dEBWvN/cRoBjQnBLNF
 MFhsYfAFMlKZDVVc8Zxdam4Y+KLeMv9QA3eD+NVRyqUxpoD1HlXVz4FFEFPisLK/SduQ6ZdBNbn
 o+W4P6v03aiJoRO0K/5UELGWtZ68mnbbrB2qoIWQ7uknA5WRo+iGtw6NhsRUhfHpdDWTxwMEvUo
 heCKmc2YkzGllh3oj7/r0srfEDDkPWtGcTdWWWT4LMHeEtCUbq3krLVFTVf+At4dj8e3H1LCG+z
 LWLFQ1pOsmkteGxMwDCjupUqkd1wMt4ORgBYsqg99ExWqVB4atsCnuDzRzsba52o1nOaOZQeN0r
 LqW3Z3Snr5f25OBx2hmfDAudXfPQbu0BqWb3s=
X-Received: by 2002:a05:620a:199c:b0:8c9:ea27:dbdb with SMTP id
 af79cd13be357-8cb8ca76216mr1543759185a.57.1771905926494; 
 Mon, 23 Feb 2026 20:05:26 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:8c9:ea27:dbdb with SMTP id
 af79cd13be357-8cb8ca76216mr1543755585a.57.1771905925962; 
 Mon, 23 Feb 2026 20:05:25 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 20:05:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
Date: Tue, 24 Feb 2026 06:05:23 +0200
Message-ID: <177190591482.429979.9121382739276431016.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
References: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xqSohv9YvpOt2OpAgBp5QaTKobl7RgFA
X-Proofpoint-ORIG-GUID: xqSohv9YvpOt2OpAgBp5QaTKobl7RgFA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfX9WXSG35eUcCK
 sYlDZMpKPhzAuvT8oPn+gKDD13iazFKswixgT6n+i8OYPRkBVC1OqEgPgKkGVKhnAWhje/Nx9rA
 sE/Od9sT+TkPjtbK4rRZI65pfg2YVhFgBFEewtqrYXdkuZGnxfY1d/LfHStjiyj1ABPnPkkqU33
 rVRGEZxxBWf/A36o9r+mTn1c7zAWfmiWC/e0ne248m4HohRh9fQx4z6i/uXQJvs96uAkDkGyWbm
 QT9DfGd5+EbMP9KRuzcx6aRNJVn7DNSdyQWrB7N0K2oX/eNgrnQtTtxEV9Cj6GCFQiDqYQbsxMA
 0dpgL97F5T9Lk8vASptD5dNDNc7LaZ+YnXoWu2e7G2rVDRozH9pjrBaa5GXRICKxNVRPCpmghAY
 wtDUUXspEtvE7v6TYVV7D0mDgjszr3I9Xnt/Hef3ZxM/+JSjjNIIoZLVeKH/jAhnJktB1Ttj6tl
 JHigYzPEpDLi6LrE7tw==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d2387 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=UNbtbxbA6Up85joFnAIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: E599C181882
X-Rspamd-Action: no action

On Sat, 24 Jan 2026 06:32:56 +0530, Akhil P Oommen wrote:
> Since it is possible to independently probe Adreno GPU, add GPU match
> table to MODULE_DEVICE_TABLE to allow auto-loading of msm module.
> 
> 

Applied to msm-fixes, thanks!

[1/1] drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a9dece60cc82

Best regards,
-- 
With best wishes
Dmitry


