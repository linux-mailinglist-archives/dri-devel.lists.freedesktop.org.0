Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FAA169FBE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 09:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C06C6E08E;
	Mon, 24 Feb 2020 08:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EFB6E08E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 08:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582531782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IclJzfy/Fft9yfcWRbU+yNeoiosy8uqWsrOnCFhBz8Q=;
 b=RLzHg80SurpKxEifHId/8HW+V4mLRSLIgte9EuAQFyJKMnDU2M/bMZHF56qIyGUTnneElP
 gd4/omXRukxpWKdRmvEn+IdqYkh6nWLBRnaJuWotUr+JtzCmHtNNsAWYLozOhF75h3TDqN
 BcLBW6Pvaore8Pubd+0JHy5HUjZiUHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-nvmtRrUwPw-AWWoCUOEuoA-1; Mon, 24 Feb 2020 03:09:38 -0500
X-MC-Unique: nvmtRrUwPw-AWWoCUOEuoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68669A0CBF;
 Mon, 24 Feb 2020 08:09:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-87.ams2.redhat.com
 [10.36.116.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B7F127185;
 Mon, 24 Feb 2020 08:09:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BB8581747F; Mon, 24 Feb 2020 09:09:34 +0100 (CET)
Date: Mon, 24 Feb 2020 09:09:34 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/4] drm/qxl: Use simple encoder
Message-ID: <20200224080934.we4tzcwes4pyd7xj@sirius.home.kraxel.org>
References: <20200218084815.2137-1-tzimmermann@suse.de>
 <20200218084815.2137-5-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200218084815.2137-5-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 spice-devel@lists.freedesktop.org, sam@ravnborg.org,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 09:48:15AM +0100, Thomas Zimmermann wrote:
> The qxl driver uses an empty implementation for its encoder. Replace
> the code with the generic simple encoder.
> 
> v2:
> 	* rebase onto new simple-encoder interface
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
