Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D94032081C
	for <lists+dri-devel@lfdr.de>; Sun, 21 Feb 2021 03:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8722B6E0D7;
	Sun, 21 Feb 2021 02:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DF16E0D7
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 02:34:27 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id z18so7912414ile.9
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Feb 2021 18:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9DSCLn/PrHDgQxuXaE9iO1VKgiKTdkzQgivDM+i6TiI=;
 b=pAsC6+Nu9a+OFTwOmiQl0T1fUtPEtgE0JiOVylivL1IqigBvp6aXavQiufg+QSz60K
 5XeHZFu0+pKNTdenU/SWYmuan+YW6/Xc7VARY86ABYThRCUtkTDaDDHVxZHPE/R6lyMe
 U9OxWYGtfZN/i9NOGm8dWxMd1siFxMiRiNy6yPxHYwzz7dBcFETxWYHCRtyb8erBAvdt
 5mpFsoxFPkgF41+3cKLval8A45uasutmCShKNtViBCWbnSo8tTFj2fzcyrfAs8xxatMQ
 t+4JIbFD7i9QcpJpyBZfSIzqkNGu2XL4/oVcFiFnpyN9Ye/wid7m8okgBmAYomS3AfFU
 CRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9DSCLn/PrHDgQxuXaE9iO1VKgiKTdkzQgivDM+i6TiI=;
 b=h5g+qVQapWUh5bQ3ZLvoaR2NMXTZYIl/o+IlZJXwpuW9aIOLVfjZXrgRkmYa5JnC8t
 Wjld/+h/eLiM2sfVDNaRVqdX64gT1INy93be8cV+TPRBatWA1oPIiJP6oH09hKNE9PQo
 Dt2CY1BluGNxohxTNK19uKkzN3KyAARv2P6PMsLcsDc7ubSLTPSHs+vCibniqJIkz9T4
 letxZ9wVATORFvqlhosGMPdoaiipSZdec8sXvdHmnjq9F1dw+5ApkMAITNrRDCZAv/q8
 mSIhbIYE5EBXR/U9j1ZOUwbmYoH+sv7a2b7QxDqQE5UwGN9LS/v0FeG+78QwC+jD/rym
 JP0Q==
X-Gm-Message-State: AOAM532Fx5m1S42K1l6etvK9xEkK1w2D4J9NmUMs/GpzvZsdJxoQ2aou
 jPD/d7L7sx91s5HFCyDrWNbD8Bvb13vyN2cEyNc=
X-Google-Smtp-Source: ABdhPJwG+0K4EODqfAlqMTm/5GEyPnFdfmjXvnUOJN4piYZOl8vsrMYOyU2L9/r60HIKWsURrPXhKN0aFjQnXCVu8dc=
X-Received: by 2002:a05:6e02:1bad:: with SMTP id
 n13mr9438794ili.260.1613874867390; 
 Sat, 20 Feb 2021 18:34:27 -0800 (PST)
MIME-Version: 1.0
References: <ea1c5ff3-0b24-71c9-7a44-08b184c4854d@infradead.org>
 <20210221000024.358772-1-ztong0001@gmail.com>
 <6b35b3b2-a746-9524-3a19-82ee73427ead@infradead.org>
In-Reply-To: <6b35b3b2-a746-9524-3a19-82ee73427ead@infradead.org>
From: Tong Zhang <ztong0001@gmail.com>
Date: Sat, 20 Feb 2021 21:34:16 -0500
Message-ID: <CAA5qM4A4Ckcw7R2spuKEUg_xxqyxifgaYvj=Sqo2p04KzSD2Sw@mail.gmail.com>
Subject: Re: [PATCH v2] video: fbdev: pm2fb: avoid stall on fb_sync
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 20, 2021 at 7:36 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> I suppose the rest of the patch is OK since it works for you.
>
> I don't know any of this code. It would be nice to know what some
> of those pm2_RD(par, SOME_REG) mean so that I could sort of
> understand what it is doing, but don't go spending time on it
> just for me. It's not worth doing that IMO.
>
>
> --
> ~Randy

Thank you Randy. I have sent another revision.
I am also curious about those registers -- but it is hard to
accurately figure it out without datasheet --
my speculation is that it calls the device to do some sort of frame
buffer synchronizations here
Thanks,
- Tong
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
