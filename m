Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8AFA6DF88
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 17:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CAC10E445;
	Mon, 24 Mar 2025 16:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mX4uXRUY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A128010E49D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 16:24:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PSwx002683
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 16:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1AM0Se3LYUFXvOwXu8tjYGZh
 Xl+o6O9g5pUYbt3k7S8=; b=mX4uXRUYceC7UPGYvb2KY6d6Eaqtyc6Mllqc2cXf
 kk2BHnPr0rCvWvxwaMGzpqBTwUu2sgIOxs52L6G1aO71/M/fHQODZMwm7C7+2h3V
 sodbI4no7ARPP567urRc9nN2kmB0r73/EVhlivrkey9MwpamnjZWKwrdoC08RYhJ
 8ZPAyo0+/JGeie9EcWgn/I8rwdRBDZ4EHV1+EVgHmxjXR1ePopcFAZQwmliiMGU2
 ZNd7zso242h7sAWY7Tk/EbB9h1OMUJdOE6WYiIEn7Cxu048pkK2qheGqle0usdqR
 pQTdTDFnpwgBQDtHVh2zWcMH1tejgxuRvrTdkLmyrF/rLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hmhk4yee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 16:24:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5c77aff55so477740085a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742833493; x=1743438293;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1AM0Se3LYUFXvOwXu8tjYGZhXl+o6O9g5pUYbt3k7S8=;
 b=erEiXSLX5C1sy0CKSK/t/8WTfp9ddtWXCHmYgrh5xUGxwzeKIjSuZrBWlLFriTY59t
 RU8jNIvT4QPI66i0GezhAqUnWc+N8QAIehbS6Q0tw63TnIIZnHGSZpDXYWBX+EcecEpx
 CoN5PJMdV6RwlepYk39IbXhO+N8CsgZfRtDhK8YI4dkLSw0dfGrOJOpcga0iVHd6TsdZ
 5iJY4axV0dap/5qgP5cdiEiDf/nBMVLkFdMiVFvIZRSyyhlPfOT22DPNRBVk+p8Q353i
 npMfU41qgGoSXHG+925fPntAkacpzO21qRW1wCbznYqUjMDas1gHiHxFQdmmR056rvpL
 o/Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVihTq8EhwEgpEaxd6PPSAXMpdI586YbR41742Up00ubSiBawOxHxk3cDe7Db3vHtjkG13BycKlhfI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkUQeZpRQoj79X8DH2ttKPeoLnVzDD/R9hy5UE55iseRRYbLYx
 iEIMu/ofPHizO3Wf7x3wF081V1v6iwUIOUJK2SJTfFTqgs5t0h76o3dQzLGLlWyVfuz8+t4CY3f
 mQKp6L8PQTVmwFwSGr38m0xfzF/r8LNFR/ZR0qNMdMA3bwK5Jw7YG22whpR36F6pZKVU=
X-Gm-Gg: ASbGncvP7ZmFfkszLpuYK2j1CZdcvcLrk1VjQ70zX0hTow9CZBXM8RC02DdEpX/mYaw
 1rHE7GaFWhxFagMtKi5MBSRraG4+maWN85H/kg93NfZ6pjArvPbsxOXMrNRzvQ9w4r1whKRzD0E
 yC9MQ64o3sdkV4v4LFGoEtQ252jhxzmEbkss755p33kVHtaCJumP0lc5ctRyXkUqWCGZPpt8EhC
 V3G60gBVb1IRJIFB/Ev0kC4Yi/0qJFChWUrLKuRZm9uPzK9Bv3pc0Ri3GUdjZ7w8sx0QRV+iIMG
 3kLUq702GHkd9o+7iovLQCsJEkLDJ0RDLUtvZLTf2oj3E48ANP1le/wBZwz40EAkSrlm3LkELn3
 7ZEA=
X-Received: by 2002:a05:620a:2982:b0:7c5:5800:ddba with SMTP id
 af79cd13be357-7c5ba15d9e4mr2114804685a.22.1742833493335; 
 Mon, 24 Mar 2025 09:24:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxYkrT0PSiVJNKIxtwPLzi/aVHIvDz4gsdAhPc2l3H7IPz9M3SZ3IZa0XIswYbBnjdeKoDmA==
X-Received: by 2002:a05:620a:2982:b0:7c5:5800:ddba with SMTP id
 af79cd13be357-7c5ba15d9e4mr2114797785a.22.1742833492771; 
 Mon, 24 Mar 2025 09:24:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad65037e1sm1188914e87.162.2025.03.24.09.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 09:24:50 -0700 (PDT)
Date: Mon, 24 Mar 2025 18:24:49 +0200
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
Message-ID: <zo5sdn5l76noehza5663o5kwoygn6mvargbx2udtxheyctq7dh@elgz36lixmg3>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <5r72xrv5rtw6bemh5onygkroyasroviijlta4hvwgm5c5hzvax@3icylchlufu3>
 <90f2bcab-d89f-40c0-9851-7ff25f2c1eda@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90f2bcab-d89f-40c0-9851-7ff25f2c1eda@linaro.org>
X-Authority-Analysis: v=2.4 cv=C4PpyRP+ c=1 sm=1 tr=0 ts=67e18758 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=bXJdDZvNK-UVdt6kW3wA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GSZX1WLrpp1AjtIiMmaDbNClYs9U8fSu
X-Proofpoint-ORIG-GUID: GSZX1WLrpp1AjtIiMmaDbNClYs9U8fSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240117
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

On Mon, Mar 24, 2025 at 01:29:30PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 21/03/2025 14:07, Dmitry Baryshkov wrote:
> > On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
> > > 
> > > 
> > > On 20/03/2025 09:14, Ling Xu wrote:
> > > > The fastrpc driver has support for 5 types of remoteprocs. There are
> > > > some products which support GPDSP remoteprocs. Add changes to support
> > > > GPDSP remoteprocs.
> > > > 
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> > > > ---
> > > >    drivers/misc/fastrpc.c | 10 ++++++++--
> > > >    1 file changed, 8 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > > index 7b7a22c91fe4..80aa554b3042 100644
> > > > --- a/drivers/misc/fastrpc.c
> > > > +++ b/drivers/misc/fastrpc.c
> > > > @@ -28,7 +28,9 @@
> > > >    #define SDSP_DOMAIN_ID (2)
> > > >    #define CDSP_DOMAIN_ID (3)
> > > >    #define CDSP1_DOMAIN_ID (4)
> > > > -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> > > > +#define GDSP0_DOMAIN_ID (5)
> > > > +#define GDSP1_DOMAIN_ID (6)
> > > 
> > > We have already made the driver look silly here, Lets not add domain ids for
> > > each instance, which is not a scalable.
> > > 
> > > Domain ids are strictly for a domain not each instance.
> > > 
> > > 
> > > > +#define FASTRPC_DEV_MAX		7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */
> > > >    #define FASTRPC_MAX_SESSIONS	14
> > > >    #define FASTRPC_MAX_VMIDS	16
> > > >    #define FASTRPC_ALIGN		128
> > > > @@ -107,7 +109,9 @@
> > > >    #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
> > > >    static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> > > > -						"sdsp", "cdsp", "cdsp1" };
> > > > +						"sdsp", "cdsp",
> > > > +						"cdsp1", "gdsp0",
> > > > +						"gdsp1" };
> > > >    struct fastrpc_phy_page {
> > > >    	u64 addr;		/* physical address */
> > > >    	u64 size;		/* size of contiguous region */
> > > > @@ -2338,6 +2342,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> > > >    		break;
> > > >    	case CDSP_DOMAIN_ID:
> > > >    	case CDSP1_DOMAIN_ID:
> > > > +	case GDSP0_DOMAIN_ID:
> > > > +	case GDSP1_DOMAIN_ID:
> > > >    		data->unsigned_support = true;
> > > >    		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
> > > >    		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
> > > 
> > > 
> > > Can you try this patch: only compile tested.
> > > 
> > > ---------------------------------->cut<---------------------------------------
> > >  From 3f8607557162e16673b26fa253d11cafdc4444cf Mon Sep 17 00:00:00 2001
> > > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > Date: Thu, 20 Mar 2025 17:07:05 +0000
> > > Subject: [PATCH] misc: fastrpc: cleanup the domain names
> > > 
> > > Currently the domain ids are added for each instance of domain, this is
> > > totally not scalable approch.
> > > 
> > > Clean this mess and create domain ids for only domains not its
> > > instances.
> > > This patch also moves the domain ids to uapi header as this is required
> > > for FASTRPC_IOCTL_GET_DSP_INFO ioctl.
> > > 
> > > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > ---
> > >   drivers/misc/fastrpc.c      | 45 ++++++++++++++++++++-----------------
> > >   include/uapi/misc/fastrpc.h |  7 ++++++
> > >   2 files changed, 32 insertions(+), 20 deletions(-)
> > > 
> > 
> > 
> > > diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> > > index f33d914d8f46..89516abd258f 100644
> > > --- a/include/uapi/misc/fastrpc.h
> > > +++ b/include/uapi/misc/fastrpc.h
> > > @@ -133,6 +133,13 @@ struct fastrpc_mem_unmap {
> > >   	__s32 reserved[5];
> > >   };
> > > 
> > > +#define ADSP_DOMAIN_ID (0)
> > > +#define MDSP_DOMAIN_ID (1)
> > > +#define SDSP_DOMAIN_ID (2)
> > > +#define CDSP_DOMAIN_ID (3)
> > > +#define GDSP_DOMAIN_ID (4)
> > 
> > Why are you adding these to uAPI? How are they going to be used by the
> > userspace?
> > 
> > > +
> > > +#define FASTRPC_DOMAIN_MAX	4
> > >   struct fastrpc_ioctl_capability {
> > >   	__u32 domain;
> 
> here, in domain value of fastrpc_ioctl_capability.

I see. I'd say, moving those IDs to a header is a separate change. Also
please document that this patch changes the user-visible value for CDSP1
DSP.

> 
> 
> 
> > >   	__u32 attribute_id;
> > > -- 
> > > 2.25.1
> > > 
> > > 
> > > ---------------------------------->cut<---------------------------------------
> > 

-- 
With best wishes
Dmitry
