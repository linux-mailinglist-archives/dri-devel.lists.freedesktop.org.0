Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CF7A68E91
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71D510E504;
	Wed, 19 Mar 2025 14:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U4oLoVog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1AB10E504
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742393472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=1+X5J/nfFRZQs7guXongclQxqCXf9QbaWpYFoTX3hLI=;
 b=U4oLoVogosLntK4IzvQXMSPFQnt8Ua8on90kPBPHspH/FixnMtkwdp0BmFv2w4pfvk6Iu6
 51ZGxJF2PvJhUscEIgRmCBVW3hjCz0KikXvEXUOBSPAA2BKXZocn/KuNlqv2H4rNlDcElx
 wsQn1+2wD/VckQ0PpLst4xeCJIpEBq4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-P704d4FNM-yQqyyPwu9a-w-1; Wed, 19 Mar 2025 10:11:10 -0400
X-MC-Unique: P704d4FNM-yQqyyPwu9a-w-1
X-Mimecast-MFC-AGG-ID: P704d4FNM-yQqyyPwu9a-w_1742393469
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3912fc9861cso3135956f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 07:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742393469; x=1742998269;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1+X5J/nfFRZQs7guXongclQxqCXf9QbaWpYFoTX3hLI=;
 b=DVDOZESyF84T8pNTIdPaLIcGVqW3dKGCuuy8o34uspQdQLouehQT6Awjf7oLM7uTjR
 r0PLQHgRe+Uz5lTrs72/LeXqCT/UeKces7tEWnT38cYyUWS62yopOAIX3He7zTL1FXQD
 lthivL/zMkFYtExZRWluWrfn6uly3Pd7MCyBdw3tKgL4mL3m+KKR7jZ6Xa+553vBY6wJ
 S3iouB/d/ozL8YgkLJbLj/OzLBmvhVtNo3l29SwNX4jVARuZ3e8eHRlhFZ/5QpbDfYz/
 39Qo+Dof2yYcjpBZeHNLFCkuYGouje8AO918iyqhaJVnOsPD0FCT2onyhBulzOfxLtO3
 ATsQ==
X-Gm-Message-State: AOJu0YyTcBaBaN7l7oLqeQKU6lsXduAE4WSCUz2dv4MxvB2HZW1Y6GDY
 goOpwv6U3rYn0h7pnd+CAO8iHksc++lJU13Zq1ucailTgIPI1ijnVqdn1A5lQqFC8ZHW+A24NJW
 HmU15hS5zJNgw9FEtp0HUaYwBku6Wx+CNIKr/eO9b9dOJjjIqkZWKqK5CfS39m99I3MVwDqogKA
 ==
X-Gm-Gg: ASbGncvYtX7EiguXCRZyp68nANf9H/iL5rUyYF68w3KaIiwoT8Wwabz1bc0WDYRmh5c
 /yo8qfMXCOOCATlpv9JqlZa9LyKbV70mz4Pbwfir851UbeAN16XjzuUm6mFjC5VVps7IaHvgwzF
 zizAvwt29OkB8hr2RITgHwEQ+PDw92Q6ZyUs9l87859yZ7vO2wmR3vLB8aKZGUyEfgDzPitZZ6h
 eKmAgS13FUiFDP+VV5slbkLY+Yl39An0qHCeTmMf6Ydo1JaRb4bw65VFNbpYImUf5w=
X-Received: by 2002:a5d:6da5:0:b0:391:42f2:5c7b with SMTP id
 ffacd0b85a97d-399739ed7bemr2747932f8f.16.1742393468811; 
 Wed, 19 Mar 2025 07:11:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHc+V213Ft44Tx9TCUh+GbEvdKfi0ad6eOb8N8ljyUrXOw4wkX/xeMipxwOHHXQ+0o83DKBA==
X-Received: by 2002:a5d:6da5:0:b0:391:42f2:5c7b with SMTP id
 ffacd0b85a97d-399739ed7bemr2747869f8f.16.1742393468251; 
 Wed, 19 Mar 2025 07:11:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997656f43asm1221801f8f.25.2025.03.19.07.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:11:07 -0700 (PDT)
Date: Wed, 19 Mar 2025 15:11:06 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Subject: DRM CI
Message-ID: <20250319-greedy-sturgeon-from-avalon-ac758f@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="l4xwr56hc3cjpjco"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--l4xwr56hc3cjpjco
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: DRM CI
MIME-Version: 1.0

Hi,

At last Plumbers, we agreed with Dave that a good first step to ramp up
CI for DRM trees would be to enable build and kunit testing in the main
DRM tree.

I played around with it last week and wrote a good first iteration of
the gitlab-ci file.

https://gitlab.freedesktop.org/mripard/gitlab/-/blob/main/.gitlab-ci.yml?ref_type=heads

It will compile all drm-misc defconfigs, for arm, arm64 and x86
architectures, and will run kunit for those as well. Now that the gitlab
migration is mostly over, I guess we could start using it after the
merge window if everyone agrees.

It's also easily shareable with drm-misc, if we ever want to use it
there.

I guess it's useful on its own, but I've started to look into making dim
create PR for drm automatically.

Gitlab support push options to create a PR automatically when pushing:
https://docs.gitlab.co.jp/ee/user/project/push_options.html#push-options-for-merge-requests

Unfortunately, it seems to work only for branches, not tags. I guess we
could put the PR description we put in the tag at the moment in the PR
description, but I'm not sure if it's a big deal or not.

Maxime

--l4xwr56hc3cjpjco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9rQegAKCRAnX84Zoj2+
dnRkAYDZMKQua6hbxMK9zIgY9SVjNtX+WsoSOqWSHOLASTY4B9/MmipvDiOvs44a
IeWX0+kBgPmXWUvtcm36wHZyZ1oSHMqGQ/my4MbYz9qQ/bVChMJZdzjFzjTfgHaV
LZxNmiE3sQ==
=MZk8
-----END PGP SIGNATURE-----

--l4xwr56hc3cjpjco--

