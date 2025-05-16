Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249E3ABA008
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC94B10EB01;
	Fri, 16 May 2025 15:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=att.net header.i=@att.net header.b="vg4IHjs5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic307-12.consmr.mail.ne1.yahoo.com
 (sonic307-12.consmr.mail.ne1.yahoo.com [66.163.190.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F5810EB01
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 15:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1747409894; bh=tsbgcq2xbuSCl917S4cl+jz4tu1xX6xbPfDrS4mBe1M=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From:Subject:Reply-To;
 b=vg4IHjs5i/Q4mAZWSHsdrHiG0gxg34QdionZSnur8ulysSXzzfX/7vh4X2GmAgQpBeL4e+3Bn8oe65KF5ImVOxKD9Gn97Pc2OV17yqcJ+mTCDArKnAFv0jF0XcD7efQ8qaKHY37hx3fPESnWZa6ZhzuRAcoCJENfFXhNIk/kstU=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1747409894; bh=yU9VRKtiHewTy53GLpAMJfd30l4c1Ovqk8wjq4gvSp/=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=E7p9g9hWKpwcOejN3Y/jlMOVGzprLSsjbci9iaLJwwz9jd+OEKfrdbTe2VzGoaqRniAEZTZONOxT6F5sVqBtomT8TREhtBgHeCmryb00Yz78IhQ/vRCT6DtONjzbm7VBTP/f0SFBacG50+t6oIoX+QOH0u/nnJF+vRSaXRIFW4zBxqqjgWrzvQpPpcI7rnftHyZFeE+pz0PMwWnnZGpxCLnSPoQvf8O1G4oedRB/eJajFSYsBHq2G/tqs+ORa8COp4WD/fL0IIWaPoHE8GynVXRoKmBknuq6P8PpNpkVudB3bMwvbSz6oq38kU2uVAFx9pI6ITEdFEHmRhQCLFcXig==
X-YMail-OSG: abUlPDcVM1ld1E71JvOew4eZ9ae.edWrZGNNuvB2x3O6NX7qPLWq2qWvajh8TXR
 o9BEDUgdOgzjM.Jm6SxXsUPEkR1jsU8pwYjLd2iD_paoFf1egDi8dzPbxvXF_.5CyhRolIUh8kBt
 6sOMjzDvWIIK4.14AkPbWuyIGESrxGojjhw4sOpQW5Pv.ZAhLG2NRJJmCtd3jM3kmwmLgZ3yxTwr
 qNzlLVZVDvBuyLdEVtSwOJ239EHNErfHm37hsZSHR8tOelSbEbRYnZS6ubKri62kdePRaRF4I3vI
 RGzEfNC5K08YvFrcJOy2KrE88loKphcL4czKlpqttdqNjvCUPpT.e2lW3117kuydd9zu3z32DXWu
 gMD.RqjX1sOAqbD9xOEaaZ3IB8C.b28CjVg.sMjcBPVpxOJKOR3Yc8arr1YywK4qSmvTfdEEHI02
 n_K5P62BSxgbplfbsrbCk3ZLdza77gDDuMYU6WH_cc_GbX.IVWbUHGudwxfIOuNMjB6shvgfyuYo
 s504YMJrBvtM.uYOveU8IQJtfAnpqJSEvcv5bggBLR117A6Qld2WKXDt3Nun3l7EY07o0BfAhDh2
 C1MSehFM_owI0S.9rAioyqNZBjnRIaiuv3nTrBThqd9p0pUqLU4IfmeJ9U1BgKmFgzFuRiL9gf2g
 4BYRVWFMCi7b.DHf3KxacDs51s0gGFkOZfHaBzTMEg64dZGy2zgUqD4uJYY8110CsC03gDRKTxfU
 ShlR_Y3DdeeWl1z4CQLiiNJ.jhTMjW1yVs.ilu4uJYNlLXk5E8Ohz8FHKCnjbT2DtfpcSFEkEH8e
 tKWeJjrcXrsNxTZ43bnE0egTcyS9rgzGINcK7sLOqWI5X10uXqbVjueUDm6YIS9P1pLXfbcxo3Lx
 Hib2Qfd_MzvGxSCAM0PxobV8wBStq2.7R0C2j.E3uGjE_n5WAxgq9CWH5_Wz_WlPRSKgvqoTmaM3
 WM7bmKbp49Cl1Oxg_OFuoCT1ZoMFKJI8l7Dmzo_4C0NW2vrtt86giRp8I4AxnpSu7SvV__PYeJZi
 UAg8GqSpRiedCsBVLTJCQUhIr75gZb1WI0nXlAPypzYziHz7iP0h2p1lrwlNGd0gBQQX3nT9BFKz
 d9572G47yGRpp73dlGlJrfaYGFY6PJaHkN8P.MyW85AljYButKb9TD_F4TnTJsluNPQSdl7GTuEI
 D3K40.3MWzn5GVupk8Wvq3ZCb.B_0VxIlUBQ7jPUBtC9COS2ayZyfgeF_IU_IIRQMSOKXMxGkmby
 KzsLePixzDu4jzUVoJgh8FmR6bVJ3aGnOpKMzRzaDbakeOQrz2WmlNXU0dxoHb8fnyz8WstCmBzu
 KtFFw1sFZuzyi10FJcpDu1hoA3kIa0y9G3fLGOmduLG7F.gdckrbzmJAMLaKaUBj07_HUWO5FMOV
 ebps9d9JBF2TWeI1umCTXMEdNdAl1kg1JIzB_91yabIj7rPdWn4RaUmMFu44_B_ieqyrViUoWMs3
 CCWHrvJxWI9YBjWh.09g3g496neW4aCTgxdm7gN99XlTIhYBdvibvwcIhKdhYiRQFS0WI5w67ofs
 zvqFQuVfzaUAuKIcu1b9TZgaRYL5IuTeN8KzHhlYR0LDogzeyJTnSJtTHpi8_Vdquo0WEtAXWPr8
 z3sN88tPoDGUHGgG6Ru.M0ogWkpu0.OU1Q_5WBgazYAOPaFbnieks.Je70ablWuwKQrcy0FEjowo
 sv9bL7zQ4uQ2CCXZUjOjoGb1CCHM2eaBu5WL_9BwmnM6fPtsNm9755Yzo64JwbkVGpKanHoLg9OO
 fCTth38319ne0shedRGAZsQjGYb1.8Rof3VyOw3eII6casoKSsmgpNjAeyfIKshoU5.jqq5tAQPp
 .aHDX30_RBVNMfLEkoAUMZ1FB1blyipIgIk18Q.iitEXbsLe2qfxftiRVIqUh4eO9xKn.SqiWifB
 zAARkJo_vLx8tJSPSFRBQWOOTlhi4wyM8FSrWFvIUU6IYzTntCG1d4Q4PZLGcBu0TmFcjPN84FQa
 oYxvmrrlsK9Wp5gYUdqY5JruoEJp9GHpgTq_n2ktr9GgA7e16t4rX1szWEy__lnlingdpjV1t.j8
 khv7AMGnxXXFNaTxVNzE4xbVAsnjwF7KjifZR6116.PhuVbNnAgMwfUKntHLS5j6KAHQmWJEK6DZ
 NzqfMFb44U8DQ.g--
X-Sonic-MF: <pheonix.sja@att.net>
X-Sonic-ID: f867e829-4c4a-46b0-a756-74e3233491b5
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Fri, 16 May 2025 15:38:14 +0000
Received: by hermes--production-bf1-689c4795f-vc9qb (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 993a61ddbd564005fb0f4ea87f66bbc2; 
 Fri, 16 May 2025 15:38:12 +0000 (UTC)
Date: Fri, 16 May 2025 11:38:04 -0400
From: Steven J Abner <pheonix.sja@att.net>
Subject: Re: Kernels >= 6.3 disable video output
To: Michel =?iso-8859-1?q?D=E4nzer?= <michel.daenzer@mailbox.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-Id: <G32DWS.2C801BL0Y0SE2@att.net>
In-Reply-To: <ba97cecf-d820-4ae7-98ae-2cf57db228fb@mailbox.org>
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net> <6DWYVS.BXJ4YUZ0KN5B3@att.net>
 <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
 <GXXZVS.Q1GIIU1M9VBL1@att.net>
 <CADnq5_NvoPfgTxOxjBCc-iGR7k8w7oR7VKkXQtWga8VP7vBViQ@mail.gmail.com>
 <1Q10WS.BHBZBX486I3M2@att.net> <EWZ5WS.K2DTZM5DEZCL2@att.net>
 <CADnq5_PbeZCPD7WWO0i5HSVMepka7Ao6byfkx3zHkiBfg4amwg@mail.gmail.com>
 <OY8BWS.OAO65CCC74TY1@att.net>
 <CADnq5_NqAQPO1NRbzQJzR+tZnOSqrhTmZj4z-B54X-hRxo3b4w@mail.gmail.com>
 <df6872b3-1048-416b-82d7-63f732cb6b4d@amd.com>
 <ba97cecf-d820-4ae7-98ae-2cf57db228fb@mailbox.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 16 2025 at 03:02:47 PM +0000, Michel D=E4nzer=20
<michel.daenzer@mailbox.org> wrote:
> FWIW, with GNOME the "max bpc" property value can be set

 Issue is pre-DE, gnome or Xorg. A boot param like=20
'amd_prefcore=3Ddisable' could work. Issue then becomes putting into=20
dmesg so can figure its needed. Blacked out console hard to read. A=20
chroot or mount access to /var/log/... easy to find issue that way.


