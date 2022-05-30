Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6965378E4
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 12:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA0F10E09A;
	Mon, 30 May 2022 10:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D5310E09A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 10:20:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e2so14037195wrc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 03:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iSDSkDwe5TVDF25IfuixvEtNIij4LrLrDKNo2ck2+3w=;
 b=KZPCK9eNNHJsCvUGVAtIz3ORepDzJHXdkPg3xydNMF4ak6Cam+1ABcf688evH7UulR
 K1R94B2FaMN1IEJ/OxaYHEJ60I0T5oiaT23E44sC4oaVcIgMPUJ9J+JCFcBtXUPHgErv
 wKL7fMlm82j1h379IHL+PEPp3ggUNr2l38uWMxpCfCbYkmvTpEP/9PGIzvnOs4WhMW5c
 0jFwYZ6HuOmTo4YcwDBCF5Z1yEKED7hwILlxW/Lr3qUlPp4vnhMFwjXDNT7mQkshL1GY
 6TcwNesFg3i2hDq3GZjpxkgNkmZIRvkAaQtqe1kBA7RFOENjX3sKriy8MlvKDjV3viaa
 ZU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iSDSkDwe5TVDF25IfuixvEtNIij4LrLrDKNo2ck2+3w=;
 b=Atmv1XukgqDpffoNrSdkZoI/dWN+0yZU8c0KiDNK2sybtRGOPBYePaSQOQ4qcCRPZ6
 hmeFGOFetsSlY43h9MuSqhLlyAyzpHTEY2sL/mbtLzvKI+wqz9srGTOQ/CFeqO+ibWEq
 6VIP8hk5eoPI1ulPNktxErS4SnRWJ9OE7RrgXbNAeFEWWjpsTRg7obo3+oUzrFqwcPEZ
 Nh6omO62U14eoR7OUjUCp02mZDrLPhjab02fSq7QC4fja6CN1Qt4BgX5bi6Fp3DFN9MD
 y6ndY3avpzPOaKXX1UhYPT1N+893Y1xKYbLk3iqKFHmgHPfIJftWNoBeBkUVdXTIHaUq
 8qBQ==
X-Gm-Message-State: AOAM532jw/+3n1RHAnA3LqBc3TZ5/NlRS/TdQKjsECMzvQpuPDKz/Fev
 s36dI5bd7278Q6SDW3WcaXM=
X-Google-Smtp-Source: ABdhPJzmUtFAycXckGNqB9yrdwEMjtpJlJ4mQy+eMo3MH1HyO3jFcsLNoOBmWOoMwKDZ8PGsDmjl0w==
X-Received: by 2002:a05:6000:168a:b0:20f:d6e8:a5b with SMTP id
 y10-20020a056000168a00b0020fd6e80a5bmr31669045wrd.41.1653906025599; 
 Mon, 30 May 2022 03:20:25 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c358c00b003973ea7e725sm12986293wmq.0.2022.05.30.03.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 03:20:24 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [RFC PATCH 0/1] KUnit tests for drm_format_helper
Date: Mon, 30 May 2022 12:20:16 +0200
Message-Id: <20220530102017.471865-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

Recently Javier added a new task in the ToDo list [1] to create KUnit
tests for the functions present in "drm_format_helper".

This patch, marked as RFC to start the conversation, includes tests for
"drm_fb_xrgb8888_to_rgb332".

Since the conversion functions present in "drm_format_helper" convert
from XRGB8888 to another format, my plan is to create a set of XRGB8888
data to test all the available conversions.

To illustrate it with an example, the code present in this patch:

	{
		.name = "Single pixel source",
		.pitch = 1 * 4,
		.dst_pitch = 0,
		.clip = CLIP(0, 0, 1, 1),
		.xrgb8888 = { 0x01FF0000 },
		.expected = { 0xE0 },
	}

In a follow up patch, should look like:

	{
		.name = "Single pixel source",
		.pitch = 1 * 4,
		.clip = CLIP(0, 0, 1, 1),
		.xrgb8888 = { 0x01FF0000 },
		.expected = {
			{
				.dst_format = DRM_FORMAT_RGB332,
				.dst_pitch = 0,
				.conv_func = drm_fb_xrgb8888_to_rgb332,
				.result = { 0xE0 },
			},
			{ ... },
		},
	}

What is tested?

 - Different values for the X in XRGB8888 to make sure it is ignored
 - Different clip values: Single pixel and full and partial buffer
 - Well know colors: White, black, red, green, blue, magenta, yellow
   and cyan
 - Other colors: Randomly picked
 - Destination pitch

What is NOT tested?

 - NULL destination buffer: Because there is not validation in place
 - Out of bounds destination buffer: The size of the buffer is not
   checked. The conversion function could cause out of bound errors
 - Out of bounds source buffer: Similary to the destination buffer, the
   source buffer is read without checking its size
 - Invalid clip values: Because there is no clip validation.
   Example: clip out of or bigger than the source buffer
 - Invalid destination pitch: A dst_pitch < (clip->width * dst_pixsize)
   could cause issues.
 - "Big" source buffers. I don't know if this kind of tests could be of
   interest

How to run the tests?

 My .kunitconfig:

 	CONFIG_KUNIT=y
 	CONFIG_DRM=y
 	CONFIG_DRM_FORMAR_HELPER_TEST=y

 $ ./tools/testing/kunit/kunit.py run --arch=x86_64

Feedback?

 It'd be great to know your ideas about what else we could test, if you
 think that we should make the functions safer by checking the buffers
 and clip sizes or anything else.

Thanks a lot,
José Expósito

[1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=596c35b1440e

José Expósito (1):
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb332()

 drivers/gpu/drm/Kconfig                  |  12 ++
 drivers/gpu/drm/Makefile                 |   3 +
 drivers/gpu/drm/drm_format_helper_test.c | 166 +++++++++++++++++++++++
 3 files changed, 181 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_format_helper_test.c

-- 
2.25.1

