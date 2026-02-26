Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ5PM6K8n2ktdgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 04:23:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFE61A07B1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 04:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F6510E860;
	Thu, 26 Feb 2026 03:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8gUm51b";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFfhggyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9D910E860
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 03:23:10 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PKfW1R2523596
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 03:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=l809sJe2X5L8/bMHsjXk4sQu
 NcfnBFCceD/9FzjoPc4=; b=Q8gUm51bERcU9xNKfoJGPZe5rNnXFUc4c4pacPya
 9rTvTdNIL4p7sCG/2IAPJAQtilLVvZm3w9kY7imBZr3qI86KhBvGVVirMm2+wkZ8
 LwjHUYE5iv2MheQV9WwsYCf+ks9VVg7Eolndow6Rhlyz5GvXRKUlEl9MfyB+HNW1
 6MIziYL5CxyLXLpwIs5jquvooiwpiQxO5xcktCAyAlAoouiXUtIEc9ru/2ssryJw
 XM/Zgu8vqTL71jogVdE9xFKFQN7ax4lHc2DJdbHl/PDzw0I7jPW/ZRisiEAG0tT4
 P8j4pW8H5VCmgyjWZkaM1OEj02EBn4sCvxc5w4WBfsHFAQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj8bd8vh3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 03:23:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb390a0c4eso360025485a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772076189; x=1772680989;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l809sJe2X5L8/bMHsjXk4sQuNcfnBFCceD/9FzjoPc4=;
 b=bFfhggyzGR9ijHQAkMi2UpBR2TbP/XBr41B5j72X+ubKy5nUvtR6A07veRT3mG3LzA
 IpF8CTTC84k0964xLGddWWQOPk4pO4/nujQuIhOy3cfuTw/Nj9Y1MNrsJ2l5xC2oxeIa
 5OQ3TfxsgdwHlK9g2J7OnCQ0y4eZuDjhDnFOhSFPMofCuSN1ppYquFAq8ViT8KuhxAvJ
 a83/asEMRziLM6/rR1vnHGDBHlpi0o2D2TfK7+xa4HIs37IXN2D3MlDzLlvqcdLAgO/x
 ClZdrOE05tzywL53DHLHEmQ1j+lO+HjvQa6ru9djlEj0RdXpTV6TLcPU2kD4Rn3YOBIv
 4RYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772076189; x=1772680989;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l809sJe2X5L8/bMHsjXk4sQuNcfnBFCceD/9FzjoPc4=;
 b=OagkCj6dXWWChmYjK8cYyWZ07Mjqi2zAKmk0hmW7etHDBPdsd43xNx7MfUnS0Z2In8
 oZNgZwgiX157vc5bxFZe/v3NczuwzBymhMeHAeFbdZRFQLazyAzRSChBUV/l5wxhIX+9
 jA1XqqXSEC/9/uUd6uiDs0ZX2Pbp6rFKFVHRH8qpf4l3CZqRutAZCNcDrJvlz3NVE7bW
 0m7ZoxmaZhmeV+umRtFL4IEcYVhNJcpA9BH0GKZu+juGSnHxcER8+8L3QFPW5g4HzYBv
 FTEMDCKYVB+drvTEuPVAcQH92N781BLvQk4OgzszoB7ZQi7BWbCXNEpXdpaLCbRI7K7t
 meew==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1sIf59bRriKmHW83A9n6mbF879zFKsAd+jtA89GwqcvXr9Z4WwE0K+BiANW5sLYCgSuOXncu3C94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8oyakkbYG8eJqIzQ+CSs+WyHr7RiyvDWkwSruDZLYUSfdtmFP
 ewIJfAU/Y9JI53sO0ObpRO/hbbKdQlZCrPmGcsowSNSNxLjFYG1Vg+VtFFufloKd3J/xsHR8k3I
 IJp00zdWiXN+Awcdsa5yC0qZxUzbaa9ogBTymeTUPS1g1W9jqU3vTEQeENw3tTULBTNPd/JU=
X-Gm-Gg: ATEYQzxEBS1q2dgxArRXpCArN35mmYoht1bPfMV3SH4JE0pWFgLgCZulfMw6TY9tlUs
 FxvDd16OO+FY8og8L4CevGki7Fs5TiugBFwIBDgoDfksS3TKUWKkPNO7rxauB8mtAdmkg5CLIjt
 tffU/05/uwfW+MVAPSIddb2UXbeE8SYKpWVUXNPGwVBxz+GVuGe8q1D8SmA9Et+ZFBCiAPCSTXG
 Z29MbXsqMjdxo29MbffXcWWswNuuOTdwvVKFtw91cnhgJstgHrH2fA7fh2zmdgqXMOanEOmsnd9
 z6VbbocKkurJLtewvpZWJ5CvQ14mVvIk6OGj98WLVhNoirhwQTteFSUUm5E0kMqlcawRJC8CN0b
 bvBP1D6WfNgeeDJhSsZ2b6tx2OVexh4wja1Fq/Y8xV7QWM3EWzcgCPzQvsgQk4hdK/toDUGzfRM
 vTIaKyirVjIIJ5bZ8MBHBCc0MrG8O+sc+O7Yw=
X-Received: by 2002:a05:620a:29d3:b0:8bb:ac44:bd3c with SMTP id
 af79cd13be357-8cbbd00ceadmr388231885a.52.1772076189418; 
 Wed, 25 Feb 2026 19:23:09 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8bb:ac44:bd3c with SMTP id
 af79cd13be357-8cbbd00ceadmr388229985a.52.1772076188996; 
 Wed, 25 Feb 2026 19:23:08 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a109de960esm259514e87.75.2026.02.25.19.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 19:23:08 -0800 (PST)
Date: Thu, 26 Feb 2026 05:23:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
Message-ID: <omcgpkrspwf2hcjymclxo7asvvydotnlg3ijhmcycs35n43ee7@jw2bzwv36xht>
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
 <5fc6f252-a161-4deb-b88c-da7729f5a8f7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fc6f252-a161-4deb-b88c-da7729f5a8f7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FKQWBuos c=1 sm=1 tr=0 ts=699fbc9e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RtnwlOK4scfKGIiRCQ8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: v0eMxR5YVQcAoVagIBYVe3Fl5HgaKAZ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyNyBTYWx0ZWRfX5jXTUeVeraYs
 jiUslrjgR9piAJ7MPCyZK13Tf2FYTniMD0AA+7ujTDMxe09FUMGneSeBUVeboQOjUdMy1hOkKC4
 M3xjLF2yoPVUkEQlDqP0AYxZfXfHrccRzusoe8bg7dotp+AkBvpFTo1djcxrfSRs6LO/yFbmeXr
 jeUDctK2B6cbOlMEj0J+46PGr+MY4R7JGp1Dz5xG4RTDvWTuLPdVhkJsvQCYUtnURLAzxYmt5qh
 Cu9Uen2TlWB0NMyuaazibnWIm60+z2HT8/kznEtDF45xwLl6dYfSS4YPfJbKp9Fp7hzwi3TY2oH
 SgWYolrlqHBnr8pdfeKWA0UuBypUdkroTWoPFcs4nLceRanKtdVbt2l43HHbs7P4KB9vQGCuejG
 vx9I2L5EsyycbbEBBbJladeZKut/YOxCLO3pdZqSfR1HYS63hds6Q375jR3tZ1J2LbN2mwMZzJ3
 GU6GnYsWRBysJO7Rzbw==
X-Proofpoint-ORIG-GUID: v0eMxR5YVQcAoVagIBYVe3Fl5HgaKAZ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260027
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mahadevan.p@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 7FFE61A07B1
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 02:58:49PM +0530, Mahadevan P wrote:
> 
> 
> On 2/23/2026 2:02 AM, Dmitry Baryshkov wrote:
> > On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> > > On targets with multiple display subsystems, such as SA8775P, the GPU
> > > binds to the first display subsystem that probes. This implicit binding
> > > prevents subsequent display subsystems from probing successfully,
> > > breaking multi-display support.
> > > 
> > > Enable separate_gpu_kms by default to decouple GPU and display subsystem
> > > probing. This allows each display subsystem to initialize independently,
> > > ensuring that all display subsystems are probed.
> > > 
> > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > ---
> > > Depends on:
> 	[1]
> > > 	https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> 	[2]
> > > 	https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/
> > 
> > What exactly depends on this patchset?
> The dependency is as follows:
> As we separate out module loading of adreno and mdss with separate_gpu_kms=1
> autoloading of msm.ko fails. With change [1] on bootup, msm.ko is loaded and
> gpu card is created.
> 
> The main reason to bring this patch here in upstream is for enabling of dual
> dpu configuration in Lemans hence added [2] as dependency.

None of that describes why they are dependencies (i.e. must be applied
_before_ this patch, which otherwise will be broken).

> 
> > 
> > > ---
> > >   drivers/gpu/drm/msm/msm_drv.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > index ed2a61c66ac9..65119fb3dfa2 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -54,7 +54,7 @@ static bool modeset = true;
> > >   MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
> > >   module_param(modeset, bool, 0600);
> > > -static bool separate_gpu_kms;
> > > +static bool separate_gpu_kms = true;
> > >   MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
> > >   module_param(separate_gpu_kms, bool, 0400);
> > 
> > The patch LGTM, but I'd prefer to get confirmation from Rob.
> > 
> > BTW: have you tested it with X11? Are you still getting accelerated GPU?
> 
> Yes, tested today with X11 app(xterm), GPU rendering is used.
> > 
> 
> Thanks,
> Mahadevan

-- 
With best wishes
Dmitry
