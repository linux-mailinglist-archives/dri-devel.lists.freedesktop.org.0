Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E39240BFB2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 08:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E806E8D4;
	Wed, 15 Sep 2021 06:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD346E8D4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 06:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631687925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2jrv4qpH+SsfqVOrOyTWjCAMipmK09EdyvQxDfD9z+o=;
 b=PVN7GqOITNaYTWkFZkDSvpJlXbhBshvrYLFwF4fSMHLYuqbUqycvBvfQcoFZ3YHQnL3K5B
 1SWKzHnwi3p/eHQ+w5DEBGJPct6qVZHWVizYhzu2iGON6GfPvCYgNhjVM/3Q7bVD2Xw9/7
 uFKPGIi6zvDPb4TP0/yA8A0jotSbbwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-7qemqFm_PtCHmUhwK6aNNQ-1; Wed, 15 Sep 2021 02:38:41 -0400
X-MC-Unique: 7qemqFm_PtCHmUhwK6aNNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A72684A5E0;
 Wed, 15 Sep 2021 06:38:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A210C5D9D3;
 Wed, 15 Sep 2021 06:38:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 290BE18003BF; Wed, 15 Sep 2021 08:38:35 +0200 (CEST)
Date: Wed, 15 Sep 2021 08:38:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: bibo mao <maobibo@loongson.cn>
Cc: Dave Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/qxl: Add qxl dma fence release function
Message-ID: <20210915063835.36bhpadzbzuj7shw@sirius.home.kraxel.org>
References: <20210914062352.6102-1-maobibo@loongson.cn>
 <20210914062352.6102-2-maobibo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914062352.6102-2-maobibo@loongson.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Tue, Sep 14, 2021 at 02:23:52AM -0400, bibo mao wrote:
> Add qxl dma fence release function, previously default dma fence
> release function is used, and fence pointer is used to free 
> the memory. With this patch, actual qxl release pointer is used
> to free memory, so that dma fence can put at any place of 
> struct qxl_release.

Why?  Is there a problem with struct dma_fence being the first
element of struct qxl_release?

take care,
  Gerd

