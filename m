Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B0A32E506
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 10:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F996EB33;
	Fri,  5 Mar 2021 09:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7356EB33
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 09:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614937198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q6N/JHvwR3DDe0EEB+dV0FhguwPKEzi443GmKZ0bZ4c=;
 b=EgdvEfI/mfR1604gcY1vH3cIHaLnsp/gXNufyjUIEuL+Qzqv7Qx32uE7RjZe+i6acCCQmO
 rJqib7VWlzVQnD5E+3s9i390c5iNm4jSstWXmG1six4si3rz62dWGcNRLnYjRr/SZmuVm+
 yHcpAYzY6MzGcyt3YOwKd8i/ltpfzAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-dgJAmS8ZNp2A4lgOGFa89w-1; Fri, 05 Mar 2021 04:39:56 -0500
X-MC-Unique: dgJAmS8ZNp2A4lgOGFa89w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26F4B108BD06;
 Fri,  5 Mar 2021 09:39:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-10.ams2.redhat.com
 [10.36.114.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54E051002382;
 Fri,  5 Mar 2021 09:39:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5BEA018000AE; Fri,  5 Mar 2021 09:22:41 +0100 (CET)
Date: Fri, 5 Mar 2021 09:22:41 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] qxl: Fix uninitialised struct field head.surface_id
Message-ID: <20210305082241.dt53hczrvds3qoz2@sirius.home.kraxel.org>
References: <20210304094928.2280722-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304094928.2280722-1-colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 04, 2021 at 09:49:28AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The surface_id struct field in head is not being initialized and
> static analysis warns that this is being passed through to
> dev->monitors_config->heads[i] on an assignment. Clear up this
> warning by initializing it to zero.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: a6d3c4d79822 ("qxl: hook monitors_config updates into crtc, not encoder.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Pushed to drm-misc-fixes.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
