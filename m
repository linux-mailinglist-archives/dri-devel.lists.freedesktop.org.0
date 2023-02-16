Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351A3699593
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 14:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8B810E2C7;
	Thu, 16 Feb 2023 13:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1C810E2C7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 13:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676553602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGZTYTj8LAqQ8Ogunyd8/LybmKfUNIvW5JbI04jGs5k=;
 b=EVbSW0dfdFwjg/tKZYeh3uaYxrZF5AH1Ls31EynZ5OpcVXF/TWhknh8yHjeDHX7/C3cID7
 VkxXMzMCvCkX8kTEN507uFRpKbRNsv/Pt9p8EYfny+pBpfc0GlDfw4RZ3n4CXjkm6pt/kl
 6H9hS5ZA7mbip1jyFar4ZyLyvul8y5I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-5DXlme1dN4OCJja2cCbJQg-1; Thu, 16 Feb 2023 08:19:58 -0500
X-MC-Unique: 5DXlme1dN4OCJja2cCbJQg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 544BB18E5346;
 Thu, 16 Feb 2023 13:19:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21DC140CF8E4;
 Thu, 16 Feb 2023 13:19:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BFB111800097; Thu, 16 Feb 2023 14:19:56 +0100 (CET)
Date: Thu, 16 Feb 2023 14:19:56 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
Message-ID: <20230216131956.luksj64ewwakzsbl@sirius.home.kraxel.org>
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
 <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
 <306e110d-4d1f-cb9c-6f9b-c8a5ddd48a61@suse.de>
 <Y+4nIxRhF7KF2Qo0@intel.com>
MIME-Version: 1.0
In-Reply-To: <Y+4nIxRhF7KF2Qo0@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 02:52:51PM +0200, Ville Syrjälä wrote:
> On Thu, Feb 16, 2023 at 01:03:02PM +0100, Thomas Zimmermann wrote:
> > Hi,
> > 
> > thanks for taking a look at the patches.
> > 
> > Am 16.02.23 um 12:33 schrieb Gerd Hoffmann:
> > > On Wed, Feb 15, 2023 at 05:15:17PM +0100, Thomas Zimmermann wrote:
> > >> Set the VGA bit for unblanking with macro constants instead of magic
> > >> values. No functional changes.
> > > 
> > > blank/unblank should work simliar to bochs (see commit 250e743915d4),
> > > that is maybe a nice thing to add of you modernize the driver anyway.
> > Yeah, it's the VGA PAS field. [1] But is it really called blanking? PAS 
> > controls palette access, but blanking is sounds more like DPMS.
> 
> Why aren't people just using the normal way of flipping the
> screen off bit in sequencer register 01?

qemu vga emulation doesn't check that bit ...

take care,
  Gerd

