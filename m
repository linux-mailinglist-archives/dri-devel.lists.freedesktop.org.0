Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C88F407EAF
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 18:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF58D898E8;
	Sun, 12 Sep 2021 16:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54256E030
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 16:41:25 +0000 (UTC)
Date: Sun, 12 Sep 2021 16:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631464884;
 bh=pBuKQvl727OM53Seayb1jaMZ4mZrh3M8X7DcCVHr6po=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=MUMwParXJ4j/osZvvvt8fRHhoGxUNoUNeaXPRctYPOr1kZVHujAW844EfKYXP+WJL
 u03dioejTxHH2aK4ags8HdzwSAjbbdzbChqEKd5v4ewsok/QrCfOfU3SwoZn+xii/r
 VjHKTAKM1N4MHesSFXuDgW/cAZQ+wXfzenMaqL+/1DF4EtY75fO9Zpa9QWKSO9p57s
 70cYnd8MCuwy8uMayZiEyr8c9/zxYSGeiH9LkDfAFoTd7x0t7C+hXdYBum3miMcHDj
 UwSALd8MTJT/vCrnW2ehjgXOISHTKGBwAQH+PbwbOF18VjchQiQhrvYP5zrQjdrVb+
 +DMpPSzSpxVBw==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Jared Baldridge <jrb@expunge.us>, Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/panel-orientation-quirks: add Valve Steam Deck
Message-ID: <xcDD5WE2nt7zv6oC1GLWBaZ8Lss5Z6hJWCqe83wH9kYzrkNZRHydylCPYJ-6lYeiMRuk1Oa7rYoJd-DuKEOLbFXwGd6UITWmjUuIrbMlqew=@emersion.fr>
In-Reply-To: <7b70f7c8-51bf-8e52-4f34-bc0294a918ec@redhat.com>
References: <20210911102430.253986-1-contact@emersion.fr>
 <YTz7gKnpXxIbhPGF@ravnborg.org>
 <7b70f7c8-51bf-8e52-4f34-bc0294a918ec@redhat.com>
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

Thanks for the fixup and the quick review!
