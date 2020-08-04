Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D55CE23B915
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 12:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29AD89FE3;
	Tue,  4 Aug 2020 10:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901D389FE8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596538209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZKxdw8FqP2KGfHU7RacrlWpvJnek6KMcjtWxb7Ji1nU=;
 b=IpnG3QW5RubQnZmYuswUK2BT0gC32KGvEFzAR8FuP/WJGI/38LY263xfwtp8oLsd7g4d4P
 38ozhnIf1pP3IHh4R0wvg1h6lD/PORuab6DC+A6SgzrriIFsEY/LDeHTgfX69HLPCDm/kQ
 jECyljXqjicjNdQp69BzttevI8n6Leg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-yiyTiKKfMuatSud3sZuVug-1; Tue, 04 Aug 2020 06:50:06 -0400
X-MC-Unique: yiyTiKKfMuatSud3sZuVug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF43A80183C;
 Tue,  4 Aug 2020 10:50:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A41475DA79;
 Tue,  4 Aug 2020 10:50:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D4B2711AB5; Tue,  4 Aug 2020 12:50:02 +0200 (CEST)
Date: Tue, 4 Aug 2020 12:50:02 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 32/59] drm/qxl/ttm: use new takedown path
Message-ID: <20200804105002.qkqugea5eezdyepd@sirius.home.kraxel.org>
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-33-airlied@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200804025632.3868079-33-airlied@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Tue, Aug 04, 2020 at 12:56:05PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
