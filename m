Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A35D12D1E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C48892A7;
	Fri,  3 May 2019 12:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22E9892A6;
 Fri,  3 May 2019 12:05:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h15so1866249wrb.2;
 Fri, 03 May 2019 05:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=YGu1Y9VezXVMpHUohZOs9+Bd2dI9N9DmPcOF3xiObZc=;
 b=YDHLyCY9leT3JuFoW9zAR61OGQduUNYQEJrCxop9g50iJodCc4+ZNsASQZw3H9ftaM
 CzJk+xPF8F7NIopyZEXxVgmhApLLkQYmLi7/rjxahIeQIOvEsOUJZUF42oH+C7Y3uhrI
 cVG9f2BPyFPN9/VD/IC2yrcdYpBuJe6jj/H/v8TonOqVOcnS546uMEjwCf0cDLG1/1lv
 5OpHQR42VUvXxlyK04dBBZ2WP3CTHBSGqZGt8gCUD3ZPXOvXOQMiE/8ydhvQQmhzKG2P
 d/88GXQAuNKFW2mfoy2YUf9KoI4jPEu9CKvgDceLf3PgVWHYRPGvDgCHuwzoAmB8FhT4
 6YdQ==
X-Gm-Message-State: APjAAAXfaXK+NNkvzQ+p3n13C/wCZL5X2mWSnndkv4sdu1KCTQKf9Dt0
 TEagkTLJQNye5IhPaxor7jQ=
X-Google-Smtp-Source: APXvYqyYwnyo89NT41zbGJYLycJsHIGyjlMBU4l16+rP/hKAeRwZLEqVDzlM9YpnUIa9E2fhjOMM6Q==
X-Received: by 2002:adf:ee8d:: with SMTP id b13mr2832098wro.219.1556885150671; 
 Fri, 03 May 2019 05:05:50 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s16sm2232061wrg.71.2019.05.03.05.05.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 05:05:49 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: add struct dma_buf_attach_info v2
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
References: <20190430111002.106168-1-christian.koenig@amd.com>
 <20190430173127.k5ivpaz6ktbfecgo@shell.armlinux.org.uk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cbcbb076-a8b0-67b0-8c16-daf1d060fc1d@gmail.com>
Date: Fri, 3 May 2019 14:05:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430173127.k5ivpaz6ktbfecgo@shell.armlinux.org.uk>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YGu1Y9VezXVMpHUohZOs9+Bd2dI9N9DmPcOF3xiObZc=;
 b=dHc+xc8DYo3RihRctct4xWfaqJ5SiX1ja6MN1EHUcGdv8NLKKo084y9NitaTrPJgYv
 aAhc+nzQ5ZZWKvAkpv28d6EAduw3v39ezTmTYG/PwQ3UidrlrHS8yr52WR103xl+lxfY
 YyXTAVmH0V2lfgBbhIqhimNFXV2fMOQr3s5NklwAKZ+0NHpclKF//gDz7h2uYE7a8g8D
 UJEjKTsLt4q2uzP9/i/RSejAxgqvj2CpFIO2ZejuY2/sZfmbDspQ4oqw2cW/LVRkRvAN
 QA73UZngNoLmxfu7il/Q30G1JR104TYnxZBZ11sCnK2HEkQk5mjFkgF+I+6aFsPh1Mj0
 WIJA==
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
Reply-To: christian.koenig@amd.com
Cc: maxime.ripard@bootlin.com, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, digetx@gmail.com, m.szyprowski@samsung.com,
 devel@driverdev.osuosl.org, sstabellini@kernel.org, arnd@arndb.de,
 jonathanh@nvidia.com, tomi.valkeinen@ti.com, xen-devel@lists.xenproject.org,
 linux-media@vger.kernel.org, pawel@osciak.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org,
 boris.ostrovsky@oracle.com, mchehab@kernel.org, sean@poorly.run,
 jgross@suse.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 kyungmin.park@samsung.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMTkgdW0gMTk6MzEgc2NocmllYiBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRt
aW46Cj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDE6MTA6MDJQTSArMDIwMCwgQ2hyaXN0aWFu
IEvDtm5pZyB3cm90ZToKPj4gQWRkIGEgc3RydWN0dXJlIGZvciB0aGUgcGFyYW1ldGVycyBvZiBk
bWFfYnVmX2F0dGFjaCwgdGhpcyBtYWtlcyBpdCBtdWNoIGVhc2llcgo+PiB0byBhZGQgbmV3IHBh
cmFtZXRlcnMgbGF0ZXIgb24uCj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcmVhc29uaW5nLiAg
V2hhdCBhcmUgdGhlICJuZXcgcGFyYW1ldGVycyIgdGhhdAo+IGFyZSBiZWluZyBwcm9wb3NlZCwg
YW5kIHdoeSBkbyB3ZSBuZWVkIHRvIHB1dCB0aGVtIGludG8gbWVtb3J5IHRvIHBhc3MKPiB0aGVt
IGFjcm9zcyB0aGlzIGludGVyZmFjZT8KPgo+IElmIHRoZSBpbnRlbnRpb24gaXMgdG8gbWFrZSBp
dCBlYXNpZXIgdG8gY2hhbmdlIHRoZSBpbnRlcmZhY2UsIHBhc3NpbmcKPiBwYXJhbWV0ZXJzIGlu
IHRoaXMgbWFubmVyIG1lYW4gdGhhdCBpdCdzIGVhc3kgZm9yIHRoZSBpbnRlcmZhY2UgdG8KPiBj
aGFuZ2UgYW5kIGRyaXZlcnMgbm90IHRvIG5vdGljZSB0aGUgY2hhbmdlcywgc2luY2UgdGhlIGNv
bXBpbGVyIHdpbGwKPiBub3Qgd2FybiAodW5sZXNzIHNvbWUgbWVtYmVyIG9mIHRoZSBzdHJ1Y3R1
cmUgdGhhdCB0aGUgZHJpdmVyIGlzIHVzaW5nCj4gZ2V0cyByZW1vdmVkLCBpbiB3aGljaCBjYXNl
IGl0IHdpbGwgZXJyb3IuKQo+Cj4gQWRkaXRpb25zIHRvIHRoZSBzdHJ1Y3R1cmUgd2lsbCBnbyB1
bm5vdGljZWQgYnkgZHJpdmVycyAtIHdoYXQgaWYgdGhlCj4gY2FsbGVyIGlzIGV4cGVjdGluZyBz
b21lIGRpZmZlcmVudCBraW5kIG9mIGJlaGF2aW91ciwgYW5kIHRoZSBkcml2ZXIKPiBpZ25vcmVz
IHRoYXQgbmV3IGFkZGl0aW9uPwoKV2VsbCwgZXhhY3RseSB0aGF0J3MgdGhlIGludGVudGlvbiBo
ZXJlOiBUaGF0IHRoZSBkcml2ZXJzIHVzaW5nIHRoaXMgCmludGVyZmFjZSBzaG91bGQgYmUgYWJs
ZSB0byBpZ25vcmUgdGhlIG5ldyBhZGRpdGlvbnMgZm9yIG5vdyBhcyBsb25nIGFzIAp0aGV5IGFy
ZSBub3QgZ29pbmcgdG8gdXNlIHRoZW0uCgpUaGUgYmFja2dyb3VuZCBpcyB0aGF0IHdlIGhhdmUg
bXVsdGlwbGUgaW50ZXJmYWNlIGNoYW5nZXMgaW4gdGhlIApwaXBlbGluZSwgYW5kIGVhY2ggc3Rl
cCByZXF1aXJlcyBuZXcgb3B0aW9uYWwgcGFyYW1ldGVycy4KCj4gVGhpcyBkb2Vzbid0IHNlZW0g
dG8gbWUgbGlrZSBhIGdvb2QgaWRlYS4KCldlbGwsIHRoZSBvYnZpb3VzIGFsdGVybmF0aXZlcyBh
cmU6CgphKSBDaGFuZ2UgYWxsIGRyaXZlcnMgdG8gZXhwbGljaXRseSBwcm92aWRlIE5VTEwvMCBm
b3IgdGhlIG5ldyBwYXJhbWV0ZXJzLgoKYikgVXNlIGEgd3JhcHBlciwgc28gdGhhdCB0aGUgZnVu
Y3Rpb24gc2lnbmF0dXJlIG9mIGRtYV9idWZfYXR0YWNoIHN0YXlzIAp0aGUgc2FtZS4KCktleSBw
b2ludCBoZXJlIGlzIHRoYXQgSSBoYXZlIGFuIGludmFsaWRhdGlvbiBjYWxsYmFjayBjaGFuZ2Us
IGEgUDJQIApwYXRjaCBzZXQgYW5kIHNvbWUgbG9ja2luZyBjaGFuZ2VzIHdoaWNoIGFsbCByZXF1
aXJlIGFkZGluZyBuZXcgCnBhcmFtZXRlcnMgb3IgZmxhZ3MuIEFuZCBhdCBlYWNoIHN0ZXAgSSB3
b3VsZCB0aGVuIHN0YXJ0IHRvIGNoYW5nZSBhbGwgCmRyaXZlcnMsIGFkZGluZyBzb21lIG1vcmUg
TlVMTCBwb2ludGVycyBvciBmbGFncyB3aXRoIDAgZGVmYXVsdCB2YWx1ZS4KCkknbSBhY3R1YWxs
eSBwZXJmZWN0bHkgZmluZSBnb2luZyBkb3duIGFueSByb3V0ZSwgYnV0IHRoaXMganVzdCBzZWVt
ZWQgCnRvIG1lIHNpbXBsZXN0IGFuZCB3aXRoIHRoZSBsZWFzdCByaXNrIG9mIGJyZWFraW5nIGFu
eXRoaW5nLiBPcGluaW9ucz8KClRoYW5rcywKQ2hyaXN0aWFuLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
