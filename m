Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2029069932A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 12:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B5810ED43;
	Thu, 16 Feb 2023 11:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1728010ED42
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676547218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A7yjGOfKpa8Rfl1Tpoz4Thjr0olZ8Vlajxlw535D5io=;
 b=ShumUp9v8vlGFQykinihDKIR3UF97uZ13ef+45q+Dk5+VH8R4pAA9GGxoEEMr3HIM0f+Mw
 XEAkYjSF1x8nHZpcwqEFdnQca4ZBo2LtaD/WEVkHZphiy7+DsVOB5X2lHqZehxkXoNsaq3
 4Fdtntud78BoU6V95DJS+uaotuHdzDE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-ZLAtFQOVM1eFO0tSEyYRXQ-1; Thu, 16 Feb 2023 06:33:32 -0500
X-MC-Unique: ZLAtFQOVM1eFO0tSEyYRXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47569811E6E;
 Thu, 16 Feb 2023 11:33:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF51A175AD;
 Thu, 16 Feb 2023 11:33:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6CC5A1800097; Thu, 16 Feb 2023 12:33:30 +0100 (CET)
Date: Thu, 16 Feb 2023 12:33:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
Message-ID: <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20230215161517.5113-18-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, airlied@redhat.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 15, 2023 at 05:15:17PM +0100, Thomas Zimmermann wrote:
> Set the VGA bit for unblanking with macro constants instead of magic
> values. No functional changes.

blank/unblank should work simliar to bochs (see commit 250e743915d4),
that is maybe a nice thing to add of you modernize the driver anyway.

take care,
  Gerd

