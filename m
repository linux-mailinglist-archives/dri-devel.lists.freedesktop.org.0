Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997EF1441C8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 17:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771036ED95;
	Tue, 21 Jan 2020 16:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B246ED95;
 Tue, 21 Jan 2020 16:13:07 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id f8so3553157edv.2;
 Tue, 21 Jan 2020 08:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ky6e6MtIcCiL3OmK7NLRQW36lXBOOSvY1e5ajjQQ8D0=;
 b=SmOTKTvd6xq5Bk9gbK8E9xPENLp6m/6amDXz8ejf1Fa2A9mTP0Ip4XSx5E4cSkQli/
 ckAMWHyWcHim2FSyhfr4PWk9FSd4OMky2iSMWngeqvCGxn0kPfrSdo22bCxUY1WXcpLc
 63dZEI1C+Pt+BjwnFz7KZcHpiDFGExKiTuyNAtqr+Ul37eXVHrXHDviFurzLLJPp6+d7
 mPJIOib3MeC1SzU+2/Fc43yQRy2jQ+ZfJ6wPZpIWnyifJS3Y9jxuSlmzTx19Unya4zeI
 tYxMwBYNf+Xn4YbT9M12fwxgjqtj/GukZrncM0IF6CbE5AkodXx2b051CsWPZi/6xYyN
 /S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ky6e6MtIcCiL3OmK7NLRQW36lXBOOSvY1e5ajjQQ8D0=;
 b=DjFA2e3/VhZtPjsKUFSRobcHFGiNKzYAw9creTuflFGRbJTxiHYOT06JFJZaiK2EpR
 KhfRmQxZL9P24x7D9AWMdRMk9ukBY5QCTw2JDTEd6b9Ddu9iS2KcZFaz0mXNC9J2Z7Js
 WpWkMf7bSEHbTrx4gAnDdOodmz6JM8hrRC0J+pFvompRvVluPeoSZyazYi3d9d6Y1TWB
 lT6ZKKFJ/9YX8jVKWEv2to82nKBYqVJFWrSq5rytfXgLF9jgS11jb3aTp7Bqi0qNpLIb
 SvRMB+I0d2B5qv+0lZQKaARNHlBvnMoKHVbciR1iG9+Vun++72sJA1p5AoApu+8eQM8l
 fZcw==
X-Gm-Message-State: APjAAAXbMdh5ixrlbepVwwIHuB0jlFFVRSXr8KCeuDSGFBFIDOgIzHFF
 ZeIsaml3OD/xkVcs/S4PpdukZrfP563w9wf3S7E=
X-Google-Smtp-Source: APXvYqxHGImshDdFVsYmJ7RJSVk1DDzgce5xfy11jd7a9jvDahmaVdaHHaU6wx58A1nOyUyP/juDCay3L2yFW6YUc5c=
X-Received: by 2002:a17:906:19d8:: with SMTP id
 h24mr2495752ejd.166.1579623186465; 
 Tue, 21 Jan 2020 08:13:06 -0800 (PST)
MIME-Version: 1.0
References: <CAJgxT3-cJu54Rn-9CstjaRHHtaJB_WK+R0RzKsDoK4TttDNFOg@mail.gmail.com>
In-Reply-To: <CAJgxT3-cJu54Rn-9CstjaRHHtaJB_WK+R0RzKsDoK4TttDNFOg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Jan 2020 08:12:55 -0800
Message-ID: <CAF6AEGsS7TQEtBLX1ifHu1HV7AvrWBkpcOSrnGqdNH+0+Ji-Tw@mail.gmail.com>
Subject: Re: backend-drm and scanning really large resolutions
To: Matt Hoosier <matt.hoosier@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 wayland mailing list <wayland-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 17, 2020 at 8:52 AM Matt Hoosier <matt.hoosier@gmail.com> wrote:
>
> Hi all,
>
> I'm confronting a situation where the hardware with which I work is capable of driving connectors at 4K or 8K, but doing so requires bonding the scanning of multiple planes together.
>
> The scenario is that you'd have a big primary framebuffer whose size is too large for an individual hardware scanning pipeline on the display controller to traverse within its maximum allowed clock rate.
>
> The hardware supplier's approach is to assign multiple planes, which in the KMS driver map to hardware scanning pipelines, to each be responsible for scanning a smaller section of the framebuffer. The planes are all assigned to the same CRTC, and in concert with each other they cover the whole area of the framebuffer and CRTC.
>
> This sounds a little bit wild to me. I hadn't been aware it's even legal to have more than one plane treated a the source of scanout for a single framebuffer. Maybe that distinction isn't really relevant nowadays with universal plane support.
>

fwiw, have a look at drm/msm/disp/mdp5/mdp5_plane, which will allocate
one or two hwpipe's from the devices global atomic state, depending on
scanout width.. the hwpipe (sspp) is the physical resource behind a
plane, so essentially the kms planes are virtualized.  At some point
if you have too many wide layers, the atomic test step will fail due
to insufficient hwpipe's.  But this sort of scenario is the reason for
the test step.

BR,
-R

> I'm wondering if anybody here knows whether this a legit approach for a compositor's DRM backend to take?
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
