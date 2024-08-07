Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72CC94B12D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2321710E5C4;
	Wed,  7 Aug 2024 20:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.b="tqaoiq2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D8810E574;
 Wed,  7 Aug 2024 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu; 
 s=ds202307;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bmezRMJwJIOfJvOwy4Ikx2uLzuT9FLzTpWA8tgf02+w=; b=tqaoiq2AR6LnOkwe1QCAitZ+am
 9+qRb3JfKNLRiJ4tHYu4osmnmWGbtJND2vwQOIGneseuQyPfO7mp1npoBrtS5YRVNqOdMc+5jSPru
 yi41wXW4UDb3Ukc6rgN8iJT4t43GW5MhgIcWUYUuJG70AnfiNoRoT7HSo3vP2vtLVPrKm5jFjNCAk
 1124knagj3mvchPN+0TWXp9bcNidZn3ocfUSjEgfqIqfUpNDhnTGk3tMd0qKgfmOfUT/A/vtUvFL4
 wDzkzMy4QEit1ZVdyUjw6LNxVupaeiAeiwLXDuMbSH0Q8Bqv5T5mRTfwBvboYYd4fPLer6FHk13bV
 FesHCR3Q==;
Received: from [2001:9e8:9f8:5201:3235:adff:fed0:37e6] (port=34060
 helo=lindesnes.fjasle.eu)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nicolas@fjasle.eu>) id 1sbicj-009dZ2-RP;
 Wed, 07 Aug 2024 17:30:49 +0200
Date: Wed, 7 Aug 2024 17:30:40 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: da.gomez@samsung.com
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 William Hubbs <w.d.hubbs@gmail.com>,
 Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, speakup@linux-speakup.org,
 selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-serial@vger.kernel.org,
 llvm@lists.linux.dev, Finn Behrens <me@kloenk.dev>,
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com
Subject: Re: [PATCH 03/12] file2alias: fix uuid_t definitions for macos
Message-ID: <20240807-sexy-roadrunner-of-acceptance-a84bbf@lindesnes>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-3-4cd1ded85694@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807-macos-build-support-v1-3-4cd1ded85694@samsung.com>
X-Mailman-Approved-At: Wed, 07 Aug 2024 20:21:51 +0000
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

On Wed, Aug 07, 2024 at 01:09:17AM +0200, Daniel Gomez via B4 Relay wrote:
> From: Daniel Gomez <da.gomez@samsung.com>
> 
> The uuid_t struct defined in sys/types.h on macOS hosts conflicts with
> the one defined in file2alias, resulting in the typedef redefinition
> error below. To resolve this conflict, redefine the uuid_t specifically
> for macOS hosts.
> 
> Error:
>   HOSTCC  scripts/mod/file2alias.o scripts/mod/file2alias.c:45:3:
> error: typedef redefinition with different types ('struct uuid_t' vs
> '__darwin_uuid_t' (aka 'unsigned char[16]'))    45 | } uuid_t;       |
> ^
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    sys/_types/_uuid_t.h:31:25: note: previous definition is here 31 |
>    typedef __darwin_uuid_t uuid_t;    |                         ^
> scripts/mod/file2alias.c:1354:7: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1354 |
>  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1354:19: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1354 |
>  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1354:31: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1354 |
>  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1354:43: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1354 |
>  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1354:55: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1354 |
>  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1355:7: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1355 |
>  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1355:19: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1355 |
>  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1355:31: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1355 |
>  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1355:43: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1355 |
>  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1355:55: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1355 |
>  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1356:7: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1356 |
>  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1356:20: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1356 |
>  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1356:33: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1356 |
>  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1356:46: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1356 |
>  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1356:59: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1356 |
>  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1357:7: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1357 |
>  uuid->b[15]);      |                 ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> 17 errors generated.
> 
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  scripts/mod/file2alias.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 99dce93a4188..ab743f6d60ef 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -11,6 +11,9 @@
>   */
>  
>  #include "modpost.h"
> +#ifdef __APPLE__
> +#define uuid_t sys_uuid_t
> +#endif
>  #include "devicetable-offsets.h"
>  
>  /* We use the ELF typedefs for kernel_ulong_t but bite the bullet and
> 

Have you tried to incorporate something like

  HOST_EXTRACFLAGS_file2alias.o += -D_UUID_T -D__GETHOSTUUID_H

for MacOS-based builds into scripts/mod/Makefile (cp. [1])?

I think it would be nice to keep cross-os build dependencies in
Makefiles as far as possible.

Kind regards,
Nicolas


[1]: https://kloenk.eu/posts/build-linux-on-m1-macos/
