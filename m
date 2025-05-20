Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65079ABCEC7
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 07:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AD010E0B6;
	Tue, 20 May 2025 05:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pa0orcc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4139A10E0A7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 05:50:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JLX6x8022874
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 05:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Km24dUIRiYW8aOGNbg1DsjspZziPv5hT8ihdXJjpuKI=; b=Pa0orcc2Ha5EfEbi
 f/iYtzOr3XM0A1KpPbUB24rqCz3gAsFgWyZmdcpZT6cd/liO2Gv8te56Bw7bQNBv
 2l4aUUVEUxr2PmqmH+Fsvlm7ohGu4u3iz6DZHdxCEEXWeGypY3t4ehMHZOeG1NRt
 RtVaBlL7lDOjLI+CCUVDXm91nsAMI8hyatiRHI+8buvFcs6+zQNX55IXRj/KA+aF
 ilZrxqeMdSHHEWtHAM7P24wEqAqquUovnXcQoRwDzwAJ8Z30/LPVP8kgVDW7vZDX
 d5T9NPuNX7ISmOapXs2ohqtF/VmT1GxfC8nQfba7RbrA/gxYcSwN8+tvuwQrM3Jf
 W6qTYA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d2sdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 05:50:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-30e2bd11716so5325321a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 22:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747720234; x=1748325034;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Km24dUIRiYW8aOGNbg1DsjspZziPv5hT8ihdXJjpuKI=;
 b=oIM7dKp4AxNqlmgUPS/Lm45W6CA4Jl+gVT7AgzAuThtCqRGHCeJwaf/xafzssKyS/+
 5+m7YVEI77C5GgzRLvqCh+bAo+gH+v82j2c6b2++AV0LfafUH1r+uyFNkcxj5kZfolaQ
 cmP1tvIL864cTskGly9Unu+U7Ww0ByHgt2DordZxTPtYIbHTWtlaScLviF/uuMk5IPMa
 8q+X7+O9uprCZOEJ5qtTd2TcwnsUvBgEdbZzkdgLM4nPO1BaaPaMTJvXb60W87d8T/uo
 MvfQtCSeJP7Zd4WNxGLpkVDyl+5RuZIU89Fn7XX3v8bof1vSc8NuGDwolTzGvy7uiSq6
 pfCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN6va168OdxiEO+fpXku89opcFYrNmgFw51HBaG9Q/jGgbhFK3euFqVGQHLb+G65SHkxSbXCd1rdQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhKju4B1dHe0+oEaIy9xEG61pVxeDkI9YjI+EVc2gEjVSxwj76
 5ZMN9960oyUCoAQVmxnGxWpNKTDRPryNqayJSW7O0Foe/4Zw32zg0gaLv9bfYpBoBRTnr/lODkn
 FszZ5e5mCjsOyNkbFmWZrpSrBmY2tqdHbdxmk1vcZ1ae8xTg/InafTDK4ylxU5RBon+VMvlI=
X-Gm-Gg: ASbGncs4O2j7h7dKzZmQqaz02M60I43OA7iKzNJs7946631c+zojEpGRZDtvsz3Jelp
 JmMBEuXwliMd5AvBdJ7+8ncp3iCdsWrTCpSdBqN3hXpXPHW4z5XZXGQXDXVoxl88m/cCOecAhl7
 keMtkjcf1Ugdl9Ixn/X61ExADC9J1ae87asMVsJ94f79D4SzkSSeoXFF+Kl//rxg0hGpiZPxksb
 dPKTWkXlnbVv6XG1f1zjlkSF06vpAjUtt1JMbv9N8sXMARgl2C50RmjecjCj41C8MzmBq1J1aUo
 G4Mdln8OoprdoyanlHZ93vbvWRwM0Jr4j9NXsg==
X-Received: by 2002:a17:90b:3b8f:b0:2ee:f677:aa14 with SMTP id
 98e67ed59e1d1-30e830ebf2cmr22720470a91.13.1747720233937; 
 Mon, 19 May 2025 22:50:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBZXuHT9cFq7ul2z/CNCiWSV/jZQ/+36VmU/IwET4aSX4ZC+a5hPtAj6e+8aiVHHcONSHRaA==
X-Received: by 2002:a17:90b:3b8f:b0:2ee:f677:aa14 with SMTP id
 98e67ed59e1d1-30e830ebf2cmr22720448a91.13.1747720233503; 
 Mon, 19 May 2025 22:50:33 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30f365b2d80sm772308a91.4.2025.05.19.22.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 22:50:33 -0700 (PDT)
Message-ID: <af7d73b8-6907-4520-bf92-bff2065a5ac6@oss.qualcomm.com>
Date: Tue, 20 May 2025 11:20:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Fix channel resource access in
 device_open
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com>
 <cq3ib5nunqiuysyfezkrr5qkcqutwjxjmabpeihpsizbx5tmm4@rhhjhzaq5km4>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cq3ib5nunqiuysyfezkrr5qkcqutwjxjmabpeihpsizbx5tmm4@rhhjhzaq5km4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA0NiBTYWx0ZWRfX+UoUs+5DeqAY
 P+8hkP1Sjk9gSZGextx8iKCpuXg8kGR5MYqt5vQGCKHJH0gR4ZmZvfGDsExwGTR1+TT+4mxYdru
 UhhFa1zCEz+LSqEXy85UIGmySs2tjA1l4EpYsqb6LSpttb4nmYDznGz75ZakP6bLiy/VN6KCN5v
 2+1a4VsHknpo5w2FVRPpyEB8VWKqS1hc7ZfupRpC5CQfHVoZa0XzeuciDrp0xt68h9sOIa466JV
 Jkn8qbA3TPBPPum1jx4v7KTSR7j/SBcBwU4mBDSeghzPTs6VzJ99YK+KNUpnC+Uy3xGFbRj0sY7
 K/nwQUku8gAmnp2THINCFqS8gMFra87x0a1Zhc6OUqkc8XRiM2/x8weS91ELL40plXELYlQwN/b
 V0lT6JP6VZ/lLo2fBSod4pqR7iut1moxNaFwHvvjJZu2J+2//HXlbxvKPaqEdZn6GrKHcQPD
X-Proofpoint-GUID: J2Hut1wHAW9RUwUki0y1nvPV46WPyqO_
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682c182a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ormgAfd318N_yApGj20A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: J2Hut1wHAW9RUwUki0y1nvPV46WPyqO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200046
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



On 5/18/2025 4:33 PM, Dmitry Baryshkov wrote:
> On Sat, May 17, 2025 at 12:54:32PM +0530, Ekansh Gupta wrote:
>> During rpmsg_probe, fastrpc device nodes are created first, then
>> channel specific resources are initialized, followed by
>> of_platform_populate, which triggers context bank probing. This
>> sequence can cause issues as applications might open the device
>> node before channel resources are initialized or the session is
>> available, leading to problems. For example, spin_lock is initialized
>> after the device node creation, but it is used in device_open,
>> potentially before initialization. Add a check in device_open for
>> rpdev and update rpdev at the end of rpmsg_probe to resources are
>> available before applications allocate sessions.
> Can we fix this by registering the device node after initializing
> channel resources?
Ack.

Thanks.
>
>> Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 7b7a22c91fe4..40c7fa048ba7 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1568,6 +1568,9 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>  	fdevice = miscdev_to_fdevice(filp->private_data);
>>  	cctx = fdevice->cctx;
>>  
>> +	if (!cctx->rpdev)
>> +		return -ENODEV;
>> +
>>  	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
>>  	if (!fl)
>>  		return -ENOMEM;
>> @@ -2363,12 +2366,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	spin_lock_init(&data->lock);
>>  	idr_init(&data->ctx_idr);
>>  	data->domain_id = domain_id;
>> -	data->rpdev = rpdev;
>>  
>>  	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
>>  	if (err)
>>  		goto populate_error;
>>  
>> +	data->rpdev = rpdev;
>> +
>>  	return 0;
>>  
>>  populate_error:
>> -- 
>> 2.34.1
>>

