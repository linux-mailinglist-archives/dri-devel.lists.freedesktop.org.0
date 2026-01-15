Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B0FD29485
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 00:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B186010E191;
	Thu, 15 Jan 2026 23:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPn2MLfO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V55ffyyu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6200510E0CA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:39:07 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMbQAc3714357
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lVjbzz/3UHEVM8eIBqM6zUUfmDnOkJGwAR300ilUdt4=; b=bPn2MLfO8ccKF5M8
 qvd2qjQQrp50ki2vtg/RzgT6tI/H5n79pMFFv5JgXXSr2msxraHJksMAOR7Cj694
 AvzN+HYRvu/4fgS0z67SUH1TWyHBzmxqp90u2ANowc4hBuvn9wzTWBnZlUNq2RRv
 RR4JnbPUV9ET4uK3tjcOCU2FWDq5W7/cFhwJP+KiXE7I+U34BMafWV5s3pbHD+fc
 2DAWk4nXjdjISloXd3Jj6r3oP0etj45TsZRKObtLMrh4brf6ycbo2wngG6/2pcNE
 lcpG4lgv79zwEXqj8c0JIVI3Rv8BCGQnLQrGmtQkBrtZBmVldVN8ML5ezT/KkD0+
 vxpR0w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96p83yr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:39:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2ae29a21e7eso1639547eec.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 15:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768520346; x=1769125146;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lVjbzz/3UHEVM8eIBqM6zUUfmDnOkJGwAR300ilUdt4=;
 b=V55ffyyu/sGeQIte/wmpwP2UeoD7CRDHSrAJkacmQuMGXhwaVSx2uFRqy1gfpSiFOo
 vXtNirDwrkJN+tER9VQrdHsTcscVxfzYlsEel6zZP3ULK6Vna4dMVpcXBkjBP/12k5MZ
 fVbpWx9pFGeqh5fC8Yp04y1IQoa4jQPI6wQzPqV0Ghfgg2swb0uRrEdA9N/GPy4Kosjh
 KLdvozFNvOXzefF15Ej4/6ZUwl2s9Xj4ksk8UHU6N47FcIIWlMRlr8uG1ZsYMgaPp8bY
 7AJT7rPS29e2kxqM7QqqTjw89SuZ4hcL1wsWQ0lWBIGife/aetBkRN40KqwbjXymzikl
 5acA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768520346; x=1769125146;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lVjbzz/3UHEVM8eIBqM6zUUfmDnOkJGwAR300ilUdt4=;
 b=Wj45lFB8sYqCWuCLlQxlSh+OL8i9Voa2whg3lCGDNdPzBKkfj8Hac860uZSn+F/pXk
 ++6vyn5koGPy0NB0Npef2UmGZm7nO/M3rHGoVOBVO8fWdt0qsyagRnYUpRbewgAJRL6h
 jicv+XDz1dNVhlJ8aZC2DZqRcKAbDelYMQJQZmAZ2ppXfDy3+o1EEUUxXO2AkV/RemNI
 RbQ0o69tQy56FtoGwqId4z6yDNllQEOuIlfST2Gt0Cws/wcBiUoSaRrfzaPEP+ke0ap7
 zjB+og0HHZOHTUlnqDZsy0E72B+gfsPiTe/GF03zBrJw1dhksaRPTHum2UOKHRjUzMYw
 BFdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoFDKKeUkUiIT2MlTxO0/rok88Ut/6TBFQ9yyOVrnB1hBpXOVfCIcVD9X6aqdAJeOlGb2cjat0j9Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBLLuTtmBWVY7eXHba5At/lefTc2+mnbYnui8vPuvI0V4wD77c
 mClFJnRgPZAargE2Flz2jkahzvmwI6TR+CB5mmvEmK92R1/rpRlO/1A51s9ON10wszWSxBSEhfK
 7Iig6sYVgCNLwqeJCQF255Nyh2BaJkXyidhTqZQZ/kUAYAMm8fnysPSPQ/Z8IDK9kga8XXyQ=
X-Gm-Gg: AY/fxX5omcNhm2N1L5fwtgwLRedjERNqSuiWg5Cgl+SC2xfhX3eNuAJBfdbKX8b7zsL
 d0mv9SNlQmAY1z6P1SNG+e5ZUjegsM5FJY52f4SUPrN2QNr27vyBEh68ol3Udo+NxRXpU8I1Jmo
 uw+21HlbcdEpXjN426WUtq2PM0Nh9NAsQGMTJDax4MhGSceuikNv2ui9Mh6yDk11+0+4mbCfjkN
 UC74CrdHzF7NTRblVUknajn+Z24adDiXTnsATvF0TrGVr1aEqBlEGd7+l/YTrzmd24KM+kAipUK
 wfV7IqDYzblRhWFjXEIM/prR+P4aF1UPk/MBDMV6X7XCDogqnZqiVSJ1wJb3lTxrxF1baVF/rIq
 D1g+XybGG/QPzzE7HmLMeMqDSnPcCuzfMAEXRANdv7oSiD2V1cHWcCHcWIUU1w6ac0YxU/ZBd
X-Received: by 2002:a05:7300:5353:b0:2ab:f490:79f9 with SMTP id
 5a478bee46e88-2b6b35a1060mr1489629eec.21.1768520345993; 
 Thu, 15 Jan 2026 15:39:05 -0800 (PST)
X-Received: by 2002:a05:7300:5353:b0:2ab:f490:79f9 with SMTP id
 5a478bee46e88-2b6b35a1060mr1489590eec.21.1768520345345; 
 Thu, 15 Jan 2026 15:39:05 -0800 (PST)
Received: from [10.226.49.150] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6b3682540sm699712eec.34.2026.01.15.15.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 15:39:05 -0800 (PST)
Message-ID: <919c0b7e-83d7-45e8-ae96-d9fb7a10995c@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 16:39:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/ras: Introduce the DRM RAS infrastructure over
 generic netlink
To: Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, joonas.lahtinen@linux.intel.com,
 lukas@wunner.de, simona.vetter@ffwll.ch, airlied@gmail.com,
 pratik.bari@intel.com, joshua.santosh.ranjan@intel.com,
 ashwin.kumar.kulkarni@intel.com, shubham.kumar@intel.com,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 "David S. Miller" <davem@davemloft.net>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-7-riana.tauro@intel.com> <aTiWNkGmwFsxY-iO@intel.com>
 <b986eb03-0887-4eb2-a7a7-50ef63e51096@oss.qualcomm.com>
 <aWFruAO06O93ADjU@intel.com> <19fd4d44-b7d6-4bc2-9255-3d5159ec1435@intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <19fd4d44-b7d6-4bc2-9255-3d5159ec1435@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE4NyBTYWx0ZWRfX+gDrOLlotZmt
 X9Rb8PsapzPqDWLJCXg15pBnUljml8j/MpD0or9ZDZtLpRsDfCKQyyPNgFHC/g23MRxFbzbl7IP
 5E9Pk1h9wVSCZ4cRMDh1bc9H6NjwOGsm1C4NtzGmenOIodqslbJnnH7oO9lj4vEq758RSSNXhfZ
 vLjw7BY4LsWgHdb79QISOSZI7Qgm1F7A6r+zE+R4R7n7uBPZQkRygN18/SH63FgzETrWZHXcafH
 TOO22mho6SsHwv2q9qTN4jsXIW/EY8G/wGSbhxmtMvZN4tyrNeeN27qm9m+XBK731EoCkNW5BBV
 UFw86tdXHhdR5qwMgmVGDDtrPsMCVnpQc9FEjGWDMlBnubE0gkyvSPLWhvgJELPYzSLzOYcU1Es
 /lEN8k6qI3w5i8pU/q1Tc+2iif+Qi3crBtiJu0ddt8az1QyhUZJrw3zXUiMxRCEbnP+8yM23VAA
 2TO9+shipWSQ1JPa6Rg==
X-Authority-Analysis: v=2.4 cv=M7ZA6iws c=1 sm=1 tr=0 ts=69697a9a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=WFVl3Mxyj1LltjsbROYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: RDQmMtWIOg8jPbQXyfxkWCX0yKZWqIfi
X-Proofpoint-ORIG-GUID: RDQmMtWIOg8jPbQXyfxkWCX0yKZWqIfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150187
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



On 1/13/2026 1:20 AM, Riana Tauro wrote:
>>>>> diff --git a/Documentation/netlink/specs/drm_ras.yaml b/ 
>>>>> Documentation/netlink/specs/drm_ras.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..be0e379c5bc9
>>>>> --- /dev/null
>>>>> +++ b/Documentation/netlink/specs/drm_ras.yaml
>>>>> @@ -0,0 +1,130 @@
>>>>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR 
>>>>> BSD-3-Clause)
>>>>> +---
>>>>> +name: drm-ras
>>>>> +protocol: genetlink
>>>>> +uapi-header: drm/drm_ras.h
>>>>> +
>>>>> +doc: >-
>>>>> +  DRM RAS (Reliability, Availability, Serviceability) over Generic 
>>>>> Netlink.
>>>>> +  Provides a standardized mechanism for DRM drivers to register 
>>>>> "nodes"
>>>>> +  representing hardware/software components capable of reporting 
>>>>> error counters.
>>>>> +  Userspace tools can query the list of nodes or individual error 
>>>>> counters
>>>>> +  via the Generic Netlink interface.
>>>>> +
>>>>> +definitions:
>>>>> +  -
>>>>> +    type: enum
>>>>> +    name: node-type
>>>>> +    value-start: 1
>>>>> +    entries: [error-counter]
>>>>> +    doc: >-
>>>>> +         Type of the node. Currently, only error-counter nodes are
>>>>> +         supported, which expose reliability counters for a 
>>>>> hardware/software
>>>>> +         component.
>>>>> +
>>>>> +attribute-sets:
>>>>> +  -
>>>>> +    name: node-attrs
>>>>> +    attributes:
>>>>> +      -
>>>>> +        name: node-id
>>>>> +        type: u32
>>>>> +        doc: >-
>>>>> +             Unique identifier for the node.
>>>>> +             Assigned dynamically by the DRM RAS core upon 
>>>>> registration.
>>>>> +      -
>>>>> +        name: device-name
>>>>> +        type: string
>>>>> +        doc: >-
>>>>> +             Device name chosen by the driver at registration.
>>>>> +             Can be a PCI BDF, UUID, or module name if unique.
>>>>> +      -
>>>>> +        name: node-name
>>>>> +        type: string
>>>>> +        doc: >-
>>>>> +             Node name chosen by the driver at registration.
>>>>> +             Can be an IP block name, or any name that identifies the
>>>>> +             RAS node inside the device.
>>>>> +      -
>>>>> +        name: node-type
>>>>> +        type: u32
>>>>> +        doc: Type of this node, identifying its function.
>>>>> +        enum: node-type
>>>>> +  -
>>>>> +    name: error-counter-attrs
>>>>> +    attributes:
>>>>> +      -
>>>>> +        name: node-id
>>>>> +        type: u32
>>>>> +        doc:  Node ID targeted by this error counter operation.
>>>>> +      -
>>>>> +        name: error-id
>>>>> +        type: u32
>>>>> +        doc: Unique identifier for a specific error counter within 
>>>>> an node.
>>>>> +      -
>>>>> +        name: error-name
>>>>> +        type: string
>>>>> +        doc: Name of the error.
>>>>> +      -
>>>>> +        name: error-value
>>>>> +        type: u32
>>>>> +        doc: Current value of the requested error counter.
>>>>> +
>>>>> +operations:
>>>>> +  list:
>>>>> +    -
>>>>> +      name: list-nodes
>>>>> +      doc: >-
>>>>> +           Retrieve the full list of currently registered DRM RAS 
>>>>> nodes.
>>>>> +           Each node includes its dynamically assigned ID, name, 
>>>>> and type.
>>>>> +           **Important:** User space must call this operation 
>>>>> first to obtain
>>>>> +           the node IDs. These IDs are required for all subsequent
>>>>> +           operations on nodes, such as querying error counters.
>>>
>>> I am curious about security implications of this design.
>>
>> hmm... very good point you are raising here.
>>
>> This current design relies entirely in the CAP_NET_ADMIN.
>> No driver would have the flexibility to choose anything differently.
>> Please notice that the flag admin-perm is hardcoded in this yaml file.
>>
>>> If the complete
>>> list of RAS nodes is visible for any process on the system (and one 
>>> wants to
>>> avoid requiring CAP_NET_ADMIN), there should be some way to enforce
>>> permission checks when performing these operations if desired.
>>
>> Right now, there's no way that the driver would choose not avoid 
>> requiring
>> CAP_NET_ADMIN...
>>
>> Only way would be the admin to give the cap_net_admin to the tool with:
>>
>> $ sudo setcap cap_net_admin+ep /bin/drm_ras_tool
>>
>> but not ideal and not granular anyway...
>>
>>>
>>> For example, this might be implemented in the driver's definition of
>>> callback functions like query_error_counter; some drivers may want to 
>>> ensure
>>> that the process can in fact open the file descriptor corresponding 
>>> to the
>>> queried device before serving a netlink request. Is it enough for a 
>>> driver
>>> to simply return -EPERM in this case? Any driver that doesnt wish to 
>>> protect
>>> its RAS nodes need not implement checks in their callbacks.
>>
>> Fair enough. If we want to give the option to the drivers, then we need:
>>
>> 1. to first remove all the admin-perm flags below and leave the driver to
>> pick up their policy on when to return something or -EPERM.
>> 2. Document this security responsibility and list a few possibilities.
>> 3. In our Xe case here I believe the easiest option is to use 
>> something like:
>>
>> struct scm_creds *creds = NETLINK_CREDS(cb->skb);
>> if (!gid_eq(creds->gid, GLOBAL_ROOT_GID))
>>      return -EPERM
> 
> The driver currently does not have access to the callback or the 
> skbuffer. Sending these details as param to driver won't be right as
> drm_ras needs to handle all the netlink buffers.
> 
> How about using pre_doit & start calls? If driver has a pre callback , 
> it's the responsibility of the driver to check permissions/any-pre 
> conditions, else the CAP_NET_ADMIN permission will be checked.
> 
> @Zack / @Rodrigo thoughts?
> @Zack Will this work for your usecase?
> 
> yaml
> +    dump:
> +        pre: drm-ras-nl-pre-list-nodes
> 
> 
> drm_ras.c :
> 
> +       if (node->pre_list_nodes)
> +                return node->pre_list_nodes(node);
> +
> +        return check_permissions(cb->skb);  //Checks creds
> 
> Thanks
> Riana
> 

I agree that a pre_doit is probably the best solution for this.

Not entirely sure what a driver specific implementation would look like 
yet, but I think that as long as the driver callback has a way to access 
the 'current' task_struct pointer corresponding to the user process then 
this approach seems like the best option from the netlink side.

Since this is mostly a concern for our specific use case, perhaps we can 
incorporate this functionality in our change down the road when we 
expand the interface for telemetry?

Let me know what you think.

Zack

>>
>> or something like that?!
>>
>> perhaps drivers could implement some form of cookie or pre- 
>> authorization with
>> ioctls or sysfs, and then store in the priv?
>>
>> Thoughts?
>> Other options?
>>
>>>
>>> I dont see any such permissions checks in your driver implementation 
>>> which
>>> is understandable given that it may not be necessary for your use cases.
>>> However, this would be a concern for our driver if we were to adopt this
>>> interface.
>>
>> yeap, this case was entirely with admin-perm, so not needed at all...
>> But I see your point and this is really not giving any flexibility to
>> other drivers.
>>

>>>>>
>>>
>>> Thanks,
>>>
>>> Zack
>>>
> 

