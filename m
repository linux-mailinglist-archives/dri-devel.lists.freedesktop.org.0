Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3C817DC9F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 10:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0400C89EF7;
	Mon,  9 Mar 2020 09:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F1689EF7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 09:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583747242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qN5wnfeC6m8ytGePDxXtT4m0mKrW6/70o+UCChYdA4I=;
 b=QFOG5Qpo/UZj595mfWfEq2Tf/wkLeqSQbRmkzmlyHAgOb5xRqQ+7WPneqVTJDx9m2VVODH
 jydiCX0praB6qnieRVGbdRRx8SdNXxP2Jjayi/TUQKbaY32Szlc4T9RuNhc3qU2OcK+HdI
 jHnNviIz5h2pSMVQrxy3O19vGKisoVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-wWXHTiNaP7yuhyNwENBVQQ-1; Mon, 09 Mar 2020 05:47:17 -0400
X-MC-Unique: wWXHTiNaP7yuhyNwENBVQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC0568017CC;
 Mon,  9 Mar 2020 09:47:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B144E8F341;
 Mon,  9 Mar 2020 09:47:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E09C29DB3; Mon,  9 Mar 2020 10:47:15 +0100 (CET)
Date: Mon, 9 Mar 2020 10:47:15 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH v3 1/2] drm/virtio: factor out the sg_table from
 virtio_gpu_object
Message-ID: <20200309094715.g42ud6uk7wtipg6r@sirius.home.kraxel.org>
References: <20200305013212.130640-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200305013212.130640-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On Wed, Mar 04, 2020 at 05:32:11PM -0800, Gurchetan Singh wrote:
> A resource will be a shmem based resource or a (planned)
> vram based resource, so it makes sense to factor out common fields
> (resource handle, dumb).
> 
> v2: move mapped field to shmem object

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
