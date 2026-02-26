Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFQuJIkkoGkDfwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 11:46:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AEB1A47E3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 11:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB3010E8C0;
	Thu, 26 Feb 2026 10:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1liJdau";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPEaL/fF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBDD10E8C0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 10:46:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QAL4uT3747746
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 10:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zwCZAKTqPxoAPp//XCVoK8Lk
 kN9XjJo3gF5cOknkSTU=; b=C1liJdauVkvXUPdz9x3HsYm8gc/a5RB/NKVhsVYK
 SykF8PnuqWMn/B6ChdB94munsY3p5MRzDGHWRf1gr/FtBV+TCNu1GRMZaIkWu1SR
 aWlke4e7iWwkqQ+Tb2dI89FBFpR9bGHyr6PKk+t73OIh9DATfiKmi0gd5eCUvrJ5
 05ZLuogLemIBdseCQdKoOfZF/NYjBpcNC/t3HunV03G7Z8jITBNYt/afGHdcrowM
 K1YB5UbJTdwwW6fRI6kLaylwsB1pFToENxXJy0/XnOcOedpUioyM5anP9CQEvPxW
 WsVmxUvoKrTeZssoLuYaJQq4PMdgbfprUmepih4wFY9gVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559jusf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 10:46:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-506549eb4b7so70544151cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 02:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772102786; x=1772707586;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zwCZAKTqPxoAPp//XCVoK8LkkN9XjJo3gF5cOknkSTU=;
 b=HPEaL/fFoL89bxvmpEjwF1S0xmDKKhpoZZ8rCbQc0T9lJR8hphYa2fm6ZdSEfl4g10
 2wq6F4ygnzoHHeDtIWjZ9IzF1j8IVt5oGSvOTJ6g+Xy4aT+Vj3gEFGOwi3neg7kauzKk
 6u6sPen/9fdiRx7QzEOnRcoT6k1W4WKY6hx7kLa/irAExClTAvmLTa4XBc+f7m43X28S
 a8O7jC8PccalJ1dUhbUswrBZd0/M/q+UXt8ex4fP0IKJOuw1ZFb5XQOA70Rgpi8cgUHI
 L/wAjcsIB1f2XJDkz85u2qC5zJldhzWQne17/hIsyBmA0ufynHmNQ5mULaL+W9/krKW8
 yZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772102786; x=1772707586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zwCZAKTqPxoAPp//XCVoK8LkkN9XjJo3gF5cOknkSTU=;
 b=UifwOcI2EzMpN3WH/QRPzAp6V9+rXpiI+0b3Jw7TBw2Hh5PKDuPhHJBbzj8wXUsUcN
 lIE6Hxq61sUGdydqUNMfeqduUrQmw+1txFJP7cMOHmYuJqwzIQ+NNOfIofXnhh5smTj0
 XDITVKv53OUvoTXo9im+GCjPZMjMMf9SB7vfpyaQwE4t54jUWGjNFSczt6oR5zO1Hl9m
 adqrdfc66E3V98CYIvjoxnf3DuQeRXAsiycf19hgl8mr8+DH1WZvwtjSSbeebJma7ZAH
 vjKMTbKoMrl7GZamiT8yF8p9ApWP7sfsCkdaqch57U5sAR9Hj5N/j8O2ETab51vuTPXu
 80Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnCt3SVP0CA1CVGU93DDEujp5zomhudMKN/ZKAXu+muAcvtQTMbc6tDrG1ulU6DcviiR7IAfLuhwI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgNGu2MtSjXubHJ+TV5pP1K8VUuFI11zVXCdpHsEjbTES5FrDv
 NeY10KMKi7ntRj8QarJwk8jhZJsXB9k8Ycj7IyxB6zXeR/RzLrPqA+Zx4haWacqYL7gU9GBB+CP
 4gACzl8r1+1oeJ9bsFDz46jJL0ENTKIwrKshnXTEKSFf/qBwFwgCpwIOzmf45yD4oUfgaq90=
X-Gm-Gg: ATEYQzyuuWOiqRK5Oi8Wg4Omdw7nKw82J592z99pyOAHxtqhLBpOGHkTMmjAM6EGZEF
 Q29sa8d7Rdah8zV0heFcn35VyRPqD/kOa3AsdNEISBQ7QibOlQNf0d0oyu1N0rMaOsWumehYbBx
 Vdvc2I+Qw65qQGfm2kqY0xqnh7rJG7X/0LCC8VNJa4RKnwitYLJB+JYUwHv4gmuXnW5jbOiMNFJ
 ahbu1h8641X1GTZ/TjzUuQLQ7H0Y/dWcm+Dkn6XxwePM3Ni4TYd4Jij7ya7qHsdJgTfhc2wejdv
 e1Zw/wU1Jldbef+qz4zZmtEGrAhIhs6plW3UsFKWVD6XY2uKk5VSFQkxzlRFSh/bj4enDAfIiCL
 FGXeeLFzxoHf9JFRhZ8scggIV5prPNBYZJDj77eLsxdOyAQu6h49eqBDVf2Tw1ydBlauTCMlkDT
 8QG/LP9l6ehLsfYYQO20fT/iConnWcY8W3R2Q=
X-Received: by 2002:a05:620a:4587:b0:8c7:106c:cbd4 with SMTP id
 af79cd13be357-8cb8c9cdef9mr2566361685a.12.1772102786502; 
 Thu, 26 Feb 2026 02:46:26 -0800 (PST)
X-Received: by 2002:a05:620a:4587:b0:8c7:106c:cbd4 with SMTP id
 af79cd13be357-8cb8c9cdef9mr2566355985a.12.1772102785838; 
 Thu, 26 Feb 2026 02:46:25 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a109df8dc4sm685189e87.59.2026.02.26.02.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 02:46:25 -0800 (PST)
Date: Thu, 26 Feb 2026 12:46:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 05/18] accel/qda: Create compute CB devices on QDA
 compute bus
Message-ID: <3y6rn5ujkdbc6cd2ooq7gobjvokwwrey2xoj4d3h2pavi7r5k6@rrc6bbmutz73>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-5-fe46a9c1a046@oss.qualcomm.com>
 <x3s26yr7oy2dokp4plsp67yndr7o4ps6nuj7i4zjze77ifljux@ap537se6npfg>
 <57937a68-7f22-4ca1-8980-0be12cf06c66@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57937a68-7f22-4ca1-8980-0be12cf06c66@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Erdra1Ye6OoLdT-Dcjm9FBCS-H7zugAW
X-Proofpoint-GUID: Erdra1Ye6OoLdT-Dcjm9FBCS-H7zugAW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA5NyBTYWx0ZWRfX7JbPLHtR6Qmo
 dA8M6sTt1tp7S0VYXHbGLYjUtlOpRNJjfZblYnbJwekx7N+k9I181JvFHJKhHWy/QjudmCMvwIN
 IAv3TTAOOKW6IKU4G636sSmb7hhLpadys2YC7Toa6wJf4a0ZH1I/B2dv9S3vhYflkpV6c6xQwHn
 5WUJE1IW4KettYw/cG4WrnPpSbGn3siCeYsCfM6QoKIvrx4tZkMGZQnqjj1pV/PzjZZ+cfIksrI
 OX8RKtUZdsAS0nY0KmVGcMjuxvkVkSftwOTNOW2tqgnFcWSZIIyAavjeCrJTffHBYEWlTQ6b/30
 XcTlwCxuIG4KcTPCzIxs6h4h0l1F9ZBs1VtIPbTtM9poyZqBz9bvBwCqyy2H6JFL6q2lKB6GZCK
 5r5zqzAW/Q7QyO+DZ4b+EJ65p2Bxh/R9a2EWl6PPFWuiMi2U8UAGZMqeEmdm9kBBksFpVOBDVwH
 ipP2CwLfenz1IoQK5oQ==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=69a02483 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=kIP-TH2kwnt34PtL7doA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260097
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
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 24AEB1A47E3
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 02:08:57PM +0530, Ekansh Gupta wrote:
> 
> 
> On 2/24/2026 4:19 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 24, 2026 at 12:38:59AM +0530, Ekansh Gupta wrote:
> >> Add support for creating compute context-bank (CB) devices under
> >> the QDA compute bus based on child nodes of the FastRPC RPMsg
> >> device tree node. Each DT child with compatible
> >> "qcom,fastrpc-compute-cb" is turned into a QDA-owned struct
> >> device on qda_cb_bus_type.
> >>
> >> A new qda_cb_dev structure and cb_devs list in qda_dev track these
> >> CB devices. qda_populate_child_devices() walks the DT children
> >> during QDA RPMsg probe, creates CB devices, configures their DMA
> >> and IOMMU settings using of_dma_configure(), and associates a SID
> >> from the "reg" property when present.
> >>
> >> On RPMsg remove, qda_unpopulate_child_devices() tears down all CB
> >> devices, removing them from their IOMMU groups if present and
> >> unregistering the devices. This prepares the ground for using CB
> >> devices as IOMMU endpoints for DSP compute workloads in later
> >> patches.
> > Are we loosing the nsessions support?
> Yes, it's not part of this series. I'll try bringing that as well.
> >
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/accel/qda/Makefile    |   1 +
> >>  drivers/accel/qda/qda_cb.c    | 150 ++++++++++++++++++++++++++++++++++++++++++
> >>  drivers/accel/qda/qda_cb.h    |  26 ++++++++
> >>  drivers/accel/qda/qda_drv.h   |   3 +
> >>  drivers/accel/qda/qda_rpmsg.c |  40 +++++++++++
> >>  5 files changed, 220 insertions(+)
> >>
> >> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> >> index 242684ef1af7..4aded20b6bc2 100644
> >> --- a/drivers/accel/qda/Makefile
> >> +++ b/drivers/accel/qda/Makefile
> >> @@ -8,5 +8,6 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
> >>  qda-y := \
> >>  	qda_drv.o \
> >>  	qda_rpmsg.o \
> >> +	qda_cb.o \
> >>  
> >>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> >> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
> >> new file mode 100644
> >> index 000000000000..77a2d8cae076
> >> --- /dev/null
> >> +++ b/drivers/accel/qda/qda_cb.c
> >> @@ -0,0 +1,150 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> +#include <linux/dma-mapping.h>
> >> +#include <linux/device.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_device.h>
> >> +#include <linux/iommu.h>
> >> +#include <linux/slab.h>
> >> +#include "qda_drv.h"
> >> +#include "qda_cb.h"
> >> +
> >> +static void qda_cb_dev_release(struct device *dev)
> >> +{
> >> +	kfree(dev);
> > Do you need to put the reference on the OF node?
> Reference put is happening as part of qda_destroy_cb_device.

This way: you have a (small) window where of_node is already put (and
might be gone), but the pointer is not NULL. The of_node should be put
only when device is no longer accessible from the rest of the system, in
release function.


-- 
With best wishes
Dmitry
