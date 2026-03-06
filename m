Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yApxEeIFq2kMZgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:50:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB022577A
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B3C10ED81;
	Fri,  6 Mar 2026 16:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lol5ATvQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYXjF9M5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3AA10ED81
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:50:37 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626GoIAi1316139
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8vR9O1h/aF8AA1o37Ha5hCLF
 r27P3n8CHO3krh2d4EY=; b=Lol5ATvQ8GJoIGBKZ2XL13njLQrn765VwtWjMKz5
 IaBEjqNHJ5OcE6JCJhYaodmAhBjNmKwNkoZH2NkUOuDkOKYCQZ3pbae68FeWLrCi
 RMQ4daXgM58X7NZOd+kTewKJfkMHjZlS1yq3HFXDHBHIytPMTjsJddPVQKi9N6oO
 erVJHZbclFsJkj+q9e7YfpAbTEKXXROiC6OTT6PZUXa+z/WxoEmOAcFR0tNYikey
 HgaxSPW0bQCAAdiWG4hTIgzBscizPsAE/ZCPg3BdvnFiWrsdLf/Yk10DmNkk3tS2
 DnVzk1EIpmrK3ijKzmVlmIxUV6FP/nQsxlvSot7mx6SK/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4sbfvj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:50:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb706313beso1228496485a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815836; x=1773420636;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8vR9O1h/aF8AA1o37Ha5hCLFr27P3n8CHO3krh2d4EY=;
 b=ZYXjF9M53rHfrD4egh2NuubDWAZbUph/Ph+ILgAW8XoVx/F2I3ZWyO9tZKqTGg5uN6
 HmePicPKVcz0IehGxdGJOJTo4ViBssa/KqIJ/zYKKnxpFH3zqbSd7bCD6YucxbtIjPpA
 zV5wi+t20JBMisE/ztLh2vKEmO45vouuF/HFVrzATT7eYRoTSJGTgw/0yXjqu8hzoEXk
 fTkXx40OFiYHdTunvexIAJRyL3Il+ifUWznFFqSW899EVajA4BMuKTS3/C7KdYc190j9
 Ko8i8ugUh88cYV0SwcShYUAxCU4DzGsyWe1yVC88D525VSSWDkJvkS1C8q1yqvdrFE+9
 OblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815836; x=1773420636;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vR9O1h/aF8AA1o37Ha5hCLFr27P3n8CHO3krh2d4EY=;
 b=Ii7LpJam6lvSVfJyr8UfX1dAxrMp9IP0MCmOBIBPOIG2HQzKUlsBdBaZAPyHcs6MmF
 rXVsOw/mx9Zw50GnJp7RrzHq3M3etgZjB5Ej37QcO8ZozwW7iD9T2T4qFOmz7Dip4rHD
 MCSdPnsKUCEeHhTqY8VqzNdK6OKR9wfbNEMzpEhjLJFi8V3nyLls/5HvxvDatBJ12006
 lmG99vKDbkem+mjC5As4aYDTn6EgzVmEXH7SSf+sLuW8hb1ZRb3E9jLymSFHFojTJgFU
 639xvZPv3utmWQEoYG17iQncwOdXq86Z8c0j/VZx90uC7xQ4WLM/OMVuvCRnguguCGGy
 n2EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx5GxBPJPykpKzQibz9ZadpyWIg60J70MnsbHRD0hsI15Fx/KP6AGzN+Xph0QUb823GDOEiZeWQqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQPSEqyrY+f+2gBhmk1EV0FrFtTR4I/SUZ1pb5aePGG6lt6/7A
 7vI36+Fkk8J7FhXBnWPAIwR8ALJ6vOLKXZSkvrAmfkz+ErNbHuygqnpzl4J361V+KOKJ0FHjn0+
 6jY415aLbwGjKOcsbLapT8U+dd21716R8GdFBvZV1Rs4bAN+7Wk3mFsZ2CIQheLhe9KNB1G4=
X-Gm-Gg: ATEYQzwfDSpfINatTVJl+heFWbhtOmzvi9ywwSeTZmXoUNywENp93fzH6BdVnmCAAtp
 HV9uU3kYKxZQzG40LA5Edekp4jNgfMetmZ8bZaFtDlG03uCSY0qaQEU8NN/HZ6kY602raCBH6eF
 bSGtDrNzHPNoW7RK8h55EeBv0vKbaptKRQDH8IjULY/EQzQ9T18WeNp5JP2PKWUhvBY62sNQjbI
 AALsupbofcYaccgUXri7QGIar6RlzxKjOi25LWcqY5mRpbes8tmYHhypGKcqrNAifFY6+AneQ6/
 DlajNQjwC3HCFGHtBfEjI0HbuQ5lD+tLpVG6I/TpFnjRki+hJflGIYQovZkEcf5BYPoVYERLkDa
 Ue/fg65F4mz22VZA966JJs3xejVs2okTz5VwviAD6rmqwNjQ+UnLi784NL8vLer6P7GLN0KAhmU
 qc3OBJmCn3LIIab8tRXqaU1Mx89VsJntPGw3w=
X-Received: by 2002:a05:620a:4588:b0:8c6:a809:862a with SMTP id
 af79cd13be357-8cd6d42852amr337432485a.45.1772815836158; 
 Fri, 06 Mar 2026 08:50:36 -0800 (PST)
X-Received: by 2002:a05:620a:4588:b0:8c6:a809:862a with SMTP id
 af79cd13be357-8cd6d42852amr337428785a.45.1772815835615; 
 Fri, 06 Mar 2026 08:50:35 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13d086079sm434104e87.69.2026.03.06.08.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:50:34 -0800 (PST)
Date: Fri, 6 Mar 2026 18:50:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: fix pclk rate calculation for bonded dsi
Message-ID: <6k4wgdu7x5z4b4erlgteljb4742brknbwnewoobwhv2qhqawde@wpkhreke3gsr>
References: <20260306163255.215456-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306163255.215456-1-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX+KT9yUfJdVsL
 hbNQWyXFxMfxLT1Z1ya628Wk1t3o9nNDvPA+m2S9L2plBRwgzVYk/5DqzVXsKMPMWytkBDE/cf3
 oUqDJaHvWvOB8bwjZiuGOupj0HY5HLa5yByBMq7af5CtxTMidwteWUC8xCQZgeVNrw/jQXuZFkH
 0Zbe6ptHQJcmdBxY5n6rhbaKk6mEbRNiGZD7rS7rT1kCEGucqDJic80HpeEhvHRhX4lAVqbUWAI
 u7roozdl1mWccks5YX0NfeiyjTQyFT8FHRXTsQiqvzYum2XbEyG5mqQHxyJvPgSVmdOeBVKU0uJ
 ic/0wnwkdp8V2smfmT+0cqOAYEKBzczPIdXc7pEnxcpAEaxv23Zn0x+woBuDNQOt5qY9I19Ajun
 GLdz01js20NaNPuvHI+iSDfvsoY2JUUGsm53vT1rAVKPdl/ILfRZ7L6UHWM7urYYmeclidYDujP
 ZlDQw2PxHt6TNWwl5AQ==
X-Proofpoint-ORIG-GUID: T9Gpo6XMRD6ilhRujqaURXHAT4ksLOls
X-Proofpoint-GUID: T9Gpo6XMRD6ilhRujqaURXHAT4ksLOls
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69ab05dd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=X81lAphP1gkamZjTqCkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
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
X-Rspamd-Queue-Id: D4EB022577A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 12:32:38AM +0800, Pengyu Luo wrote:
> Recently, we round up new_hdisplay once at most, for bonded dsi, we
> may need twice, since they are independent links, we should round up
> each half separately. This also aligns with the hdisplay we program
> later in dsi_timing_setup()
> 
> Example:
> 	full_hdisplay = 1904, dsc_bpp = 8, bpc = 8
> 	new_full_hdisplay = DIV_ROUND_UP(1904 * 8, 8 * 3) = 635
> 
> if we use half display
> 	new_half_hdisplay = DIV_ROUND_UP(952 * 8, 8 * 3) = 318
> 	new_full_display = 636
> 
> Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
