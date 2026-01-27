Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DrtN/OeeGn4rQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:18:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E5393773
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E6210E53F;
	Tue, 27 Jan 2026 11:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGUQjWgB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8MyEnsr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E084D10E53F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:18:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60RAOnoT184773
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5xnQobEIb3PTCiTRAm6iLAFohZ8k6yzMVc57xfyF6Qg=; b=VGUQjWgBR6noPd30
 leOieDCXmP2JFK77aWaBCmrsCzt8AERkdSo7AvT1omojqsB5c/7OTKSL+e/kNqeV
 zKoF/LWZ7vEuSBmV8xjc63CwCrDdDvfUetJAKY6EG3mmtmV3gy2PbBqisEeL6GOB
 +gRbcmDgZcqT+zVMUSB7/ZjGcm5buVd4XcaILgOP6hu07tYc300G2r0nzGXImvPw
 fodJZvJLCuIdaGP4Gnxd90TSreZ0B195VYYvgZfmVsl1N3RJ1DA+VBBr2QfS64zx
 XoOj5VMJ2QdGKvtvz4vY0/1QbXeLxfsbqA5EP6/rLcvZciI48RnKMIDFaspdp9eg
 3f/VxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9jtq9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:18:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c1cffa1f2dso1707369385a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 03:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769512686; x=1770117486;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5xnQobEIb3PTCiTRAm6iLAFohZ8k6yzMVc57xfyF6Qg=;
 b=I8MyEnsr/cyprv+wWkzg6so61Y9I+9C90Dw4ylUWYW+yXsrpw1wWi87u99NVL8UZUG
 yNmVodfEKETFQAKd4ai325jKOGCbB5a/85pni2TKifZl0hFFraMBrhG6yW/N746ka5sA
 XK2CO33C+6Z7xLQz9vcZj9purie6EaOX42lHxAF7OZCNYRooKcUl2V3Wr5H4Hm8w3OqV
 7e5b2Zhzf4eeUWIk6AhaYObl2FrsQDRAsv0EXoXiiYbQ7AuZC1toARMWR3Lxr2VwJ6ht
 XEt6RNPxxiLUKHnE44UBgmO5W4OwCZpfkeybCLbL3+GaAvdMchbOCImXlV5d7PNoUzo5
 iHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769512686; x=1770117486;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5xnQobEIb3PTCiTRAm6iLAFohZ8k6yzMVc57xfyF6Qg=;
 b=iUGJx7BrSP8NhK0/2AiVY/iw4UmeiBG/2YXR8wNmJaFvnS+FZZLXWcFs6K9gDrbJOz
 26o0yK/CgkK/18Fbul4cyiR9dw4nKkzIh9R1bEupFzzIDVdKdRdmo6R3SX0B8Jkv8dWH
 4309Q9emlazSDHmaX0p9LxethVchCLM8cJvm2SayhvkCZP2k63tOjDhcbGLSMRRD/w3d
 BVmESJb+wtLfO7Io6O2XtQwzkZP/VJufYwrSfOmOzZedCYYMrUlFpCuG3DIWRFXXlhrC
 okGwKr+muJuYeclO+Vbc5h+gt4vYXwIiKt8Xjlx33kugOc9i5YwwC/gxdGHffWZTENpK
 wv8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBMqvBlq+9IHNMvKRxI2CTg1SKEwsKPR0KtdUv7TvqK8LJXDGK+uiXc7PjH+KLj6664b6kJEqDMO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5e9XIg3+Wb71Zw3ClzTew6mEBerlRt1D4FOuEKVpmsh3fgEu4
 WH/0gUS/gH+rdHErWzFQ3vFmKj+YC7HYT6x4JdXjgnDkXWr3bOHXRaaWG9OCbWE6rryube27uGR
 1zLQqLSdt6v8O4mTkQsJ9Jkvr+NgL9v8nxXSWO5bg22f0im+GB5FNbiogOnjkRFfi9TW5vKI=
X-Gm-Gg: AZuq6aJ2X1sgSJvHfouI4rsaYkq+A8ztNFYlhXjnItneqDhLTC5f3tzvwf+uaHoiCJ2
 m3GpSIDW/STwwwpJvyTl6WKn4Vxhw0JYSXpJxw2NnB6yJi++8AL77g8GfN4aJ2zOmb7/LOqdh8E
 uGXMJJpaL8lVN2PR14DOvnyLALZl2hoeWlxjYcxvmO4VhZpBTrdLVRKVezpxW+k3Bn8EU7mXkxZ
 e22v8zM78R8JDGbCUELLmzaH2vLDj0x4LnS+4CUZ71lfCE3Dn6A7wWtvtN6UADLFH9VasX1OAW9
 X6Qu1Y6QrIhVH27CJfqa3kEgeqCroKqNLfLo7MUhMBLEmojQPN5RwstX77jFAVG4MHuhFUrGkpB
 SpKa6z03ZzcTkJEu2YYR/lyf9rdhPnMv5hsVA8BwCfZhxoSU0ZvcwEmcPREMxwRTkSuwtBKzUkt
 860zsrX4WbYYQBcqkzmIQ+OsY=
X-Received: by 2002:a05:620a:2a09:b0:89d:b480:309f with SMTP id
 af79cd13be357-8c70c17d2eamr106849485a.7.1769512686201; 
 Tue, 27 Jan 2026 03:18:06 -0800 (PST)
X-Received: by 2002:a05:620a:2a09:b0:89d:b480:309f with SMTP id
 af79cd13be357-8c70c17d2eamr106847585a.7.1769512685738; 
 Tue, 27 Jan 2026 03:18:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385da01d635sm34904291fa.21.2026.01.27.03.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 03:18:05 -0800 (PST)
Date: Tue, 27 Jan 2026 13:18:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
Message-ID: <ci7m26yyzojptbfzengfhuudhqbofmljkxbraufpsnlvnzl7us@35hmb6vjabjp>
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
 <33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool>
 <whko2yur7tgutr4qhlbqfrvpcdg7hkyw66koicqvpvfhk55c7z@saj2uxrduv4z>
 <ff0c70f3-62aa-43f5-a437-62aae5b84e9c@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff0c70f3-62aa-43f5-a437-62aae5b84e9c@packett.cool>
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=69789eee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bVB5Ggzyottavkt8X-EA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7NUbjIVR9kzRT1wuF_3JD6sGLr9Av0jr
X-Proofpoint-ORIG-GUID: 7NUbjIVR9kzRT1wuF_3JD6sGLr9Av0jr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5MiBTYWx0ZWRfX78/sv0oVQuzX
 Y/PyLPLqujht8aDcaibzU9p3e7BcF1pvMFxGVGmh2+7QDWy6rHLAQmXLzZHq7LGQEhC7cLcuskj
 SvRvWdUpIoq9sR/1pbaXWg2rTbYRPPgwmGsvxxAzTt4LwDoyXVxReIh3n1iqzplVN4rzL7ogF+/
 p/AWk7DPwDHme93xb4ndcz7YWqZ+o8sH/IxsbcVeEc4SXDIr/k3GIA4MukmbEJIhJtSczHHzDp9
 atymcDIeoxE6TqRdPkKRGReHXXEf8xQrVD0CWcpx2Rv1x7NbNzjfhYtqY/TvmuzEigssSOGtO9g
 bcyAcUN+dGFcQ+P8M2EQigRjqNda4K10qEKwh5RK5Qdzk1ocVu3V6+B7G/TJ8sINvjHcWA+VF5z
 ONPXOGCc3gix+tNJGumtYIYibVioXSXHF1AJ5sc5wJOaQ8OCBtQ7F0oKxTqLtUPjpgaShOjBuAb
 7bh5Mo4pqf7E20XyTZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270092
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:robin.clark@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 93E5393773
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 07:59:34AM -0300, Val Packett wrote:
> 
> On 1/27/26 7:34 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 27, 2026 at 06:43:32AM -0300, Val Packett wrote:
> > > this has massively broken things on my x1e device (latitude-7455):
> > > [..]
> > > Reverted only this commit and it's back to normal, so I'm pretty sure it's
> > > this.
> > Interesting. Could you please capture the dri-state (only the last part,
> > resource mapping) with the external monitor attached and with this
> > commit reverted?
> 
> Just reverted:
> 
> crtc[106]: crtc-0 [..]
>         mode: "2560x1600": 60 280710 2560 2608 2640 2720 1600 1603 1609 1720
> 0x48 0x9
>         lm[0]=0
>         ctl[0]=0
>         dspp[0]=0
>         lm[1]=1
>         ctl[1]=0
>         dspp[1]=1
> crtc[107]: crtc-1 [..]
>         mode: "3840x2560": 60 631750 3840 3888 3920 4000 2560 2563 2573 2633
> 0x48 0x9
>         lm[0]=2
>         ctl[0]=1
>         lm[1]=3
>         ctl[1]=1
> resource mapping: pingpong=106 106 107 107 # # - - # # - - - mixer=106 106
> 107 107 # # - - ctl=106 107 # # # # - - dspp=# # # # - - - - dsc=# # # # - -
> - - cdm=# sspp=# # # # - - - - # # # # # # - - cwb=- - - -
> 
> > Also, could you please run another check:
> >   - revert this commit
> >   - comment out LM_2, LM_3 in the catalog
> >   - try the resulting kernel with the external monitor
> 
> Commented out:

Thanks! I assume external monitor is working fine?

> 
> crtc[106]: crtc-0 [..]
>         mode: "2560x1600": 60 280710 2560 2608 2640 2720 1600 1603 1609 1720
> 0x48 0x9
>         lm[0]=0
>         ctl[0]=0
>         dspp[0]=0
>         lm[1]=1
>         ctl[1]=0
>         dspp[1]=1
> crtc[107]: crtc-1 [..]
>         mode: "3840x2560": 60 631750 3840 3888 3920 4000 2560 2563 2573 2633
> 0x48 0x9
>         lm[0]=4
>         ctl[0]=1
>         lm[1]=5
>         ctl[1]=1
> resource mapping:
>         pingpong=106 106 # # 107 107 - - # # - - -
>         mixer=106 106 - - 107 107 - -
>         ctl=106 107 # # # # - -
>         dspp=# # # # - - - -
>         dsc=# # # # - - - -
>         cdm=#
>         sspp=# # # # - - - - # # # # # # - -
>         cwb=- - - -
> 
> Not sure why the dspp= line in resource mapping doesn't show any numbers
> when a crtc has dspp[0]= and dspp[1]= o.0

Ah, it might be confusing. The crtc-N blocks shows that LM in theory has
DSPP blocks.

Resource mapping shows if the DSPP is actually allocated (aka used for
the post processing).

> 
> But with LM 4+5, gamma control doesn't affect the external monitor.

Yes, that's expected.

> 
> 
> ~val
> 

-- 
With best wishes
Dmitry
