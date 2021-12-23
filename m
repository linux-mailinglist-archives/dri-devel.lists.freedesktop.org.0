Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5F747DD8B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 02:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC93410E24E;
	Thu, 23 Dec 2021 01:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0325210E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 01:55:16 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id j21so15386219edt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 17:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ymcyO70QR49xUJTix9iAUZBje9Fnipqhg/DXCgLfuY=;
 b=U6IG9ExKhzMQzhwStqKhCphHUWr+QLSr3Z//Fd7BkyCvMd28msizUu4wu2fY81LITp
 C2vqjO2clKYHtL4VyW0hlq3++efrVLhok2RnAQZmJTvoSvVXr4NdJFWlWL5tmL18Kn+u
 AYnu8w6LJUSMIVa0i1wVHvNA09+vgsmwaVrQycTtZM9bcuH68nHJ8wvkg2fGJwNXKG3A
 XvQNHME2SzUPyD7mZd2K3fcJ5/8++BycL1Fsx7p+yO0tZLUnK9i6x3BP3frd0cDSfCNY
 Sh93zKmHv7W+NNB4BPahaNW6SqclTgaIy8FwrcSGrI4f32nOSQCWnml1W/IGxX1Y5p+F
 qtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ymcyO70QR49xUJTix9iAUZBje9Fnipqhg/DXCgLfuY=;
 b=I0lQYRb1oseDkttvOBiz8Ci5pVBayZRG7118Tf2icE2xwlYe3w84QnO7KuvOuWznzo
 7wE2VCHSVkPf7UcjuXQ7uGpBvozqrFbUNCF6EASbmOSduLNUuD0j/eVoCZUTFPP8m8XZ
 yFx+C92k90A3YfJvZ0JdRajIYLzJx8R33q2suNWsXuIFNF5/SKEkzDOKCRhX5mdMOK0M
 TLHEk0lnqq72RTO5oWeLEX0HgvHuuYC2HJ8OdgBqNyw1s/1U32fFHDMz4rVMGCmqF3BI
 fANCrapAPdD0CCJO45RUhPltgkkj43qAp650TCZJl8LtZeeivAP7BbNEw/bba5Q7JlEy
 /gig==
X-Gm-Message-State: AOAM533MmLigj+yO74K58dwgAQtWiZ7Hg6zxSWuGai6jkYfuRETF3Q+T
 X7LCAs32aL32zio2+9ybUSduPSDNVD6O+OMx8BI=
X-Google-Smtp-Source: ABdhPJwlTyBImGNjU0RBKiihdltBTOt+IE+eNOvJmKgw2gRuD6RN8ZC5uBDEtjor8cQiOuvWUOaIsVq4tk+Rt0z+WUg=
X-Received: by 2002:a17:906:5856:: with SMTP id
 h22mr326084ejs.266.1640224515456; 
 Wed, 22 Dec 2021 17:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20201030074212.22401-1-kuohsiang_chou@aspeedtech.com>
 <b24ec0fd-9010-ef6c-ea86-c4455f86a977@suse.de>
 <CAPM=9tymNcdq+midqxNJL3Tfhb_yKrE2sa65hZ1zWSnmhWnGVA@mail.gmail.com>
 <HK2PR06MB33009293FAA7E83C2679F44F8C7D9@HK2PR06MB3300.apcprd06.prod.outlook.com>
In-Reply-To: <HK2PR06MB33009293FAA7E83C2679F44F8C7D9@HK2PR06MB3300.apcprd06.prod.outlook.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 23 Dec 2021 11:55:03 +1000
Message-ID: <CAPM=9twaYU91G=ivBgj=084dubiXB2o7a=uNhNR57X9mw7A3fA@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: Support 1600x900 with 108MHz PCLK
To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Egbert Eich <eich@suse.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Tommy Huang <tommy_huang@aspeedtech.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>, Dave Airlie <airlied@redhat.com>,
 Arc Sung <arc_sung@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Dec 2021 at 11:19, Kuo-Hsiang Chou
<kuohsiang_chou@aspeedtech.com> wrote:
>
> Hi
>
> -----Original Message-----
> From: Dave Airlie [mailto:airlied@gmail.com]
> Sent: Wednesday, December 22, 2021 5:56 AM
> To: Thomas Zimmermann <tzimmermann@suse.de>
>
> Subject: Re: [PATCH] drm/ast: Support 1600x900 with 108MHz PCLK
>
> On Mon, 2 Nov 2020 at 17:57, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi
> >
> > Am 30.10.20 um 08:42 schrieb KuoHsiang Chou:
> > > [New] Create the setting for 1600x900 @60Hz refresh rate
> > >       by 108MHz pixel-clock.
> > >
> > > Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
> >
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > I'll add your patch to drm-misc-next.
> >
> > As Sam mentioned, you should use scripts/get_maintainers.pl to
> > retrieve the relevant people. These include those in MAINTAINERS, but
> > also developers that have previously worked on the code.
>
> We are seeing a possible report of a regression on an ast2600 server with this patch.
>
> I haven't ascertained that reverting it fixes it for the customer yet, but this is a heads up in case anyone else has seen issues.
>
> Hi Dave,
>
> Yes, you're right, The patch needs to be removed. The patch occurs incorrect timing on CRT and ASTDP when 1600x900 are selected.
> So, do I need to commit a new patch to remove/revert it from drm/ast?

Yes, do a git revert <commitd>

Fixup the resulting message, to say why, and add a
Fixes: <12 chars of sha1> ("commitmsg")

and send to the list.
Dave.
