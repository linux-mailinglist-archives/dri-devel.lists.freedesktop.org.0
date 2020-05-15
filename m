Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBFA1D4AA4
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 12:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF1C6EC5F;
	Fri, 15 May 2020 10:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68496EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 10:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589537693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GmKJk7usBxRKypMyMS/5g4EEKz7cTHXC7ZIWfRLdcrM=;
 b=jLW0dn3XyifdJk5E5myeymXO1YRCFWXYOV/KjBTJ/GViem01BvBO9WDT90C+60z8x4J3A8
 6V4OqNRTmo/P8QwOLz5JAvBcKUsYEZQ5dQrPFbwHqDeTTe7PJb+VBqIizCVdMaV2R9ADGw
 IpmpFge3ocZMHICqHnD/fqF5JbzJuHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-f1KdkJTBM6qbsj1KLyYmUQ-1; Fri, 15 May 2020 06:14:50 -0400
X-MC-Unique: f1KdkJTBM6qbsj1KLyYmUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1821E1005512;
 Fri, 15 May 2020 10:14:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-145.ams2.redhat.com
 [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B507782A0A;
 Fri, 15 May 2020 10:14:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5B94616E16; Fri, 15 May 2020 12:14:45 +0200 (CEST)
Date: Fri, 15 May 2020 12:14:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 35/38] drm/virtio: remove _unlocked suffix in
 drm_object_put_unlocked
Message-ID: <20200515101445.ycjmvwmbdbjfvx7p@sirius.home.kraxel.org>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
 <20200515095118.2743122-36-emil.l.velikov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200515095118.2743122-36-emil.l.velikov@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 10:51:15AM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Spelling out _unlocked for each and every driver is a annoying.
> Especially if we consider how many drivers, do not know (or need to)
> about the horror stories involving struct_mutex.
> 
> Just drop the suffix. It makes the API cleaner.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
