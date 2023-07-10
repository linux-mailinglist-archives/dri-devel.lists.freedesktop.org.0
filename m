Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC674CAA4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E99910E0B6;
	Mon, 10 Jul 2023 03:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4118A10E0B6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:38:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 38A9960C77;
 Mon, 10 Jul 2023 03:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122C6C433C7;
 Mon, 10 Jul 2023 03:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688960287;
 bh=v0OsTtvNKU6Dld3+w3JG1lJowk+7fQMnwswrEl/ZXho=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I3vszjayKwTZgx7pu48sWg1k5KBKxkXctrW6bu353IwqtA9FDkUA7UB58Thl0EhHA
 B70Ik7KJ+gLjEd/EJMekP58Fj22ciYqtrwFfDgaE8piXiARykGJpw4fmJMr0abMiYv
 kznZLRTeIpAciA+le/inMAv0/2rIwFn7wPgoi0g6V+OEpDki3zv82reX0K4OX0Vk6U
 Pk3PpnvQIPIwP0lZqaH5XhB2u9jeRgPYAmJw6E9/kj6Hic8bm2+vgsnEqqkEqgA9Ri
 Z5P+PafgNNhL27TXboyzGxGeY4OuUhIK5umaEMLtbzeoYff/FKxbLMUD0g8AMLhDai
 VEhKaDKNhWjAg==
Message-ID: <fd95e3cb-d7b7-ec8b-c48b-d86634f07dfd@kernel.org>
Date: Sun, 9 Jul 2023 22:38:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/4] vgacon, arch/*: remove unused screen_info definitions
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-4-arnd@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20230707095415.1449376-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Brian Cain <bcain@quicinc.com>, linux-fbdev@vger.kernel.org,
 Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
 "David S. Miller" <davem@davemloft.net>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, Max Filippov <jcmvbkbc@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Chris Zankel <chris@zankel.net>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/7/23 04:52, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A number of architectures either kept the screen_info definition for
> historical purposes as it used to be required by the generic VT code, or
> they copied it from another architecture in order to build the VGA
> console driver in an allmodconfig build.
> 
> Now that vgacon no longer builds on these architectures, remove the
> stale definitions.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/csky/kernel/setup.c          | 12 ------------
>   arch/hexagon/kernel/Makefile      |  2 --
>   arch/hexagon/kernel/screen_info.c |  3 ---
>   arch/nios2/kernel/setup.c         |  5 -----

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

