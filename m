Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B5F17707E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 08:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85336E9C7;
	Tue,  3 Mar 2020 07:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130696E9C8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 07:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583221922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EO0uZ+mfsK8tpv0SavJvPuhypm+Ebtm9zZCm2+stXeM=;
 b=PeIEptgc5hxDPj3vUtbs/WslCLQQtKtiWmnJi1PTBRIWdKtuvVmrXi4rZg7//l3uWtULi8
 /p556sxDxMQiC9ycEgt5ptjtnIaYdbHtozTHiK0Ok4yzAcQASfjeTrspy/i2HMKq9MV34V
 sOLpWEAiFkhDdNGTKGJMwy95/6j1Wkc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-tmQU_Y_6MNamQQkhdyQH9g-1; Tue, 03 Mar 2020 02:52:00 -0500
X-MC-Unique: tmQU_Y_6MNamQQkhdyQH9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB60619057A3;
 Tue,  3 Mar 2020 07:51:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A70875C1D8;
 Tue,  3 Mar 2020 07:51:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C0D0B17449; Tue,  3 Mar 2020 08:51:57 +0100 (CET)
Date: Tue, 3 Mar 2020 08:51:57 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 30/51] drm/cirrus: Fully embrace devm_
Message-ID: <20200303075157.q5fhywk6lvmjbekv@sirius.home.kraxel.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-31-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20200302222631.3861340-31-daniel.vetter@ffwll.ch>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:26:10PM +0100, Daniel Vetter wrote:
> With the drm_device lifetime fun cleaned up there's nothing in the way
> anymore to use devm_ for everything hw releated. Do it, and in the
> process, throw out the entire onion unwinding.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
