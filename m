Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F8410EC31
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 16:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D843892D4;
	Mon,  2 Dec 2019 15:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368F1892D4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 15:20:35 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id a124so9078897oii.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 07:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PZuADHJjdt3e4tzY3ik1VV2f6I5KfdSAWCDV5TgBy8c=;
 b=RlVphyzVz7sp2U1p2TgPkvXm4VF45ENJKqDFrwMChhdRU4F2+GyjbPzTEDAf5r4r3G
 X6y74l76nxnkX29IoNdd9gP312KCxJGQhKHPH4ttE6TZGWfX6/SxdpbbTQK+A7nCB8cE
 cXn9R3rwv3xBs0R0j26x7jOqtoA2aQzSBwve2Mz1pq5pXMx8AvX1O4xjOrB1vA13L+Tu
 BrrWXI+iH4W1G5nlYX80uDOpEQ7D+nJgMWqYUBNx9UvklXJ3riQc1w0omtVqn37kDCME
 lZJSV7GF0HM2bxiX6QFpl/2OHEiU1mL9CiRHxg1BR77X1C2PsDrEUXPytiLJINVhCf6q
 N45g==
X-Gm-Message-State: APjAAAU+rH3GVurU36aZuyDfDfqaqhDm8XA8TxmuAcExqWpn0wbBZhms
 y2HNsr1ZeW8gpNLv48nHxX/n7QmKSUpBF68d4yU=
X-Google-Smtp-Source: APXvYqxcJujnpy6eDi+fniufBaWM+dXwkUtuBqcg/errP/gLT+ZjwUJ1hx2NltqHxVQShTGK67k/PLx269WTrKFYnq4=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr8555094oia.102.1575300034214; 
 Mon, 02 Dec 2019 07:20:34 -0800 (PST)
MIME-Version: 1.0
References: <20191202133650.11964-1-linux@roeck-us.net>
In-Reply-To: <20191202133650.11964-1-linux@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Dec 2019 16:20:23 +0100
Message-ID: <CAMuHMdUz7gewcFPE=cnVENGdwVp6AZD7U4y1PtwXTAmoGmvGUg@mail.gmail.com>
Subject: Re: [PATCH] drm/dp_mst: Fix build on systems with STACKTRACE_SUPPORT=n
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMiwgMjAxOSBhdCAyOjQxIFBNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNr
LXVzLm5ldD4gd3JvdGU6Cj4gT24gc3lzdGVtcyB3aXRoIFNUQUNLVFJBQ0VfU1VQUE9SVD1uLCB3
ZSBnZXQ6Cj4KPiBXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZv
ciBTVEFDS1RSQUNFCj4gICBEZXBlbmRzIG9uIFtuXTogU1RBQ0tUUkFDRV9TVVBQT1JUCj4gICBT
ZWxlY3RlZCBieSBbeV06Cj4gICAtIFNUQUNLREVQT1QgWz15XQo+Cj4gYW5kIGJ1aWxkIGVycm9y
cyBzdWNoIGFzOgo+Cj4gbTY4ay1saW51eC1sZDoga2VybmVsL3N0YWNrdHJhY2UubzogaW4gZnVu
Y3Rpb24gYHN0YWNrX3RyYWNlX3NhdmUnOgo+ICgudGV4dCsweDExYyk6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYHNhdmVfc3RhY2tfdHJhY2UnCj4KPiBBZGQgdGhlIG1pc3NpbmcgZGVlbmRlbmN5
IG9uIFNUQUNLVFJBQ0VfU1VQUE9SVC4KPgo+IEZpeGVzOiAxMmEyODBjNzI4NjggKCJkcm0vZHBf
bXN0OiBBZGQgdG9wb2xvZ3kgcmVmIGhpc3RvcnkgdHJhY2tpbmcgZm9yIGRlYnVnZ2luZyIpCj4g
Q2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBw
b29ybHkucnVuPgo+IFNpZ25lZC1vZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVz
Lm5ldD4KCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3Jn
PgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0g
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
