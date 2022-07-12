Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE05714CF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 10:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0439E936C6;
	Tue, 12 Jul 2022 08:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA17D936C2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 08:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657615154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5QOqJ4kUVcMhzsvBi2zHV3cNg0o5rdwS2uhN70OOikU=;
 b=RD/n3Z7VFEOhS1Ksoexwsxs02mjkbhnCR3D3bY7y/5gv1WC74uffbotYyM37onWs4bDIsc
 Mex9+RWuHCjxXDxu4vXA/vlWMPWItSIVl8dtfWqjFUFOT2FjzRueMM2wK2iHYcv3mt1y95
 IcZ8PPmX5dRmweHG3m3Ri94rsbSB3F4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-33YfUhjRPQ6V85DPpVdaIA-1; Tue, 12 Jul 2022 04:39:10 -0400
X-MC-Unique: 33YfUhjRPQ6V85DPpVdaIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5694801755;
 Tue, 12 Jul 2022 08:39:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B18A5C15D58;
 Tue, 12 Jul 2022 08:39:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E9CD018000A9; Tue, 12 Jul 2022 10:39:07 +0200 (CEST)
Date: Tue, 12 Jul 2022 10:39:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
Message-ID: <20220712083907.3ic7bltstaskz72n@sirius.home.kraxel.org>
References: <cover.1657300532.git.geert@linux-m68k.org>
 <0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org>
 <96a87833-d878-dde9-e335-9ea51a4ba406@mailbox.org>
 <CAMuHMdUgdbZeoFLFL8+Hm-6fG9cg5Wzq++JED3KR5P9YZtRQ4A@mail.gmail.com>
 <20220712074715.kopstlvz4q6npaye@sirius.home.kraxel.org>
 <CAMuHMdVrf7fgzumcSnZJ3OMGqA34YExXcF3O15YXYpA1ykgKyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVrf7fgzumcSnZJ3OMGqA34YExXcF3O15YXYpA1ykgKyQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 David Airlie <airlied@linux.ie>, Linux/m68k <linux-m68k@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 10:01:15AM +0200, Geert Uytterhoeven wrote:
> Hi Gerd,
> 
> > It IMHO is not applicable to any physical hardware.  It's used by
> > virtio-gpu where the supported format depends on the byte order
> > (it is argb8888 in native byte order).  Only virtual hardware can
> > have that kind of behavior.
> >
> > And we can probably drop the DRM_FORMAT_HOST_* variants for 1555 and
> > 565, they are not used anywhere.
> 
> Atari DRM supports (big-endian) RGB565, so it uses
> DRM_FORMAT_HOST_RGB565.

Fixed big endian should use 'DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN'.

As described above DRM_FORMAT_HOST_RGB565 means bigendian on bigendian
hosts and little endian on little endian hosts.  Which is not correct
when your hardware does big endian no matter what.

take care,
  Gerd

