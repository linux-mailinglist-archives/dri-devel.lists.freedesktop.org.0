Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9690669E01
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE7D10EA67;
	Fri, 13 Jan 2023 16:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EEA10EA5F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 16:28:16 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30DFU88s018607; Fri, 13 Jan 2023 16:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jEfB/Tc1yJklN8Jg2267+4xJaoH0whasC/34rR3keNA=;
 b=L8HfcrjqaVmTROi/ym4kdbHQzxr0s7hm5/f2Kzk3iOsi0axeG1TjgSlLmLjl3TDGIyOK
 f51dirM+RBxe8DPIFH7HCKscW8pKs5hC8zkNkwwF70MWFnh6oQCEdKXuzo7UU6HDPw08
 lildRnecxG5nqVIdWNP7xHLEvpUk0yGgaUEmEe6rI6uVgNNNvhwOYnCk5GOGm9fOehWJ
 S5GDv0/Do6I6TNZWP/V6qJfAfw0GoGot6X7Fw5KMIkGmOEvbkehuV28RZNge+36zj5Ej
 /B0ZgsiLqZraxtS2Ds9kdHDXft/JJi2HZTk5L/69B0CaoWKvKypRk7Fda7lBHwD/3tEe fQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2wqw1t5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 16:28:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30DGSBGo010131
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 16:28:11 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 13 Jan
 2023 08:28:10 -0800
Message-ID: <f01c35cf-f5dc-407e-b205-6bff5991345f@quicinc.com>
Date: Fri, 13 Jan 2023 09:28:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <oded.gabbay@gmail.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <tzimmermann@suse.de>
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
 <20230109122344.253994-2-jacek.lawrynowicz@linux.intel.com>
 <2c8f58f3-1294-1c36-72c1-55349ff28309@quicinc.com>
 <acbba7d4-1c38-a3b2-9d51-1a8cd51f15ab@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <acbba7d4-1c38-a3b2-9d51-1a8cd51f15ab@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6moavliqmbi5QAc42-Wvgs_1KLLSrk85
X-Proofpoint-ORIG-GUID: 6moavliqmbi5QAc42-Wvgs_1KLLSrk85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_07,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130109
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
Cc: andrzej.kacprowski@linux.intel.com,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/2023 1:23 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 12.01.2023 18:34, Jeffrey Hugo wrote:
>> On 1/9/2023 5:23 AM, Jacek Lawrynowicz wrote:
>>> VPU stands for Versatile Processing Unit and it's a CPU-integrated
>>> inference accelerator for Computer Vision and Deep Learning
>>> applications.
>>>
>>> The VPU device consist of following components:
>>>     - Buttress - provides CPU to VPU integration, interrupt, frequency and
>>>       power management.
>>>     - Memory Management Unit (based on ARM MMU-600) - translates VPU to
>>>       host DMA addresses, isolates user workloads.
>>>     - RISC based microcontroller - executes firmware that provides job
>>>       execution API for the kernel-mode driver
>>>     - Neural Compute Subsystem (NCS) - does the actual work, provides
>>>       Compute and Copy engines.
>>>     - Network on Chip (NoC) - network fabric connecting all the components
>>>
>>> This driver supports VPU IP v2.7 integrated into Intel Meteor Lake
>>> client CPUs (14th generation).
>>>
>>> Module sources are at drivers/accel/ivpu and module name is
>>> "intel_vpu.ko".
>>>
>>> This patch includes only very besic functionality:
>>>     - module, PCI device and IRQ initialization
>>>     - register definitions and low level register manipulation functions
>>>     - SET/GET_PARAM ioctls
>>>     - power up without firmware
>>>
>>> Co-developed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>>> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>
>> Reviewed-by: Jeffrey Hugo <quic_jhugo2quicinc.com>
>>
>>> +static const struct file_operations ivpu_fops = {
>>> +    .owner        = THIS_MODULE,
>>> +    .open        = accel_open,
>>> +    .release    = drm_release,
>>> +    .unlocked_ioctl    = drm_ioctl,
>>> +    .compat_ioctl    = drm_compat_ioctl,
>>> +    .poll        = drm_poll,
>>> +    .read        = drm_read,
>>> +    .llseek        = noop_llseek,
>>> +    .mmap           = drm_gem_mmap
>>> +};
>>
>> Hmm DEFINE_DRM_ACCEL_FOPS is not usable here because it doesn't define .mmap
>> Feels like we should fix that and then simplify this.  Seems like a good todo item.
> 
> I think this should rather be on accel/drm TODO and not ivpu TODO list.
> For the moment I can simplify the code to this:
> static const struct file_operations ivpu_fops = {
> 	.owner		= THIS_MODULE,
> 	.mmap           = drm_gem_mmap,
> 	DRM_ACCEL_FOPS,
> };
> 
> Still not perfect but nicer.
> 
> Regards,
> Jacek
> 

Yep, it looked like you could do that simplification but it didn't seem 
worth it to spin a v6 for this.  However since you seem to be planning a 
v6 anyways, rolling in this simplification would be nice.

Also, I'm sorry, I didn't mean to imply that the DEFINE_DRM_ACCEL_FOPS 
in on the ivpu todo.  I was thinking more in general terms.

Actually, I'll take that up and post a patch next week.  We'll see what 
the reaction is.  I don't intend for it to be a dependency for you. 
Feels like a quick thing to get done so it is not something the next 
person trips over (probably me) and we can link up all the pieces when 
both FOPS and ivpu are available.

-Jeff
