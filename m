Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBD692A776
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 18:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CC010E0B5;
	Mon,  8 Jul 2024 16:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="eqQFY7d9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296A210E129
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 16:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 8468A4192B;
 Mon,  8 Jul 2024 18:39:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gTtGZ9dbAxBC; Mon,  8 Jul 2024 18:39:02 +0200 (CEST)
Message-ID: <aa9c189e-b9b5-428b-995c-7dd5b68dc51c@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1720456742; bh=V9mNn1vfnK5z4HghpcE26HkNpnS83uwKsBEMkqfyIaM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=eqQFY7d9ytMZd9sEWF0ZjWk8ZvTjv8mVTXFAWaIRjPZlcssemrrV5i1OpvQ2K8L+Y
 sJVMM2mSBE2skuOzan0LhkmPHknkbEqgR2a7zkIDqBnfcpPCcqcu1ImqrBJNW0Rl0G
 k0cLCtiikU8AwuB2PfkH/0TrbQo9JwVyMHzZFQwIGct/8jlaFITVS9tDSbd2Ih/77h
 DiHvEv0RpuYT5qSqM0UCV2PXl0E+Qf0IuxYKDB3q+4+oTTbPWE+jbFqcoOSIrUwN0v
 W4o67m4XLYJabjFXpsftrPMfA1PyR9XiRBCkg2cXIsSqhUwGCaAvj4XEYUcf8Or40K
 WnKzUc3P87Yeg==
Date: Mon, 8 Jul 2024 13:41:37 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v3 9/9] drm/tests: Add test for drm_framebuffer_free()
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240703172228.11166-10-gcarlos@disroot.org>
 <98849e7f439a542f6c42e0dfa01a7a6f@kernel.org>
Content-Language: en-US
From: Carlos <gcarlos@disroot.org>
In-Reply-To: <98849e7f439a542f6c42e0dfa01a7a6f@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime, thank you for the review!

On 7/8/24 08:36, Maxime Ripard wrote:
> On Wed, 3 Jul 2024 14:22:28 -0300, Carlos Eduardo Gallo Filho wrote:
>> Add a single KUnit test case for the drm_framebuffer_free function.
>>
>> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Accordingly to the kernel bot report, I forgot to export
drm_mode_object_add symbol for the test and I'll include the
EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_mode_object_add) in v4. Since this
will be a little change, must I keep your Acked-by in v4?

Thanks, Carlos

