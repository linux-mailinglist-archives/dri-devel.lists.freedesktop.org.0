Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5317BA3A397
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4563010E04F;
	Tue, 18 Feb 2025 17:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FuokI1Jp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EDC10E04F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:16 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4397dff185fso25372335e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898494; x=1740503294; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RcINKfr4lNxFYF9r6nCx7oKwteN5FJxyS4A/b+jWADQ=;
 b=FuokI1Jpp0FHpjXFFH9Q3RhPPQo2gNcnI7wVLzbH5k9+gwBX8OkhOPTTx8q9dWmdLv
 SOIyrzhfCnJKYaDvyetTfb+5upq1jND4FaWRTmlWVdCllUJa6geCIFaewadFF1m94zrO
 izUVjrnTBQj5URTUnl8ExfUaLuT5R4/iDWbyn5fM6V6y30BYgCOAxM8wE0vVROS5B+R6
 6A0tqKvTN8gudov6VKFKANncbhYaB1ioXMrzU2jKM4isgZnWO7jJ5iew9O4EyARZlixX
 na7ckdRtADst8cMoINE8myUD+MeWHD8io3w+tvc6FIRhJ2Yxi4bSY8u2/Y9loHSb9n/I
 ZoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898494; x=1740503294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RcINKfr4lNxFYF9r6nCx7oKwteN5FJxyS4A/b+jWADQ=;
 b=kThli1r0CqDHhwqe8/svPy0Z7JgGKebgbaxFmj50gFCxu3gxwhtR2zIz/sxO4I8/ne
 Z552u3LBdTssIbXUGZNaEgOHSOWfPG/0N1u+nAkPsAqHJ710r/20yGoHiFW8BT+vBNQp
 DQjFr3JeTwKHkzmEVIoVFTf+3noRLTMKL1c9gjeZ0MJulloHKy+bJSiL2dLxB9ozw8QX
 DPvFqapdL60Akb1aAa47/Is7LaTQzoORyY1HXTMARBn3lZueix6+82Tbk6V4m4HlBsYZ
 8dUgzDKJYw6o743GZklVeOih+lvgIShgColqM5t3VASAXX7NyTjdQhVe6JgTazgqL1MX
 p3gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaED05Ot+EbRIGCOfa8QS7oR0lvMt7QfQLIBfE+ZedzBP2bKeKN73LZYx6wkh/UIVZtwl3j05XQ+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0zR7O9UDxY6kjtmLb1iG8BQpj4Mh8Ed2oBZUzVIs9TTlPANJL
 aKuH7tB8FWREWKf80uDT620+OFBxyK4vBN16uE+F6HTfgBObJZ2W
X-Gm-Gg: ASbGncvijMKaKlOWrrPf6dXLklGsUG1/Jx4nAsdZcmvtcyj48izJ0cUYte8vWKZ3wPc
 UdZdKfLIGacfc1nK/zfvH4qtS1Rb1TxFKuK8aBtDdhh5Rbx0s2PofWSLfv16lguZYSzcDDBA4ZJ
 gRC1Im8mrhfIwFNU5nOQQ1vd9T7+jPr4P2ynQJjcANfZ7r9J+gGsfXxMjEDDTuQgApvT5+NCB0o
 Fz/Eno+jaFS4hzp/LirF4Oi2Bj/6ypnrWOwHbNYbyY/Kx/NexjaRvo30zj7CFpGPu+lbN4vD7hf
 c5/b9dZt7cf/nuzuHw==
X-Google-Smtp-Source: AGHT+IG9C3A51BmI5k+8FyoWsU577SQrMSbXBykQTnn69muiTH5WsxRqpQohcGqHEI+4n5L2FDAxAw==
X-Received: by 2002:a05:600c:5114:b0:439:89d1:30ec with SMTP id
 5b1f17b1804b1-43999ddb366mr4539495e9.29.1739898492748; 
 Tue, 18 Feb 2025 09:08:12 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:12 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 00/16] drm/vkms: Add configfs support
Date: Tue, 18 Feb 2025 18:07:52 +0100
Message-ID: <20250218170808.9507-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

This series, to be applied on top of [1], allow to configure one or more VKMS
instances without having to reload the driver using configfs.

The series is structured in 3 blocks:

  - Patches 1..11: Basic device configuration. For simplicity, I kept the
    available options as minimal as possible.

  - Patches 12, 13 and 14: Allow to hot-plug and unplug connectors. This is not
    part of the minimal set of options, but I included in this series so it can
    be used as a template/example of how new configurations can be added.

  - Patches 15 and 16: New option to skip the default device creation and to-do
    cleanup.

The process of configuring a VKMS device is documented in "vkms.rst".

Finally, the code is thoroughly tested by a collection of IGT tests [2].

Best wishes,
José Expósito

[1] https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
[2] It is not in patchwork yet, but it'll appear here eventually:
    https://patchwork.freedesktop.org/project/igt/patches/?submitter=19782&state=*&q=&archive=both&delegate=

José Expósito (16):
  drm/vkms: Expose device creation and destruction
  drm/vkms: Add and remove VKMS instances via configfs
  drm/vkms: Allow to configure multiple planes via configfs
  drm/vkms: Allow to configure the plane type via configfs
  drm/vkms: Allow to configure multiple CRTCs via configfs
  drm/vkms: Allow to configure CRTC writeback support via configfs
  drm/vkms: Allow to attach planes and CRTCs via configfs
  drm/vkms: Allow to configure multiple encoders via configfs
  drm/vkms: Allow to attach encoders and CRTCs via configfs
  drm/vkms: Allow to configure multiple connectors via configfs
  drm/vkms: Allow to attach connectors and encoders via configfs
  drm/vkms: Allow to configure connector status
  drm/vkms: Allow to update the connector status
  drm/vkms: Allow to configure connector status via configfs
  drm/vkms: Allow to configure the default device creation
  drm/vkms: Remove completed task from the TODO list

 Documentation/gpu/vkms.rst                    |  98 +-
 drivers/gpu/drm/vkms/Kconfig                  |   1 +
 drivers/gpu/drm/vkms/Makefile                 |   3 +-
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  24 +
 drivers/gpu/drm/vkms/vkms_config.c            |   8 +-
 drivers/gpu/drm/vkms/vkms_config.h            |  26 +
 drivers/gpu/drm/vkms/vkms_configfs.c          | 918 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h          |   8 +
 drivers/gpu/drm/vkms/vkms_connector.c         |  26 +-
 drivers/gpu/drm/vkms/vkms_connector.h         |  18 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |  18 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |   4 +
 drivers/gpu/drm/vkms/vkms_output.c            |   2 +-
 13 files changed, 1138 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h


base-commit: 9b6c03cb96b9e19bce2c2764d2c6dd4ccbd06c5d
prerequisite-patch-id: 1bff7bbc4ef0e29266265ac3dc009011c046f745
prerequisite-patch-id: 74a284d40a426a0038a7054068192238f7658187
prerequisite-patch-id: c3e34e88ad6a0acf7d9ded0cdb4745a87cf6fd82
prerequisite-patch-id: 9cd0dfaf8e21a811edbe5a2da7185b6f9055d42d
prerequisite-patch-id: f50c41578b639370a5d610af6f25c2077321a886
prerequisite-patch-id: 5a7219a51e42de002b8dbf94ec8af96320043489
prerequisite-patch-id: 67ea5d4e21b4ce4acbd6fc3ce83017f55811c49b
prerequisite-patch-id: 37a7fab113a32581f053c09f45efb137afd75a1b
prerequisite-patch-id: 475bcdc6267f4b02fb1bb2379145529c33684e4f
prerequisite-patch-id: d3114f0b3da3d8b5ad64692df761f1cf42fbdf12
prerequisite-patch-id: d1d9280fb056130df2050a09b7ea7e7ddde007c5
prerequisite-patch-id: 2c370f3de6d227fa8881212207978cce7bbb18ba
prerequisite-patch-id: 938b8fe5437e5f7bc22bffc55ae249a27d399d66
prerequisite-patch-id: ab0a510994fbe9985dc46a3d35e6d0574ddbb633
-- 
2.48.1

