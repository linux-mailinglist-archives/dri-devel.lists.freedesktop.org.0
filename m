Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E50571561
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 11:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A96393A74;
	Tue, 12 Jul 2022 09:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38FB93A74
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 09:09:30 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Lhw1M0SN3z9sWv;
 Tue, 12 Jul 2022 11:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1657616967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7pHn6da070NlLkNZyZhpM0wryZYoHPMUzmHUsDvJrHQ=;
 b=ghsPRor69eTJP+6phIDt2wvIhwsbI8k+gAvUSsPResTnnCv3++NheO6kAXVnwf1L9XqzD0
 jx5wXwS5XWpxtQPwTQ8jRpzb4hLxe28Y7E0qWzu6PPrSoPJ6jC47qLDVRc7bMfam6rvKjL
 hLUSNY/MAWepi3kpcD66XN0/8EwwBnS4dwzaWBeS4XJQNKn4BsZgFhz3Xn2Ga7ApaIgIn3
 BCLMsEzbHPvE87AsUQrmwf5hbrZAYtKzlIlNoxtv6lTqhr7vl/MtYtu0V36uAmr9opMVUv
 SgEr5IobDwRyqMLIA7ShmmaaT5j9PIg+tiJriGG3b7JM0e/AST2gGX6lI+j+kQ==
Message-ID: <69a6aac7-0d48-7361-9750-8f242d374d60@mailbox.org>
Date: Tue, 12 Jul 2022 11:09:25 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
Content-Language: en-CA
To: Gerd Hoffmann <kraxel@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <cover.1657300532.git.geert@linux-m68k.org>
 <0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org>
 <96a87833-d878-dde9-e335-9ea51a4ba406@mailbox.org>
 <CAMuHMdUgdbZeoFLFL8+Hm-6fG9cg5Wzq++JED3KR5P9YZtRQ4A@mail.gmail.com>
 <20220712074715.kopstlvz4q6npaye@sirius.home.kraxel.org>
 <CAMuHMdVrf7fgzumcSnZJ3OMGqA34YExXcF3O15YXYpA1ykgKyQ@mail.gmail.com>
 <20220712083907.3ic7bltstaskz72n@sirius.home.kraxel.org>
 <CAMuHMdVhxE9aayG8qRMwUuBryiR_ng08m63_+GY8htFCSmUiWg@mail.gmail.com>
 <20220712090305.44jq3olwhwypisoc@sirius.home.kraxel.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20220712090305.44jq3olwhwypisoc@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9d87deff0c8c81f488c
X-MBO-RS-META: 6fgaontf1ee3mo7o7bdra4eb1ym4h8t3
X-Rspamd-Queue-Id: 4Lhw1M0SN3z9sWv
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-07-12 11:03, Gerd Hoffmann wrote:
>>> As described above DRM_FORMAT_HOST_RGB565 means bigendian on bigendian
>>> hosts and little endian on little endian hosts.  Which is not correct
>>> when your hardware does big endian no matter what.
>>
>> But (a) drm_driver_legacy_fb_format() uses DRM_FORMAT_HOST_RGB565
>> if quirk_addfb_prefer_host_byte_order is set,
> 
> Ah, right.  Missed that in 'git grep' output.  Given that traditional
> fbdev behavior is to expect native byte order using
> DRM_FORMAT_HOST_RGB565 there makes sense indeed.
> 
> Scratch my comment about it being unused then ;)

DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN is still what the driver should use conceptually, and should match DRM_FORMAT_HOST_RGB565 in drm_driver_legacy_fb_format on a big endian host (which is presumably always the case for the atari driver).


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
