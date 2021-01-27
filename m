Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FFF30642A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 20:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEC86E87E;
	Wed, 27 Jan 2021 19:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5E46E87D;
 Wed, 27 Jan 2021 19:35:07 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id i9so2679012wmq.1;
 Wed, 27 Jan 2021 11:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jEwuMp7A3WWSP0TnGIOE+Ahd5LOZUBmATUawOOig7sk=;
 b=JK2IbSZqz64q13wnxXmAH1Vmz22VHQQmRhPdVmljoGkYCqBcKtE/B32QsY+KDm2Km9
 jYjS7R1FnduEXDThiIM7t+g78LUbqrlcJIZZ84CqXuzL8Rbzlt2qrjvUj0vih0HhiZdQ
 bHbSYMEy0/SJxPWmStMn6OG9C+gdVXlsoUUsCbpCng7iBjuPquOTwRwQt6HFkYJWpI3R
 tm7Nhb1eVqtZtOd6vcO/eHe6MDWmwYmidrCwy4wMUid3ybk+np8qenVq5NPmSSEdExEN
 H3Iv+k2qe3hc05A4/7lmhQ5iV0C8HEI4atIg2/TCjtH/g/g1je/iLqhabq6o5Z+pCtke
 Vi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jEwuMp7A3WWSP0TnGIOE+Ahd5LOZUBmATUawOOig7sk=;
 b=ofDg8JgVp6gU6LU5CODXBVyCm/Ip73iLzoyW4AsatiMNSmiFFjzncLodOvTz2IMnB+
 hJLdh7BT3AzGpSSeb+M6qeLa3Z9A18KE8RwoxQAS6SZ+6DyChkJ9855FFJzLgcMXRw88
 qK5f9OpiqVIwaFf2V0HhNWp7KvSEERYVvUxTYY6oxeVY+n4Udgfe89hrZnW9UVkYNg7h
 cHgZN6kmwYPko5ohVKzvTpL/ypc3w+TR2mjotHDqlkJVBvk/Ex328YS/5j1+Gb4gLWqH
 B4Opbjvm4p0P/7mlDUe9whB2j6JubZIxBlZfuJLc/N51OhwDSNva5N4rFNBb1u6vOpJV
 M4nA==
X-Gm-Message-State: AOAM530sG2zelD5u09zCG2FHX5IqLkzmi/MeUdsMda9qGYYbTtacYbZr
 j8OaUT4HiYRAfN1xAuJjRWo=
X-Google-Smtp-Source: ABdhPJzlyHF/1STEzyL61ZWCYbfEDyDDr3rSB3vhrqgH6oMFMlflTawSkO671nU70AqKAwkTeolEPA==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr5438768wmh.77.1611776106132; 
 Wed, 27 Jan 2021 11:35:06 -0800 (PST)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id q9sm3940047wme.18.2021.01.27.11.35.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Jan 2021 11:35:05 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: [PATCH] drm/lima: add governor data with pre-defined thresholds
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <88ae6467-07fc-2c4e-9db9-a02a00d01347@arm.com>
Date: Wed, 27 Jan 2021 23:35:01 +0400
Message-Id: <08B992A3-6A8C-4585-8B0D-EE0DA6C5F4E2@gmail.com>
References: <20210125081804.13016-1-christianshewitt@gmail.com>
 <9e30a8e1-ef69-5929-17f1-cdb603686495@arm.com>
 <88ae6467-07fc-2c4e-9db9-a02a00d01347@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
X-Mailer: Apple Mail (2.3445.104.17)
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gT24gMjcgSmFuIDIwMjEsIGF0IDM6MTEgcG0sIEx1a2FzeiBMdWJhIDxsdWthc3oubHViYUBh
cm0uY29tPiB3cm90ZToKPiAKPiBPbiAxLzI3LzIxIDEwOjI0IEFNLCBMdWthc3ogTHViYSB3cm90
ZToKPj4gSGkgQ2hyaXN0aWFuLAo+PiBPbiAxLzI1LzIxIDg6MTggQU0sIENocmlzdGlhbiBIZXdp
dHQgd3JvdGU6Cj4+PiBUaGlzIHBhdGNoIGFkYXB0cyB0aGUgcGFuZnJvc3QgcHJlLWRlZmluZWQg
dGhyZXNob2xkcyBjaGFuZ2UgWzBdIHRvIHRoZQo+Pj4gbGltYSBkcml2ZXIgdG8gaW1wcm92ZSBy
ZWFsLXdvcmxkIHBlcmZvcm1hbmNlLiBUaGUgdXB0aHJlc2hvbGQgdmFsdWUgaGFzCj4+PiBiZWVu
IHNldCB0byByYW1wIEdQVSBmcmVxdWVuY3kgdG8gbWF4IGZyZXEgZmFzdGVyIChjb21wYXJlZCB0
byBwYW5mcm9zdCkKPj4+IHRvIGNvbXBlbnNhdGUgZm9yIHRoZSBsb3dlciBvdmVyYWxsIHBlcmZv
cm1hbmNlIG9mIHV0Z2FyZCBkZXZpY2VzLgo+Pj4gCj4+PiBbMF0gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2RyaS1kZXZlbC9wYXRjaC8yMDIxMDEyMTE3MDQ0NS4xOTc2MS0x
LWx1a2Fzei5sdWJhQGFybS5jb20vIAo+Pj4gCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
SGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gSSBoYXZlIGJl
ZW4gdXNpbmcgS29kaSBhcyBteSB0ZXN0IGFwcGxpY2F0aW9uLiBJZiB5b3Ugc2Nyb2xsIGluIGxp
YnJhcnkKPj4+IHZpZXdzIHdpdGggaHVuZHJlZHMgb2YgbGlzdCBpdGVtcyBhbmQgdGhlIHBhbmZy
b3N0IHZhbHVlcyB0aGUgc2xvdyBHUFUKPj4+IHJhbXAgdXAgaXMgcXVpdGUgbm90aWNlYWJsZSBh
bmQgdGhlIEdVSSBmZWVscyBzbHVnZ2lzaC4gQXMgZXZlcnl0aGluZwo+Pj4gbGltYSBydW5zIG9u
IGlzIGluaGVyZW50bHkgc2xvd2VyIHRoYW4gcGFuZnJvc3QgdXNpbmcgZGV2aWNlcyBJIGJlbGll
dmUKPj4+IGl0J3MgYmV0dGVyIHRvIHJhbXAgdXAgdG8gbWF4IGZyZXEgcXVpY2tlci4KPj4gSXQn
cyBxdWl0ZSBsb3cgdmFsdWUgZm9yIHRoZSB1cHRocmVzaG9sZCwgYnV0IEkgYmVsaWV2ZSB5b3Ug
aGF2ZQo+PiBleHBlcmltZW50ZWQgYW5kIG9ic2VydmVkIHRoYXQgYSBiaXQgaGlnaGVyICgzMCwg
NDA/KSBkb24ndCB3b3JrIHdlbGwuCj4+IEkgZG9uJ3Qga25vdyB0aGUgS29kaSBzeXN0ZW0sIHRo
b3VnaC4KPj4gWW91IGNhbiBjaGVjayBpZiB0aGUgb3RoZXIgZnJlcXVlbmNpZXMgYXJlIGFsc28g
dXNlZCBpbiBzdGF0aXN0aWNzIGZvcgo+PiBkZXZmcmVxIGRldmljZToKPj4gY2F0IC9zeXMvY2xh
c3MvZGV2ZnJlcS88eW91cl9ncHU+L3RyYW5zX3N0YXRzCj4+IElmIHRoZXkgYXJlIGFsc28gdXNl
ZCwgdGhlbiBpdCBPSyAoYmV0dGVyIHRoYW4gc3R1Y2sgYXQgbWluIGZyZXEpLgo+IAo+IEkndmUg
anVzdCByZWFsaXplZCB0aGF0IHlvdXIgYm9hcmQgbWlnaHQgc3VmZmVyIGEgYW5vdGhlciBpc3N1
ZS4KPiBQbGVhc2UgYXBwbHkgdGhpcyBwYXRjaCBbMV0gYW5kIHJ1biB5b3VyIGV4cGVyaW1lbnRz
IHdpdGggdXB0aHJlc2hvbGRzLgo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMjEwMTI3MTA1MTIxLjIwMzQ1LTEtbHVrYXN6Lmx1YmFAYXJtLmNvbS8KCknigJl2ZSBpbmNs
dWRlZCB0aGUgcGF0Y2ggYW5kIHdpdGggdW5zY2llbnRpZmljIHRlc3RpbmcgaXQgZmVlbHMgc25h
cHBpZXIgd2l0aCBhIGxhcmdlciB2YWx1ZSB0aGFuCmJlZm9yZS4gSSBkaWQgcmV2ZXJ0IGJhY2sg
dG8gNDUgZmlyc3QsIGJ1dCBhZ2FpbiB0aGlzIGZlZWxzIHNsdWdnaXNoIHdoZW4gbmF2aWdhdGlu
ZyBhcm91bmQgdGhlCktvZGkgR1VJLiBNeSBtYWluIHRlc3QgaXMgdG8gZW50ZXIg4oCYTW92aWVz
4oCZIGluIEtvZGkgdGhlbiBzdGFydCBzY3JvbGxpbmcgaW4gYSBsb25nIGxpc3QuIFdoZW4KdGhl
IEdQVSByYW1wcyB1cCBxdWlja2x5IHRoZSBleHBlcmllbmNlIGlzIHNuYXBweSwgYnV0IHdoZW4g
aXQgcmFtcHMgbW9yZSBjb25zZXJ2YXRpdmVseQpzY3JvbGxpbmcgZmVlbHMgbGlrZSBpdCBzdHV0
dGVycywgdGhlbiAob25jZSB5b3UgaGl0IG1heCBmcmVxKSBpdCBiZWNvbWVzIGZsdWlkLgoKV1Ay
On4gIyBjYXQgL3N5cy9jbGFzcy9kZXZmcmVxL2QwMGMwMDAwLmdwdS90cmFuc19zdGF0IAogICAg
IEZyb20gIDogICBUbwogICAgICAgICAgIDogMTI1MDAwMDAwIDI1MDAwMDAwMCAyODU3MTQyODUg
NDAwMDAwMDAwIDUwMDAwMDAwMCA2NjY2NjY2NjYgNzQ0MDAwMDAwICAgdGltZShtcykKKiAxMjUw
MDAwMDA6ICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgICAgIDAg
ICAgICAgICAwICAgICAgIDI2NCAgICAgNTI3MjAKICAyNTAwMDAwMDA6ICAgICAgICAgOSAgICAg
ICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAwICAgICAgICAzNiAg
ICAgIDM0MDQKICAyODU3MTQyODU6ICAgICAgICAgOSAgICAgICAgIDMgICAgICAgICAwICAgICAg
ICAgMCAgICAgICAgIDAgICAgICAgICAwICAgICAgICAzMiAgICAgIDI2MjgKICA0MDAwMDAwMDA6
ICAgICAgICAxOCAgICAgICAgMjAgICAgICAgIDEzICAgICAgICAgMCAgICAgICAgIDAgICAgICAg
ICAwICAgICAgIDE5MSAgICAgMjExNDAKICA1MDAwMDAwMDA6ICAgICAgICAxMiAgICAgICAgMTIg
ICAgICAgICA4ICAgICAgICA2MyAgICAgICAgIDAgICAgICAgICAwICAgICAgICAzMSAgICAgMTAw
NjgKICA2NjY2NjY2NjY6ICAgICAgIDE3OSAgICAgICAgIDUgICAgICAgIDE2ICAgICAgIDEzMyAg
ICAgICAgNjYgICAgICAgICAwICAgICAgICAyNCAgICAgMjkzNjAKICA3NDQwMDAwMDA6ICAgICAg
ICAzNyAgICAgICAgIDUgICAgICAgICA3ICAgICAgICA0NiAgICAgICAgNjAgICAgICAgNDIzICAg
ICAgICAgMCAgICAgNDYwMTYKCknigJlsbCBzZW5kIHYyIHdpdGggdGhlIHZhbHVlIHNldCB0byAz
MC4KCkNocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
