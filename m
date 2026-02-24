Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPMXEIIdnWm/MwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 04:39:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04F31816FA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 04:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4095710E499;
	Tue, 24 Feb 2026 03:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fL9LfETQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhtgQ+tS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3A710E4A1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 03:39:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O3LPdm1626728
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 03:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KILrgs7d74mR23o2eIzLn2FfkB9mDLXK+R0lgubWZsM=; b=fL9LfETQS8Vb/1Xl
 jdJ4gaRZDr8qxINFPzWmOkXDWsoNl64GHSh9uT6icfJfocI69K0govoY/vLEp9Uj
 CQ3+L2j1FpVamayYUciAA9KGg62JWBozxHfk8SZbhbl1bLTFg/z38s/DdkOZcjJn
 5F2lgvkmXObVr7Fely/OBCEQ6muoRdp/b7rrIgJFNgm4HYUvZ7ym23a1w13eE029
 DBhTaP8LkwlQm0/cEo9+EYVXYE2lBZbZvufVvhaIuxbOFKiXazG4rEReRG7Bnt3o
 +NlKc6YJODZ0CbjBOnMqDYETH8RoXITeca4ByZl7YG3cq2nH9inbwRfto+EhaSkO
 BHurCg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn81arkf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 03:39:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2bda35eab74so614485eec.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771904380; x=1772509180;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KILrgs7d74mR23o2eIzLn2FfkB9mDLXK+R0lgubWZsM=;
 b=BhtgQ+tS8KabT73E7P8VwLdr2MNydmwbc9TMRwIDLHghSz6MofEo9mCa8pi1BLynsC
 1ZJ+f0RCiQBx9eTR43cuAzQZC3905ko8iiku30yJPpG8idzapoTXHDHh58+Rhn1c3fg/
 NOcy/K+yD73/yoZfm6zFwEL4I7gF1/YQQZV+M9VcS1UBxGT/43uAF077sbZg0Hb2theN
 GOv7ozSPqJQCY2AGqIoE0Y3vJotG45QFzMO6zx47aDj8yW5Ce/VXrYh7Wjm6LhWVY++9
 JzMwhWaNiOEREnTRTbt9A0fX4LgJdvDQ0rnhIjWPL49CIquE9ihk812wQ8VeJG8v4Kvt
 pg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771904380; x=1772509180;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KILrgs7d74mR23o2eIzLn2FfkB9mDLXK+R0lgubWZsM=;
 b=F678tfnMY1VuHy6hWsvcC9XcranF+yAvdj9ADzpe+sZOvkEwmOpvuTAgGGjhSOO94e
 9p/Xbxb4CPw/fFjwc4hHSMahaTY2+2i/4rEo9Xkxnpf0OwSiYw64E7q89YvQcJ4GDCCS
 9t0vQcot5alwC8cBTK3wRbe7kc7KGxGAsBV4NDFn25ymA14pZBO0ZdwjGk2lV2hO1DQ7
 o8lS1TA41qTBnKTZPnWmI/rHJFI9RG1cD6KLrWIwT98JeFWbYr9NqgD/Ns+CYfX5A9G4
 RTZymOFtkvmI3zt8Tb6C/TKx/JvciX99ynAC9YJKNUAfdkw/D5EmIUNqYcxvyonK8gFT
 H13Q==
X-Gm-Message-State: AOJu0Yz8CjX4laTykxEYkxV3VpPkeqHTN3cRvUjIbch6lwKZ7JXX6BP1
 mRkDVVwA0WRNRe0SK1uI1fQ7O7Q9awkN6uNz2wC3qwQfaa/f0wZmlyzYrED8OgVmZrNV144Zy3Q
 kLNEpeoLFrzQQeVdIcPsDlR4hF+UTqh/S6ChtGbApQcjbstbo7OEI6Pa8K9ir8EHHJPydZSc=
X-Gm-Gg: ATEYQzwsG16n/fqOzl3Ws+MytaN3FnzkpIvNZfMiuDiJH+qhkF4EY93W3Gy7iHbZutr
 2o292r4A5Of+WWBVOT2upb9g92sx4hgY4xY8Tfe42lgkInTw+0kbQeKhvcj2T5SryZJI+T8RzPB
 m8gW9M2XyCt5ShzIbxBJ3PREx1WK+c5Yn2ArW75ceKlx8ZkL/YIHaYs0Xjb55NWdjuRUh0cbXfu
 wg2hhWxkWWQeEF0/ehCxmAYuuGPYsyXElx8jbGN70tTFIwImqVhKNR8dH0RTlsyRTx/LOYuIW0b
 LrqBJUkQzzP9BJ+En+LzG69oKE+Lc9L8ju2lPFFmid2RD2k75woJWiNBo8MFjYHhM/Y8CxiZhB+
 5NTlmGYgrGdbqu74KtVBpX2PshcgORNJ+BRbkmgHrl45ZEfYfAEjWLxs=
X-Received: by 2002:a05:7300:d4cb:b0:2b7:f2e5:11a4 with SMTP id
 5a478bee46e88-2bd7b89c2b7mr4123713eec.16.1771904379576; 
 Mon, 23 Feb 2026 19:39:39 -0800 (PST)
X-Received: by 2002:a05:7300:d4cb:b0:2b7:f2e5:11a4 with SMTP id
 5a478bee46e88-2bd7b89c2b7mr4123681eec.16.1771904379070; 
 Mon, 23 Feb 2026 19:39:39 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bd7da47778sm6089378eec.6.2026.02.23.19.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 19:39:38 -0800 (PST)
Message-ID: <cac08f2f-73b0-4629-898a-1e24840910fd@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:39:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8RDvSVNs8XOdDofJn3fhV89ED7MxCc6z
X-Proofpoint-ORIG-GUID: 8RDvSVNs8XOdDofJn3fhV89ED7MxCc6z
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699d1d7c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=aquNE3KFXbjoS9wDYHgA:9 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyOSBTYWx0ZWRfX2K+W30tBO6PD
 vMUXLJa4sh/tU741PuZcVgSDlJuSRCGip7SD1dbyAViLDtA5Hlcy8AlfvUQiAGy02CvNQdKK4Zu
 Nasxo0+UCkiZJfqeyOz9WfriFP+uCMrMS0cd4I3srAj9W0/JhfBaYJz0KPnaBHusVSTFF8P9gv/
 3jyoF0wDq+M3+cIkYkACfxfUW2q5m4MtwkhGARQ7aCm7fvSPi6bFok98mls/pmaocq8fBe5Qfrs
 S7ny1cFdXeCEhpWsCDmBIvfXJecsXBnaVu40iQA1QBELi1MhibM3/1PBidlMovouyVs/lrwxfNn
 TNUEH1aIgkNnzdk2QrqW9Pm6+K/caO3ZMQJfstNhlhi4/MmXQxo/pyLTHiO9SHaE6eqHhKBHCyP
 whxJe+WCkrE9A5HBxW8+8u9UR20ARMaY3EeVFtGkzvDzNmhYORH5qClYQbM0heE39Vvwfm7/B6H
 NfJOWVO9t9gCQdmMQ3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240029
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[trilokkumar.soni@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: A04F31816FA
X-Rspamd-Action: no action

On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
> * Userspace Interface: While the driver provides a new DRM-based UAPI,
>   the underlying FastRPC protocol and DSP firmware interface remain
>   compatible. This ensures that DSP firmware and libraries continue to
>   work without modification.


This is not very clear and it is not explained properly in the 1st patch
where you document this driver. It doesn't talk about how older
UAPI based application will still work without any change
or recompilation. I prefer the same old binary to work w/ the new
DRM based interface without any changes (I don't know how that will be possible)
OR if recompilation + linking is needed then you need to provide the wrapper library.

---Trilok Soni
