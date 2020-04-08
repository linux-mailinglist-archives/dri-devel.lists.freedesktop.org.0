Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E107B1A1BC5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA1D6E1B2;
	Wed,  8 Apr 2020 06:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEBF6E1B2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 06:05:42 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id j4so2037127qkc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 23:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i3YYftYCfrhJjBZZ31eyPIp2ch2qqn2ebn4+Xy1T8GM=;
 b=mz1/1VoSkSn8lIOzYyt+hoarBQ1UWUZd5QYpTPClZskcGof5rbMLfBlcO0b6FeThy8
 GivJZVp7anhPLhtV99KRCAA2/1kPkMjhIIj23PLzre2mRfXiczXolpQsPmtIUMgLGSUv
 72pYMDVrzBTXcE2VpUaKV1VY9AKeus3Q3x8j4regBUXTeZq8Z0IxDyFiZtWlQdPBOB3m
 Cvb8Kq9ADE4bX3LQCfvrT4qkbalweYD0Mp5geM39vmknMkAlPnGPWqnWNAitM1zB0JQN
 MAzolMAp3LlMUuEIlHMXS0kWg2IJBwwGgd1G3tlOdN5Z/XiXHlyi/COV0cHnZBYSi4jO
 M1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i3YYftYCfrhJjBZZ31eyPIp2ch2qqn2ebn4+Xy1T8GM=;
 b=VzNj95MEu8f1JS/2o2fq0XDFsRty10IaiJmOsypI5fxsehGqpFVG5ye8Ly9IM7SnKa
 QDR7GxwkMlUcAmwk6S22rhCy84xE66xnRVZwKlagEBs6qaM1sLuqsL7s8tfX/3Q/pmDK
 RLqvdhblV7werjfrT8IRO8E5lcALr6bS54XKjmubyXrp2jmZWtRQ2mgJWQg8sEC19Q/X
 Iu+xkIqPUuep94oIXnNmgFFA+47QgVv06IVP1QR++4JVirK/ZlbAGabYQUPsK0qvrTbW
 MYAnKhml0Q5lTM9bCsaKy5gNDeBgFtZ2Bucn/Bu0d8X1ZYFXoaLQUQVEr5LREPyhslG0
 GHaA==
X-Gm-Message-State: AGi0PuZA3zQtFZRZM1Hl8dE08TxbuqqfWCmFhifbSYldSrSMpegzlY0a
 WGmXuANhsXVW2kXhdC4lCNc=
X-Google-Smtp-Source: APiQypL97PJUfEmdYSkziP+A+Mrzd39ffS+akOz263Ejgd1uwHqIfFVDlMZwNT0XGGInVIQPwZHKdg==
X-Received: by 2002:a37:67c8:: with SMTP id b191mr5720639qkc.166.1586325941141; 
 Tue, 07 Apr 2020 23:05:41 -0700 (PDT)
Received: from arch.localdomain (189-69-221-86.dial-up.telesp.net.br.
 [189.69.221.86])
 by smtp.gmail.com with ESMTPSA id w30sm19664170qtw.21.2020.04.07.23.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 23:05:40 -0700 (PDT)
From: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
To: rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, manasi.d.navare@intel.com
Subject: [PATCH 0/2] drm/vkms: Add Virtual hardware module option
Date: Wed,  8 Apr 2020 03:05:01 -0300
Message-Id: <20200408060503.47709-1-gabrielabittencourt00@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I'm trying to implement the virtual hardware (virtual_hw) module option on
VKMS module.

The virtual hardware module option is implemented as an option to skip the
timing and vblank subtests. The main idea of virtual_hw is shorten the time
used on each period of operation. For this, the timer for counting the
period is eliminated and the KMS configurations are implemented along with
the standard atomic operations.

During the 'atomic_enable' and 'atomic_disable' the vblank is initialized
only if the virtual_hw is disabled (and therefore, the vblank is enabled).
A kick of crc/vblank is decoupled from vblank_simulate. Case the vblank
is disabled (that is, the vblank_simulate will never execute) a
vkms_composer_work routine is added to the end of the atomic_flush.

The IGT tests used to check the patch were the kms-flip, which kept the
same results, with and without my alterations, with the exceptions of the
tests that required vblank. The warning message and the related tests are
presented below:

Test requirement not met in function run_test_on_crtc_set, file ../tests/kms_flip.c:1285:
Test requirement: vblank
There is no VBlank
Last errno: 95, Operation not supported
 - wf_vblank-ts-check
 - blocking-wf_vblank
 - absolute-wf_vblank
 - blocking-absolute-wf_vblank
 - busy-flip
 - plain-flip-ts-check
 - plain-flip-fb-recreate
 - flip-vs-expired-vblank
 - flip-vs-absolute-wf_vblank
 - basic-flip-vs-wf_vblank
 - flip-vs-blocking-wf-vblank
 - dpms-vs-vblank-race
 - modeset-vs-vblank-race
 - wf_vblank-ts-check-interruptible
 - absolute-wf_vblank-interruptible
 - blocking-absolute-wf_vblank-interruptible
 - plain-flip-ts-check-interruptible
 - plain-flip-fb-recreate-interruptible
 - flip-vs-expired-vblank-interruptible
 - flip-vs-absolute-wf_vblank-interruptible
 - flip-vs-wf_vblank-interruptible
 - dpms-vs-vblank-race-interruptible
 - modeset-vs-vblank-race-interruptible

Any suggestions are very welcome :)

Gabriela Bittencourt (2):
  drm/vkms: Rework vkms_vblank_simulate
  drm/vkms: Add 'virtual_hw' module option

 drivers/gpu/drm/vkms/vkms_crtc.c | 42 +++++++++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_drv.c  | 13 ++++++++--
 drivers/gpu/drm/vkms/vkms_drv.h  |  2 ++
 3 files changed, 49 insertions(+), 8 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
