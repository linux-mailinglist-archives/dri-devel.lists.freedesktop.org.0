Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883F329D356
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 22:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0616E5CF;
	Wed, 28 Oct 2020 21:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868A06E5C0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 21:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603921381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=grsrDmScQg/7CchDudKF7+xGExagB0pI7A6n0ZS4Tvs=;
 b=SUyGE1X3PyUn96+cLhV1kJm8OsK50lO8iLoWktCzU3ypz4UDba9Klri5ltJ5uycOD/+zC9
 aiIFoLJZ+Pn1qc0RT9J87J+yy0QdW8kuHuCJk+ewYldbWrJcjFz7PArGpY2/ZMjo/C51i8
 UhLTVBaueRetecjP2+YK1CU9b2a9qK8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-AgifWteVNwyE0ZvBF1hHAQ-1; Wed, 28 Oct 2020 17:42:59 -0400
X-MC-Unique: AgifWteVNwyE0ZvBF1hHAQ-1
Received: by mail-qk1-f198.google.com with SMTP id s5so551347qkj.21
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 14:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=grsrDmScQg/7CchDudKF7+xGExagB0pI7A6n0ZS4Tvs=;
 b=HEHSGkdW+QST47gYTpkZqxeRVKQshhCao9TKIEuvDPxb2LEWJgCZJepTNqaYmvSg0W
 LbMokiAi3P4yIWbXYBAstMSWMZobpRAV00df3gsxCYagMJZ/fCfr3Vw3ehfKaF5mfJY/
 7H+1evJzJzhMCbxKjzvuFosNprvhJGbeJxs94vU41XLcq28INiDfgqxJQ46eICNBKVxE
 qvXR8WtsxGRPQGUj/uoT6kKFWUvLT94TW4wBdKhgJMamXtStv79+s+zkmDGjQtjRzNGJ
 ZqWqFM6b7jsmFxN2TjzFJWakvmK6Vbdv+2cMFexarGva0p1LAhXFjCwleaF3/u4/yIB7
 Sn/A==
X-Gm-Message-State: AOAM530meefEKEPmya2irYFFExZUX50+mXbNdIPsAtq7rjOhZ49tvTqm
 X1PNlclbVDYVpLiYHrNoUNyZYtBSbPk/vLH4581sXdPVMTpl6tg/zaKm0cSM5gzQQDm5q1InBGk
 +Yos2ExpmyUl+BpERtRObdh2VRuaGvPQMfe5/7uIerQDC
X-Received: by 2002:a37:8542:: with SMTP id h63mr941211qkd.102.1603921378907; 
 Wed, 28 Oct 2020 14:42:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbl4uDNWjzMTK3+styptRLBCtkBZ2fw1p+2J0J4m60L0jC7kvcirPiI4FpA37Rxh2PKX+RSbbSACEWMb0WJsA=
X-Received: by 2002:a37:8542:: with SMTP id h63mr941197qkd.102.1603921378676; 
 Wed, 28 Oct 2020 14:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <202010092326.20482.linux@zary.sk>
 <CAKb7UvggVn2c=jUNSfjf6r529n89xfNgVBpn3jnXznVh8Gs4+w@mail.gmail.com>
 <CACO55tuAxbcXbC9zrT5rs34s=5uBugkbcikORU5868ka9bHdkw@mail.gmail.com>
 <202010282115.32811.linux@zary.sk>
In-Reply-To: <202010282115.32811.linux@zary.sk>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 28 Oct 2020 22:42:47 +0100
Message-ID: <CACO55tvqB0tEbHegRCn6WNdv-wzZz1+be=u5O0q9SrSj1x1tGw@mail.gmail.com>
Subject: Re: [Nouveau] nouveau broken on Riva TNT2 in 5.9.0-rc8: GPU not
 supported on big-endian
To: Ondrej Zary <linux@zary.sk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I sent a patch to the mailing list and wanted to have some review on
that from at least Ben, but no idea if Ben already picked it and if
it's good enough for sending it to stable yet.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
