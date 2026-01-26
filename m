Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yERbGjy7d2lGkgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:06:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ABD8C54D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55ABC10E477;
	Mon, 26 Jan 2026 19:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNgabcq6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="if7fUs8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F217010E472
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:06:31 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60QIBHjc762743
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K5Q/4zJ0owH3B9S+STbgEe6iJzJedmnk8hr33vBbkos=; b=BNgabcq6SW2ytwfo
 4uTgF7dvX05saxO/C7YR+sA3rimUP/8WizBD7V1nrMJmPr7s+Jdx4jN/8IDKi5pr
 bujtO0yQ0jjkGnfCAPPRsBIO0ujzOp1LUKIaPKkvWq/52pQsV97GV27BAhpPUjm4
 iVg57RuM6u3SQ46WBqbDUNdIr1qDTR4nbMVdAXtPkISQepps5TCrls3DblZ5Bbm5
 QnGhUZPPM+O2tNhbxjyptgkNxyekw3eQ6MOXJgcfVRox4zbYwtSc21oJ2+92iBk+
 EV+LeZc+slStHTDNlk8oCfsR60P1RgF77NpJwXYXJaVkN85+etyfR3m4wffJ0EGZ
 ShO7tQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f5m9k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:06:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5f52597aca4so5404914137.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 11:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769454390; x=1770059190;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K5Q/4zJ0owH3B9S+STbgEe6iJzJedmnk8hr33vBbkos=;
 b=if7fUs8BnQqB3Fcu4N0Xf7SRmXarXJnuQRj9LwEw/Qw63KAvwCOMJ9psovK2/eAjee
 5/0WOAonDlg4DH1YMCDKAexR7MMtEClKePjvpBdZxdiYrkuZthZk8QC3vrDNLD3dTw6y
 0Loehh5tCn8hsyBC1SZmyFp68iemzO/v27oEgWKYbCdBzlrTHvBwvlB0hXTYj8FezECy
 20OCzbuGDab1N9VCNNJIX4XchXUW6Mm2Dt/KRkhhOf80GvI3RQvMyrHvk+ZNvXjUWjeM
 yQLmw9mobgDL3fOpe0ekjDm8XrT4w0xn2tZsgMCbIiNSPNrJBA+QKr3Mph3a+LA5yBeY
 DmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769454390; x=1770059190;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K5Q/4zJ0owH3B9S+STbgEe6iJzJedmnk8hr33vBbkos=;
 b=wccsCsPurmsISuZ+RgDTRFUKrbqf+KjEEyCCS5wiRUnmvLhm1HBpgRXg5DrxkdEONW
 yW5yqaAx5SKTThH/e0HQoabrM9TsGmjmmm2d9Xgyz9tM0G8XP7+Gxq/20zZ+MpH+NnlY
 puAajkEkzZJpLcGMjSdPv1SXOlla+mlpM8ttmUAUEMjAxfjxfCZu2ug9Z4Pg3nbhDpLF
 gQR4EvH/JHRNkp4pso0M1k+qbc5nTQg38E3eBIz5oUFuGvB7Cy7o1YeZh8RgDKMG3Dol
 Hy1mhnbbbHfUjjJvNgM0Cl9botEOpQIy4ES8QMPGttUSXwvCpKItLpiVHZZkMSbsZDTU
 7SFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwo1nrNxK2fjEHNuIrlRyhfKbYKWSU8nG3ZkWnYJaXWYiPNaFEhF7yyfGnILof7vsUmyxgDA4xI/o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMe0GwU+pvmOna+uD2KflFYOWZqXImqobElpy3K1jfDGbe25cO
 Fpiut9WlderVBGzfoqNBcPK0ONZIbFbgY87KuQOcFKNSitRgY1xqfPtbJ4tX/yH60I5eMo4aO+T
 0szpaK8vNqJipcP8lRcBp9te+a9bbbKC7y1sf0VQ1GaR7iHack1El3C/6qHJqnQrmIHghGksgUP
 fxzZk=
X-Gm-Gg: AZuq6aJ0Kmdp/ymNb5VBYRa8i9V3ZIWZ0gUmAZ8vWeVFCO23NO1DVYNUOIpHcoFQ1XZ
 BNEHOm0mUarLyTDXyrlyKSPnFcKNe8SOrAldD59cOt4XMY8zfb48yoef4uJdxU1Wm/bnKZwNx4t
 aLv6nhTmSnMZlbruuLNHVaYUz1f4SLj6E4HBMDrhd/szy9N7UzzJMObxtrgRFHuZVlDOTI/ARSc
 d59XSRW4oWEUIk+QvT5enZO2H+5h8xEg/SEul+uJAlrwYU/vuPXdEQ/AkgnTBt3CLfOSNUQDcHG
 YzjoubeyM8GfVRaVW8aQapipb/dGnuJcP31wtdBuk97tpnmNIlvqR7JsCjUrOvtKPMCxx2ArH5+
 Tj/Y+58UmAM8m1F1WvOEObhcua8Pprty7zDMcOA5ZX6pQ1+QEwReGdl4B62IFSO/U4KPY2dYHVl
 KY5ILAbYCc1o3U3AQADx6d7Lc=
X-Received: by 2002:a05:6102:d86:b0:5f5:3c38:c4bc with SMTP id
 ada2fe7eead31-5f72379c561mr45483137.23.1769454389109; 
 Mon, 26 Jan 2026 11:06:29 -0800 (PST)
X-Received: by 2002:a05:6102:d86:b0:5f5:3c38:c4bc with SMTP id
 ada2fe7eead31-5f72379c561mr45465137.23.1769454388494; 
 Mon, 26 Jan 2026 11:06:28 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de48df5b3sm2898858e87.6.2026.01.26.11.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 11:06:27 -0800 (PST)
Date: Mon, 26 Jan 2026 21:06:25 +0200
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
Message-ID: <g2kzzrfmcsmzs6wz7alzjjycytpuebxwbehkco7yimdg2jam5a@uqsrt7mov7la>
References: <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
 <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
 <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
 <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
 <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=6977bb37 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=K78EwcQ-zvPrcKlDjY0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: nd-OBFrAiOEIp154kgz8OONzDoL9qrAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE2MyBTYWx0ZWRfXxraLDHSV2Ek4
 gvYW0TELjBj5Ac1YbNd5cNhczy8altSstnMLbJCgLVkbzgAKiJrbm/lPaSiN0d9GWiKhdVaPByC
 gMB3hAk2W0RPx+RxmO/8sqWQj7CsKZfDYoR1FAqs/7UHviq4zfQ5qAxFgkG6zTfNKBKxJOM9JZS
 w7Kvl/fZFmoTUz7Aj0OSj9vMZI3ip/XyFHdGxCclipaN7CLZUrYWkqciQCDd68mwO2gtqgktZfD
 1x4FKEBMl6Ekl6fjSQizcOU+NZW8E/4NHmwK2Y2OLzeTYbasMsUqxblLYfcdGS+29tUPejOFgLL
 pqnLp08/UBS3kO2o0BF469kKOKwVWgK8YlsgXJ/vHmPH9I/TG2pyvsKH2Y5YoDjBiqQmiceWokb
 ONmf1kzm38eeWar5LSCb938jtLbNEp23RsCaD6rXCYdJQOZ6Mad+/qIx7kFdI7rUZthV/ZYPQbl
 QM2gTZMZxRhoWkx+BRg==
X-Proofpoint-ORIG-GUID: nd-OBFrAiOEIp154kgz8OONzDoL9qrAE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260163
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 16ABD8C54D
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 09:29:44PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 20:31写道：
> >
> > On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:49写道：
> > > >
> > > > On 26/01/2026 12:29, Jun Nie wrote:
> > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:13写道：
> > > > >>
> > > > >> On 26/01/2026 12:06, Jun Nie wrote:
> > > > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月22日周四 18:22写道：
> > > > >>>>
> > > > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > > > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
> > > > >>>>>>
> > > > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > > >>>>>>> Currently, plane splitting and SSPP allocation occur during the plane
> > > > >>>>>>> check phase. Defer these operations until dpu_assign_plane_resources()
> > > > >>>>>>> is called from the CRTC side to ensure the topology information from
> > > > >>>>>>> the CRTC check is available.
> > > > >>>>>>
> > > > >>>>>> Why is it important? What is broken otherwise?
> > > > >>>>>
> > > > >>>>> I see. Thanks! Will add below lines in next version.
> > > > >>>>>
> > > > >>>>> By default, the plane check occurs before the CRTC check.
> > > > >>>>> Without topology information from the CRTC, plane splitting
> > > > >>>>> cannot be properly executed. Consequently, the SSPP
> > > > >>>>> engine starts without a valid memory address, which triggers
> > > > >>>>> an IOMMU warning.
> > > > >>>>
> > > > >>>> What is plane splitting? Write commit message for somebody who doesn't
> > > > >>>> exactly know what is going on.
> > > > >>>
> > > > >>> Thanks for the suggestion! Any more revise is needed?
> > > > >>
> > > > >> Sadly enough the text below is not a significant improvement.
> > > > >>
> > > > >>>
> > > > >>> Currently, splitting plane into SSPP rectangles the allocation occur
> > > > >>> during the plane check phase, so that a plane can be supported by
> > > > >>> multiple hardware pipe.
> > > > >>
> > > > >> What does this mean? Without virtual planes in place, there are no
> > > > >> multiple hardware pipes.
> > > > >>
> > > > >>> While pipe topology is decided in CRTC check.
> > > > >>
> > > > >> ?? What does it mean here?
> > > > >>
> > > > >>> By default, the plane check occurs before the CRTC check in DRM
> > > > >>> framework. Without topology information from the CRTC, plane splitting
> > > > >>> cannot be properly executed.
> > > > >>
> > > > >> What does 'properly' mean here? How is it executed? What happens?
> > > > >>
> > > > >>> Consequently, the SSPP engine starts
> > > > >>> without a valid memory address, which triggers IOMMU warning.
> > > > >>
> > > > >> IOMMU faults. There are no "warnings".
> > > > >>
> > > > >>>
> > > > >>> Defer above plane operations until dpu_assign_plane_resources()
> > > > >>> is called from the CRTC side to ensure the topology information from
> > > > >>> the CRTC check is available.
> > > > >>
> > > > >>
> > > > > Thanks for the patience!
> > > > >
> > > > >
> > > > > Currently, splitting plane into SSPP rectangles and allocation occur
> > > > > during the plane check phase. When virtual plane is enabled to support
> > > > > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
> > > > > a plane can be supported by 4 hardware pipes. And pipe number is
> > > >
> > > > number of pipes
> > > >
> > > > > decided in CRTC check per interface number, resolution and hardware
> > > > > feature.
> > > >
> > > > Okay, but IOMMU errors were reported with virtual planes being disabled.
> > > > So how is it relevant?
> > >
> > > After revise of splitting plane into pipes, the number of pipes will be decided
> > > by CRTC check for both virtual plane and non-virtual plane case to unify the
> > > plane handling,  instead of assumption of 2 pipes at most.
> >
> > This needs to be explicitly written.
> >
> > > >
> > > > >
> > > > > By default, the plane check occurs before the CRTC check in DRM
> > > > > framework. Without topology information from the CRTC, plane splitting
> > > >
> > > > WHat is plane splitting?
> > >
> > > How about: s/plane splitting/splitting plane into pipes ?
> >
> > This plane is not being split into anything. It's being mapped onto hw
> > pipes. But before that, the number of necessary hw pipes is being determined
> > based on foo, bar an baz,
> 
> Thanks for the correction!
> 
> Currently, plane is mapped onto at most 2 hardware pipes and 1 SSPP
> allocation occur during the plane check phase. When virtual plane is
> enabled to support quad-pipe topology later, 2 SSPPs with 4 rect will
> be needed, so that a plane can be supported by 4 hardware pipes.
> 
> After revise of quad-pipe, the number of pipes is decided in CRTC
> check per number of interfaces, resolution, clock rate constrain,

Where?

> hardware feature and virtual plane enablement. The decidsion of

decision

> number of pipes will happen in CRTC check for both virtual plane and
> non-virtual plane case to unify the plane handling. Before that, the

will? Do you mean, after this patch? If so, please use imperative
language. See Documentation/process/submitting-patches.rst

> the number of necessary hw pipes is being determined based on
> resolution and clock rate constrain.
> 
> By default, the plane check occurs before the CRTC check in DRM
> framework. Without topology information from the CRTC, plane mapping
> will be skipped for the first time as number of pipe is 0.
> Consequently, the SSPP engine starts without a valid memory address,
> which triggers IOMMU fault.
> 
> Defer above plane related operations until dpu_assign_plane_resources()
> is called from the CRTC side to ensure the topology information from
> the CRTC check is available.
> 
> >
> > >
> > > >
> > > > > will be skipped for the first time as pipe number is 0. Consequently,
> > > > > the SSPP engine starts without a valid memory address, which triggers
> > > > > IOMMU fault.
> > > > >
> > > > > Defer above plane related operations until dpu_assign_plane_resources()
> > > > > is called from the CRTC side to ensure the topology information from
> > > > > the CRTC check is available.

-- 
With best wishes
Dmitry
