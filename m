Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF489AF4BF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 23:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E4C10E3BC;
	Thu, 24 Oct 2024 21:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="GchmDkiw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9806910E3BA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 21:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1729805698; x=1730064898;
 bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=GchmDkiwzjHUzphRTZ7mqVaLX2rZofgM4AeXNI1oLuZBQlf6NiAkhwO71L7ZqlXw/
 Z88fUiHzB4reDhzc5BLtCRTrWUdeZqFf66kACHNnSXaqgQi7HFFDbaKXtDPCI0lwvQ
 /xYfCYTEs5rqpCsP8XHu0Odx7iqSfJC3vAaYm8XhI/K/7f+I+GiorF/ipKppCXwiyA
 XMuMoPP/6Fu3JAfGd/63W6CNXBijFN6BkAFXgu5r4W6EkWgqy1uOa6cwu1xh9PgXWk
 B3aIk07fwbgTww5H7lkC3sqYqqagIcF+hOR1IQ6Vlhq6qUeyvdDsdSCQv/IJZB+fsI
 /06b1a3z3rctQ==
Date: Thu, 24 Oct 2024 21:34:52 +0000
To: Jani Nikula <jani.nikula@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: remove driver date from struct drm_driver and
 all drivers
Message-ID: <QMi2RXA05r08zucgpXkakwSfIm28vqmqYoOP-Da66Gq4jQWGZA8PfpAGd4z1VYfU4ao-2sj4u5qO6n5OpQv-ccu8Rwtm5Y1MNpQ-rpTo0tY=@emersion.fr>
In-Reply-To: <20241024162240.2398664-2-jani.nikula@intel.com>
References: <20241024162240.2398664-1-jani.nikula@intel.com>
 <20241024162240.2398664-2-jani.nikula@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: ff36b191848725b70c63fcfb4b045f3132e16d83
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

Acked-by: Simon Ser <contact@emersion.fr>
