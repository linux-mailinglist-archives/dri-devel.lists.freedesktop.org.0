Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA94177130
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAB56E9EF;
	Tue,  3 Mar 2020 08:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6DD6E4A1
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 02:42:33 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id q18so1950348qki.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 18:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PxaU6jH+BrctxPkuy+TtnDFu4GnDn0I+fDbnzM1efjY=;
 b=lPebr/apS3a3XvJ4XcWg2p+1jVRErhkCzaWWg6wU7yc5QNOeEvIf5BudVhVxW66Euf
 /6ylI3gzJxuJK7fsCbK7mC/7V5Yx8ND0/jBwvSFydsUmqZf6y1sr7BGOQvcFetjCcXwO
 arVONmL2HlRo7X9WIG9l6bIYjr03Nc0Y4hlBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PxaU6jH+BrctxPkuy+TtnDFu4GnDn0I+fDbnzM1efjY=;
 b=X81GUWOlU1o7C7YInGv5cTyT/ubNcuJ79UlxWXpM7tfSvYfn2h3psEE3JT0cVuFwv4
 bqSq69oKwl2CONR9yc/+neQZHGEyvz+ls+j9ZNwD8xnmalOZqNYX8vXii72VxN4r+tw4
 7c15gkt7aJsJ7R3OQBwepxdsBopf4aV910rGAuowz1f//NfQxVKlZrTG1o7PF8K2yHMv
 PrNsMD7HtSMj8+Fmk0MTCFd4M0qFOsiIzZOblwufu10Mi0ViP8CZio+MQsB+AOnZEHF+
 LrUxepx8r4NjRSOAr1zwMqBf0ThZe4awnDgupv51pWBm4pT5FLItONetI7AfcAb0VnXL
 NOcg==
X-Gm-Message-State: ANhLgQ3iuCzCJnyvdX6dxpxl9a87KFmW6xx5xNfNYgzPBeVyCgTwiUxL
 7JJXuBWWdPcbKRH3F8mbU4/S9xNA7DNj1kFmP7ZWug==
X-Google-Smtp-Source: ADFU+vv4vCMIfBV1h9ntADBFoWjuRnbldiM2bxqn1DU2ahDSFshoqIRAbcIuxA4EMjtDxDlwrF99sqmXWP5yAgEJ6LA=
X-Received: by 2002:a37:9c01:: with SMTP id f1mr2223210qke.194.1583203352379; 
 Mon, 02 Mar 2020 18:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20200302121524.7543-1-stevensd@chromium.org>
 <20200302121524.7543-5-stevensd@chromium.org>
 <CAAfnVBk46vsP77hx3kUHqVCPG8Eakh7Kgi0kEHZtrHD-0bHzqQ@mail.gmail.com>
In-Reply-To: <CAAfnVBk46vsP77hx3kUHqVCPG8Eakh7Kgi0kEHZtrHD-0bHzqQ@mail.gmail.com>
From: David Stevens <stevensd@chromium.org>
Date: Tue, 3 Mar 2020 11:42:22 +0900
Message-ID: <CAD=HUj5-0CE-tm4meQ_Y7KB4Df41v=kBH2GTStYJptTOSp1yVw@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH v2 4/4] drm/virtio: Support virtgpu exported
 resources
To: Gurchetan Singh <gurchetansingh@chromium.org>
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 linaro-mm-sig@lists.linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> cmd_p->hdr.ctx_id =
>
> Before this completion of this hypercall, this resource can be
> considered context local, while afterward it can be considered
> "exported".

Maybe I'm misunderstanding render contexts, but exporting a resource
doesn't seem related to render contexts. The other resource management
operations (e.g. creation, attaching a backing) don't take render
contexts, and exporting a resource seems like the same sort of
operation. It's not clear to me why exporting a resource would affect
what render contexts a resource has been attached to, nor why the
render contexts a resource has been attached to would affect exporting
the resource. Also, from an implementation perspective, I don't see
any struct virtio_gpu_fpriv to get the ctx_id from.

-David
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
