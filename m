Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F44E25F2A0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 07:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E45F6E072;
	Mon,  7 Sep 2020 05:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE946E072
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 05:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599456674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7u5Tg4TKQ/lctelbd2RgEeIR3IZe+BOLIIil/geQovc=;
 b=Wr9nsyfQ0K9oYjVO4VS5DtDGN7M9Fy7pSpqnPgOzlcFALvDFrr1Xtn3PvR6NvxtI5JgGHD
 0oGkyuMxTPK9l9JheK0aqVB1ywo9pDqr6s0NtFlUXZ35TmC4BS5yPSaJDwIOWV8IHVFYHm
 bRnDVLR0S7QxsqWQluCbt9WhpimQgRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-6j6BrRsaPJO4rLy9VPV3Ww-1; Mon, 07 Sep 2020 01:31:10 -0400
X-MC-Unique: 6j6BrRsaPJO4rLy9VPV3Ww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31DE01005E63;
 Mon,  7 Sep 2020 05:31:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E44085C225;
 Mon,  7 Sep 2020 05:31:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0AE1B7828; Mon,  7 Sep 2020 07:31:08 +0200 (CEST)
Date: Mon, 7 Sep 2020 07:31:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kristian H. Kristensen" <hoegsberg@google.com>
Subject: Re: [PATCH] udmabuf: Add missing compact_ioctl
Message-ID: <20200907053107.yl6gnkzpzl5p6gmt@sirius.home.kraxel.org>
References: <20200903181652.432067-1-hoegsberg@google.com>
MIME-Version: 1.0
In-Reply-To: <20200903181652.432067-1-hoegsberg@google.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl   = udmabuf_ioctl,
> +#endif

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
