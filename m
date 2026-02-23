Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONP3FdlsnGmcGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:06:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA45617872E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C407110E244;
	Mon, 23 Feb 2026 15:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="W/aHRYZP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4F110E244
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 15:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1771859149; x=1772463949; i=deller@gmx.de;
 bh=JgxRNuk2YyPCzBD4zBrnzCUi6abaaZtBmeG58MmBvUY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=W/aHRYZPaPuTKQ4W1huP7RrvmRJDVzWjyWQ+eors5fDckQOvDA3IZEWM6jqO811F
 ru0wWHq5pu332PU9aGS57IVOfk6t2B0xjx/TDSSPjvCq2E8HLFX56SmdU7euZ55CN
 v3npHwhPxPcI1fIzLCHoSzxhc+ldKwn2LtS9iZIMLxbgmxLNPbS2qtUllt7bFJzdI
 sqrFa0GcBiKXI47SHdPeRXmAJOyhktPgaJSw4XaZk8xkkixdwwxzO5QxjRKUrmZoh
 pDUlzFpWcTQlsYbykQZdh/ilM2UUtOiOvr+UnGvcCpUigor7445PKouCmiEEa9B64
 F9HnkAhSsdRsSRZOBw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.9.0.6] ([109.250.51.98]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2nK-1vQPhG313C-00nrfL; Mon, 23
 Feb 2026 16:05:48 +0100
Message-ID: <d8633caa-c01c-433c-8dd3-f300dac53a0b@gmx.de>
Date: Mon, 23 Feb 2026 16:05:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] lib/fonts: Remove internal symbols and macros from
 public header file
To: Thomas Zimmermann <tzimmermann@suse.de>, gregkh@linuxfoundation.org,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260218083855.10743-1-tzimmermann@suse.de>
 <20260218083855.10743-14-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260218083855.10743-14-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FfpsMU5DGngediuVVmmomv4QJ8gGWeU+O95zx39bS6eAXvHx6V3
 7f+YQ2cnUn9LlpwE76W0Y3Z9zdC36ssuubfR0rOjJi93GStqUhOk359eFIWUvN5kiqptWHT
 IhhUSQHYk1ORxLUWiqWprkM0rcEx7dVkS1/9GHH2tzPn1Xh8lpzUhS0XdwmLFWHa2Wzk17E
 yJpfaJVeJSfW0UKVxtfhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OWeMfE9onY8=;E/nrIfuVI++RIa41AzuYg5t2w4m
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:gregkh@linuxfoundation.org,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: AA45617872E
X-Rspamd-Action: no action

On 2/18/26 09:16, Thomas Zimmermann wrote:
> diff --git a/include/linux/font.h b/include/linux/font.h
> index 4ff956a1cd0a..6e9a4c93b47b 100644
> --- a/include/linux/font.h
> +++ b/include/linux/font.h
> @@ -92,20 +92,12 @@ struct font_desc {
>   #define FONT6x8_IDX	12
>   #define TER10x18_IDX	13
>  =20
> -extern const struct font_desc	font_vga_8x8,
> -			font_vga_8x16,
> -			font_pearl_8x8,
> -			font_vga_6x11,
> -			font_7x14,
> -			font_10x18,
> -			font_sun_8x16,
> -			font_sun_12x22,
> -			font_acorn_8x8,
> -			font_mini_4x6,
> -			font_6x10,
> -			font_ter_16x32,
> -			font_6x8,
> -			font_ter_10x18;
> +#if defined(CONFIG_FONT_8x8)
> +extern const struct font_desc font_vga_8x8;
> +#endif
> +#if defined(CONFIG_FONT_8x16)
> +extern const struct font_desc font_vga_8x16;
> +#endif

I suggest not to use all those #ifdef(CONFIG_XXX) in the header files.
They are not necessary, and trigger a rebuild of a whole lot C-files
in case one single CONFIG option is changed.
Instead use it in the C-files only.
That way (re-)compilation is faster and you still get a link/build error
when a symbol is used although the config option is not set.

> diff --git a/lib/fonts/font.h b/lib/fonts/font.h
> new file mode 100644
> index 000000000000..00f65a3da5c2
> --- /dev/null
> +++ b/lib/fonts/font.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _LIB_FONTS_FONT_H
> +#define _LIB_FONTS_FONT_H
> +
> +#include <linux/font.h>
> +
> +#if defined(CONFIG_FONT_PEARL_8x8)
> +extern const struct font_desc font_pearl_8x8;
> +#endif
> +#if defined(CONFIG_FONT_6x11)
> +extern const struct font_desc font_vga_6x11;
> +#endif
...
same here...

Helge
