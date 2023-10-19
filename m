Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB637CFFF8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 18:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC0010E530;
	Thu, 19 Oct 2023 16:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470EE10E530
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 16:52:09 +0000 (UTC)
Received: from [192.168.0.206] (unknown [179.221.49.105])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 64C786607342;
 Thu, 19 Oct 2023 17:52:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697734328;
 bh=TI1iuMf3xBjGI6BOnvGr4O9TUwVRN2Ievwe1zSBbw+o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=baPfS7TUr+BhzvQZ2aqotYSbOZpat6cnt7/IFbwQbSOUI+X1QQ+5+Mn3mYte62aCR
 1d9qI9MwAw1Utqi3TK62m1/PGuf1twGXzBO/PEkpMzbC2WtYqf6k7YxZUJu5YQuzOO
 vLHRhbRKG4Mq2lm3digdo1eI1/uzHGC9y3gZjlF/cJ4KeLv29rh+/+vmN+MKwVNssD
 TIIlkpyTbQMp/ElEmcI6fuh2biJQGtvdlq1Rn0KL1nYcBKahHdk3ZBXm0ChdZrtuYR
 4BYHdQMxfJMWaX6TCiQHlI8RoaChz3au8JOjSpnZ6Ycjheqr/RDlpkWZxyY5mlSt8V
 WQdsR44oURXag==
Message-ID: <ba2cd566-328d-4a47-9ab8-05817c14f0bd@collabora.com>
Date: Thu, 19 Oct 2023 13:51:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/doc: ci: Require more context for flaky tests
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20231019094609.251787-1-mripard@kernel.org>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231019094609.251787-1-mripard@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/10/2023 06:46, Maxime Ripard wrote:
> Flaky tests can be very difficult to reproduce after the facts, which
> will make it even harder to ever fix.
> 
> Let's document the metadata we agreed on to provide more context to
> anyone trying to address these fixes.
> 
> Link: https://lore.kernel.org/dri-devel/CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd61Df9mdGH2PR=ZzxaU=Q@mail.gmail.com/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   Documentation/gpu/automated_testing.rst | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 469b6fb65c30..2dd0e221c2c3 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -67,6 +67,19 @@ Lists the tests that for a given driver on a specific hardware revision are
>   known to behave unreliably. These tests won't cause a job to fail regardless of
>   the result. They will still be run.
>   
> +Each new flake entry must be associated with a link to a bug report to

What do you mean by but report? Just a link to an email to the mailing 
list is enough?

Also, I had made a mistake to the first flakes lists, which I corrected 
with https://www.spinics.net/lists/kernel/msg4959629.html (there was a 
bug in my script which ended up erroneous adding a bunch of tests in the 
flake list, so I cleaned them up), I would like to kind request to let 
me add those documentation in a future patch to not block that patch series.

Thanks
Helen


> +the author of the affected driver, the board name or Device Tree name of
> +the board, the first kernel version affected, and an approximation of
> +the failure rate.
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
