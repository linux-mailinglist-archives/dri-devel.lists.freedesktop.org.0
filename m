Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM1iF7cZfGlgKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 03:38:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0241B6829
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 03:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6908E10E8D9;
	Fri, 30 Jan 2026 02:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fM6VQ2nm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UlsOfJ5a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D152310E8D9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 02:38:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60TH7TSv179476
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 02:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HcDaTxd00FsQjxgCY5XTLK8c
 zak37LqC5DSMKVJvXbU=; b=fM6VQ2nmuyDmhrCq4s6mv0jHql7R2VFbt+vd0W7d
 mkXlVrxBHh5xP5XWqQCG8ZDjYyuRD1AHyp6wB9Uc6YD/1RxNNxaPemycLDDiOauM
 yX0CJAojEpW/h60uu/xomjpVYJ4Dk+ceblo6fVVh5r/BJHr8Jo5sUxrnCfVq+NoQ
 6z8BwblpnTlk7SnuwZAjmUifCs4Z2F36Yf786tuxt3KAMZ00AEWwD5cRrlWZXkbb
 IwA5XAXnQrJnlbkRb9/1WVBycoTRb+jdY2pTTFSlBvKmHt1HHfRQoR4gLYwPl2A5
 d12DCtCRBBsSZqIty3CI+hpKTyZF6mwa67WXPAEaQwLQkQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bp3sgp9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 02:38:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-9484844d6faso3333728241.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 18:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769740721; x=1770345521;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HcDaTxd00FsQjxgCY5XTLK8czak37LqC5DSMKVJvXbU=;
 b=UlsOfJ5aIBL6JzANputIMv/+hF0JhfoHF9J/Ev4CcJJIjOmboJHv3knAkqiGeOMkJt
 XiUXU85VMExizrWUzHIMs0acCc2QLR1Xey8fFPdNXSfNHWXRhUOnlPcAIl0GkS96esbR
 4EbiZBqCQ8JZZqfJUVSH9bRm1gN3nfwWVhlCQOWFixp09/LAtVU1rpsIc15H0ldPjm25
 SqvomEBe76wc8A3fd2Zwb/zCMewQ45kbHbRC0B5R/8YZfLi+55pB3LMsxnzPx8/F66+o
 vq4MK3otxQrauS6ZqsfCb6KDRiTyKP2hzHk/llT0F/Zr8v9izw0m+tt8kQq6MuZ0lwrr
 XFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769740721; x=1770345521;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HcDaTxd00FsQjxgCY5XTLK8czak37LqC5DSMKVJvXbU=;
 b=pDTAhgWuQDuVPkPuBf29fmco9JxmDUU1BibAQn8nPoehY3d/PIjcAPmZ/KpIMGMwyD
 RLs4KAS/GeZX/wj+CLun/GQEH6Dw3Wy5di7Nip07+HjYy2/lvlEDMB+qOOlWWDP7a6uN
 oPpgugTCR7+FbwwHRj2QVT583bel9uXqeYOvA7i1wMsUkr1omh2EH6JxKjqTvTfUjTcr
 9j8FWtiMshg1xY51DlhJiVtircLWFYskYhPUpenmYs12D1jMuM1L0O2Uz98diDZZF0VF
 ypZtj16BbCIYewL8GX49hoR++cS5qGLcRf9l7gbU+wWTRlWJ4J2d2zEUtgZi5uivBI6/
 ic3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnUPtk55OoJu8zstTiquHKX96YjI9NQET+e09hbybwSDrwgI7hmw1skQhUIOnB4eS/8mVn3f10sWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7OGJGzOHnZwvDZjkAebTXjcsLezNn01iq1ojFSjXAaPZKD68U
 MJYvGekk5apBi7CQiQzmo6Bc8XOWil0ziFcOuQcw2wQIsR0FkNcbwqL21fiJglHgvp7t5oCoghI
 fjZeq4L/xwMSozzJdFPGvy3eBhZN7R3G6dXnP2cxDz8d6rHrQaYD6QXO4HBwwzWvJrgYezUA=
X-Gm-Gg: AZuq6aIupKjOi0n+Vy29FOlVKPZ0Gl7fbdps2yHclN1czuAuHvlb8ECg34KFdF2isIR
 HsTrN16sIgpZ/j/Dtg3t+zdcFkKgNfa87p6xS457nvGoLIUUw4cfDs59oFGti1jEUqkhDSvX7Kq
 anLhWxoCS8fj4uLkKVFJwjv51AmcYgbk4VQiwuXuGN27xQrwRJkatmJJ0xbnKA8LCOwNNL3Dvba
 VFe5FmumhC6+PmUv79RzJuuijeqN/vZW9pO40HhWUvNopRfp4jg7mZ2vJDHq9Ou8nq76Y34hh2A
 clzvD1kXy6Cf5jf0ohidGWXnhpTKNIfRtPFECbyCs8aqyBjBvKsWSiRyTh4WypwlvN/fgXlqOAk
 KLy6N0gJwcPiYNME7D37uU4N3S/mKXQHCe/vfnXGySy51LdRG84xhCcQ17zv8z7hZSu3Jt4OhiB
 8ULtoy8zPPxLRGvmb6rPsO9as=
X-Received: by 2002:a05:6102:d8b:b0:5ee:a590:6b11 with SMTP id
 ada2fe7eead31-5f8e2607eb7mr529943137.36.1769740720987; 
 Thu, 29 Jan 2026 18:38:40 -0800 (PST)
X-Received: by 2002:a05:6102:d8b:b0:5ee:a590:6b11 with SMTP id
 ada2fe7eead31-5f8e2607eb7mr529936137.36.1769740720593; 
 Thu, 29 Jan 2026 18:38:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e074bbe0bsm1433749e87.83.2026.01.29.18.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 18:38:40 -0800 (PST)
Date: Fri, 30 Jan 2026 04:38:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v7] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <ie3hipmp5nqappyuwnxm2kpgscnl6qe42cwf2sep4inwunb5th@gontu4foua6q>
References: <20260129233703.407404-1-xjdeng@buaa.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129233703.407404-1-xjdeng@buaa.edu.cn>
X-Proofpoint-GUID: tDIbtptMbrBBSVkXAM4Li_3ghGklHW0w
X-Proofpoint-ORIG-GUID: tDIbtptMbrBBSVkXAM4Li_3ghGklHW0w
X-Authority-Analysis: v=2.4 cv=d6T4CBjE c=1 sm=1 tr=0 ts=697c19b2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UE2EgE-5dsTTq3FBrnAA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAxOSBTYWx0ZWRfXxsCjBBmwCW7/
 KLxIk7pzMhEwRzfA8dtCeDi4aH56Ferv/J9GEIDlNR60utV5c5GL6jQrXvHvJcpZHcaKBpH+YU5
 zkczCpm4562x/KPHYuxZcjHt4nOjN2pkZAEqEviRKZhESM/mnAzFQ1qDDc99DowtB7TKvvpuLMn
 hI8VOPr24S5JHuSg4YrxS/x3n9zjfUZDL17J0uSS3GmAdpYsiZ2kSBjU4wTlgJrbXlhL9riWS4k
 WEC/PYmPDlLWRBYWiZDzFH6Ss8zYzeLnLOuIZ1YxtNlQ7KX1YyK1v9Ihu3ts9Sa3kwOvdHZ/8U9
 IVt6LZWLt7eb6tqp0l7aCOTPUijntGZ8Lf5MYc7G69xub6qgvtMa5NYNcJPSHU1xtYN+ti0t5j5
 rY9qAJJBJ2VFDtbTfe2IfSAYJ7y2oX81N2Dj9sjuufp212GEqdhwBEKNN6k9oEL/0zNXCKT5OZe
 5T1karIIVk9fM+fMSNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300019
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: B0241B6829
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 07:37:03AM +0800, Xingjing Deng wrote:
> In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> reserved memory to the configured VMIDs, but its return value was not checked.
> 
> Fail the probe if the SCM call fails to avoid continuing with an
> unexpected/incorrect memory permission configuration.
> 
> This issue was found by an in-house analysis workflow that extracts AST-based
> information and runs static checks, with LLM assistance for triage, and was
> confirmed by manual code review.
> No hardware testing was performed.
> 
> Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
> Cc: stable@vger.kernel.org # 6.11-rc1
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> ---
> v7:
> - Add the detail description of how the tool detect.
> - Link to v6: https://lore.kernel.org/linux-arm-msm/20260128033454.2614886-1-xjdeng@buaa.edu.cn/
> 
> v6:
> - Add description of the detection tool.
> - Link to v5: https://lore.kernel.org/linux-arm-msm/20260117140351.875511-1-xjdeng@buaa.edu.cn/T/#u
> 
> v5:
> - Squash the functional change and indentation fix into a single patch.
> - Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statute-showy-2c3f@gregkh/T/#t
> 
> v4:
> - Format the indentation
> - Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t
> 
> v3:
> - Add missing linux-kernel@vger.kernel.org to cc list.
> - Standarlize changelog placement/format.
> - Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> 
> v2:
> - Add Fixes: and Cc: stable tags.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u
> ---
>  drivers/misc/fastrpc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ee652ef01534..8bac2216cb20 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2337,8 +2337,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		if (!err) {
>  			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
> -			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> +			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>  				    data->vmperms, data->vmcount);
> +			if (err) {
> +				goto err_free_data;
> +			}

I think, checkpatch should warn here about unnecessary braces.

>  		}
>  
>  	}
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
