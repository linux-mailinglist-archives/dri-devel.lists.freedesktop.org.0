Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B8BCE906F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 09:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEA710E868;
	Tue, 30 Dec 2025 08:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="tQPFayW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F148210E868
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 08:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1767083418; x=1767688218; i=deller@gmx.de;
 bh=RH8Zb/j2bVEualBx3lZdQ4HQwetogp+P0EnsOL23lo0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=tQPFayW0ZmpOlkrHqbp2zew3a4rUcQDRhJBruiY7quCWUdT9vx67SswzZyldYdFl
 FSZL8zMDQM/bfsEAFtoWutIqD3SaL9zJQ74MtYFsh+4/ToKMeGLPF21l4iJMfH2sr
 zf7DMUiMHFg8FPftr8agXqg7KNv+VXMzBHEaBQT1cl+NSNrf5ewUA1+oIrlvobE7k
 SsaIa0a9LdgaKT44M1oKCgts+4220A807iMgI+Mk4KhOUpjJqG2UIz3tQzJCAjju4
 wKSf7ES4LQvW/OTyD6dezHdc5o7KqRPCIgMv97AcHc2DIlvUPfjhECzHF63GsiLHw
 HGkLgEXgKy0phU5Vvg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.253]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPXd2-1vE2a812cU-00JDxP; Tue, 30
 Dec 2025 09:30:18 +0100
Message-ID: <b8e34f09-ef49-4d84-9127-a38222387cfb@gmx.de>
Date: Tue, 30 Dec 2025 09:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/19] video/vga: Add VGA_IS0_R
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251208182637.334-15-ville.syrjala@linux.intel.com>
 <20251209075549.14051-1-ville.syrjala@linux.intel.com>
 <7f70f53e34433e3056bf16195b009d14fb60b745@intel.com>
 <aUQyVvduElkoz-hU@intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <aUQyVvduElkoz-hU@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9uKqRtU3TDQbUTYxn3+kXiADLeRtOLzbFe4lBlOJo+bcpfS7XZJ
 ImiMe9/wfjhXHywDfH33JsQHJNZ9rf4UMQq3xTP3Db6YvNtEnpwUZO8isQ32O6tsAPjZIqR
 OvUXuoVZCWSQFHOhuaGrEbd4f2E4Jcqu6RTLFcUEIjRfOyRayqwQ+7rOyzWbyxffCY8Zgz6
 yPo8V5Rglq4rktu52w60Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QWsZMAbSHgA=;YkhFSxQge99hmZ0IC61h5SpQal4
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

On 12/18/25 17:56, Ville Syrj=C3=83=C2=A4l=C3=83=C2=A4 wrote:
> On Tue, Dec 09, 2025 at 12:55:49PM +0200, Jani Nikula wrote:
>> On Tue, 09 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrot=
e:
>>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>>
>>> Add a proper name for the "Input status register 0" IO address.
>>> Currently we have some code that does read addressed using the
>>> aliasing VGA_MSR_W define, making it unclear what register we're
>>> actually reading.
>>>
>>> v2: Remove stray '?'
>>>
>>> Cc: Helge Deller <deller@gmx.de>
>=20
> Helge, can you toss me an ack to merge this via drm-intel please?

of course!

Acked-by: Helge Deller <deller@gmx.de>

 =20
>>> Cc: linux-fbdev@vger.kernel.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>
>>> ---
>>>   include/video/vga.h | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/video/vga.h b/include/video/vga.h
>>> index 468764d6727a..2f13c371800b 100644
>>> --- a/include/video/vga.h
>>> +++ b/include/video/vga.h
>>> @@ -46,6 +46,7 @@
>>>   #define VGA_MIS_R   	0x3CC	/* Misc Output Read Register */
>>>   #define VGA_MIS_W   	0x3C2	/* Misc Output Write Register */
>>>   #define VGA_FTC_R	0x3CA	/* Feature Control Read Register */
>>> +#define VGA_IS0_R	0x3C2	/* Input Status Register 0 */
>>>   #define VGA_IS1_RC  	0x3DA	/* Input Status Register 1 - color emulat=
ion */
>>>   #define VGA_IS1_RM  	0x3BA	/* Input Status Register 1 - mono emulati=
on */
>>>   #define VGA_PEL_D   	0x3C9	/* PEL Data Register */
>>
>> --=20
>> Jani Nikula, Intel
>=20

