Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D041132C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 12:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A016E49F;
	Mon, 20 Sep 2021 10:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5186E47E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 10:56:48 +0000 (UTC)
Date: Mon, 20 Sep 2021 10:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1632135406;
 bh=umRM+lDpmrctuIg6OX62fIG0QpJ7/qVX2QJFwO69EvE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=nrz8z4Y9KmiFKCMdCMQrJMsMEAVEBeVwlqtz0yj35iI4oXw2nXCGkF2rt7jkZexQc
 shV5ZHEWaYoTucbZQZE7eFFjqY79qk+xOWKl9f4wYJle/KIK4igLnOw7+C5t6hxQWR
 Zy/CjV0rif+AcTmgZfux8HGPFRwl7IEUKbYwJLkRVTF+wYhC9nRLxxRPntgYy1QlNt
 jbGpt1Yjvyk0EYZWc4NxCretqEqeDjRB+4WsavAGOGHvQ110Uy2jMHm5i0KOz5fzlW
 wbDeJ9a+xpbJxDFdD9nS8lpyQQ5MUM5W5csXAjzJ7egLRBLpZzI+jQEqrN/TmhOHcD
 QL4opBf0K6VSg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Stone <daniels@collabora.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Emil Velikov <emil.l.velikov@gmail.com>, Keith Packard <keithp@keithp.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>
Subject: Re: [PATCH v2 2/2] drm/lease: allow empty leases
Message-ID: <L77uOXbj1QMaNuFWivOqKLihU0dKvuBhaU0LQWCVl28_pFJ1hmvlMByXXReIBAIsk-BdDVlZGryX-PdlUNbaRCbgemlq9Lscyb35fR1MiGY=@emersion.fr>
In-Reply-To: <20210903130000.1590-2-contact@emersion.fr>
References: <20210903130000.1590-1-contact@emersion.fr>
 <20210903130000.1590-2-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Anyone up for a review on this one? Daniel Vetter has ack'ed but
doesn't have time for a full review.

CC Maarten Lankhorst, Maxime Ripard, Michel D=C3=A4nzer

Who else should I CC?
