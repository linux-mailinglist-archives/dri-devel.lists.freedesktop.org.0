Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47121AEB3E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8EF6EC62;
	Sat, 18 Apr 2020 09:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87A96EACB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 20:51:13 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id w145so2902907lff.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=axXdNYI8P7fcgsZxQpUhrRij1OkOPLBrxua8Qhy3eLw=;
 b=vJabpKV6ndKO7Wg3lhxcSe/im8PMhvmt7TXrJAoL3htKwBnynd+5QAFEC8v6ORPabV
 V4NKkBGB6BdR9/NQZyakDO6cOsHK2wQrTk/IKi09jFzxiK58tLh2i/BCD0ksoH9jaWgt
 ZdOTikyzPsJ5eNon1JIYegfLOwG9gvdWvsPK+b+373vC+6q0nRUW1uP2Mi/OTKbAv42Q
 75/k9aJiK0aAK3OfSt05jXixppnSOmmGsKutIiEd5KLWXz9PLnS4pfk7fjYknEes7GVr
 VdW4/V9XeouNxI3TY/HELvJOLh2FLbd7GRFBT3ip8CS3VvIrGZicet7BJa/YEyEsjdPL
 qjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=axXdNYI8P7fcgsZxQpUhrRij1OkOPLBrxua8Qhy3eLw=;
 b=nQ4kDatlZbAbwf6ZiUcunOkWxvUd6qSB0bxwiALLLzWjZtoW94gzFswWD5c/6QGFJE
 9G/Jz9NxR5In0osJZ32f0Np5gq5DzuOI+8m7Q8wq0QDzoX2JfDnd7FK9azKID07KJ4ew
 m3ZLfFyky6EFGbbWVhRmwfxhhFbC2g5viNwOplxC+5IUDXNlJY2IEOX6iBuyoJJGRRqd
 o5imKf3JZ5hSM3mO84eHOWxKxKKeCex7MEslgCCTvf2bso2jFpQ+3zIj6sRzt3aKNeTg
 k6a/DqJOE3GUykKy+sImpCSbF2zo1EMlO+968iclszuKdgBBQsEGZlotcmY82LViGaC3
 1+zQ==
X-Gm-Message-State: AGi0PuY536k14flE4oldsqvEcbjbCBwkctvy9P1dZ10SAmS7PR5P4j7a
 itqWMIp+YLEr7oksSD23GFNkbTjM
X-Google-Smtp-Source: APiQypIE81U5du+v+R7KFRY55XpJylnWzIN0VolI+ugHrPtsMAUHAgTK0KjImAal98DLTvW0E3vefQ==
X-Received: by 2002:ac2:4853:: with SMTP id 19mr3175195lfy.171.1587156672077; 
 Fri, 17 Apr 2020 13:51:12 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id h14sm19415139lfm.60.2020.04.17.13.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 13:51:11 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] drm/tegra: output: rgb: Support LVDS encoder bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-4-digetx@gmail.com>
 <20200417192453.GH5861@pendragon.ideasonboard.com>
 <598c81ef-ba22-a832-0822-e08023f3dff6@gmail.com>
 <20200417203435.GL5861@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <23afcbc1-729c-c125-4d94-508c8edc57c9@gmail.com>
Date: Fri, 17 Apr 2020 23:51:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417203435.GL5861@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: linux-tegra@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMDQuMjAyMCAyMzozNCwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+IE9uIEZyaSwg
QXByIDE3LCAyMDIwIGF0IDExOjExOjA2UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToK
Pj4gMTcuMDQuMjAyMCAyMjoyNCwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+PiAuLi4K
Pj4+IEFzIEkgdHJpZWQgdG8gZXhwbGFpbiBiZWZvcmUsIGlmIHlvdSB3cmFwIHRoZSBwYW5lbCBp
biBhIGJyaWRnZSB3aXRoCj4+PiBkcm1fcGFuZWxfYnJpZGdlX2FkZCgpIChvciB0aGUgZGV2bV8g
dmFyaWFudCksIHlvdSB3aWxsIGFsd2F5cyBoYXZlIGEKPj4+IGJyaWRnZSBhc3NvY2lhdGVkIHdp
dGggdGhlIG91dHB1dCwgYW5kIHdpbGwgYmUgYWJsZSB0byByZW1vdmUgeW91cgo+Pj4gY3VzdG9t
IGNvbm5lY3RvciBpbXBsZW1lbnRhdGlvbi4gSSB0aHVzIHJlY29tbWVuZCBjb252ZXJ0aW5nIHRv
Cj4+PiBkcm1fcGFuZWxfYnJpZGdlX2FkZCgpIGVpdGhlciBhcyBwYXJ0IG9mIHRoaXMgcGF0Y2gg
c2VyaWVzLCBvciBqdXN0Cj4+PiBhZnRlciBpdCwgdG8gZ2V0IGZ1bGwgYmVuZWZpdHMuCj4+Pgo+
Pj4gV2l0aCB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoaXMgd2lsbCBiZSBoYW5kbGVkLAo+Pj4KPj4+
IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+Cj4+Cj4+IFRoYW5rcyB5b3UgdmVyeSBtdWNoIQo+Pgo+PiBZZXMsIEkgZ290IHlv
dXJzIHBvaW50IGFib3V0IHdyYXBwaW5nIHBhbmVsIGludG8gdGhlIGJyaWRnZS4gQnV0IEkgZG9u
J3QKPj4gdGhpbmsgdGhhdCBpdCdzIHdvcnRoIHRoZSBlZmZvcnQgcmlnaHQgbm93IGJlY2F1c2Ug
ZWFjaCBUZWdyYSBvdXRwdXQgaGFzCj4+IGl0J3Mgb3duIGltcGxhbnRhdGlvbiBvZiB0aGUgY29u
bmVjdG9yIGFuZCBpdCBzaG91bGQgYmUgY2xlYW5lciBub3QgdG8KPj4gdG91Y2ggdGhhdCBjb2Rl
Lgo+Pgo+PiBTZWNvbmRseSwgSSBkb24ndCBoYXZlIGhhcmR3YXJlIHRvIHRlc3QgYWxsIGF2YWls
YWJsZSBwYW5lbCBvdXRwdXQgdHlwZXMKPj4gb24gVGVncmEgYW5kIHRoZSBiZW5lZml0cyBvZiBt
ZXNzaW5nIHdpdGggYWxsIHRoYXQgY29kZSBhcmUgYSBiaXQgZGltIHRvIG1lLgo+Pgo+PiBJIGNh
biBtYWtlIGEgcGF0Y2ggdG8gd3JhcCB0aGUgUkdCIHBhbmVsIGludG8gYSBicmlkZ2UsIGJ1dCB0
aGlzIHNob3VsZAo+PiBtYWtlIGNvZGUgYSBiaXQgaW5jb25zaXN0ZW50IGluIHJlZ2FyZHMgdG8g
bm90IGhhdmluZyBhIGNvbW1vbiBjb2RlIHBhdGgKPj4gZm9yIHRoZSAibGVnYWN5IiBudmlkaWEs
cGFuZWwuIFNvIHBlcmhhcHMgaXQncyBiZXR0ZXIgdG8gbGVhdmUgaXQgYWxsCj4+IGFzLWlzIGZv
ciBub3cuCj4gCj4gSSBoYWQgYSBicmllZiBsb29rIGF0IHRoZSBjb2RlLCBjb252ZXJ0aW5nIHRo
ZSBkaWZmZXJlbnQgb3V0cHV0IHR5cGVzCj4gb25lIGJ5IG9uZSB3b3VsZCBiZSBhIGJldHRlciB3
YXkgZm9yd2FyZCB0aGFuIG5vdCBkb2luZyBhbnl0aGluZyBhdCBhbGwKPiBpbiBteSBvcGluaW9u
IDotKSBPbmNlIHlvdSBjb252ZXJ0IHRoZSBmaXJzdCBvdXRwdXQgaXQgd2lsbCBhbHNvIHNlcnZl
Cj4gYXMgYW4gZXhhbXBsZSBvbiBob3cgdG8gZG8gaXQsIGFuZCBob3BlZnVsbHkgb3RoZXIgZGV2
ZWxvcGVycyB3aXRoCj4gYWNjZXNzIHRvIGhhcmR3YXJlIGNvdWxkIHRoZW4gZG8gbW9yZSBjb252
ZXJzaW9ucy4KPiAKClRoaWVycnksIHdvdWxkIHlvdSB3YW50IHRvIGhhdmUgUkdCIHBhbmVsIGNv
bnZlcnRlZCBpbnRvIGEgYnJpZGdlPyBJZgp5ZXMsIEknbGwgbWFrZSBhIHY1IHdpdGggdGhhdCBj
aGFuZ2UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
