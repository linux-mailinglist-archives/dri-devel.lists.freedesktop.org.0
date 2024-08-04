Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03000946E51
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 12:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9DA10E088;
	Sun,  4 Aug 2024 10:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=davidgow.net header.i=@davidgow.net header.b="ASNlvdi/";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="QIGm0K3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AAB10E0A5;
 Sun,  4 Aug 2024 09:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
 s=201606; t=1722763152;
 bh=GTfJG1pVvOlhqeRhPSZ2jJbhnESq6sDdGs2cv+XUfw0=;
 h=From:To:Cc:Subject:Date:From;
 b=ASNlvdi/XbEbGIl33NUUJ32FYboHOs1OVRls5DPkp5PIWjTgZhyzQpNtcK67deqWO
 P5akvYjTEF00zJMFNrtMdkpO6z+TmihIGgfYQJGfFWeULJ1P0t35vy/USl5SJLs+r4
 xkvl8LH9WDsIsq/qDUiJMfX003vxqb7uBnsh8r1VKZ3E2OV3dL/ogm4uNLzd0gp4bS
 oc42kIvZhGHAUVriGDkAkTeuAA0o5MoY6Ibz7/SidO8PmCLKeAzSmnr8OsIUyclome
 mk2NzdpPoxRnE53goq/A/2/K1mTSfbnS3NoQjEb52M9vofO9kTt4Jto3QTuAO77qge
 1wkiKceNnwotWfczCvkiFDf7o5xKv8FQ3P9d65HbFb5ll116c8SbcYeQbwuSD0ziqr
 +mO8V+ns4HMmqFK78cKlzA+mov6AAHx1a46LTdyDqambimmvti+ySKYq89l/fZK5ip
 Gs7g72kz1l54kAnUzKHPpJJBEqpuTRBuf3omIN7eiayxIJ0+/TEyAx17GAqxoVtfMc
 KQGig57TZXhk5qDnQgmfLjwpFKtwjQ0ohIMmAdH0xGudUIDUWjL7JDOFnyx0EN16/8
 OjHvP5rn0l3VXzPz4mJelTlsH9WQy4IUdiBl0LFn8eS5mFBLZBKtAiCsSzcViC7Uho
 AvKawS5hLieqr8RHLGOHz184=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
 id EDE8E1DC09D; Sun,  4 Aug 2024 17:19:12 +0800 (AWST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
 sphereful.davidgow.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU autolearn=unavailable autolearn_force=no
 version=3.4.6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
 s=201606; t=1722763150;
 bh=GTfJG1pVvOlhqeRhPSZ2jJbhnESq6sDdGs2cv+XUfw0=;
 h=From:To:Cc:Subject:Date:From;
 b=QIGm0K3OkrTWQwqraYIIN9nqs7Lnz2DGGNuMl/TFA3ChCVqYtusuY4ZmiK5pjf8oH
 xTFfTF4+W4RNaD+v6r8A/6k/ighywGA3tQ3ZPZEauM/nFenOdwfe0sQ4PuIslcL+8Q
 ZduTawJWwsgZHIMRAQCRYQs/1lP8G3mbex4+XH2Jbf+0ODNa0mKiAq0s5Js02YwonS
 N83GBCxwjNEh1R+M3Xn0C0Ng/w+CKo46lq/pNf4XWLkUOPhzA4Rf/UWjiH44yaA093
 a13tS7Nx+pW7zUgLLyOgo8Z62S4/9phl8UDu9hMe05mk6PunmqQNXhXRt93x7x6Cwn
 fuHWCrKU9pdYqBQnsKJBdOr4CsN8ZB3OVN9dbrFNX3pV/XbSYtqlBikYfZN+ISCdRF
 EvF5Yy9/6TRev/3Z9hzqoSmAYojVFThuIysFIDlABdCHpE38D7qMIk9ZUXfUgvv53t
 ZRXRUWMWAPxOiMnBHPHPc99Jxts8GNxPn9SEohomS+jvKesVUbTiPP4bjbYdVnDXPu
 MDDqZH5+Omb5sq+/+iM1mWYiBnW10RMtWUUSROa4t/0rMbXpWw5hGGtaZPyRTHXnc4
 mcNbFhrxXeWZovcQaSXn3RQXT5dtFowQDnF0FxMUMSjyXzn4AQ6DJWqnrlsT7l5asO
 Ky0P7UVv42VcjvcSM5vyfPno=
Received: from sparky.lan (unknown [IPv6:2001:8003:8824:9e00::bec])
 by sphereful.davidgow.net (Postfix) with ESMTPSA id 69BD51DC091;
 Sun,  4 Aug 2024 17:19:10 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Gow <david@ingeniumdigital.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/i915: Fix ttm small BAR placement handling
Date: Sun,  4 Aug 2024 17:18:46 +0800
Message-ID: <20240804091851.122186-1-david@davidgow.net>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 04 Aug 2024 10:43:34 +0000
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

From: David Gow <david@ingeniumdigital.com>

As described in [1], there have been a couple of regressions in the TTM
placement handling for i915, which adversely affect DG2 systems with
small BAR.  In particular, performance become very poor when eviction
from the mappable BAR memory is required, as suboptimal placements can
be preferred, leading to thrashing. This often leads to hangs of >10s,
during which even the compositor is unusable.

These regressions were largely introduced during the flag rework in
commit a78a8da51b36 ("drm/ttm: replace busy placement with flags v6").

The first patch has already been sent out[2]. I'm resending it as part
of this series which fixes both known regressions.

Thanks to Justin Brewer for bisecting the issue.

Cheers,
-- David

[1]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11255
[2]: https://lore.kernel.org/dri-devel/20240722074540.15295-1-david@davidgow.net/

---

David Gow (2):
  drm/i915: Allow evicting to use the requested placement
  drm/i915: Attempt to get pages without eviction first

 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.46.0

