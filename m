Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B771321E5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 10:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2A36E7E6;
	Tue,  7 Jan 2020 09:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE4F6E7E6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 09:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578388074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iiZzx1OQXNfOA5vAGTShke7Nd6Ry7lxvpygk1Az9pd8=;
 b=JXFG22wrnXkqJ3cPwmQ6RQ/uDJunm4yt2KFA4s84q5aKRgB8Qr97qFz90WnGbG2oP0t2x2
 wmv/8TpBS3Wa3JD0qtdo8JmK7lqPIHj/2HV5hzbPy21j6SfDgPSGMHbKR8C75oOQlr5HGL
 1O3NeG1+YONZkthLzZ7QsUJPhYY3rCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-Xuq7DS33O8K4E7wOIAPWUA-1; Tue, 07 Jan 2020 04:07:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B460477;
 Tue,  7 Jan 2020 09:07:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABDF97C333;
 Tue,  7 Jan 2020 09:07:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A7E329DA5; Tue,  7 Jan 2020 10:07:46 +0100 (CET)
Date: Tue, 7 Jan 2020 10:07:46 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 5/8] drm/hisilicon/hibmc: Export VRAM MM information
 to debugfs
Message-ID: <20200107090746.jnsvx7g644kd6bos@sirius.home.kraxel.org>
References: <20200106125745.13797-1-tzimmermann@suse.de>
 <20200106125745.13797-6-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200106125745.13797-6-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Xuq7DS33O8K4E7wOIAPWUA-1
X-Mimecast-Spam-Score: 0
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
Cc: puck.chen@hisilicon.com, kong.kongxinwei@hisilicon.com,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 zourongrong@gmail.com, airlied@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 06, 2020 at 01:57:42PM +0100, Thomas Zimmermann wrote:
> This change makes information about VRAM consumption available on
> debugfs. See
> 
>   /sys/kernel/debug/dri/0/vram-mm
> 
> for an overview of how VRAM is being used.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
