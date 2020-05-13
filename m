Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFAA1D4655
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89F86EC0A;
	Fri, 15 May 2020 06:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB128933E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 10:39:25 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id g35so5870256uad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uPEbCggGDzU0XW7ukhKo5REKOS0O2dzJZy0DGbAX74E=;
 b=SIhEtqwxRmCMyY/bSMtyHYaUs2Az5KOm5G3Ryc1R/NJ803pASDb+RvDG2+sNkIpvcd
 5S7KAbiMVP/BaN12vkg+qFGbLd0jPpniG9UvBYZloimXX1gZlF0N3bSGKHJkv4Vvp9rN
 PE7GDQtH3EuBbG0AcYgRMEMIcH7sB3YzgzAJjwVJx3h6UHQw+RaG+IUj4BUofpNESYOA
 xQvni6n1n+irfYpd50YHRd0676CcRaW96xrNJRm9dfuuHeokiGh1FYJ5NjPGeb6gedDx
 rugs/LcjxYcUe5+w0FxIiIkFei9m3oCsO2p1OUe/fbgOdE44vureGV0A95DAcbHmPpQN
 Ex6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uPEbCggGDzU0XW7ukhKo5REKOS0O2dzJZy0DGbAX74E=;
 b=U1/83tiY8pJKew4iuI68wFklHmurw1pjaxbH1BUab5KXlQnQBxgf89hKeVYdGZ7KAt
 UsjKMXDDJQYLE0OKjI2LE4jKwzZjmm6s1ZTbvtKq/asNq7YKeXx9pu5D05I6ULKp75y6
 mXG6xl6jy+bpfg24pfHKYAFLe3gcTABum/QWYM1BLJsrmXLOX+I6oFzYfzoqIanpgawN
 hBh/G3hcUTzKSXDtUIqwhPc2fToZSUb9R7Wt+Qz7sMnZKDTtg40e98USUrVuGn3zrL+S
 QZpMJzWntOREOIoQYFHdxZHMI/9CLvvm1EBpyH0jXDOWqq/TEsyfifJZwx0YYhhfPiU4
 o13A==
X-Gm-Message-State: AGi0PuZdgQFyLliOiYmwu+9NvSKrXjWjWZcZYv2hgmYDcNl91/N1Hyg4
 YxKywWmwbklAPKB4KomjE9PNwr0TBCMN8+y/+A==
X-Google-Smtp-Source: APiQypK7lAjL9VzyqteDsBJAtihfxQLmPCmVE0f5fyl1tFZrYY3fkcy7Xhi+zO3yNPDw8wx4b9Le36fQh6uuL+1tQXk=
X-Received: by 2002:ab0:25:: with SMTP id 34mr18878412uai.63.1589366364298;
 Wed, 13 May 2020 03:39:24 -0700 (PDT)
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
In-Reply-To: <69696543-7c0e-604d-ed29-721b1b99d44e@daenzer.net>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Wed, 13 May 2020 11:39:12 +0100
Message-ID: <CALjTZvYsNsW9ytGpbUKv1uf9r6DJkAbQzyDbx7Ru+fCP34w4kQ@mail.gmail.com>
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

T24gV2VkLCAxMyBNYXkgMjAyMCBhdCAxMToyNywgTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVu
emVyLm5ldD4gd3JvdGU6Cj4KPiBUaGUgb25seSB0aGVvcmV0aWNhbCBwcm9ibGVtIHRoZXJlIHdh
cyB0aGF0IHRoZSBrZXJuZWwgc3RpbGwgaGFkIGEKPiBjYWNoZWFibGUgbWFwcGluZyBvZiB0aGUg
c2FtZSBtZW1vcnksIGFuZCBhbnkgYWNjZXNzIHZpYSB0aGF0IChlLmcuCj4gcHJlZmV0Y2ggZHVl
IHRvIGFjY2VzcyB0byBhIG5laWdoYm91cmluZyBwYWdlKSBjb3VsZCB0cmlnZ2VyIGEgbWFjaGlu
ZQo+IGNoZWNrLiBCdXQgSSBkb24ndCByZW1lbWJlciBldmVyIGhpdHRpbmcgdGhhdC4gTWF5YmUg
SSB3YXMganVzdCBsdWNreQo+IGFsbCB0aG9zZSB5ZWFycy4KCklmIHRoYXQncyB0aGUgaXNzdWUs
IEkgYXNzdXJlIHlvdSBub3dhZGF5cyB5b3UgY2FuIGhpdCBpdCBxdWl0ZQpyZWxpYWJseSwgYXQg
bGVhc3Qgb24gbXkgaUJvb2sgRzQuIChXaGljaCwgYnkgdGhlIHdheSBpcyBhbHNvIGhhbmdpbmcK
cmFuZG9tbHkgb24gNS43LXJjNSwgZm9yIGFwcGFyZW50bHkgdW5yZWxhdGVkIHJlYXNvbnM7IEkg
aGF2ZW4ndApiaXNlY3RlZCB5ZXQsIGJ1dCBmb3J0dW5hdGVseSBJIGNhbiBkbyBpdCBvbiB0aGUg
RzUgd2hpbGUga2VlcGluZwp3aGF0J3MgbGVmdCBvZiBteSBzYW5pdHkuKQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
