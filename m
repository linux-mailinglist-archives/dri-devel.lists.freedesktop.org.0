Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9727E2F7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A476E4CF;
	Wed, 30 Sep 2020 07:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4336E1D6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 22:15:30 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id o20so6124721pfp.11
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 15:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xFFV541JpFVpZa5fup8HecjMa+5f8eEZQ75k5SchOsw=;
 b=GINgKNpPQ3dEwvji1OkaMxLp+2oOv0rqvfvcETZXJ0OgJ4sPhMK2IO+Jwn0khr2BB4
 cEmITeKqqRJWYLdsMK2UqRcEqOjhcDe8VCDVA4eq0HFAviX8U+hpr0kRFCetQBQcwvPH
 Q03AhyUQSYLdPlbxCWbj/e2c9OLS8r61K+oSCUyfMrh6mHxSDx4v5Yx+n3xkNVkmcOs3
 G2MnemwVg3Ill+GJRF8tPu0HYN15dtadwZJZ6vr3zYclNCJNDwuFet24aRg2VWPf7qk4
 czBvxwuLXRVtZqG/RjkTaw+ppSW2ICvuPYmlOD5x13ovHytQfL3aic5939xvFcvajkPX
 gBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xFFV541JpFVpZa5fup8HecjMa+5f8eEZQ75k5SchOsw=;
 b=j0XQNL3uymgL4TfGODKcATRXX8y9a0Xv9unH+ds+LdpGxNuy3wXW2w1K/3rb+y/WBB
 ZKu3kOWn/E8sl/eewgsKF3muBxjTGdHZt7IcxGptPC6QG8sXXLoi3PY0pF6QKFDtYwKK
 MQhUrhFXOeqJnz8EWt0MyDVxteSulP2HFBN2DFs5DfNjTXKakPdkdG8UiX0mOQRoiDVg
 zORPF9P1ocTgMp0U4hYFEBTN8KVBcWjmMj1WhPPKRhsSGLhZSdOHrVJWzSc7gDJFquAQ
 LhJ/CwBVv6xAi3HsDQF0yUWCA5LY9o7WUZiEcqkvY3VsC9Yb5XSepMIsnyH9VdC9/ycg
 M3pQ==
X-Gm-Message-State: AOAM530hXfI6Ujlqm4fW0G8Bja50Qa1ILrTZoyO2PVp0MFvOzVVBWQIQ
 2I8tH4fk6Zr+eBSckVhjPCg=
X-Google-Smtp-Source: ABdhPJyG6f7JhLNS7EcUnfuwRMe8BQkFit50KMbOf7krCaLnRToG+8jOjw+Gn1sScrZhRWebiOcPDA==
X-Received: by 2002:a63:a505:: with SMTP id n5mr4695870pgf.71.1601417729719;
 Tue, 29 Sep 2020 15:15:29 -0700 (PDT)
Received: from ubuntu-m3-large-x86 ([2604:1380:45e1:2200::1])
 by smtp.gmail.com with ESMTPSA id o6sm3483821pjp.33.2020.09.29.15.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 15:15:28 -0700 (PDT)
Date: Tue, 29 Sep 2020 15:15:26 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v5 80/80] ARM: dts: bcm2711: Enable the display pipeline
Message-ID: <20200929221526.GA1370981@ubuntu-m3-large-x86>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <cfce2276d172d3d9c4d34d966b58fd47f77c4e46.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cfce2276d172d3d9c4d34d966b58fd47f77c4e46.1599120059.git-series.maxime@cerno.tech>
X-Mailman-Approved-At: Wed, 30 Sep 2020 07:50:09 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 03, 2020 at 10:01:52AM +0200, Maxime Ripard wrote:
> Now that all the drivers have been adjusted for it, let's bring in the
> necessary device tree changes.
> 
> The VEC and PV3 are left out for now, since it will require a more specific
> clock setup.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Apologies if this has already been reported or have a solution but this
patch (and presumably series) breaks output to the serial console after
a certain point during init. On Raspbian, I see systemd startup messages
then the output just turns into complete garbage. It looks like this
patch is merged first in linux-next, which is why my bisect fell on the
DRM merge. I am happy to provide whatever information could be helpful
for debugging this. I am on the latest version of the firmware
(currently 26620cc9a63c6cb9965374d509479b4ee2c30241).

$ git bisect log
# bad: [49e7e3e905e437a02782019570f70997e2da9101] Add linux-next specific files for 20200929
# good: [fb0155a09b0224a7147cb07a4ce6034c8d29667f] Merge tag 'nfs-for-5.9-3' of git://git.linux-nfs.org/projects/trondmy/linux-nfs
git bisect start '49e7e3e905e437a02782019570f70997e2da9101' 'fb0155a09b0224a7147cb07a4ce6034c8d29667f'
# good: [a07bf9042465c0e4ab28947daf70517f99ef021f] Merge remote-tracking branch 'bluetooth/master' into master
git bisect good a07bf9042465c0e4ab28947daf70517f99ef021f
# bad: [546d06883722dfc5823d53042b924f4b4f76a459] Merge remote-tracking branch 'spi/for-next' into master
git bisect bad 546d06883722dfc5823d53042b924f4b4f76a459
# good: [06c14f5c2d311100a447caf60ecbcf558e4e60fe] Merge tag 'mediatek-drm-next-5.10' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-next
git bisect good 06c14f5c2d311100a447caf60ecbcf558e4e60fe
# bad: [606865c11f2ed6429c7eddcbc59d3295771d41a4] Merge remote-tracking branch 'sound-asoc/for-next' into master
git bisect bad 606865c11f2ed6429c7eddcbc59d3295771d41a4
# bad: [7492f2f52acc72a1d08ad1f1d722237ba66189b9] Merge remote-tracking branch 'regmap/for-next' into master
git bisect bad 7492f2f52acc72a1d08ad1f1d722237ba66189b9
# good: [0b7e44d39c8aa7536352b57af2265e92fc253e4f] integrity: Asymmetric digsig supports SM2-with-SM3 algorithm
git bisect good 0b7e44d39c8aa7536352b57af2265e92fc253e4f
# good: [2ce595ba1cd7a2bc053fcc937b7bbbf743c21818] Merge remote-tracking branch 'nand/nand/next' into master
git bisect good 2ce595ba1cd7a2bc053fcc937b7bbbf743c21818
# good: [10e07ca312548f90d5e0fc1d862209285c9a858c] gpu/drm/radeon: fix spelling typo in comments
git bisect good 10e07ca312548f90d5e0fc1d862209285c9a858c
# bad: [be877462417f05af69729a9eeda1332b15e81de8] Merge remote-tracking branch 'imx-drm/imx-drm/next' into master
git bisect bad be877462417f05af69729a9eeda1332b15e81de8
# bad: [7a80fa2ada067aa633a91bce67f6c3e39aad7504] Merge remote-tracking branch 'drm-intel/for-linux-next' into master
git bisect bad 7a80fa2ada067aa633a91bce67f6c3e39aad7504
# good: [f4a336053725b689a65021edca26f8d058c0d6b4] drm/amdgpu/display: fix CFLAGS setup for DCN30
git bisect good f4a336053725b689a65021edca26f8d058c0d6b4
# bad: [64e05a0ebd7e6047c9f67c685fe8d4ec79a397ba] Merge remote-tracking branch 'drm/drm-next' into master
git bisect bad 64e05a0ebd7e6047c9f67c685fe8d4ec79a397ba
# good: [a4b0c1f80de8ec3f473b02918556650b683f044d] Merge remote-tracking branch 'crypto/master' into master
git bisect good a4b0c1f80de8ec3f473b02918556650b683f044d
# first bad commit: [64e05a0ebd7e6047c9f67c685fe8d4ec79a397ba] Merge remote-tracking branch 'drm/drm-next' into master

Cheers,
Nathan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
