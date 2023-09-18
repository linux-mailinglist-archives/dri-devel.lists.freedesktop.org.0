Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1493C7A561B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 01:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB47910E175;
	Mon, 18 Sep 2023 23:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354F910E175
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 23:14:14 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RqLGF5GSFz9tFw;
 Mon, 18 Sep 2023 23:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1695078853; bh=hArlmrRfObuU85XbsxHyIX+bZqnqgolRMUsLMpJoaW0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nK9S+iNyQwY2mcG9eHVQ0Zy9n1BjNqoIXk2Lr0PBHdjcGawUFBmvZzG+4YBW8gXCu
 djmScCa1gJmesUSW2uFrquHpIk7bG8dyJH7YPqEL7gSdDRQEeCnJCShYR2cm06wPIw
 9uwfdTOLE50maxO2oFsizCNfyy//Je+GWLzu/eR0=
X-Riseup-User-ID: 128D7D83E89C5734B027AA5D2CC722B29DFC7B7C2C2E10B16F355D0B53198E03
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RqLG972XMzFqjG;
 Mon, 18 Sep 2023 23:14:09 +0000 (UTC)
Message-ID: <87bb9263-9637-68b9-3525-07e81b4812f3@riseup.net>
Date: Mon, 18 Sep 2023 20:14:07 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] Add KUnit tests for drm_fb_blit()
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230918-final-gsoc-v3-0-02a79380b844@riseup.net>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20230918-final-gsoc-v3-0-02a79380b844@riseup.net>
Content-Type: text/plain; charset=UTF-8
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
 Javier Martinez Canillas <javierm@redhat.com>, mairacanal@riseup.net,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18/09/23 19:57, Arthur Grillo wrote:
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

Please ignore this patchset, One patch is missing. I will resend this
v3.

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
>       drm/tests: Add calls to drm_fb_blit() on supported format conversion tests
>       drm/tests: Add new format conversion tests to better cover drm_fb_blit()
> 
>  drivers/gpu/drm/tests/drm_format_helper_test.c | 285 +++++++++++++++++++++++++
>  1 file changed, 285 insertions(+)
> ---
> base-commit: 37454bcbb68601c326b58ac45f508067047d791f
> change-id: 20230901-final-gsoc-395a84443c8f
> 
> Best regards,
