Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E025CACCB6B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 18:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0178610E928;
	Tue,  3 Jun 2025 16:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="r4+tFAjz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D6410E73A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1748968956; x=1749573756; i=deller@gmx.de;
 bh=4q1GSMRDxSOSXQopUiT9bq3dHcVBBpqpKkSIPTa1XCc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=r4+tFAjzJyNG51PGPDmkYn2EP7Knq2ZdlPCUPZh44msJ5161ozC3tHgkVw8DLbx0
 F5Pn9u15AX+Jl4BCd81evzOQG2ZKTAB6xQcOKwN60YWPJvo1kzaWnDLRgdGczKdt/
 4G/btwh9L8xbLH5mmlXgMTFB9T5uZCBs0+14b65Q+UIVM43hfxoikqpMH1fBWJuNy
 1vqoM4bbCUqbIY9zBVOTSZvUvZhE7qkjhN6r7qegoGZ12RLiMRNYIgkIqF4uZMdG5
 3SKPSIWDkKfYuNRANSVbuS8xZ4IXILTX99Q/ERS895RKZMO1WJd9JzbYDNlQpELG0
 EpeJihEOhoZPV2maSw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4b1y-1uKqIE0uk2-00Cu1P; Tue, 03
 Jun 2025 18:42:36 +0200
Message-ID: <678b04bb-85bd-41ca-b7ee-98d4f31199d6@gmx.de>
Date: Tue, 3 Jun 2025 18:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] video: Make global edid_info depend on
 CONFIG_FIRMWARE_EDID
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20250602075537.137759-1-tzimmermann@suse.de>
 <20250602075537.137759-3-tzimmermann@suse.de>
 <4e3f9936-0d0f-4e93-888f-738daa345905@gmx.de>
 <cd3e5ccb-3bdb-4a2b-a67e-3e97f06df433@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <cd3e5ccb-3bdb-4a2b-a67e-3e97f06df433@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:du5Ro+W8aiZNeWFJ/mIz/nEmf7ssV+PorxVB5gwfeS7MqHuh7zd
 9YYXQApV6B7zI6dSXgCS9ZZhbgT9A9TjvFPBew+KG4yFTuejgJEQnK+vPAgUSTT/JQ36qaP
 R4GSkR/b1Esc/MY9JR++hN048qJ0V4mTe8btt0u5JuNFYb7NoswFk0FPETSd3yHTpvL1c+F
 k9R3cjiViREcMmM6h+u/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:P6AUIgejElU=;RrfXJEGHw7aehFCP227LkKtT7ca
 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
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

On 6/3/25 18:18, Thomas Zimmermann wrote:
> Hi
>=20
> Am 03.06.25 um 18:08 schrieb Helge Deller:
>> On 6/2/25 09:51, Thomas Zimmermann wrote:
>>> Protect global edid_info behind CONFIG_FIRMWARE_EDID and remove
>>> the config tests for CONFIG_X86. Makes edid_info available iff
>>> its option has been enabled.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>> =C2=A0 arch/x86/kernel/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 ++++
>>> =C2=A0 drivers/gpu/drm/sysfb/efidrm.c=C2=A0 | 2 +-
>>> =C2=A0 drivers/gpu/drm/sysfb/vesadrm.c | 2 +-
>>> =C2=A0 include/video/edid.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
>>> =C2=A0 4 files changed, 8 insertions(+), 3 deletions(-)
>>
>> Reviewed-by: Helge Deller <deller@gmx.de>
>=20
> Thanks for reviewing. I'd like to merge the series via drm-misc for some=
 other patches I have for DRM. Ok?

Sure.

Helge
