Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7190C27C150
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 11:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB6D6E20B;
	Tue, 29 Sep 2020 09:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B061C6E20B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:32:58 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601371977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ilqk1ogYiU8HI+b7VAbPOKBKXmc4G5mMcAJSb80z6mM=;
 b=KVB2I2o4uavGbhSsMdMs8On4oWfJfbwD2+St9SzPOPsBVC3rFZwvf5egcgGZpnt4pt/lAT
 PGZiQbWIVFFgMWNc/Pf1WSvRQuJo5U6Eks7HUADeW3uSQ7uCnw+FkvVW3BM+rb/XRcAYw/
 9Pxxr4QkvPG/0zyQPYv6URvl62Rpfnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-pjF4s02dPOqOjyK-hTPpRg-1; Tue, 29 Sep 2020 05:32:54 -0400
X-MC-Unique: pjF4s02dPOqOjyK-hTPpRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94AE3106B82A;
 Tue, 29 Sep 2020 09:32:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D3EA3782;
 Tue, 29 Sep 2020 09:32:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 740AB1750A; Tue, 29 Sep 2020 11:32:52 +0200 (CEST)
Date: Tue, 29 Sep 2020 11:32:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH v4 01/19] drm/virtio: blob prep: refactor getting pages
 and attaching backing
Message-ID: <20200929093252.kpdrfv77knouaj7p@sirius.home.kraxel.org>
References: <20200924003214.662-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200924003214.662-1-gurchetansingh@chromium.org>
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

On Wed, Sep 23, 2020 at 05:31:56PM -0700, Gurchetan Singh wrote:
> Useful for upcoming blob resources.

Pushed to drm-misc-next (whole series).

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
