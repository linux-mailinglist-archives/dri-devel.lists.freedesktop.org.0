Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB7A699469
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 13:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B908710E173;
	Thu, 16 Feb 2023 12:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6906110E173
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676550840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qnEebGiYieEAIpFBvmp4/is8Uz9olTVE3UjL/CK2+0c=;
 b=CDu5OChnL2ASD69fR8SLWfKt8U4+yv2SnqJ9qEQIgkjREXkqGiQY06cRLqZyJITFUOtxTD
 Zl8EUhxwNdKSZc9y729rUpBNSMxxM9y/srRTdhqOUeCLK8AvxUo0AiCDhWktGkwBGX2vcl
 RzQ/UxfsYh9rS/6MQxGWXUbvpQ6mhCg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-DwHJZwFJOP6nRvS9orhqng-1; Thu, 16 Feb 2023 07:33:57 -0500
X-MC-Unique: DwHJZwFJOP6nRvS9orhqng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D348D1C0A58E;
 Thu, 16 Feb 2023 12:33:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 996B0C15BA0;
 Thu, 16 Feb 2023 12:33:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 413FF1800097; Thu, 16 Feb 2023 13:33:55 +0100 (CET)
Date: Thu, 16 Feb 2023 13:33:55 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
Message-ID: <20230216123355.rhleh7ba2h6mzgvm@sirius.home.kraxel.org>
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
 <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
 <306e110d-4d1f-cb9c-6f9b-c8a5ddd48a61@suse.de>
MIME-Version: 1.0
In-Reply-To: <306e110d-4d1f-cb9c-6f9b-c8a5ddd48a61@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

On Thu, Feb 16, 2023 at 01:03:02PM +0100, Thomas Zimmermann wrote:
> Hi,
> 
> thanks for taking a look at the patches.
> 
> Am 16.02.23 um 12:33 schrieb Gerd Hoffmann:
> > On Wed, Feb 15, 2023 at 05:15:17PM +0100, Thomas Zimmermann wrote:
> > > Set the VGA bit for unblanking with macro constants instead of magic
> > > values. No functional changes.
> > 
> > blank/unblank should work simliar to bochs (see commit 250e743915d4),
> > that is maybe a nice thing to add of you modernize the driver anyway.
> Yeah, it's the VGA PAS field. [1] But is it really called blanking? PAS
> controls palette access, but blanking is sounds more like DPMS.

Yes, strictly speaking it is not the same thing. DPMS blank will send
the monitor into suspend mode which this does not.  On virtual hardware
there isn't much of a difference though ;)

take care,
  Gerd

