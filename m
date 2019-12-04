Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C9113C83
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 08:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76946E982;
	Thu,  5 Dec 2019 07:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C81F6E075
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 15:22:23 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e10so8569496ljj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 07:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WXE7XkNkgq5Ryc0BGF4vj9reI7uFX8qbQNcWUJ9ADaM=;
 b=JSUnjKHAhLeIPXLj1t6SXxuouh8fKuL7+3smvcRGtJXNXv/pqVXFfClg9C+GMltRzy
 RfsYDeVnFqojnmBC1HUvz4Oo07YbbGM9W/eZeIFPCgKa4vRCQNeqb6F4fCUzr4QL16Go
 OjmqUF9nOT5d0JCYrHXoJsY51I/+YwbmArW0fLJ5iY3hujvI+TAkt6N318Zb+4wBAWYO
 tQuSQBSf+U4d2czOSO7/EKHU3UHfCbBJRESCO/zgviB14fTbdlPjpE2c3xm9EW4PkksN
 Yi3gzrdKgFiQLJXkd/GY8I6MDtMcJSrFEdZn/HFmwP4CigA/uXAsQdkKpBCC/FL/FrBG
 RO0g==
X-Gm-Message-State: APjAAAXRHhbI1+4jbr+hPZzGtQfQZNu+62+i5Aw5/bBFOHel6mLW6pQ/
 N4WzvmAieWz9asDWDwoPFR8=
X-Google-Smtp-Source: APXvYqz3fKbBicJVvkmjihgLoVHT6+C2GHcFXQ6wv1iu18C+Hc2xtjyoHdsZN0PNeriXbCu/IO5Fng==
X-Received: by 2002:a2e:90c6:: with SMTP id o6mr2363361ljg.93.1575472941563;
 Wed, 04 Dec 2019 07:22:21 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id a24sm3289856ljp.97.2019.12.04.07.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2019 07:22:20 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/tegra: Do not implement runtime PM
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191203162733.1436800-1-thierry.reding@gmail.com>
 <20191203162733.1436800-2-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3d2b4fed-d2e6-bb4a-c94b-d493ba836661@gmail.com>
Date: Wed, 4 Dec 2019 18:22:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191203162733.1436800-2-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 05 Dec 2019 07:44:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WXE7XkNkgq5Ryc0BGF4vj9reI7uFX8qbQNcWUJ9ADaM=;
 b=Dt448IQC2i0MNywuhrWBQNwAfVB6y4dypqdsH8rJGV+Q0SX59JzVMydSBS5SHecLFp
 Ye248dKB6j2KXx8qgkQm3TwsZvIpmuQxYly/o+n3mCZlWwQGs68yz1X97ZWuP1++3TeM
 XWv+ozQzT3uGiyi96IAI4XVc/oZ/b28zpIqBuillI2UI8o8wv2fdszK8sW82Miau8GDW
 9wXeKdYste/uAwf9QIztwYcQb3AnEgWzMjkUpFX9f8rTKPdJC5nKn9gamMvK4YQP6cki
 le6rArl7NhyJT0nU5GfyNXwraQaH0vrrBIpYnR+OOgMyZeiiUrA3SsqQS9JA84bvg9B5
 1YQw==
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
Cc: linux-tegra@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDMuMTIuMjAxOSAxOToyNywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFRoZSBUZWdyYSBEUk0gZHJpdmVy
IGhlYXZpbHkgcmVsaWVzIG9uIHRoZSBpbXBsZW1lbnRhdGlvbnMgZm9yIHJ1bnRpbWUKPiBzdXNw
ZW5kL3Jlc3VtZSB0byBiZSBjYWxsZWQgYXQgc3BlY2lmaWMgdGltZXMuIFVuZm9ydHVuYXRlbHks
IHRoZXJlIGFyZQo+IHNvbWUgY2FzZXMgd2hlcmUgdGhhdCBkb2Vzbid0IHdvcmsuIE9uZSBleGFt
cGxlIGlzIGlmIHRoZSB1c2VyIGRpc2FibGVzCj4gcnVudGltZSBQTSBmb3IgYSBnaXZlbiBzdWJk
ZXZpY2UuIEFub3RoZXIgZXhhbXBsZSBpcyB0aGF0IHRoZSBQTSBjb3JlCj4gYWNxdWlyZXMgYSBy
ZWZlcmVuY2UgdG8gcnVudGltZSBQTSBkdXJpbmcgc3lzdGVtIHNsZWVwLCBlZmZlY3RpdmVseQo+
IHByZXZlbnRpbmcgZGV2aWNlcyBmcm9tIGdvaW5nIGludG8gbG93IHBvd2VyIG1vZGVzLiBUaGlz
IGlzIGludGVudGlvbmFsCj4gdG8gYXZvaWQgbmFzdHkgcmFjZSBjb25kaXRpb25zLCBidXQgaXQg
YWxzbyBjYXVzZXMgc3lzdGVtIHNsZWVwIHRvIG5vdAo+IGZ1bmN0aW9uIHByb3Blcmx5IG9uIGFs
bCBUZWdyYSBzeXN0ZW1zLgo+IAo+IEZpeCB0aGlzIGJ5IG5vdCBpbXBsZW1lbnRpbmcgcnVudGlt
ZSBQTSBhdCBhbGwuIEluc3RlYWQsIGEgbWluaW1hbCwKPiByZWZlcmVuY2UtY291bnRlZCBzdXNw
ZW5kL3Jlc3VtZSBpbmZyYXN0cnVjdHVyZSBpcyBhZGRlZCB0byB0aGUgaG9zdDF4Cj4gYnVzLiBU
aGlzIGhhcyB0aGUgYmVuZWZpdCB0aGF0IGl0IGNhbiBiZSB1c2VkIHJlZ2FyZGxlc3Mgb2YgdGhl
IHN5c3RlbQo+IHBvd2VyIHN0YXRlIChvciBhbnkgdHJhbnNpdGlvbnMgd2UgbWlnaHQgYmUgaW4p
LCBvciB3aGV0aGVyIG9yIG5vdCB0aGUKPiB1c2VyIGFsbG93cyBydW50aW1lIFBNLgo+IAo+IEF0
b21pYyBtb2Rlc2V0dGluZyBndWFyYW50ZWVzIHRoYXQgdGhlc2UgZnVuY3Rpb25zIHdpbGwgZW5k
IHVwIGJlaW5nCj4gY2FsbGVkIGF0IHRoZSByaWdodCBwb2ludCBpbiB0aW1lLCBzbyB0aGUgcGl0
ZmFsbHMgZm9yIHRoZSBtb3JlIGdlbmVyaWMKPiBydW50aW1lIFBNIGRvIG5vdCBhcHBseSBoZXJl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+
Cj4gLS0tCgpDb3VsZG4ndCB3ZSBqdXN0IHVzZSBwbV9ydW50aW1lX2ZvcmNlX3N1c3BlbmQvcmVz
dW1lIHdoZW5ldmVyIGl0IGlzCm5lY2Vzc2FyeSB0byBlbmZvcmNlIHRoZSBzdXNwZW5kL3Jlc3Vt
ZT8KCkkgYnJpZWZseSBsb29rZWQgdGhyb3VnaCB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbiBhbmQg
ZG9uJ3Qgc2VlIHdoeSB0aGUKZm9yY2VkIHN1c3BlbmQvcmVzdW1lIGlzbid0IHN1aXRhYmxlLiBQ
bGVhc2UgZXhjdXNlIG1lIGlmIEknbSBtaXNzaW5nCnRoZSBwb2ludC4KCldoeSBwbGFuZXMvb3V0
cHV0cyBuZWVkIHRvIGNhcmUgYWJvdXQgcmVzdW1pbmcgREMgY29udHJvbGxlciBhdCBhbGw/CkRv
ZXNuJ3QgRFJNIGNvcmUgdGFrZSBjYXJlIG9mIGVuYWJsaW5nIERDIGZvciB1cyBieSBlbmFibGlu
ZyBDUlRDIGJlZm9yZQpwbGFuZXMvb3V0cHV0cyBhcmUgZW5hYmxlZD8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
