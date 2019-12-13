Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82B811F221
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798566E391;
	Sat, 14 Dec 2019 14:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928476E904
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:35:25 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y1so2262238lfb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 07:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P748Vsp09cCRTRcxy70hlgcdkJz7E0UTUbE5zxl6voc=;
 b=VD6f5w97NY3gcooN97XbqvnT/Br1DI5DCw9FYJLBtQFsBThPlz9IBIhNH6oxgpxQeL
 dRD8cGFDUh6JMp7ZBzCxo4K8arT7Mesy41KOmPNW7e1YnJmTnJovUMdTTcEBooYsXfdv
 Y4gHujAkyKh1Z2JfWp068Brc7+uDS6YigBFtqjnnEGMPXU+XkdJoFleN0XaBTYhLFokO
 1CBa6xCMcieD4WrKHV8qUbOqWL6iEixm1w6f/JXbDqecPP/wEcJyYFO+vFJ62GJNlvfr
 agVKwsa0A2cx5WG7ufyshCeVAz1BUYM+FFmUXlYW++RuMcgX32ISjWHni2pjgUYtmQsd
 CLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P748Vsp09cCRTRcxy70hlgcdkJz7E0UTUbE5zxl6voc=;
 b=FZ+2hhun76K2Vtpz6UjeelKpEnqVFtO0cONILY2vpe45Ow1AfYhjh9922018I2g9Rf
 ZkQ9DSl1/uB7HIRgxqWUE41p8/0tKowTy5/oM406HkY152tb+6Ot+oJbzTkLyKKkVv72
 XI7ra6FHNtOV7IpJkTbBMs34okVfRmowVSsUPZLH2C1/H8Pn98CfzmCbTgin2WTTaHu0
 /5ezoGz9X1oGQu8mozW1vds54qG4ARU7Shu1k/fLWYr8g4fMdlritlsKtFXMz2dJu7ec
 IIwIZxHWzVue2AOrfeTmGSWcR6h1+Gtjd/LSv91LLaUQpwicdTp0DhiZVAZhU9bIPTDm
 SBNw==
X-Gm-Message-State: APjAAAWXtPibQZNOMQj8ZvyAf474BLjc0+kAhUB/048pE1W+fBVlkxTF
 cjMRyKi0cDMYfhDtWtBTOOgp2JGZ
X-Google-Smtp-Source: APXvYqxKzjmZ4Yx0JOzoVg23GJOQquInIo6XIAoRuSVfBy5812lcbMiIrxHtnQtwhPEeX0pF9HuC/Q==
X-Received: by 2002:a19:7604:: with SMTP id c4mr9629825lff.101.1576251323734; 
 Fri, 13 Dec 2019 07:35:23 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id n5sm4975554ljh.86.2019.12.13.07.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 07:35:23 -0800 (PST)
Subject: Re: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
To: Thierry Reding <thierry.reding@gmail.com>
References: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
 <20191213151045.GB222809@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d03876b8-b0d1-850b-7ae8-a61302e23843@gmail.com>
Date: Fri, 13 Dec 2019 18:35:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191213151045.GB222809@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTMuMTIuMjAxOSAxODoxMCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBGcmksIERl
YyAxMywgMjAxOSBhdCAxMjoyNTozM0FNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IEhlbGxvIFRoaWVycnksCj4+Cj4+IENvbW1pdCBbMV0gaW50cm9kdWNlZCBhIHNldmVyZSBHUFUg
cGVyZm9ybWFuY2UgcmVncmVzc2lvbiBvbiBUZWdyYTIwIGFuZAo+PiBUZWdyYTMwIHVzaW5nLgo+
Pgo+PiBbMV0KPj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aD12NS41LXJjMSZpZD1mYTY2NjFiN2FhMGI1
MjA3MzY4MWIwZDI2NzQyNjUwYzhjYmQzMGYzCj4+Cj4+IEludGVyZXN0aW5nbHkgdGhlIHBlcmZv
cm1hbmNlIGlzIG9rYXkgb24gVGVncmEzMCBpZgo+PiBDT05GSUdfVEVHUkFfSE9TVDFYX0ZJUkVX
QUxMPW4sIGJ1dCB0aGF0IGRvZXNuJ3QgbWFrZSBkaWZmZXJlbmNlIGZvcgo+PiBUZWdyYTIwLgo+
Pgo+PiBJIHdhcyB0ZWxsaW5nIHlvdSBhYm91dCB0aGlzIHByb2JsZW0gb24gdGhlICN0ZWdyYSBJ
UkMgc29tZXRpbWUgYWdvIGFuZAo+PiB5b3UgYXNrZWQgdG8gcmVwb3J0IGl0IGluIGEgdHJhY2th
YmxlIGZvcm0sIHNvIGZpbmFsbHkgaGVyZSBpdCBpcy4KPj4KPj4gWW91IGNvdWxkIHJlcHJvZHVj
ZSB0aGUgcHJvYmxlbSBieSBydW5uaW5nIFsyXSBsaWtlIHRoaXMKPj4gYGdyYXRlL3RleHR1cmUt
ZmlsdGVyIC1mIC1zYCB3aGljaCBzaG91bGQgcHJvZHVjZSBvdmVyIDEwMCBGUFMgZm9yIDcyMHAK
Pj4gZGlzcGxheSByZXNvbHV0aW9uIGFuZCBjdXJyZW50bHkgaXQncyB+MTEgRlBTLgo+Pgo+PiBb
Ml0KPj4gaHR0cHM6Ly9naXRodWIuY29tL2dyYXRlLWRyaXZlci9ncmF0ZS9ibG9iL21hc3Rlci90
ZXN0cy9ncmF0ZS90ZXh0dXJlLWZpbHRlci5jCj4+Cj4+IFByZXZpb3VzbHkgSSB3YXMgc2VlaW5n
IHNvbWUgbWVtb3J5IGVycm9ycyBjb21pbmcgZnJvbSBIb3N0MXggRE1BLCBidXQKPj4gZG9uJ3Qg
c2VlIGFueSBlcnJvcnMgYXQgYWxsIHJpZ2h0IG5vdy4KPj4KPj4gSSBkb24ndCBzZWUgYW55dGhp
bmcgZG9uZSBob3JyaWJseSB3cm9uZyBpbiB0aGUgb2ZmZW5kaW5nIGNvbW1pdC4KPj4KPj4gVW5m
b3J0dW5hdGVseSBJIGNvdWxkbid0IGRlZGljYXRlIGVub3VnaCB0aW1lIHRvIHNpdCBkb3duIGFu
ZCBkZWJ1ZyB0aGUKPj4gcHJvYmxlbSB0aG9yb3VnaGx5IHlldC4gUGxlYXNlIGxldCBtZSBrbm93
IGlmIHlvdSdsbCBmaW5kIGEgc29sdXRpb24sCj4+IEknbGwgYmUgaGFwcHkgdG8gdGVzdCBpdC4g
VGhhbmtzIGluIGFkdmFuY2UhCj4gCj4gSSBzdXNwZWN0IHRoYXQgdGhlIHByb2JsZW0gaGVyZSBp
cyB0aGF0IHdlJ3JlIG5vdyB1c2luZyB0aGUgRE1BIEFQSSwKPiB3aGljaCBjYXVzZXMgdGhlIDMy
LWJpdCBBUk0gRE1BL0lPTU1VIGdsdWUgdG8gYmUgdXNlZC4gSSB2YWd1ZWx5IHJlY2FsbAo+IHRo
YXQgdGhhdCBjb2RlIGRvZXNuJ3QgY29hbGVzY2UgZW50cmllcyBpbiB0aGUgU0cgdGFibGUsIHNv
IHdlIG1heSBlbmQKPiB1cCBjYWxsaW5nIGlvbW11X21hcCgpIGEgbG90IG9mIHRpbWVzLCBhbmQg
bWlzcyBvdXQgb24gbXVjaCBvZiB0aGUKPiBhZHZhbnRhZ2VzIHRoYXQgdGhlIC0+aW90bGJfc3lu
Y19tYXAoKSBnaXZlcyB1cyBvbiBUZWdyYTIwLgo+IAo+IEF0IHRoZSBzYW1lIHRpbWUgZG1hX21h
cF9zZygpIHdpbGwgZmx1c2ggY2FjaGVzLCB3aGljaCB3ZSBkaWRuJ3QgZG8KPiBiZWZvcmUuIFRo
aXMgd2Ugc2hvdWxkIGJlIGFibGUgdG8gaW1wcm92ZSBieSBwYXNzaW5nIHRoZSBhdHRyaWJ1dGUK
PiBETUFfQVRUUl9TS0lQX0NQVV9TWU5DIHRvIGRtYV9tYXBfc2coKSB3aGVuIHdlIGtub3cgdGhh
dCB0aGUgY2FjaGUKPiBtYWludGVuYW5jZSBpc24ndCBuZWVkZWQuCj4gCj4gQW5kIHdoaWxlIHRo
aW5raW5nIGFib3V0IGl0LCBvbmUgb3RoZXIgZGlmZmVyZW5jZSBpcyB0aGF0IHdpdGggdGhlIERN
QQo+IEFQSSB3ZSBhY3R1YWxseSBtYXAvdW5tYXAgdGhlIGJ1ZmZlcnMgZm9yIGV2ZXJ5IHN1Ym1p
c3Npb24uIFRoaXMgaXMKPiBiZWNhdXNlIHRoZSBETUEgQVBJIHNlbWFudGljcyByZXF1aXJlIHRo
YXQgYnVmZmVycyBiZSBtYXBwZWQvdW5tYXBwZWQKPiBldmVyeSB0aW1lIHlvdSB1c2UgdGhlbS4g
UHJldmlvdXNseSB3ZSB3b3VsZCBiYXNpY2FsbHkgb25seSBtYXAgZWFjaAo+IGJ1ZmZlciBvbmNl
IChhdCBhbGxvY2F0aW9uIHRpbWUpIGFuZCBvbmx5IGhhdmUgdG8gZGVhbCB3aXRoIGNhY2hlCj4g
bWFpbnRlbmFuY2UsIHNvIHRoZSBvdmVyaGVhZCBwZXIgc3VibWlzc2lvbiB3YXMgZHJhc3RpY2Fs
bHkgbG93ZXIuCj4gCj4gSWYgRE1BX0FUVFJfU0tJUF9DUFVfU1lOQyBkb2Vzbid0IGdpdmUgdXMg
ZW5vdWdoIG9mIGFuIGltcHJvdmVtZW50LCB3ZQo+IG1heSB3YW50IHRvIHJlc3RvcmUgZXhwbGlj
aXQgSU9NTVUgdXNhZ2UsIGF0IGxlYXN0IG9uIGFueXRoaW5nIHByaW9yIHRvCj4gVGVncmExMjQg
d2hlcmUgd2UncmUgdW5saWtlbHkgdG8gZXZlciB1c2UgZGlmZmVyZW50IElPTU1VIGRvbWFpbnMg
YW55d2F5Cj4gKGJlY2F1c2UgdGhleSBhcmUgc3VjaCBhIHNjYXJjZSByZXNvdXJjZSkuCgpUZWdy
YTIwIGRvZXNuJ3QgdXNlIElPTU1VIGluIGEgdmFuaWxsYSB1cHN0cmVhbSBrZXJuZWwgKHlldCks
IHNvIEkgZG9uJ3QKdGhpbmsgdGhhdCBpdCdzIHRoZSByb290IG9mIHRoZSBwcm9ibGVtLiBEaXNh
YmxpbmcgSU9NTVUgZm9yIFRlZ3JhMzAKYWxzbyBkaWRuJ3QgaGVscCAoSUlSQykuCgpUaGUgb2Zm
ZW5kaW5nIHBhdGNoIHNob3VsZG4ndCBjaGFuZ2UgYW55dGhpbmcgaW4gcmVnYXJkcyB0byB0aGUg
RE1BIEFQSSwKaWYgSSdtIG5vdCBtaXNzaW5nIHNvbWV0aGluZy4gU3RyYW5nZS4uCgpQbGVhc2Ug
a2VlcCBtZSB1cC10by1kYXRlIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
