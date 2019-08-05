Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 292B982C92
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1893489BAE;
	Tue,  6 Aug 2019 07:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F71D89C63;
 Mon,  5 Aug 2019 19:34:57 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x15so75854826wmj.3;
 Mon, 05 Aug 2019 12:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=FFXuFRa8iOJ18WlRqHjA8mIfxhC5O27ek028/P9Nj6g=;
 b=QwKac3JvibxSX/GFX8iR9qxrVTbf/FEbl4q7M6SNxOBzofEll2Mx+B0XsfAQbT4zdL
 i5MnXjviMvG2ugjfWW46ddgJR4CNB5U050aDRampfMhdR7rbgs8xAb2xO5+jRDSCcpiT
 3dp+Klb3H9swbVROhEp/uJsT18GWb7LyCFCYX817QXmz+px5nxkodtaUiO5/9Wtk64wB
 jsGzzpkV4XzlOk5yPyxlIKhrn6Mb7bKf+2hOMtbnOa3pc4b4ls7UtEv6V3RMV36v0NX7
 5IWeO7P2xf+waJt3YuHfBPRsW00ZTMhwcR1hQkZgUqv7QWdJKkVqWE9h8VImALXTNAgj
 XHpg==
X-Gm-Message-State: APjAAAUBRyLQsHflKInCtdTTXOydzKa5crf4Pv/DAT6QWemcwYU0n9TA
 mARl/DCdUDw4YZguXLhwHfGA3TZSIleWW/LqaNA=
X-Google-Smtp-Source: APXvYqzQwPdYG/05WIdvFe7B2TldXfshdQgaGz6CQHxHiMyKKy8UPn3A4735rs5uV/9BZt8J+BjS7BERTS3hlQfdMGY=
X-Received: by 2002:a1c:3cc4:: with SMTP id j187mr27979wma.36.1565033696014;
 Mon, 05 Aug 2019 12:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
In-Reply-To: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 5 Aug 2019 21:34:44 +0200
Message-ID: <CA+icZUUBSnri4oCFoN+Bi_kJoDVYgwjbrBR7D+JAQVqC0AFYLQ@mail.gmail.com>
Subject: Re: [PATCHv2 0/3] convert i915 to new mount API
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=FFXuFRa8iOJ18WlRqHjA8mIfxhC5O27ek028/P9Nj6g=;
 b=WsLcSMIgN5vkl1yy7iONJEshW98E90rrKMzbCSOKKh8JSFEixPuDVuMlstE6TxP4gN
 QUEP99WNKhoqQkTajWuH6ILafJrrHcjcurs34RhJ6qrpsq2910lEtDPjKRGwc6s1qdLg
 +msxnDNP23bk7n/QMR1WKv/nuDTY/coyNBqRBKPiiLQ6akDIqAvrPWT21N9Ge+ztY5l8
 Ng+29x+TRqdCet6LuAM7EtDTSuEPWS6BHbgiopiiHqIk2L0KP9o2EEnkInn8tt+smUDS
 pdslRN/wwRb2XmXyt3fHVbrpoGrGXkq9K7nfhuiYUTmph4efQkYxcMfWZ5H8PhLQq+IR
 ajjQ==
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
Reply-To: sedat.dilek@gmail.com
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgNSwgMjAxOSBhdCA2OjA1IFBNIFNlcmdleSBTZW5vemhhdHNreQo8c2VyZ2V5
LnNlbm96aGF0c2t5QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiAgICAgICAgIEhlbGxvLAo+Cj4gQ29u
dmVydCBpOTE1IHRvIGEgbmV3IG1vdW50IEFQSSBhbmQgZml4IGk5MTVfZ2VtZnNfaW5pdCgpIGtl
cm5lbCBPb3BzLgo+Cj4gSXQgYWxzbyBhcHBlYXJzIHRoYXQgd2UgbmVlZCB0byBFWFBPUlRzIHB1
dF9maWxlc3lzdGVtKCksIHNvIGk5MTUKPiBjYW4gcHJvcGVybHkgcHV0IGZpbGVzeXN0ZW0gYWZ0
ZXIgaXQgaXMgZG9uZSB3aXRoIGtlcm5fbW91bnQoKS4KPgo+IHYyOgo+IC0gZXhwb3J0IHB1dF9m
aWxlc3lzdGVtKCkgW0NocmlzXQo+IC0gYWx3YXlzIHB1dF9maWxlc3lzdGVtKCkgaW4gaTkxNV9n
ZW1mc19pbml0KCkgW0NocmlzXQo+IC0gaW1wcm92ZSBpOTE1X2dlbWZzX2luaXQoKSBlcnJvciBt
ZXNzYWdlIFtDaHJpc10KPgo+IFNlcmdleSBTZW5vemhhdHNreSAoMyk6Cj4gICBmczogZXhwb3J0
IHB1dF9maWxlc3lzdGVtKCkKPiAgIGk5MTU6IGNvbnZlcnQgdG8gbmV3IG1vdW50IEFQSQo+ICAg
aTkxNTogZG8gbm90IGxlYWsgbW9kdWxlIHJlZiBjb3VudGVyCj4KCkZlZSBmcmVlIHRvIGFkZDoK
ClJlcG9ydGVkLWJ5OiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgoKWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0EraWNaVVhoMDY4bThVRmVIRFhDS0RpMFlmTDJa
PVdvT055N0o3REpMcUFUMUNaK3JRQG1haWwuZ21haWwuY29tLwoKPiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtZnMuYyB8IDMzICsrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+
ICBmcy9maWxlc3lzdGVtcy5jICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAyIGZpbGVz
IGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMjIu
MAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
