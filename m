Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D8B1A0937
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B5D89C82;
	Tue,  7 Apr 2020 08:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EB0899B7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 08:19:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 31so2798379wre.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 01:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=COMLzXWVSUn3+sBQUKkA7J2wEVqwpfv4KB3Y4koWlrk=;
 b=0eQgir2LdwPHBc5Tn2fAzKawU8GAKD/Cac4Jiabg+snkgJs2vwWG2ayDAehjpeGnPm
 LyT/iRM0utWpyj2p8dfZRQRihfNEXGoRq6gbkdGlAKnkyYJ43NCbJPL+WI3UiLV4cSu7
 e4nQDeZJ6CjvcJZaiYoUX9zC3LtHLM4NN5gHVW/V72S/2yChiVZio3ImiEPXoHuZ3lri
 b0ahsYevTwRl5L48N0AnNjVgme3fYU8IHFMglqRPoonSpBuoL7EPGY1Q5DKPHy3AY2Ff
 Fh+SE3qLgnDNv8KTdgAbk88vJB66FnAT2+YOKR/v2dajTXB5KU/o9Y7CEJIgAme0S7bK
 i15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=COMLzXWVSUn3+sBQUKkA7J2wEVqwpfv4KB3Y4koWlrk=;
 b=hl0RTII/RQ9kfirGiYaaKD97NzjLr7QpR9vy5YrNnTxbwOpJgpdznMnpYGNN8Y5p4g
 zVq3P+hDtrhqEmwvupm0OeePxdtwl+tAyusA/5WV7v7HycJia0WmO4dvDYD1+4ouzyeI
 +vjOPFYeZJl1orJPjBijEbDearB04OFny2vECaG04bW6K0iCyRb72UtUDlx5KyQ98CPo
 L74wMM4U6aZ4fo57NBw73ibl+IBoFj8+baWRTRxt/g0hGn7qOxjIJ12fdueAayzStehI
 mebpaogVP9QnrdWRvpLRCIOSqVeOFO6xheIU+VrrY3fE+oHQfB3NK1ZhLduZTzXInaHn
 ufqw==
X-Gm-Message-State: AGi0PuYppZ7vsUAQkkrwSHRc3T1UrDz0hDcwI98d1TBJQ+/JO2EcdfAH
 l+GXTQMXVPADwOwnrt1zI9EtCLCLMUx99yHoaYCkfw==
X-Google-Smtp-Source: APiQypLGiCxVaQs3g2IpmgI+fM1mghJapocGm3GUdc/LsSMF1hRJLiU5Ap2zYKgTe0HDBAOUcLrJYpsqeCQUc3Ya7lY=
X-Received: by 2002:adf:fc10:: with SMTP id i16mr1410541wrr.354.1586247598407; 
 Tue, 07 Apr 2020 01:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
 <20200403152400.55fe5eac@eldfell.localdomain>
In-Reply-To: <20200403152400.55fe5eac@eldfell.localdomain>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 7 Apr 2020 09:18:48 +0100
Message-ID: <CAPj87rOzsd4wLtkaZt4Xj5ndwHjU7iXQZnnU=+1QSXC2Xdf4Yw@mail.gmail.com>
Subject: Re: KMS enums and bitfields UAPI
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 3 Apr 2020 at 13:24, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> On Fri, 03 Apr 2020 10:15:21 +0000 Simon Ser <contact@emersion.fr> wrote:
> > At the very least, having a clear policy for both kernel public headers and
> > user-space would help a lot. Right now it's unclear for both parties what to do
> > regarding enum values.
> >
> > What do you think?
>
> I do not think it is unclear at all. You have to query the kernel for
> value by string names. Maybe it's not clearly communicated though?
>
> But I also don't have anything against changing that policy, if kernel
> maintainers agree.

I'm in the same boat. The existing policy (runtime enum name lookups
are the only correct thing, and the presence of anything else in
headers is merely accidental) seems pretty clear to me. But I'd be
totally fine with changing it too, though it might require a cap to
say that this kernel version lets you use the stable integer
enumerations, and anything else requires runtime lookup.

I had a quick look to see how drivers used properties, and was
pleasantly surprised to see that only the (very old) Intel driver,
VMware and QXL drivers have custom properties. So maybe we don't have
to really worry about vendor-extended properties too much ... though
someone will definitely try to use it on some kind of nightmare vendor
BSP and have to fork libliftoff for it at some point.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
