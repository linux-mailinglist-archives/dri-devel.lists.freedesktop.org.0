Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7261470A
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 11:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470B189804;
	Mon,  6 May 2019 09:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DDE897FF;
 Mon,  6 May 2019 09:03:53 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id x15so6040666pln.9;
 Mon, 06 May 2019 02:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2zkFvMfXSuPxA7TswP4qZ+QIZKRpTzLAUwlBxIZ9PzU=;
 b=ad3cbLTKAmP8hM8si8ODcgYHq11BMSED6rzNQWORJeeSveAqDh0VbJNsUYm9w2xQDx
 0ppERHM5xRakJRKJhap6NWSWwwWgKv2XINNcTJIKa4OwtltxwotVkUshZbrk7qgrM1on
 Fs17pScql+2MaZlpUOngrDKG6whAMNVGqw9LzQyGUiCrsBoEHvfPFbZf8kU/yxd1mauZ
 W8umTYnDA6OpVE0E/XZBMffeae3pdAvyyqK3KliJg1VdTcMYiVgrQzD7kIVIwQLImv52
 IghabvqupagLR1C6dFLXBBc6mZlIPa/6BALNq3Q0CN0psE4W5/e7gwPbOc2AO4D7EEfg
 TFLw==
X-Gm-Message-State: APjAAAVc2IBqAzOgFzfy/Fr/tnvk/ETRMeLfixjK9d6PWc+bespNblmp
 ACAhCX4XGHdgW+4MsNxdEiqlletCcNQZCHKYTuU=
X-Google-Smtp-Source: APXvYqzcd/LiJVbbE8cCf+fOVIBhczP6XN4ND6V/1pkV1QnBDFee3E6dAicqEB0BMR5uY867+F0seVXH98gF0RaaX4M=
X-Received: by 2002:a17:902:8349:: with SMTP id
 z9mr30421370pln.144.1557133433288; 
 Mon, 06 May 2019 02:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190416202013.4034148-1-arnd@arndb.de>
In-Reply-To: <20190416202013.4034148-1-arnd@arndb.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2019 12:03:42 +0300
Message-ID: <CAHp75Vc2-zzRYk0vpdPQm5duZwW+v=svEndTPV4Sr59QrGcMHg@mail.gmail.com>
Subject: Re: [PATCH v3 00/26] compat_ioctl: cleanups
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=2zkFvMfXSuPxA7TswP4qZ+QIZKRpTzLAUwlBxIZ9PzU=;
 b=YiczZxhl+N5iLdzUGTmZ+vv61ahbfT5sYkO+ZKl1O183V89+BhJz/LVCYZW69Rs96I
 B9L09hT9RKBTMzQPy68tiva/wZUTF1HeqiQA0wgIQKQi9hc9wauqzRc3OKkCm1b+45xD
 /TIxR7gFTxFuR4TGryfYzNp53n1d0MoSOlSKqUI1PygQXIr4DIq/BsZfwXixIBOH9ZxQ
 yFa4fMS2Zky76vcoykF14xxJXsTp6HA89kojG6J76npL+WXgKQ2KtB8ZUuikGBrAHTkD
 gd51bYyzDfYbsyUC+pmkXYFFrzi2nJRQ6fAyiK8dpDyV02X1sRuhxEHafOiBQ4LbnHZJ
 uFzw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Linux NVMe Mailinglist <linux-nvme@lists.infradead.org>,
 linux-iio <linux-iio@vger.kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 linux-ide@vger.kernel.org,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 sparclinux@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 linux-scsi <linux-scsi@vger.kernel.org>, linux-bluetooth@vger.kernel.org,
 y2038@lists.linaro.org, qat-linux@intel.com, amd-gfx@lists.freedesktop.org,
 linux-input <linux-input@vger.kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>,
 "open list:TI WILINK WIRELES..." <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
 linux-crypto <linux-crypto@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgMTE6MjMgUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gd3JvdGU6Cj4KPiBIaSBBbCwKPgo+IEl0IHRvb2sgbWUgd2F5IGxvbmdlciB0aGFuIEkg
aGFkIGhvcGVkIHRvIHJldmlzaXQgdGhpcyBzZXJpZXMsIHNlZQo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAxODA5MTIxNTAxNDIuMTU3OTEzLTEtYXJuZEBhcm5kYi5kZS8KPiBmb3Ig
dGhlIHByZXZpb3VzbHkgcG9zdGVkIHZlcnNpb24uCj4KPiBJJ3ZlIGNvbWUgdG8gdGhlIHBvaW50
IHdoZXJlIGFsbCBjb252ZXJzaW9uIGhhbmRsZXJzIGFuZCBtb3N0Cj4gQ09NUEFUSUJMRV9JT0NU
TCgpIGVudHJpZXMgYXJlIGdvbmUgZnJvbSB0aGlzIGZpbGUsIGJ1dCBmb3IKPiBub3csIHRoaXMg
c2VyaWVzIG9ubHkgaGFzIHRoZSBwYXJ0cyB0aGF0IGhhdmUgZWl0aGVyIGJlZW4gcmV2aWV3ZWQK
PiBwcmV2aW91c2x5LCBvciB0aGF0IGFyZSBzaW1wbGUgZW5vdWdoIHRvIGluY2x1ZGUuCj4KPiBU
aGUgbWFpbiBtaXNzaW5nIHBpZWNlIGlzIHRoZSBTR19JTy9TR19HRVRfUkVRVUVTVF9UQUJMRSBj
b252ZXJzaW9uLgo+IEknbGwgcG9zdCB0aGUgcGF0Y2hlcyBJIG1hZGUgZm9yIHRoYXQgbGF0ZXIs
IGFzIHRoZXkgbmVlZCBtb3JlCj4gdGVzdGluZyBhbmQgcmV2aWV3IGZyb20gdGhlIHNjc2kgbWFp
bnRhaW5lcnMuCj4KPiBJIGhvcGUgeW91IGNhbiBzdGlsbCB0YWtlIHRoZXNlIGZvciB0aGUgY29t
aW5nIG1lcmdlIHdpbmRvdywgdW5sZXNzCj4gbmV3IHByb2JsZW1zIGNvbWUgdXAuCgo+ICBkcml2
ZXJzL3BsYXRmb3JtL3g4Ni93bWkuYyAgICAgICAgICAgICAgICAgIHwgICAyICstCgpBY2tlZC1i
eTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgoKLS0gCldpdGgg
QmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
