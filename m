Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BA523B90E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 12:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609FA89EA9;
	Tue,  4 Aug 2020 10:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DE789EA9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 10:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596538132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wYfp2tk3o7Hg056Mnad+tggmnKYuUahwYdjggr1W+34=;
 b=O426AcA2lwvAnEV2/yUqH+wtF2CXc+UkgxqqpcdyZOeaieveqAPcBIeRT7wVNJjcUmPCxC
 zkyvLtj6Fm4JqX4pCOwGlfyKycIvrQyXReHbs7H1nsxxlxYzkzyg3lm/iy4582yiS8friU
 +GLHt3Y0KdXk0rx9UHdUKZlUl1dqvc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-6t2Gwjg_O2K0tFTO-eq0ng-1; Tue, 04 Aug 2020 06:48:50 -0400
X-MC-Unique: 6t2Gwjg_O2K0tFTO-eq0ng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C760CE927;
 Tue,  4 Aug 2020 10:48:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AC9188D57;
 Tue,  4 Aug 2020 10:48:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AC5F411AB5; Tue,  4 Aug 2020 12:48:48 +0200 (CEST)
Date: Tue, 4 Aug 2020 12:48:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 12/59] drm/vram-helper: call the ttm manager debug function
Message-ID: <20200804104848.om5kl3klfvlluf33@sirius.home.kraxel.org>
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-13-airlied@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200804025632.3868079-13-airlied@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 04, 2020 at 12:55:45PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This code was assuming there was a drm_mm here, don't do
> that call the correct API.
> 
> v2: use the new exported interface.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
