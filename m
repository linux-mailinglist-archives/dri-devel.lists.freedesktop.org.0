Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB8kHzVNpWmt8AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:41:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40D81D4BD5
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A06110E45A;
	Mon,  2 Mar 2026 08:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTR2oiOD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gi3kKrIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE9910E45A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 08:41:20 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6225e5E0944323
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 08:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 55NbmTrZJm9GduVqLSm7GShHdDsJirCn7I8r3hx6xVE=; b=KTR2oiODl0BzJmrE
 +HW+KRxtragNLQmRekHxYME1ZvZ5nZEYoQT0Rq+E4gxFuR/ILrYBCZoNOLiq/IaM
 B1DrVXc6D1vSK5Ywr00lOTCS3YI3mNH5wiP3tdykBX60JAPnSFIEih3hLp1sceqj
 aYftlqOKLt0LbuSyok924lije0Y5MMBc6kDzdcFUDWC5RMjIOlJ7DeYuyE5UdDfW
 KFY8OGeohMyq48Gm89mIognkkAQCZ1++ffst50lqtOnB+agADx4poEvo6YN9llwS
 jU4142KSiKGCGw9QdVZ2gBz1LiIXCY7lMeeuGB6xs+1F6t7psR1HoId8CU0+9sSr
 vIbQXA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq4u8j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 08:41:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-824a2df507eso14453225b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 00:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772440879; x=1773045679;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=55NbmTrZJm9GduVqLSm7GShHdDsJirCn7I8r3hx6xVE=;
 b=gi3kKrIszoMxebX6bCnoWUdkJGfp98Y/skSbdufTYFMgizFiHj+et/jx+wsidNw+ij
 +NfCYNmmILbtPCBf72CfH4NLlA2Oqk2jn7kNtxv1MjO48xsU1epsqE31rltJCerExi/b
 C8qQNW6XpCELasOhBjDmr2Lm++u3yi+xCXMHcWlzjPjsKuWBYolAWFFvPDoXJAz8pSjA
 /K+SGUsITbipedenJ71cacr59rmEzKVJca7pFejW0rd3qW7UKXoHDg3lCjn36YMELQPs
 zt4aYB9PIN8W5NBREqFsyzi1GaMOlSABMiiZZLi3zrC0q1uBuR77tTLsBaWQBTvJWoxX
 w/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772440879; x=1773045679;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=55NbmTrZJm9GduVqLSm7GShHdDsJirCn7I8r3hx6xVE=;
 b=qRhtqCBhtI6kW/mdbVgaFRNdt5CX+YmwIjHjjc1Z6PqT6JBIjUwpNt0Bo4nCp5zSZe
 hDu8ar4Fd/XlYqqg4x/mmsdppkWJd7Pv3Ytgj7ZpVJ/tEqkl1npRjD0MRmjZ8u+1lBrB
 x1PnAGILfX2NdCWRVq3nXlA+u5BsrhWGBP5kCm2MEt6lBJ7RF7DhRxnMGCrRENOzvF8E
 U/1ce6D1006jQ/6YbH3hID1O6LMf1ulywV2G75qs9JGQrIlr0pPwB5KTYb8gISe/d0Si
 r/rT0YAGaTzphs7jNPy4TQQ4YDEyo1wr37MBve2Sa9QrRZSYNoY+uIDcOUBcODomn1Rx
 VDhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeApAEZtHJssNpeyGWQkNhfm8dgIAO5Sg2T57bB+OgP9dlm1KlhmPE2E5UXTatmDi+BrBp33/LI4U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyt32u1dyKuZLUUOiLX/H9pw61jN5PD8SSRpKLaRWfdU0rq0umA
 zr56zH2mO2HApTaUtLbPr32W75SGuNad7iG88iyJ5mzQyH7sLG6mLWs8/7LLyoSwR9+6zN0Pwit
 kXFiUJcmFLdqaMrXt5iI2yYmraY5qsUxECxtYEHASCAVktLeen3enELQdGVTSQiYNeEgZYUo=
X-Gm-Gg: ATEYQzx3TLtKVkJxL0hw/Pd8F7X5iFfe17YOWCjyw/ejz8m5vxSOKgz6AvTD+DebCSC
 zX8/JS8xRgD6Agrdzz8luos4MthOo2nPdyCl4AGeKiKCju0akv2TZa5I88mWtf2Trsy21VlrZ9j
 yUY59IEXN7QTMSBHVhqgrREK8EBEOyuWmD2rYLb8z9F9gg1SACnq/wU6lMoknHJMnusYUQ+3jrC
 5+FnFUhy1QhT3dU5lmo25Bh7lzV7HygVn9w9pdzqFAz6hW6JQr0NE3j8tsTR88Yx1I2ZGoFQief
 etjplcwRtCE1fsR0XWRRn5DVijFuDD6uV7fsBAAVOWErSHxCXVxzo/np9QlrwyefOVpt4R0rvdZ
 gNSm6wpUqryPe/ha9my0l1c/nG/+LlR955wAPHsThFDNC3hXbGQ==
X-Received: by 2002:a05:6a00:290a:b0:824:d09b:9126 with SMTP id
 d2e1a72fcca58-8274d93b441mr10896073b3a.14.1772440879305; 
 Mon, 02 Mar 2026 00:41:19 -0800 (PST)
X-Received: by 2002:a05:6a00:290a:b0:824:d09b:9126 with SMTP id
 d2e1a72fcca58-8274d93b441mr10896044b3a.14.1772440878784; 
 Mon, 02 Mar 2026 00:41:18 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739ff3667sm11746360b3a.41.2026.03.02.00.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 00:41:17 -0800 (PST)
Message-ID: <8bf132e4-527f-4000-9c74-972361b6db6d@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:11:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/18] accel/qda: Add QUERY IOCTL and basic QDA UAPI
 header
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-9-fe46a9c1a046@oss.qualcomm.com>
 <fzfuaeninr7lfbn74reoare7y2zoflddcvvnvyifnriw26swjc@igixj73zawrv>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <fzfuaeninr7lfbn74reoare7y2zoflddcvvnvyifnriw26swjc@igixj73zawrv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l6mW9AJ48lSNbT1gRa4IDsvXt_kDnnRT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NiBTYWx0ZWRfX7XAdPqKcCUOQ
 OLtzBDAS7BJllD1Nqnd1vrd3SNmsguMZ87gNLmrudI3reg5nGXRkQZRMddUzR0E2Xw1Os80Hgux
 t+i43JZgTnXWT0LXv8Ijd9Zx8PnRdfMxZVfY25HALRJcu65hkmIguKK6/5k9fzf8QYOmLVd1eDt
 N+Ubea/qaNU0QhUV/hBrUThb0XMldxON5PbWW/8VtmBQgczaYjpUZa7nQtfGYemJW0OESrQbKNA
 y1V+Rk58j5/kKe4LK0QYlv1LuK30m/fzH/haznuexxQmmUegK76xOsOzFccrhNUXjo0zASEFdBF
 0YC7kWhKDXtduFaJ+8GACq3yssXiGSSAAVacYPkwc6xulL9KmSXJaaCRP2fjVJzzqLnogW2S+5F
 I36gA1Uaenbh6XEGOEp9Q/A9dbW2pytaKNqdjTg3sruW6GTFVnXmz4l72bw/6NmKIZZou5UYCDw
 9hkAOJ7TyztDQz/MFtw==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a54d30 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SgWlgk4r4gR3U-ipCD8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: l6mW9AJ48lSNbT1gRa4IDsvXt_kDnnRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020076
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D40D81D4BD5
X-Rspamd-Action: no action



On 2/24/2026 3:54 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:03AM +0530, Ekansh Gupta wrote:
>> Introduce a basic UAPI for the QDA accelerator driver along with a
>> DRM IOCTL handler to query DSP device identity. A new UAPI header
>> include/uapi/drm/qda_accel.h defines DRM_QDA_QUERY, the corresponding
>> DRM_IOCTL_QDA_QUERY command, and struct drm_qda_query, which contains
>> a DSP name string.
>>
>> On the kernel side, qda_ioctl_query() validates the per-file context,
>> resolves the qda_dev instance from dev->dev_private, and copies the
>> DSP name from qdev->dsp_name into the query structure. The new
>> qda_ioctls[] table wires this IOCTL into the QDA DRM driver so
>> userspace can call it through the standard DRM command interface.
>>
>> This IOCTL provides a simple and stable way for userspace to discover
>> which DSP a given QDA device node represents and serves as the first
>> building block for a richer QDA UAPI in subsequent patches.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Makefile    |  1 +
>>  drivers/accel/qda/qda_drv.c   |  9 +++++++++
>>  drivers/accel/qda/qda_ioctl.c | 45 +++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_ioctl.h | 26 ++++++++++++++++++++++++
>>  include/uapi/drm/qda_accel.h  | 47 +++++++++++++++++++++++++++++++++++++++++++
>>  5 files changed, 128 insertions(+)
>>
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> index 7e96ddc40a24..f547398e1a72 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -10,5 +10,6 @@ qda-y := \
>>  	qda_rpmsg.o \
>>  	qda_cb.o \
>>  	qda_memory_manager.o \
>> +	qda_ioctl.o \
> Keep the list sorted, please.
ack
>
>>  
>>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index bf95fc782cf8..86758a9cd982 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -9,7 +9,10 @@
>>  #include <drm/drm_file.h>
>>  #include <drm/drm_gem.h>
>>  #include <drm/drm_ioctl.h>
>> +#include <drm/qda_accel.h>
>> +
>>  #include "qda_drv.h"
>> +#include "qda_ioctl.h"
>>  #include "qda_rpmsg.h"
>>  
>>  static struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)
>> @@ -128,11 +131,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>>  
>>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>>  
>> +static const struct drm_ioctl_desc qda_ioctls[] = {
>> +	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
>> +};
>> +
>>  static struct drm_driver qda_drm_driver = {
>>  	.driver_features = DRIVER_COMPUTE_ACCEL,
>>  	.fops			= &qda_accel_fops,
>>  	.open			= qda_open,
>>  	.postclose		= qda_postclose,
>> +	.ioctls = qda_ioctls,
> Please select one style. Either you indent all assignments or you don't.
ack
>
>> +	.num_ioctls = ARRAY_SIZE(qda_ioctls),
>>  	.name = DRIVER_NAME,
>>  	.desc = "Qualcomm DSP Accelerator Driver",
>>  };
>> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
>> new file mode 100644
>> index 000000000000..9fa73ec2dfce
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_ioctl.c
>> @@ -0,0 +1,45 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <drm/drm_ioctl.h>
>> +#include <drm/drm_gem.h>
>> +#include <drm/qda_accel.h>
>> +#include "qda_drv.h"
>> +#include "qda_ioctl.h"
>> +
>> +static int qda_validate_and_get_context(struct drm_device *dev, struct drm_file *file_priv,
>> +					struct qda_dev **qdev, struct qda_user **qda_user)
>> +{
>> +	struct qda_drm_priv *drm_priv = dev->dev_private;
>> +	struct qda_file_priv *qda_file_priv;
>> +
>> +	if (!drm_priv)
>> +		return -EINVAL;
>> +
>> +	*qdev = drm_priv->qdev;
>> +	if (!*qdev)
>> +		return -EINVAL;
> Can this actually happen or is it (un)wishful thinking?
>
>> +
>> +	qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
>> +	if (!qda_file_priv || !qda_file_priv->qda_user)
>> +		return -EINVAL;
> What are you protecting against?
The intention for all these checks are to ensure channel is properly initialized before any
request is queued for any specific channel, I'll update the checks based on the current
initialization ordering.
>
>> +
>> +	*qda_user = qda_file_priv->qda_user;
>> +
>> +	return 0;
>> +}
>> +
>> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +	struct qda_dev *qdev;
>> +	struct qda_user *qda_user;
>> +	struct drm_qda_query *args = data;
>> +	int ret;
>> +
>> +	ret = qda_validate_and_get_context(dev, file_priv, &qdev, &qda_user);
>> +	if (ret)
>> +		return ret;
>> +
>> +	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
>> new file mode 100644
>> index 000000000000..6bf3bcd28c0e
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_ioctl.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _QDA_IOCTL_H
>> +#define _QDA_IOCTL_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/kernel.h>
>> +#include <drm/drm_ioctl.h>
>> +#include "qda_drv.h"
>> +
>> +/**
>> + * qda_ioctl_query - Query DSP device information and capabilities
>> + * @dev: DRM device structure
>> + * @data: User-space data containing query parameters and results
>> + * @file_priv: DRM file private data
>> + *
>> + * This IOCTL handler queries information about the DSP device.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +
>> +#endif /* _QDA_IOCTL_H */
>> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
>> new file mode 100644
>> index 000000000000..0aad791c4832
>> --- /dev/null
>> +++ b/include/uapi/drm/qda_accel.h
>> @@ -0,0 +1,47 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_ACCEL_H__
>> +#define __QDA_ACCEL_H__
>> +
>> +#include "drm.h"
>> +
>> +#if defined(__cplusplus)
>> +extern "C" {
>> +#endif
>> +
>> +/*
>> + * QDA IOCTL command numbers
>> + *
>> + * These define the command numbers for QDA-specific IOCTLs.
>> + * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
>> + */
>> +#define DRM_QDA_QUERY	0x00
>> +/*
>> + * QDA IOCTL definitions
>> + *
>> + * These macros define the actual IOCTL numbers used by userspace applications.
>> + * They combine the command numbers with DRM_COMMAND_BASE and specify the
>> + * data structure and direction (read/write) for each IOCTL.
>> + */
>> +#define DRM_IOCTL_QDA_QUERY	DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, struct drm_qda_query)
>> +
>> +/**
>> + * struct drm_qda_query - Device information query structure
>> + * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
>> + *
>> + * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
>> + * allowing userspace to identify which DSP a device node represents. The
>> + * kernel provides the DSP name directly as a null-terminated string.
>> + */
>> +struct drm_qda_query {
>> +	__u8 dsp_name[16];
>> +};
>> +
>> +#if defined(__cplusplus)
>> +}
>> +#endif
>> +
>> +#endif /* __QDA_ACCEL_H__ */
>>
>> -- 
>> 2.34.1
>>

