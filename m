Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65798246522
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 13:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992E888310;
	Mon, 17 Aug 2020 11:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8F488310
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597662511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sRXpA3KVhG5i/ooij8DK6osX068yWEAfosvf8o3Zs6Y=;
 b=geegxBTIg0QOKdQY/NHKC5v12WrWx9UNO63wcLBHBhZfIW2LS9/t37cWeGMO8iWFmdsh8i
 R5EpMKrY6lGN1CT3pUoxMkPhn2QWwIMTaVA6UolZF/4BDKkpBV7GWB5mdWypzgj27qzeJr
 hycX0a6RiKaxtDlIFiUDJp4oFQI9LWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-OQTjsRyGO2CmwRxlHku8Ow-1; Mon, 17 Aug 2020 07:08:28 -0400
X-MC-Unique: OQTjsRyGO2CmwRxlHku8Ow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C4B2185E53C;
 Mon, 17 Aug 2020 11:08:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3997310013C2;
 Mon, 17 Aug 2020 11:08:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 201FA9D8F; Mon, 17 Aug 2020 13:08:24 +0200 (CEST)
Date: Mon, 17 Aug 2020 13:08:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sidong Yang <realwakka@gmail.com>
Subject: Re: [PATCH] drm/qxl: Replace deprecated function in qxl_display
Message-ID: <20200817110824.ascomag3nh7ufabs@sirius.home.kraxel.org>
References: <20200524022624.10363-1-realwakka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200524022624.10363-1-realwakka@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 24, 2020 at 11:26:23AM +0900, Sidong Yang wrote:
> Hi, Dave.
> 
> This is resended e-mail for your advice.
> 
> I'm a newbie interested in linux kernel and qxl module.
> Please check this patch and give me advice for me.
> Also I'll be glad if there is any task that you bothered.
> Thanks.
> 
> Sidong.
> 
> Replace deprecated function drm_modeset_lock/unlock_all with
> helper function DRM_MODESET_LOCK_ALL_BEGIN/END.
> 
> Signed-off-by: Sidong Yang <realwakka@gmail.com>

Queued for drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
