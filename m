Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B672356C948
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 13:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7960E112E2F;
	Sat,  9 Jul 2022 11:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF80C112E2F
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 11:58:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so580379wmb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Jul 2022 04:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UsNbjJkPi35YcKIm8xIJWUJDks0rt+PESYRUBN9kku8=;
 b=IB1+HRcX+LB24QOhTI9VjtgQFzYGZ45+RbXu5lKXInLxkZAdOqsghJ5pivrQiCdcf9
 2Plmxz9JdwvOTdjo690ZwI1u6kvH3wPWEDYgQnA6uPLMakGpVkY+pCkJiL/E+yI/Ur8B
 Pr9dl1Y0kuXIpEX3k4f9wkvDIgy+TAk/m1C0cnlIg3lL9SMNXBSVrcXK38J/7puFtZQr
 RYjFYbPwBep78N9fyor6atRvWu94mcul8/YAgIAIvfGaN3ejNdsj1DuBYoJ6kYaxuDEg
 HtvHE8223/bzPorqXa+WHDPIDVWuqrJ4PFZu2EbzkR8Gf+Kbdey18uxZJOGj4WVgYhYN
 6xXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UsNbjJkPi35YcKIm8xIJWUJDks0rt+PESYRUBN9kku8=;
 b=C7pZLsh/UkoFT6qecVqGt0ce0zN5S/bOQVJGbTKfpAjjdnmH2q56gBN41yw1Ly4EGc
 4TXTB4wv7E/GbRsGG2eQM7y4vi8X6ah/NCr4d3Jv1uE7FvZPHfGCKTmoGZewKIL/KrUP
 U7oENCbQQ3vSlEzE+fK0nkeL+aWVUZXE5zFgSyhWCkFe7xGmIml+PQ026jzI/jidYVs9
 tt4VXcCWLbDhV7sYUFzUajtX4kK38UHciMXakrFPc5tCA+VGhatGSz0jVcOEBOd2usv+
 NMaqbpLgXQBAqdkfAndUKg2bLudT4wBTGFZ2ifoCaMNKpSeyEbXJlLIBodq4ohpyFTkd
 rpvg==
X-Gm-Message-State: AJIora+MusH+8aqEA/BXogMCITguSJBeTVJP1jj/GyCJruWhC412a2rO
 7SuyyDXsVqlX4JSULPa/8oI=
X-Google-Smtp-Source: AGRyM1tNlHZy4jrgiSE9aRqe/KuSFnkiJeZUNpSv0Om7RwfJF2w15lTa5FVK4l5mPUiEOp9xYnLduA==
X-Received: by 2002:a05:600c:3d8f:b0:3a1:963d:202d with SMTP id
 bi15-20020a05600c3d8f00b003a1963d202dmr4980849wmb.11.1657367925933; 
 Sat, 09 Jul 2022 04:58:45 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.185])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b0021cf31e1f7csm1199494wrb.102.2022.07.09.04.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jul 2022 04:58:45 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v2 0/4] KUnit tests for RGB565 conversion
Date: Sat,  9 Jul 2022 13:58:33 +0200
Message-Id: <20220709115837.560877-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 magalilemes00@gmail.com, airlied@linux.ie, maira.canal@usp.br,
 dlatypov@google.com, linux-kernel@vger.kernel.org, tales.aparecida@gmail.com,
 davidgow@google.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

This series is a follow up of the XRGB8888 to RGB332 conversion KUnit
tests.

The first patch fixes a bug reported by David Gow in the XRGB8888 to
RGB332 tests.
Note that the fix is required for this format because internally, the
drm_fb_xrgb8888_to_rgb332_line() function, calls le32_to_cpu().
The other *_line() functiones don't change the endian. That's why the
RGB565 tests don't need to make any endian conversions.

I'm not sure whether this inconsistency handling the endian could be
considered a bug or not, but at list it is confusing. It'd be
interesting to hear the opinion of the maintainers on this topic.

Patches 2 and 3 make the test generic and the last one tests
drm_fb_xrgb8888_to_rgb565().

Best wishes,
José Expósito

Changes since v1:

 - Fix a bug reported by David Gow in the XRGB8888 to RGB332 tests
 - Simplify the test structure as suggested by David Gow
 - Add Tested-by Tales L. Aparecida and Acked-by Thomas Zimmermann
 - Fix link in the last patch (Thomas Zimmermann)

José Expósito (4):
  drm/format-helper: Fix test on big endian architectures
  drm/format-helper: Rename test cases to make them more generic
  drm/format-helper: Support multiple target formats results
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb565()

 .../gpu/drm/tests/drm_format_helper_test.c    | 167 ++++++++++++++----
 1 file changed, 136 insertions(+), 31 deletions(-)


base-commit: 6fde8eec71796f3534f0c274066862829813b21f
prerequisite-patch-id: 8a16f4c8004d6161035eaea275c8eafaa0ac927e
prerequisite-patch-id: 53fded2a49e6212b546db76ec52563a683752e65
prerequisite-patch-id: 294b0ca27a6ee57096c8f097c0572336b8a2d583
prerequisite-patch-id: 5e05bfc5287d16c207bfc616b2776ad72eb4ab29
prerequisite-patch-id: e94560be85dffb62a5b3cf58d1f0fc3d278ad806
prerequisite-patch-id: a471df39c7b32c69dd2b138a7d0af015ea42e00a
prerequisite-patch-id: 04e8b96dd1319088e45d4b4dc4beb29889b30941
prerequisite-patch-id: bda9f93309910ca6d9528c9c560a3ccb7c388bfa
prerequisite-patch-id: f45a301abf3874302b47751378d1cb4da01a1e2a
prerequisite-patch-id: 7e8d74a4769f5bc8f2a1ced1de64aa13ea7b9d6c
prerequisite-patch-id: cfa9be5a3b48cada74c681ebe967ef2a3ac572a0
prerequisite-patch-id: f4d0b5ba40437486248a6df6ab022a3428898273
prerequisite-patch-id: f6380c88b6640cd57b867a59ed42a2fc754fa9e4
prerequisite-patch-id: 112685a3c337b3bc8ff9507ab832c6322a77a2cc
prerequisite-patch-id: 3f69109f64a8b7ac85a0332d177c8b2216cc747c
prerequisite-patch-id: 7f0a3edb0b94bd54681d67c50a23008ccdb18c00
prerequisite-patch-id: bfb6024a0e542cdc89f1f2a98cc249a2c071c68f
prerequisite-patch-id: b569ec32d7a4a9c7be317e8a8f0177ad4f696a10
prerequisite-patch-id: f1f7adf96de1501469c223a50d6405dc4b378982
prerequisite-patch-id: ce194443e4d40ded9bcec371717566398333e1db
prerequisite-patch-id: 253ba111d18eea436c45fc43216b7d3ddba41388
prerequisite-patch-id: fac3f1b822c5154bc16eae9eb97b95fa19c178ad
prerequisite-patch-id: 7eeca32e531b0d97d67285c106c1e721158da931
prerequisite-patch-id: 2b1b9ce615e8856f7e236f5fbaf7dfcd625da2ea
prerequisite-patch-id: 6e45198758680c3ed23f58ee049d93f63d316d88
prerequisite-patch-id: 58c3a87ebf0a31d65a3a787121a066013e1da82e
prerequisite-patch-id: e62f9ef9e892d075778094ee5b4e4e9d9cc76c86
prerequisite-patch-id: 3a7abafa7b011cbeca304f8af85b88aefc55cf64
prerequisite-patch-id: 1146b840a8ff43a4fdc8382c6c4d133aae6ec2fa
prerequisite-patch-id: 1455f1117f208d983759d89b750440d349a880c2
prerequisite-patch-id: 92d0eb8a4e06da97b18a5cf28a81fc90158c444d
prerequisite-patch-id: 2ab38ae9cea6d979bff04345550a1a848b55a091
prerequisite-patch-id: 25b591d59400b972ed1b709d932feaba0d5f642e
prerequisite-patch-id: 003dca01353bba78d1a05baa5852acb1b313a154
prerequisite-patch-id: f7beda6d5b2aa56ecd5ce610f36db704d1fbd653
prerequisite-patch-id: f641abe09200a8b9507124949bab294a05529175
prerequisite-patch-id: 1fa4294e769b40dca3b89fa160c4ae1ff9eff8b7
prerequisite-patch-id: 9d04c01b752031e874286e121a64844891008a14
prerequisite-patch-id: f34a698723d7df6b6a4d17686395af8b694186e2
prerequisite-patch-id: 488ab7cec987c0a6c8c032fc74ad79a40bf546f9
prerequisite-patch-id: a5a4c847fb9b55f53eaef99b353749f61dd1f72f
prerequisite-patch-id: 443d79ee1834963cb1f2a4e0007d02e419a2f5ff
prerequisite-patch-id: 15add4faa533058e2ef962aeb7563835c6cbd82a
prerequisite-patch-id: 6afb078b02085c4b24136bff54941a11090ea738
prerequisite-patch-id: da36728d198481270fb9695c7d86d210111353c2
prerequisite-patch-id: eb412a9ebab86d80a96f3c32690e5a96ed5a9ebc
prerequisite-patch-id: e33a4314f9bb9caf819f5e350c50b5b571d68e37
prerequisite-patch-id: 10ec9def77f602a29e20ac1b4193bbc7e932a7f5
prerequisite-patch-id: 970edbb64a43f50ac7e80f2f0258767a08b8294c
prerequisite-patch-id: f089485485d6e374fca925da2b904867c8e60a74
prerequisite-patch-id: b60e812dbb263d1b9c27f46bf487f4f73568a9d0
prerequisite-patch-id: 6344323c6242f0fa4402003f63cac9bc63fc7752
prerequisite-patch-id: b4d1a179227563da227593d7588306c9e676c6af
prerequisite-patch-id: 48dbb90b0dbd77ad1e6ae8101804d23bb855645f
prerequisite-patch-id: f104eb773c8c0b0ead12b8576ce0052c646cf598
prerequisite-patch-id: 4e6659a16896cb1546dc272a7db2893873d3d7c0
prerequisite-patch-id: ea56ba8675748e2fb5a942244a77a17ca1650de5
prerequisite-patch-id: df4cd3120fe4bb1ae6322ae908739fb1f620e660
prerequisite-patch-id: 533aee0b212f50f0dcf705b7e04c626340f4bd36
prerequisite-patch-id: 599329c73d4c591a95c8031a41c080115a6d602b
prerequisite-patch-id: 0f27a6299d98e481e523a93f2c494079b4c2ad4a
prerequisite-patch-id: 7621b25a47ee43ae20862c285e0b2d236311788b
prerequisite-patch-id: 72b2b9c39cf28cf2c2282231838184caba0b250d
prerequisite-patch-id: 80bf2499edfee73e4e4672619ee4da47df53d4c5
prerequisite-patch-id: 97745925e55ae5c66e379a637f0c432b5cd4c5a9
prerequisite-patch-id: 76d682950bf55d9b6a6e4df9dcd52278f534d41c
prerequisite-patch-id: 4bf1847249b002130e4e59d8a83ad6af0b27508f
prerequisite-patch-id: 1760ca541aa2cf8e892d7e6b8620b566f5d9bd05
prerequisite-patch-id: f63faffa66e94f9f330fda71dfc9f4a55b4f3d07
prerequisite-patch-id: cb8e14eefb9813f539ba1a5b5f78be5df351888d
prerequisite-patch-id: d42116fc0ae5898cdcf0d47d99866a0e328d27c7
prerequisite-patch-id: bc81a5b598bdc0e91286cef08957f5ed627b6a41
prerequisite-patch-id: 693319f739fbffa8be024f7a6ef8265caa48ef1b
prerequisite-patch-id: e10dc3d38993222d15a095f33f5150c1998d2c62
prerequisite-patch-id: 6b2a39c25f3938b86cb71ed70b7330ded34e0a2e
prerequisite-patch-id: cde017ae3f0c1691dcb437095804ef5207520f9a
prerequisite-patch-id: 1c79ba2de78c4fbf91a4371c32f8e31bcffe5493
prerequisite-patch-id: 00079a82e7089c6aacb7610953b6fbe99167dba1
prerequisite-patch-id: 609e49dc054b83b9e4b5961e9a7c956a3d54ab51
prerequisite-patch-id: a8394a54421133ddfaeb486d13a135479beb12ad
prerequisite-patch-id: 25eaeb161a40979bfa8ca4ee6246a5338d61e972
prerequisite-patch-id: be89047878944cfb969e544179f42008a3b9dae4
prerequisite-patch-id: 45bc4815468fc4c240b9291e87195ba6a56c8ced
prerequisite-patch-id: df771a5eda31e2bf8a1d46f6d38049d76fd8fa3c
prerequisite-patch-id: 3031536f5d0e359d3ff190b08e8dd8b0a1cd9bff
prerequisite-patch-id: 4c241d97f6c49494f73978ec24691b91e5ef96af
prerequisite-patch-id: a0c4a7df919ffcfd2698d7a8aaf8ae08e5005153
prerequisite-patch-id: dd85b9081eb9bc7e15a54ac958a844afc88f6716
prerequisite-patch-id: fdee5e717d385329c229a42b7aea83d29ab6d2b6
prerequisite-patch-id: 7caeb6f71b1d618fe310bb05cc5f3e6b48bd16e9
prerequisite-patch-id: ed364b5c9a5014df39654a6ba626baa7f67cf99a
prerequisite-patch-id: 56d211f7e8c7601370370e07bedff01f9f3cd4df
prerequisite-patch-id: 1c43718b51bf2e0ae545367b48b2a353f0f7289f
-- 
2.25.1

