Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD75426D7B7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 11:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DD36EB8E;
	Thu, 17 Sep 2020 09:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF99A6EB8E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 09:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600335220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BONsVsmpOHdwL0rz7IVQJcJZ28lA65U2kI6vT/g8vr4=;
 b=XDlWLXriJi1JRyCkvNteCTqfwQLkXVNzBMQrsezQodKfQ/mUFyIe/8Ot1OXoWGMirmJCu1
 rwggV3I8meBWQww92a4Z4PEDoXz4B7BNrv/Rigy+rKBgT1XmoW3aMy36Csk31skm20kndo
 7FdbsVeYseZE82SrTOEYCCNVBYFD6zo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-BSP_DBH4PgWniagY7rg_Sg-1; Thu, 17 Sep 2020 05:33:39 -0400
X-MC-Unique: BSP_DBH4PgWniagY7rg_Sg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E5EA56B56;
 Thu, 17 Sep 2020 09:33:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D94BC7880D;
 Thu, 17 Sep 2020 09:33:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 425499D5A; Thu, 17 Sep 2020 11:33:36 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:33:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH v3 02/19] drm/virtio: blob prep: make CPU responses more
 generic
Message-ID: <20200917093336.kkukg4pwxfg3dpft@sirius.home.kraxel.org>
References: <20200917000838.735-1-gurchetansingh@chromium.org>
 <20200917000838.735-2-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200917000838.735-2-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
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

On Wed, Sep 16, 2020 at 05:08:21PM -0700, Gurchetan Singh wrote:
> RESOURCE_MAP_BLOB / RESOURCE_UNMAP_BLOB can use this.

> -#define UUID_INITIALIZING 0
> -#define UUID_INITIALIZED 1
> -#define UUID_INITIALIZATION_FAILED 2
> +#define STATE_INITIALIZING 0
> +#define STATE_OK 1
> +#define STATE_ERR 2

--verbose please.  I fail to see the point and browsing the following
patches doesn't make things more clear ...

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
