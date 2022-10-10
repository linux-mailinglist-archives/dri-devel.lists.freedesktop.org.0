Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DC85F9BB4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 11:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8AD10E472;
	Mon, 10 Oct 2022 09:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96A410E472;
 Mon, 10 Oct 2022 09:13:38 +0000 (UTC)
Date: Mon, 10 Oct 2022 09:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1665393216; x=1665652416;
 bh=IhRc9ME0XQmtrkMr2qik0mhB74Aw0ir+9hohPtD/58c=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=fgW0UsmkctKWoaFhMyxha5TSkhhKQeycW+AtTL+3fGTlQwGMSz84K+x9NmJ7rKkxW
 1id1Z+w1kMA5BeMtytnvEYamAwvLZg1L8Ye45gKRbbMhrp42D7hjozq/pTPOTKngVm
 dxkqRKNxgxt/BeEmllHsng+RG9j6Pz4jHRryPGI/EzpsdqxzNuhy2CmUrLLRRctZ1O
 0Fel8gIXNTonAfyafrfnw4td6IcXf+1dptvNCjOv+YECrAkddOPb50hyR+OcYI2hqS
 2zn3mFv0RdD8HFX6zFYelnh3WP1Q5Btha8+KJzUaMdSIKtYm6Da65kuRWEAMs0JtFP
 7ttVy0IVFKzhg==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH] drm/syncobj: add IOCTL to register an eventfd for a
 timeline
Message-ID: <YlRyF1ugXQAIFNoNIuFRmDek7S85or_YpAz26fHKaaQIYeCB3RVGSjEaYhw6nI0iH_k6vDjPYeF6ekmVeEgUWyf5V5w4aMm8Z5oVPjGQKh4=@emersion.fr>
In-Reply-To: <09e87ee7-4500-df21-1e20-641303a67b5c@amd.com>
References: <20221009144001.161124-1-contact@emersion.fr>
 <09e87ee7-4500-df21-1e20-641303a67b5c@amd.com>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, James Jones <jajones@nvidia.com>,
 wayland-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sunday, October 9th, 2022 at 20:00, Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:

> Am 09.10.22 um 16:40 schrieb Simon Ser:
>=20
> > Introduce a new DRM_IOCTL_SYNCOBJ_TIMELINE_REGISTER_EVENTFD IOCTL
> > which signals an eventfd when a timeline point completes.
>=20
> I was entertaining the same though for quite a while, but I would even
> go a step further and actually always base the wait before signal
> functionality of the drm_syncobj and the eventfd functionality. That
> would save us quite a bit of complexity I think.

Hm what do you mean exactly? I'm not sure I'm following.

> As a general note I think the name
> DRM_IOCTL_SYNCOBJ_TIMELINE_REGISTER_EVENTFD is just to long, just make
> that DRM_IOCTL_SYNCOBJ_EVENTFD. Same for the function names as well.

Agreed.

> Additional to that I think we should also always have a graceful
> handling for binary syncobjs. So please try to avoid making this special
> for the timeline case (the timeline case should of course still be
> supported).

This makes sense to me.
