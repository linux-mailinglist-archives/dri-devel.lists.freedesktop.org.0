Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB67E6D73
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 16:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC9A10E8D6;
	Thu,  9 Nov 2023 15:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0466910E8CA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699544000; x=1699803200;
 bh=puEmrOXeDHVWEPoB0nXVbZhJcoSPRc5C6CidYWzcGhw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=pHisTk12tB+ktXSnq0W+g4pl4XpjIsPJ4hxcyUlFKe/lQEKw5CzddB54ea2pKJYx8
 zUoMXZdLqttRTAgpBgmhhxzisg8/Rb584V/HPc6+MUXBzn9auQFg8v78s62sSqnGkl
 H91rXOeGTFSaLKyqF93wAfP5IM50nA7oXwx1sjd1SDSRMY17UpVjiV35wkdEQIUj79
 vFZDbZokLFpq3c+cB7O9a80HGkdngO1P7fP1rn53VKG246Esae59vH7XkD5QfGWT2u
 r/FJ0kICvk3ijn+s221+Kx9pNYm7FUNC+VE373NFPKZbSk58VPlLBsBMaL28L8CkGg
 jmIwkA+dlsDsQ==
Date: Thu, 09 Nov 2023 15:33:12 +0000
To: Iago Toral <itoral@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <7l6QMayVfeAFT5YwB6ShRJXycuhdaCBn9gmdGN-Np8GE4SxbKHNKIiceg5rHXT3y7cms7JmtE01W6TDo2WimhHQpMl7c01E5dMDVfYK3cHo=@emersion.fr>
In-Reply-To: <45f97994b37bd1de70e4322badebfa99cd0e2456.camel@igalia.com>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <45f97994b37bd1de70e4322badebfa99cd0e2456.camel@igalia.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the feedback Iago! I've replied to Maxime and I believe that
covers your questions as well.
