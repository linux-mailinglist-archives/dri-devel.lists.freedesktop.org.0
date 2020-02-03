Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D285D1501CF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 07:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68986E199;
	Mon,  3 Feb 2020 06:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36306E199
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 06:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580712488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iSvEp0NARLlsRjkcniMc+YoqIrR/1UyItUO6rmFA0Zs=;
 b=SR/5xT/UGL6ZEnqTp+719nuaVm6cUe/lFJ6AoLLKpfIkG/abpQaOcIkof/z2xwkNfccY1T
 D7RXaiMzmGErooYE5R3x6iCc4k2p3xy61Vd9M/nTjznCFAqEhnqR3QvnbYhD9Y2ueN07H0
 QuMaIzVZNOo1BpznvUtyjaUXAFGd+mc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-t0ui-Z1SOU2wW0iPetMFNw-1; Mon, 03 Feb 2020 01:48:02 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F07C3800D4E;
 Mon,  3 Feb 2020 06:47:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E77E919C58;
 Mon,  3 Feb 2020 06:47:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D4F509D7F; Mon,  3 Feb 2020 07:47:57 +0100 (CET)
Date: Mon, 3 Feb 2020 07:47:57 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/4] drm/bochs: Implement struct
 drm_mode_config_funcs.mode_valid
Message-ID: <20200203064757.2v4hqad2trw7jcwk@sirius.home.kraxel.org>
References: <20200201122744.27165-1-tzimmermann@suse.de>
 <20200201122744.27165-3-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200201122744.27165-3-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: t0ui-Z1SOU2wW0iPetMFNw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com,
 dri-devel@lists.freedesktop.org, zourongrong@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 01, 2020 at 01:27:42PM +0100, Thomas Zimmermann wrote:
> The implementation of struct drm_mode_config_funcs.mode_valid verifies
> that enough video memory is available for a given display mode.

There is bochs_connector_mode_valid() doing the same check,
you can drop it when hooking up drm_vram_helper_mode_valid.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
