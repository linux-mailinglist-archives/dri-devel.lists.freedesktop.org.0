Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKDcKhdhcWkHGgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 00:28:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6091D5F805
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 00:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A71F10E8AE;
	Wed, 21 Jan 2026 23:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FW+4EZfU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JteuHdpL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8BB10E8A5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 23:28:16 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LDxrux3463156
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 23:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g9bPp3ZSthpe+t1u3JfXFYKqulcyRYf2GaBc9BOk+4A=; b=FW+4EZfU/iibQ/SY
 7UClGWPtwOTFeOKt/Yr5rdLbfIT6iegnm4bZD4QGlkaOwjy62ejlPf1cIriRXPh1
 5nrM2vHgIExHzRJpXshAyKnBJrg3hPtKesbrklwYAdgThSh+vRaV+3CsBnifkVzJ
 v7HTq4mc2drrXDnREevEA1mBJ93PvusBa3B2RFJrNUSSpL0McoJLKLewdjz4d4lx
 lWbTW+kMn4Embsz28o4+LEQc+e+f6MiOiIScq6wNjrWmB0oz1Z0AXxZNVuJOMpnG
 soQIy5nwikd/atV2DKM0nPM6DdHaOJW0Ftmw0PCLmsedNrVMxL5NmWoyk5chlaUf
 neMKhw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu0651qxq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 23:28:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-89471079a13so20122846d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 15:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769038095; x=1769642895;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9bPp3ZSthpe+t1u3JfXFYKqulcyRYf2GaBc9BOk+4A=;
 b=JteuHdpLR40AxWwveo37/jkyXAGWX0zyp6+2hbCQwwsrwLorjdFK8J/AvzJgwIv+a/
 g0FUUsOvwbLVCEJyNEud3awqamVJwLgpVvrgeQ/wrucCkT+4L6G4Kgvyda0yZFr1WKiG
 nlGhni/2C18roTZQMQdlo3tcgRvKDT48ahfcGNl6qPPBPaqpu2apZik2G8TXD00WiBqW
 X8XbG6a9ufVHAe4FnUGv7HVzdXnTLEr4pO5HKJ3CGhEjo8WeDZyGKO1WrYuwMPXOM4wS
 a/TViEhM3CQVS5lpljq1ZHfsOqTDhss16IIXCQjwY3EiA54t+6uOnjfDVuTRuNxba5HX
 clrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769038095; x=1769642895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g9bPp3ZSthpe+t1u3JfXFYKqulcyRYf2GaBc9BOk+4A=;
 b=ab+AmofViXE1uV1N2+9Z5lgRkC18cvRvj0TNgqIyw3nxlRcUEm25Cpl1oRnMjoXyIO
 es3hmaCc7AG/3+Fsjs/Sk4oQqtKW+3E/mZbfAugh1caI2wp3aLQcda/ZemDKnXHLDJ2a
 F96VNwU3wp9LBMN8DpXMyGZnLFWMSL5TLi+gP9mcUYdq8hcWuARctxzoVbjjLaRG0NFm
 6zo4skMp6RbGd36zcBF9LMzfBZh9eIiF0WaxxzHK2/oo1byU3KLN6SbTA7PdWzRTFOPi
 Y3eYdlqAHUi7Rp6hchLd82RRUY+NDsab8I7fq6qxXv6BbbJXzmRrfo6wOeUwCO+bmoaO
 koNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXjMoxjA69cdGLLNxm1yOpVuN+r3rJWg0+vwvMhzdxnR8rR+ch1TsGlQWM1lGwYdJ3hTcL7+BkJow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkKopT/geQii7W9XdJccWOa7lEKmwENblnFiL6w+xvdEM32iLn
 P/IddKLXsMbIphURvnMWEJ9Xn8+XHtVFs83Ltdp7wGmnBASMmy28yAXErBdmlg5lvJPbOu6+q78
 IYame7qtdVcSm30UR9PXwZ7866aaR96OXeMEfQHKqCnEe43pCsLEN5sSactu2w6w6IsStPig=
X-Gm-Gg: AZuq6aKAANYgeg5CcNmoPfNSdmyHmmQ93ytIrdOacyvx2VOKebvEBuGNJdqK8RyoaNB
 Ha2E/ciQ6+APtMwr+iKrm6ewJwwXz3yPqm1UD2spSf/QuBdkpZu2itinylW2yjwrfCQqNZMW2eu
 cXyuX357BuKlv7LyvJSBTqd5xDUXIz1i6VgpSfK63ychxD1byLU+X5vZI1gXc+R2QJN6S0GNR03
 DZS8Hhw47QhvSK40dACx6oiUrXZj3Xv/JWPFMRTwG5a5PvC2DkpylzFfuF8h/b/5Uio+7QumccE
 Vll0A5a71NOcCohlCTuRZvta1PR8fANqqkSOdpOLTIjoMgYmMNMVSPG+AgroMruXSh5TYXPAFKA
 d3JXYXAQ9xCC6I7sRF+wermGwH3JZnZI/n8FJBbp+KTVrVkQYv/D9Jp8A6cqMucCwmT2k7jDNNz
 J79ry+A1A2OrO8inuoTV2CsGI=
X-Received: by 2002:a05:620a:4586:b0:8c6:55d1:aa4c with SMTP id
 af79cd13be357-8c6a6956064mr2749624485a.71.1769038094726; 
 Wed, 21 Jan 2026 15:28:14 -0800 (PST)
X-Received: by 2002:a05:620a:4586:b0:8c6:55d1:aa4c with SMTP id
 af79cd13be357-8c6a6956064mr2749621885a.71.1769038094195; 
 Wed, 21 Jan 2026 15:28:14 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm5159393e87.66.2026.01.21.15.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 15:28:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Federico Amedeo Izzo <federico@izzo.pro>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ci: ignore Gamma test failures on Qualcomm SC7180
Date: Thu, 22 Jan 2026 01:28:10 +0200
Message-ID: <176903808260.3665431.1048287995519392078.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
References: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=6971610f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=tjCOpFjsgevByX77PJkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: C4kQYEW-65JI28rrR2RLr-RLYzaYQGWb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE5NyBTYWx0ZWRfX4HQ9blkQhl7q
 PSS0LVKi6VD68husn4X8OMoP1itCt36ggpVjJV+JZZS36cB7RHM6dGJM8QWvBLTHR/7wnVoeIkA
 xHcvX36krsOZo+By0b2moXldZlcE+pXuP6WbUNVPnHMlOSURdvtGTv71U7F6FbN7uL8mF5MhOEM
 ZVIUSD4Ci/WuVprMe3P7pP+ccS18dONa6QcqI2s7k6VzkYPtvFIZKhiwHnjkIpKIGLad2Ph7aZI
 gpBfD8fIC9Tq3bomzP1PS9U7KBsGgJ2XKD44zkxHvT37b34a0jZpjzdaPXqReU5sUu2cTW5PHV3
 +w9XEtNAEcm/550hX6gi/OEE5rtmae9UuGY0k214ppjSsm3u97PHoFfH8o4xepGtW2RG8TBJBqm
 DSqA0rnbFw0jUDeDxruz6xGjoViMyPNLxXEbG9vFD4YdVglCXKtv/nxqc5kpduG3vqYB4XmQiIS
 OKu4Q0ykBapohVruWEg==
X-Proofpoint-GUID: C4kQYEW-65JI28rrR2RLr-RLYzaYQGWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210197
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:helen.fornazier@gmail.com,m:vignesh.raman@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:federico@izzo.pro,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,collabora.com,linux.intel.com,suse.de,ffwll.ch,izzo.pro];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6091D5F805
X-Rspamd-Action: no action

On Wed, 21 Jan 2026 10:41:24 +0200, Dmitry Baryshkov wrote:
> It seems, on SC7180 color conversion results are not included into the
> CRC calculation (unlike SM8350). The fails for SC7180 already lists CTM
> tests. Add gamma-related tests too.
> 
> 

Applied to msm-next, thanks!

[1/1] drm/ci: ignore Gamma test failures on Qualcomm SC7180
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b38d2c3302df

Best regards,
-- 
With best wishes
Dmitry


