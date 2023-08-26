Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBA278978C
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 16:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DA810E0B6;
	Sat, 26 Aug 2023 14:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1372710E0B6
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 14:52:15 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RY0Cf5BN4z9t7Q;
 Sat, 26 Aug 2023 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693061534; bh=ThwfYGM0NU3mjhOK0XkcZ9G7D4bmCQ/+9WtFmpjV4VE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OmusnfmPOuUlb0pYCCGbDLLeOmcKXnRioq6FYzLymU9eT39caFnUCcu6rK1ECIQ11
 6wYv1qz24rB8URnVXoGNxeWpbZ8eQIQMn3F75Zs05Etg5InsiCnELKuEyheBGXof5A
 q19qn9TPZDRe6sXnZNhepYXIc73qx+iprzBdDSPM=
X-Riseup-User-ID: FC4B9D382748A4675476BC0B831CCD7A6788F0BDC0B69617667654ADCF86C284
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RY0Cc2qJSzJntZ;
 Sat, 26 Aug 2023 14:52:12 +0000 (UTC)
Message-ID: <bbd5db99-7a7a-8fb0-0f0d-f14fe333c47c@riseup.net>
Date: Sat, 26 Aug 2023 11:52:10 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/6] Increase code coverage on drm_format_helper.c
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230814-gsoc-drm-format-test-v2-v3-0-bd3e9f9bc2fb@riseup.net>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20230814-gsoc-drm-format-test-v2-v3-0-bd3e9f9bc2fb@riseup.net>
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

On 8/14/23 19:11, Arthur Grillo wrote:
> The following series include improvements and new KUnit tests to some
> functions on drm_format_helper.c.
> 
> The first patch improves existing conversion tests to assure that the
> default pitch is used when NULL is used on the `dst_pitch` argument.
> 
> Patches 2, 3, 4, and 6 add the new parametrized tests to the following
> functions:
> 
> - drm_fb_swab()
> - drm_fb_clip_offset()
> - drm_fb_build_fourcc_list()
> - drm_fb_memcpy()
> 
> The 5th patch is a change to the conversion_buf_size() helper used on
> the tests, this change was needed to make the patch 6.
> 
> a coverage report for the file can be found below:
> https://grillo-0.github.io/coverage-reports/gsoc-drm-format-test/drivers/gpu/drm/drm_format_helper.c.gcov.html
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Applied to drm-misc/drm-misc-next. Thanks!

Best Regards,
- Maíra

> ---
> 
> v1->v2: https://lore.kernel.org/r/20230721182316.560649-1-arthurgrillo@riseup.net
> - Change patch prefix to "drm/tests" (Maíra Canal)
> - Simplify the code by changing to an ternary operator on the
>    pitch (Maíra Canal)
> - Explain how the expected swab colors were obtained (André Almeida)
> - Fix multi-line comment style (André Almeida)
> - Remove unnecessary use of drm_kunit_helper_free_device() (Maíra Canal)
> - Hard-code the expected number of fourcss (Maíra Canal & Andre Almeida)
> - Fix some sparce warnings (kernel test robot)
> 
> v2->v3: https://lore.kernel.org/r/20230811-gsoc-drm-format-test-v2-v2-0-763b17890644@riseup.net
> - Hard-code the number of native fourcss (Maíra Canal)
> - Change to a ternary operator on them memcpy test too (Maíra Canal)
> - Remove the memcpy_result and place the expected values with the
>    parameters
> - s/multi_plane_op/fb_memcpy/ (Maíra Canal)
> 
> ---
> Arthur Grillo (6):
>        drm/tests: Test default pitch fallback
>        drm/tests: Add KUnit tests for drm_fb_swab()
>        drm/tests: Add KUnit tests for drm_fb_clip_offset()
>        drm/tests: Add KUnit tests for drm_fb_build_fourcc_list()
>        drm/tests: Add multi-plane support to conversion_buf_size()
>        drm/tests: Add KUnit tests for drm_fb_memcpy()
> 
>   drivers/gpu/drm/tests/drm_format_helper_test.c | 815 +++++++++++++++++++++++--
>   1 file changed, 757 insertions(+), 58 deletions(-)
> ---
> base-commit: b31f784ffff96643fa6dec31b182a3466cf4139e
> change-id: 20230810-gsoc-drm-format-test-v2-1989f08e115b
> 
> Best regards,
