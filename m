Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E545B0188
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 12:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEF110E4EE;
	Wed,  7 Sep 2022 10:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2272910E4E2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662545835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afHMjG2HkRYvCDuYzjTQhxoQdwvvL29SNFSccxhwbQY=;
 b=Ykp8p4TgHBcGjWLPAk7RMaoto4nU9xRwmDqw+XD1wcIqAloDZwrx2Hnyh1pm6vdbCrJ1i+
 XBgQIrtT/a9C51zTa3UGw8UJ5yw2WTprc/NOxTIfQ7POfahvprHQWpf1ptHAmevWQ5FtRM
 HGRQP+v8E1U+LosG3PB3Yd3TlzRUAzc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-AZwPBN3lN5GhXRakgF0ASA-1; Wed, 07 Sep 2022 06:17:10 -0400
X-MC-Unique: AZwPBN3lN5GhXRakgF0ASA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5F2580418F;
 Wed,  7 Sep 2022 10:17:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CA001121314;
 Wed,  7 Sep 2022 10:17:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 017DF180039B; Wed,  7 Sep 2022 12:17:07 +0200 (CEST)
Date: Wed, 7 Sep 2022 12:17:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zongmin Zhou <min_halo@163.com>
Subject: Re: [PATCH] drm/qxl: fix the suspend/resume issue on qxl device
Message-ID: <20220907101707.ghkrtsba4eeje43p@sirius.home.kraxel.org>
References: <20220907094423.93581-1-min_halo@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220907094423.93581-1-min_halo@163.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 zhouzongmin@kylinos.cn, Ming Xie <xieming@kylinos.cn>,
 spice-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 05:44:23PM +0800, Zongmin Zhou wrote:
> 
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> Details:
> Currently, when trying to suspend and resume with qxl device，
> there are some error messages after resuming,
> eventually caused to black screen and can't be recovered.

[ analysis snipped ]

> Let's fix this by reset io and remove the qxl_ring_init_hdr calling.

Pushed to drm-misc-next

thanks,
  Gerd

