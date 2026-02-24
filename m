Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEQ2Gq51nWmAQAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:55:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7603184FEE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F27C10E1F9;
	Tue, 24 Feb 2026 09:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKdnxV3y";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCjS9gHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D2310E1F9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:55:53 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O9sJV62513127
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NLB0qQPuzbACSQImKVEef+mg
 RNvirxc5Ksz+GvAVFv8=; b=MKdnxV3yzibPL80QEsKWXtKNa48g2J7/F29iuHMc
 718U9q+WCWn6PWPyu6uf8pD54aLMAQs0F7rIlgU5c99EbayoA8HG1LUL+HQ7B1NR
 GTgBYTv4kIV+jqYQ/hnk4Bh90PUw8D0HzuYEaQE+h1WsP0G1iFFHtKzexszyTZQO
 ecKnu5p5bSFqO4zlO8vc2He6LJgDbIRP0TKN1SGcEyssGXNGJhOoAeLWgklYBKD0
 2xtL6CxuIoAEfD2jd5b8lGCu7Viw3bAiw8cSj906S/YdJR76UeuQtBqcZbhJwujK
 Q26rErbHgnZRiD8BcrQJf6bNMjMoHeTsID9ZRMISGgqUNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e38ygk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:55:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb3a2eb984so2601401585a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 01:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771926952; x=1772531752;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NLB0qQPuzbACSQImKVEef+mgRNvirxc5Ksz+GvAVFv8=;
 b=kCjS9gHwp4qe0csyqDPx6MJ1FI8w1cnMJYX8ymRUwKD8UBVr/rgGFbVE7bN0EknvTL
 A5Bfcwr3wkBM7+rmIAPEpKdAbAneILPb3shpUDq0cOtVBnVPhkoD7Pg+dJC/CcUl1u1/
 pyGGlalF6fIX0hdHkKEBB/myirYTU8qsJu5jZ6Wv4dFQ513eADb7wTriVUYqIkEjeZ31
 4BwlIADTFtkBE7/Hndc87Yk1JO5N68vYAdaIFqfjFftsoPXQ8zEAiCtLCuK/g3fWfvHP
 p2/mYzmld066s64+uBn1vvUlLM03WL+IgSPr8vcAPpA2ucbQoW69q7GRWeKwOGsf0J4z
 u3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771926952; x=1772531752;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NLB0qQPuzbACSQImKVEef+mgRNvirxc5Ksz+GvAVFv8=;
 b=sHzGyR7avI2WgGN3Pumxe2OJGvintDzsNWtmVR9rit8VFDQIDNwgJ/yTOrtIEjxNk6
 eQO4qjG0LYfKNYHbmbzAspyfTvcu9hS9ZvGmaxbjYHuLFGHJ2XHCceIeV8qOykP6vp3R
 1ABfNCV4YEn0b0yZdy4SNetSW9dTmKjyvnpAeVumAbbAVhvh/XXxQgW2gnk4kI53fZ2n
 UM0gJJL4ENVkp1WupLiQOTE/nVSsxtXv1m0I6L0P+0SXl/U8GRvzDwrmZC9ZpCvd5a9Y
 74mEOQfebFZgGtYNozhmzFP26PNTdEPP+WyiLwSX4FTgwbpcOCSp79ovN5TswBoAFyBU
 qGkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw9Bm4GuzFIV23FFpuz7Ccs0wSf+q92hCQgNAKuzio0KVo4ltYq2w4DIDE5U23EM9y22LYp4WEEeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy2Zu4UzaG8gNn7bh6T41Yd6VZg1/28expO9TmgguCdiPSLFLE
 nXR6u4+AcvZHd6aOnq4vfUdqnfwgWDTbicBQ2ZEKJ0UTGToAIm89jgk1ILbRAx0dZG1RA4opaO3
 9nPiL7CqABAAKC10XbZ58sskVKdUwU2SO4hF+dQxt5NFC2Dg0p2u/9xKqU5KsOmSdrG49JlU=
X-Gm-Gg: AZuq6aKcyDS/2P0rbmfB5LzRwg9sfqBCgcC3lHYPgBXXalvU300uBsPjkAmIgyWsnW8
 PKej28u+ENUTiBqP/ZwHUlMclry6BBY48VrJ9Dz3idv6u2cum3/jhKr/l8Omem5+AyKGhHzTvoM
 lEedYIVMzlK5KqwYswJEvzpGWne+cS2dd5aCKa4K8RWuqeORRbkxSslNVtLfphV5OKEGoeIjLoi
 Av9ZTsOD4CzINFfbWtarHEwFeqhACQaQMXuW8Fy5nCcGrENO5OeXgBxZSWALNcVZ86I09g3mnxo
 xi8w1oOAsZyCNp0vNPG97axdp57vN/f/XEhGzOwt9/zOP6XvCmMeudtMKJez6irTQrCMT23YEBO
 3FECSebgSLxozaynO6o6qXNnqPCVqSsVi+5j78Jjdjc49FE301rsetUQ+4xNTHf9PzrSIjKlUhv
 dGcwG+hQQImIeWnH091gK8EecpYzG/F+vRESk=
X-Received: by 2002:a05:620a:1708:b0:8cb:3505:443c with SMTP id
 af79cd13be357-8cb8ca63f71mr1522350885a.44.1771926951643; 
 Tue, 24 Feb 2026 01:55:51 -0800 (PST)
X-Received: by 2002:a05:620a:1708:b0:8cb:3505:443c with SMTP id
 af79cd13be357-8cb8ca63f71mr1522348085a.44.1771926951077; 
 Tue, 24 Feb 2026 01:55:51 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb0b95csm2073554e87.16.2026.02.24.01.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 01:55:50 -0800 (PST)
Date: Tue, 24 Feb 2026 11:55:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yifei Zhan <yifei@zhan.science>
Cc: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/panel: Add Novatek/Tianma NT37700F panel
Message-ID: <u72thihdv7ct6twwmqz6744w7ls6ulhqqo2awwq2mmhkva4xzb@cbkowz6rwnj4>
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-4-mailingradian@gmail.com>
 <gpkuq7b6mae5ib2xvphmir66pb6ysexhhfqkorve5zewkj4ofc@ryccazsoxqm7>
 <DGGAL7I1KRM8.1DSZIKWRHLEPM@zhan.science>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGGAL7I1KRM8.1DSZIKWRHLEPM@zhan.science>
X-Authority-Analysis: v=2.4 cv=UtFu9uwB c=1 sm=1 tr=0 ts=699d75a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=X6Xd5_H3JNy0hcg6DaYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Hf9CUzP50-2Ez6aE4oP5Jcw93Y8f5WfH
X-Proofpoint-ORIG-GUID: Hf9CUzP50-2Ez6aE4oP5Jcw93Y8f5WfH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MiBTYWx0ZWRfX+hdfJFGD5XFy
 YJYoeFdike9ySw3xeR//Br1LZk3VJpoEMAYE+olmu1kf/v9eBB4HnwO/sXHWP3FrpU0LAAWuwN/
 B1KTbd0sg3TEpxljQz08vjbB0kzSkR86ICUv3t2yMwtVi3nVkbaQ3fpbrSnMWC9m0Z30KkOB+SF
 F9Odc0w0wIK0h9Jm7yj2xrP+l3DWdgGbpc6HK85aZsFy4zZwslvw861rGJjCF9Y++hSQTLr9iof
 Ha+z6W41X+xtkYmvrgwF0Skkrsfww2vGbCVX2BdzDw1uMEoibOZDRDjr6GBDhaZOAE0iMlSkv82
 XJWtTuvGVndlnTqQUrO5MsZas14gX/mnl5oVcYJC4VPqEHQmE+bEfou5JVYe2il1Bcys+n/v+x+
 vz/e3ZkpRBKnGIx+0cHvnJsXCBRowYXswsCmXj7KDdA2A3IlCS9UFEmSnse1RCYrh333jr8xwYu
 T1uoEmtfPmUcWpYsWcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240082
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yifei@zhan.science,m:mailingradian@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.969];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C7603184FEE
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 09:51:57AM +0000, Yifei Zhan wrote:
> On Fri Feb 13, 2026 at 6:07 PM UTC, Dmitry Baryshkov wrote:
> > On Mon, Feb 09, 2026 at 09:32:57PM -0500, Richard Acayan wrote:
> >> Some Pixel 3a XL devices have a Tianma panel. Add support for it, with
> >> the aid of linux-mdss-dsi-panel-driver-generator.
> >> 
> >> Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> >> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> >> ---
> >>  drivers/gpu/drm/panel/Kconfig                 |   9 +
> >>  drivers/gpu/drm/panel/Makefile                |   1 +
> >>  .../gpu/drm/panel/panel-novatek-nt37700f.c    | 294 ++++++++++++++++++
> >>  3 files changed, 304 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c
> 
> <--cut-->
> 
> >> 
> >> +// TODO: Check if /sys/class/backlight/.../actual_brightness actually returns
> >> +// correct values. If not, remove this function.
> >
> > Any chance of checking it?
> 
> 
> I tested this with my Pixel3A XL with tianma panel, it worked correctly.
> /sys/class/backlight/.../actual_brightness returns same value
> as /sys/class/backlight/.../brightness and I'm able to change brightness
> level.
>                                                                                                                                                                                                                      

Then TODO needs to be dropped.

> Tested-by: Yifei Zhan <yifei@zhan.science>  
> >

-- 
With best wishes
Dmitry
