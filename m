Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B3539E2E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 09:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDAA1131D2;
	Wed,  1 Jun 2022 07:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B32E1131D2
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 07:26:58 +0000 (UTC)
Date: Wed, 01 Jun 2022 07:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654068416; x=1654327616;
 bh=DERyUfljLDMNfVq8tWFWGXZzMbd9T4cQfjfrpljN7Mo=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=NgGcQS/QtLpPQAVEX/fySk0BkKKvGLVyFDVF1CigZFqhychXpce/UfQ4cWuxuIQar
 vi/KuZ29/PuVF0nHvalM854OsUk7UJ6HV3gRS4NEDan2VDIFbPsb3ejQPFwtfCU24h
 os+Za/PEm0znchXIx96we/ZJ5Y8rk388RpwjtcLbNX7npAbZMPvhMy10lpHPqFlVE9
 TruHTv7tSd/Wk1Y+K/9OrjjYstHgS3Y/T0iMAUjbJujTs+HaUodaRDm6+qDpfCj2Lz
 EBtOdMyigyu01qsfa55cHuVgLfYDAucLtWXILd4cnfE75CvD0j3fld8/SZACb5+QxI
 4e0Ey98eWHvhw==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: How should "max bpc" and "Colorspace" KMS property work?
Message-ID: <5pGus9Gpq6egSTm7BULkDNlX2mu3Nshbz-P45G-LLvvXX87U_vitWTyObXwJnVNrEyy8lvhVM3aCmJReFU449CGjnJrOLOzzsehpXEKYTlQ=@emersion.fr>
In-Reply-To: <20220601102126.4f3602fd@eldfell>
References: <20220426113502.224d0a90@eldfell> <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <20220525102850.5a70e58f@eldfell>
 <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
 <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
 <20220525133647.052d09da@eldfell> <YpZSWwVkhJOalM4M@intel.com>
 <20220601102126.4f3602fd@eldfell>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, June 1st, 2022 at 09:21, Pekka Paalanen <ppaalanen@gmail.com>=
 wrote:

> What's DSC?

Display Stream Compression. A "visually" lossless compression format
used between the GPU and the sink to reduce bandwidth usage.

https://vesa.org/vesa-display-compression-codecs/
