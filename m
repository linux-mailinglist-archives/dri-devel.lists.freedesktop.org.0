Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 586EB6C3D0E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 22:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2651810E875;
	Tue, 21 Mar 2023 21:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948C710E873
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 21:52:43 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32LLiXbn025654; Tue, 21 Mar 2023 21:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PcE667DJcFj2w9l1bNqMFrpNeZt6KZomaAf5kAvLTWs=;
 b=ewzvb9GGVoYKtO6jUd4vOUxnVbGq7TzjxdwuUUzWqU+KwBvAP7+o3R7DKlrK43+pim6j
 Ehw5d7vrE3OTyC5m/KwFHaYfRHes/WWt1pNbxv8SKIBURcFfAz8SS5DzkdMtJTlDUr1q
 2IeFI3Hb0bVSpHd300Vyuj6R+Z3lj0q0fCdC6dWgQ2ubreYREmxhZBkQ/RRcx9OQpUcE
 8luD92V1MLScszjPJBKthZD21+Q7FpPRqkkyWJ72W3SCyalSC4xEZidIg/w9o0ArzHsd
 f6T0r/wSTkqxNUN+de7uj62XzIa2mIgbVq7OL4dcBJ5NeaijLKlzKheZS2FSdKEnz7BW nA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfhnt0d6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 21:52:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32LLqDR2005084
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 21:52:13 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 21 Mar
 2023 14:52:12 -0700
Message-ID: <aa2ee071-952b-f8b5-bfcf-53cef99478be@quicinc.com>
Date: Tue, 21 Mar 2023 15:52:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 1/8] accel/qaic: Add documentation for AIC100
 accelerator driver
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, <ogabbay@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
 <jacek.lawrynowicz@linux.intel.com>, <stanislaw.gruszka@linux.intel.com>
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-2-git-send-email-quic_jhugo@quicinc.com>
 <ZBmxl0sFH5PBG36H@debian.me>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <ZBmxl0sFH5PBG36H@debian.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CTXKYs4fhOQYwhw_8NP8IU-72Ql6fzVO
X-Proofpoint-ORIG-GUID: CTXKYs4fhOQYwhw_8NP8IU-72Ql6fzVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210173
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
Cc: dafna@fastmail.com, linux-doc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/21/2023 7:31 AM, Bagas Sanjaya wrote:
> On Mon, Mar 20, 2023 at 09:11:07AM -0600, Jeffrey Hugo wrote:
>> +AIC100 defines a number of MHI channels for different purposes. This is a list
>> +of the defined channels, and their uses.
>> +
>> +| QAIC_LOOPBACK
>> +| Channels 0 & 1
>> +| Valid for AMSS
>> +| Any data sent to the device on this channel is sent back to the host.
>> +
>> +| QAIC_SAHARA
>> +| Channels 2 & 3
>> +| Valid for SBL
>> +| Used by SBL to obtain the runtime firmware from the host.
>> +
>> +| QAIC_DIAG
>> +| Channels 4 & 5
>> +| Valid for AMSS
>> +| Used to communicate with QSM via the Diag protocol.
>> +
>> +| QAIC_SSR
>> +| Channels 6 & 7
>> +| Valid for AMSS
>> +| Used to notify the host of subsystem restart events, and to offload SSR crashdumps.
>> +
>> +| QAIC_QDSS
>> +| Channels 8 & 9
>> +| Valid for AMSS
>> +| Used for the Qualcomm Debug Subsystem.
>> +
>> +| QAIC_CONTROL
>> +| Channels 10 & 11
>> +| Valid for AMSS
>> +| Used for the Neural Network Control (NNC) protocol.  This is the primary channel between host and
>> +  QSM for managing workloads.
>> +
>> +| QAIC_LOGGING
>> +| Channels 12 & 13
>> +| Valid for SBL
>> +| Used by the SBL to send the bootlog to the host.
>> +
>> +| QAIC_STATUS
>> +| Channels 14 & 15
>> +| Valid for AMSS
>> +| Used to notify the host of Reliability, Accessibility, Serviceability (RAS) events.
>> +
>> +| QAIC_TELEMETRY
>> +| Channels 16 & 17
>> +| Valid for AMSS
>> +| Used to get/set power/thermal/etc attributes.
>> +
>> +| QAIC_DEBUG
>> +| Channels 18 & 19
>> +| Valid for AMSS
>> +| Not used.
>> +
>> +| QAIC_TIMESYNC
>> +| Channels 20 & 21
>> +| Valid for SBL/AMSS
>> +| Used to synchronize timestamps in the device side logs with the host time source.
> 
> For the tabular data above, use table syntax instead.

Done.

>> +A request FIFO element has the following structure:
>> +
>> +| {
>> +|	u16 req_id;
>> +|	u8  seq_id;
>> +|	u8  pcie_dma_cmd;
>> +|	u32 reserved;
>> +|	u64 pcie_dma_source_addr;
>> +|	u64 pcie_dma_dest_addr;
>> +|	u32 pcie_dma_len;
>> +|	u32 reserved;
>> +|	u64 doorbell_addr;
>> +|	u8  doorbell_attr;
>> +|	u8  reserved;
>> +|	u16 reserved;
>> +|	u32 doorbell_data;
>> +|	u32 sem_cmd0;
>> +|	u32 sem_cmd1;
>> +|	u32 sem_cmd2;
>> +|	u32 sem_cmd3;
>> +| }
> 
> IMO code blocks should better fit the struct listing above.

Done

>> +
>> +Request field descriptions:
>> +
>> +| req_id- request ID. A request FIFO element and a response FIFO element with
>> +|         the same request ID refer to the same command.
>> +
>> +| seq_id- sequence ID within a request. Ignored by the DMA Bridge.
>> +
>> +| pcie_dma_cmd- describes the DMA element of this request.
>> +| 	Bit(7) is the force msi flag, which overrides the DMA Bridge MSI logic
>> +| 		and generates a MSI when this request is complete, and QSM
>> +| 		configures the DMA Bridge to look at this bit.
>> +| 	Bits(6:5) are reserved.
>> +| 	Bit(4) is the completion code flag, and indicates that the DMA Bridge
>> +| 		shall generate a response FIFO element when this request is
>> +| 		complete.
>> +| 	Bit(3) indicates if this request is a linked list transfer(0) or a bulk
>> +| 		transfer(1).
>> +| 	Bit(2) is reserved.
>> +| 	Bits(1:0) indicate the type of transfer. No transfer(0), to device(1),
>> +| 		from device(2). Value 3 is illegal.
>> +
>> +| pcie_dma_source_addr- source address for a bulk transfer, or the address of
>> +|         the linked list.
>> +
>> +| pcie_dma_dest_addr- destination address for a bulk transfer.
>> +
>> +| pcie_dma_len- length of the bulk transfer. Note that the size of this field
>> +| 	limits transfers to 4G in size.
>> +
>> +| doorbell_addr- address of the doorbell to ring when this request is complete.
>> +
>> +| doorbell_attr- doorbell attributes.
>> +| 	Bit(7) indicates if a write to a doorbell is to occur.
>> +| 	Bits(6:2) are reserved.
>> +| 	Bits(1:0) contain the encoding of the doorbell length. 0 is 32-bit,
>> +| 		1 is 16-bit, 2 is 8-bit, 3 is reserved. The doorbell address
>> +| 		must be naturally aligned to the specified length.
>> +
>> +| doorbell_data- data to write to the doorbell. Only the bits corresponding to
>> +| 	the doorbell length are valid.
>> +
>> +| sem_cmdN- semaphore command.
>> +| 	Bit(31) indicates this semaphore command is enabled.
>> +| 	Bit(30) is the to-device DMA fence. Block this request until all
>> +| 		to-device DMA transfers are complete.
>> +| 	Bit(29) is the from-device DMA fence. Block this request until all
>> +| 		from-device DMA transfers are complete.
>> +| 	Bits(28:27) are reserved.
>> +| 	Bits(26:24) are the semaphore command. 0 is NOP. 1 is init with the
>> +| 		specified value. 2 is increment. 3 is decrement. 4 is wait
>> +| 		until the semaphore is equal to the specified value. 5 is wait
>> +| 		until the semaphore is greater or equal to the specified value.
>> +| 		6 is "P", wait until semaphore is greater than 0, then
>> +| 		decrement by 1. 7 is reserved.
>> +| 	Bit(23) is reserved.
>> +| 	Bit(22) is the semaphore sync. 0 is post sync, which means that the
>> +| 		semaphore operation is done after the DMA transfer. 1 is
>> +| 		presync, which gates the DMA transfer. Only one presync is
>> +| 		allowed per request.
>> +| 	Bit(21) is reserved.
>> +| 	Bits(20:16) is the index of the semaphore to operate on.
>> +| 	Bits(15:12) are reserved.
>> +| 	Bits(11:0) are the semaphore value to use in operations.
> 
> What about bullet lists?

It doesn't feel like the above fits into a bullet list structure.  Do 
you have an example reference, or can you transform a small section of 
the above to illustrate what you are thinking?

>> +
>> +| {
>> +| 	u16 req_id;
>> +| 	u16 completion_code;
>> +| }
> 
> Again, use code blocks.

Done

>> +passthrough- Allows userspace to send an opaque payload directly to the QSM.
>> +This is used for NNC commands. Userspace is responsible for managing
>> +the QSM message requirements in the payload
>> +
>> +dma_xfer- DMA transfer. Describes an object that the QSM should DMA into the
>> +device via address and size tuples.
>> +
>> +activate- Activate a workload onto NSPs. The host must provide memory to be
>> +used by the DBC.
>> +
>> +deactivate- Deactivate an active workload and return the NSPs to idle.
>> +
>> +status- Query the QSM about it's NNC implementation. Returns the NNC version,
>> +and if CRC is used.
>> +
>> +terminate- Release a user's resources.
>> +
>> +dma_xfer_cont- Continuation of a previous DMA transfer. If a DMA transfer
>> +cannot be specified in a single message (highly fragmented), this
>> +transaction can be used to specify more ranges.
>> +
>> +validate_partition- Query to QSM to determine if a partition identifier is
>> +valid.
> 
> What about using definition lists?

Done

>> +DRM_IOCTL_QAIC_MANAGE:
>> +This IOCTL allows userspace to send a NNC request to the QSM. The call will
>> +block until a response is received, or the request has timed out.
>> +
>> +DRM_IOCTL_QAIC_CREATE_BO:
>> +This IOCTL allows userspace to allocate a buffer object (BO) which can send or
>> +receive data from a workload. The call will return a GEM handle that
>> +represents the allocated buffer. The BO is not usable until it has been sliced
>> +(see DRM_IOCTL_QAIC_ATTACH_SLICE_BO).
>> +
>> +DRM_IOCTL_QAIC_MMAP_BO:
>> +This IOCTL allows userspace to prepare an allocated BO to be mmap'd into the
>> +userspace process.
>> +
>> +DRM_IOCTL_QAIC_ATTACH_SLICE_BO:
>> +This IOCTL allows userspace to slice a BO in preparation for sending the BO to
>> +the device. Slicing is the operation of describing what portions of a BO get
>> +sent where to a workload. This requires a set of DMA transfers for the DMA
>> +Bridge, and as such, locks the BO to a specific DBC.
>> +
>> +DRM_IOCTL_QAIC_EXECUTE_BO:
>> +This IOCTL allows userspace to submit a set of sliced BOs to the device. The
>> +call is non-blocking. Success only indicates that the BOs have been queued
>> +to the device, but does not guarantee they have been executed.
>> +
>> +DRM_IOCTL_QAIC_PARTIAL_EXECUTE_BO:
>> +This IOCTL operates like DRM_IOCTL_QAIC_EXECUTE_BO, but it allows userspace to
>> +shrink the BOs sent to the device for this specific call. If a BO typically has
>> +N inputs, but only a subset of those is available, this IOCTL allows userspace
>> +to indicate that only the first M bytes of the BO should be sent to the device
>> +to minimize data transfer overhead. This IOCTL dynamically recomputes the
>> +slicing, and therefore has some processing overhead before the BOs can be queued
>> +to the device.
>> +
>> +DRM_IOCTL_QAIC_WAIT_BO:
>> +This IOCTL allows userspace to determine when a particular BO has been processed
>> +by the device. The call will block until either the BO has been processed and
>> +can be re-queued to the device, or a timeout occurs.
>> +
>> +DRM_IOCTL_QAIC_PERF_STATS_BO:
>> +This IOCTL allows userspace to collect performance statistics on the most
>> +recent execution of a BO. This allows userspace to construct an end to end
>> +timeline of the BO processing for a performance analysis.
>> +
>> +DRM_IOCTL_QAIC_PART_DEV:
>> +This IOCTL allows userspace to request a duplicate "shadow device". This extra
>> +accelN device is associated with a specific partition of resources on the AIC100
>> +device and can be used for limiting a process to some subset of resources.
> 
> Again, I'd like to see definition lists for above.

Done.

> See Sphinx primer [1] for examples of markups I point above.
> 
> Thanks.
> 
> [1]: https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html
> 

