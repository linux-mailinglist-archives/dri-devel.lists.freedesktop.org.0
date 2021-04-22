Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902AF367CE7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 10:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D0E6EA3D;
	Thu, 22 Apr 2021 08:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4348C6EA3D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 08:51:37 +0000 (UTC)
Date: Thu, 22 Apr 2021 08:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1619081494;
 bh=YnbXi/3E4d4OjVC6hxEORIpQ2rRhu1QXBlY5Yolf8UU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=nNc8+KMdq6ocE8qHrhGhCBd51bt2RLCCey73j+O3unz3sQqox8BihFDD/mjFrrDz/
 CunGnhbc+h3ujaA68IuYlMD/aqVpf4dms/BM3Rb1uptc4cew0R6e3+tjY6mlpWI+cb
 mzgFluR7QMvQMcZqftB4J0CWGdilBeI0QSpf8xGJfZMMmnsrU/M0Vde84p1VRk3Dg7
 EoZsVzc/ERbIjoeDatXOUtWwnMyIjF8Mqn1hQbe36jUe/KbL5FF4OZJEvB8kML+RnT
 lhpmLahYj3au4JOgWegDxSnyRK5jQ0ahuoieqKzVBmZF2BPpILaDFxO3SSHN0yxT4k
 RCvMOG/MZH3gA==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 0/9] drm: Add privacy-screen class and connector
 properties
Message-ID: <OwVTQDmCbSZMBV41nuJO75afEwmVzcrgF9gLIDqAL4fODvfI-Md_R-Z-ifcVhy6VLc6FyOINwx6lUUz0B1hpykdQYe4b3iZALLftfk6yp_E=@emersion.fr>
In-Reply-To: <20210421204804.589962-1-hdegoede@redhat.com>
References: <20210421204804.589962-1-hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Mark Gross <mgross@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sebastien Bacher <seb128@ubuntu.com>, David Airlie <airlied@linux.ie>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mark Pearson <markpearson@lenovo.com>, Rajat Jain <rajatja@google.com>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wednesday, April 21st, 2021 at 10:47 PM, Hans de Goede <hdegoede@redhat.com> wrote:

> There now is GNOME userspace code using the new properties:
> https://hackmd.io/@3v1n0/rkyIy3BOw

Thanks for working on this.

Can these patches be submitted as merge requests against the upstream
projects? It would be nice to get some feedback from the maintainers,
and be able to easily leave some comments there as well.

Thanks,

Simon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
