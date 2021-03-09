Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A7C332753
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 14:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8FD6E4AA;
	Tue,  9 Mar 2021 13:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172F06E4AA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 13:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615297118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YwnskBRnq7W3vKZTpjKb6moUdQcFbZ8CYP71h7crH9c=;
 b=DOkXU10sqfyID92ZHrTTGIBhWUBiRgTNgxkwYIvC2kolMvcFVOqEyfpthd3TZYf2JB19Ro
 7N5bqpDdQNXvrMRTIHOekf5vzmIY5YOXo1BPNSCHEGgDqBS46OrHXRIynFuHL9EtgVvzqb
 52WKCW0JqRzIQQXJMJN/XLca+HKXF+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-nxdpG69lMomTq0JR65umgg-1; Tue, 09 Mar 2021 08:38:37 -0500
X-MC-Unique: nxdpG69lMomTq0JR65umgg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41D85760D2;
 Tue,  9 Mar 2021 13:38:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-41.ams2.redhat.com
 [10.36.113.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C38215C233;
 Tue,  9 Mar 2021 13:38:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0854C18000A2; Tue,  9 Mar 2021 14:38:34 +0100 (CET)
Date: Tue, 9 Mar 2021 14:38:34 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: xndcn <xndchn@gmail.com>
Subject: Re: [PATCH] drm/virtio: fix possible leak/unlock
 virtio_gpu_object_array
Message-ID: <20210309133834.myyzryugjcvdw3jv@sirius.home.kraxel.org>
References: <20210305151819.14330-1-xndchn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210305151819.14330-1-xndchn@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 05, 2021 at 11:18:19PM +0800, xndcn wrote:
> virtio_gpu_object array is not freed or unlocked in some
> failed cases.

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
