Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3772AC0D3B
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E3C10ECA8;
	Thu, 22 May 2025 13:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="tq8ZQxM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch
 [109.224.244.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749A810EA10;
 Thu, 22 May 2025 13:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1747921796; x=1748180996;
 bh=53NO6dKMuJgvQDYYdblmZR+3Hz0N1aZ3tQGKCgGafU0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=tq8ZQxM5S2EZrjSsY0qYZQ8Zw9RMP6mEOxQjzuh1m/lN2ltE+ziA7K+owa2zWstjY
 Demcmk9W8QlP9M0xZUYijSXtCVeJNbODpE6zuZxzZf1JVzingiHKUkG9FZc4SkkMY9
 u01lgHPqWg4Y5h+pNsWItn9qrsp/fwHbAURXk17eZgP5IJtTdPqOxOrqkaKjJC1O1J
 mEA5dzT4hX9qteyE2LhBUfuN9lro2AwdojLAgZP+C6sR3FEmbX1u66BIhsfCppsPJa
 N83V3rXOWpw0lFZlwPGKPjQ63s/JjBz9poHETN3iPg6/JP8ZrOcf1geioCQI3FuITb
 c4PHChKn4TdKQ==
Date: Thu, 22 May 2025 13:49:51 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>, Alex Hung <alex.hung@amd.com>,
 Misyl Toad <misyl@froggi.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
Message-ID: <GU-BDO4CzKoaYho7e7l7uEcE32cTt406VF-JQN50yxsvw0g6xGWuQhQDXPANhy9_71s7P6vduHxXsHned9-FCdKqEv80c7HHuNsRAdcwnKs=@emersion.fr>
In-Reply-To: <d1f0e3ac-a030-4763-a112-adca30e9ab08@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <CAPj87rNUDdDEopPH+iAF-a=Or6eXH4cMRU8eOj81g_40cq8gdA@mail.gmail.com>
 <f7e9cd32-3e2b-4f06-aa13-049c8b7ba29b@amd.com>
 <CAPj87rMbcZKy2ARe_tp_-+-tMu3FpS0C9R1BHVzjsUpOsU9M4g@mail.gmail.com>
 <5921076d-0150-4e0f-a3ef-1b8dec021630@collabora.com>
 <CAFZQkGymi1XY7m0Ghs8R2HaNRQptE_0NO-5J5Z2c61gDJRho3Q@mail.gmail.com>
 <63e934e6-3c27-4128-801b-f1189f12f8f0@amd.com>
 <20250522105741.6aafc955@eldfell>
 <d1f0e3ac-a030-4763-a112-adca30e9ab08@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: a600b7c2c2f83f42fce34b79b2dae6f2280ecbc8
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

On Thursday, May 22nd, 2025 at 15:28, Harry Wentland <harry.wentland@amd.co=
m> wrote:

> > > What we should
> > > do is reject YCbCr-type buffers with the color pipeline until we
> > > implement support for COLOR_ENCODING and COLOR_RANGE as a new
> > > CSC colorop.
> >=20
> > Rejecting is fine, but is implementing COLOR_ENCODING and COLOR_RANGE
> > really a good idea instead of making the color pipelines handle them?
> >=20
> > Wasn't the original plan to hide all such legacy plane properties when
> > userspace signals color pipeline support?
>=20
> It still is. But handling the color-space conversion via a new
> colorop with two properties: COLOR_ENCODING and COLOR_RANGE
> seemed to be the most straight-forward way of dealing with this.

I think everybody in this thread is suggesting that the old plane
COLOR_ENCODING and COLOR_RANGE properties are rejected and will never
be accepted again with the color pipeline. I think Harry is just saying
that a new colorop can be introduced with encoding/range properties, but
this is completely separate from the old props?

Simon
