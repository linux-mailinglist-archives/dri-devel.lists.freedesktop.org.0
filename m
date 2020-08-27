Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB22A255528
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81456E14E;
	Fri, 28 Aug 2020 07:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B7B6E427
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 07:47:01 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BcZYn4Gh6z9sTj; Thu, 27 Aug 2020 17:46:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200821104910.3363818-1-mpe@ellerman.id.au>
References: <20200821104910.3363818-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] video: fbdev: controlfb: Fix build for COMPILE_TEST=y &&
 PPC_PMAC=n
Message-Id: <159851436069.52163.17558243673000868151.b4-ty@ellerman.id.au>
Date: Thu, 27 Aug 2020 17:46:53 +1000 (AEST)
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1879185940=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1879185940==
Content-Type: text/plain

On Fri, 21 Aug 2020 20:49:10 +1000, Michael Ellerman wrote:
> The build is currently broken, if COMPILE_TEST=y and PPC_PMAC=n:
> 
>   linux/drivers/video/fbdev/controlfb.c: In function ‘control_set_hardware’:
>   linux/drivers/video/fbdev/controlfb.c:276:2: error: implicit declaration of function ‘btext_update_display’
>     276 |  btext_update_display(p->frame_buffer_phys + CTRLFB_OFF,
>         |  ^~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to powerpc/fixes.

[1/1] video: fbdev: controlfb: Fix build for COMPILE_TEST=y && PPC_PMAC=n
      https://git.kernel.org/powerpc/c/4d618b9f3fcab84e9ec28c180de46fb2c929d096

cheers

--===============1879185940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1879185940==--
