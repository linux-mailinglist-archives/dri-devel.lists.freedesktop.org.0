Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0324A1F9AF9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 16:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2376B89D56;
	Mon, 15 Jun 2020 14:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2407489D56
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 14:53:57 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id j19so11372315ilk.9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PzLODeo5kCBuBydptAl9EG85c2S9uCUTIghPM7WGHrI=;
 b=Ld/kDXe/GpaOFiwtcPx04ygASOETtYrA2o7jL1tqRZmD02Rszwfk78yBwHIGyPftAF
 /x1LkdoGCVJ2a2iks3DpaKuST/3QYPihF9qGtNyeZEH7qg/4UnGrpYSnEqbu3gn6YfBh
 EPCxfWT1NPwQk3GVQTgOeCwLFHb0X9709E4gfvAVcUy4UzZl0RfAdi/9xNXPLnMmYWaJ
 uGfmwYGmpvTF7tgJTaixqi63agth6chOM+RG2WvwfW7GYVtFkUPkQ/xgKrZrl8mwcelk
 ZI/hqvWInRrgIVhAXP/x9wn9jNvkSyoEg0eGpt8QGtAemevfP0uCqKG/i/bWeKH/JhXe
 Ubcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PzLODeo5kCBuBydptAl9EG85c2S9uCUTIghPM7WGHrI=;
 b=tjhBYGWkAH8dghbRDfqg9LwLq+kcgY88AMP/rwbsGv7JK2pyfF/ZETAGxzTJYyY2bi
 iuOLiLrwWBu9TMyYZp8s9zFHwJBmJ75cLjGtCgHWe1oxEIvA6wUqbdJtaRb5H7fTMapN
 JyBn4Qi9GHsEHpDVIURFw3QnHRFjiS0AmF4YFMcHVBzTjzquInX9lQIxrkOO2xWemH1E
 +WNHQkNUS7Jj6+L80mvcd96zf171ilwUQbLw6KmHIYBhFYSZlXbrDEP7brVGAnK37l6T
 m1nr5jJKqn0lJaZ2t4ddqBMr1nqAdQdDYPclj1Za6+PhT+72b73eFzkGTWUFVeGLVtbt
 20ew==
X-Gm-Message-State: AOAM530bRQev1GxSKFc1lBPRZ5VMTiprxB0Xq83elO2/Oga5B0KhYo65
 0XEyPvIWG0S53bfAzblkO5jSiu+QHrPpMzDdK6U=
X-Google-Smtp-Source: ABdhPJzHYsDv+aGOgSm4eVW9wFZEo9ZhievD2Gjn5An/GBjaq0kMq0f58qU903Mcxewu90XlQPTNbnHCmjRFI21BRqc=
X-Received: by 2002:a92:77c1:: with SMTP id
 s184mr27102625ilc.196.1592232836396; 
 Mon, 15 Jun 2020 07:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200615131934.12440-1-aford173@gmail.com>
 <CAOMZO5Bw5qSDirAKBTRcu4_nDafDcfDGpuNRDyuLZs9Zc=HsQA@mail.gmail.com>
In-Reply-To: <CAOMZO5Bw5qSDirAKBTRcu4_nDafDcfDGpuNRDyuLZs9Zc=HsQA@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 15 Jun 2020 09:53:45 -0500
Message-ID: <CAHCN7x+=xjFTy6J4Ej61U2jXTez2rLrt=KtEOzbvV7Tzq6XoPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-simple: fix connector type for LogicPD Type28
 Display
To: Fabio Estevam <festevam@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Adam Ford-BE <aford@beaconembedded.com>, stable <stable@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 15, 2020 at 9:46 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Mon, Jun 15, 2020 at 10:19 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > The LogicPD Type28 display used by several Logic PD products has not
> > worked since v5.5.
>
> Maybe you could tell which commit exactly and then put a Fixes tag?

I honestly don't know.  I reached out to the omap mailing list,
because I noted this issue. Tomi V from TI responded with a link that
he posted which fixes this for another display.

https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg312208.html

I tested that patch and it worked for a different LCD, so I did the
same thing to the Logic PD Type 28 display as well.

My patch and commit message were modeled after his, and his commit
CC's stable with a note about being required for v5.5+

I added him to the CC list, so maybe he knows which hash needs to be
referenced from a fixes tag.  I was hoping to not have to go back and
bisect if it's not required, but I will if necessary.


adam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
