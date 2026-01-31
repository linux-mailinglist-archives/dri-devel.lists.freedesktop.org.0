Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JDCCV+9fWnmTQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 09:29:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC19BC13FB
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 09:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C591910E159;
	Sat, 31 Jan 2026 08:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="StpbvoES";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUftEZIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B7E89358
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 08:29:14 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60V4dJKJ1941165
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 08:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZITwdl9I10OiomQXEmP80yCl
 NexlI/AvP0dRW5FYPdg=; b=StpbvoES2qaMAgvDikkVsrVr4wgdbRinu/yuYXzM
 7loqLLTvdnFNtHVYHrCKuhg3wzp7Gxex1ynKacv1v+kADCvt3mAajJQQ2SyUPdzD
 CvTMMZa5ESOi+FRWRPAIrhCWHU/oT1e77LQagIjj/pok+R7Tr444CsePBE52Kqxg
 HDwsaLnGDYE6xfCuQ4NUX0pxEQK7eObJS9ZDE6FAuNIEl77Sl3O+yP5lSU68kZjG
 ZOddf1pne7u+0+nz7yxpotL8gbmwZoPCH3u2Fl8X+lZ7MQnL0Vl8yXVYDoLkxpzx
 uAcHFBSmui7q+Sye31dCCXh4j6PWn7vsLOwGhHaVPqBO2g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awd8f1b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 08:29:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-503342386c7so83978681cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 00:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769848153; x=1770452953;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZITwdl9I10OiomQXEmP80yClNexlI/AvP0dRW5FYPdg=;
 b=cUftEZIcdqXibs87uzxqojBPzu18QkUKiObTIA5TiRQakdQ4LOOysJ+caFSDBXDzvU
 gw/GTWyTqexojbtvfRclIZg6Yej3GvcfBIOZ7L583zr0aeqARXOCeM2k6Drls0bIN8hQ
 kxP41y2kVO92fWfoBtM1EQ9e1RNAJ8qdqn8e2FNPe0FY9CWSm2UFkstqVKlF/sHUZKHA
 VU6L+aqxZ2xLblI+2HhlCQthHObt/BioeP28OVXZU4KIue2W1fUwYEY9Y/ReYw0cmLf6
 pQHd3/EnpctJ8OrwE7L8I9D+t10J9TaPSBK9/lxYOWiXaHoISfk/Wd7x0BY9VIaYbH9q
 w3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769848153; x=1770452953;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZITwdl9I10OiomQXEmP80yClNexlI/AvP0dRW5FYPdg=;
 b=GIbfy1a1ben49HCCZumq9gtTxu/vEsWyhMqpl7mhep2TQ6NYS/p+pMXyr2tfh+yAy7
 MzBfGaAftHZ+NbKO8jhtL8tRw6zW2sVmCjnXOc0t970rEReV8DMzhuAO5N+hWemdo/+b
 DajM3aT11ZafoPON23t0/xf5gXhTlDHsHS285WuTcg/HJcHVf95YV7/YTJoRFo/YkXAj
 /IHEhYU6DVStdFDRVZ74GRxzo6uPom3uX0n6Nbv4RsOz0qD/3qQya6LNyXAmwgJxhKRI
 j/HTid8Q84c5fl6xlk5MPQ0v6wNWN5h62+t4R2gYp5LNgArUuQEBiBwJpJq3a2Ut9RYl
 o50A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN057+6OCd5SDtlq6w6izV5bkCsWn+eDPqiVRkpSDiNBqRfPd4BUm9NQE/80bP45up/ttmasDylRo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyqeetn1UtGY3BA7l9HwbDtjI8qMXajIOgnxjv3R1koK7+stH0r
 vNGntOlB6qpk365VVj4rhNqN2n1b1T0OANsD0XDCmJYCpYngXcZIoNrfjx+Cw/oo/Jk/ZAP5gsX
 qM8xb2S/jDLgFFE+Pcs/Y6g5aWGco9+5DppSMGMhKv89af5eezY8CLG/MNAqQQfDtS1VPdo8=
X-Gm-Gg: AZuq6aLvKs+flMd2Qv6qvXyWemjTzSlAHJa5UJgKxlty5axNM4+VrDfGjpMaEeMdZyb
 GUdFw6Q0HDe9yakTkD86lHcHxPyZQaRLDEhJAR2X47MHIh7zry57r3j+P79WyFBq89/579G3l64
 ECK6ANArmTMCPZfn8ya7OW4GrSwuwQpfC4g11hNM75u1yAKQPEQ6SRvSvzk1z59ulFWQg8oQP1U
 x1jBmsSwDH4lHYaBXiVLCwKwkwUZUXMVkXlgbxeDPX+mwKR9G39jvXrnwqcosLdVxMrH4AcBL7W
 U4zcVAF4s9zX6th7KAT8kI54HjOA7D/UxaVuvdBTmFglm0M2Gr40d4UWDbAbuFatVydYeQL+pB6
 PvPgRPYIaasFYF/ehzFuFrey09VOn8NxZk3ab3veqope8flDuWDnSPKTRfQMhG2ViYomZ+lm7I6
 P80DBW8iEJmORmddkJ6UL+fpY=
X-Received: by 2002:a05:620a:290f:b0:8c9:ea1c:f216 with SMTP id
 af79cd13be357-8c9eb216411mr644980185a.14.1769848152895; 
 Sat, 31 Jan 2026 00:29:12 -0800 (PST)
X-Received: by 2002:a05:620a:290f:b0:8c9:ea1c:f216 with SMTP id
 af79cd13be357-8c9eb216411mr644978485a.14.1769848152398; 
 Sat, 31 Jan 2026 00:29:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38625fce627sm17225751fa.48.2026.01.31.00.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jan 2026 00:29:11 -0800 (PST)
Date: Sat, 31 Jan 2026 10:29:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sunliming <sunliming@linux.dev>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, airlied@gmail.com, simona@ffwll.ch, sean@poorly.run,
 marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sunliming <sunliming@kylinos.cn>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <wcbaoiswckhbm4rzbu26ueccdh4jzahc5sictyuqrxfknc5ge7@va2gbq2jiyes>
References: <20260129024919.30449-1-sunliming@linux.dev>
 <aXsHSTHHP0eyI-Pk@stanley.mountain>
 <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
X-Proofpoint-GUID: lr5eCrgD0wvtg0EDZNK8SAw8ltmTjqxe
X-Proofpoint-ORIG-GUID: lr5eCrgD0wvtg0EDZNK8SAw8ltmTjqxe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2OSBTYWx0ZWRfX1B2s+rSujWbU
 Vueb4GEiiOtxekmSYsgWyODEQSS2Qlc4ZW/KrqrVn9Kknt1/SXCSQshmPVbSG8nZXsdWGQ2j+WY
 NwFpQIORKre6ZvAwu6UCr0KHi/prMrZMbgL/bM8h9ltA7rkf5Ue8DYFWFQ1MMVLTF719LHog6Vs
 R0/kddH7yzFQcMyffTWrfrj+ENe99ZFacZiuRnDPenCBbk2V/igWYNHCtW8vdymt63DDi2s71UJ
 GG6A9kfjOoGtd9xZ6/c99ZeprHn5Z71VsXPgPlhrnmmOuToDjwBCnUlpOKwxAoCtorrZEGrL22X
 LNhQI+ZdL0fV19UPgWS4iCSZTKokq+rK1wcu/7OPPQuKr7d9Mi+p31h7ZOaHUJdpIyn5Z1JReSB
 L3r5buFhoIBeoeA9S9pynBDZM22qdSVqu/1MJn/uwwC4vAFTrsThCNc46IH47utHygolrZjNRw4
 4ytGW4aNllHuTfK/PBA==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=697dbd59 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=5dRrolKJAAAA:8 a=pGLkceISAAAA:8
 a=wQcbvNaIYhuNGspu8dQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=y3-2bcJ53AEkEa81XYCb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310069
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
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:sunliming@linux.dev,m:dan.carpenter@linaro.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:sunliming@kylinos.cn,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,intel.com:email,kylinos.cn:email,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: CC19BC13FB
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:30:35PM +0800, sunliming wrote:
> 
> On 2026/1/29 15:07, Dan Carpenter wrote:
> > On Thu, Jan 29, 2026 at 10:49:19AM +0800,sunliming@linux.dev  wrote:
> > > From: sunliming<sunliming@kylinos.cn>
> > > 
> > > Fix below smatch warnings:
> > > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> > > warn: variable dereferenced before check 'ctx' (see line 159)
> > > 
> > > Reported-by: kernel test robot<lkp@intel.com>
> > > Reported-by: Dan Carpenter<error27@gmail.com>
> > > Closes:https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> > > Signed-off-by: sunliming<sunliming@kylinos.cn>
> > > ---
> 
> Previously, a maintainer suggested that the name should match the email
> address,
> 
> but community patches have consistently used the name "sunliming" since
> then.

There are several possible options here, but I see that this one have
been already used to contribute patches, which are accepted. I'm fine
with accepting this SoB.

> 
> > > Could you capitalize your name?  It's supposed to be a bit formal like
> > > signing a legal document.
> > > 
> > > This isn't a RESEND, it's a v2.  A RESEND means we accidentally ignored
> > > your email so now you have to send the exact same email again.
> > > 
> > > https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
> Get it. thanks.
> > > regards,
> > > dan carpenter
> > > 

-- 
With best wishes
Dmitry
