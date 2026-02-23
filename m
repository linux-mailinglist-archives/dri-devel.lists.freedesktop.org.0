Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL6jF3PjnGn4LwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 00:32:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1277D17F857
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 00:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B52A10E461;
	Mon, 23 Feb 2026 23:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jV3LT70c";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAM57+ma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2540610E461
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:31:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NIESpm3698607
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pcXNny12eVUei3+MwxRw80MUcAUX1Es/wkupl6bpnH0=; b=jV3LT70cFUxj/uMr
 8Ey/Xh2rL+iNxA+GPFKTaTLCnRZFL8R/2gzGZm6YwljL0ZdmR7+R56p4Hi6oGrqT
 8LXJg/u1AeFul6Xa2xMBrrOZf+LNL5QGbinBOlQCie7oQyaQzlPfqkY96xghSOoT
 14FEtvpo289C3O7tX0Y8l2KvDlULEGl19LPAGNsYaUd4kE/l5c4Fx+AJwLKf37Mn
 d6Cx0LDY7Z8NDV6P2NU5dsbJdtCns4PBnvXjQAmRq8W/SgGyS4nTfcCBaXp2ApXK
 73A32INRXWd44YuxzXwudyZjKEHkBQlV0cpsQlMptRnnk4I1yaS+Ppct50SSfqh0
 I6kHGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn81a7w7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:31:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb6291d95aso3420294885a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 15:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771889517; x=1772494317;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pcXNny12eVUei3+MwxRw80MUcAUX1Es/wkupl6bpnH0=;
 b=DAM57+ma+peUdovQzi4qf4jSNinbke+jS1gtO2P8o3I/qwKuwA5VY08kYxi+2BuJl8
 nxSAgHmqw403F24vq8O0Hqz1S+MkqZuImeuHWPjz4JK3OTOdR9tguzpuYhm/qiBr5VfS
 ijEio5SFTCdrJRWQvlfldU8wXK92pI3vCgcqJwucmH74T17au91iTH/FHdXLsEnWPL48
 9rdP4PQhRkYSOo9X8demKCAmeWSTlgA4+J8AfmPfo5hIDdAHx7kRyROocKXXMmsEB4V0
 XRiuJBOE1cYFsv8LL/9Rs13r8MCoOMXTJtKX4hOkwWQ0ec2sWZlxrbaYM+x3ZSvWJveI
 Lksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771889517; x=1772494317;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pcXNny12eVUei3+MwxRw80MUcAUX1Es/wkupl6bpnH0=;
 b=CxJ9mhROS/SAaynVtc6Ihhefe4Ob5NpaFnEDY7AEDb2/qLvRj3TjYBketLw+eWF/rQ
 Fj4weoaX29FC7EvcWbebrCXKQOWCVn8ug5VWv5VtmiasPngICpjJ3DpuQQ00/oG+s2jr
 90dQXAZuhnUET+Kju8/kkQdpK+iPRUrhO+xL4jwqtBrVXUQgnFcGkc7MVyJJJDJIzCpC
 gUkapkshE+VLz0ApfRrbkc9iGuLE0KcJCnC0prx2F+Fg0kZ1ld4q2577k/V8BHLTYxdZ
 QIxsYVsrGVDCfR6b//3F2y6xYYwfsVX7K8ORKO/KdDWtQFqQyqqYzvJMtnIMrpTiL5PP
 xo6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ28SbfBpdQOYZArxNig+wuZWGk+TLh7luDrdBWb2U7G2RZ7PVJp2mkoHM7lm0pkJlnW473g26saM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywho0YoF+yXCzpQm4dEXoDRYNYiwaEs8CWRJ9ZAxxcAJ/wj8Wf1
 E3uNd/anxVzWHVMAorJOYmoTnboqzTpUIa1b+fA7vAa293mz2QLzd+zAQZIp2RTygmTBMYNUqMN
 1dlAdTc6RBVNdBvK4Mk8h8jZhyaxIN3e1eQRjWGYd83ClkG0Ku1/BwXAIo5Bxjt7N34C8Ti0=
X-Gm-Gg: AZuq6aIBRLrCMhIyLBksk2a/sLP7U2Dr6A3GrQvjVXYkPXUamJ+F42MP7GUUMJJYDrS
 ZEedYqJO8T7f/8mimM+p/VIO0X2oYvAxTERfAPLewcQAh190kwRCAtqi0DHVUMEYsI9Eywt5Vca
 Fsz2sH0NPY3zkvwDCfizcQ+izuD4szkpe0oGCN+gxX9h3IIXyHptdWxq5mLTQeHNZ0kMH+FWfy6
 3JQxeHDmS0VIjGSCHRdIOs2gqPFf/05VkYZoH/7Ft60gH8aJR8c3nu22leovhjxlzCDz2tN0vtr
 F4TAhwLL83YFIg1Sh8pO46/ubnYwmShp5GOtefU5j1RKRjv9GShwl6yP1bJ0F3P61vE4V6ELS9A
 NbxdmNpnBoSgEuDwD7vSg61LRt/nTZKUwZIBZNv5t6h2CoyNnc4Wt/b/6Zm8d76d51pknbWhH6C
 cL8K3PrfiTfQzOTs1/CUpPG8+a0ajsELXziC4=
X-Received: by 2002:a05:620a:8412:b0:8ca:105a:f5d1 with SMTP id
 af79cd13be357-8cb8ca0a6ddmr1049864285a.30.1771889516518; 
 Mon, 23 Feb 2026 15:31:56 -0800 (PST)
X-Received: by 2002:a05:620a:8412:b0:8ca:105a:f5d1 with SMTP id
 af79cd13be357-8cb8ca0a6ddmr1049860585a.30.1771889515893; 
 Mon, 23 Feb 2026 15:31:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb0b8f0sm1809097e87.14.2026.02.23.15.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 15:31:54 -0800 (PST)
Date: Tue, 24 Feb 2026 01:31:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Don't use %pK through printk (again)
Message-ID: <r7n7bpgagciyln2iik2iybctzujyfrbqpxdynqv2saxapcmicw@yymbsq5ifhjh>
References: <20260223-restricted-pointers-msm-v1-1-14c0b451e372@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223-restricted-pointers-msm-v1-1-14c0b451e372@linutronix.de>
X-Proofpoint-GUID: zwLRNh-6e3iuseVBYxSH3M4BNLB-PzgV
X-Proofpoint-ORIG-GUID: zwLRNh-6e3iuseVBYxSH3M4BNLB-PzgV
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699ce36d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=EcddL8Wb1xXwbACcv5wA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDIwNSBTYWx0ZWRfXyboSz+Mf3jj2
 XP3soJ8c1AjMWaIYuh7LhQEr/4P1ZnQZu44pLzgfB3WPl8J6dfTB/Rf8EgusT4nsNSFMq3sZcqG
 20F8aASHiLuUStxsLnpo7seiz8X2rRPjlGHbZ8eYRSifm0gl5cBZ4e+ClhqR38IRQEDuGayZFkj
 FmZ+XQTJMP0I/U0CrcdFqnZjGw8SqZkstxH7vttzIE+8M47CGzAZUFFAfkRW2jI2tbA8+GfJBxe
 7yGDaLZpHPnPajF7C5Cy3MnEelH80avznAVXhXBfmGl/t7Z+aLXM7uMbzBriV/8ubQMmHAV9oIU
 Wd3kTNb6LuPeJ5gKh+nw/xIBSC7WfaTRCdz5xzZkkIDOri15LCfqLV6kZPHkOJlYeXDMD9/yqy4
 m6nCA7Ig/CNJ/TBacKdtSSXhhi9DXq9oHUM6EUlbcQZZmYQAsErvCo4QaM8ufS95ic63yTcgW1A
 iDrzBlYsa1JAt0lue+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230205
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
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 1277D17F857
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 08:16:55AM +0100, Thomas Weiﬂschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> Switch to the regular pointer formatting which is safer and
> easier to reason about.
> 
> This was previously fixed in this driver in commit 1ba9fbe40337
> ("drm/msm: Don't use %pK through printk") but an additional usage
> was reintroduced in commit 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC
> driver to provide GAMMA_LUT DRM property")
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Fixes: 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
