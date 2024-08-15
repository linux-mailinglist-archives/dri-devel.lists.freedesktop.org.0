Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC8953226
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 16:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E29D10E414;
	Thu, 15 Aug 2024 14:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FtebDymT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6D710E414
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K+dMu/AHRYE1Qvp4JgBkCWHyyxJUUAXm9hxfkstQBvU=; b=FtebDymTH5WjFbVKuQ0C32Y8rh
 iGNPN7D8KAra4Wpi4RV51nmvOXmWDJ6R9roF6srK4kQgMNiKg5ESJU30uZqvgbDTj4+O3xNV17UZP
 5hB2Fx399IyNHctv6io8hnvUG8dP5OJYLVKkNQBEyGx5Fjd/3C3+zgZCU3EFFaJAVpIBWBISBbseP
 eIQ0dD9VbChgOS0ePSp1/c+VDYlY2exOmfm2AYLL1afF8jJn/aLA5ccuEg24avlDmHdiN6zQPrMPr
 4fsX55D7Qr6qQx2KDG19Y4sX7ZvsNrAhRHgN2hz1uzvah7hFNtXc75H9X1BmIUJ16a5P/X3Xz46hc
 wbbhYPhg==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1seb3N-000dlz-EV; Thu, 15 Aug 2024 16:02:13 +0200
Message-ID: <909b3739-5470-41ae-a5bc-420b701b158f@igalia.com>
Date: Thu, 15 Aug 2024 11:02:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/vkms: Miscelanious clarifications
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Louis,

On 8/14/24 05:46, Louis Chauvet wrote:
> This series does not introduce functionnal changes, only some
> documentation and renaming to clarify the code.
> 
> This series is based on [1].
> 
> [1]: https://lore.kernel.org/all/20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com/

There is no need to base this series on four other series, as these 
three patches are completely independent.

Best Regards,
- Maíra

> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> Louis Chauvet (3):
>        drm/vkms: Formatting and typo fix
>        drm/vkms: Rename index to possible_crtc
>        drm/vkms: Add documentation
> 
>   drivers/gpu/drm/vkms/vkms_drv.c    |  6 ++-
>   drivers/gpu/drm/vkms/vkms_drv.h    | 85 +++++++++++++++++++++++++++++++-------
>   drivers/gpu/drm/vkms/vkms_output.c | 23 ++++++++---
>   drivers/gpu/drm/vkms/vkms_plane.c  |  4 +-
>   4 files changed, 94 insertions(+), 24 deletions(-)
> ---
> base-commit: 219b45d023ed0902b05c5902a4f31c2c38bcf68c
> change-id: 20240520-google-clarifications-dede8dcbe38a
> prerequisite-message-id: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
> prerequisite-patch-id: ae2d8b2efbbaa9decce56632c498c87e708288b3
> prerequisite-patch-id: c26b6d4867eaf6566195aa0002765357d4f69f8c
> prerequisite-patch-id: 8791d34a6f3148dc518da5249453067e40d346e3
> prerequisite-patch-id: 26ec7cd5a449004bcfd6ce483671f87655f8635c
> prerequisite-patch-id: 2e855ba871f2e99d4b6b7d85da2ddac6bb32262e
> prerequisite-patch-id: 82523a917646793deeec7cdcc7ff286bd924fd21
> prerequisite-patch-id: 0e355e5316281f53ab5e97ab6e63b0a682f3eb9e
> prerequisite-patch-id: 7a63d245a377d5f5283f48e8f52421b912811752
> prerequisite-patch-id: dda6bf4692cd1795c489ff58e72c0841ea8ffbc4
> prerequisite-patch-id: f70e535b6086cc587975fbfa75741f485f679a32
> prerequisite-patch-id: 6c2aa2645c7d854951608aa4d15a02e076abe1fe
> prerequisite-patch-id: dc61c6d3db73053fc36e115af561e0c42b467de2
> prerequisite-patch-id: deda292af6d8bbf6762b0bf4d351ffd2225995d8
> prerequisite-patch-id: 18554f49b53cbcfd4a8ca50dc83b17dd3cf96474
> prerequisite-patch-id: 5633292e10132d29be2467812e6e2e824cfedb67
> prerequisite-patch-id: 43f37e9c1bc041d491e41dfb59548ed258a1e071
> prerequisite-message-id: <20240814-b4-new-color-formats-v2-0-8b3499cfe90e@bootlin.com>
> prerequisite-patch-id: d10db4cb12a88de2e5f6440e9fcf5ddda191e3cd
> prerequisite-patch-id: 16bac0ef1f1dc010a72ce2faae66631797d23d3f
> prerequisite-patch-id: 8e0e5cc0727e8fd2d14ebafc5538fd987c2dd38e
> prerequisite-patch-id: 32bad3bf3df46d042e9edd4c1259c2e2a3fb8975
> prerequisite-patch-id: 4bd9e4cef308abd17b7b274a5575a3de73a1503b
> prerequisite-patch-id: a98fac5a2c60fe23fbc6a455e9a4ab8b0f187ee8
> prerequisite-patch-id: 62c8d109a22b9978f755255b67f13fe74fb7008d
> prerequisite-patch-id: baa8da4871dd90b03a07c6d9ddb45e10929ee70a
> prerequisite-message-id: <20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com>
> prerequisite-patch-id: df699289213021fa202fcdf1b4bdff513d09caa2
> prerequisite-patch-id: 59d021ccb166fbe2962de9cda72aceb3caa9cabe
> prerequisite-patch-id: 895ace6d58b3776798791705b7b05e26b8d37c7b
> 
> Best regards,
