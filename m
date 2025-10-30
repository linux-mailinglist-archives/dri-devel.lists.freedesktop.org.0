Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13754C1DE92
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 01:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0834810E227;
	Thu, 30 Oct 2025 00:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wz1nUFOb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+ZUSJsh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423C110E227
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 00:30:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59TL7Ewm1578970
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 00:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Bg4GD4B5bCl/z2lBLTlw6Nv819p3I0Eq4wMDWopW18A=; b=Wz1nUFObUD9mqwkl
 wLRDy5auK2++Bw+Y/XNjqjFBfwGNpBMHWKMOVNguzhqmjlcl7PUmH47kKXiZBOHr
 7XqNv12v89HIB9YZX8mtPbjc3pwGf93Nz3LFuifqjgiUsb84TPLqJuAAsneE/5B3
 gfQQf2AnpDMBH/dNw7NiRdbdg9Y50Z7mrXurL8c1d+QJeZddghf+qeDFVM60qeMT
 MMvFs1v4EQ1rNjc3SIJU01knN9+JgNy6KQjpOfT6h+syH0Kog8qQfbo4qYG5dWFj
 x8C/nSpl10ADsnA6Ut1X4HNNwUjflkC341kTRYsm1B+fC81CUuLIC3sfOFvLlq2c
 jTsnDQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tjeggwa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 00:30:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b6ce1b57b9cso263442a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 17:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761784225; x=1762389025;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bg4GD4B5bCl/z2lBLTlw6Nv819p3I0Eq4wMDWopW18A=;
 b=H+ZUSJshyvesaOrSXkmFhd5q8CTodqMPyp6ZigPXXqoQKNxnQeZPM1doiGxX6f9A9l
 /kvabY5rMq0HWU0nJUC5rnlB6AxBJO7xtpo0cuv2jmkUUfez7gGsZKtDHV3+EC4uemRn
 VMx/VVP0XshYXCreb/qckBYyNmSBo7/ZWDVmYsYXGen4kJC1nW3X2vCI8TagHGzJZn4g
 xAfBsYI9Codcir/LQ8vrFSHGsFzxgzSOdVx1Cw/kn8nqsGdRfPmwmEr7Eg6hdhaJazu1
 S+3lLLdUM5MKvgwSAhu/qNKErsmlmgf5gwCVBkloVbj+pzUMD/puvdR8LqAOc+hMWWls
 d5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761784225; x=1762389025;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bg4GD4B5bCl/z2lBLTlw6Nv819p3I0Eq4wMDWopW18A=;
 b=mnQhQHfuidlnig332HIOe3bCDVYbleYFt4Q92m4gTB5VQ74DK277EYePyJVikshtED
 LAINrJKHK/qFqeZzjicLXlsIj7W/5ZQJyJ6DatowBcUntFI13HXWoYai0Yv1ljgTLnWg
 sV5eyt8kp76p64+fIFq18UKQb9xoRLCMK+WJkshd5uCIo4Fi2tO0hM1mmfq6grpsnjrF
 pMRlPA/jvqf3RTchCNhsJ1b7svv8u3Xpim/LhtA0bPP9TEDBFnaanYZ6bwQZcQAZ2Lft
 bP3PgfRSwXtex3AvSeSvw+wteSxhdcNpqih0b1maHGG9sR/KNDDXGqSKCIgXt9Cn1Nku
 1goA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf1ah8ALBZGkhaYcnggHzG+CodxyJuneDIGlfS7FABpQwZF2AXm3gfULWl7J7gogD2qL0eB4BB1jo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzce2dyq12xPWlaX/ftcdchPH3yuKcGVV60I81AtY1zF0eF8FD0
 SREkaC0+LcNX38m9SZMY1t4C7HthAURvNCNdSpoxpXjE7rUY5e4LCPOg5tR5edIrpIqt5zbJjCO
 AbCXhdceWxQWyD2A6J7+Zo8npqVUS5KIpACD18aATHxF0FbGgJHw5Q51la9TOTvYW04iogEU=
X-Gm-Gg: ASbGncuvagIi3Ns017Uf2ASOPN/CTKMIsDVSkPTU713Bjka7PN+OsfmlcGqsc41vLRM
 nDPVzZnSDRDjX7JWbyIByBJixLvJyVrczl1nhKBXpcZFA8KhuyZLcWFycV7P5IAHEWFMmSyeyPe
 LHr4YxRPAf/6XSBhMZPOEH08hM4f9lvR8io+AVDlFys+syvSQP4f4d1ahj56+m7mvz9C6IaVGCD
 s800LeU7alLxFp2JFNmSQiOXysvXn6OY8IrBYSnEY55pf/cWkGbMWcFyCcnPcjNa4s5h+l/Ggmf
 46pCtppAFvoRltjiw/vIes5yim087zZ7LX4pRXYmS4ItnSPg8zc38w+CKahC4jR02CzDSr92rOJ
 khb0zT8udajE0DGrfia5GvXmJm6ABo2S34RthhbjSE3Q2Qwf+o/sn
X-Received: by 2002:a17:903:1a23:b0:240:9dd8:219b with SMTP id
 d9443c01a7336-294deed6937mr56766435ad.49.1761784224179; 
 Wed, 29 Oct 2025 17:30:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbpA1sRQPQGXfu0y7Xt51AgpiXHs+MPJMCKqhhNVROmMm29cJsPfykWn0uuQiQuftFK0UPpA==
X-Received: by 2002:a17:903:1a23:b0:240:9dd8:219b with SMTP id
 d9443c01a7336-294deed6937mr56765575ad.49.1761784223240; 
 Wed, 29 Oct 2025 17:30:23 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d0ac07sm165638755ad.43.2025.10.29.17.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 17:30:22 -0700 (PDT)
Message-ID: <f594b22f-f9f0-466f-963f-42235424790f@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 18:30:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] accel/qaic: Implement basic SSR handling
To: Bjorn Andersson <andersson@kernel.org>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Cc: carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com, ogabbay@kernel.org,
 lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Troy Hanson <quic_thanson@quicinc.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251024164630.816862-1-youssef.abdulrahman@oss.qualcomm.com>
 <20251024164630.816862-3-youssef.abdulrahman@oss.qualcomm.com>
 <club7ttb5xwffgcglsbnm62dzdnjrdutclbbfpsh2rfynrje6m@bu4bk3pd2pcv>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <club7ttb5xwffgcglsbnm62dzdnjrdutclbbfpsh2rfynrje6m@bu4bk3pd2pcv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8jaGqotCSHSDiPDs_KCE_MeY5T6qJaek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAwMiBTYWx0ZWRfX5akTqAPBacu1
 ArCdxZayWvH/0Wwrmt2cXj+/7UpOBu5fUFVzn4M2yeYBBsWiBkty6EWhCuy3GK+BjXOG3qoAYU4
 Ex6Q883l6mq5nkiJ0ztoPTCwsYrimxqGMDzNX2VzRm1ou05J19f9GDg4Kc4y0TGeW5JWUFzq3r6
 SyVzfNXB0KFEYttV8VmBE7tugeWp0/SChRnIQzYOrlr2JJd19i0KTl7I2cWOWcU9YnWjT902OuK
 VjajoAtmOekrtZ2eETusTRx7fB43yzn0yY8lCJ1PUZaa7GNwdg9j1l2hNeUyem4AS3mtpyqIRNt
 WjRqvsqelovInhfaGGqLYdfjuZcbcjhlHe5PzjZAM7O6swkSYXfIBu1zdIU0f+cHMS+IcmNd48k
 UF8cdVjlW5IRft+Uy1XYX+DLVs1KWA==
X-Authority-Analysis: v=2.4 cv=a/Q9NESF c=1 sm=1 tr=0 ts=6902b1a1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=QIhr-27iAAAA:8 a=Jq3LtsnOAsMKr34-ZU8A:9 a=QEXdDO2ut3YA:10
 a=Yx1Ww8rMGscA:10 a=x9snwWr2DeNwDh03kgHS:22 a=pioyyrs4ZptJ924tMmac:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-ORIG-GUID: 8jaGqotCSHSDiPDs_KCE_MeY5T6qJaek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300002
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

On 10/27/2025 7:59 AM, Bjorn Andersson wrote:
> On Fri, Oct 24, 2025 at 06:46:29PM +0200, Youssef Samir wrote:
>> From: Jeffrey Hugo <jhugo@codeaurora.org>
>>
>> Subsystem restart (SSR) for a qaic device means that a NSP has crashed,
>> and will be restarted.  However the restart process will lose any state
>> associated with activation, so the user will need to do some recovery.
>>
>> While SSR has the provision to collect a crash dump, this patch does not
>> support it.
> 
> "does not support it", wouldn't it be better to say "patch does not
> implement this"? As I presume the code you add here will indeed support
> the addition of the coredump collection code?

Yes, this patch does not implement crashdump, that is added in the next 
patch (this one seems large enough as it is).  There is an aspect of 
support in the protocol, where the host can reject the dump.  Wording 
could be better.

> 
>>
>> Co-developed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Co-developed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Co-developed-by: Troy Hanson <quic_thanson@quicinc.com>
>> Signed-off-by: Troy Hanson <quic_thanson@quicinc.com>
>> Co-developed-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Above are the list of authors who pair-programmed this patch.
> 
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> Then Jeff @ Codeaurora handled the patch.
> 
>> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> 
> And now you're handling the patch.
> 
> This mostly makes sense, except that the "main" author
> jhugo@codeaurora.org never signed-off the patch when he co-authored it,
> instead he did that as quic_jhugo. Then later jhugo@codeaurora.org
> handled the patch...

No, thats the origional SOB from me @CAF that you think "handled" the 
patch. Youssef's SOB is the first "handling" one.

Please see the example in Submitting Patches -

<changelog>

Co-developed-by: First Co-Author <first@coauthor.example.org>
Signed-off-by: First Co-Author <first@coauthor.example.org>
Co-developed-by: Second Co-Author <second@coauthor.example.org>
Signed-off-by: Second Co-Author <second@coauthor.example.org>
Signed-off-by: From Author <from@author.example.org>


> 
>> ---
>>   Documentation/accel/qaic/aic100.rst |  24 ++-
>>   drivers/accel/qaic/Makefile         |   1 +
>>   drivers/accel/qaic/qaic.h           |   9 +
>>   drivers/accel/qaic/qaic_data.c      |  61 +++++-
>>   drivers/accel/qaic/qaic_drv.c       |  17 ++
>>   drivers/accel/qaic/qaic_ssr.c       | 293 ++++++++++++++++++++++++++++
>>   drivers/accel/qaic/qaic_ssr.h       |  16 ++
>>   7 files changed, 412 insertions(+), 9 deletions(-)
>>   create mode 100644 drivers/accel/qaic/qaic_ssr.c
>>   create mode 100644 drivers/accel/qaic/qaic_ssr.h
>>
>> diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic/aic100.rst
>> index 273da6192fb3..3b287c3987d2 100644
>> --- a/Documentation/accel/qaic/aic100.rst
>> +++ b/Documentation/accel/qaic/aic100.rst
>> @@ -487,8 +487,8 @@ one user crashes, the fallout of that should be limited to that workload and not
>>   impact other workloads. SSR accomplishes this.
>>   
>>   If a particular workload crashes, QSM notifies the host via the QAIC_SSR MHI
>> -channel. This notification identifies the workload by it's assigned DBC. A
>> -multi-stage recovery process is then used to cleanup both sides, and get the
>> +channel. This notification identifies the workload by its assigned DBC. A
>> +multi-stage recovery process is then used to cleanup both sides, and gets the
>>   DBC/NSPs into a working state.
>>   
>>   When SSR occurs, any state in the workload is lost. Any inputs that were in
>> @@ -496,6 +496,26 @@ process, or queued by not yet serviced, are lost. The loaded artifacts will
>>   remain in on-card DDR, but the host will need to re-activate the workload if
>>   it desires to recover the workload.
>>   
>> +When SSR occurs for a specific NSP, the assigned DBC goes through the
>> +following state transactions in order:
>> +DBC_STATE_BEFORE_SHUTDOWN
>> +	Indicates that the affected NSP was found in an unrecoverable error
>> +	condition.
>> +DBC_STATE_AFTER_SHUTDOWN
>> +	Indicates that the NSP is under reset.
>> +DBC_STATE_BEFORE_POWER_UP
>> +	Indicates that the NSP's debug information has been collected, and is
>> +	ready to be collected by the host (if desired). At that stage the NSP
>> +	is restarted by QSM.
>> +DBC_STATE_AFTER_POWER_UP
>> +	Indicates that the NSP has been restarted, fully operational and is
>> +	in idle state.
>> +
>> +SSR also has an optional crashdump collection feature. If enabled, the host can
>> +collect the memory dump for the crashed NSP and dump it to the user space via
>> +the dev_coredump subsystem. The host can also decline the crashdump collection
>> +request from the device.
>> +
>>   Reliability, Accessibility, Serviceability (RAS)
>>   ================================================
>>   
>> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
>> index 8f6746e5f03a..71f727b74da3 100644
>> --- a/drivers/accel/qaic/Makefile
>> +++ b/drivers/accel/qaic/Makefile
>> @@ -11,6 +11,7 @@ qaic-y := \
>>   	qaic_data.o \
>>   	qaic_drv.o \
>>   	qaic_ras.o \
>> +	qaic_ssr.o \
>>   	qaic_sysfs.o \
>>   	qaic_timesync.o \
>>   	sahara.o
>> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
>> index 4c2f25249e95..3bd37b494d49 100644
>> --- a/drivers/accel/qaic/qaic.h
>> +++ b/drivers/accel/qaic/qaic.h
>> @@ -21,6 +21,7 @@
>>   
>>   #define QAIC_DBC_BASE		SZ_128K
>>   #define QAIC_DBC_SIZE		SZ_4K
>> +#define SSR_DBC_SENTINEL	U32_MAX /* No ongoing SSR sentinel */
> 
> Please continue using the QAIC_ prefix.
> 
>>   
>>   #define QAIC_NO_PARTITION	-1
>>   
>> @@ -195,6 +196,12 @@ struct qaic_device {
>>   	unsigned int		ue_count;
>>   	/* Un-correctable non-fatal error count */
>>   	unsigned int		ue_nf_count;
>> +	/* MHI SSR channel device */
>> +	struct mhi_device	*ssr_ch;
>> +	/* Work queue for tasks related to MHI SSR device */
>> +	struct workqueue_struct	*ssr_wq;
>> +	/* DBC which is under SSR. Sentinel U32_MAX would mean that no SSR in progress */
> 
> What prevents a second NSP from sending BEFORE_SHUTDOWN while you're
> currently processing a first one?

Currently the FW is designed to handle multiple SSR events sequentially. 
  Any kind of "parallelism" is a bug

> 
> Seems like you will stop failing requests on the first one, and then as
> soon as the first one recover (if it does) its signal will mark the
> second one as done...
> 
>> +	u32			ssr_dbc;
>>   };
>>   
>>   struct qaic_drm_device {
>> @@ -338,6 +345,8 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
>>   int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>   int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>   void irq_polling_work(struct work_struct *work);
>> +void dbc_enter_ssr(struct qaic_device *qdev, u32 dbc_id);
>> +void dbc_exit_ssr(struct qaic_device *qdev);
> 
> qaic_ prefix please.
> 
> Interestingly enough, there's only one "irq_polling_work" in the kernel,
> but it would be nice if that could get a prefix as well (in a separate
> patch).
> 
>>   
>>   /* qaic_sysfs.c */
>>   int qaic_sysfs_init(struct qaic_drm_device *qddev);
>> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
>> index c4f117edb266..018c97e7ab72 100644
>> --- a/drivers/accel/qaic/qaic_data.c
>> +++ b/drivers/accel/qaic/qaic_data.c
>> @@ -1023,6 +1023,11 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
>>   		goto unlock_ch_srcu;
>>   	}
>>   
>> +	if (dbc->id == qdev->ssr_dbc) {
>> +		ret = -EPIPE;
>> +		goto unlock_ch_srcu;
>> +	}
>> +
>>   	ret = qaic_prepare_bo(qdev, bo, &args->hdr);
>>   	if (ret)
>>   		goto unlock_ch_srcu;
>> @@ -1356,6 +1361,11 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
>>   		goto release_ch_rcu;
>>   	}
>>   
>> +	if (dbc->id == qdev->ssr_dbc) {
>> +		ret = -EPIPE;
>> +		goto release_ch_rcu;
>> +	}
>> +
>>   	ret = mutex_lock_interruptible(&dbc->req_lock);
>>   	if (ret)
>>   		goto release_ch_rcu;
>> @@ -1709,6 +1719,11 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
>>   		goto unlock_ch_srcu;
>>   	}
>>   
>> +	if (dbc->id == qdev->ssr_dbc) {
>> +		ret = -EPIPE;
>> +		goto unlock_ch_srcu;
>> +	}
>> +
>>   	obj = drm_gem_object_lookup(file_priv, args->handle);
>>   	if (!obj) {
>>   		ret = -ENOENT;
>> @@ -1729,6 +1744,9 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
>>   	if (!dbc->usr)
>>   		ret = -EPERM;
>>   
>> +	if (dbc->id == qdev->ssr_dbc)
>> +		ret = -EPIPE;
>> +
>>   put_obj:
>>   	drm_gem_object_put(obj);
>>   unlock_ch_srcu:
>> @@ -1927,6 +1945,17 @@ static void empty_xfer_list(struct qaic_device *qdev, struct dma_bridge_chan *db
>>   	spin_unlock_irqrestore(&dbc->xfer_lock, flags);
>>   }
>>   
>> +static void sync_empty_xfer_list(struct qaic_device *qdev, struct dma_bridge_chan *dbc)
>> +{
>> +	empty_xfer_list(qdev, dbc);
>> +	synchronize_srcu(&dbc->ch_lock);
>> +	/*
>> +	 * Threads holding channel lock, may add more elements in the xfer_list.
>> +	 * Flush out these elements from xfer_list.
>> +	 */
>> +	empty_xfer_list(qdev, dbc);
>> +}
>> +
>>   int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr)
>>   {
>>   	if (!qdev->dbc[dbc_id].usr || qdev->dbc[dbc_id].usr->handle != usr->handle)
>> @@ -1955,13 +1984,7 @@ void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id)
>>   	struct dma_bridge_chan *dbc = &qdev->dbc[dbc_id];
>>   
>>   	dbc->usr = NULL;
>> -	empty_xfer_list(qdev, dbc);
>> -	synchronize_srcu(&dbc->ch_lock);
>> -	/*
>> -	 * Threads holding channel lock, may add more elements in the xfer_list.
>> -	 * Flush out these elements from xfer_list.
>> -	 */
>> -	empty_xfer_list(qdev, dbc);
>> +	sync_empty_xfer_list(qdev, dbc);
> 
> Why was this block moved verbatim - it's still only used here.

Readability. We've observed the compiler will inline it just fine.

> 
>>   }
>>   
>>   void release_dbc(struct qaic_device *qdev, u32 dbc_id)
>> @@ -2002,3 +2025,27 @@ void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head, u32 *tail)
>>   	*head = readl(dbc->dbc_base + REQHP_OFF);
>>   	*tail = readl(dbc->dbc_base + REQTP_OFF);
>>   }
>> +
>> +/*
>> + * dbc_enter_ssr - Prepare to enter in sub system reset(SSR) for given DBC ID.
>> + *		   The device will automatically deactivate the workload as not
>> + *		   all errors can be silently recovered. The user will be
>> + *		   notified and will need to decide the required recovery
>> + *		   action to take.
>> + * @qdev: qaic device handle
>> + * @dbc_id: ID of the DBC which will enter SSR
> 
> This is almost kernel-doc, please read
> https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
> and adjust accordingly.
> 
> 
> How about prefixing global functions qaic_?
> 
>> + */
>> +void dbc_enter_ssr(struct qaic_device *qdev, u32 dbc_id)
>> +{
>> +	qdev->ssr_dbc = dbc_id;
>> +	release_dbc(qdev, dbc_id);
>> +}
>> +
>> +/*
>> + * dbc_exit_ssr - Prepare to exit from sub system reset(SSR) for given DBC ID
> 
> Also almost kernel-doc.
> 
> What does it mean to "exit from sub system restart"? Boot the device up
> again? Or are we saying that we're done with the restart and can start
> accepting work again?

Yes, we are done with the restart and can start accepting work again. 
Could be better stated.

> 
>> + * @qdev: qaic device handle
>> + */
>> +void dbc_exit_ssr(struct qaic_device *qdev)
>> +{
>> +	qdev->ssr_dbc = SSR_DBC_SENTINEL;
>> +}
>> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
>> index a8a16f20320f..4aac8d1eba8c 100644
>> --- a/drivers/accel/qaic/qaic_drv.c
>> +++ b/drivers/accel/qaic/qaic_drv.c
>> @@ -30,6 +30,7 @@
>>   #include "qaic.h"
>>   #include "qaic_debugfs.h"
>>   #include "qaic_ras.h"
>> +#include "qaic_ssr.h"
>>   #include "qaic_timesync.h"
>>   #include "sahara.h"
>>   
>> @@ -390,6 +391,7 @@ void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
>>   	qaic_notify_reset(qdev);
>>   
>>   	/* start tearing things down */
>> +	clean_up_ssr(qdev);
>>   	for (i = 0; i < qdev->num_dbc; ++i)
>>   		release_dbc(qdev, i);
>>   }
>> @@ -439,11 +441,18 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev,
>>   	qdev->qts_wq = qaicm_wq_init(drm, "qaic_ts");
>>   	if (IS_ERR(qdev->qts_wq))
>>   		return NULL;
>> +	qdev->ssr_wq = qaicm_wq_init(drm, "qaic_ssr");
>> +	if (IS_ERR(qdev->ssr_wq))
>> +		return NULL;
>>   
>>   	ret = qaicm_srcu_init(drm, &qdev->dev_lock);
>>   	if (ret)
>>   		return NULL;
>>   
>> +	ret = ssr_init(qdev, drm);
>> +	if (ret)
>> +		pci_info(pdev, "QAIC SSR crashdump collection not supported.\n");
>> +
>>   	qdev->qddev = qddev;
>>   	qdev->pdev = pdev;
>>   	qddev->qdev = qdev;
>> @@ -710,9 +719,16 @@ static int __init qaic_init(void)
>>   	ret = qaic_ras_register();
>>   	if (ret)
>>   		pr_debug("qaic: qaic_ras_register failed %d\n", ret);
>> +	ret = qaic_ssr_register();
>> +	if (ret) {
>> +		pr_debug("qaic: qaic_ssr_register failed %d\n", ret);
>> +		goto free_bootlog;
>> +	}
>>   
>>   	return 0;
>>   
>> +free_bootlog:
>> +	qaic_bootlog_unregister();
>>   free_mhi:
>>   	mhi_driver_unregister(&qaic_mhi_driver);
>>   free_pci:
>> @@ -738,6 +754,7 @@ static void __exit qaic_exit(void)
>>   	 * reinitializing the link_up state after the cleanup is done.
>>   	 */
>>   	link_up = true;
>> +	qaic_ssr_unregister();
>>   	qaic_ras_unregister();
>>   	qaic_bootlog_unregister();
>>   	qaic_timesync_deinit();
>> diff --git a/drivers/accel/qaic/qaic_ssr.c b/drivers/accel/qaic/qaic_ssr.c
>> new file mode 100644
>> index 000000000000..1ffb44767b3d
>> --- /dev/null
>> +++ b/drivers/accel/qaic/qaic_ssr.c
>> @@ -0,0 +1,293 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
>> +/* Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
> 
> Please use the new copyright statement.

That doesn't match the specific guidence I've gotten from our legal team 
in this specific case.

> 
>> +
>> +#include <asm/byteorder.h>
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_managed.h>
>> +#include <linux/device.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mhi.h>
>> +#include <linux/workqueue.h>
>> +
>> +#include "qaic.h"
>> +#include "qaic_ssr.h"
>> +
>> +#define MSG_BUF_SZ 32
> 
> This is a quite generic name, what does it actually size?
> 
>> +
>> +enum ssr_cmds {
>> +	DEBUG_TRANSFER_INFO =		BIT(0),
> 
> This isn't an "enumeration", so use #define.
> 
>> +	DEBUG_TRANSFER_INFO_RSP =	BIT(1),
>> +	MEMORY_READ =			BIT(2),
>> +	MEMORY_READ_RSP =		BIT(3),
>> +	DEBUG_TRANSFER_DONE =		BIT(4),
>> +	DEBUG_TRANSFER_DONE_RSP =	BIT(5),
>> +	SSR_EVENT =			BIT(8),
>> +	SSR_EVENT_RSP =			BIT(9),
>> +};
>> +
>> +enum ssr_events {
>> +	SSR_EVENT_NACK =	BIT(0),
> 
> Same here.
> 
>> +	BEFORE_SHUTDOWN =	BIT(1),
>> +	AFTER_SHUTDOWN =	BIT(2),
>> +	BEFORE_POWER_UP =	BIT(3),
>> +	AFTER_POWER_UP =	BIT(4),
>> +};
>> +
>> +struct _ssr_hdr {
>> +	__le32 cmd;
>> +	__le32 len;
>> +	__le32 dbc_id;
>> +};
>> +
>> +struct ssr_hdr {
>> +	u32 cmd;
>> +	u32 len;
>> +	u32 dbc_id;
>> +};
>> +
>> +struct ssr_debug_transfer_info {
> 
> This is unused.
> 
>> +	struct ssr_hdr hdr;
>> +	u32 resv;
>> +	u64 tbl_addr;
>> +	u64 tbl_len;
>> +} __packed;
>> +
>> +struct ssr_debug_transfer_info_rsp {
>> +	struct _ssr_hdr hdr;
>> +	__le32 ret;
>> +} __packed;
>> +
>> +struct ssr_memory_read {
> 
> Unused
> 
>> +	struct _ssr_hdr hdr;
>> +	__le32 resv;
>> +	__le64 addr;
>> +	__le64 len;
>> +} __packed;
>> +
>> +struct ssr_memory_read_rsp {
> 
> Unused
> 
>> +	struct _ssr_hdr hdr;
>> +	__le32 resv;
>> +	u8 data[];
>> +} __packed;
>> +
>> +struct ssr_debug_transfer_done {
> 
> Unused
> 
>> +	struct _ssr_hdr hdr;
>> +	__le32 resv;
>> +} __packed;
>> +
>> +struct ssr_debug_transfer_done_rsp {
> 
> Unused
> 
>> +	struct _ssr_hdr hdr;
>> +	__le32 ret;
>> +} __packed;
>> +
>> +struct ssr_event {
>> +	struct ssr_hdr hdr;
>> +	u32 event;
> 
> Some of these structs are expressed in little endian and some in native
> endian. I believe this relates to some of them being sent over the wire
> and some being used in the driver only.
> 
> It would be nice if there was a hint other than "does the struct have
> __leXY types" to indicate this - or at least group them accordingly.
> 
>> +} __packed;
>> +
>> +struct ssr_event_rsp {
>> +	struct _ssr_hdr hdr;
>> +	__le32 event;
>> +} __packed;
>> +
>> +struct ssr_resp {
>> +	/* Work struct to schedule work coming on QAIC_SSR channel */
> 
> Wouldn't it be cleaner to use kernel-doc style and document this above
> the struct?

It is an internal structure. What is the value in having this 
documentation end up on docs.kernel.og?

> 
>> +	struct work_struct work;
>> +	/* Root struct of device, used to access device resources */
>> +	struct qaic_device *qdev;
>> +	/* Buffer used by MHI for transfer requests */
>> +	u8 data[] __aligned(8);
>> +};
>> +
>> +void clean_up_ssr(struct qaic_device *qdev)
> 
> That's a pretty generic name for a globally accessible function.
> 
>> +{
>> +	dbc_exit_ssr(qdev);
>> +}
>> +
>> +static void ssr_worker(struct work_struct *work)
>> +{
>> +	struct ssr_resp *resp = container_of(work, struct ssr_resp, work);
>> +	struct ssr_hdr *hdr = (struct ssr_hdr *)resp->data;
>> +	struct ssr_debug_transfer_info_rsp *debug_rsp;
>> +	struct qaic_device *qdev = resp->qdev;
>> +	struct ssr_event_rsp *event_rsp;
>> +	struct dma_bridge_chan *dbc;
>> +	struct ssr_event *event;
>> +	u32 ssr_event_ack;
>> +	int ret;
>> +
>> +	le32_to_cpus(&hdr->cmd);
>> +	le32_to_cpus(&hdr->len);
>> +	le32_to_cpus(&hdr->dbc_id);
>> +
>> +	if (hdr->len > MSG_BUF_SZ)
>> +		goto out;
>> +
>> +	if (hdr->dbc_id >= qdev->num_dbc)
> 
> Isn't this bad? Does it warrant a comment? Or perhaps dev_dbg() so you
> know in testing if this ever happens?
> 
>> +		goto out;
>> +
>> +	dbc = &qdev->dbc[hdr->dbc_id];
>> +
>> +	switch (hdr->cmd) {
>> +	case DEBUG_TRANSFER_INFO:
>> +		/* Decline crash dump request from the device */
>> +		debug_rsp = kmalloc(sizeof(*debug_rsp), GFP_KERNEL);
>> +		if (!debug_rsp)
>> +			break;
>> +
>> +		debug_rsp->hdr.cmd = cpu_to_le32(DEBUG_TRANSFER_INFO_RSP);
>> +		debug_rsp->hdr.len = cpu_to_le32(sizeof(*debug_rsp));
>> +		debug_rsp->hdr.dbc_id = cpu_to_le32(event->hdr.dbc_id);
>> +		debug_rsp->ret = cpu_to_le32(1);
>> +
>> +		ret = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE,
>> +				    debug_rsp, sizeof(*debug_rsp), MHI_EOT);
>> +		if (ret) {
>> +			pci_warn(qdev->pdev, "Could not send DEBUG_TRANSFER_INFO_RSP %d\n", ret);
>> +			kfree(debug_rsp);
>> +		}
>> +		return;
>> +	case SSR_EVENT:
>> +		event = (struct ssr_event *)hdr;
>> +		le32_to_cpus(&event->event);
> 
> Leftover?
> 
>> +		ssr_event_ack = event->event;
>> +
>> +		switch (event->event) {
>> +		case BEFORE_SHUTDOWN:
>> +			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_BEFORE_SHUTDOWN);
>> +			dbc_enter_ssr(qdev, hdr->dbc_id);
>> +			break;
>> +		case AFTER_SHUTDOWN:
>> +			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_AFTER_SHUTDOWN);
>> +			break;
>> +		case BEFORE_POWER_UP:
>> +			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_BEFORE_POWER_UP);
>> +			break;
>> +		case AFTER_POWER_UP:
>> +			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_AFTER_POWER_UP);
>> +			break;
>> +		default:
>> +			break;
>> +		}
>> +
>> +		event_rsp = kmalloc(sizeof(*event_rsp), GFP_KERNEL);
>> +		if (!event_rsp)
>> +			break;
>> +
>> +		event_rsp->hdr.cmd = cpu_to_le32(SSR_EVENT_RSP);
>> +		event_rsp->hdr.len = cpu_to_le32(sizeof(*event_rsp));
>> +		event_rsp->hdr.dbc_id = cpu_to_le32(hdr->dbc_id);
>> +		event_rsp->event = cpu_to_le32(ssr_event_ack);
>> +
>> +		ret = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE, event_rsp, sizeof(*event_rsp),
>> +				    MHI_EOT);
>> +		if (ret)
>> +			kfree(event_rsp);
>> +
>> +		if (event->event == AFTER_POWER_UP) {
>> +			dbc_exit_ssr(qdev);
>> +			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_IDLE);
>> +		}
>> +
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +out:
>> +	ret = mhi_queue_buf(qdev->ssr_ch, DMA_FROM_DEVICE, resp->data, MSG_BUF_SZ, MHI_EOT);
>> +	if (ret)
>> +		kfree(resp);
>> +}
>> +
>> +static int qaic_ssr_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
>> +{
>> +	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
>> +	struct ssr_resp *resp;
>> +	int ret;
>> +
>> +	ret = mhi_prepare_for_transfer(mhi_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	resp = kzalloc(sizeof(*resp) + MSG_BUF_SZ, GFP_KERNEL);
>> +	if (!resp) {
>> +		mhi_unprepare_from_transfer(mhi_dev);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	resp->qdev = qdev;
>> +	INIT_WORK(&resp->work, ssr_worker);
>> +
>> +	ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, resp->data, MSG_BUF_SZ, MHI_EOT);
>> +	if (ret) {
>> +		kfree(resp);
>> +		mhi_unprepare_from_transfer(mhi_dev);
>> +		return ret;
>> +	}
>> +
>> +	dev_set_drvdata(&mhi_dev->dev, qdev);
>> +	qdev->ssr_ch = mhi_dev;
>> +
>> +	return 0;
>> +}
>> +
>> +static void qaic_ssr_mhi_remove(struct mhi_device *mhi_dev)
>> +{
>> +	struct qaic_device *qdev;
>> +
>> +	qdev = dev_get_drvdata(&mhi_dev->dev);
>> +	mhi_unprepare_from_transfer(qdev->ssr_ch);
> 
> Please confirm that this will free the ssr_resp object you allocated in
> probe.

Yes.  Unprepare for transfer will cause the xfer callback to be called 
on every queued buffer, with an error code. The callback in this code 
frees the buffer in that instance.

> 
>> +	qdev->ssr_ch = NULL;
>> +}
>> +
>> +static void qaic_ssr_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
>> +{
>> +	kfree(mhi_result->buf_addr);
>> +}
>> +
>> +static void qaic_ssr_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
>> +{
>> +	struct ssr_resp *resp = container_of(mhi_result->buf_addr, struct ssr_resp, data);
>> +	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
>> +
>> +	if (mhi_result->transaction_status) {
>> +		kfree(resp);
>> +		return;
>> +	}
>> +	queue_work(qdev->ssr_wq, &resp->work);
>> +}
>> +
>> +static const struct mhi_device_id qaic_ssr_mhi_match_table[] = {
>> +	{ .chan = "QAIC_SSR", },
>> +	{},
>> +};
>> +
>> +static struct mhi_driver qaic_ssr_mhi_driver = {
>> +	.id_table = qaic_ssr_mhi_match_table,
>> +	.remove = qaic_ssr_mhi_remove,
>> +	.probe = qaic_ssr_mhi_probe,
>> +	.ul_xfer_cb = qaic_ssr_mhi_ul_xfer_cb,
>> +	.dl_xfer_cb = qaic_ssr_mhi_dl_xfer_cb,
>> +	.driver = {
>> +		.name = "qaic_ssr",
>> +	},
>> +};
>> +
>> +int ssr_init(struct qaic_device *qdev, struct drm_device *drm)
> 
> Same as clean_up_ssr(), other functions are prefixed "qaic_" why not
> these?
> 
> Why does this function take the drm_device?
> 
> 
>> +{
>> +	qdev->ssr_dbc = SSR_DBC_SENTINEL;
>> +	return 0;
>> +}
>> +
>> +int qaic_ssr_register(void)
>> +{
>> +	return mhi_driver_register(&qaic_ssr_mhi_driver);
>> +}
>> +
>> +void qaic_ssr_unregister(void)
>> +{
>> +	mhi_driver_unregister(&qaic_ssr_mhi_driver);
>> +}
>> diff --git a/drivers/accel/qaic/qaic_ssr.h b/drivers/accel/qaic/qaic_ssr.h
>> new file mode 100644
>> index 000000000000..7de1eb4086cd
>> --- /dev/null
>> +++ b/drivers/accel/qaic/qaic_ssr.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only
>> + *
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2021, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> Please use the new copyright statement.
> 
>> + */
>> +
>> +#ifndef __QAIC_SSR_H__
>> +#define __QAIC_SSR_H__
>> +
>> +#include <drm/drm_device.h>
>> +
> 
> You don't need drm/drm_device.h, and I presume it doesn't give you
> struct qaic_device?
> 
> Instead just do:
> 
> struct drm_device;
> struct qaic_device;
> 
> Regards,
> Bjorn
> 
>> +int qaic_ssr_register(void);
>> +void qaic_ssr_unregister(void);
>> +void clean_up_ssr(struct qaic_device *qdev);
>> +int ssr_init(struct qaic_device *qdev, struct drm_device *drm);
>> +#endif /* __QAIC_SSR_H__ */
>> -- 
>> 2.43.0
>>
>>

