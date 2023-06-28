Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E2374137F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 16:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA40C10E084;
	Wed, 28 Jun 2023 14:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2474C10E084
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 14:16:08 +0000 (UTC)
Date: Wed, 28 Jun 2023 14:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1687961763; x=1688220963;
 bh=sZc3kB2APPrMTWJOdnMpvtQ/lKyxQgddThpWdoH0wxg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=kE6Q3B5ofGLSmFYG629VdCr86kDjw6zhK7qmIfQ44QlFRqpfivFeRnbwFbBVUJ2a2
 XDnFnad+tZ/QkFSQXFPtH+MCz0vjtRjeCUstDFSnSLMgbxd/U8agFhGmAi492B5MQa
 /qZGapAGxTjzSYsd71ZD+79RKIxjzvFy5czLUsffRQQ+OZJoeYMmElzyoUOo9HvL8R
 /aZKPXLkp6qkAGxekupaaH8dKWmR9smTLHQBOgNSLYlNT0ATr6nJOXvRAIaCmMyOK1
 EAvod5nXRpiPrKn416xS8wtLjyIEskTqJqP1EhlZnIf9HMtMVYLIvK8arX3k9FUE1e
 YoRqrl57WlC/w==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Message-ID: <ELiKi1uMIZlwdApTnf2UXxjOpykcSbJ8YC8EXm-kzkHNMKHzA6iYzXTvbyyAfhqf9LGkjQSt1QErJ1m6WwglWXg9Hmh3QsG6mV84jbYTLFQ=@emersion.fr>
In-Reply-To: <20230628052133.553154-3-zack@kde.org>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org>
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, javierm@redhat.com, banackm@vmware.com,
 krastevm@vmware.com, ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I think we should drop the CRTC_X/CRTC_Y properties for hotspot-aware curso=
r planes.
The drivers aren't going to do anything with these, and exposing them to us=
er-space
makes it sound like user-space controls the position of the plane, but it r=
eally
doesn't.
