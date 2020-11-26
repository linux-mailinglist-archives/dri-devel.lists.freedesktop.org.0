Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F8E2C6290
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 11:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E2F6EB80;
	Fri, 27 Nov 2020 10:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC856E951;
 Thu, 26 Nov 2020 14:53:40 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id t33so1890692ybd.0;
 Thu, 26 Nov 2020 06:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DTotsfb8u+PB0eT0g4gTrA/vgT4HfiDZTYQ/geteWC4=;
 b=QWuS1TBfImi/m9J+5lB37414TjwoB+kfRyX/7ohuLNDuEazbBA4fEE506RPmuhzrQT
 KCYao+uRLv4Su9SW/eKLjGfymcNDAcVP9irkT5MfO/ys+N1YXqwwODp/at6Hjf5mbn7y
 sEjBq+fitA5RwLT9szzutyPemHxF/3vzz+qMkDnIA1HF+rIjtAU7PcoRO+GQ0ANzP2/3
 4RgPAdoGGim7svP8Zrp9IWC0s7kVtrSQn/PXobh5aGfJoVk3uyVZYliED/q0Nk6tCoA8
 W9fyUHPup50QVVdVd9NqYx0m2pkDUcyuxLwwV68mOS3NFLJOgvtFKpngAgg7rBEfKLyO
 Kn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DTotsfb8u+PB0eT0g4gTrA/vgT4HfiDZTYQ/geteWC4=;
 b=ibY/S0+rjRpiTCOKlNnuAEAydgP0NVxPlh7cYAhkgXv3dUpQ8Cgwjbg8Hb120+YykD
 zH/r1tGwMMR1dGS6u0vb16G1Y1Tlzo08JLeF0gOLXL3nOba9RkDuSYsbrCP2UvcLeBdv
 d6zXah/riDkvX9IRsgZPrLuKuRMIRKKNOeIjr0aJTC2U7zF/CJGQPbW2dvWQdY2Bq6TI
 Fsp60cm7oPdynC3GnyCRovOob3Zgo1voZ8xzXhoJa552ThXE9MxTkwCX9m+mekC7OwJY
 C7oxzX4rsq5jUg20Modc5DtUWMazXH9FRdhr5Z63srFEVC6lLuZkAjcWWXmjnN9+MmLU
 eXgw==
X-Gm-Message-State: AOAM533Srvko4DnnBaeFu/ZHbxYEiztydwj5nCprvZsp+5OettIfvW96
 C6i8IeNxnmr9l9qZB1d7JjZYzmb/HkBjQaIBpjM=
X-Google-Smtp-Source: ABdhPJxnOXTYq+iR4KCiqWmvI5brXjGTtWFP5n3J8AJAa70YoLiXvitjZtrbfPlByRts+Q0mJZBucXgMnTrbOCoAA44=
X-Received: by 2002:a25:aac5:: with SMTP id t63mr5128050ybi.22.1606402419264; 
 Thu, 26 Nov 2020 06:53:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
 <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
 <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
 <CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com>
 <4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
 <CANiq72kqO=bYMJnFS2uYRpgWATJ=uXxZuNUsTXT+3aLtrpnzvQ@mail.gmail.com>
 <44005bde-f6d4-5eaa-39b8-1a5efeedb2d3@gmail.com>
In-Reply-To: <44005bde-f6d4-5eaa-39b8-1a5efeedb2d3@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Nov 2020 15:53:27 +0100
Message-ID: <CANiq72nobq=ptWK-qWxU91JHqkKhMcRtJNnw2XJd5-vSJWZd8Q@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: Edward Cree <ecree.xilinx@gmail.com>
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:11:27 +0000
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
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com,
 wcn36xx@lists.infradead.org, samba-technical@lists.samba.org,
 linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-scsi@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input <linux-input@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-nfs@vger.kernel.org,
 GR-Linux-NIC-Dev@marvell.com, tipc-discussion@lists.sourceforge.net,
 Linux-MM <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjUsIDIwMjAgYXQgMTE6NDQgUE0gRWR3YXJkIENyZWUgPGVjcmVlLnhpbGlu
eEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVG8gbWFrZSB0aGUgaW50ZW50IGNsZWFyLCB5b3UgaGF2
ZSB0byBmaXJzdCBiZSBjZXJ0YWluIHRoYXQgeW91Cj4gIHVuZGVyc3RhbmQgdGhlIGludGVudDsg
b3RoZXJ3aXNlIGJ5IGFkZGluZyBlaXRoZXIgYSBicmVhayBvciBhCj4gIGZhbGx0aHJvdWdoIHRv
IHN1cHByZXNzIHRoZSB3YXJuaW5nIHlvdSBhcmUganVzdCBkZXN0cm95aW5nIHRoZQo+ICBpbmZv
cm1hdGlvbiB0aGF0ICJ0aGUgaW50ZW50IG9mIHRoaXMgY29kZSBpcyB1bmtub3duIi4KCklmIHlv
dSBkb24ndCBrbm93IHdoYXQgdGhlIGludGVudCBvZiB5b3VyIG93biBjb2RlIGlzLCB0aGVuIHlv
dQoqYWxyZWFkeSogaGF2ZSBhIHByb2JsZW0gaW4geW91ciBoYW5kcy4KCj4gRmlndXJpbmcgb3V0
IHRoZSBpbnRlbnQgb2YgYSBwaWVjZSBvZiB1bmZhbWlsaWFyIGNvZGUgdGFrZXMgbW9yZQo+ICB0
aGFuIDEgbWludXRlOyBqdXN0IGJlY2F1c2UKPiAgICAgY2FzZSBmb286Cj4gICAgICAgICB0aGlu
ZzsKPiAgICAgY2FzZSBiYXI6Cj4gICAgICAgICBicmVhazsKPiAgcHJvZHVjZXMgaWRlbnRpY2Fs
IGNvZGUgdG8KPiAgICAgY2FzZSBmb286Cj4gICAgICAgICB0aGluZzsKPiAgICAgICAgIGJyZWFr
Owo+ICAgICBjYXNlIGJhcjoKPiAgICAgICAgIGJyZWFrOwo+ICBkb2Vzbid0IG1lYW4gdGhhdCAq
ZWl0aGVyKiBpcyBjb3JyZWN0IOKAlCBtYXliZSB0aGUgYXV0aG9yIG1lYW50CgpXaGF0IHRha2Vz
IDEgbWludXRlIGlzIGFkZGluZyBpdCAqbWVjaGFuaWNhbGx5KiBieSB0aGUgYXV0aG9yLCBpLmUu
IHNvCnRoYXQgeW91IGxhdGVyIGNvbXBhcmUgd2hldGhlciBjb2RlZ2VuIGlzIHRoZSBzYW1lLgoK
PiAgdG8gd3JpdGUKPiAgICAgY2FzZSBmb286Cj4gICAgICAgICByZXR1cm4gdGhpbmc7Cj4gICAg
IGNhc2UgYmFyOgo+ICAgICAgICAgYnJlYWs7Cj4gIGFuZCBieSBpbnNlcnRpbmcgdGhhdCBicmVh
ayB5b3UndmUgZGVzdHJveWVkIHRoZSBtYXJrZXIgdGhhdAo+ICB3b3VsZCBkaXJlY3Qgc29tZW9u
ZSB3aG8ga25ldyB3aGF0IHRoZSBjb2RlIHdhcyBhYm91dCB0byBsb29rCj4gIGF0IHRoYXQgcG9p
bnQgaW4gdGhlIGNvZGUgYW5kIHNwb3QgdGhlIHByb2JsZW0uCgpUaGVuIGl0IG1lYW5zIHlvdSBh
bHJlYWR5IGhhdmUgYSBidWcuIFRoaXMgcGF0Y2hzZXQgZ2l2ZXMgdGhlCm1haW50YWluZXIgYSBj
aGFuY2UgdG8gbm90aWNlIGl0LCB3aGljaCBpcyBhIGdvb2QgdGhpbmcuIFRoZSAieW91J3ZlCmRl
c3Ryb3llZCB0aGUgbWFya2V0IiBjbGFpbSBpcyBib2d1cywgYmVjYXVzZToKICAxLiB5b3Ugd2Vy
ZSBub3QgbG9va2luZyBpbnRvIGl0CiAgMi4geW91IGRpZG4ndCBub3RpY2UgdGhlIGJ1ZyBzbyBm
YXIKICAzLiBpcyBpbXBsaWNpdCAtLSBoYXJkZXIgdG8gc3BvdAogIDQuIGlzIG9ubHkgdXNlZnVs
IGlmIHlvdSBleHBsaWNpdGx5IHRha2UgYSBsb29rIGF0IHRoaXMga2luZCBvZiBidWcuClNvIHdo
eSBkb24ndCB5b3UgZG8gaXQgbm93PwoKPiBUaHVzLCB5b3UgKmFsd2F5cyogaGF2ZSB0byBsb29r
IGF0IG1vcmUgdGhhbiBqdXN0IHRoZSBpbW1lZGlhdGUKPiAgbWVjaGFuaWNhbCBjb250ZXh0IG9m
IHRoZSBjb2RlLCB0byBtYWtlIGEgcHJvcGVyIGp1ZGdlbWVudCB0aGF0Cj4gIHllcywgdGhpcyB3
YXMgdGhlIGludGVudC4KCkkgZmluZCB0aGF0IGlzIHRoZSByZXNwb25zaWJpbGl0eSBvZiB0aGUg
bWFpbnRhaW5lcnMgYW5kIHJldmlld2VycyBmb3IKdHJlZS13aWRlIHBhdGNoZXMgbGlrZSB0aGlz
LCBhc3N1bWluZyB0aGV5IHdhbnQuIFRoZXkgY2FuIGFsc28ga2VlcAp0aGUgYmVoYXZpb3IgKGFu
ZCB0aGUgYnVncykgd2l0aG91dCBzcGVuZGluZyB0aW1lLiBUaGVpciBjaG9pY2UuCgo+IElmIHlv
dSB0aGluayB0aGF0IHRoYXQgc29ydCBvZiB0aGluZwo+ICBjYW4gYmUgZG9uZSBpbiBhbiAqYXZl
cmFnZSogdGltZSBvZiBvbmUgbWludXRlLCB0aGVuIEkgaG9wZSB5b3UKPiAgc3RheSBhd2F5IGZy
b20gY29kZSBJJ20gcmVzcG9uc2libGUgZm9yIQoKUGxlYXNlIGRvbid0IGFjY3VzZSBvdGhlcnMg
b2YgcmVja2xlc3NuZXNzIG9yIGluY29tcGV0ZW5jZSwgZXNwZWNpYWxseQppZiB5b3UgZGlkbid0
IHVuZGVyc3RhbmQgd2hhdCB0aGV5IHNhaWQuCgo+IEEgd2FybmluZyBpcyBvbmx5IHVzZWZ1bCBi
ZWNhdXNlIGl0IG1ha2VzIHlvdSAqdGhpbmsqIGFib3V0IHRoZQo+ICBjb2RlLiAgSWYgeW91IHN1
cHByZXNzIHRoZSB3YXJuaW5nIHdpdGhvdXQgZG9pbmcgdGhhdCB0aGlua2luZywKPiAgdGhlbiB5
b3UgbWFkZSB0aGUgd2FybmluZyB1c2VsZXNzOyBhbmQgaWYgdGhlIHdhcm5pbmcgbWFkZSB5b3UK
PiAgdGhpbmsgYWJvdXQgY29kZSB0aGF0IGRpZG4ndCAqbmVlZCogaXQsIHRoZW4gdGhlIHdhcm5p
bmcgd2FzCj4gIHVzZWxlc3MgZnJvbSB0aGUgc3RhcnQuCgpXZSBhcmUgbm90IHN1cHByZXNzaW5n
IHRoZSB3YXJuaW5nLiBRdWl0ZSB0aGUgb3Bwb3NpdGUsIGluIGZhY3QuCgo+IFNvIG1ha2UgeW91
ciBtaW5kIHVwOiBkb2VzIENsYW5nJ3Mgc3RyaWN0ZXIgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaAo+
ICBmbGFnIHVwIGNvZGUgdGhhdCBuZWVkcyB0aG91Z2h0IChpbiB3aGljaCBjYXNlIHRoZSBmaXhl
cyB0YWtlCj4gIGVmZm9ydCBib3RoIHRvIGF1dGhvciBhbmQgdG8gcmV2aWV3KQoKQXMgSSBzYWlk
IHNldmVyYWwgdGltZXMgYWxyZWFkeSwgaXQgZG9lcyB0YWtlIHRpbWUgdG8gcmV2aWV3IGlmIHRo
ZQptYWludGFpbmVyIHdhbnRzIHRvIHRha2UgdGhlIGNoYW5jZSB0byBzZWUgaWYgdGhleSBoYWQg
YSBidWcgdG8gYmVnaW4Kd2l0aCwgYnV0IGl0IGRvZXMgbm90IHJlcXVpcmUgdGhvdWdodCBmb3Ig
dGhlIGF1dGhvciBpZiB0aGV5IGp1c3QgZ28KZm9yIGVxdWl2YWxlbnQgY29kZWdlbi4KCj4gb3Ig
ZG9lcyBpdCBmbGFnIHVwIGNvZGUKPiAgdGhhdCBjYW4gYmUgbWluZGxlc3NseSAiZml4ZWQiIChp
biB3aGljaCBjYXNlIHRoZSB3YXJuaW5nIGlzCj4gIHdvcnRobGVzcyk/ICBQcm9wb25lbnRzIGlu
IHRoaXMgdGhyZWFkIHNlZW0gdG8gYmUgdHJ5aW5nIHRvCj4gIGhhdmUgaXQgYm90aCB3YXlzLgoK
QSB3YXJuaW5nIGlzIG5vdCB3b3J0aGxlc3MganVzdCBiZWNhdXNlIHlvdSBjYW4gbWluZGxlc3Ns
eSBmaXggaXQuClRoZXJlIGFyZSBtYW55IGNvdW50ZXJleGFtcGxlcywgZS5nLiBtYW55CmNoZWNr
cGF0Y2gvbGludC9sYW5nLWZvcm1hdC9pbmRlbnRhdGlvbiB3YXJuaW5ncywgZnVuY3Rpb25hbCBv
bmVzIGxpa2UKdGhlIGBpZiAoYSA9IGIpYCB3YXJuaW5nLi4uCgpDaGVlcnMsCk1pZ3VlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
