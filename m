Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E374575199E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E9D10E608;
	Thu, 13 Jul 2023 07:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300BA10E608
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:18:02 +0000 (UTC)
Date: Thu, 13 Jul 2023 07:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689232679; x=1689491879;
 bh=1pHNche1GxOkqgXW5v4pBkWHvzXOuXdQYe/++m9XBrE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=nhloU/0v1Ql1eeHQuxus4bjl+QFBLqXwQGyCItJGHkFxvjH3RlWSH4PE1u9eJLKoD
 Q8SfytgMkYfla0MBUXBkH3mRMs/TA+OXeaIIh4INrzl1LvnFdSTLn+dKAxMHHz6XPd
 m/nd6DfVgcr96yovUrMeRBeXN9msUqt2g3MiTR3TCDwJFJdD4KtlRuo8FIiZQPRBFK
 CflMEgGyuVbauR8TDeN4r0Lf4JVavDY2bRbGjxq3nlUw2Ab2036XWuqz7SlDZmUZsq
 Utndf9C6wYtsAB+y5gn1eeg5TlsSvTRZmK5AiaWq3xaOgqOiuiMuBUcBW15xfqXG8b
 /qsfldu6CqZHA==
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: document that PRIME import/export is always
 supported
Message-ID: <F07F7XO3_lxljay8DZbVRbLevY3p4np8Pt11PsA_RWIV9Hkc1QKGlby5uBZPcCiQtEdLFBOjG0c2Sy528P3G3yNreQckRzFjWkNuPa-CNKY=@emersion.fr>
In-Reply-To: <69a71fab-2407-49ed-d445-5dccc126c64b@suse.de>
References: <20230712183156.191445-1-contact@emersion.fr>
 <69a71fab-2407-49ed-d445-5dccc126c64b@suse.de>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, July 13th, 2023 at 07:09, Thomas Zimmermann <tzimmermann@suse.=
de> wrote:

> > + * Starting from kernel version 6.6, both &DRM_PRIME_CAP_IMPORT and
> > + * &DRM_PRIME_CAP_EXPORT are always advertised.
> > + *
>=20
> When people port these changes into their trees the version becomes
> meaningless. There are so many "enterprise kernels" that combine whole
> subsystems from different upstream releases.
>=20
> That makes me wonder if such documentation makes sense. We want to avoid
> a situation where userspace does
>=20
> if (v6.6)
> do()
> else if (test_flags())
> do()

Daniel Vetter asked for specific kernel versions in b603e810f740
("drm/uapi: document kernel capabilities"). It allows user-space to
figure out how widespread a cap is.
