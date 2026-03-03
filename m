Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Bn1Klj+pmk7bgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:29:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CD91F2A06
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79D810E833;
	Tue,  3 Mar 2026 15:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="VfDjS2BS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B388010E072
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 15:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772551751; x=1773156551; i=deller@gmx.de;
 bh=L0YQ9uGgij/0e7daa60qwS8TKmMh8cYFiTozh7UarjI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=VfDjS2BS44MXbYCCV4LTFpNj1SwnKmnd7mYC0G5rf1DcPnZ7hdgxtS+Bt8F6LDAG
 IMJgDRrvI9LvJJZIOjAAzmRbOU6apwPDDGXS00rFmxegpS/QwYHG7oHq3anP7Woe+
 Lb5XgxYDNp00nHFqhXfbhQgMz3qojIgLuDBQ30WtGMM7XXO/XTYByQ9NyWzgWsEnT
 4O7oaLbHXhEdGjcyMk4GjAkHRmC7Fy8bMQZ6h1zgPrBwvYW5UBAlDKJf46ElPCPdi
 IAgZoNU5Mn9p4e8teJvtu05PKRzDJcdTA1ydHmWVuq5U+Ag8YZbq4ePmH7MpqgW6e
 GjH4hQ28JMQ7E4mREg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bjy-1vbiyv1INi-00sPNU; Tue, 03
 Mar 2026 16:29:11 +0100
Message-ID: <11c9e67c-36f9-4d27-8064-41b804cc0c02@gmx.de>
Date: Tue, 3 Mar 2026 16:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] vc,fbcon,fonts: Proper handling of font data
To: Thomas Zimmermann <tzimmermann@suse.de>, gregkh@linuxfoundation.org,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260302141255.518657-1-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260302141255.518657-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k102UeRHoZCq/W2qvwiwD3VKZOBg5f/l82sNhgbv3PDMOvFgxfS
 SwnUEB8UjKkQ+jTjnVlIbtGkpjt9Yf+fAqz+LidnipvTveX9h5oHScYgn64lPh0caNcebwz
 wVUI6InUug2kEUUcqZ32Ptz9nP48L0mN1Uiv/3WkT8sY7xcSgyUQvpu77lWTiWYu7Jiy6X+
 YPe2D3+cp2wZZbEov4b0w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0jReMGUMJ/k=;00X0f5S0dzIsYuNfVQxdbmXJHAT
 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
 l/UMwPpMqAb9p6V7EATatMm4PGJ3xWcGwqZ7wG
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
X-Rspamd-Queue-Id: 99CD91F2A06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:gregkh@linuxfoundation.org,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gmx.de:dkim,gmx.de:mid,man7.org:url]
X-Rspamd-Action: no action

On 3/2/26 15:08, Thomas Zimmermann wrote:
> Provide helpers for handling console font data. Update consoles and VT.
>=20
> VT's vc_state stores font data as a plain byte array of glphys. Fbcon,
> newport_con and the kernel's internal fonts store the glyph data as an
> array of plain bytes plus a hidden header for reference counting, check
> sums and buffer sizes. The reference counting only works for user-space
> fonts but not for internal fonts. Font-data handling is duplicated in
> several places. Most of the font handling is open-coded and mixed up wit=
h
> VT's plain glyph arrays.
>=20
> To address these issues, add proper handling of font data to all involve=
d
> components: struct vc_font for font state in VC; a font data type for th=
e
> consoles. Then implement interfaces for handling font data one by one.
>=20
> Patch 1 prepares the fbdev interface.
>=20
> Patches 2 to 4 prepare VT's font handling.
>=20
> Patches 5 to 13 refactor fbcon and newport_con to use clean interfaces f=
or
> their fonts.
>=20
> Fbcon has long been a source of problems and bug reports. [1] With its
> confusing implementation, it is hard to find the cause of these bugs.
> Cleaning up the fbcon code will hopefully help with resolving bug report=
s
> in the future.
>=20
> The series has been tested with fbcon under DRM's bochs driver by changi=
ng
> fonts at runtime using the setfont utility. [2] The changes to newport_c=
on
> have only been tested to compile.
>=20
> v2:
> - keep declaring the internal fonts in the public header file (Helge)
> - rebase and clean up
>=20
> [1] https://lore.kernel.org/all/6992c84c.a70a0220.2c38d7.00e8.GAE@google=
.com/
> [2] https://www.man7.org/linux/man-pages/man8/setfont.8.html
>=20
> Thomas Zimmermann (13):
>    fbdev: Declare src parameter of fb_pad_ helpers as constant
>    vt: Remove trailing whitespaces
>    vt: Store font in struct vc_font
>    vt: Calculate font-buffer size with vc_font_size()
>    lib/fonts: Remove trailing whitespaces
>    lib/fonts: Remove FNTCHARCNT()
>    lib/fonts: Store font data as font_data_t; update consoles
>    lib/fonts: Read font size with font_data_size()
>    lib/fonts: Compare font data for equality with font_data_is_equal()
>    lib/fonts: Manage font-data lifetime with font_data_get/_put()
>    lib/fonts: Create font_data_t from struct console_font with
>      font_data_import()
>    lib/fonts: Store font data for user space with font_data_export()
>    lib/fonts: Remove internal symbols and macros from public header file
>=20
>   drivers/video/console/newport_con.c |  61 +++----
>   drivers/video/fbdev/core/bitblit.c  |  11 +-
>   drivers/video/fbdev/core/fbcon.c    | 194 +++++++----------------
>   drivers/video/fbdev/core/fbcon.h    |   8 +-
>   drivers/video/fbdev/core/fbmem.c    |   6 +-
>   include/linux/console_struct.h      |  59 ++++++-
>   include/linux/fb.h                  |  10 +-
>   include/linux/font.h                | 115 +++++++++-----
>   lib/fonts/font.h                    |  38 +++++
>   lib/fonts/font_10x18.c              |   2 +-
>   lib/fonts/font_6x10.c               |   3 +-
>   lib/fonts/font_6x11.c               |   2 +-
>   lib/fonts/font_6x8.c                |   3 +-
>   lib/fonts/font_7x14.c               |   2 +-
>   lib/fonts/font_8x16.c               |   3 +-
>   lib/fonts/font_8x8.c                |   2 +-
>   lib/fonts/font_acorn_8x8.c          |   4 +-
>   lib/fonts/font_mini_4x6.c           |  10 +-
>   lib/fonts/font_pearl_8x8.c          |   2 +-
>   lib/fonts/font_sun12x22.c           |   3 +-
>   lib/fonts/font_sun8x16.c            |   3 +-
>   lib/fonts/font_ter10x18.c           |   4 +-
>   lib/fonts/font_ter16x32.c           |   4 +-
>   lib/fonts/fonts.c                   | 236 +++++++++++++++++++++++++++-
>   24 files changed, 518 insertions(+), 267 deletions(-)
>   create mode 100644 lib/fonts/font.h
Thomas, thanks for the nice cleanup!
Beside a few minor comments which I posted to the various patches, the ser=
ies looks good.

I've applied it for further testing to the fbdev git tree.
In case you send later v3 series, I'll update it.

Thanks a lot!
Helge
