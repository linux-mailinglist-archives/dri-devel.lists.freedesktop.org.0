Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MWtGhPZqWl5GAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 20:27:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20783217851
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 20:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6516910E128;
	Thu,  5 Mar 2026 19:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5oAXuPg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOOb8KdV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EF510EC6A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 19:27:11 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625JQrlW1164659
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 19:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7GcmI8XP+y5dIBbSvMUZVV20
 6VKQWxQYIDZ2fcds9Jk=; b=G5oAXuPgtZtoZWGleGOCvOF7vbp0JsFrJf15qRjX
 s3lookP3BglqXSbrN3zMgVD5DcrnH9QkROI6b4Tsm1TY2B+0qtIX8Ow14rTj62Ca
 qoXaGeep1myugXJuHVy6fztHQ6ryrge9XqylGPddkiH6l2XTwj1ZjdxoMumlAAh5
 PIGGN42tLkCPeZbcKS0T4q0Ce4v9s2OpjC0tSNmFWYgGMptMgmQRfz1NuP4zRwhE
 sI7zOxmCMm3CY1pRXK5leWRzEHnKhzcBgqduCL7+3iyg9C42EMClU5j4TEBCty3B
 rVYsjp9WGzpaYhQ4AywVun/IvvRaL19dv+cFyq1HJoB1lQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09r029-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 19:27:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-50340e2b4dfso148476751cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 11:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772738830; x=1773343630;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7GcmI8XP+y5dIBbSvMUZVV206VKQWxQYIDZ2fcds9Jk=;
 b=HOOb8KdVoxqaapV06BAVTjwajo8SjFWmXg10SHUOhuIJYbt/2NmPVcLetrkQeeSKe4
 BdKxqTW5bvCmxPgBccjPRZpOZizNuqzapW3eeM+Y5KQL4CCjzprgreLk9sw0x/0WHIZb
 Gir1VxR3/KXNPitQeF3sfDG6YLd5zD6I9iewt7aJmgZvqFZU2koUhptj9Sz2U+KMylZw
 hM1SS8Ke0LkQz7tJSZwmG4lEBYB/K9IaktHaNLmxv+GUv1YUmhfXaOYG8mSjOhL5QNLD
 itkNp/WEwpmjmes1lojTbTLVIscUML2Ii2M8FJ0+380m89N4GFV0/AY8c7gS+nddkGZB
 Ncng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772738830; x=1773343630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7GcmI8XP+y5dIBbSvMUZVV206VKQWxQYIDZ2fcds9Jk=;
 b=e0eKXiC24j1kgksDpcp3JKKSo5ACvd+Oyclg/O7Xe6XZgf73qWNaYSpTaRFGOU1Kfc
 2Pi5xdeJGXtfBbf1el2QAOsmbwxdPNnylo6CH76++jfaBjdeNB06pWrUk4Q7LFIqrhVM
 sBq0s9of6vzOK7OavxGnlo9z/INQbjWsvxY0OtCI2swbcX1Po9TvVvYPQn9XJXQrM+DG
 fP+qvjyrlEaGueWCnYaMxEn2OhjsnBN654t2gMvFwwPk7woM48fAMEq7cGOxu1p05Qzx
 IXsu+jdjcb3/IKe52iQcohUrTCLR/GMfJYxNVKSU54gYpjSmKvJkzYWQD4H88GR1vgsV
 EUPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr6NKKpomlMy3DxRah7BHdScw4SdVikJtqGNkpINJ6Kq29Jo/Ni3qf+1SQvNUkupkQLpyGivLtRYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLgXGOJxFGGLfXwY4Yon25Y+CW0J1BLIFkP7P1FT2SOQcnLwsq
 CmGXpdWuxHT1kow29njDEBRKNXGgG6QpujX11PPq8b78ESyYwue79EGYvLZTjtB+dSfl31ITgGp
 zNg1iVT3kKCWboHdVg/5Kq9EjmCbRIhLJmd+/CQVH0sCOlRxENSpuOGSyHoaUxMF+FqSZ4wo=
X-Gm-Gg: ATEYQzyX3BZZUTZml1zdVPHxmGNwxoE8koiBBHUlqVKdMgZkT3YDyca3/GqsuTrqrtU
 Fjy6H3uAxyihiMzZgzkfb9jW2rjNoeYL8vxkihzf1XzCn/5L2Hgy+FbLxfEGvEBQ4YDrxxz8kcs
 UmUlvQ2WvbARdVPETqJgxhMUqH54bPWnvYIVnnar+mPwZ5Cbyo2WbW7fPCj8m0nOB9UsZtWEQR5
 MPcz4kXwJsixuoXOYgzFlCjt5cLTBOc1xofrrB54pVqcKVxQ1nqY5dYjSLRkRDDTLVo9YE1NPbL
 9BMIeNFYrlbIMBnukIlkLIb7jvnibRsxFMlJPD88WnTtujRd4vE8RMCDOxIDcIF7sQOq55dSqJg
 zcXPzJufVBp8omoiV8E1Q/419DV2BQhFZk1SLtGZEq7u2zOFQnE5wG4eEzaypK1nE2bPIrpycAr
 WGvLeZJOAwycH8r6uI2YDOT5rDcbzViX6IDJU=
X-Received: by 2002:a05:620a:199c:b0:8c7:132f:ba95 with SMTP id
 af79cd13be357-8cd5afcce1bmr899952085a.81.1772738830100; 
 Thu, 05 Mar 2026 11:27:10 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:8c7:132f:ba95 with SMTP id
 af79cd13be357-8cd5afcce1bmr899947085a.81.1772738829518; 
 Thu, 05 Mar 2026 11:27:09 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a123586c0fsm2162212e87.9.2026.03.05.11.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 11:27:08 -0800 (PST)
Date: Thu, 5 Mar 2026 21:27:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a8xx: Fix ubwc config related to swizzling
Message-ID: <5lh444wqr7uo4wdjg3ffon2jlupye3l7h32tdescicj5nnpi33@rh6colauigkt>
References: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: J7PdXs7FZKH3xpRETlqgEq0OePS6c45_
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69a9d90f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=sCGn9XAE_lF3poFM8OEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: J7PdXs7FZKH3xpRETlqgEq0OePS6c45_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2MiBTYWx0ZWRfX1OVr4hiBdzjo
 52jQQWL1Emh37bTuDjMQ988tYDr+c2QZnCM190AIohLnRv3PPWN1Zg6NJFSxgdKIKLIKzGWuafj
 iP0qNJ3NqLsv+yB64lm4cSI7p1Kxu1ZP/YVYTBnvcXGCqZQsrsPKLHvIQrZJnTwMiDE6Db/3kQp
 61OfJUUPo08fi4bK/mfDhh/5ySH2/JHuguL8GBlCXBdinu5oM/LdBRbM8zqf5gcd/z74nqSVNfS
 n8ok1J2igq85mlW1h6OqF5em2H/phKNLpZ7WUdKvEZ2GdjlPy+2yqyPHRgq+GDWndApJAbghuoC
 wQxg7uu/EA+gyjvgDz1IJ89fYeAzfjR2wXU/bDAnQfsBkYImdglLM9nvh0eFJUOjnBixrTlVVyP
 aO9hiKlJNBUCK181o3qXOEoXbJ+Y4Bid8Ta4j6ph94K+dN2RR3pj0vYmwmsLyRVZoZs5U2kguPv
 vn+Hz4pepJaWuODNqIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050162
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
X-Rspamd-Queue-Id: 20783217851
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 11:51:16PM +0530, Akhil P Oommen wrote:
> To disable l2/l3 swizzling in A8x, set the respective bits in both
> GRAS_NC_MODE_CNTL and RB_CCU_NC_MODE_CNTL registers. This is required
> for Glymur where it is recommended to keep l2/l3 swizzling disabled.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
