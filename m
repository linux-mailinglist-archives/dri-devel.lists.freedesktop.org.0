Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5658B6C41A0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 05:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1312A10E256;
	Wed, 22 Mar 2023 04:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ACA10E256
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 04:39:48 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so18560012pjp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 21:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679459988;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xm0M1kcuL6xFu2eK/DxZuL2ZfVmnA4tafMen2+OWSWw=;
 b=mSuchzjfljBMbdDULRddFK0aPiZCcTU1+tbT/nfRrb8Ap6x/TXsyugBT6w3lv3yMpB
 woXU/IJVacipXn6P0SoPWb7IZt3AxJHfAQAQSNxOueI7+y3nS3avsrztg2lAlUhzUOgO
 VMlW7DpFWr9xliD3qGsr5J7Sj5rKrdQws/h+l6PuObVFEdZ+XahKxaxeUWJx1eUVPhqa
 fO8dPw12X9DtRe92+x93RkJX+jve7pPerbNwhVhJa6wdXHgLuAUNiLgCfcFwujXt51H/
 n8ZsedB82MNit9wC260woOVYGML+0NMGIbrPY3HLK1hm0d7Djp99LqFgSWj7ZGH3T4fM
 mkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679459988;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xm0M1kcuL6xFu2eK/DxZuL2ZfVmnA4tafMen2+OWSWw=;
 b=G9hI0Zl9pm6D9eN62SKbi6lICk6dh5QPkpYwzz7ou5rMF2367PWK159qQ2+ZOjd+kp
 m5VsaaGMmffqyfB1ADQlzxLrCyulh0uE00T1JnakVsbm7AOHCnAIYNfIEiu6orsVU2Kw
 51jcS//QGuV+2iwkkKpNkCvQyYA2odBseqa2HUO6mFZhAGoQq6RhMVVMkZJ2gR6BwCWw
 zcrsRNssvEDZqSfdBbIqYUoMqxJZq82R35JCSSqGeqsZy+rpxZPRtv4nB/voREgO2VRD
 Yk8omDJGm3NWEeqqDCtlvvwg0Mo8GEvwxz4vGC2vGSycXiY6lUhltg78zjTa5/iu6nwl
 aXfg==
X-Gm-Message-State: AO0yUKWd3434DIEdUQpPCr6eSLL4xRAFMr5vBaozkwUxo2b5XagkAwPD
 lJiIDG8yXEH2aopW4lT7Q9g=
X-Google-Smtp-Source: AK7set+SWZhbEAI+gnRhYaNeVGUPOUw0LhZI77y0MwZcyezPwJ1nB8cL8gtJ6BpnsZdJsAcQSWaNtQ==
X-Received: by 2002:a17:90b:38c8:b0:23b:4005:26e6 with SMTP id
 nn8-20020a17090b38c800b0023b400526e6mr2239670pjb.34.1679459987739; 
 Tue, 21 Mar 2023 21:39:47 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-30.three.co.id. [180.214.232.30])
 by smtp.gmail.com with ESMTPSA id
 hg4-20020a17090b300400b002340d317f3esm8859243pjb.52.2023.03.21.21.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 21:39:47 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id F29F710665C; Wed, 22 Mar 2023 11:39:43 +0700 (WIB)
Date: Wed, 22 Mar 2023 11:39:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, ogabbay@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, jacek.lawrynowicz@linux.intel.com,
 stanislaw.gruszka@linux.intel.com
Subject: Re: [PATCH v4 1/8] accel/qaic: Add documentation for AIC100
 accelerator driver
Message-ID: <ZBqGj+gyl4c5Yz7E@debian.me>
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-2-git-send-email-quic_jhugo@quicinc.com>
 <ZBmxl0sFH5PBG36H@debian.me>
 <aa2ee071-952b-f8b5-bfcf-53cef99478be@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EXPXy0S25JFamHAK"
Content-Disposition: inline
In-Reply-To: <aa2ee071-952b-f8b5-bfcf-53cef99478be@quicinc.com>
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


--EXPXy0S25JFamHAK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 03:52:11PM -0600, Jeffrey Hugo wrote:
> > > +
> > > +Request field descriptions:
> > > +
> > > +| req_id- request ID. A request FIFO element and a response FIFO ele=
ment with
> > > +|         the same request ID refer to the same command.
> > > +
> > > +| seq_id- sequence ID within a request. Ignored by the DMA Bridge.
> > > +
> > > +| pcie_dma_cmd- describes the DMA element of this request.
> > > +| 	Bit(7) is the force msi flag, which overrides the DMA Bridge MSI =
logic
> > > +| 		and generates a MSI when this request is complete, and QSM
> > > +| 		configures the DMA Bridge to look at this bit.
> > > +| 	Bits(6:5) are reserved.
> > > +| 	Bit(4) is the completion code flag, and indicates that the DMA Br=
idge
> > > +| 		shall generate a response FIFO element when this request is
> > > +| 		complete.
> > > +| 	Bit(3) indicates if this request is a linked list transfer(0) or =
a bulk
> > > +| 		transfer(1).
> > > +| 	Bit(2) is reserved.
> > > +| 	Bits(1:0) indicate the type of transfer. No transfer(0), to devic=
e(1),
> > > +| 		from device(2). Value 3 is illegal.
> > > +
> > > +| pcie_dma_source_addr- source address for a bulk transfer, or the a=
ddress of
> > > +|         the linked list.
> > > +
> > > +| pcie_dma_dest_addr- destination address for a bulk transfer.
> > > +
> > > +| pcie_dma_len- length of the bulk transfer. Note that the size of t=
his field
> > > +| 	limits transfers to 4G in size.
> > > +
> > > +| doorbell_addr- address of the doorbell to ring when this request i=
s complete.
> > > +
> > > +| doorbell_attr- doorbell attributes.
> > > +| 	Bit(7) indicates if a write to a doorbell is to occur.
> > > +| 	Bits(6:2) are reserved.
> > > +| 	Bits(1:0) contain the encoding of the doorbell length. 0 is 32-bi=
t,
> > > +| 		1 is 16-bit, 2 is 8-bit, 3 is reserved. The doorbell address
> > > +| 		must be naturally aligned to the specified length.
> > > +
> > > +| doorbell_data- data to write to the doorbell. Only the bits corres=
ponding to
> > > +| 	the doorbell length are valid.
> > > +
> > > +| sem_cmdN- semaphore command.
> > > +| 	Bit(31) indicates this semaphore command is enabled.
> > > +| 	Bit(30) is the to-device DMA fence. Block this request until all
> > > +| 		to-device DMA transfers are complete.
> > > +| 	Bit(29) is the from-device DMA fence. Block this request until all
> > > +| 		from-device DMA transfers are complete.
> > > +| 	Bits(28:27) are reserved.
> > > +| 	Bits(26:24) are the semaphore command. 0 is NOP. 1 is init with t=
he
> > > +| 		specified value. 2 is increment. 3 is decrement. 4 is wait
> > > +| 		until the semaphore is equal to the specified value. 5 is wait
> > > +| 		until the semaphore is greater or equal to the specified value.
> > > +| 		6 is "P", wait until semaphore is greater than 0, then
> > > +| 		decrement by 1. 7 is reserved.
> > > +| 	Bit(23) is reserved.
> > > +| 	Bit(22) is the semaphore sync. 0 is post sync, which means that t=
he
> > > +| 		semaphore operation is done after the DMA transfer. 1 is
> > > +| 		presync, which gates the DMA transfer. Only one presync is
> > > +| 		allowed per request.
> > > +| 	Bit(21) is reserved.
> > > +| 	Bits(20:16) is the index of the semaphore to operate on.
> > > +| 	Bits(15:12) are reserved.
> > > +| 	Bits(11:0) are the semaphore value to use in operations.
> >=20
> > What about bullet lists?
>=20
> It doesn't feel like the above fits into a bullet list structure.  Do you
> have an example reference, or can you transform a small section of the ab=
ove
> to illustrate what you are thinking?
>=20

Oops, sorry for suggesting the wrong construct.

Definition lists fit in this case, since there are request fields along
with their individual descriptions. For bit lists, bullet lists should
suffice.

Here is the illustration diff:

diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic=
/aic100.rst
index 7ed95bb164bbeb..4d438fd8121451 100644
--- a/Documentation/accel/qaic/aic100.rst
+++ b/Documentation/accel/qaic/aic100.rst
@@ -308,67 +308,79 @@ A request FIFO element has the following structure:
=20
 Request field descriptions:
=20
-| req_id- request ID. A request FIFO element and a response FIFO element w=
ith
-|         the same request ID refer to the same command.
+  req_id
+      request ID. A request FIFO element and a response FIFO element with
+      the same request ID refer to the same command.
=20
-| seq_id- sequence ID within a request. Ignored by the DMA Bridge.
+  seq_id
+      sequence ID within a request. Ignored by the DMA Bridge.
=20
-| pcie_dma_cmd- describes the DMA element of this request.
-| 	Bit(7) is the force msi flag, which overrides the DMA Bridge MSI logic
-| 		and generates a MSI when this request is complete, and QSM
-| 		configures the DMA Bridge to look at this bit.
-| 	Bits(6:5) are reserved.
-| 	Bit(4) is the completion code flag, and indicates that the DMA Bridge
-| 		shall generate a response FIFO element when this request is
-| 		complete.
-| 	Bit(3) indicates if this request is a linked list transfer(0) or a bulk
-| 		transfer(1).
-| 	Bit(2) is reserved.
-| 	Bits(1:0) indicate the type of transfer. No transfer(0), to device(1),
-| 		from device(2). Value 3 is illegal.
+  pcie_dma_cmd
+      describes the DMA element of this request.
=20
-| pcie_dma_source_addr- source address for a bulk transfer, or the address=
 of
-|         the linked list.
+      * Bit(7) is the force msi flag, which overrides the DMA Bridge MSI l=
ogic
+        and generates a MSI when this request is complete, and QSM
+        configures the DMA Bridge to look at this bit.
+      * Bits(6:5) are reserved.
+      * Bit(4) is the completion code flag, and indicates that the DMA Bri=
dge
+        shall generate a response FIFO element when this request is
+        complete.
+      * Bit(3) indicates if this request is a linked list transfer(0) or a=
 bulk
+      * transfer(1).
+      * Bit(2) is reserved.
+      * Bits(1:0) indicate the type of transfer. No transfer(0), to device=
(1),
+      * from device(2). Value 3 is illegal.
=20
-| pcie_dma_dest_addr- destination address for a bulk transfer.
+  pcie_dma_source_addr
+      source address for a bulk transfer, or the address of  the linked li=
st.
=20
-| pcie_dma_len- length of the bulk transfer. Note that the size of this fi=
eld
-| 	limits transfers to 4G in size.
+  pcie_dma_dest_addr
+      destination address for a bulk transfer.
=20
-| doorbell_addr- address of the doorbell to ring when this request is comp=
lete.
+  pcie_dma_len
+      length of the bulk transfer. Note that the size of this field
+      limits transfers to 4G in size.
=20
-| doorbell_attr- doorbell attributes.
-| 	Bit(7) indicates if a write to a doorbell is to occur.
-| 	Bits(6:2) are reserved.
-| 	Bits(1:0) contain the encoding of the doorbell length. 0 is 32-bit,
-| 		1 is 16-bit, 2 is 8-bit, 3 is reserved. The doorbell address
-| 		must be naturally aligned to the specified length.
+  doorbell_addr
+      address of the doorbell to ring when this request is complete.
=20
-| doorbell_data- data to write to the doorbell. Only the bits correspondin=
g to
-| 	the doorbell length are valid.
+  doorbell_attr
+      doorbell attributes.
=20
-| sem_cmdN- semaphore command.
-| 	Bit(31) indicates this semaphore command is enabled.
-| 	Bit(30) is the to-device DMA fence. Block this request until all
-| 		to-device DMA transfers are complete.
-| 	Bit(29) is the from-device DMA fence. Block this request until all
-| 		from-device DMA transfers are complete.
-| 	Bits(28:27) are reserved.
-| 	Bits(26:24) are the semaphore command. 0 is NOP. 1 is init with the
-| 		specified value. 2 is increment. 3 is decrement. 4 is wait
-| 		until the semaphore is equal to the specified value. 5 is wait
-| 		until the semaphore is greater or equal to the specified value.
-| 		6 is "P", wait until semaphore is greater than 0, then
-| 		decrement by 1. 7 is reserved.
-| 	Bit(23) is reserved.
-| 	Bit(22) is the semaphore sync. 0 is post sync, which means that the
-| 		semaphore operation is done after the DMA transfer. 1 is
-| 		presync, which gates the DMA transfer. Only one presync is
-| 		allowed per request.
-| 	Bit(21) is reserved.
-| 	Bits(20:16) is the index of the semaphore to operate on.
-| 	Bits(15:12) are reserved.
-| 	Bits(11:0) are the semaphore value to use in operations.
+      * Bit(7) indicates if a write to a doorbell is to occur.
+      * Bits(6:2) are reserved.
+      * Bits(1:0) contain the encoding of the doorbell length. 0 is 32-bit,
+        1 is 16-bit, 2 is 8-bit, 3 is reserved. The doorbell address
+        must be naturally aligned to the specified length.
+
+  doorbell_data
+      data to write to the doorbell. Only the bits corresponding to
+      the doorbell length are valid.
+
+  sem_cmdN
+      semaphore command.
+
+      * Bit(31) indicates this semaphore command is enabled.
+      * Bit(30) is the to-device DMA fence. Block this request until all
+        to-device DMA transfers are complete.
+      * Bit(29) is the from-device DMA fence. Block this request until all
+        from-device DMA transfers are complete.
+      * Bits(28:27) are reserved.
+        Bits(26:24) are the semaphore command. 0 is NOP. 1 is init with the
+        specified value. 2 is increment. 3 is decrement. 4 is wait
+        until the semaphore is equal to the specified value. 5 is wait
+        until the semaphore is greater or equal to the specified value.
+        6 is "P", wait until semaphore is greater than 0, then
+        decrement by 1. 7 is reserved.
+      * Bit(23) is reserved.
+      * Bit(22) is the semaphore sync. 0 is post sync, which means that the
+        semaphore operation is done after the DMA transfer. 1 is
+      * presync, which gates the DMA transfer. Only one presync is
+      * allowed per request.
+      * Bit(21) is reserved.
+      * Bits(20:16) is the index of the semaphore to operate on.
+      * Bits(15:12) are reserved.
+      * Bits(11:0) are the semaphore value to use in operations.
=20
 Overall, a request is processed in 4 steps:
=20

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--EXPXy0S25JFamHAK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZBqGiwAKCRD2uYlJVVFO
o8YcAP99Ek9bDxbQwDy9P1xr8cC6hW5c8NcwEvyvIUls3e+hVAEA0V2KwAmMxPcn
b1APtu6ox4tlgoFPgFfyynftXRePTgQ=
=zliE
-----END PGP SIGNATURE-----

--EXPXy0S25JFamHAK--
