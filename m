Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46959247DE3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 07:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020D389D73;
	Tue, 18 Aug 2020 05:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBE789D73
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 05:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597728718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Noci4JN4Y072U2/9cvvICErzfzJhbNXxGZMILC+bAY=;
 b=RRagv0xuZtUm1jZ7uhcXckaLka/i0Z7et2sW2Q6EuDMlGxScHzGaRjP3qZmdaLxsOV1QIs
 zJ8opGqtLpvL1bZZsgqVeGbU/blBb2ib63XQVsz8ea7X0N2hfo+/HUt/tHLFzoJWhJXx58
 G1uoJgf5lMNj8N9uXm9/7OLFy1onwVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-FjLsA3E2NbqC72kR0e2Bow-1; Tue, 18 Aug 2020 01:31:54 -0400
X-MC-Unique: FjLsA3E2NbqC72kR0e2Bow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8A4310082E5;
 Tue, 18 Aug 2020 05:31:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 117267D901;
 Tue, 18 Aug 2020 05:31:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D96F617447; Tue, 18 Aug 2020 07:31:50 +0200 (CEST)
Date: Tue, 18 Aug 2020 07:31:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/qxl: Fix build errors
Message-ID: <20200818053150.pwkga4vzipk7pf6t@sirius.home.kraxel.org>
References: <20200817195846.14076-1-sean@poorly.run>
 <20200817200521.GA1551172@ravnborg.org>
 <CAMavQKL2=Gx+XCbMYc5p08jRNtH5ju=oadhxBxzgNf+gzo3fnA@mail.gmail.com>
 <CAMavQK+zsBHoMc_C=-=v-43u=tZ_pJ6XSGBhD6MLQN01pjbyEA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMavQK+zsBHoMc_C=-=v-43u=tZ_pJ6XSGBhD6MLQN01pjbyEA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Sean Paul <seanpaul@chromium.org>,
 Dave Airlie <airlied@redhat.com>, spice-devel@lists.freedesktop.org,
 Sidong Yang <realwakka@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> I guess things are never quite so easy :-). It looks like Daniel's
> patch is in drm-misc-fixes and Sidong's patch is in drm-misc-next. On
> their own they're fine, but once they are merged in drm-tip the build
> error shows up.

Ah, ok.  I've already wondered how that got past my build testing.
This explains it.

thanks for looking into it,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
