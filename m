Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5BD198ECF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 10:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01733896C7;
	Tue, 31 Mar 2020 08:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4222896C7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 08:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585644465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCSl1DNWTL6VFlpXuhnEf8bUCsDmTyu0sbiP0iN4ink=;
 b=LEtc4nYc2B58U7wuB5tZZdVa1SCV5hRvmZ4Zysd+vlA4akmG72BkSk1H8D8h4me+6nGVsL
 afBOyPmqIdCy4r55fNBGHC+R5b3ilHJoflrhvx+pm8FfqtYZo/Uw3vhOMof3SGkKd4znE+
 5bRvQgjnck39r/qfGHHgoGvbKRiNBNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-RVAPSK7INOaRJ-9xHQjkFg-1; Tue, 31 Mar 2020 04:47:41 -0400
X-MC-Unique: RVAPSK7INOaRJ-9xHQjkFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7A298018A9;
 Tue, 31 Mar 2020 08:47:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C7B396B80;
 Tue, 31 Mar 2020 08:47:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4F6B717535; Tue, 31 Mar 2020 10:47:38 +0200 (CEST)
Date: Tue, 31 Mar 2020 10:47:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vram-helpers: Set plane fence for display update
Message-ID: <20200331084738.4xtxxfcckfq53ag5@sirius.home.kraxel.org>
References: <20200331081130.24600-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200331081130.24600-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +	 * TODO: Synchronize with other users of the buffer. Buffers
> +	 *       cannot be pinned to VRAM while they are in use by other
> +	 *       drivers for DMA. We should probably wait for each GEM
> +	 *       object's fence before attempting to pin the buffer.

The other option is p2p (Documentation/driver-api/pci/p2pdma.rst).

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
