Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555713BAA1B
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 21:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4256D89EBB;
	Sat,  3 Jul 2021 19:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AD389EA6;
 Sat,  3 Jul 2021 19:21:33 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a13so16733607wrf.10;
 Sat, 03 Jul 2021 12:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=12BVBSJInuZ6Df9NfN2LPGy+tfchmDgeR3fUuzO0Jvs=;
 b=i4SvxPE+xzAe/iTT8W1tzSJ6gi7HtfhgdGT3T4pN5j97ITGZ+AtaNmJqVLWWtzPUeM
 81hCAqHd3Pn7fhQ7J+ahZ0ncnOo3CMMQqlzJu1MhkPp8ksPG7eJWD8/3TFMc9Gc3u71B
 2TI9hxX4Rlbd+XiI+gh8x0c/pmCsGYyLM0dNAZUPCSZwct6Ah0rjw/mn4M0cw0U0nrr4
 nqVh4Xyt37Mc/1AdMGGW/qF93BIW6jM9beSpW4SbWvIYpIzNqQupFGfYfqhDgEAIlunD
 KMBzWIElozuZZtklsKcqQAa92DzdpVYcgA1/CdgRSPhRzL1FgcOFMDgtBKYVjRBjbYgm
 aGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=12BVBSJInuZ6Df9NfN2LPGy+tfchmDgeR3fUuzO0Jvs=;
 b=QAJhpL5UsjGKXMjxowDs8TG1GUfHhVjiXLGUKZ7gbtDIa4TsCzpVhaLJKQ7Btw0TlM
 wlhLdsy1eMy3zxCIYQSlsG9x3wk2EuLoKKuAdGyuWGTZ3jdsQxk05d9+jNrVW2zOqas9
 zxJHZZF4LlmhGbn/kZSggNKdX+iii2F6puakHbJ3dWj7hZGIkfyNHRgGoT4ykM1/MngO
 +/xDsWZFcPkcgpzW9loeoU1FKfi7IlKmq+1ZK/iVtGGBek0Qzi8ezRUEvI1j4VhHUEj0
 t8JnykFr6luc9CUR/Y82qyOJQ48SqFU9xtrvdsVNajaoPqbux8prXpKIYBis/EYYWqG/
 hGDg==
X-Gm-Message-State: AOAM5313KS0+VLQMxgCdS15WzfkFeBrmPXL8055vmoa42F4YDbmGVwsQ
 koo3650wkqOg24PN6KMnPh30rrEZKJY=
X-Google-Smtp-Source: ABdhPJwzPUp52jElvDCXWHQDTjCeskVmyf3yd0na4U9yDOe8F6eZ9CPK3j60/VMJQU+Vx8NVbeZsig==
X-Received: by 2002:adf:d1c1:: with SMTP id b1mr1581163wrd.394.1625340092193; 
 Sat, 03 Jul 2021 12:21:32 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id c12sm8485952wrr.90.2021.07.03.12.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 12:21:31 -0700 (PDT)
Date: Sat, 3 Jul 2021 21:21:29 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 christian.koenig@amd.com
Subject: nouveau: failed to initialise sync
Message-ID: <YOC4uekpD7iA3xPi@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello

Since some days on next, nouveau fail to load:
[    2.754087] nouveau 0000:02:00.0: vgaarb: deactivate vga console
[    2.761260] Console: switching to colour dummy device 80x25
[    2.766888] nouveau 0000:02:00.0: NVIDIA MCP77/MCP78 (0aa480a2)
[    2.783954] nouveau 0000:02:00.0: bios: version 62.77.2a.00.04
[    2.810122] nouveau 0000:02:00.0: fb: 256 MiB stolen system memory
[    3.484031] nouveau 0000:02:00.0: DRM: VRAM: 256 MiB
[    3.488993] nouveau 0000:02:00.0: DRM: GART: 1048576 MiB
[    3.494308] nouveau 0000:02:00.0: DRM: TMDS table version 2.0
[    3.500052] nouveau 0000:02:00.0: DRM: DCB version 4.0
[    3.505192] nouveau 0000:02:00.0: DRM: DCB outp 00: 01000300 0000001e
[    3.511632] nouveau 0000:02:00.0: DRM: DCB outp 01: 01011332 00020010
[    3.518074] nouveau 0000:02:00.0: DRM: DCB conn 00: 00000100
[    3.523728] nouveau 0000:02:00.0: DRM: DCB conn 01: 00001261
[    3.529455] nouveau 0000:02:00.0: DRM: failed to initialise sync subsystem, -28
[    3.545946] nouveau: probe of 0000:02:00.0 failed with error -28

I bisected it to:
git bisect start
# good: [62fb9874f5da54fdb243003b386128037319b219] Linux 5.13
git bisect good 62fb9874f5da54fdb243003b386128037319b219
# bad: [fb0ca446157a86b75502c1636b0d81e642fe6bf1] Add linux-next specific files for 20210701
git bisect bad fb0ca446157a86b75502c1636b0d81e642fe6bf1
# good: [f63c4fda987a19b1194cc45cb72fd5bf968d9d90] Merge remote-tracking branch 'rdma/for-next'
git bisect good f63c4fda987a19b1194cc45cb72fd5bf968d9d90
# bad: [49c8769be0b910d4134eba07cae5d9c71b861c4a] Merge remote-tracking branch 'drm/drm-next'
git bisect bad 49c8769be0b910d4134eba07cae5d9c71b861c4a
# good: [4e3db44a242a4e2afe33b59793898ecbb61d478e] Merge tag 'wireless-drivers-next-2021-06-25' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next
git bisect good 4e3db44a242a4e2afe33b59793898ecbb61d478e
# bad: [5745d647d5563d3e9d32013ad4e5c629acff04d7] Merge tag 'amd-drm-next-5.14-2021-06-02' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect bad 5745d647d5563d3e9d32013ad4e5c629acff04d7
# bad: [c99c4d0ca57c978dcc2a2f41ab8449684ea154cc] Merge tag 'amd-drm-next-5.14-2021-05-19' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect bad c99c4d0ca57c978dcc2a2f41ab8449684ea154cc
# bad: [ae25ec2fc6c5a9e5767bf1922cd648501d0f914c] Merge tag 'drm-misc-next-2021-05-17' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
git bisect bad ae25ec2fc6c5a9e5767bf1922cd648501d0f914c
# bad: [cac80e71cfb0b00202d743c6e90333c45ba77cc5] drm/vkms: rename cursor to plane on ops of planes composition
git bisect bad cac80e71cfb0b00202d743c6e90333c45ba77cc5
# good: [178bdba84c5f0ad14de384fc7f15fba0e272919d] drm/ttm/ttm_device: Demote kernel-doc abuses
git bisect good 178bdba84c5f0ad14de384fc7f15fba0e272919d
# bad: [3f3a6524f6065fd3d130515e012f63eac74d96da] drm/dp: Clarify DP AUX registration time
git bisect bad 3f3a6524f6065fd3d130515e012f63eac74d96da
# bad: [6dd7efc437611db16d432e0030f72d0c7e890127] drm/gud: cleanup coding style a bit
git bisect bad 6dd7efc437611db16d432e0030f72d0c7e890127
# bad: [13b29cc3a722c2c0bc9ab9f72f9047d55d08a2f9] drm/mxsfb: Don't select DRM_KMS_FB_HELPER
git bisect bad 13b29cc3a722c2c0bc9ab9f72f9047d55d08a2f9
# bad: [d02117f8efaa5fbc37437df1ae955a147a2a424a] drm/ttm: remove special handling for non GEM drivers
git bisect bad d02117f8efaa5fbc37437df1ae955a147a2a424a
# good: [13ea9aa1e7d891e950230e82f1dd2c84e5debcff] drm/ttm: fix error handling if no BO can be swapped out v4
git bisect good 13ea9aa1e7d891e950230e82f1dd2c84e5debcff
# first bad commit: [d02117f8efaa5fbc37437df1ae955a147a2a424a] drm/ttm: remove special handling for non GEM drivers

Reverting the patch permit to have nouveau works again.

Regards
