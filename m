Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5A940BFAA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 08:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2119E6E8D1;
	Wed, 15 Sep 2021 06:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA5B6E8D1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 06:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631687631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=syP9u21I0X13+NfaoXP/B0PHgpOt46v9RYaImlgDpiM=;
 b=R8p7bf0iHXJr71ADyl6bnAqn5qVte9RLOxAHEZSvx2yFNp29qKdjE4d+cJkHf2YS0FJNnZ
 NB/4CAjL7kQVKKdVBxGti3jkbJ/TEFWATBptihsUC3xZzFqZc14akxo6Xmv0l8timUO6xX
 Bo9FwYYG/fjYMr9w0WLRFoASub4CsJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-A7VfICycPX-ZylX37M_ICg-1; Wed, 15 Sep 2021 02:33:48 -0400
X-MC-Unique: A7VfICycPX-ZylX37M_ICg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D18771B18BC6;
 Wed, 15 Sep 2021 06:33:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8843E10016F5;
 Wed, 15 Sep 2021 06:33:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0F6A518003BF; Wed, 15 Sep 2021 08:33:45 +0200 (CEST)
Date: Wed, 15 Sep 2021 08:33:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: bibo mao <maobibo@loongson.cn>
Cc: Dave Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/qxl: User page size macro for qxl release bo
Message-ID: <20210915063345.yvzulffu6ekycz6p@sirius.home.kraxel.org>
References: <20210914062352.6102-1-maobibo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914062352.6102-1-maobibo@loongson.cn>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 14, 2021 at 02:23:51AM -0400, bibo mao wrote:
> Some architectures have different default page size, this patch
> replaces hardcoded 4096 with PAGE_SIZE macro, since cmd bo size
> is page aligned.
> 
> Signed-off-by: bibo mao <maobibo@loongson.cn>

Pushed to drm-misc-next.

thanks,
  Gerd

