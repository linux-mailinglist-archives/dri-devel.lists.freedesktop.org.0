Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FFE1AEB43
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD136EC80;
	Sat, 18 Apr 2020 09:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25636E141
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 20:52:13 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w145so2904765lff.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=angJKiUFgdcQ+88Et9C+fMHi5ft5+9tP/OZmYzRrrXo=;
 b=jZS9WXFlNnN32otnqIem7vx9S7bz6RhmxmLzyibhwdfO4vHhtA3dGceYeSoeRxd6Rb
 LCQkriksVr4y5JtsI8fIN3DqtMFaa29u1GzjEA5kJF1VZye3nZdP6d2PBhc27YCmOQvB
 Y5D9z4a6cksFfHyhryCI6N0IeVKZs27B5pqNtoM7uQ1nX+DQuorsst4zkOm6rBZF5c+h
 qFrcxeLPSx+dBzQ8BEFZSfZ9E2OL8c3Ed3UnHM/C1oEnANunKeOqT3zPWHlzeoCnFRxL
 A5Y7meeOtqZtZKMX1X+t+kBCuJ3nm2QhPkUulGSrmCDQml1LI1vNk/4IKNTOP5+LjbvI
 P7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=angJKiUFgdcQ+88Et9C+fMHi5ft5+9tP/OZmYzRrrXo=;
 b=S8OFy5OsVAf1/CXi+mtip4v4f52aIDCwxAOGltfed/6lb5mWkAd8CqYFw+DEZUTPh+
 TeZZpg1Ct6S1+CQOVgXSpfhJOcNNmvXNVHRKk6DIkRSU5kGY6MdfcL6AgQQKCK3VJO2e
 CiOsrupUooSF6Ww7P/yJ/u0uG6hd/H0/pmCw3HR7VhebxB96MBetf0uZDUtO/srx0XHo
 enhOfSq9ARja3F+X/yDUgUvhKHxibQ9hajcWs2taWGpBjjARw0sejCtibn7cHXT1GDy+
 +/KBDqZtgwH6ruzGsUZuaLxi8XOwChxZGTT0kw0pYzSq8/nEidoLZkcd5ury0GnIXMmD
 KBxg==
X-Gm-Message-State: AGi0PuZ8Izn4OmJdJjgYSdMnJEjbyHWcqj92okOvyYOqL1m16WCz+znV
 tD7tBEIKiSUhY5hQlkidQTQ=
X-Google-Smtp-Source: APiQypKhcqsOTYer7LYr9ZS5kJQGhvpqqszRY8WB+b1F9c1Pd/hjB0KmqQAFP+wxkozfbigyHB1Clw==
X-Received: by 2002:ac2:5f73:: with SMTP id c19mr3347084lfc.29.1587156732240; 
 Fri, 17 Apr 2020 13:52:12 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id z7sm16973540ljc.17.2020.04.17.13.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 13:52:11 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] drm/tegra: output: Support DRM bridges
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-3-digetx@gmail.com>
 <20200417193018.GI5861@pendragon.ideasonboard.com>
 <0acc35fd-a74b-e726-7a16-55db13265c39@gmail.com>
 <20200417203154.GK5861@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <15002e6e-de36-899f-0d28-896c67a29a49@gmail.com>
Date: Fri, 17 Apr 2020 23:52:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417203154.GK5861@pendragon.ideasonboard.com>
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMDQuMjAyMCAyMzozMSwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+IEhpIERtaXRy
eSwKPiAKPiBPbiBGcmksIEFwciAxNywgMjAyMCBhdCAxMDo0MTo1OVBNICswMzAwLCBEbWl0cnkg
T3NpcGVua28gd3JvdGU6Cj4+IDE3LjA0LjIwMjAgMjI6MzAsIExhdXJlbnQgUGluY2hhcnQg0L/Q
uNGI0LXRgjoKPj4gLi4uCj4+Pj4gICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pYy5oPgo+Pj4+ICsj
aW5jbHVkZSA8ZHJtL2RybV9icmlkZ2UuaD4KPj4+Cj4+PiBZb3UgY291bGQgYWRkIGEgZm9yd2Fy
ZCBkZWNsYXJhdGlvbiBvZiBzdHJ1Y3QgZHJtX2JyaWRnZSBpbnN0ZWFkLCB0aGF0Cj4+PiBjYW4g
bG93ZXIgdGhlIGNvbXBpbGF0aW9uIHRpbWUgYSBsaXR0bGUgYml0Lgo+Pgo+PiBUaGlzIGluY2x1
ZGUgaXMgbm90IG9ubHkgZm9yIHRoZSBzdHJ1Y3QsIGJ1dCBhbHNvIGZvciB0aGUKPj4gZHJtX2Jy
aWRnZV9hdHRhY2goKS4gSXQgbG9va3MgdG8gbWUgdGhhdCBpdCBzaG91bGQgYmUgbmljZXIgdG8g
a2VlcCB0aGUKPj4gaW5jbHVkZSBoZXJlLgo+IAo+IGRybV9icmlkZ2VfYXR0YWNoKCkgaXMgY2Fs
bGVkIGZyb20gLmMgZmlsZXMuIEluIHRoZSAuaCBmaWxlIHlvdSBjYW4gdXNlCj4gYSBmb3J3YXJk
IGRlY2xhcmF0aW9uLiBJdCdzIGVudGlyZWx5IHVwIHRvIHlvdSwgYnV0IGFzIGEgZ2VuZXJhbCBy
dWxlLCBJCj4gcGVyc29uYWxseSB0cnkgdG8gdXNlIGZvcndhcmQgc3RydWN0dXJlIGRlY2xhcmF0
aW9ucyBpbiAuaCBmaWxlcyBhcyBtdWNoCj4gYXMgcG9zc2libGUuCgpUaGUgY3VycmVudCBUZWdy
YSBEUk0gY29kZSBpcyBhIGJpdCBpbmNvbnNpc3RlbnQgaW4gcmVnYXJkcyB0byBoYXZpbmcKZm9y
d2FyZCBkZWNsYXJhdGlvbnMsIGl0IGRvZXNuJ3QgaGF2ZSB0aGVtIG1vcmUgdGhhbiBoYXZlLgoK
SSdsbCBhZGQgYSBmb3J3YXJkIGRlY2xhcmF0aW9uIGlmIHRoZXJlIHdpbGwgYmUgbmVlZCB0byBt
YWtlIGEgdjUsIG9rPwoKPj4gLi4uCj4+Pj4gKwlwb3J0ID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUo
b3V0cHV0LT5vZl9ub2RlLCAicG9ydCIpOwo+Pj4KPj4+IERvIHlvdSBuZWVkIHRvIGNoZWNrIGZv
ciB0aGUgcHJlc2VuY2Ugb2YgYSBwb3J0IG5vZGUgZmlyc3QgPyBDYW4geW91Cj4+PiBqdXN0IGNo
ZWNrIHRoZSByZXR1cm4gdmFsdWUgb2YgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKCksIGFu
ZCBmYWxsCj4+PiBiYWNrIHRvICJudmlkaWEscGFuZWwiIGlmIGl0IHJldHVybnMgLUVOT0RFViA/
Cj4+Cj4+IFdpdGhvdXQgdGhlIGNoZWNrLCB0aGUgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdl
KCkgcHJpbnRzIGEgdmVyeSBub2lzeQo+PiBlcnJvciBtZXNzYWdlIGFib3V0IG1pc3NpbmcgcG9y
dCBub2RlIGZvciBldmVyeSBvdXRwdXQgdGhhdCBkb2Vzbid0IGhhdmUKPj4gYSBncmFwaCBzcGVj
aWZpZWQgaW4gYSBkZXZpY2UtdHJlZSAoSERNSSwgRFNJIGFuZCBldGMpLgo+Pgo+PiBodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS43LXJjMS9zb3VyY2UvZHJpdmVycy9vZi9wcm9w
ZXJ0eS5jI0w2MjEKPiAKPiBBaCB5ZXMgaW5kZWVkLiBUaGF0J3Mgbm90IHZlcnkgbmljZS4KPiAK
ClBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UnbGwgaGF2ZSBhIGJldHRlciBpZGVhIGFib3V0IGhv
dyB0aGlzIGNvdWxkIGJlCmhhbmRsZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
