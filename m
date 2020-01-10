Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE59138652
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8937E89E32;
	Sun, 12 Jan 2020 12:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADF96EA16
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 14:27:14 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id l9so1979458oii.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 06:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5TcuAQkmRiwoqdLSJS6JTYiOGLP/QjfJC3ke5FsTXG8=;
 b=QQUtNh5zpMO+es8jtL5Huhx44/oUYSq9UkPHgRekDBCIAX7bDk5S/8XnrlzK2uM9Ja
 zvCYnT4jYammyV3cplBHFo/zfdpxeA4ZK+j/1ngUc0tqalMlT/uJUjpLBUlvH4QivqoA
 gb7QL/liN+RAqLtw5w+A9ExIx15LEGwOwL9GoSz5jTwu1WH6liTDrsei8gdVVFrNA2/x
 hRA/ArvUdOm6LrjbLX2Or9AvwdO1E/QThIgvvBAYA5DY8ywiTLCb96NpkUBDRhJfcxsw
 PUo5TJhmJqRnuhxuiVAji1AtkaA+fL+OUafBwZkrtknMIQ+2WsRjNdY87uMepWTTKbAL
 sz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5TcuAQkmRiwoqdLSJS6JTYiOGLP/QjfJC3ke5FsTXG8=;
 b=UPm+uwAmG2dZS4CHlTJn7KdP2nCPDUEO2Mw+ebvUSobyQuuIDsfQwjdJrmTkaZque/
 gnEkNexay3klvXoart2yckjIyyB46cVTBaja/4aBPCRdayFfx24gXD5A+9FFDf/X7RZe
 eorG4PyjrHggBWKDOpruD+cht+X25dQyuXUwsTtKWZSZ10LlIRgHks569GzQUNp544YI
 7OFB3BAK4HrTQxXTKz7ZfM06EK6Vhx9NCzuPCV3aqijWgjwHsXa7n4CNTzP9n/qzNT0t
 oG16uJxwPVO7JUcr2W3lB/qMP7TzpuPwNurq1tUxty/hxpNB98fXZHF6/VyE6vrqKCsQ
 pS9g==
X-Gm-Message-State: APjAAAWZnQamGbqcqnL2ysjn9/7+N+eL/FOjVOa2tUEVdeXYYfRlvPBo
 6XzGhBE1IjapH3dEn234KyHOilRKTIIbVZB+gz/R+Q==
X-Google-Smtp-Source: APXvYqzJICcxFN3gQb2rNRQ6JHRvBjVW+UtXYivPPLM9eyQgilX8UtH1y4dVV3TYuMn+dM3geKzplvKp5yscEzr13zY=
X-Received: by 2002:aca:c7cb:: with SMTP id x194mr2459757oif.157.1578666433070; 
 Fri, 10 Jan 2020 06:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20200110094535.23472-1-kraxel@redhat.com>
In-Reply-To: <20200110094535.23472-1-kraxel@redhat.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 10 Jan 2020 15:26:46 +0100
Message-ID: <CAG48ez0wfLkTqdBtDBV4b1uUQMGeeAr09GPPi9WT++Fn8ph4rA@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: add missing virtio_gpu_array_lock_resv call
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 10, 2020 at 10:45 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> When submitting a fenced command we must lock the object reservations
> because virtio_gpu_queue_fenced_ctrl_buffer() unlocks after adding the
> fence.

Thanks a lot! With this patch applied, my VM doesn't throw lockdep
warnings anymore. If you want, you can add:

Tested-by: Jann Horn <jannh@google.com>

> Reported-by: Jann Horn <jannh@google.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 1 +
>  1 file changed, 1 insertion(+)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
