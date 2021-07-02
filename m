Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B543BA0C7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 14:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E79E6E170;
	Fri,  2 Jul 2021 12:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D6C6E16D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 12:57:30 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id m1so13086727edq.8
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 05:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:subject:date:message-id:mime-version:hash
 :content-transfer-encoding;
 bh=rEHBdHlyZUIuUwg72tmiKEY4FXr69pl8dRwz/PjBUAA=;
 b=ENexn9+dQOjgbnPAtu7ejTsxRgQSji+06TscjkDU8mGcxrwV/SDoN8niYDk4iz21oT
 M8Xcaj1RIaoUCLTuxugg1F+uZ3Jc5Ul6JGx7Ljz43Y7+tf3THA8AKCV5kCEjXMjUkdYs
 efr1zjtGS0F9ZV6/7B5Z/LgNNy37CXBG+Tzac5hsFzFvQiEH2JZghbuoeXXy2BsJNcyg
 KCm+AnHmHbUQFaCMTjne40hSgfwi7dsnxiQjBb/LraYCtcJw6rM4GNcKb0wzXtkkyJJE
 C1L7QkH4syOaobERCqswJQdysw8La9oeULbeZMkeTfa1VMlkZpgFHltt0FBDV5iIgki4
 l7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :hash:content-transfer-encoding;
 bh=rEHBdHlyZUIuUwg72tmiKEY4FXr69pl8dRwz/PjBUAA=;
 b=kusqqcW6pQhThsdNmH8k3A3Zcu54hYcj+TY/ih9wQ6rSBfeEcSiz+3mHfD9iWKtTDw
 VuWkCGt7cXZAMiFDzRvgXy177eD1Ntqnt32A6JJsCIZLoQuQ0Z+wgJbblpw3/SvNd8QA
 Or59SfJ2IpceNVwdNI324zXnQinKbwLlylcR7hiEm7zCgjK4E6Slz/Xtez6WjyQDoQet
 ZEuZSHX0lO9eo/v7I6dNUzbzaHu4asVlLrzj9Sj807eIgUSTHqVQ2jSVzK/vYM0gv3Na
 6X4qwDbeZArcEKYknPfJZrMN5pVN7Z5JFjUCPkjTYgJgPxFDoRaJ0P7hQda5NAUIq0gO
 Bmiw==
X-Gm-Message-State: AOAM5304RhBuW+WrnrHluV+dgBjs9gEArWnFWcgxwVge//kfymBf4QCC
 RSO8V9FZA3sYeUv6+mSj911h6qWZD30yZg==
X-Google-Smtp-Source: ABdhPJxJS6TBymqIjWrscg8gDoaTVGGV65HPqdcKIJAioL1CR4qPijiVKdbqC66mk8fnN6WsRqs+zg==
X-Received: by 2002:a05:6402:101a:: with SMTP id
 c26mr6545092edu.317.1625230648761; 
 Fri, 02 Jul 2021 05:57:28 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id w17sm1010823ejk.112.2021.07.02.05.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:57:28 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org,
	xorg-announce@lists.x.org
Subject: [ANNOUNCE] libdrm 2.4.107
Date: Fri,  2 Jul 2021 14:57:27 +0200
Message-Id: <20210702125727.409072-1-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Hash: SHA256
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

Alex Deucher (1):
      amdgpu: update marketing names

Andrey Grodzovsky (6):
      tests/amdgpu: Fix valgrind warning
      test/amdgpu: Add helper functions for hot unplug
      test/amdgpu/hotunplug: Add test suite for GPU unplug
      tests/amdgpu/hotunplug: Add unplug with cs test.
      tests/amdgpu/hotunplug: Add hotunplug with exported bo test
      tests/amdgpu/hotunplug: Add hotunplug with exported fence

Bas Nieuwenhuizen (2):
      amdgpu: Add vamgr for capture/replay.
      Bump version to 2.4.107

Eleni Maria Stea (3):
      include <sys/types.h> in xf86drmMode when the OS is FreeBSD
      _WANT_KERNEL_ERRNO must be defined in FreeBSD for ERESTART to be used
      Conditionally include <linux/limits.h> and <sys/params.h> on Linux, BSD

Lang Yu (1):
      Revert "tests/amdgpu: fix bo eviction test issue"

Marius Vlad (6):
      xf86drm: Add a human readable representation for format modifiers
      xf86drm: Add a vendor function to decode the format modifier
      xf86drm: Add support for decoding Nvidia format modifiers
      xf86drm: Add support for decoding AMD format modifiers
      xf86drm: Add support for decoding AMLOGIC format modifiers
      README.rst: Include some notes about syncing uapi headers

Rahul Kumar (1):
      amdgpu: Added product name for E9390,E9560 and E9565 dgpu

Tejas Upadhyay (1):
      intel: Add support for ADLP

git tag: libdrm-2.4.107

https://dri.freedesktop.org/libdrm/libdrm-2.4.107.tar.xz
SHA256: c554cef03b033636a975543eab363cc19081cb464595d3da1ec129f87370f888  libdrm-2.4.107.tar.xz
SHA512: c7542ba15c4c934519a6a1f3cb1ec21effa820a805a030d0175313bb1cc796cd311f39596ead883f9f251679d701e262894c5a297d5cf45093c80a6cd818def0  libdrm-2.4.107.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.107.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiZqBCQC4FYB3QubYlaZ3ojCsSqkFAmDfDLAACgkQlaZ3ojCs
Sqlsrw/+MnflXdeAGkMJYbCDb/mMhItR0zWh7KFTML2q+qgnCckAziEgmV0GNPYn
ahw64WfDg0HMyYecZFYRJug0+gja2jWFBXirSAM6GbFwO5aEegOAwUa0D+LpQm0E
BfJyccW52XT926shsWdIi+hJreboPzgPh7N9cs/8lz5NhrTQWUCVFyeQBW/1nlI/
rvXzJFQPKwgPOlUQiCub9dHSf4EcIMj2hCRukjj5g0hxBINQrJUxmashMnIoBaho
SMx4AeVofIWwXOEDqJ68aF9R1NqL2b97FCOV60w8vmjvM5w8aJn2PW1LHsUZsSr8
Ztxh0FTTm9QBghVHu+7JYOFIy5kqdN3PRVUd9hjSmxf2dAq/wjDiogr8RL5lKT83
PD63aCj0guF8rQgNMLN+g/lfpv462l+eeWiiO/2ci6nFh9e7nusu2jE0ZiUPcGll
M2UoJ1agJcI6TM3zVm6iYiGuE50rz+7ZKXnHpkwMYQQeIXRprUbOP1d+NepFCVt3
bf2Ad7FebtYnduwJfq4gEC4FoJEVDV26tuJy9je30n55/KjmiD+M/HSbIDCElTrp
CzOMvrUcChm6VWZ1jkjfn2cUijxWlIzoeFrir9ci2quGWcjhHl5TBUI+nvi7lmWg
EdjoYgthFxjJ7HGwJNkB+oKfuTD7r32DRZJXaIdwxxQBo0XpzlE=
=48d6
-----END PGP SIGNATURE-----
