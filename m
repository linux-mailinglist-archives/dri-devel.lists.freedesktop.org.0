Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E97A324381
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 19:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290C76EB1C;
	Wed, 24 Feb 2021 18:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9356EB1C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 18:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614189976;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=toxhg0cmaDLsC5HXvtt/9Q6frW8bNQ4QoBennLsllvk=;
 b=Tar5XuXT0wqJjprJB3ZPv0bvdxCWQcuE/LCwg6o6HULP8nUO2iSIuaThz6IHi28rGBeNqN
 weBSg456icbdDzzIN82tRcTN6x16BEk8tlE2gDTByTayxICqO0vJV0XdlIyT2mfwz7L6uv
 2EDHzG3KnhI+R6YGud6NH6sK2IMGTFM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-O186F-xwN_ODfj8lhZnNuQ-1; Wed, 24 Feb 2021 13:06:12 -0500
X-MC-Unique: O186F-xwN_ODfj8lhZnNuQ-1
Received: by mail-qt1-f198.google.com with SMTP id a41so2266620qtk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 10:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=toxhg0cmaDLsC5HXvtt/9Q6frW8bNQ4QoBennLsllvk=;
 b=HLeomOsji2AdtSQOjSyo19jC6HWNv9p88y/G8XUURPJ/IcH8yH/D/GLMKm+fzfBk41
 28xDzBNotG7Jm9rgIRcpSh33LP38mg5oEO7lUVFAr/62TP3fhe3GAVhjzGtP1RXz/0Tv
 sl65a8P0ep2x59lM2osrghNYeA+SYDp6UvFvES8vqaNIEYkV0PPfHYCBgjn7kYWtYxGd
 Ws/ce5u9HDCVIIcKWrHFho2qm3U3rsHBE8eR9y21UYOYd3T0OWgDNTw2atLjC6oD+mpc
 vHCmu7irIvnDMHL8BdPQR3s+u4r1rtNCbeoYmhAjrs7Jzf5AanGa5VvmYlfloyJ6bXoR
 OcKg==
X-Gm-Message-State: AOAM533TXPm4fOUAOB1DTvggBoFnqpG0x5pmg/duj/6o3vqLJ4BaCb+J
 kLq2Q0NuyMvFTFAb+vCtBz4j1Dc5n9OnvLlLyBdKv3ttKcwJxddJMcV4ByxBbO9gs7jz1LiMUa+
 j0TNQ4YPo6EVHxq2A4SCzkI6XTq1x
X-Received: by 2002:aed:2c85:: with SMTP id g5mr5616529qtd.306.1614189971750; 
 Wed, 24 Feb 2021 10:06:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJwe+mRTTlP+grZsk6m2cwXYETqnTRPylzZOnv4KQT3mbXpASK44Fyx+/0UBtQmUKuE5N5fw==
X-Received: by 2002:aed:2c85:: with SMTP id g5mr5616519qtd.306.1614189971551; 
 Wed, 24 Feb 2021 10:06:11 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 18sm1672101qtw.70.2021.02.24.10.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:06:10 -0800 (PST)
Message-ID: <cbb963ec0b2fb93ddbc81f83e5e6eba4264b9a5c.camel@redhat.com>
Subject: Re: [PATCH 0/2] Set CLEAR_PAYLOAD_ID_TABLE as broadcast request
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Date: Wed, 24 Feb 2021 13:06:09 -0500
In-Reply-To: <20210222040027.23505-1-Wayne.Lin@amd.com>
References: <20210222040027.23505-1-Wayne.Lin@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: eryk.brol@amd.com, qingqing.zhuo@amd.com, stable@vger.kernel.org,
 jerry.zuo@amd.com, Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

b29oLCBuaWNlIGNhdGNoZXMhIEZvciB0aGUgd2hvbGUgc2VyaWVzIHRoaXMgaXM6CgpSZXZpZXdl
ZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCkkgd2lsbCBnbyBhaGVhZCBhbmQg
cHVzaCB0aGVzZSB0byBkcm0tbWlzYy1uZXh0CgpPbiBNb24sIDIwMjEtMDItMjIgYXQgMTI6MDAg
KzA4MDAsIFdheW5lIExpbiB3cm90ZToKPiBXaGlsZSB0ZXN0aW5nIE1TVCBob3RwbHVnIGV2ZW50
cyBvbiBkYWlzeSBjaGFpbiBtb25pdG9ycywgZmluZCBvdXQKPiB0aGF0IENMRUFSX1BBWUxPQURf
SURfVEFCTEUgaXMgbm90IGJyb2FkY2FzdGVkIGFuZCBwYXlsb2FkIGlkIHRhYmxlCj4gaXMgbm90
IHJlc2V0LiBEaWcgaW4gZGVlcGVyIGFuZCBmaW5kIG91dCB0d28gcGFydHMgbmVlZGVkIHRvIGJl
IGZpeGVkLgo+IAo+IDEuIExpbmtfQ291bnRfVG90YWwgJiBMaW5rX0NvdW50X1JlbWFpbmluZyBv
ZiBCcm9hZGNhc3QgbWVzc2FnZSBhcmUKPiBpbmNvcnJlY3QuIFNob3VsZCBzZXQgbGN0PTEgJiBs
Y3I9Ngo+IDIuIENMRUFSX1BBWUxPQURfSURfVEFCTEUgcmVxdWVzdCBtZXNzYWdlIGlzIG5vdCBz
ZXQgYXMgcGF0aCBicm9hZGNhc3QKPiByZXF1ZXN0IG1lc3NhZ2UuIFNob3VsZCBmaXggdGhpcy4K
PiAKPiBXYXluZSBMaW4gKDIpOgo+IMKgIGRybS9kcF9tc3Q6IFJldmlzZSBicm9hZGNhc3QgbXNn
IGxjdCAmIGxjcgo+IMKgIGRybS9kcF9tc3Q6IFNldCBDTEVBUl9QQVlMT0FEX0lEX1RBQkxFIGFz
IGJyb2FkY2FzdAo+IAo+IMKgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8
IDE0ICsrKysrKysrKysrLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPiAKPiAtLQo+IDIuMTcuMQo+IAoKLS0gClNpbmNlcmVseSwKICAgTHl1
ZGUgUGF1bCAoc2hlL2hlcikKICAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAogICAKTm90
ZTogSSBkZWFsIHdpdGggYSBsb3Qgb2YgZW1haWxzIGFuZCBoYXZlIGEgbG90IG9mIGJ1Z3Mgb24g
bXkgcGxhdGUuIElmIHlvdSd2ZQphc2tlZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGluZyBmb3Ig
YSByZXZpZXcvbWVyZ2Ugb24gYSBwYXRjaCwgZXRjLiBhbmQgSQpoYXZlbid0IHJlc3BvbmRlZCBp
biBhIHdoaWxlLCBwbGVhc2UgZmVlbCBmcmVlIHRvIHNlbmQgbWUgYW5vdGhlciBlbWFpbCB0byBj
aGVjawpvbiBteSBzdGF0dXMuIEkgZG9uJ3QgYml0ZSEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
