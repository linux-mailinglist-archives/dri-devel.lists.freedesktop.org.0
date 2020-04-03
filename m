Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C04B19D491
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 12:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19BB6EB5D;
	Fri,  3 Apr 2020 10:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDEA6EB5D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 10:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585908277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6IPb+7qjfEum2JIj37pz7MMNHJXZ0TIRkx3B8AaQY/8=;
 b=dBy8v9FF8eywDnENuSfYp7iKLz+WKja3meKUa76QmGEqThlJjsu6fhzdfumFwlXtJbICTI
 cpTKPZNGo6f6/Yyh0BB0onF2fX46FdA/HKj/dckGNb/RcxI/2oLKT3lGDoNQTfjwmZZm/Y
 tEiCAUQ10Z27ZEeSOVimbfhhkqbi8Uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-oY-lmN1FOWWBwj1HrsU9ow-1; Fri, 03 Apr 2020 06:04:34 -0400
X-MC-Unique: oY-lmN1FOWWBwj1HrsU9ow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DF68800D50;
 Fri,  3 Apr 2020 10:04:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-60.ams2.redhat.com
 [10.36.113.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47D9E1147D7;
 Fri,  3 Apr 2020 10:04:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 060E91747F; Fri,  3 Apr 2020 12:04:31 +0200 (CEST)
Date: Fri, 3 Apr 2020 12:04:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 5/5] drm/virtio: only call virtio_gpu_cmd_create_resource
 for dumb resources
Message-ID: <20200403100431.ubanvlsqnefjx4gw@sirius.home.kraxel.org>
References: <20200401223039.2860-1-gurchetansingh@chromium.org>
 <20200401223039.2860-5-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200401223039.2860-5-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 01, 2020 at 03:30:39PM -0700, Gurchetan Singh wrote:
> We want to avoid this path for upcoming blob resources.

> -	} else {
> +	} else if (params->dumb) {

That should be posted as part of the actual blob resource patch series,
it doesn't make sense at all standalone.

The other patches 1-4 are fine, I'll go push them in a moment.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
