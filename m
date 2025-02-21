Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFB8A3FF0D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 19:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF36F10EB24;
	Fri, 21 Feb 2025 18:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="X4+FwQ+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch
 [79.135.106.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8686210EB23;
 Fri, 21 Feb 2025 18:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1740163719; x=1740422919;
 bh=dM1+pnUE0GZTYJoU/Npfv5ILpfrnosLONnktavblESc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=X4+FwQ+eSARwLPCqEBgjD5oxLhZvZrH0Oc6fRrc5SrdpxCUObJ7FvFe1oadM8Sd4t
 38MYLzeWiRVI/OFTWPKx1Cb4FoSV7X9nSsr/ILsNwq+c4mYMiQYBZFooV4jWreECIC
 Tb/1t8wn9gd7b/kcn1wS5gCKOm45WMOCozm4iibriN+GAiZ+nXT9NR9qQcOh6i5/Xo
 zF1flvDTNlU0BQhXkpZUEvPRCeTRqWRdNDaFa5GrXopQ0L+PuwYIvd89pzQlKccwd5
 NareQnlooRjL7A5GzrQJkUt7pThAOlAwb3ziLSexGp7KopAe2KRjbPEu6zAW/zIeGg
 TFqRJd+TCBd0g==
Date: Fri, 21 Feb 2025 18:48:35 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Subject: Re: [V7 08/45] Documentation/gpu: document drm_colorop
Message-ID: <Hlz7Rsr3VbeMfALR9-8f3Zhvo6n_Foj-R-E-YlSO0SrssPrgiyy__plSpvps_CPtFfsZ9HVwsNzaXSjURwXQNK6kUBBTiwTrDafDW6xvjHo=@emersion.fr>
In-Reply-To: <fd49ad18-b1a7-4389-8b21-96f6dd21864e@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-9-alex.hung@amd.com>
 <eDrRzjuU_q4z4Jvq-DYxUnw2a-VUts65NbWMZbhrvqYoKbcW_jUawJ_ZirFIFQzrtMG4asLn6f9WP24o-k4DnP_oYf5R94PYoMIejFqdTZM=@emersion.fr>
 <5eb5fecd-caa8-4e40-8fe9-23599dc59bbf@amd.com>
 <TFAFx0Fj4cqaba_HYCGoFyvpZVhmaa2KEHRsejqoqEr64CBhJRzpaBs4ZuQWQIJDSQovx0NwwYKhb0GrbhyBWxNGxJbmxckHlyCDtJBbSYs=@emersion.fr>
 <5e3eb899-ae82-4919-a382-99cbd3c6bf34@amd.com>
 <djOGXENG_s9B416YlwwkN9f9IVTX8lv_-H-F64NSeOM1Uv0MhGKYSeouKCeJc92m9tizvwGW6JbSnWxgCQmM8A4tRl-GJDA8ZSapOyxHnV8=@emersion.fr>
 <fd49ad18-b1a7-4389-8b21-96f6dd21864e@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 36267e3e4411856fe2c103f12b590159de62fece
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, February 21st, 2025 at 19:41, Harry Wentland <harry.wentland@amd=
.com> wrote:

> > Other people have argued that strings make it easier for user-space to
> > start using a new KMS property without deploying new kernel uAPI header=
s.
>=20
> I don't understand this argument. You would either need to define the
> strings or the ints in your user-space app. You could do either without
> deploying new uAPI headers.

I suppose a string is less likely to be wrong/mixed up than a magic
number? I'm probably not the best person to explain this side of the
debate. :P

Looking at Weston, it seems to just re-define its own enums matching
the kernel strings:
https://gitlab.freedesktop.org/wayland/weston/-/blob/6d9c42a7d294a143582254=
1ab4b3e12a8998dabb/libweston/backend-drm/kms.c#L49

For reference, one of the previous discussions:
https://lists.freedesktop.org/archives/dri-devel/2020-April/thread.html#261=
055

I think there was another one, but can't find it back=E2=80=A6
