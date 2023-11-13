Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F02C7E9DFD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 14:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DBE10E389;
	Mon, 13 Nov 2023 13:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic306-2.consmr.mail.bf2.yahoo.com
 (sonic306-2.consmr.mail.bf2.yahoo.com [74.6.132.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3AA10E39E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 13:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1699883956; bh=OH4ld6FDqCemDRkPJ08AOeJ0rQayuzAl7uZX775QJGU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=gJihplYoEcL3EN9LBh7hleY/ib6mpbvw6IBZzGGzbI19L7ORtsiczxF0fQGiRNJPrTWcQpqi4846mP1vxkOnbiBPgkcA4c4c+Drc71sApDVbYi0M0UnsQlIAE/XQS00wq9PxJtD6pdyAVC7f0OFiRnJ89Qa8AbSdXcCNJO6qZTtg1A3c/UKey8k2SrPmN6pElSJqbncI3VwEx0jU5kNY3zEO6LH3UjyTorC/YF82zUaR2/DHDF7kiffxbKleYbUHQ8D4HzplEXb822JgNVgzEsbHmWhQDgM6aX+LI2mqVF3yb2NdJC0bQEBH+DCOHErD9eSsicS7na8ONwrVNPyT1w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1699883956; bh=1lrQASACmSRxIco9g/Lt/xQd+/DbveWD0KBFlI3YGZr=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=kKl0anahfbiDpNB9pdwE1/DTETWomw5Dfal2gjzk0WGOlqpADlb4AbxoS6vlrY42dMhh7bi96pVHaCWOu3+S+Pn1l+xxR6PV/aZ6oMIFTAow3QvAIEK2F6WPvTGZ60cFnvJKM9JgyLRGO97G6e/4R9xay1sMQSYnK2wA4a+vC7uJpevByfMe+lX2oEvfmFbj7pYUvXk/2oFG2fF1rtzydWjkldXDkGPG7Z20mO5tGP22U0rjMf+0MxOcLRsTTNSCoFmsp92lxMkteGQ7iH53IkDUN9/dD/vBKBq4sMfMfb7lj4NHTzHud1tt6okubcpOXZcEEVKxSBojwDcScN+n/w==
X-YMail-OSG: undy1hEVM1npmOjJAEAP_BvYfMkWKDzQ3KJJUBBMB5MpU82nrVhPc1Bk1ZwNue3
 9sfPkKlmbaRH4LUWd71qiKszPpzIvU9ro_PHEOeEFaslKsue7pvPaexkVByI6Rmmr153J4_OD7YS
 gApIDIg9xIEEFyA4O8yV7LyMyO0H7NTfYmfS6HuZ.xqgjJv359Fw7dSPQ8JVahabTUDps59dpoTB
 jtGyiMUr.lnCze2YIhsmwk.Fr5BTiei7NUdnBK0Lh0994FiPhQMiJNbrltf0bNjy5_48s6pGkKg4
 lF7n8Yd0MNfMkj.xz8OIYy7KJaji8ghXmpG.xOxDC1DUTAY834AZDF0a9EtVFqEMePIgWOXQGD0Z
 ddIktJIBFWrGbqnaEKS_wZIwIfojDceUWr7tSU_6ceYnJ6IsZPfHDM.6zPfilK9KVcNDawShEcg7
 kS0S4whb5umjKMwyZ8elkUdWEIug8qd00y5tULl6T3CDuG1SFGTVUpmxF4wpArwY3N5UjQ2y83LA
 aCxm53mKbUKVShV3JM6j8NE4Nquls_LZf1Wl9iTiwYqyJNBQYl2HE7v2UsvY_LUyEo_mZLDhd_3K
 LAQQ_l7KIwfqHTMAGCB.h5d1b1vVeRIzxt5SVLXzCvxQCzwwn2RWVTrKAe2G2JqAeaDXPKu.NHk6
 4QDNYDKhoPBQDgPYFMpW1ihSQS7460mJ.SVn69_EHZpFpNNzHfL2gVNK85C8VCO4buNw3qkw.Z11
 mM.k057d9ghdp0jYqtySof_2OMLrxZDYoatIvLKEqaXPv6zIceqRa4rAR4OrcOqftUJoz1iUkRA1
 QTv508x8JPd3IzZaJJCL1RqwicWehEzCR6VOJfERPxy0quTrqrspI8MYlS1x1OcRlohoqp3t7OCV
 UHCBBYWNhps4sKdb2VTcWSILooyTOj03dSMOh5gNji1AlfPFT03viBKAnn3VcBMKYnVyQD5cSmeh
 icTY3STEPQWNyTSoFga1.0zAy_nlnh7Qt0MpSaS8N81bM0w_39DUceOdPEnVhJgwjHkLQil_oYWQ
 97hfAs3GWf2w2ZTMoHoSFuObGxOiJtjvJ32RZ1y2O3vfDxj59bpTY2Mhwo503eGyzRg9rhYCZ56B
 7w4r3ia7u8xfyUfY3_3LBfy0kyGtYHBP68r31j8702M6B8vfI6OtIXPH3zVYd4i5irbSBU8sPXXM
 _OFPihdZLxB_s0ZHmoStQ.WW5yUzVEkYaqKJoc2452WgsCKGrg2kNPJD5B7p.KgEvOTNTFsPs8TR
 MqwgOVZt2uNQuyXG9b23FeEq7LO_SImPiSrVq0E9Qo0xI.0MRMIjvyZd8MfO51zc1kHpjOYcHf6e
 KUugW1apz91owhUKLR2zGYqaFJ1YVBNq5z78EPGrApcPihHOL30Dd5D3a4agKug.TebGPihpXoaE
 9P4JBqocG3Hpv9_xWxwz8lhg5jIIBeu5ZnQEva7sdMnV1yOwthJ7CXa.XxE.lH.I4iBwC_C81qBq
 o1VcmfO_OaUfEsLpknmvPkIuO5EDsJ3vZJeX2vYieWzm7liXr7qOG.DZ03vldAJHAFDBE0GY1XhY
 nPEZdu6UTlPzXRMQxj.9L1kJgg6l4s1UPxNY5RSmmUqwwGeV9BhmrycOpCvXezY1r.jU3A7_ABgc
 UL1Mo33weIM05DywgL4sErexfj9Uen_QMQj2uLK0dS.stxtVrgvGCIeVVxsX7cTILZEJz0xlGGVA
 2fkbwPG.2d9gKJd0fyNA5rslMG1OKX0_A.HJQKyxyj_MUkP5wZNZrcLNMrplpcDBFWKSIXntweZb
 dWkg4J.b_610hmHyOEBoWaB27EId.xVrl5XkBLRQmCJwiKI3HPLi0FHNCObiDQcD0GcoahKqZlAl
 nQ5tQiKlv_Kv720sVaCJdO.hKrs8fkuXlc2xZtsLkRvklopr1Tg8CsDaNfpgL68pCq9SgKqmNC0V
 KKvP44UXsHESHiGPC1TzlF.c0Wf6HhuefydiThyNpa6tG1ISLHksq1c.Eezf_VkVoOs_R8YD2ZHr
 DNV6VBcmy37OvXGQdJEI2nV_hFKi9huFw_3g15sUvjSZ2yPnnNQXqLO3LGt3tvnFouNjZk9vp680
 ku6Fz9sv2ilV.DdMOjd0.eaPfM7tJ6KCHce2KvpaxbXPUv4EM7l0BxR_IW.w7Hdos5ElrMXyXK7.
 EQZ3i.NAvMlBEvIusgFkj6heqwEgL53XfzT5tF179TYmpCdAHdgkYvoeZNWuRUem50UjixWGdSD.
 xtcELx7wzdoJW8DoHDalTEdknbBakbVSddZL4vQ289FjjuL9GNqpmsBbVvs6J_IqZ1Q--
X-Sonic-MF: <bluescreen_avenger@verizon.net>
X-Sonic-ID: f0023e9b-c60b-45ad-b7d8-b525be91194d
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.bf2.yahoo.com with HTTP; Mon, 13 Nov 2023 13:59:16 +0000
Received: by hermes--production-bf1-5b945b6d47-tz7d5 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e1a7c1dbe66d406d106f524291c2be05; 
 Mon, 13 Nov 2023 13:59:12 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, noralf@tronnes.org, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [RFC][PATCH v5 0/6] drm/panic: Add a drm panic handler
Date: Mon, 13 Nov 2023 08:59:11 -0500
Message-ID: <12347304.O9o76ZdvQC@nerdopolis2>
In-Reply-To: <20231103145526.628138-1-jfalempe@redhat.com>
References: <20231103145526.628138-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailer: WebService/1.1.21896
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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
Cc: gpiccoli@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, November 3, 2023 10:53:24 AM EST Jocelyn Falempe wrote:
> This introduces a new drm panic handler, which displays a message when a panic occurs.
> So when fbcon is disabled, you can still see a kernel panic.
> 
> This is one of the missing feature, when disabling VT/fbcon in the kernel:
> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
> 
> This is a proof of concept, and works with simpledrm and mgag200, using a new get_scanout_buffer() api
> 
> To test it, make sure you're using the simpledrm driver, and trigger a panic:
> echo c > /proc/sysrq-trigger
> 
> v2:
>  * Use get_scanout_buffer() instead of the drm client API. (Thomas Zimmermann)
>  * Add the panic reason to the panic message (Nerdopolis)
>  * Add an exclamation mark (Nerdopolis)
>  
> v3:
>  * Rework the drawing functions, to write the pixels line by line and
>  to use the drm conversion helper to support other formats.
>  (Thomas Zimmermann)
>  
> v4:
>  * Fully support all simpledrm formats using drm conversion helpers
>  * Rename dpanic_* to drm_panic_*, and have more coherent function name.
>    (Thomas Zimmermann)
>  * Use drm_fb_r1_to_32bit for fonts (Thomas Zimmermann)
>  * Remove the default y to DRM_PANIC config option (Thomas Zimmermann)
>  * Add foreground/background color config option
>  * Fix the bottom lines not painted if the framebuffer height
>    is not a multiple of the font height.
>  * Automatically register the driver to drm_panic, if the function
>    get_scanout_buffer() exists. (Thomas Zimmermann)
>  * Add mgag200 support.
>  
> v5:
>  * Change the drawing API, use drm_fb_blit_from_r1() to draw the font.
>    (Thomas Zimmermann)
>  * Also add drm_fb_fill() to fill area with background color.
>  * Add draw_pixel_xy() API for drivers that can't provide a linear buffer.
>  * Add a flush() callback for drivers that needs to synchronize the buffer.
>  * Add a void *private field, so drivers can pass private data to
>    draw_pixel_xy() and flush(). 
>  * Add ast support.
>  * Add experimental imx/ipuv3 support, to test on an ARM hw. (Maxime Ripard)
>  
>  
> With mgag200 support, I was able to test that the xrgb8888 to rgb565 conversion is working.
> 
I am unable to test with that hardware, but I am able to test with simpledrm, and it works pretty good
> IMX/IPUV3 support is not complete, I wasn't able to have etnaviv working on my board.
> But it shows that it can still work on ARM with DMA buffer in this case.
> 
> Best regards,
> 
> 
> Jocelyn Falempe (6):
>   drm/format-helper: Add drm_fb_blit_from_r1 and drm_fb_fill
>   drm/panic: Add a drm panic handler
>   drm/simpledrm: Add drm_panic support
>   drm/mgag200: Add drm_panic support
>   drm/ast: Add drm_panic support
>   drm/imx: Add drm_panic support
> 
>  drivers/gpu/drm/Kconfig                  |  22 ++
>  drivers/gpu/drm/Makefile                 |   1 +
>  drivers/gpu/drm/ast/ast_drv.c            |   4 +-
>  drivers/gpu/drm/ast/ast_drv.h            |   3 +
>  drivers/gpu/drm/ast/ast_mode.c           |  26 ++
>  drivers/gpu/drm/drm_drv.c                |   8 +
>  drivers/gpu/drm/drm_format_helper.c      | 421 ++++++++++++++++++-----
>  drivers/gpu/drm/drm_panic.c              | 368 ++++++++++++++++++++
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c |  30 ++
>  drivers/gpu/drm/mgag200/mgag200_drv.c    |  25 ++
>  drivers/gpu/drm/tiny/simpledrm.c         |  15 +
>  include/drm/drm_drv.h                    |  21 ++
>  include/drm/drm_format_helper.h          |   9 +
>  include/drm/drm_panic.h                  |  96 ++++++
>  14 files changed, 966 insertions(+), 83 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_panic.c
>  create mode 100644 include/drm/drm_panic.h
> 
> 
> base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
> 




