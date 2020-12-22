Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DE22E0CAA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 16:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F2F6E881;
	Tue, 22 Dec 2020 15:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0A36E881
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608650808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xKm7A6j4fkAKwBOIGvLynqx87WA1CMkuHLTYGgGj5mM=;
 b=PjjGp74fSUolvpKpMPWtTPtPFSOkpg9KbwT3Rvp31DlVN7yd0rbCpcedRPH5yT0sN44v5q
 30MU9cTsoOFsBfwBFzo/KaqmqyIka67XZOGgHhX0Mui0w48Ac+AmzBKskai6OpTk5L0XuS
 5WeWrlHdizzTKgczSynXAbLJ4u5Cul8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-m3Il9TMqMkGklX74Nhkphg-1; Tue, 22 Dec 2020 10:26:46 -0500
X-MC-Unique: m3Il9TMqMkGklX74Nhkphg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05A0759;
 Tue, 22 Dec 2020 15:26:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8224A10016F4;
 Tue, 22 Dec 2020 15:26:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6691811AB8; Tue, 22 Dec 2020 16:26:43 +0100 (CET)
Date: Tue, 22 Dec 2020 16:26:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/qxl: use flexible-array member instead of
 zero-length array
Message-ID: <20201222152643.xhki6pcasdtsvxta@sirius.home.kraxel.org>
References: <1607650349-28513-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
In-Reply-To: <1607650349-28513-1-git-send-email-tiantao6@hisilicon.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: airlied@linux.ie, airlied@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 11, 2020 at 09:32:29AM +0800, Tian Tao wrote:
> Use flexible-array member introduced in C99 instead of zero-length
> array. Most of zero-length array was already taken care in previous
> patch [1]. Now modified few more cases which were not handled earlier.
> 
> [1]. https://patchwork.kernel.org/patch/11394197/
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
