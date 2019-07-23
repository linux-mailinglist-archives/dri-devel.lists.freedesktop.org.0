Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C595671D9E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 19:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B97C6E321;
	Tue, 23 Jul 2019 17:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC0E6E321
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 17:25:37 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id a97so17224741uaa.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Ak6PHqRtmFYlCwA7eq7sGy4+MyVCFHT7VQHt77QIIY4=;
 b=aySGIuakO1XUsbbMGt3QAK8zI+jyjn/PV7wR7j1+hD2+TJ5HIQtAKSO4fFfHhZfTEq
 4Hse7WiJYy5PkFAoeiB0XQZxTsWzTcCKioVkyRdmfeP6LZs6lElsspj/GBLK6YxXQVAJ
 Gow/R6OeGWMp+BQFn6OF555qOp4yD9LfjNxojy20P52yFKOFR/jMF2lBujTuUMJRJrCf
 HqBu976OftrqQZzJCCT/jdqFn6jNOoBUBLOJ1qcKroHuQK+2Ju2zOKsDpCCxB53bVOw4
 xORlY9yCZ52szh1AgsP6XzsGI6ZKhM+TsT5y0MNk0rkDOKS2S8dk9zlEdkz9uwSEM8eh
 3RiQ==
X-Gm-Message-State: APjAAAXTk2ju6PMdxjXiYwxh7gmaI38Gj8D614yN+BCJLDObkVeUG8Hp
 eJokkBmmIIHxQU2HaDRKGXjYfA==
X-Google-Smtp-Source: APXvYqw0uF8oHC6o3b+oyJybCA0xFk9rEgCNQtXzc3IFxBX1HFG5tKXOR+zyF6vacSP7QeS6Z8/PzA==
X-Received: by 2002:a9f:2e0e:: with SMTP id t14mr31440742uaj.119.1563902737094; 
 Tue, 23 Jul 2019 10:25:37 -0700 (PDT)
Received: from dhcp-10-20-1-165.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id l129sm43826023vki.45.2019.07.23.10.25.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 10:25:36 -0700 (PDT)
Message-ID: <9c9b77b3b76e7a7e87c7c3d9076a8339362157bd.camel@redhat.com>
Subject: Re: [PATCH 1/3] RFT: drm/pl111: Support grayscale
From: Adam Jackson <ajax@redhat.com>
To: Linus Walleij <linus.walleij@linaro.org>, Daniel Tang
 <dt.tangr@gmail.com>,  Fabian Vogt <fabian@ritter-vogt.de>
Date: Tue, 23 Jul 2019 13:25:35 -0400
In-Reply-To: <20190723133755.22677-2-linus.walleij@linaro.org>
References: <20190723133755.22677-1-linus.walleij@linaro.org>
 <20190723133755.22677-2-linus.walleij@linaro.org>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA3LTIzIGF0IDE1OjM3ICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+
IE1pZ3JhdGluZyB0aGUgVEkgbnNwaXJlIGNhbGN1bGF0b3JzIHRvIHVzZSB0aGUgUEwxMTEgZHJp
dmVyIGZvcgo+IGZyYW1lYnVmZmVyIHJlcXVpcmVzIGdyYXlzY2FsZSBzdXBwb3J0IGZvciB0aGUg
ZWxkZXIgcGFuZWwKPiB3aGljaCB1c2VzIDhiaXQgZ3JheXNjYWxlIG9ubHkuCj4gCj4gRFJNIGRv
ZXMgbm90IHN1cHBvcnQgOGJpdCBncmF5c2NhbGUgZnJhbWVidWZmZXJzIGluIG1lbW9yeSwKPiBi
dXQgYnkgZGVmaW5pbmcgdGhlIGJ1cyBmb3JtYXQgdG8gYmUgTUVESUFfQlVTX0ZNVF9ZOF8xWDgg
d2UKPiBjYW4gZ2V0IHRoZSBoYXJkd2FyZSB0byB0dXJuIG9uIGEgZ3JheXNjYWxpbmcgZmVhdHVy
ZSBhbmQKPiBjb252ZXJ0IHRoZSBSR0IgZnJhbWVidWZmZXIgdG8gZ3JheXNjYWxlIGZvciB1cy4K
CldoYXQncyB3cm9uZyB3aXRoIERSTV9GT1JNQVRfUjg/IFllcyB0aGUgaGFyZHdhcmUgaXMgbm90
IHJlYWxseQoicmVkc2NhbGUiLCBidXQgaXQncyBzdGlsbCBhIHNpbmdsZSBjb2xvciBjaGFubmVs
IGFuZCB0aGVyZSdzIG5vdApyZWFsbHkgYW55IGFtYmlndWl0eS4KCi0gYWpheAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
