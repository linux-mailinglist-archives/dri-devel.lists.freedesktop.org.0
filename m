Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7153B19A3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 14:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6A66E8C4;
	Wed, 23 Jun 2021 12:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A756E8C4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 12:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624450461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1cb8aVB131APm/30pkOEU1khUVWJFw3ZWTrX3dM2Apc=;
 b=i0OM25fn18VgKmbRcLWadzNcdeEzrNbwV+Zycr8QBhnfJyKjDFR4AUx1pNpMWyOZO6/awM
 DUUELo3Tup6dt+iwuDeFZ6iGw3ZuyXDD8J/ZX1sc1nhEThHsuVUn8iRlrU5zpDCnaNYX8z
 uDQBOHNLZJyBJmLRKa8o6aZJalIaXcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-hSn2xgn6NH-c-SKmbRLSzQ-1; Wed, 23 Jun 2021 08:14:19 -0400
X-MC-Unique: hSn2xgn6NH-c-SKmbRLSzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0992802CB5;
 Wed, 23 Jun 2021 12:14:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9BD75D705;
 Wed, 23 Jun 2021 12:14:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 42F85180060E; Wed, 23 Jun 2021 14:14:17 +0200 (CEST)
Date: Wed, 23 Jun 2021 14:14:17 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [PATCH] udmabuf: configurable list_limit and size_limit_mb
Message-ID: <20210623121417.jya6mhmkigaqc2h4@sirius.home.kraxel.org>
References: <20210611212107.9876-1-dongwon.kim@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210611212107.9876-1-dongwon.kim@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 02:21:07PM -0700, Dongwon Kim wrote:
> Default list_limit and size_limit_mb are not big enough to cover all
> possible use cases. For example, list_limit could be well over its default,
> 1024 if only one or several pages are chained in all individual list entries
> when creating dmabuf backed by >4MB buffer. list_limit and size_limit_mb are
> now defined as module parameters so that those can be optionally configured
> by root with proper values to remove these constraints.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>

Pushed to drm-misc-next.

thanks,
  Gerd

