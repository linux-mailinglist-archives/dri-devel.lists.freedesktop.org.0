Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40985AB8903
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 16:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B03510E8C3;
	Thu, 15 May 2025 14:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="l5Z4z7cT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch
 [109.224.244.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250E710E8BF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1747318518; x=1747577718;
 bh=T7M4ynVyq8Akv8IeO5bTzpKXq9vVI4mQz9V/T6BqECY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=l5Z4z7cT2BNAnoBgSq8UVDfL4SIAaWb1lrqAJOR0j61ex0+PU8z4xsvCdeU6FsZ1t
 epZmNmowf8hO10C8RkjwxiueRaixp6j8cB1r34BkPD6cl9cJ/j9yeWacDtTqQIHILf
 bqmaZZQoq75DYzJd/7sDIzFiwVXuyrm5b1rblW+Mp3bOSZjCu2cYkERzfIeu4mvtgI
 9ce9ojXu8fJsWaOT0WvUDQyvPF0owrJIRnbVznzlAxyWYCbDdMoDyUEioDQ6fI+/cl
 cF/fxDXqqC9o215DF/amww/UydXzg/FpiZ1V1wdojP4ymog/iEsqLCGOTd1GHu4lbo
 YQETFNshBgXaQ==
Date: Thu, 15 May 2025 14:15:10 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, Misyl Toad <misyl@froggi.es>,
 xaver.hugl@gmail.com, Ribeiro <leandro.ribeiro@collabora.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
Message-ID: <kwahuvfSx3iFKHoXZEBc7VGXoho-lMIStQc4_UJc97yF65ZQxAEUDiIGsZXQOXAdbE1Z_36KKBFY0c6nceTGjreuHt97CvUWOK1-SG-AGc4=@emersion.fr>
In-Reply-To: <3bbd4bd7-7217-4a14-b7bb-383226f44f55@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <o4MtjqyDUjuFR4Y9Q1IEZlvVQ7Nkggq0v-KtBcH0aM3pTvEq8UcSoUDxefSBVdTmLj_1_a6GmbjU_mRSFinOb44B4bu1u3mMIckuQhhZWCc=@emersion.fr>
 <3bbd4bd7-7217-4a14-b7bb-383226f44f55@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 53aee2cfc69c6f0bcaefe2bfc3d885dee45a09d8
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

On Thursday, May 15th, 2025 at 16:11, Harry Wentland <harry.wentland@amd.co=
m> wrote:

> > Have there been updates from user-space implementations?
>=20
> I know Leandro has been working on Weston to make use of
> this and last year Xaver had a prototype in kwin.

Cool!

> Ideally we'd have gamescope adopt it and switch off the
> "temporary" AMD private properties and show that it
> behaves the same without breaking things.

Right, I've started working on this a long time ago [1], but didn't
manage to finish. I will not be able to continue this work, feel free to
continue the work, pick apart useful bits or start from scratch, as you
prefer.

Ideally I'd like to add support in libliftoff/wlroots as well.

[1]: https://github.com/ValveSoftware/gamescope/pull/1309
