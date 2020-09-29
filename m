Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E27D727C14D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 11:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E546B6E34B;
	Tue, 29 Sep 2020 09:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4356E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:32:30 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601371949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LiEgRgilrtM/nzZfi6JlygGzcq6lLUMwcnD3ohkUPPc=;
 b=V0ul40K5vcOw4UxiG7CEjgVC5EMNXzfkqX2nkkkVeWg5BdnHsmzBMbDvUUlNT+cbQfIxVJ
 orRHJwgnYASv7APhPt/DKP4FC8l00M0ujGeWl//kDOd/ozYvlM3mL0vdkCNGRbzjpGYJ0Y
 Zv7VDFx9j9PdeUaErjHk+15OeqX46YQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-lHto500SOc2Jx9pUas_Pvg-1; Tue, 29 Sep 2020 05:32:27 -0400
X-MC-Unique: lHto500SOc2Jx9pUas_Pvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 019D9801AE3;
 Tue, 29 Sep 2020 09:32:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A253260BF1;
 Tue, 29 Sep 2020 09:32:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9D0481750A; Tue, 29 Sep 2020 11:32:24 +0200 (CEST)
Date: Tue, 29 Sep 2020 11:32:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] drm/qxl: simplify the return expression of
 qxl_plane_prepare_fb()
Message-ID: <20200929093224.2x4x72i5pwmfe5aa@sirius.home.kraxel.org>
References: <20200921131022.91649-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200921131022.91649-1-miaoqinglang@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 09:10:22PM +0800, Qinglang Miao wrote:
> Simplify the return expression.

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
