Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F955447278
	for <lists+dri-devel@lfdr.de>; Sun,  7 Nov 2021 11:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620786E8FB;
	Sun,  7 Nov 2021 10:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9456E8FB
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 10:13:01 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 51ee54a3-3fb3-11ec-9c3f-0050568c148b;
 Sun, 07 Nov 2021 10:13:14 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 6A2E8194B7F;
 Sun,  7 Nov 2021 11:12:58 +0100 (CET)
Date: Sun, 7 Nov 2021 11:12:56 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for the Lenovo
 Yoga Book X91F/L
Message-ID: <YYemqI7MP/rdKuq9@ravnborg.org>
References: <20211106130227.11927-1-hdegoede@redhat.com>
 <YYb6r8+aw1bR9R4z@jeknote.loshitsa1.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYb6r8+aw1bR9R4z@jeknote.loshitsa1.net>
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yauhen,
On Sun, Nov 07, 2021 at 12:59:11AM +0300, Yauhen Kharuzhy wrote:
> On Sat, Nov 06, 2021 at 02:02:27PM +0100, Hans de Goede wrote:
> > The Lenovo Yoga Book X91F/L uses a panel which has been mounted
> > 90 degrees rotated. Add a quirk for this.
> 
> Tested on my Yoga Book, works.
Great - and then it would be prudent that you acknowledge this with:
Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>

A "Tested-by:" is in many cases better than an Acked-by: because you
actually applied the patch, build it and verified that it works.
Where an Acked-by: is just to say that you have looked at the patch and
agrees with the patch.

So a Tested-by: gives you the credit you deserve here.

	Sam
