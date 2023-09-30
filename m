Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC92F7B417A
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 17:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B4510E02B;
	Sat, 30 Sep 2023 15:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCA410E02B
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 15:09:32 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RyVxR6bBszDqYX;
 Sat, 30 Sep 2023 15:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1696086572; bh=Njov9crEEAyx/ZH+dhm6ZLX4cUh6uOIBOlSxDq03oqs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JvvZTtrLRXj4D810D+aYKYJUIeJZg4Bs1AcAI9n4BJjvkDdYXMg9J8k80EhcDtzkL
 SGHFgGlSxOT6v4KO00FHVlNZZRkoddgCFj9oDLPMp5pIn36UuK6WtlpJAo4ylVnf11
 P6Xf54NRR4c+ZmDC3Mh5O8LMExn0tRjX/Coe0Sp4=
X-Riseup-User-ID: C027825BD5B535AF7C62D6B8A5369EF8640170C15153CAFBB2DBDFB758649882
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RyVxN6FyxzJntf;
 Sat, 30 Sep 2023 15:09:28 +0000 (UTC)
Message-ID: <3c3aed2c-cf87-7fcc-3e53-e2773e348367@riseup.net>
Date: Sat, 30 Sep 2023 12:09:26 -0300
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v3 0/2] Add KUnit tests for drm_fb_blit()
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
References: <20230918-final-gsoc-v3-0-b999c042a4cc@riseup.net>
Content-Language: en-US
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230918-final-gsoc-v3-0-b999c042a4cc@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

On 9/18/23 20:51, Arthur Grillo wrote:
> This patchset tests the drm_fb_blit() function.
> 
> As this function can be used with already tested formats, the first
> patch adds calls to drm_fb_blit() on the tests of supported formats.
> 
> Some supported formats were not yet covered by the existing tests
> because they are only supported by drm_fb_blit(). The second patch
> adds those format conversion tests.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Applied to drm-misc/drm-misc-next!

Thanks,
- Maíra

> ---
> Changes in v3:
> - Fix memset sizes to avoid out-of-bound access
> - Link to v2: https://lore.kernel.org/r/20230905-final-gsoc-v2-0-b52e8cb068ea@riseup.net
> 
> Changes in v2:
> - Split the patch into two (Maíra Canal)
> - Link to v1: https://lore.kernel.org/r/20230901-final-gsoc-v1-1-e310c7685982@riseup.net
> 
> ---
> Arthur Grillo (2):
>        drm/tests: Add calls to drm_fb_blit() on supported format conversion tests
>        drm/tests: Add new format conversion tests to better cover drm_fb_blit()
> 
>   drivers/gpu/drm/tests/drm_format_helper_test.c | 285 +++++++++++++++++++++++++
>   1 file changed, 285 insertions(+)
> ---
> base-commit: 37454bcbb68601c326b58ac45f508067047d791f
> change-id: 20230901-final-gsoc-395a84443c8f
> 
> Best regards,
