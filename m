Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF47567D4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 17:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1D210E271;
	Mon, 17 Jul 2023 15:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A7C910E271
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 15:25:09 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxlPBTXbVkDP4FAA--.15939S3;
 Mon, 17 Jul 2023 23:25:07 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxB81NXbVkeaUxAA--.64669S3; 
 Mon, 17 Jul 2023 23:25:05 +0800 (CST)
Message-ID: <6a92cbb7-e98b-e93c-6e62-ceddd0dfbc06@loongson.cn>
Date: Mon, 17 Jul 2023 23:24:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/11] drm: kunit: Switch to kunit actions
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxB81NXbVkeaUxAA--.64669S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr15Ww45XF4xCryruFW7Awc_yoW8tFyrpr
 43JFy3trW8tFsxJwnxuw40y3Wfua1kt34Svr97Zw15Ars0yF9xArn3Kw15WFW5GrWrZrn2
 vw1ftry3C3WDAFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
 6r17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
 Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8O18PUUUUU==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/10 15:47, Maxime Ripard wrote:
> Hi,
>
> Since v6.5-rc1, kunit gained a devm/drmm-like mechanism that makes tests
> resources much easier to cleanup.
>
> This series converts the existing tests to use those new actions were
> relevant.

Is the word 'were' here means that 'where' relevant ?

Or it is means that it were relevant, after applied you patch it is not 
relevant anymore ?

> Let me know what you think,
> Maxime
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Maxime Ripard (11):
>        drm/tests: helpers: Switch to kunit actions
>        drm/tests: client-modeset: Remove call to drm_kunit_helper_free_device()
>        drm/tests: modes: Remove call to drm_kunit_helper_free_device()
>        drm/tests: probe-helper: Remove call to drm_kunit_helper_free_device()
>        drm/tests: helpers: Create an helper to allocate a locking ctx
>        drm/tests: helpers: Create an helper to allocate an atomic state

a helper or an helper ?

Should this two patch be re-titled as following ?

I search it on the internet[1], mostly using a helper.


       drm/tests: helpers: Create a helper to allocate a locking ctx
       drm/tests: helpers: Create a helper to allocate an atomic state

[1] https://www.a-or-an.com/a_an/helper

Sorry about the noise if I'm wrong.

>        drm/vc4: tests: pv-muxing: Remove call to drm_kunit_helper_free_device()
>        drm/vc4: tests: mock: Use a kunit action to unregister DRM device
>        drm/vc4: tests: pv-muxing: Switch to managed locking init
>        drm/vc4: tests: Switch to atomic state allocation helper
>        drm/vc4: tests: pv-muxing: Document test scenario
>
>   drivers/gpu/drm/tests/drm_client_modeset_test.c |   8 --
>   drivers/gpu/drm/tests/drm_kunit_helpers.c       | 112 ++++++++++++++++++++++-
>   drivers/gpu/drm/tests/drm_modes_test.c          |   8 --
>   drivers/gpu/drm/tests/drm_probe_helper_test.c   |   8 --
>   drivers/gpu/drm/vc4/tests/vc4_mock.c            |   5 ++
>   drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c  | 115 +++++++++---------------
>   include/drm/drm_kunit_helpers.h                 |   7 ++
>   7 files changed, 162 insertions(+), 101 deletions(-)
> ---
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> change-id: 20230710-kms-kunit-actions-rework-5d163762c93b
>
> Best regards,

