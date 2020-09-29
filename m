Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C227C90D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 14:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7392789F03;
	Tue, 29 Sep 2020 12:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B4889F03
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 12:07:36 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601381255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMj7Jd/Bw1Mzv+CaECoMHMBv+5jBq+qBd6D1F2hSvOc=;
 b=NEC3FCPJrOTt6UTI/T5uiS/KPq7T/PSc6brqq+NJNScwpl5GOW4JOYb7R72wyz/aok081h
 rejEsA2eFiIujVQTqC9PXwLqJrxZabP4OL7I9sP71hrHaNFc/LzX6lVyUgv01KecGreBrX
 vDBWSUdhYmsfFZJpivqH+CDnBrQVUts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-iFUZrCEtNqOH9RjF9Y8azA-1; Tue, 29 Sep 2020 08:07:32 -0400
X-MC-Unique: iFUZrCEtNqOH9RjF9Y8azA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F0D18030B3;
 Tue, 29 Sep 2020 12:07:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37E2D38A;
 Tue, 29 Sep 2020 12:07:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1C47C9D77; Tue, 29 Sep 2020 14:07:30 +0200 (CEST)
Date: Tue, 29 Sep 2020 14:07:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/qxl: fix usage of ttm_bo_init
Message-ID: <20200929120730.b5ocs244eelbdc7n@sirius.home.kraxel.org>
References: <20200929112306.80952-1-christian.koenig@amd.com>
MIME-Version: 1.0
In-Reply-To: <20200929112306.80952-1-christian.koenig@amd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 01:23:06PM +0200, Christian K=C3=B6nig wrote:
> We need to use ttm_bo_init_reserved here to make sure
> that the BO is pinned before it becomes visible on the LRU.
> =

> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>#
Tested-by: Gerd Hoffmann <kraxel@redhat.com>#

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
