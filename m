Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB9AEC542
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 07:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41EF10E0AE;
	Sat, 28 Jun 2025 05:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTbdW4Lo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6057310E0AE
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 05:51:23 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S4fWin015731
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 05:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6DJM5YXo8sYcAzIw6cyhaTgHjHxiZxMIahDKwbGiG3g=; b=XTbdW4LoxUKKcDaU
 26Wb5l2fUjqIpBg+fZ/yA0XeZnqUj7U/PdGjOzHd/auCtAfe4TW9wdWMuTwIAFbs
 jAlfHcRxZu52HrSXBbkp0x5GnVk8FAlDkpAbx5v8+2EIEHl3Qa9vJIPI5NxcHHep
 WWKBU3+THygDYkf/6kMEr8FH24VH1GjAiKzh5UIG0YjH5b13Oc9VwtrAGReVpekS
 P3Q3nUEcZGY/1//W5ICr7i2ZAiY7g7cHRYLN8JoWAX7mUomUG19CWGgw8rYpP9Os
 9HygZAesQmAeF6Uewnlmcfk0lo8wEi6QGuOHoZKCOWX7NUBkns6pWzTDhIl55zmJ
 1CcpJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jpr2dm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 05:51:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c955be751aso436852285a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 22:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751089880; x=1751694680;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6DJM5YXo8sYcAzIw6cyhaTgHjHxiZxMIahDKwbGiG3g=;
 b=vU5SZT/NNoGPWX3pA9T/kLoVOWOE7Kzev8Zj2xY70HTWNcjeEal/QycqjvtVlZtd23
 x/T6rKH76u21m8YLtmfY/VLWCCdj1bC3q97Ffo3sXvkFFZ87/snBHK47l3Agzv9V4uip
 ritK57x54MBCkDq4ElluveSHbjuJLoL9QpM+6m4NNBVEJlbcTrMnvrTafLFmrHsQUKH6
 rhueHQuEd6bfVzlZxWjrEquHXB7PxH+oqYh5e0l8hSzsLmSsGD1XNWKBFK5oRr9ubeY2
 ht2GmHJhA8o+fbLmUQxwNnBm7efUKK+QslLRWm1KPEJ6qz6D1wC/vTyVSZWU4NDczGkm
 9Vig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXC9+t2vcXzA7DGon1PWPrRBrydnSuIVNX94GNelHnk/D4fMDHn7bFu32vMCFz33uXiBErfkQLOmA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzG25GGKouTqDe+bGCirO6UHNN2b/1M15sQA5Riwqdl2iU0BvfZ
 /vREE6UHNfudevzsF4KsNRdHVzsnUkm4Tv0WLeK8Tu9AEIGRze/qDuS5m/HbhXGgRG2KdH00WPh
 p2eePb9P59PsnpWOJ7Sspk9x+xvwB0bXzAtj+xQCUIKL3s3AMk3Fw0ISzd/4ZBUYpW5gEB90=
X-Gm-Gg: ASbGncs3XSqtAmwrpvWrxZ5eBhsq5j8wxYPHP0eSF2n9wy7LQs8dLmjI+5JM1YQsZ3c
 r0VW965uK7oar9oCWolYstx8Cw8XMgS+pZSaksCxOI8fp9Xxq4MwpWSCdOk3helzef3Wv/sDt//
 R8gUR3I5yAqCC2NCiRmb1OlwRXP0e6Dl3TJwxTYfCh7Tf692tGfz2SWfF4ff7Yj11c3UaWEdtBi
 t2fVKYy4usp1E6ycrjmvTONAe2/4svHAVKjVZMjftOwT/Xu40Q7TucGGXjxDr+cbGqX+eLLGIxI
 T3gYFWYsd6odC3FPaKYthpY1cYJE9jjaYXn1z99zQI3PFaAjLIVf6BP5Ode9t797YMpSNaC2YIb
 StLNUt5mw370eicNsuJ4dfXr7nsXJjUpFxhE=
X-Received: by 2002:a05:620a:2949:b0:7d4:3bc6:1df4 with SMTP id
 af79cd13be357-7d4439179bcmr808813385a.16.1751089880584; 
 Fri, 27 Jun 2025 22:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9AFefwJW2wB1sxHCz4/FNU0tIQt/Hnx2l8Xmrunk9knE/K7hKL3txF/JewtO3UUcwRL43Pw==
X-Received: by 2002:a05:620a:2949:b0:7d4:3bc6:1df4 with SMTP id
 af79cd13be357-7d4439179bcmr808810685a.16.1751089880182; 
 Fri, 27 Jun 2025 22:51:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32cd2ee7365sm7060231fa.77.2025.06.27.22.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 22:51:19 -0700 (PDT)
Date: Sat, 28 Jun 2025 08:51:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <iwultq2bufhlj4tbtzs34ubb43jagw2anwei7yjjqmw5hlg7in@mur3oixqejlh>
References: <20250622133820.18369-1-quic_lxu5@quicinc.com>
 <20250622133820.18369-4-quic_lxu5@quicinc.com>
 <09bf24d7-2998-4a15-9b9e-ba476fc08a90@oss.qualcomm.com>
 <9bbd768b-6ee0-4c9a-9835-3a2cda19373b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bbd768b-6ee0-4c9a-9835-3a2cda19373b@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDA0NiBTYWx0ZWRfX9/2ykzPWe9cF
 oufwuV2p+EJKFAhIG3o3i1kmAB0svFd+lwbnIohkhygfOppq9mbvwp2ECKnCPCWGZOGKOJ+m3Lb
 bEifUCz6Vym5nebAeuFdD+XlPx3guUlL9hjLXcTx11vegHE+8m1bQYssYM5Ov5yQkUAAQcBHGqA
 o/gz6zz8QIDqgbXJBcWvFM/eGuegq8KkMLTiwDR2yNo0+vnL1HtsxUT18SFhvv+OJeylMrbHTv5
 mE6nmlo9hsxkLDjJcdk8bDzIfm0HJePa6D3ZEtbOtgRloj/d0v/J9+rfGFGLnRS9X03jWTjkjkH
 8VtxrGGZPyFLjnPgyp0Rdb5AXCCEXFjW1aMow3MFVpKpZlNz9+5BrXAtiqDBbSYxy/WuU+JYUI6
 cnsBC7dwQEJyBX8cLsOPHSdbgVbs+fmIGWbKlplx72Jw1Ay/Rdn7vfZFyTye0zFvAQTSU3DJ
X-Proofpoint-ORIG-GUID: h69GHmcxQLH7bqHfwD8zk1GLDG6ru779
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=685f82da cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=nvhyJCiy9YraiqoQAlcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: h69GHmcxQLH7bqHfwD8zk1GLDG6ru779
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280046
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

On Tue, Jun 24, 2025 at 01:58:47PM +0800, Ling Xu wrote:
> 在 6/23/2025 6:28 PM, Konrad Dybcio 写道:
> > On 6/22/25 3:38 PM, Ling Xu wrote:
> >> The fastrpc driver has support for 5 types of remoteprocs. There are
> >> some products which support GDSP remoteprocs. Add changes to support
> >> GDSP remoteprocs.
> > 
> > Commit messages saying "add changes to support xyz" often indicate
> > the problem or the non-obvious solution is not properly described
> > (which is the case here as well)
> > 
> > [...]
> > 
> 
> Okay, I will change to
> "Add related domain IDS to support GDSP remoteprocs."
> 
> >> +static int fastrpc_get_domain_id(const char *domain)
> >> +{
> >> +	if (strncmp(domain, "adsp", 4) == 0)
> > 
> > if (!strncmp(...)) is the common syntax, although it's obviously
> > not functionally different
> > 
> >> +		return ADSP_DOMAIN_ID;
> >> +	else if (strncmp(domain, "cdsp", 4) == 0)
> >> +		return CDSP_DOMAIN_ID;
> >> +	else if (strncmp(domain, "mdsp", 4) == 0)
> >> +		return MDSP_DOMAIN_ID;
> >> +	else if (strncmp(domain, "sdsp", 4) == 0)
> >> +		return SDSP_DOMAIN_ID;
> >> +	else if (strncmp(domain, "gdsp", 4) == 0)
> >> +		return GDSP_DOMAIN_ID;
> > 
> > FWIW, other places call it G*P*DSP
> > 
> In fastrpc, we call it GDSP to match dsp side.
> because in device,the related path for gdsp images are gdsp and gdsp0.
> > [...]
> > 
> >> --- a/include/uapi/misc/fastrpc.h
> >> +++ b/include/uapi/misc/fastrpc.h
> >> @@ -18,6 +18,14 @@
> >>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
> >>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
> >>  
> >> +#define ADSP_DOMAIN_ID (0)
> >> +#define MDSP_DOMAIN_ID (1)
> >> +#define SDSP_DOMAIN_ID (2)
> >> +#define CDSP_DOMAIN_ID (3)
> >> +#define GDSP_DOMAIN_ID (4)
> >> +
> >> +#define FASTRPC_DOMAIN_MAX    4
> > 
> > What are these used for now?
> > 
> To get proper domain IDs for fastrpc_rpmsg_probe etc.

These seem to be driver-internal, so they don't need to be exposed to
userspace.

> >>  /**
> >>   * enum fastrpc_map_flags - control flags for mapping memory on DSP user process
> >>   * @FASTRPC_MAP_STATIC: Map memory pages with RW- permission and CACHE WRITEBACK.
> >> @@ -134,10 +142,9 @@ struct fastrpc_mem_unmap {
> >>  };
> >>  
> >>  struct fastrpc_ioctl_capability {
> >> -	__u32 domain;
> >>  	__u32 attribute_id;
> >>  	__u32 capability;   /* dsp capability */
> >> -	__u32 reserved[4];
> >> +	__u32 reserved[5];
> > 
> > This is an ABI break, as the data within structs is well, structured
> 
> this is suggested by Dmitry, I will have a discussion internally.

No, I didn't suggest to break the ABI. I suggested making the domain
field reserved.

> > 
> > Konrad
> 
> -- 
> Thx and BRs,
> Ling Xu
> 

-- 
With best wishes
Dmitry
