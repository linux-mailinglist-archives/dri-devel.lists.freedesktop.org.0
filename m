Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53231D4658
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5196EBFF;
	Fri, 15 May 2020 06:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598416EA18
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 11:07:31 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id y13so3810860vsk.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 04:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ghjjN4pCLtqTQq8/PZKxlaodd9xUmnwrZXTR2Psmlsk=;
 b=OrfgQRmCa0hWNguHpMmeUuiRum+sDDk6FNbm+nHJru+3UCLsITBDmLADjBY8Th26hw
 lYigiLhemg4sVDVSVAcT3CiyAdriSxpbGcfW8zRRtZN46Eo4F0BHpiiT4FD0lg5Lm9jI
 yaKSJYhiByQMIcQVCqw4ArNjIQCMHoi57/KhRnfMFMrV49aJgT//XRHIRVajHzHRrn57
 NeDX794hmc5Y2SQxowRaSwb5dp/HkZlV36x5cj18gKqha1rL89YVE2neqPvdg8j5u9yg
 gZrCqV8mW35XZJHqlAcHOMWiGtUnx26NlJbw7Q9YXYdZbUBvsuPHunrpULu8ZkFOXHF9
 53Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ghjjN4pCLtqTQq8/PZKxlaodd9xUmnwrZXTR2Psmlsk=;
 b=tOyTkcj2XOZLHxIcyi5Rhm9rFhaYfEx/0djBtg8DbN7xLc/DVh8bKYzVmpXIjisjX/
 G9+pxb5uxTt8+AyUFl+0m8igMuM0j0sqlyN1Ph+pJmfe5FlWkTjYG1IzT+cPoN3oaTtd
 JtcJh5TI47jxOimjW07z5BPJq6BpHWoQvbM5kvAfHWszo8hUc4p3CDJcXJJpS+N9DhLH
 ouUN9pPbJHZ8wSYrXwJ+btlMB9zEl+Pw3vqqhxeTsddMEOJVF3CZrPKnuUhcRucbKr3x
 lQZNRD6QM9Ilb/gB5Hgq0oJdn8RUbZ/DBkHccaHTIdVY8quJhObD6EjL4ey20Gup3wc3
 zzGQ==
X-Gm-Message-State: AGi0PubelEmpIPFQt/6G4b0GZlqwfP+umebAJijOeUeFfBfQSqFW5Vj5
 W5zx8r8orjlBVZj0MFBgQ5cQjY+ZeWq34e2MpQ==
X-Google-Smtp-Source: APiQypKj7h3bQkBuM8tfGXKEDSK/4/EpidBzt7+L1Qzhm2f170N9/IAen9iu1UW7QXQklSqtxdn0/Lco0eTQK8lJwdk=
X-Received: by 2002:a67:6dc7:: with SMTP id i190mr18535661vsc.75.1589368050529; 
 Wed, 13 May 2020 04:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
 <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
 <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
 <CADnq5_PwY5czTPepDwzc5qoMJ3cKc4Mui=uN=k1EOtmOD42Log@mail.gmail.com>
 <CAKMK7uG3R4uve41MkkcFSiDJ+p=MwW81gcFW7NFENjKbdDUZ+g@mail.gmail.com>
 <CADnq5_NFDjOzgnjHOHEcjacd2dX1kA1QEzHp8=NweZg_b-82-A@mail.gmail.com>
 <CAKMK7uHv_Hj8BB8t_i=EXx1C4WXw1PnmxuTyNfrA=b5eQMaSLg@mail.gmail.com>
 <CALjTZvZNb-KbdZwM3kLU4yK8zH+NSh35k=iBtfGJMF1xyjpSFg@mail.gmail.com>
 <69696543-7c0e-604d-ed29-721b1b99d44e@daenzer.net>
 <CALjTZvYsNsW9ytGpbUKv1uf9r6DJkAbQzyDbx7Ru+fCP34w4kQ@mail.gmail.com>
 <2612115a-eaa0-9bf9-1227-adbf7f75e1e7@daenzer.net>
In-Reply-To: <2612115a-eaa0-9bf9-1227-adbf7f75e1e7@daenzer.net>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Wed, 13 May 2020 12:07:18 +0100
Message-ID: <CALjTZvbM=8h9g+T8+nx8mjuvv_etGAo7DJO5nCKAkg2bUNA+6g@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Karoly Balogh \(Charlie/SGR\)" <charlie@scenergy.dfmk.hu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMyBNYXkgMjAyMCBhdCAxMTo1OCwgTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVu
emVyLm5ldD4gd3JvdGU6Cj4KPiBIb3cgZG8geW91IGtub3cgeW91J3JlIGhpdHRpbmcgdGhhdCBw
YXJ0aWN1bGFyIGlzc3VlPwoKU29ycnksIHNvbWVob3cgSSBtaXNyZWFkIHRoYXQuIEkgd2FzIHN0
aWxsIHRoaW5raW5nIG9mIHRoZSBBR1AgaGFuZ3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
