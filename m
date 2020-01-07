Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9F41321E7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 10:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0D16E804;
	Tue,  7 Jan 2020 09:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2076E804
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578388106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ze4Ti/dYGBt9Vq1JN82oVFya75tN3esK+ne4JpRQwWE=;
 b=DPIu22V4EETJF9htfUSKCd3NX/pyLdGxmjIdrLSPoT2ZOagizNUIOngcVz72KsDAnVROFn
 KVkJbYyoc3i2I0bEe0SKdQ0XINcSDBR/pnd/8MPihROvxzXvKrAC3bfVZiYG7OCQJowsYI
 T1NUQelugiINizzMxp4UKX1Q8YbVeU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-HSzOpea7PAG_m4O4d8C1rg-1; Tue, 07 Jan 2020 04:08:24 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37E5B1005502;
 Tue,  7 Jan 2020 09:08:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E80187C348;
 Tue,  7 Jan 2020 09:08:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 26E899DA5; Tue,  7 Jan 2020 10:08:22 +0100 (CET)
Date: Tue, 7 Jan 2020 10:08:22 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 6/8] drm/vram-helper: Remove interruptible flag from
 public interface
Message-ID: <20200107090822.h745m3274xsshxod@sirius.home.kraxel.org>
References: <20200106125745.13797-1-tzimmermann@suse.de>
 <20200106125745.13797-7-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200106125745.13797-7-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: HSzOpea7PAG_m4O4d8C1rg-1
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

On Mon, Jan 06, 2020 at 01:57:43PM +0100, Thomas Zimmermann wrote:
> The flag 'interruptible', which is passed to various functions,
> is always set to be false. Remove it and hard-code the value.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
