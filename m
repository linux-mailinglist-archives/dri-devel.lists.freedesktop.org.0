Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFEA6C32E7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 14:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B13310E0A9;
	Tue, 21 Mar 2023 13:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83D710E0A9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 13:31:08 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id a16so11207765pjs.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679405468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5cxmWVhOI6MNjtLCyFhmozq7qtSHEmT56RoMgemeS7Y=;
 b=jubWNIJ4zMnyIcApjfew3OxWbnfFT6dBrnDZrd6drtMQpHT7vVkia0FtUlVL4gITX/
 bcUXH3c1SmS1lUYWP4UwWoNauS0KqAUwipMg/AvEnIOImGHcaX/x2vKdkNDCiC3jyAtm
 44+4Al1pmwKBSk63qp8iZ42OK58Q2qmLalqBlMP4updg2e0/TYsgeG+WAV73srrhK2Td
 K9T+dUn+KT/3lHg8DU5sKJJ1aR8pPOlIBszCFR4EJkWcIilpRm57nAiXOCcAqCqTcOam
 IrdrTebhgQufp5Xm18WDjk3oyLfXHJmr/eFGhfLMHSQ8BYuWfUrDPw/xWzdTyxq5aITS
 BYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679405468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5cxmWVhOI6MNjtLCyFhmozq7qtSHEmT56RoMgemeS7Y=;
 b=qqH7qn15DFgCtlBqlBhtdUd2CijpN7kdXFNXu7Hgm4H0PTK9oKaFEnQVEWSFXvxL4f
 aaFDcTC1kEkCm1XF0qGs3IvBi67Hj6H2Vk6C5RUZUPpkqcO6AieBlFBUH/szH3hkiVkP
 qZrP2IRE8AQ+Rq6DzLKJUMvfgzuGk8G/aiGhyyFwnhuLxEPLC9TEdh+jKECFOSfyf67x
 MZf3m+Dt1nFS8qqM3K1RdqI6P7Jli02uEPdGlUsNka0sd9avyT4MZIAsK2cMNZcXjgrv
 nzZiqS9LyKRyJl0PAuXlr0gaZweOplWFWhjcOIwgOS4NdSTNfHLI1p3S4tXF13nvrXkv
 Yutg==
X-Gm-Message-State: AO0yUKXNTg9KpsjWAKCjmgEKoF2YmiQLk64mefy/2SarhWyivkrF/9NP
 I4LuFPgdBWHyey17jwG9HzI=
X-Google-Smtp-Source: AK7set88jCy4NeD8EguPDAMQ8CIJIehTj5bGg/jtrVaY4WAzbEz5JPDMkzfk94WyFmWS+bR+syCr2g==
X-Received: by 2002:a17:90a:18e:b0:23f:962e:826b with SMTP id
 14-20020a17090a018e00b0023f962e826bmr2785516pjc.15.1679405468118; 
 Tue, 21 Mar 2023 06:31:08 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-50.three.co.id. [116.206.28.50])
 by smtp.gmail.com with ESMTPSA id
 mt19-20020a17090b231300b0023b5528b8d4sm546556pjb.19.2023.03.21.06.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:31:07 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 4E249106642; Tue, 21 Mar 2023 20:31:04 +0700 (WIB)
Date: Tue, 21 Mar 2023 20:31:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, ogabbay@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, jacek.lawrynowicz@linux.intel.com,
 stanislaw.gruszka@linux.intel.com
Subject: Re: [PATCH v4 1/8] accel/qaic: Add documentation for AIC100
 accelerator driver
Message-ID: <ZBmxl0sFH5PBG36H@debian.me>
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-2-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QYh95wboJB8ubqN1"
Content-Disposition: inline
In-Reply-To: <1679325074-5494-2-git-send-email-quic_jhugo@quicinc.com>
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


--QYh95wboJB8ubqN1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 09:11:07AM -0600, Jeffrey Hugo wrote:
> +AIC100 defines a number of MHI channels for different purposes. This is =
a list
> +of the defined channels, and their uses.
> +
> +| QAIC_LOOPBACK
> +| Channels 0 & 1
> +| Valid for AMSS
> +| Any data sent to the device on this channel is sent back to the host.
> +
> +| QAIC_SAHARA
> +| Channels 2 & 3
> +| Valid for SBL
> +| Used by SBL to obtain the runtime firmware from the host.
> +
> +| QAIC_DIAG
> +| Channels 4 & 5
> +| Valid for AMSS
> +| Used to communicate with QSM via the Diag protocol.
> +
> +| QAIC_SSR
> +| Channels 6 & 7
> +| Valid for AMSS
> +| Used to notify the host of subsystem restart events, and to offload SS=
R crashdumps.
> +
> +| QAIC_QDSS
> +| Channels 8 & 9
> +| Valid for AMSS
> +| Used for the Qualcomm Debug Subsystem.
> +
> +| QAIC_CONTROL
> +| Channels 10 & 11
> +| Valid for AMSS
> +| Used for the Neural Network Control (NNC) protocol.  This is the prima=
ry channel between host and
> +  QSM for managing workloads.
> +
> +| QAIC_LOGGING
> +| Channels 12 & 13
> +| Valid for SBL
> +| Used by the SBL to send the bootlog to the host.
> +
> +| QAIC_STATUS
> +| Channels 14 & 15
> +| Valid for AMSS
> +| Used to notify the host of Reliability, Accessibility, Serviceability =
(RAS) events.
> +
> +| QAIC_TELEMETRY
> +| Channels 16 & 17
> +| Valid for AMSS
> +| Used to get/set power/thermal/etc attributes.
> +
> +| QAIC_DEBUG
> +| Channels 18 & 19
> +| Valid for AMSS
> +| Not used.
> +
> +| QAIC_TIMESYNC
> +| Channels 20 & 21
> +| Valid for SBL/AMSS
> +| Used to synchronize timestamps in the device side logs with the host t=
ime source.

For the tabular data above, use table syntax instead.

> +A request FIFO element has the following structure:
> +
> +| {
> +|	u16 req_id;
> +|	u8  seq_id;
> +|	u8  pcie_dma_cmd;
> +|	u32 reserved;
> +|	u64 pcie_dma_source_addr;
> +|	u64 pcie_dma_dest_addr;
> +|	u32 pcie_dma_len;
> +|	u32 reserved;
> +|	u64 doorbell_addr;
> +|	u8  doorbell_attr;
> +|	u8  reserved;
> +|	u16 reserved;
> +|	u32 doorbell_data;
> +|	u32 sem_cmd0;
> +|	u32 sem_cmd1;
> +|	u32 sem_cmd2;
> +|	u32 sem_cmd3;
> +| }

IMO code blocks should better fit the struct listing above.

> +
> +Request field descriptions:
> +
> +| req_id- request ID. A request FIFO element and a response FIFO element=
 with
> +|         the same request ID refer to the same command.
> +
> +| seq_id- sequence ID within a request. Ignored by the DMA Bridge.
> +
> +| pcie_dma_cmd- describes the DMA element of this request.
> +| 	Bit(7) is the force msi flag, which overrides the DMA Bridge MSI logic
> +| 		and generates a MSI when this request is complete, and QSM
> +| 		configures the DMA Bridge to look at this bit.
> +| 	Bits(6:5) are reserved.
> +| 	Bit(4) is the completion code flag, and indicates that the DMA Bridge
> +| 		shall generate a response FIFO element when this request is
> +| 		complete.
> +| 	Bit(3) indicates if this request is a linked list transfer(0) or a bu=
lk
> +| 		transfer(1).
> +| 	Bit(2) is reserved.
> +| 	Bits(1:0) indicate the type of transfer. No transfer(0), to device(1),
> +| 		from device(2). Value 3 is illegal.
> +
> +| pcie_dma_source_addr- source address for a bulk transfer, or the addre=
ss of
> +|         the linked list.
> +
> +| pcie_dma_dest_addr- destination address for a bulk transfer.
> +
> +| pcie_dma_len- length of the bulk transfer. Note that the size of this =
field
> +| 	limits transfers to 4G in size.
> +
> +| doorbell_addr- address of the doorbell to ring when this request is co=
mplete.
> +
> +| doorbell_attr- doorbell attributes.
> +| 	Bit(7) indicates if a write to a doorbell is to occur.
> +| 	Bits(6:2) are reserved.
> +| 	Bits(1:0) contain the encoding of the doorbell length. 0 is 32-bit,
> +| 		1 is 16-bit, 2 is 8-bit, 3 is reserved. The doorbell address
> +| 		must be naturally aligned to the specified length.
> +
> +| doorbell_data- data to write to the doorbell. Only the bits correspond=
ing to
> +| 	the doorbell length are valid.
> +
> +| sem_cmdN- semaphore command.
> +| 	Bit(31) indicates this semaphore command is enabled.
> +| 	Bit(30) is the to-device DMA fence. Block this request until all
> +| 		to-device DMA transfers are complete.
> +| 	Bit(29) is the from-device DMA fence. Block this request until all
> +| 		from-device DMA transfers are complete.
> +| 	Bits(28:27) are reserved.
> +| 	Bits(26:24) are the semaphore command. 0 is NOP. 1 is init with the
> +| 		specified value. 2 is increment. 3 is decrement. 4 is wait
> +| 		until the semaphore is equal to the specified value. 5 is wait
> +| 		until the semaphore is greater or equal to the specified value.
> +| 		6 is "P", wait until semaphore is greater than 0, then
> +| 		decrement by 1. 7 is reserved.
> +| 	Bit(23) is reserved.
> +| 	Bit(22) is the semaphore sync. 0 is post sync, which means that the
> +| 		semaphore operation is done after the DMA transfer. 1 is
> +| 		presync, which gates the DMA transfer. Only one presync is
> +| 		allowed per request.
> +| 	Bit(21) is reserved.
> +| 	Bits(20:16) is the index of the semaphore to operate on.
> +| 	Bits(15:12) are reserved.
> +| 	Bits(11:0) are the semaphore value to use in operations.

What about bullet lists?

> +
> +| {
> +| 	u16 req_id;
> +| 	u16 completion_code;
> +| }

Again, use code blocks.

> +passthrough- Allows userspace to send an opaque payload directly to the =
QSM.
> +This is used for NNC commands. Userspace is responsible for managing
> +the QSM message requirements in the payload
> +
> +dma_xfer- DMA transfer. Describes an object that the QSM should DMA into=
 the
> +device via address and size tuples.
> +
> +activate- Activate a workload onto NSPs. The host must provide memory to=
 be
> +used by the DBC.
> +
> +deactivate- Deactivate an active workload and return the NSPs to idle.
> +
> +status- Query the QSM about it's NNC implementation. Returns the NNC ver=
sion,
> +and if CRC is used.
> +
> +terminate- Release a user's resources.
> +
> +dma_xfer_cont- Continuation of a previous DMA transfer. If a DMA transfer
> +cannot be specified in a single message (highly fragmented), this
> +transaction can be used to specify more ranges.
> +
> +validate_partition- Query to QSM to determine if a partition identifier =
is
> +valid.

What about using definition lists?

> +DRM_IOCTL_QAIC_MANAGE:
> +This IOCTL allows userspace to send a NNC request to the QSM. The call w=
ill
> +block until a response is received, or the request has timed out.
> +
> +DRM_IOCTL_QAIC_CREATE_BO:
> +This IOCTL allows userspace to allocate a buffer object (BO) which can s=
end or
> +receive data from a workload. The call will return a GEM handle that
> +represents the allocated buffer. The BO is not usable until it has been =
sliced
> +(see DRM_IOCTL_QAIC_ATTACH_SLICE_BO).
> +
> +DRM_IOCTL_QAIC_MMAP_BO:
> +This IOCTL allows userspace to prepare an allocated BO to be mmap'd into=
 the
> +userspace process.
> +
> +DRM_IOCTL_QAIC_ATTACH_SLICE_BO:
> +This IOCTL allows userspace to slice a BO in preparation for sending the=
 BO to
> +the device. Slicing is the operation of describing what portions of a BO=
 get
> +sent where to a workload. This requires a set of DMA transfers for the D=
MA
> +Bridge, and as such, locks the BO to a specific DBC.
> +
> +DRM_IOCTL_QAIC_EXECUTE_BO:
> +This IOCTL allows userspace to submit a set of sliced BOs to the device.=
 The
> +call is non-blocking. Success only indicates that the BOs have been queu=
ed
> +to the device, but does not guarantee they have been executed.
> +
> +DRM_IOCTL_QAIC_PARTIAL_EXECUTE_BO:
> +This IOCTL operates like DRM_IOCTL_QAIC_EXECUTE_BO, but it allows usersp=
ace to
> +shrink the BOs sent to the device for this specific call. If a BO typica=
lly has
> +N inputs, but only a subset of those is available, this IOCTL allows use=
rspace
> +to indicate that only the first M bytes of the BO should be sent to the =
device
> +to minimize data transfer overhead. This IOCTL dynamically recomputes the
> +slicing, and therefore has some processing overhead before the BOs can b=
e queued
> +to the device.
> +
> +DRM_IOCTL_QAIC_WAIT_BO:
> +This IOCTL allows userspace to determine when a particular BO has been p=
rocessed
> +by the device. The call will block until either the BO has been processe=
d and
> +can be re-queued to the device, or a timeout occurs.
> +
> +DRM_IOCTL_QAIC_PERF_STATS_BO:
> +This IOCTL allows userspace to collect performance statistics on the most
> +recent execution of a BO. This allows userspace to construct an end to e=
nd
> +timeline of the BO processing for a performance analysis.
> +
> +DRM_IOCTL_QAIC_PART_DEV:
> +This IOCTL allows userspace to request a duplicate "shadow device". This=
 extra
> +accelN device is associated with a specific partition of resources on th=
e AIC100
> +device and can be used for limiting a process to some subset of resource=
s.

Again, I'd like to see definition lists for above.

See Sphinx primer [1] for examples of markups I point above.

Thanks.

[1]: https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html

--=20
An old man doll... just what I always wanted! - Clara

--QYh95wboJB8ubqN1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZBmxkwAKCRD2uYlJVVFO
o2Q7AP4qgX8kXdyFzcoaSZ/SGmPhGp4hpQTntNBKwqf7DbzuTgEA0HWuWrsUYerR
H64cWaqt1UU32ow5deWnDSuVGX+djwE=
=J8pK
-----END PGP SIGNATURE-----

--QYh95wboJB8ubqN1--
