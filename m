Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A327D6EDB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA76510E671;
	Wed, 25 Oct 2023 14:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AF610E671
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 14:38:42 +0000 (UTC)
Received: from [IPV6:2804:14d:e646:872b:6128:58fa:3012:5965] (unknown
 [IPv6:2804:14d:e646:872b:6128:58fa:3012:5965])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C2966607181;
 Wed, 25 Oct 2023 15:38:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698244720;
 bh=jQQFSsN5lD/ihNEJqbaIwC1Rz8KB2OSVZlcfxadgHMU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eiwAfWLwROwpT4JXwpXS6qJEqz0JsuXVvpkqheDmiX+Z16m5tR2XufNJuX/NO1qEH
 VPGOIEZ9ttj/pFtB1YaokWrrqH/pUHjYD+nECodg4+fTxhZlvQo3tQjFvr1Yqc8npf
 lacjrpWRZOZcbITyzNUL6mzeTbRD0gWxQ5I9X4rAiy0tUMXUAGc4/MOMrfLgzVShpS
 rPm1muysobK+OB3/FsdvZI7GW2BvsXWQbX27ZyuhEc8Kjs73NfN6OT3iVGg9E7eL3B
 9PTmbxGmVgTVnuJja1M1Hc9zHbslEHrCOK0fpf0fuYyIwnoOhzthEkU4yucMkdQfVu
 BfMz11yV0UFfQ==
Message-ID: <8ca1eca5-7884-4b0f-b028-8466a726456d@collabora.com>
Date: Wed, 25 Oct 2023 11:38:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/doc: ci: Require more context for flaky tests
To: Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20231025142441.745947-1-mripard@kernel.org>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231025142441.745947-1-mripard@kernel.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 25/10/2023 11:24, Maxime Ripard wrote:
> Flaky tests can be very difficult to reproduce after the facts, which
> will make it even harder to ever fix.
> 
> Let's document the metadata we agreed on to provide more context to
> anyone trying to address these fixes.
> 
> Link: https://lore.kernel.org/dri-devel/CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd61Df9mdGH2PR=ZzxaU=Q@mail.gmail.com/
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Helen Koike <helen.koike@collabora.com>

> 
> ---
> Cc: Helen Koike <helen.koike@collabora.com>
> 
> Changes from v1:
> - Rephrase the sentence a bit to make it clearer we expect a bug report
>    by mail
> ---
>   Documentation/gpu/automated_testing.rst | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 469b6fb65c30..792428a2bfdc 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -67,6 +67,19 @@ Lists the tests that for a given driver on a specific hardware revision are
>   known to behave unreliably. These tests won't cause a job to fail regardless of
>   the result. They will still be run.
>   
> +Each new flake entry must be associated with a link to the email reporting the
> +bug to the author of the affected driver, the board name or Device Tree name of
> +the board, the first kernel version affected, and an approximation of the
> +failure rate.
> +
> +They should be provided under the following format::
> +
> +  # Bug Report: $LORE_OR_PATCHWORK_URL
> +  # Board Name: broken-board.dtb
> +  # Version: 6.6-rc1
> +  # Failure Rate: 100
> +  flaky-test
> +
>   drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
>   -----------------------------------------------------------
>   
