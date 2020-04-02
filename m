Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DE219BA05
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 03:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9356E9C7;
	Thu,  2 Apr 2020 01:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B066E9C7
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 01:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585791971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGKV+mj5X3vQFrVkT1HrrdE3Djy0V822MxL90EGqQw8=;
 b=SLLeBUVIQzJFmTUyb0Bxw5ufZjZk+nwko/tEgpGPDggVZVUhQgjmmmIEXdMhY5QMyxgCb4
 dXTSWANOBBDDk6mQo1UxGzvgqHBrBo+0mFt4CqidXqE92VjcQSGmH0i7rTjWkipYuX9AWm
 Ifz1JrdVNPNdz+KluacF+yenNdxWUrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-bZQTtJhKNEOBPbHDx9O6Bw-1; Wed, 01 Apr 2020 21:46:06 -0400
X-MC-Unique: bZQTtJhKNEOBPbHDx9O6Bw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D18DE107ACC7;
 Thu,  2 Apr 2020 01:46:03 +0000 (UTC)
Received: from elisabeth (unknown [10.36.110.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 949749A240;
 Thu,  2 Apr 2020 01:45:56 +0000 (UTC)
Date: Thu, 2 Apr 2020 03:45:51 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: "John B. Wyatt IV" <jbwyatt4@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] staging: android: ion: Fix
 parenthesis alignment
Message-ID: <20200402034551.1775a192@elisabeth>
In-Reply-To: <20200402012515.429329-1-jbwyatt4@gmail.com>
References: <20200402012515.429329-1-jbwyatt4@gmail.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 outreachy-kernel@googlegroups.com,
 Arve =?UTF-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  1 Apr 2020 18:25:15 -0700
"John B. Wyatt IV" <jbwyatt4@gmail.com> wrote:

> Fix 2 parenthesis alignment issues.
> 
> Reported by checkpatch.
> 
> Signed-off-by: John B. Wyatt IV <jbwyatt4@gmail.com>

Reviewed-by: Stefano Brivio <sbrivio@redhat.com>

-- 
Stefano

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
