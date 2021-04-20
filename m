Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ECA365DF2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 18:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154AB88D18;
	Tue, 20 Apr 2021 16:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5696A88D18
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 16:54:13 +0000 (UTC)
Date: Tue, 20 Apr 2021 16:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1618937650;
 bh=X1M3tuVWpAndo1D47PQUBVonVDO+ZAaIPMIUS0x26b8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=TBvKFhwNGBAUHOPt0grNaqrVV00KrVPyIJWVDzOPciGZWni9hMGQ7KibtBfSeemnw
 JClZZ6aEYGfocVP/OflHpG5rkPr44l/NWPv42BW5Yu1EKso6gmYk0EUvOPpCryiF6r
 rHCv6DirMKktf/gYDuR/XCGqNlgUQNRKNOtDjD6NOpcRGd8QYS4fFtjdggISkzH9jR
 mZDwdtBXeqETnbG+vseELTRDMey+bNGV9ykmalBhUbpPj/EFvpToOJQrnV9ipbrY+H
 mLAlNqQe+2ARHCvPaLHiscPxJOizCX9otpN66FWmtuz/AEA/6ZxMZ+6Syumbmj/4is
 079eb11/sU88w==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/connector: demote connector force-probes for
 non-master clients
Message-ID: <i5W_XkwCUbcRZg59AqPDlYbRlD8t4Tf4rnAU2ulYxKXAqiOj6uOaDcUoIXdR_3YD1ioqlbWHLhHrVPNWCn1STLs95lMPyOoIGHTWWpod4Ok=@emersion.fr>
In-Reply-To: <YH6bjle8zyejKJD0@phenom.ffwll.local>
References: <20210402112212.5625-1-contact@emersion.fr>
 <YH6bjle8zyejKJD0@phenom.ffwll.local>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, April 20th, 2021 at 11:14 AM, Daniel Vetter <daniel@ffwll.ch> wrote:

> Do we have an igt for this? Timing test should do the job I think,
> assuming we have at least one output which requires an edid read (so maybe
> skip the test if a forced probe takes less than 10ms or so).

Err, an igt that only relies on timings? Sorry, but that sounds like a
recipe for flaky tests.

Ideally a chamelium test would allow to make sure all of this works as
expected. I don't really have this hw anymore though.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
