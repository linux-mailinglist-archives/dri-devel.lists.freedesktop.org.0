Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B42EA3FBAB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C139A10EAFB;
	Fri, 21 Feb 2025 16:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="ZsRVxJJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch
 [79.135.106.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9CC10EAFB;
 Fri, 21 Feb 2025 16:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1740156152; x=1740415352;
 bh=yV68SX5bkgjSDe3ZdVbxKwGiFleJZp5fhWVCgcmduKk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=ZsRVxJJvVdDGi63WqwxblqIP8IBx6H7osRCmMzuCf3tRxcuf9NCxxAIR7bcYjKloC
 F61cVr32nOXM8jorIn4ntYO2NrGQttYRjkSHvquZLrMYJdF8iXnmjonTsyUsxbheVm
 xGnpBAHllwUI+FfJ7iIwjiCAHJPtLsYbuicS1Ac+FZiaykEmCUhvB8ov+bgPwFEwfa
 FTBqKIsgNHvoxc4CArjhWPqhv2BI1vqFo31EfMy5GjLPsNgm40+roV8CGCv2RmIU2Z
 9B5zP1TuN6fCDwDthfGq1QgipokMUuhw3RQRejgoHFpgQoDqBoNS6VHW1YQcfpxQGx
 j5UdtYzkN+57g==
Date: Fri, 21 Feb 2025 16:42:28 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Subject: Re: [V7 08/45] Documentation/gpu: document drm_colorop
Message-ID: <djOGXENG_s9B416YlwwkN9f9IVTX8lv_-H-F64NSeOM1Uv0MhGKYSeouKCeJc92m9tizvwGW6JbSnWxgCQmM8A4tRl-GJDA8ZSapOyxHnV8=@emersion.fr>
In-Reply-To: <5e3eb899-ae82-4919-a382-99cbd3c6bf34@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-9-alex.hung@amd.com>
 <eDrRzjuU_q4z4Jvq-DYxUnw2a-VUts65NbWMZbhrvqYoKbcW_jUawJ_ZirFIFQzrtMG4asLn6f9WP24o-k4DnP_oYf5R94PYoMIejFqdTZM=@emersion.fr>
 <5eb5fecd-caa8-4e40-8fe9-23599dc59bbf@amd.com>
 <TFAFx0Fj4cqaba_HYCGoFyvpZVhmaa2KEHRsejqoqEr64CBhJRzpaBs4ZuQWQIJDSQovx0NwwYKhb0GrbhyBWxNGxJbmxckHlyCDtJBbSYs=@emersion.fr>
 <5e3eb899-ae82-4919-a382-99cbd3c6bf34@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 862d212d3eafe7136f0c590bc6a2e12db744c7c3
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

On Friday, February 21st, 2025 at 17:18, Harry Wentland <harry.wentland@amd=
.com> wrote:

> I did a brief survey of other enum properties and noticed
> that this isn't well documented for others, such as the Content
> Protection connector property, or the COLOR_RANGE and COLOR_ENCODING
> plane properties.

Isn't the Content Protection property documented here?
https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#standard-connector-pr=
operties

COLOR_RANGE and COLOR_ENCODING are documented here, but indeed they
are missing docs for enum entries:
https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#color-management-prop=
erties

Would be nice to fix.

> On the IGT front, some tests set enum properties via enum strings,
> and other set and get enum properties based on the prop uint64_t
> prop_values[i] entry from the drmModeObjectPropertiesPtr.
>=20
> Do you know if there's a best practice for enum usage or is it mostly
> a case of "use what works for you"?

It's an old debate. Some user-space uses enum integer values, some
user-space uses enum name strings.

In theory, each KMS object could have a different name-value map for
a given property. However, this is very theoretical and last time we've
discussed this we haven't found any case where this would be desirable.

IMHO, strings make it painful for user-space because it needs to go
through another level of indirection (to convert names to values right
before setting a property) for no benefit. Strings are more annoying to
handle in general (memory management, typos, etc).

Kernel has a no user-space regression policy anyways, so when user-space
starts using values, the kernel won't be able to break these users.

Other people have argued that strings make it easier for user-space to
start using a new KMS property without deploying new kernel uAPI headers.

In the end, it's up to user-space to use their preferred way to set
properties.
