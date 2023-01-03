Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3867F65C4FA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 18:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B4C10E271;
	Tue,  3 Jan 2023 17:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271AA10E271
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 17:23:32 +0000 (UTC)
Date: Tue, 03 Jan 2023 17:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1672766610; x=1673025810;
 bh=SCRdqYu/X+JlKwPLq1M2s6KsWP3afb1Fv8d1g4YI73I=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=El7+VJCw6R1so54lFw4W7Z0IMSAfG6ynR1fofzrklUK+rdMUbWqq5oPd2a8j0r21m
 iFOZmu5xJFpW2jv6exXPrz/ehdIXayBGxm15LIZi4QY97jQNna+i+SFkJvDJGdc8OQ
 7+zHCx4x86DZcoUevfcPmg58uC7+gb56nG84F480V/fzu/Aj4eM5DkyCsUdFPXCGSA
 GGHKj1PKyVA7xwnIpfJN4RnI1AmlGfxU63eWycdBbCOXUVeMae3w8Zaq3k7a4fnbCz
 zdOGs/XkzwVF4UKQGaKDJX/Tzip06bsHTy2oOZ/rZwtFinBoVTAvoJa5AD4WwCEBWY
 OvpesqKVR/xSA==
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Replace DRM_DEBUG with drm_dbg_core in file and
 ioctl handling
Message-ID: <fCuRKnDwXZsAK187tgLS6nkBAE5uck8Fz0nUMjMAfoNhP45QvQkejGwPGr1hYdv3m_sCmPVjeIVDMk2QI7o-aP18q5dCC86z5VB92ceetVg=@emersion.fr>
In-Reply-To: <5b12840a-6449-9f04-2161-37eea635d7e7@linux.intel.com>
References: <20221223112302.320097-1-tvrtko.ursulin@linux.intel.com>
 <Ouj8KzpA0lrnzC2YtFbX5tEX0Ul5cCTyrv3EU8NV43vW4OvkygMxFbbmZuuNHzVQd0sve9fgk2ZcATKeu1inEq12B9W4SYGGTdDWLBfuUWo=@emersion.fr>
 <c7337539-9d75-49c5-286a-d94e3e78c4df@linux.intel.com>
 <xnufxH1XoaGhgn-6c2f0sIWqdDktkVmzwOVZqN5R_W5elPxJnzD3ZIXOzUd3vg7RcatrWvxFvElw9JF7MdduIdpAkvT4iilppyO43KEr-no=@emersion.fr>
 <5b12840a-6449-9f04-2161-37eea635d7e7@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed, thanks!
