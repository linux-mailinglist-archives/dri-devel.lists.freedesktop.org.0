Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4D0CAA521
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 12:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40FE10E2C7;
	Sat,  6 Dec 2025 11:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRAMgs9m";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="St8TGhIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F8C10E2CB
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 11:28:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B65YS9T2641176
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Dec 2025 11:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eftNH50iSq+b1pQ7t2A41tuU
 7np/m1Ety8HH1ooE1SM=; b=fRAMgs9mCxazzXMzvY/ljPhA+e7OThl3YLhsj8ag
 E0+PTIudFHWg6pcpyS5dVUKEgLQEZjFp+y6zKUBesZtRUICX+Rn6X4SUtEH4SREF
 0FsGlxPwLVw3mjj7/nScJ1gkLbuxG0waYVBscNDBnvK2xuhSbNJTI0dP3WYXL9+a
 s8CX6KXW6q5TDl2KvW0GrNYKNkdLRUql9XF6eLXmTo4BZ0O2DgtYsXUEwaZI3naq
 7W/jEEsk1epwTBdXUFtdTQd0dXYTtx3yiUwzixFB/3p+Nf2ljpaMz9rvnnj1vZi8
 Ay9uoZglavJpHuWbrN3KSqMbokUI5/kFcN3+xnKj11Psrg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcndrmnm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Dec 2025 11:28:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2e2342803so658228585a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Dec 2025 03:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765020498; x=1765625298;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eftNH50iSq+b1pQ7t2A41tuU7np/m1Ety8HH1ooE1SM=;
 b=St8TGhIzYhK0q8eODkjC96+jyqER4aybqsHJmj2kozN/gKwdUlpVCJOaG50OyYvQ8z
 yqClwv0MyWGTJzWTBnFExuuw2myWLTTCdh5zANOIGQjjJNl86sA7dSW8YHRhvbwvMQYE
 c7laBfMfKbYJ4Dqnipum+xf9GHyOVZGBn4lF+4yZYEVfdXBJlkswmLT3XlLQOpjhPjIj
 MOjuBL6Ncc5VN9ysPWIq3fCYCU5hzYWEFYmGBlCK+Tp+zl4MwH2oGak+zw+i0MnjggfP
 f8cbHoILUGWpwbCP0OijioVWrtNiottZ4LmMcPGOdvl+uT9svMieDYtwKDHNlWV+EAou
 Chag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765020498; x=1765625298;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eftNH50iSq+b1pQ7t2A41tuU7np/m1Ety8HH1ooE1SM=;
 b=exK572rsZljy+5rN2EGkL/puztmNCYWZdT4kJgzBnUHZ0eDqiS/o+zMmis9EZCgQXu
 e0yv8PeMLuustY6rwLzosXDntwiJD7GSRDHquWMczWSSgKmVcVtl8yg+Y8QZUtSYxee/
 vXoEIyFgmNApl5Sn4ZHwTMr3qaoa/avP5v/9AMALlvrVj1lXzybEYCD0MidnPfp/hwDX
 wIx0EvLuUgCRXY5IqFJwJUn9eeeDnnKvYoYxvSmBwf0ovmmgoiPfkGeUPgJo7zXiWHYZ
 Dw65SUTuioAdeAQG3PP3Mcp7UJaRcm7Gs7R0ez0qst9Lx7+vpgyxHlXZkTz+fu2DSTiA
 rGKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSvmWJTF3NKjFO4ykHLTqwD8lAlbojPj87KOjEhQG/ycFBPpJwLXVZOPvssftOQUdMq1DFNDAEovs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1GqtlLuGjjlIjeGbFMMSnyv10/8f//keVUp1PXA/Xd4F3jXKU
 XErzb12i1oyfXDr4BR61CQLeiEX50gsFhuGX3C/LyNpnLtu3dQrzZWLKlo7XscY49gdO5327zh0
 O/lRLKPuLZct+dLUJbJf8RvVSlZlMJhotIjs5ydGp8a1ke3akTMKux0Gc/SPdz44N12Vu1f0=
X-Gm-Gg: ASbGncsxyiVQG7hybPY/F8Q7fSJrDNhOitPdJBnmUMwKr10i1tZV2wLYlCZeQsRAnaa
 ruXP5haBa02ipoIQJM6s/71+f14j9JomBK4+JMosSq7u0lmfaCdx/ajEZTZRzA8zJO1AfR/YL4L
 TbTLXnGQlHiKgUV5AQK+SBJ8LTEZE3cvRGBoST7ipoFRLXBZSDlq5fBxA9m4m2s35I29EFXj05f
 Tu25OCIXKsjcMSzmt3OeBoP9XwWQMOfyIlpZTolnC3K6FdA98VRNEb+LpRhqJhLdynpqZ9ISjtE
 Oc/y0iS/ZRcuJzKQIWV5SVeqr4MN7+iNHtzn4o5rsONxyht1YIHHsxvPoSoVPeipJx/woy5xMLl
 uOKsOJv9CQQA4nFoRgLmi6j5wJFZnM94TyGLW5H3zdbkjxmM7VmmPdDkcEgHDALOzA6J9KqSyIi
 PbEZYGuvDtqxDV+qJtKYC6SoI=
X-Received: by 2002:a05:620a:6cca:b0:8b2:e0ad:eb97 with SMTP id
 af79cd13be357-8b6a23f9f27mr297014585a.83.1765020498338; 
 Sat, 06 Dec 2025 03:28:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJHWqoex+xRiDmmBbNdl3f9VzwXv1wYvWtOWvVciq53luinVftKkSOrV0+ulKIRpu8jICgkw==
X-Received: by 2002:a05:620a:6cca:b0:8b2:e0ad:eb97 with SMTP id
 af79cd13be357-8b6a23f9f27mr297010485a.83.1765020497870; 
 Sat, 06 Dec 2025 03:28:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7b1a5d7sm2399030e87.15.2025.12.06.03.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Dec 2025 03:28:16 -0800 (PST)
Date: Sat, 6 Dec 2025 13:28:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <5dyhjur3hkhvtlwrl4h2m342byor7f3ssvkunj4cggnhbhlmnb@l2mfz7ypjj37>
References: <qx5ashx62pufott6hnsfna3qntnoyvxwxze4rihhuxcsdxi37s@bbdvc3sfsgne>
 <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
 <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
 <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
 <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
 <20251201-enlightened-zebu-from-asgard-5a20be@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-enlightened-zebu-from-asgard-5a20be@houat>
X-Proofpoint-ORIG-GUID: qiDJ-7vF1YxTNmYGBaOKG3tzAc_Bw98D
X-Authority-Analysis: v=2.4 cv=baJmkePB c=1 sm=1 tr=0 ts=69341353 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dcO_3dQx6njePB8vrlkA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: qiDJ-7vF1YxTNmYGBaOKG3tzAc_Bw98D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5MiBTYWx0ZWRfX8OZwu7QoVFrR
 eHA+008bhpdSoB1PGNyxBR3qjy0/V6aTbsqQ+j60BiILxyz207Od+PCFI32mrOdYq/IEMUBjWYT
 cavTnZpLRf0M3u1RRS7hEVWht1vDPnaK0O+YG2AuJHErvxDWiUJZZ0Gpl6tJs+9CPbqK4QKQmzE
 /bVvnIxnu6OlvsKc3IRcN0u46mqok36tI2V/BFMrcPtBCkw1E0+qhpAX5oq3FOG9t9WyqQcQafO
 BtMk0AAZk+cA5re5L7GOPyL2tCyWO21elJHnyJtjQMyH6q2XYw+vJpFztSKra/tRuAXkPMNx0tf
 Bmf6WzvQnAlzUYtHYmlkwsPDDgBArWIku9TL0oh1Tm2XEWkj5O6ijaHXlxfLI460SrQkf5O5w4u
 YH2LtxDlDpeAQPrnTJsSt+UUQwSLig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060092
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

On Mon, Dec 01, 2025 at 06:01:56PM +0100, Maxime Ripard wrote:
> On Fri, Nov 21, 2025 at 07:09:01PM +0200, Dmitry Baryshkov wrote:
> > > So it's not really impossible, you just need some hardware and a day's
> > > worth of work.
> > > 
> > > There's no reason these should get a pass, it's breaking the spec for no
> > > reason.
> > > 
> > > > > For SPD, It's really not clear to me why atomic_check should do that in
> > > > > the first place. Your initial concern was about exposing infoframes in
> > > > > debugfs that wouldn't be used by the driver.
> > > > > 
> > > > > If the driver doesn't register a debugfs file for SPD, and ignores
> > > > > whatever is in the atomic state, what's should we force drivers to do
> > > > > that?
> > > > 
> > > > I really don't think that drivers should mess up with debugfs on their
> > > > own. Making atomic_check() disable the unsupported InfoFrames makes the
> > > > picture perfect: the DRM no longer tries to program them to the
> > > > hardware, DebugFS files stay empty, so the whole state becomes
> > > > consistent.
> > > 
> > > In the "bridge has no access to infoframes" case, there's really no
> > > infoframe. An empty file is "the infoframe can be there but isn't used",
> > > not "we don't have access to it and can't report them". Only drivers
> > > have those infos.
> > > 
> > > If we do split up write_infoframe into multiple functions though, I
> > > guess we could create the debugfs file only if the function pointer is
> > > set, which removes drivers' involvement if you don't like that.
> > 
> > I'm fine with not using HDMI connector framework for lt9611uxc.
> > Likewise, I think, it's fine to have empty files for the infoframes
> > which are not being sent over the wire for any reason (hw not supporting
> > it is one of the reasons).
> 
> I can't think of any other example in the kernel where an empty file
> means that the driver doesn't support something.

Okay. So we need to sort out implementing the split write_infoframes in
drm_bridge_connector. Any suggestions there? I'm asking, because I don't
want to end up exploding it.

-- 
With best wishes
Dmitry
