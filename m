Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1841AE736E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 01:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C107510E1A4;
	Tue, 24 Jun 2025 23:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7wbS7Yy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD7710E1A4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 23:45:33 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OEmEfR013850
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 23:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WAJsPIbRnjXmAo6ZjZnEWFmI
 vAfVjWJKXaneql+iv3g=; b=M7wbS7YyipqfWrl5JiHqR3dDLD5shJHyYP0Ub18m
 vvQG8JIPVswpSQ1FWIPxRUIIoUXIHz1PRBJklmKRVAxhBVkMbZoiTD3XNVa6cdKp
 +kgX0QwZSLlPrJKrzdqTt1WOmt4MZ69f1q15S8bAQn3xQ1baEVGG1q98PoCvX6XL
 eBgWV2kwekufllI2O++xAYNFdNlrGIRo6JLYb4H1uNUGADvVkIIZpKuJgVMuQtVR
 gWPdFqMRtQFrNrqlNo9h57C4JlEo3NQP8E1nHXN0S5HD+05vb9kj/fQGY2I+PpFx
 IfW0CsWGk/3lvjMaSy1QnMOMCbojQZEikXX6bTOxH7NpBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4q63k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 23:45:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d09bc05b77so958321485a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 16:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750808731; x=1751413531;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WAJsPIbRnjXmAo6ZjZnEWFmIvAfVjWJKXaneql+iv3g=;
 b=aLJx1Ul8EhB7WK4FKRPa74fqBWq/el54s3+aIZpkGZ8+p+7Vg6o8Kld8YtYH1uJPM0
 KEz77Ig1YHUl2d0TcctSaaUxSJuLXF8MON+gEgzEsSwVm8okD6HAsH2GgDFiChz9wVNF
 /L+Ar9PowFutQUXtlBfx0FoUvKq4FcRizdXLsYG2RuGy0UxvfDQL8hprXYiLIC0zacfs
 OLhNibmhcn/bDZuqEzCmm+UtM+kJFUYIieS+HxXWxL+dVvWnkNYeDhArXHhNaOFTI41B
 0f6aRWRDFheCNER6fpdVFxU5Wjp8f7GzcMkbW6PAsacNS5YoF8GYbv15JeQkaiiiIfGb
 J+Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFY6l22kSFEPe2FovhFVNw+E0+jI9FCG+YWPdwA6gI3QlYQTJcBDRLo2LuSoyaRBHeGIZtCNO5xbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBphtAxF6oKQVEVfczY0QQzLA+1zsJhFym9h9pSA+KUeIWGYg9
 CKo4y2Cj8W6Bn1z/4mdUpn0qcdtYEfVuoA1pAKTqoiFMwsVVYIT/yUF8kmOYpTFU7m5fmzDlzAQ
 +jQsFLKAdhWWQp3lSQPZODFSxaaxqYzIHNCZtQwuEHys+2IzQI7omWbyYPoH81/o75AhmJbc=
X-Gm-Gg: ASbGnct1RviNkfm5elOyCymSPcmVUMU3VFi+lvg4lsMdEgcJZoZq2mYoKeQBCNmVhaH
 ru4wr5AxQ4lWjE8MAXonpWuO+NS7CHH1lHLRJUbqJlIvSsZLE4io2zRogd9MoQsFJkwaMhp4FwN
 jBE5DzPEbcbj+5KzwU4THKByPa2iocZTt0iz+jk3E6zmDuxIkCb4cjRfD9/ZSUpSP0Sh9p6OiE/
 SMX6ktioJ2Mht7ytgCHKvPlWgJ9nW6Uo/wdXGwFZHGQhbjk0SJH9uWLOX5rWu2VoVjo06pCrAMd
 r/p8dqAw/IhZtQF/s/aFpBSoQi4vNrjFqeFV1f7PIJATEq3gBK79p/yDiL093q6DOYggmSpP39z
 1RghHIf8Qkvunp8MZF0LH8U4lLuYfSTk8OL0=
X-Received: by 2002:a05:620a:2608:b0:7d3:dbed:869b with SMTP id
 af79cd13be357-7d429738b3dmr140731285a.42.1750808731313; 
 Tue, 24 Jun 2025 16:45:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgF4lKMv9pFTpq+Z5gqbHVZeWYlPV4tLNkOFjao+Almo/kU34/QQnWnyKwCR8y/LNKFMM9dA==
X-Received: by 2002:a05:620a:2608:b0:7d3:dbed:869b with SMTP id
 af79cd13be357-7d429738b3dmr140728485a.42.1750808730822; 
 Tue, 24 Jun 2025 16:45:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e41d2e38sm1978871e87.240.2025.06.24.16.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 16:45:29 -0700 (PDT)
Date: Wed, 25 Jun 2025 02:45:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: Fix channel resource access in
 device_open
Message-ID: <golcrcr6voafr3fqsnihyjyut36sii55vzws4josfhkjjg3nie@ur43qq2kvlsv>
References: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
 <kk3jvlwjdzy2mfs6bip7dadrnsoxwksyp2odi3rfxkv4crmwtn@x5qyn4sp2gck>
 <2025062424-dizziness-theft-0502@gregkh>
 <2025062434-reviving-grumble-1e53@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025062434-reviving-grumble-1e53@gregkh>
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685b389c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=_JTX4_t6f0o1SzS_BCQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: yu2IYV7H64e5KDNH3jCuGgmzyllCC5J3
X-Proofpoint-ORIG-GUID: yu2IYV7H64e5KDNH3jCuGgmzyllCC5J3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4OSBTYWx0ZWRfX84MVyHBMGzXn
 CD6mjJ0rpZSVpm78OUF7N3FIRhzrC98imPMeMsIPTgZzftum90c4e+aoL3HGL4cg90VbXeUTFKo
 5N84AuUJ/AQlBBMFatV5/SvZ/aehKtCi0Ns1Gebkfc9cMwlyvX7f2rZSqKsv5vawKUUF44jo5Yl
 ACBt3lBJnl4Sq5hOVmwt6JYjVWG3DvSueORYMnfdersbo75kq8Tbr9To92jS1zRBoL2u3510irA
 51nsWqV3xjD5MgF5DvO6u35RZ2YPTYNvCZammRya+cnxzD1Vk07NrJlxmQp8W0nldQqxHDMtGy7
 +/3WHo+IqKHciYBbOAnlrS6jJ6CAo31j85tepBxo7B3UszrFjpShwEVCY9DPSmFPjC3UZiF7N/r
 jtIG3ywuuqI0+8iGx0zYzMAh9r1t3SQl2iL7uu5/0A2vtz1EGPom7zHRQUuZPLYUL9AtkuNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240189
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

On Tue, Jun 24, 2025 at 04:38:25PM +0100, Greg KH wrote:
> On Tue, Jun 24, 2025 at 04:36:35PM +0100, Greg KH wrote:
> > On Tue, Jun 24, 2025 at 04:27:21PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Jun 19, 2025 at 10:40:26AM +0530, Ekansh Gupta wrote:
> > > > During rpmsg_probe, fastrpc device nodes are created first, then
> > > > channel specific resources are initialized, followed by
> > > > of_platform_populate, which triggers context bank probing. This
> > > > sequence can cause issues as applications might open the device
> > > > node before channel resources are initialized or the session is
> > > > available, leading to problems. For example, spin_lock is initialized
> > > > after the device node creation, but it is used in device_open,
> > > > potentially before initialization. Move device registration after
> > > > channel resource initialization in fastrpc_rpmsg_probe.
> > > 
> > > You've moved device init, however there is still a possibility for the
> > > context devices to be created, but not bound to the driver (because all
> > > the probings are async). I think instead we should drop the extra
> > > platform driver layer and create and set up corresponding devices
> > > manually. For example, see how it is handled in
> > > host1x_memory_context_list_init(). That function uses iommu-maps, but we
> > > can use OF nodes and iommus instead.
> > 
> > Is this a real platform device?  If so, why do you need a second
> > platform driver, what makes this so unique?  If this isn't a platform
> > device, then why not just use the faux bus instead?
> > 
> > It seems that "number of sessions" is a DT property, is that something
> > that is really defined by the hardware?  Or is it just a virtual thing
> > that people are abusing in the DT?

Purely software value.

> > 
> > And if you really have all these sessions, why not make them real
> > devices, wouldn't that make things simpler?
> 
> Oh wait, these are "fake" platform devices under the parent (i.e. real)
> platform device.  That's not good, please don't do that, use the faux
> bus code now instead to properly handle this.  Attempting to create a
> device when open() is called is really really odd...

The driver doesn't created devices during open(). It creates them
earlier, then another driver probes an populates the data. I suggest to
follow Tegra approach, remove the sub-driver completely and instead of
calling of_platform_populate() create necessary devices manually and set
corresponding IOMMU configuration from the main driver's probe path.

-- 
With best wishes
Dmitry
