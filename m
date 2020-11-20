Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EC42BA867
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 12:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE00589A1E;
	Fri, 20 Nov 2020 11:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2FF89A1E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 11:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605870573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5o4CuMX7zds8f9NkTIgSLfLXtIb+1K7o+NpuPPm7ico=;
 b=Nz85+tbvoSon5rajs03D9dJMRwkyPiiMWbkyOqtbBebO+VhBdl8bhntmh2GaPdSD6c5Uei
 vMPWqGjq9fCR6fDuA+cL7aJPu1688COuVfG0p20Q4DS4/pUIsGB4z2of2b6W9+rlodGsoj
 hL8Ko4uAn3XLHxwq1cVZIOnjK2Ur4JA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-qx_WpxcMOAy-fz3UmJ6RAA-1; Fri, 20 Nov 2020 06:09:31 -0500
X-MC-Unique: qx_WpxcMOAy-fz3UmJ6RAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B3C21005D59;
 Fri, 20 Nov 2020 11:09:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 234EC5D6AD;
 Fri, 20 Nov 2020 11:09:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EFBC317535; Fri, 20 Nov 2020 12:09:28 +0100 (CET)
Date: Fri, 20 Nov 2020 12:09:28 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 1/5] drm/virtio: suffix create blob call with _ioctl like
 any ioctl
Message-ID: <20201120110928.2vm76cs5shw26flo@sirius.home.kraxel.org>
References: <20201119010809.528-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20201119010809.528-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
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

On Wed, Nov 18, 2020 at 05:08:05PM -0800, Gurchetan Singh wrote:
> From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
> 
> For coherency, all ioctls are suffixed
> 
> Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>

All pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
