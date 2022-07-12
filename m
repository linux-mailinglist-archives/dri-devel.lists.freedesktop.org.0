Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E19571545
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 11:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC68B12A5F0;
	Tue, 12 Jul 2022 09:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B8914B522
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 09:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657616589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nq1qiwtLifVGTobMDZeYWQmt6IOHO8N3mCb7gEISvPQ=;
 b=YuGlEk0k97e0Zzb3GsSAjCCXo0Oa+ii30avM90OyezpozOGU92DIdZGu/w7EGrKspPTNZw
 1fN5RMVEUA/Ac6OXPJprGk79za/Z3bBXPDRZ9USaXfeZpjwTMrmPFEYAigHIn1Pltds96N
 k29SN+3eJbIi1MlSuG8vd1i6C7GJ9EY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-lAfOuTwkND-Pb2I1uq_WhA-1; Tue, 12 Jul 2022 05:03:08 -0400
X-MC-Unique: lAfOuTwkND-Pb2I1uq_WhA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99239101AA48;
 Tue, 12 Jul 2022 09:03:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 532B21415118;
 Tue, 12 Jul 2022 09:03:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 919B018000A9; Tue, 12 Jul 2022 11:03:05 +0200 (CEST)
Date: Tue, 12 Jul 2022 11:03:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
Message-ID: <20220712090305.44jq3olwhwypisoc@sirius.home.kraxel.org>
References: <cover.1657300532.git.geert@linux-m68k.org>
 <0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org>
 <96a87833-d878-dde9-e335-9ea51a4ba406@mailbox.org>
 <CAMuHMdUgdbZeoFLFL8+Hm-6fG9cg5Wzq++JED3KR5P9YZtRQ4A@mail.gmail.com>
 <20220712074715.kopstlvz4q6npaye@sirius.home.kraxel.org>
 <CAMuHMdVrf7fgzumcSnZJ3OMGqA34YExXcF3O15YXYpA1ykgKyQ@mail.gmail.com>
 <20220712083907.3ic7bltstaskz72n@sirius.home.kraxel.org>
 <CAMuHMdVhxE9aayG8qRMwUuBryiR_ng08m63_+GY8htFCSmUiWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVhxE9aayG8qRMwUuBryiR_ng08m63_+GY8htFCSmUiWg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

> > As described above DRM_FORMAT_HOST_RGB565 means bigendian on bigendian
> > hosts and little endian on little endian hosts.  Which is not correct
> > when your hardware does big endian no matter what.
> 
> But (a) drm_driver_legacy_fb_format() uses DRM_FORMAT_HOST_RGB565
> if quirk_addfb_prefer_host_byte_order is set,

Ah, right.  Missed that in 'git grep' output.  Given that traditional
fbdev behavior is to expect native byte order using
DRM_FORMAT_HOST_RGB565 there makes sense indeed.

Scratch my comment about it being unused then ;)

thanks,
  Gerd

