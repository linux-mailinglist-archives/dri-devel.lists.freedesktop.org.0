Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AcXNow7d2mMdQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:01:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19843865B1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AAD10E045;
	Mon, 26 Jan 2026 10:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cljO8j/8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5zfe0Vri";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cljO8j/8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5zfe0Vri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7093B10E045
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:01:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 364995BD33;
 Mon, 26 Jan 2026 10:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769421702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MCTdo2kIuXkq/O+r27x3Hh0LuKAl+WTC23OqrDgITkw=;
 b=cljO8j/8EFltCww+6LA4PQioVmV1kZ24qISLcMlQ1R4+oKVIs6u2ZmxsGNZxm0wbrnWmJc
 /0xHbb0rUdRMJP23432mzG+TsljCjO2mhmgZYhIy27riu+XbLiG/2HpwbUWxRYlIwY+lJO
 Lat3/RIqVnJ9gCwstEY1lQB4FUopFbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769421702;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MCTdo2kIuXkq/O+r27x3Hh0LuKAl+WTC23OqrDgITkw=;
 b=5zfe0Vrivp1KUobBZc8loxmLM8CZbDcNlCtgNxVSIEkj3G0A0X+r52dpv+gHd7aACx9RiA
 bGLwZTnUn5xrBbAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769421702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MCTdo2kIuXkq/O+r27x3Hh0LuKAl+WTC23OqrDgITkw=;
 b=cljO8j/8EFltCww+6LA4PQioVmV1kZ24qISLcMlQ1R4+oKVIs6u2ZmxsGNZxm0wbrnWmJc
 /0xHbb0rUdRMJP23432mzG+TsljCjO2mhmgZYhIy27riu+XbLiG/2HpwbUWxRYlIwY+lJO
 Lat3/RIqVnJ9gCwstEY1lQB4FUopFbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769421702;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MCTdo2kIuXkq/O+r27x3Hh0LuKAl+WTC23OqrDgITkw=;
 b=5zfe0Vrivp1KUobBZc8loxmLM8CZbDcNlCtgNxVSIEkj3G0A0X+r52dpv+gHd7aACx9RiA
 bGLwZTnUn5xrBbAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5FB7C139F0;
 Mon, 26 Jan 2026 10:01:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gWo8FIU7d2k1fQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Jan 2026 10:01:41 +0000
Message-ID: <ed48e82a-cb94-477f-83c4-b2d87ae3cde6@suse.de>
Date: Mon, 26 Jan 2026 11:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 v1 0/4] [RUST] Framebuffer driver support
To: pengfuyuan <pengfuyuan@kylinos.cn>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Zsolt Kajtar <soci@c64.rulez.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,garyguo.net,protonmail.com,kernel.org,umich.edu,linuxfoundation.org,ffwll.ch,gmx.de,ravnborg.org,c64.rulez.org,linux.intel.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengfuyuan@kylinos.cn,m:dakr@kernel.org,m:aliceryhl@google.com,m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:deller@gmx.de,m:hansg@kernel.org,m:lee@kernel.org,m:sam@ravnborg.org,m:soci@c64.rulez.org,m:ville.syrjala@linux.intel.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim,suse.com:url]
X-Rspamd-Queue-Id: 19843865B1
X-Rspamd-Action: no action

Hi

Am 26.01.26 um 09:17 schrieb pengfuyuan:
> This patch series adds Rust bindings and safe abstractions for the Linux
> framebuffer subsystem, enabling framebuffer drivers to be implemented in Rust.

The framebuffer subsystem is obsolete and has been deprecated for a 
decade. No new drivers accepted. Anything that really wants fbdev 
already has a driver. Can we please let it die?

Best regards
Thomas

>
> The series consists of 4 patches:
>
> 1. rust: io: mem: add ioremap_wc support
>     Adds write-combining memory mapping support to the Rust iomem abstraction,
>     which is essential for framebuffer memory regions that benefit from
>     write-combining semantics.
>
> 2. rust: device: add platdata accessors
>     Implements generic accessors for platform data, enabling drivers to access
>     platform-provided configuration. This is needed for framebuffer drivers
>     that use platform data for configuration.
>
> 3. rust: fb: add framebuffer driver support
>     Adds the core framebuffer framework abstraction, including:
>     - Device abstraction (`fb::Device`) with reference counting via `AlwaysRefCounted`
>     - Driver and Operations traits (`fb::Driver`, `fb::Operations`)
>     - Screen information wrappers (`fb::FixScreenInfo`, `fb::VarScreenInfo`)
>     - I/O operation helpers (`fb_io_read`, `fb_io_write`, `fb_io_mmap`)
>     - Blit operation helpers (`cfb_fillrect`, `cfb_copyarea`, `cfb_imageblit`)
>
> 4. rust: fb: add simplefb test driver
>     Adds a test driver that validates the framebuffer framework by porting
>     the C simplefb driver to Rust. This driver serves as both a validation
>     tool and a reference implementation for future Rust framebuffer drivers.
>
> The implementation follows the same patterns established in the DRM subsystem
> and maintains full compatibility with the existing C framebuffer subsystem.
> All C callbacks are properly bridged to Rust trait methods via the `Operations`
> trait, memory safety is ensured through proper use of `Opaque<fb_info>`, `ARef`,
> and `AlwaysRefCounted` for reference counting, type invariants are documented
> and enforced through the type system, and resource cleanup is handled via RAII
> with proper cleanup order.
>
> Testing:
> --------
> This series has been tested on:
> - ARM64 platforms with various display configurations
> - AMD RX550 graphics card
> - Moore Threads S30 graphics card
> - Multiple other graphics cards
>
> All tested configurations show normal display functionality with proper
> framebuffer initialization, rendering operations (including I/O, color register
> management, and blitting), memory mapping, and resource cleanup. The simplefb
> test driver successfully demonstrates the usage of all framebuffer framework
> APIs and validates the abstraction's correctness.
>
> The simplefb test driver serves as both a validation tool and a reference
> implementation for future Rust framebuffer drivers.
>
>
> pengfuyuan (4):
>    rust: io: mem: add ioremap_wc support
>    rust: device: add platdata accessors
>    rust: fb: add framebuffer driver support
>    rust: fb: add simplefb test driver
>
>   drivers/video/fbdev/Kconfig          |  21 +
>   drivers/video/fbdev/Makefile         |   1 +
>   drivers/video/fbdev/simplefb_rust.rs | 653 +++++++++++++++++++++++++++
>   rust/bindings/bindings_helper.h      |   2 +
>   rust/helpers/device.c                |   5 +
>   rust/helpers/io.c                    |   5 +
>   rust/kernel/device.rs                |  31 ++
>   rust/kernel/fb/blit.rs               | 106 +++++
>   rust/kernel/fb/device.rs             | 463 +++++++++++++++++++
>   rust/kernel/fb/driver.rs             | 169 +++++++
>   rust/kernel/fb/io.rs                 |  76 ++++
>   rust/kernel/fb/mod.rs                |  23 +
>   rust/kernel/fb/screeninfo.rs         | 318 +++++++++++++
>   rust/kernel/io/mem.rs                |  71 +++
>   rust/kernel/lib.rs                   |   2 +
>   15 files changed, 1946 insertions(+)
>   create mode 100644 drivers/video/fbdev/simplefb_rust.rs
>   create mode 100644 rust/kernel/fb/blit.rs
>   create mode 100644 rust/kernel/fb/device.rs
>   create mode 100644 rust/kernel/fb/driver.rs
>   create mode 100644 rust/kernel/fb/io.rs
>   create mode 100644 rust/kernel/fb/mod.rs
>   create mode 100644 rust/kernel/fb/screeninfo.rs
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


