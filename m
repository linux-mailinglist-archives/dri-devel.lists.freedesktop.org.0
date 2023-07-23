Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C4875E298
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 16:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A1410E18C;
	Sun, 23 Jul 2023 14:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A9C10E18C
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jul 2023 14:22:45 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4R859K22Dnz9tKq;
 Sun, 23 Jul 2023 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1690122165; bh=BzwabxifSp+p4PAYhEknT/y66C5ageFXR6IPrGgoS2c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Usc7JN7loTFyCEqsB39yNbCDTJYBv3D3JcAzSH74akloAciEsMncZxJwiISPiAE1C
 tN9tv4crvk/C8ZSZopKKgGzxgkhbVWYLAeEq1g5xCKRLBUnb9LPPzfXAdxEP32E2V2
 T4aIx6tsZooWaQZBlCiAVzYn6/oIonWjE7dVhznQ=
X-Riseup-User-ID: 31A219CC4290EDED5704FEFAA8012067F9DF7A1EE10ABB69FF497B6766463EE3
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4R859D52CSzJp26;
 Sun, 23 Jul 2023 14:22:40 +0000 (UTC)
Message-ID: <025697f9-fda2-d039-5e0f-01165cee774f@riseup.net>
Date: Sun, 23 Jul 2023 11:22:37 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/11] drm: kunit: Switch to kunit actions
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
References: <20230720-kms-kunit-actions-rework-v2-0-175017bd56ab@kernel.org>
Content-Language: en-US
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230720-kms-kunit-actions-rework-v2-0-175017bd56ab@kernel.org>
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
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 7/20/23 08:15, Maxime Ripard wrote:
> Hi,
> 
> Since v6.5-rc1, kunit gained a devm/drmm-like mechanism that makes tests
> resources much easier to cleanup.
> 
> This series converts the existing tests to use those new actions where
> relevant.
> > Let me know what you think,

With the problems pointed out by kernel test bot fixed, the whole
series is:

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra

> Maxime
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes in v2:
> - Fix some typos
> - Use plaltform_device_del instead of removing the call to
>    platform_device_put after calling platform_device_add
> - Link to v1: https://lore.kernel.org/r/20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org
> 
> ---
> Maxime Ripard (11):
>        drm/tests: helpers: Switch to kunit actions
>        drm/tests: client-modeset: Remove call to drm_kunit_helper_free_device()
>        drm/tests: modes: Remove call to drm_kunit_helper_free_device()
>        drm/tests: probe-helper: Remove call to drm_kunit_helper_free_device()
>        drm/tests: helpers: Create a helper to allocate a locking ctx
>        drm/tests: helpers: Create a helper to allocate an atomic state
>        drm/vc4: tests: pv-muxing: Remove call to drm_kunit_helper_free_device()
>        drm/vc4: tests: mock: Use a kunit action to unregister DRM device
>        drm/vc4: tests: pv-muxing: Switch to managed locking init
>        drm/vc4: tests: Switch to atomic state allocation helper
>        drm/vc4: tests: pv-muxing: Document test scenario
> 
>   drivers/gpu/drm/tests/drm_client_modeset_test.c |   8 --
>   drivers/gpu/drm/tests/drm_kunit_helpers.c       | 108 +++++++++++++++++++++-
>   drivers/gpu/drm/tests/drm_modes_test.c          |   8 --
>   drivers/gpu/drm/tests/drm_probe_helper_test.c   |   8 --
>   drivers/gpu/drm/vc4/tests/vc4_mock.c            |   5 ++
>   drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c  | 115 +++++++++---------------
>   include/drm/drm_kunit_helpers.h                 |   7 ++
>   7 files changed, 158 insertions(+), 101 deletions(-)
> ---
> base-commit: c58c49dd89324b18a812762a2bfa5a0458e4f252
> change-id: 20230710-kms-kunit-actions-rework-5d163762c93b
> 
> Best regards,
