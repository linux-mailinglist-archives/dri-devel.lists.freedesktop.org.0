Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0787448C044
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79AC112E43;
	Wed, 12 Jan 2022 08:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hua.moonlit-rail.com (hua.moonlit-rail.com [45.79.167.250])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C8E10E3D7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 02:19:49 +0000 (UTC)
Received: from
 209-6-248-230.s2276.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com
 ([209.6.248.230] helo=boston.moonlit-rail.com)
 by hua.moonlit-rail.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugs-a21@moonlit-rail.com>) id 1n7TEp-0004N3-4o
 for dri-devel@lists.freedesktop.org; Tue, 11 Jan 2022 21:19:47 -0500
Received: from springdale.mc.moonlit-rail.com ([192.168.71.36])
 by boston.moonlit-rail.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <bugs-a21@moonlit-rail.com>) id 1n7TEn-0000gg-Hc;
 Tue, 11 Jan 2022 21:19:45 -0500
Message-ID: <65a13d92-93fc-25d2-0009-b7e60f3392c4@moonlit-rail.com>
Date: Tue, 11 Jan 2022 21:19:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 0/2] video: A couple of fixes for the vga16fb driver
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>
References: <20220110095625.278836-1-javierm@redhat.com>
From: "Kris Karas (Bug reporting)" <bugs-a21@moonlit-rail.com>
In-Reply-To: <20220110095625.278836-1-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 12 Jan 2022 08:51:42 +0000
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier, Geert, et al,

Javier Martinez Canillas wrote:
> Changes in v2:
> - Make the change only for x86 (Geert Uytterhoeven)
> - Only check the suppported video mode for x86 (Geert Uytterhoeven).

I just updated Bug 215001 to reflect that I have tested this new, V2 
patch against 4 systems, one more than last time - 2 BIOS/VGAC and 2 
UEFI - and it works perfectly on all four.

Thanks, Javier, for the excellent work!
I didn't test with non-X86, but the code appears to bypass the patch on 
non-X86, so should work fine for Geert.

Kris

Tested-By: Kris Karas <bugs-a21@moonlit-rail.com>

