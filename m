Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD013221E1D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 10:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB8E6E112;
	Thu, 16 Jul 2020 08:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14EF6E112
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 08:22:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E675AED6;
 Thu, 16 Jul 2020 08:22:07 +0000 (UTC)
Received: by localhost (Postfix, from userid 25012)
 id BE90A1E6A6B; Thu, 16 Jul 2020 10:22:02 +0200 (CEST)
MIME-Version: 1.0
Message-ID: <24336.3626.550480.602611@gargle.gargle.HOWL>
Date: Thu, 16 Jul 2020 10:22:02 +0200
From: Egbert Eich <eich@suse.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 0/8] drm/mgag200: Support desktop chips
In-Reply-To: airlied@gmail.com wrote on Thursday,
 16 July 2020 at 05:56:22 +1000 
References: <20200715145902.13122-1-tzimmermann@suse.de>
 <CAPM=9tx1+cNHR3aYWFNey9veYn18A=b1Tgm9Pa4UvKjUSFg22g@mail.gmail.com>
X-Mailer: VM 8.2.0b under 25.3.1 (x86_64-suse-linux-gnu)
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 kernel test robot <rong.a.chen@intel.com>, Egbert Eich <eich@suse.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dave Airlie writes:
 > On Thu, 16 Jul 2020 at 00:59, Thomas Zimmermann <tzimmermann@suse.de> wrote:
 > >
 > > This patchset puts device initialization in the correct order and
 > > adds support for G200 Desktop chips (PCI ids 0x520 and 0x521).
 > 
 > why? :-)
 > 
 > I'm pretty sure I NAKed the previous version because the userspace
 > experience for these old cards was probably better with
 > xorg-x11-drv-mga, but hey maybe it isn't anymore and we should go
 > ahead. I know SuSE use these for testing, but apart from that do we
 > really think we have any users for this?
 > 

The reason I had added this was to enable me to test the
basic functionality of this driver with a test box at
my desk rather than having to rely on some remote screen
setup to some server half way around the world ;)

And I'm actually not sure if the user experience with
this card with the xorg-x11-drv-mga is as good as it
used to be in its prime time days.

Cheers,
	Egbert.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
