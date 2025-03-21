Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4162A6BC89
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 15:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F0C10E7DA;
	Fri, 21 Mar 2025 14:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5FFyDMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FA510E7DD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 14:07:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCSllH010713
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 14:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=n4dOWXKC6mPXFjDpSYZ/WJvo
 CSfdzk/j2GPOhCYKVDY=; b=Y5FFyDMuplv32vbJvmFlofNE24HcYZWtCbdB9PuP
 bY5dwKhHIUY/GcnqQhj6bH7Dvl2SngTIDpv1h4VbinxQDuuBIT/Jmg6TiP75ozfz
 qmjQSCRr/tCYSKEazwyICdKwwhOU2nG8riMoCPOswFdnY4ZWXNX1DcziyankEY5K
 3NgNK/iK6600o+5oA5IeVMk5j+HLCKyisUQCezbAiOBl9dyj43MHJ3UF05jhn34k
 NrPsDQxH8JQTiLIRZ6RmEKYg8snGFsfJ3l9ZL/+W0qWuu9XVlru/HSERl5VGNHDp
 0zE7o+smmzQQR8SobtgH610Cn1q3vO7Zv5TNgssHrgtqrQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h85e08k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 14:07:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c0a3ff7e81so365590285a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 07:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742566030; x=1743170830;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n4dOWXKC6mPXFjDpSYZ/WJvoCSfdzk/j2GPOhCYKVDY=;
 b=imLux5ERvZpJTaeellPVQGX0c8as1Y8szrTVxy/sfmQD7KHdPHddpCKKPAlGA16HLs
 JeMW6166p77CMIpAAZcv2tqQLMxBPrYdBNQjH5QqooSu+GnIvE+YjuzxozmuqOA0DFkU
 /CIRekK0JztX44RzeV+pzd13UEVB9hFPi/I96VOXPKLc6pBEQ+Dg7DYvACKXjgdsUTaw
 nt4I9OJltNEqxX+SNq7Iuvhn1vA1erlmCxXn7x+bmrIrdxbTpfrVF1hPwA0JbBFpxGm+
 uSBwse+XlD+BEiXar7LoDdg3JOYtlHDLxc5gn7f6Mh2Nu5CzdDgywVl/dqGv9uwE1D2F
 WCgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1RNHEIpFEWxh6TwUzawnV4gBTO07wrq+CAXQR6jCvoiFnAx0+9LdRbP6gcvMQrCoqvSFP3G7rwKw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVufVEf2lt70dXdKSoI9SFmfTQ0uP9GPZBhYuOi8sNAHwUPUlE
 2xB3gltZwcqlearjD6qXivWH1ej0hg2F2lRxjFsSfvAvUNn4R9eXa7hvVl/YVtK4GNKw3jHIHnX
 iPl9m0wOSe/9sFISg2SN7a8Az96kY169yMIK5psnRk6blv+lE/YnpQNfuT4BX/1fX52M=
X-Gm-Gg: ASbGncueJvpHcBlVy2ENvP4k8zmiQ2cTbIXL+F4CSWFcdKl9nQAttFf0HcDsCaAQzy9
 o/c1rJ/+CrGV+hylBCANay07oHxMMOJ8oCh3yFnj1F+FZmXb+0p5RKkqN23AU2a84KHlRlylZzf
 ikUpmHozw8FsAnFsYWF9i5toLnn61H+tTNPnoosk0ed4D1Tw9VlLIl3X/7Wc8GmKN/IbyB/vDAK
 QblHMIgvtcS3EOAPS7fCl3ikma1ajYdC0nBk/04qFf16s/wRbT4g3jnO/jmf42PAO/7fSmXJed0
 6f/ulCrh+TXVDe7w2g898inWjR963aSO6ZinKY3WsIm8fOMam+cLKnH1clprzu3HDzfdc1fvh86
 mjw0=
X-Received: by 2002:a05:620a:40c7:b0:7c5:57e6:ee87 with SMTP id
 af79cd13be357-7c5ba1e41abmr470564685a.41.1742566030511; 
 Fri, 21 Mar 2025 07:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCTJNsCfV0EF8Epu2f1YteJvCUL+F4ENn0D4b3RmEfnwrm5SjF78ayOE8NAWz/4oqCHm/szg==
X-Received: by 2002:a05:620a:40c7:b0:7c5:57e6:ee87 with SMTP id
 af79cd13be357-7c5ba1e41abmr470561485a.41.1742566030053; 
 Fri, 21 Mar 2025 07:07:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad64fbbcesm194858e87.155.2025.03.21.07.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 07:07:09 -0700 (PDT)
Date: Fri, 21 Mar 2025 16:07:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
 quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
Message-ID: <5r72xrv5rtw6bemh5onygkroyasroviijlta4hvwgm5c5hzvax@3icylchlufu3>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
X-Proofpoint-GUID: hAUYrVnVRYMobCtZqon8s6Aw1HiZjbUt
X-Proofpoint-ORIG-GUID: hAUYrVnVRYMobCtZqon8s6Aw1HiZjbUt
X-Authority-Analysis: v=2.4 cv=LKpmQIW9 c=1 sm=1 tr=0 ts=67dd7291 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=5a3lCsJK5BcCjL_2EzoA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210103
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

On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 20/03/2025 09:14, Ling Xu wrote:
> > The fastrpc driver has support for 5 types of remoteprocs. There are
> > some products which support GPDSP remoteprocs. Add changes to support
> > GPDSP remoteprocs.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> > ---
> >   drivers/misc/fastrpc.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index 7b7a22c91fe4..80aa554b3042 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -28,7 +28,9 @@
> >   #define SDSP_DOMAIN_ID (2)
> >   #define CDSP_DOMAIN_ID (3)
> >   #define CDSP1_DOMAIN_ID (4)
> > -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> > +#define GDSP0_DOMAIN_ID (5)
> > +#define GDSP1_DOMAIN_ID (6)
> 
> We have already made the driver look silly here, Lets not add domain ids for
> each instance, which is not a scalable.
> 
> Domain ids are strictly for a domain not each instance.
> 
> 
> > +#define FASTRPC_DEV_MAX		7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */
> >   #define FASTRPC_MAX_SESSIONS	14
> >   #define FASTRPC_MAX_VMIDS	16
> >   #define FASTRPC_ALIGN		128
> > @@ -107,7 +109,9 @@
> >   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
> >   static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> > -						"sdsp", "cdsp", "cdsp1" };
> > +						"sdsp", "cdsp",
> > +						"cdsp1", "gdsp0",
> > +						"gdsp1" };
> >   struct fastrpc_phy_page {
> >   	u64 addr;		/* physical address */
> >   	u64 size;		/* size of contiguous region */
> > @@ -2338,6 +2342,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> >   		break;
> >   	case CDSP_DOMAIN_ID:
> >   	case CDSP1_DOMAIN_ID:
> > +	case GDSP0_DOMAIN_ID:
> > +	case GDSP1_DOMAIN_ID:
> >   		data->unsigned_support = true;
> >   		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
> >   		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
> 
> 
> Can you try this patch: only compile tested.
> 
> ---------------------------------->cut<---------------------------------------
> From 3f8607557162e16673b26fa253d11cafdc4444cf Mon Sep 17 00:00:00 2001
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Date: Thu, 20 Mar 2025 17:07:05 +0000
> Subject: [PATCH] misc: fastrpc: cleanup the domain names
> 
> Currently the domain ids are added for each instance of domain, this is
> totally not scalable approch.
> 
> Clean this mess and create domain ids for only domains not its
> instances.
> This patch also moves the domain ids to uapi header as this is required
> for FASTRPC_IOCTL_GET_DSP_INFO ioctl.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/misc/fastrpc.c      | 45 ++++++++++++++++++++-----------------
>  include/uapi/misc/fastrpc.h |  7 ++++++
>  2 files changed, 32 insertions(+), 20 deletions(-)
> 


> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index f33d914d8f46..89516abd258f 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -133,6 +133,13 @@ struct fastrpc_mem_unmap {
>  	__s32 reserved[5];
>  };
> 
> +#define ADSP_DOMAIN_ID (0)
> +#define MDSP_DOMAIN_ID (1)
> +#define SDSP_DOMAIN_ID (2)
> +#define CDSP_DOMAIN_ID (3)
> +#define GDSP_DOMAIN_ID (4)

Why are you adding these to uAPI? How are they going to be used by the
userspace?

> +
> +#define FASTRPC_DOMAIN_MAX	4
>  struct fastrpc_ioctl_capability {
>  	__u32 domain;
>  	__u32 attribute_id;
> -- 
> 2.25.1
> 
> 
> ---------------------------------->cut<---------------------------------------

-- 
With best wishes
Dmitry
