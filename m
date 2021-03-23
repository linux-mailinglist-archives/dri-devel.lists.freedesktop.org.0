Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E33345D18
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C803B6E8BC;
	Tue, 23 Mar 2021 11:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073296E8BC;
 Tue, 23 Mar 2021 11:39:29 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id q18so6582835uas.11;
 Tue, 23 Mar 2021 04:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jWd4Ah9+UKZUMTNKlTR6tTi9e4IEQ3A7/7UYNOEhWgk=;
 b=Zy0LI4WgEinuGCSgciAuIi220oIK1wYFSJTIlGZ8zZ0qH//GmPNYXWNzhWx6qFuptr
 LkywILx6bDxhBWiVlPWg0v4UtYz9r/nh2h5q5zOqBM0MipuV4swdT2bkpn4/x3KAVZMd
 hJ3zBKhlNaC7VVWwtRvrY/QfmUf1Y7b0qL3ToDm7K/+nqPCmFl8tTscsFroStqV5q4s+
 jO5MM4TD04/08tRO331LuMZ1H3ty1zvzysxOnH/UR5wXFP9GNTyDkZG+ELM9cUibE+bO
 tyDga7Eua0Ddxh3I0Cb/MZtaf0y0lApnq4sPpW7KjXiZJnW9vWc7nC5b7lQJWCZhYjSa
 Xi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jWd4Ah9+UKZUMTNKlTR6tTi9e4IEQ3A7/7UYNOEhWgk=;
 b=CgXEzoMjGaJHUkeMhKsIpXTblT/14OjgjPDcOe5CcgMvrGqnFTmPAf3APKBaHunRQl
 APXUAe6yFYzG93WZP/NNmTXahCC1UGbTLBbqzs/ct0dfIxkA29oHDRF4FjzSAqgdy6Ic
 UDK7xnfnJbYyY3/dtC12bKjCRJXwKuK/NLXg7C5IqNvGKU0AcU2yEQqMLdMw0jQcmzjh
 WXeUsQVpSjxIZG5Lsxhp8qkj4dy+ouinhPB0DFSz0po8wZdyNppyjg9qgX7Mdk8z/v9t
 IIl3pz3emBTutCLTcxHSm0/F8MIx+hPGgwk55tSbYydrez9m6sqMdSzSA9t39jaqaKCc
 UmMw==
X-Gm-Message-State: AOAM532fybvnE/U3wRh9sFO16aH2r6xYkWXKjYVwodrIoKtR/KhBi9Lp
 lwl1YNAa+bciwwHCghx1gtVwo6OfLDV3tNfKu/A=
X-Google-Smtp-Source: ABdhPJzKaAFGxeyxpFpXgX6baOVQd4rV8AdYt/v5U5rOjJZkuMeUlGuvkjXtOlp6aD/2LJ0tH21yM/B9ocGridIkhnM=
X-Received: by 2002:a9f:2d90:: with SMTP id v16mr2777321uaj.138.1616499569175; 
 Tue, 23 Mar 2021 04:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <1616467572-112804-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1616467572-112804-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 23 Mar 2021 12:39:19 +0100
Message-ID: <CAH9NwWffN0zAYSTg-zuB=cfSbNeB-J1ddpoM_7knD+inEbTFGw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Remove redundant NULL check
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG Mailman List <linaro-mm-sig@lists.linaro.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRGkuLCAyMy4gTcOkcnogMjAyMSB1bSAwMzo0NiBVaHIgc2NocmllYiBKaWFwZW5nIENob25n
CjxqaWFwZW5nLmNob25nQGxpbnV4LmFsaWJhYmEuY29tPjoKPgo+IEZpeCB0aGUgZm9sbG93aW5n
IGNvY2NpY2hlY2sgd2FybmluZ3M6Cj4KPiAuL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2
aXZfZ2VtX3N1Ym1pdC5jOjYyMjoyLTg6IFdBUk5JTkc6IE5VTEwKPiBjaGVjayBiZWZvcmUgc29t
ZSBmcmVlaW5nIGZ1bmN0aW9ucyBpcyBub3QgbmVlZGVkLgo+Cj4gLi9kcml2ZXJzL2dwdS9kcm0v
ZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYzo2MTg6Mi04OiBXQVJOSU5HOiBOVUxMCj4gY2hl
Y2sgYmVmb3JlIHNvbWUgZnJlZWluZyBmdW5jdGlvbnMgaXMgbm90IG5lZWRlZC4KPgo+IC4vZHJp
dmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fc3VibWl0LmM6NjE2OjItODogV0FSTklO
RzogTlVMTAo+IGNoZWNrIGJlZm9yZSBzb21lIGZyZWVpbmcgZnVuY3Rpb25zIGlzIG5vdCBuZWVk
ZWQuCj4KPiBSZXBvcnRlZC1ieTogQWJhY2kgUm9ib3QgPGFiYWNpQGxpbnV4LmFsaWJhYmEuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IEppYXBlbmcgQ2hvbmcgPGppYXBlbmcuY2hvbmdAbGludXguYWxp
YmFiYS5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVp
bmVyQGdtYWlsLmNvbT4KCi0tIApncmVldHMKLS0KQ2hyaXN0aWFuIEdtZWluZXIsIE1TYwoKaHR0
cHM6Ly9jaHJpc3RpYW4tZ21laW5lci5pbmZvL3ByaXZhY3lwb2xpY3kKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
