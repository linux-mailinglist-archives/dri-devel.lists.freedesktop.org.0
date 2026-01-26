Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLUvMJled2n8eQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 13:31:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765DF88435
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 13:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836D410E1D0;
	Mon, 26 Jan 2026 12:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVECKN/v";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1d7rNhc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF0D10E1D0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 12:31:17 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60Q5UFQS1018994
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 12:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YowEKJ40jbpJCqNsApsI7CaWnCkdpx8Z+MxoMBwJhG8=; b=UVECKN/vXP74zhHK
 i49rovL5MlaGkifwFD8cPrWe6fyDk7Pzx/tgGcGoNAVwgTLlQW7iwqt6UEmbVkLn
 mwgLsVorsPNemDfx2f4rBxlPYNMm40Bh/cfRBVXo9AtcVUlx8Ckn1WH/Kn3rbUFV
 X4uUHZLIfUD4mq6eV018kJAXbY7PHk6TxuHokYtwGrXvRaKOShF6vscArbbjtsa3
 QswNiMtxz0JwOomb41XSAcQcUTwHu4Q0q+9yQZIudKb0Lgsi4XLfUHrn37l0vbpc
 qgu6qq3KOkW/yiXZAzxJsTCOsaONc2fAJeKKiH2uiuKnesVw7el5BY73bqGWrRYX
 q9WNmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2680yxa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 12:31:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c6ad709d8fso969280985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 04:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769430675; x=1770035475;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YowEKJ40jbpJCqNsApsI7CaWnCkdpx8Z+MxoMBwJhG8=;
 b=P1d7rNhccTeGhH4aV3Bg3NTPPdUDZ02r2SXs738jet45huKBPao4E/scti7ZmcbLqu
 CKmsJyilYXMuJ08sCNXWP/NDVJ62GbnvXp/xTah5H2ib/RngGGvjn3S5hSE6VhEw95RX
 Q1wIRD99MXvuL9t8yuYcg+EipBG7XMgCJhuPmEzpJLg8pj9EYg5RTcpWRvvuuNHBRQln
 7jC2uSjg8E875kB3yH0MMuOtZD5kvnrK56Q2fQzixIcOy2ASMBgTXkBkx82XNkm8WSHi
 Xfs86mM4XrqAhQ0npdJvR3J0pGrsHk10tw810AOcuTKFeL0EDxf2zm46qITVH8j29SEX
 bJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769430675; x=1770035475;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YowEKJ40jbpJCqNsApsI7CaWnCkdpx8Z+MxoMBwJhG8=;
 b=npzcfzO6r+fGlNL3XHatI4wkOQfrC5QkSLfou3xyo3V4clEDRwLZdNtRZM75sn+0Ab
 5owjQx86aMDhJnCzOGhlpVNwRi/83UrufaX6VzU/h4d01Ea0lIwCNQuXLdw8+8J57Unt
 kNWOfDmcG9sPHtmI8KQI91P2XnHVZh14LNC2Q55Vkkp2hMnIlf08h0B9GVsMfklRi4Uw
 5OwPbDcxvxSDZu9C7k9FHsN56aUVN79a1QdUAReg0p1NgwHBydb1ywpgHlHOyBo3g7IR
 xMHBe2FsvjZg52teOw5XJwlUy29eETuvKv0toh2HHFg2m9/gVxzLOThim2RiTTXjt7Qi
 HngQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5biPy4Hqydm3YfcW6bGVEabR3UE6BnY20xYXSrOHG3iQBp1sldfpfzJcgYc5TRx0rmaJt8QldlaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUYfhvlRE1a/zXz+dZMUnAl9Vi58ufMCC4kiCqhXSJLJN4i0PL
 7lWcRMHPZJKoY/t0hoR+9E8m7Lm0XmPRvGzJ/lGeVE5PAOj2MlBi/IbyCl70twyVMOlmrFjtP8z
 JpfJ1VOBGQStwZha/ozddnL51HIJOPe1NvG3792EvOMmXJu5fAYusLNnIFKrtUQGFOVvOUJo=
X-Gm-Gg: AZuq6aJLPYWiXYj75VT3LHpIyrgFL4mlvVYAJPTr5tcjfb+nv3VZ7n4QYcta90YeJO5
 KVhYP2ut1G6oYVAvQgnZ25O92emD8tl38jGD7yxAAUZbNO9rg34ittrxmb6+O+GMjBCLD32kr3+
 lgGLh/FepmOJlkOOChhxKuM8vXrZjJ6H8vfpvD1GYXtPzXUm6rczEOPHxnEP6F6u3OQIL4Io7dy
 3YOMV6w6pcogi+7Vgt0Ka9wQWDNPRHdMPaxv2SLn5Xt0HW3sYYv0oPNHhxZ0ha1ptLzkcLrb/kk
 hS7NM8QYqvCfgA1INIO5Nb+k/vQGUiBLno3ls39qy49vpY1YbjLzPl5/HAntqDdqyLvcjSkkY8m
 1i0K8XrLmDI9K/DpPf8EU8SUTo65/sV7D8k736GugeFPDJSMrxR5CrvCu2oMjJIQR1KRPJWTD45
 OeQWQgn6NcLdApgBTFOmwYPsU=
X-Received: by 2002:a05:620a:7001:b0:8a3:a42e:6e14 with SMTP id
 af79cd13be357-8c6f97d6809mr431743485a.10.1769430675439; 
 Mon, 26 Jan 2026 04:31:15 -0800 (PST)
X-Received: by 2002:a05:620a:7001:b0:8a3:a42e:6e14 with SMTP id
 af79cd13be357-8c6f97d6809mr431739385a.10.1769430674982; 
 Mon, 26 Jan 2026 04:31:14 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385da170f70sm24274671fa.27.2026.01.26.04.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 04:31:14 -0800 (PST)
Date: Mon, 26 Jan 2026 14:31:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
Message-ID: <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
 <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
 <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=69775e94 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=u8JMoutS_zwJ_36QwrEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwNSBTYWx0ZWRfX/olT5QIK4WCY
 LoRNY+HlMbBcu/8f6fkxOp5ycdHpjsGKAPJ16dfb3+8yMc/5mxGlJezbjwUHaBym/0t0tEzhPkS
 Kc3ueNA6jezcdCBE7WH0X/aUjczelMxNAOGksowFOeRb2M5cKlrpaEqaEyoSgLDkKTMr4UGX+yp
 Vs1dO7Ra9hpwDsnt2i14bkGD0YS4Uqc3r+DD1y/zR3gAh2iHydtfGjsOs6DlQHX0fqsL4R9Udet
 o8jX60S9P3xweKvR4CblYOgdbiApx8PQviNo7Dcjzh9W+yt54w21QrbbR9xH2EwZyiynXc1O36U
 mbcHoUyWSvG/WRjXsUZhs1javrXI2VznNN7Lb7CuV956TOtlKTuyAYo8OyXp9dAlI0X10LRlpt3
 1eMAm7aB7CWLhLds3IeQXV8/W+1aaTdaQny8LabrY4OATSmqo4VvunMO9MAcnFsTds+aJ1mUTAZ
 QSBANJtgWUoBXnghFxQ==
X-Proofpoint-ORIG-GUID: 15rHOJuOfyzm6a6jd9hl7bVNiWZlVtb4
X-Proofpoint-GUID: 15rHOJuOfyzm6a6jd9hl7bVNiWZlVtb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260105
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jun.nie@linaro.org,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 765DF88435
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:49写道：
> >
> > On 26/01/2026 12:29, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:13写道：
> > >>
> > >> On 26/01/2026 12:06, Jun Nie wrote:
> > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月22日周四 18:22写道：
> > >>>>
> > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
> > >>>>>>
> > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > >>>>>>> Currently, plane splitting and SSPP allocation occur during the plane
> > >>>>>>> check phase. Defer these operations until dpu_assign_plane_resources()
> > >>>>>>> is called from the CRTC side to ensure the topology information from
> > >>>>>>> the CRTC check is available.
> > >>>>>>
> > >>>>>> Why is it important? What is broken otherwise?
> > >>>>>
> > >>>>> I see. Thanks! Will add below lines in next version.
> > >>>>>
> > >>>>> By default, the plane check occurs before the CRTC check.
> > >>>>> Without topology information from the CRTC, plane splitting
> > >>>>> cannot be properly executed. Consequently, the SSPP
> > >>>>> engine starts without a valid memory address, which triggers
> > >>>>> an IOMMU warning.
> > >>>>
> > >>>> What is plane splitting? Write commit message for somebody who doesn't
> > >>>> exactly know what is going on.
> > >>>
> > >>> Thanks for the suggestion! Any more revise is needed?
> > >>
> > >> Sadly enough the text below is not a significant improvement.
> > >>
> > >>>
> > >>> Currently, splitting plane into SSPP rectangles the allocation occur
> > >>> during the plane check phase, so that a plane can be supported by
> > >>> multiple hardware pipe.
> > >>
> > >> What does this mean? Without virtual planes in place, there are no
> > >> multiple hardware pipes.
> > >>
> > >>> While pipe topology is decided in CRTC check.
> > >>
> > >> ?? What does it mean here?
> > >>
> > >>> By default, the plane check occurs before the CRTC check in DRM
> > >>> framework. Without topology information from the CRTC, plane splitting
> > >>> cannot be properly executed.
> > >>
> > >> What does 'properly' mean here? How is it executed? What happens?
> > >>
> > >>> Consequently, the SSPP engine starts
> > >>> without a valid memory address, which triggers IOMMU warning.
> > >>
> > >> IOMMU faults. There are no "warnings".
> > >>
> > >>>
> > >>> Defer above plane operations until dpu_assign_plane_resources()
> > >>> is called from the CRTC side to ensure the topology information from
> > >>> the CRTC check is available.
> > >>
> > >>
> > > Thanks for the patience!
> > >
> > >
> > > Currently, splitting plane into SSPP rectangles and allocation occur
> > > during the plane check phase. When virtual plane is enabled to support
> > > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
> > > a plane can be supported by 4 hardware pipes. And pipe number is
> >
> > number of pipes
> >
> > > decided in CRTC check per interface number, resolution and hardware
> > > feature.
> >
> > Okay, but IOMMU errors were reported with virtual planes being disabled.
> > So how is it relevant?
> 
> After revise of splitting plane into pipes, the number of pipes will be decided
> by CRTC check for both virtual plane and non-virtual plane case to unify the
> plane handling,  instead of assumption of 2 pipes at most.

This needs to be explicitly written.

> >
> > >
> > > By default, the plane check occurs before the CRTC check in DRM
> > > framework. Without topology information from the CRTC, plane splitting
> >
> > WHat is plane splitting?
> 
> How about: s/plane splitting/splitting plane into pipes ?

This plane is not being split into anything. It's being mapped onto hw
pipes. But before that, the number of necessary hw pipes is being determined
based on foo, bar an baz,

> 
> >
> > > will be skipped for the first time as pipe number is 0. Consequently,
> > > the SSPP engine starts without a valid memory address, which triggers
> > > IOMMU fault.
> > >
> > > Defer above plane related operations until dpu_assign_plane_resources()
> > > is called from the CRTC side to ensure the topology information from
> > > the CRTC check is available.
> > >
> > > Regards,
> > > Jun
> > >>
> > >> --
> > >> With best wishes
> > >> Dmitry
> >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
