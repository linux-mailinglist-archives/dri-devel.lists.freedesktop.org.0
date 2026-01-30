Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOa5KYE0fGmMLQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 05:33:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C243B71A3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 05:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6980510E8E9;
	Fri, 30 Jan 2026 04:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYQcsw7N";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dG/sD1lY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6929E10E23C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 04:33:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60U3W2IH1902438
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 04:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F/cqYygW96iK1z9t9XsqVFPdMumTVwlz+0a1j9oJuhE=; b=UYQcsw7NVJscgjNh
 VmQc3WHTOvz7UXOI5pzfVgdbzQ61uNPSvkG8rcsEJzDD0AlUPT2BlC0mda31x8Y+
 4WXKmwoch6v+0wzLNh/2e88+oabXIZfe6TZcN5Y8kXqd0jRXV5PT7+lfMPkJap7i
 tQnNrivbOftzVUlTmcKZGvOlGNi7oyvV08Ij3aV/sRUqvbW5qcnoqTwl1XhcYhJl
 eVGiJngUgEqwKdg7AO99sFYsEyC49bbBIjufKCkUd8Vd+HA0tw7JhwGcOzKHpChw
 urIVcY+4S/8i9SdvS1lLbk9ReIzfjDyCikNDKp1o6uHK7G/bCqTp3GqH5H7/6vTe
 L8jc7Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05seb4se-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 04:33:00 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-9431a97992aso4679054241.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 20:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769747578; x=1770352378;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=F/cqYygW96iK1z9t9XsqVFPdMumTVwlz+0a1j9oJuhE=;
 b=dG/sD1lYwLTmUqkIvcJiTsHZhZTCyy2/MtuhJb2UlmrbCkaQF0AbLGnTrVwrdeRPEA
 fozIExrnVNTGUU36+3Mrsx9yQamrX+cL39KA4zyofSc9d6tnFR+LxiQM3U7TEdjKpNUi
 5BfMtwai14xKCbgG9FuOYwUfduAfr9ioJfrAbiiTPXbJWQVHkv2yapgL9UGVZwTf6OVB
 y6PFGR+jcUixGqzdghxUiA/WUZQZHbaAFsk1HVMxpD+mO1B3DyhY8OHX/e4lNpdXpY52
 mLnuMlG3AHVRe52Tp74fKjaXGpsJns5x2OW+GEHRE87U9/BcGEBpq295vLy2WBD/0XpT
 OYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769747578; x=1770352378;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F/cqYygW96iK1z9t9XsqVFPdMumTVwlz+0a1j9oJuhE=;
 b=w13lYKMqzcl62XB9Co5JyZmY2svJRrlJXswsE1yKn7RMFDR0rlHpK0gv60yjXWf9qJ
 04eJDqgUBcXnr5pxUtLSGt1MPQUbUFhx6clhiSV5gYoGgBHA/Ql41L3tMkmsSfNSPTny
 YYC3b1yFaj+KRmS01zEmY6eMWIm2YZYngq5CytbEuedFleXx3mMUIuWpBil9nteARm9o
 a/Y8ngkPpE5wABdU9CKZ8OGXMjqxQmj3o+e9xYlxtL1w+KdMDsMUlUOXEhaSOpGM+y4M
 K68yGD+ebRxNg3KrJbgDzRTgLq0B6Xxn/aGM/7DRXEMxEspgrcgP1s6IZHZUXWRv1mqk
 VTaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCvQnz3K9NI06a/sbxdMX1dvzqVoPM0+P1NncxUqGjtikf5A7/wVgYUKQZz34rcuhPSyUgUI8FduU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT7CW8giE83dm8yLjMXkovxaxAzEg8bpCpfA2DwucaeXlZPk4r
 djpQbdZFCUUtJUEt3MTuzVO35u4JFnLaYDTW3xwSmfYGOCjy5M5BAeqhG3O+bwN7gYlITPezOSk
 CCYOqnfwiTjUCsiZJn8paB166HGDkGPShh5uEw++DKbHzXMaC9i+rVSmFzTNWHyiqOn1OBUY=
X-Gm-Gg: AZuq6aK5NR/idiEiB2tNXPi098Kdy+5TCo01nbQqnJVKbnP1gDRQlUIdpf7fLKrqnA/
 ivic/QFCi5M109EQWoTjmHn4vmWrww8P9K683v96IDD9D7rH6VW1h/Nrs4XYuHeqjDOu80FlwoF
 54pI+K0Rjm9KeTvqFbL+yFlEj33vSj011XHy7a9uOV/fOoJ27k39HYf3mgQ2y7Y1byC41PWe1S3
 OWpEEr2eAQ7uYlUp7BENf3j4jsbNAx9cFNPnHBaQFf/3DLJIkpmJBI/uQIOykg12CiTWeW/nRaf
 pEVWBMCRYxoRfoRnJvH3bhpQI+0QhCgXyFpASYyYKljMFYkuIcE5DQNj8TeQOZNjG/q028jL+AH
 MVRKc4TqDROHSzQzHC3RD6weDYWB4jP2O13R+avfIT+LlAiWX07D8NhlwyJuaqQJNiPhunADKAI
 XJYmgx38e1dscPQzCIbwaheYI=
X-Received: by 2002:a05:6102:3913:b0:5f1:c519:9506 with SMTP id
 ada2fe7eead31-5f8e24e5ca1mr585374137.17.1769747577928; 
 Thu, 29 Jan 2026 20:32:57 -0800 (PST)
X-Received: by 2002:a05:6102:3913:b0:5f1:c519:9506 with SMTP id
 ada2fe7eead31-5f8e24e5ca1mr585364137.17.1769747577388; 
 Thu, 29 Jan 2026 20:32:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e074887fasm1520782e87.29.2026.01.29.20.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 20:32:56 -0800 (PST)
Date: Fri, 30 Jan 2026 06:32:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v7] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <4rfalipp5xyejwappzi5gny4muetuzrr2q3sunctfmsvb4juwf@64kdxjrakr5q>
References: <20260129233703.407404-1-xjdeng@buaa.edu.cn>
 <ie3hipmp5nqappyuwnxm2kpgscnl6qe42cwf2sep4inwunb5th@gontu4foua6q>
 <CAK+ZN9oaUh5PPBx5QPCya=hqDM42CQptD2-MrJvMZsypNuZ66A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK+ZN9oaUh5PPBx5QPCya=hqDM42CQptD2-MrJvMZsypNuZ66A@mail.gmail.com>
X-Proofpoint-ORIG-GUID: cQuD7L6m2S1s5sqqbfg_mGNMprW9t7a_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAzNCBTYWx0ZWRfX6HaB8Zihnu0A
 vk+RHePwiuIIKW0BJ1BDtfAmUhf28XCXcR6emGaPRjMsOgMBph24PdrJ7mqo2srTTpDzoFqVI/+
 vQSD0AzdyAhR5aA++LPsdmN3WCETVfiIdTCAI/kPP+6Y6dHGPWqK5Ru9lSI85A5q8s9L4+k3wte
 F3bbhuc0vSszXpJ2PTfsfbp3JFBtrX4oKc5GmrwHRWzgPy5BM/5MmHJyoSNv/zr6BYx9rWzoDgL
 ZupiLMjQ1YigqEWw3+6UOr4czzEkouj1B2dJiW9fqC8LknACkBpCo1jJjfaeRxv57kxMD1lKO09
 u9uJM65BB60/CyDdQ7KHtQUqIOawHfqUXoc2oqK4ilFcMaq1dcZeFRQRBJuQvIsv+8A2P5Li0zl
 Po1DtVtCyo56gdlezXSgJBFOKijK+bRqAkD2zdOc6JNqrJ34W2sTfB79TzzrLW7aUI0rAImF3AA
 iPRQS9D+3hy/gsy3J3Q==
X-Authority-Analysis: v=2.4 cv=RIu+3oi+ c=1 sm=1 tr=0 ts=697c347c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cnsEfNzNr8A5FoBqwUkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: cQuD7L6m2S1s5sqqbfg_mGNMprW9t7a_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300034
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:micro6947@gmail.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xjdeng@buaa.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,buaa.edu.cn:email]
X-Rspamd-Queue-Id: 0C243B71A3
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 11:07:38AM +0800, Xingjing Deng wrote:
> Yes, I found that.
> I will release patch v8.

You have been notified once already. Please stop top-posting (aka
responding at the top of the message).

> 
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月30日周五 10:38写道：
> >
> > On Fri, Jan 30, 2026 at 07:37:03AM +0800, Xingjing Deng wrote:
> > > In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> > > reserved memory to the configured VMIDs, but its return value was not checked.
> > >
> > > Fail the probe if the SCM call fails to avoid continuing with an
> > > unexpected/incorrect memory permission configuration.
> > >
> > > This issue was found by an in-house analysis workflow that extracts AST-based
> > > information and runs static checks, with LLM assistance for triage, and was
> > > confirmed by manual code review.
> > > No hardware testing was performed.
> > >
> > > Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
> > > Cc: stable@vger.kernel.org # 6.11-rc1
> > > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> > > ---
> > > v7:
> > > - Add the detail description of how the tool detect.
> > > - Link to v6: https://lore.kernel.org/linux-arm-msm/20260128033454.2614886-1-xjdeng@buaa.edu.cn/
> > >
> > > v6:
> > > - Add description of the detection tool.
> > > - Link to v5: https://lore.kernel.org/linux-arm-msm/20260117140351.875511-1-xjdeng@buaa.edu.cn/T/#u
> > >
> > > v5:
> > > - Squash the functional change and indentation fix into a single patch.
> > > - Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statute-showy-2c3f@gregkh/T/#t
> > >
> > > v4:
> > > - Format the indentation
> > > - Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t
> > >
> > > v3:
> > > - Add missing linux-kernel@vger.kernel.org to cc list.
> > > - Standarlize changelog placement/format.
> > > - Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> > >
> > > v2:
> > > - Add Fixes: and Cc: stable tags.
> > > - Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u
> > > ---
> > >  drivers/misc/fastrpc.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index ee652ef01534..8bac2216cb20 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -2337,8 +2337,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> > >               if (!err) {
> > >                       src_perms = BIT(QCOM_SCM_VMID_HLOS);
> > >
> > > -                     qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> > > +                     err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> > >                                   data->vmperms, data->vmcount);
> > > +                     if (err) {
> > > +                             goto err_free_data;
> > > +                     }
> >
> > I think, checkpatch should warn here about unnecessary braces.
> >
> > >               }
> > >
> > >       }
> > > --
> > > 2.25.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
