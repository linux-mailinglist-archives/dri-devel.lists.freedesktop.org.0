Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D736930615
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2024 17:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C16B10E07B;
	Sat, 13 Jul 2024 15:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qTp6ZLSV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF5D10E07B
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 15:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VlNevCM5uFAGp5+vPkfQ0aM1WZCNMtNiPZxYpXEqtV8=; b=qTp6ZLSVXNR8t/LIljKCVepP6h
 kteU2upcjTHCFqKftW9jgcYR2EP1JTZRGPG2152ElBkXnngCoQcQmIUDt+b8RmEVNw/CITzPIlJDL
 mn0Sx6Pth4ceVvILCp5kEeOzdwJ2lb2Ma7qMig6kdjoUBNSQaZNGFY4HvbsnGk08JLHHtQrR826Ld
 Dnlyg/dvDGjoGtnnjzm/iUSYp6phbiHXw5QbMm8ES/LItgn7gOfVKnV3/yXcsT2ubVi5hpDxaBpx2
 bN+1wRy9XunM/ZMuogjfAukudYLkJotV71AH3dmRKkzoXk1CIjDZ7AaF+JrARFpyDFf/1e9cOXWVq
 kD4csnRQ==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sSeKb-00El4b-Ml; Sat, 13 Jul 2024 17:06:38 +0200
Message-ID: <0f5cf733-7f22-4b93-b13e-08916aa3f152@igalia.com>
Date: Sat, 13 Jul 2024 12:06:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] v3d: Perfmon cleanup
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20240711135340.84617-1-tursulin@igalia.com>
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
In-Reply-To: <20240711135340.84617-1-tursulin@igalia.com>
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

On 7/11/24 10:53, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> When we had to quickly deal with a tree build issue via merging
> 792d16b5375d ("drm/v3d: Move perfmon init completely into own unit"), we
> promised to follow up with a nicer solution.
> 
> As in the process of eliminating the hardcoded defines we have discovered a few
> issues in handling of corner cases and userspace input validation, the fix has
> turned into a larger series, but hopefully the end result is a justifiable
> cleanup.
> 
> v2:
>   * Re-order the patches so fixes come first while last three are optional
>     cleanups.
> 
> v3:
>   * Fixed a bunch of rebase errors I made when re-ordering patches from v1 to v2.
>   * Dropped the double underscore from __v3d_timestamp_query_info_free.
>   * Added v3d prefix to v3d_copy_query_info.
>   * Renamed qinfo to query_info.
>   * Fixed some spelling errors and bad patch references.
>   * Added mention to get_user to one commit message.
>   * Dropped one patch from the series which became redundant due other
>     re-ordering.
>   * Re-ordered last two patches with the view of dropping the last.
> 
> v4:
>   * Fixed more rebase errors and details in commit messages.
> 
>   Cc: Maíra Canal <mcanal@igalia.com>
> 
> Tvrtko Ursulin (11):
>    drm/v3d: Prevent out of bounds access in performance query extensions
>    drm/v3d: Fix potential memory leak in the timestamp extension
>    drm/v3d: Fix potential memory leak in the performance extension
>    drm/v3d: Validate passed in drm syncobj handles in the timestamp
>      extension
>    drm/v3d: Validate passed in drm syncobj handles in the performance
>      extension
>    drm/v3d: Move part of copying of reset/copy performance extension to a
>      helper
>    drm/v3d: Size the kperfmon_ids array at runtime
>    drm/v3d: Do not use intermediate storage when copying performance
>      query results
>    drm/v3d: Move perfmon init completely into own unit
>    drm/v3d: Prefer get_user for scalar types
>    drm/v3d: Add some local variables in queries/extensions

I just applied all patches to drm-misc/drm-misc-next!

@Maxime, @Thomas or @Maarten, is it possible to cherry-pick the
following patches to drm-misc-fixes?

f32b5128d2c4 drm/v3d: Prevent out of bounds access in performance query 
extensions
753ce4fea621 drm/v3d: Fix potential memory leak in the timestamp extension
484de39fa5f5 drm/v3d: Fix potential memory leak in the performance extension
8d1276d1b8f7 drm/v3d: Validate passed in drm syncobj handles in the 
timestamp extension
a546b7e4d73c drm/v3d: Validate passed in drm syncobj handles in the 
performance extension

Tvrtko made sure to make them independent (Thanks Tvrtko!), so I believe
it is going to be pretty straight forward to cherry-pick them.

Thanks Tvrtko for the patches and all the maintainers for the great
work!

Best Regards,
- Maíra

> 
>   drivers/gpu/drm/v3d/v3d_drv.c                 |   9 +-
>   drivers/gpu/drm/v3d/v3d_drv.h                 |  16 +-
>   drivers/gpu/drm/v3d/v3d_perfmon.c             |  44 +--
>   .../gpu/drm/v3d/v3d_performance_counters.h    |  16 +-
>   drivers/gpu/drm/v3d/v3d_sched.c               | 105 +++++--
>   drivers/gpu/drm/v3d/v3d_submit.c              | 294 +++++++++++-------
>   6 files changed, 290 insertions(+), 194 deletions(-)
> 
