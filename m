Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB4A32D3B8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 13:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131B06EA1E;
	Thu,  4 Mar 2021 12:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAAC6EA1E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614862540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s0kXbQg2wgR1vQBkU7ppKhdyoHWgrq2jtnZhL0jn5Os=;
 b=e4/waFErQS0GrLudOEOeL3t1n9nn64TatgjTnK1fyE1Kktfxs6vgVMAGPGH/ruYee8DsUb
 m3ZPqyKaVv3xFEc64FMQBfeAgiv/aie3ThjyF7n6BWOz2WAWo17F5EsNYwrNiwwD/MRc9e
 jGItJt93dirj25vU6fM9P8ZXLl6M6rk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-jXDSx_5WNwyJ9muHwiblSQ-1; Thu, 04 Mar 2021 07:55:35 -0500
X-MC-Unique: jXDSx_5WNwyJ9muHwiblSQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 116641009E29;
 Thu,  4 Mar 2021 12:55:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53CAD16922;
 Thu,  4 Mar 2021 12:55:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 89DCC18000A7; Thu,  4 Mar 2021 13:55:31 +0100 (CET)
Date: Thu, 4 Mar 2021 13:55:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm/ttm: ttm_bo_release called without lock
Message-ID: <20210304125531.r4bf36gt32rxtm3k@sirius.home.kraxel.org>
References: <YD+eYcMMcdlXB8PY@alley> <YD+mGFJ5KYWwrJHH@alley>
 <a53377ae-9b33-9030-f9a6-0b620a9cc71f@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a53377ae-9b33-9030-f9a6-0b620a9cc71f@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Dave Airlie <airlied@redhat.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 04, 2021 at 08:42:55AM +0100, Thomas Zimmermann wrote:
> (cc'ing Gerd)
> 
> This might be related to the recent clean-up patches for the BO handling in
> qxl.

Yes, it is.  Fixed in drm-misc-next, cherry-picked into drm-misc-fixes,
hopefully lands in -rc2.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
