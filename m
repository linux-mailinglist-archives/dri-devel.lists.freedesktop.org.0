Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA094712ABD
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 18:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFF210E1D4;
	Fri, 26 May 2023 16:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F5510E1D4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 16:37:13 +0000 (UTC)
Date: Fri, 26 May 2023 16:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1685119030; x=1685378230;
 bh=r5yo/tEm9MGHKL90ipWpcqOEQgyCSLlt9/4xoRcpFnM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=hSNTdcGRIltrUZwr6lPdxeULzElf8Jk9D/FlzT/ohOfeHZ7kGX53hJ/BkHekTBZQt
 Nyura1nIb7b7GgGx5Vecb7gt0+r3+ugurL4NdxNWw2n10rqxe6B8A8DP3jMrfW0psd
 a71dorZw7MIitavxqkmfWxLKG5oosO4tTUbvKKCPFs1U4exQLnfVMdBAYQghgATzc2
 sH2fOhheAoXbSRGOZbER+7hIvLlZ00EXZF+Qzv+MfGZTIuJxcerBrVfuo4C04+akOZ
 xV0S0myd8PEF7jQ9WKfsgvtnY6H9xJeLjZuxbRXTwg3nkakasdmzzk7ibft2kcE+lw
 iuXyQoK3ERlAQ==
To: Sebastian Wick <sebastian.wick@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4 02/13] drm/connector: Add enum documentation to
 drm_colorspace
Message-ID: <oQIftfWjxOOg5ef6hQXufI_hfSvyxhX_Q54ZZSFfzxQKdXKZIwxzPLup5zcTFWzdlQ_bwIrZ5Z2WAy3VYCiI_qoPkvdP0pNUkZCT48NXCbk=@emersion.fr>
In-Reply-To: <CA+hFU4xpYguvZi7n48xB3BS-dONShUvDOwBqpM2aZXRAH_DGwQ@mail.gmail.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
 <20230525191809.3524-3-harry.wentland@amd.com>
 <CA+hFU4xpYguvZi7n48xB3BS-dONShUvDOwBqpM2aZXRAH_DGwQ@mail.gmail.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: amd-gfx@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, May 26th, 2023 at 18:27, Sebastian Wick <sebastian.wick@redhat.c=
om> wrote:

> > + * @DRM_MODE_COLORIMETRY_DEFAULT:
> > + * Driver specific behavior.
> > + * @DRM_MODE_COLORIMETRY_NO_DATA:
> > + * Driver specific behavior.
>=20
> TBH this is still confusing me. Is DEFAULT really just driver specific
> behavior? What's the difference to NO_DATA? Is NO_DATA actually not
> driver-specific but display-specific? I.e. the default colorimetry of
> the display?

DEFAULT =3D=3D NO_DATA =3D=3D 0
