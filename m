Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF9C1B1FF9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 09:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979976E8DF;
	Tue, 21 Apr 2020 07:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18976E8DF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 07:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587454681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FSdpriCLurUHN3muAMSyOm9gjrjIPr8oUWWdKEfXfKU=;
 b=ZqvOi8H0SdCdbn5JZXIDGUrtcBSeWkFkmSSw3G0t20q7nmh+NbFvMzCg7CfVCKFcPYbCWZ
 nTu5fTx/MMInJtqyjPWvzWGrUaPifTGaVBzQrx8010bVh0TKy9EqtlwMMGP/xR2F6ZYRX1
 Gc8qGNf0E7wTfpwM1jAWevPmv6OlIlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-8iuJGEHRPyO5vG9VDFc6TQ-1; Tue, 21 Apr 2020 03:37:57 -0400
X-MC-Unique: 8iuJGEHRPyO5vG9VDFc6TQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DB7A8017F3;
 Tue, 21 Apr 2020 07:37:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E805228980;
 Tue, 21 Apr 2020 07:37:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BEC4616E16; Tue, 21 Apr 2020 09:37:51 +0200 (CEST)
Date: Tue, 21 Apr 2020 09:37:51 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 37/59] drm/cirrus: Move to drm/tiny
Message-ID: <20200421073751.q6vxzt6pqwieihpw@sirius.home.kraxel.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-38-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20200415074034.175360-38-daniel.vetter@ffwll.ch>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 09:40:12AM +0200, Daniel Vetter wrote:
> Because it is.

Indeed.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
