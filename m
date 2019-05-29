Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E262DEDC
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 15:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E7B6E102;
	Wed, 29 May 2019 13:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A2F6E32E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 13:50:43 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id 186so1097079ywo.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 06:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p1uCnQ8nGdyLRbfLWyCiFYy9A7xX//M6prTeHKJg1zE=;
 b=rXB0fVFrv3H+sc9I5OlKpEAc7e1VkrE+a4jBDF4pM3kwpEhwpPYxA1NaeEyvUxzF0r
 gjtXvOBlaa8WEAqffcH0Iht1lqOkYqX9tOl/rWRVS58no5BQCawNC6ZjcuWomj8VsKjc
 yATg96P4vu9SYkhETUOreagGZ/G4vR1JGFTDLRNHutQZPNBSC61UsBvYv/f4gsxggAdU
 rlGAhYwJ0UkHBjchi9tNhzANdareBdzVLV50L2A5V5FKq7rys6VGW8AtP1kyZW3aQ5BF
 /hH5yDQMjx8Qjl+hIf/AHu+peStE4nuPi29IRpL6MY58mEEpgdrvJLgFe6BVYzU5iIzj
 fRhA==
X-Gm-Message-State: APjAAAWeGJyKSWH7NMY09fq0a8uttBB3BeVzVH7ShooWAQPIMZVDettB
 eRRKcq8/kKYYWKFMFxUY/TB3x/dVbBiw4jJwsGIQ2w==
X-Google-Smtp-Source: APXvYqz5onZBv7TupzNl6DWZiD3xjDngyLwFknnzB4PAZqgjNLd+8JiNGyR30zWMZhYg7qsfJy1k9ixA8LVqibpTZlo=
X-Received: by 2002:a81:70c2:: with SMTP id l185mr9207457ywc.100.1559137842475; 
 Wed, 29 May 2019 06:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190529110204.2384-1-ville.syrjala@linux.intel.com>
 <20190529110204.2384-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20190529110204.2384-2-ville.syrjala@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 May 2019 09:50:29 -0400
Message-ID: <CADnq5_OC_fOj6RAagFp2-LuBYp4o3KZJ5NPScKwiu0MY1H1EVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/edid: Ignore "DFP 1.x" bit for EDID 1.2 and
 earlier
To: Ville Syrjala <ville.syrjala@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p1uCnQ8nGdyLRbfLWyCiFYy9A7xX//M6prTeHKJg1zE=;
 b=u84egLKBgKflR1Z0tuyAmXv2KplofCkBrnWqp7IAvzN+YJ+WwzlyRWgcScBYqyRt5R
 +kjyfzLohwuvISV9qheYX1kXkJN5WSQ+8cmNklJJwdUfwLyhoTDyIV4vI9IPAzR0/nev
 yVLPKbEjGfo9rXGtIB3yyqcgdbt8HrzeYMKI1gRMzUAT4mfayQbHx5fRJrFESdjUKaBV
 LhkeXews3yIJkiTaVMVEjGewogipc9Z5RP+pr5djOn1R0MRxerfbWqwQh7Dd+kFXBNDW
 0P21VuLOuIq5T9RgcmDXT5Bpoleqo5mqQc1eYS5vuQc3c67DOmd/bY4AbSkRb5FGg3lY
 2e/A==
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgNzowMiBBTSBWaWxsZSBTeXJqYWxhCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Cj4gRnJvbSBWRVNBIEVESUQgaW1wbGVtZW50
YXRpb24gZ3VpZGUgdjEuMDoKPiAiRm9yIEVESUQgdmVyc2lvbiAxIHJldmlzaW9uIDIgb3IgZWFy
bGllciBkYXRhIHN0cnVjdHVyZXMgd2hlbiBvZmZzZXQgMTRoCj4gIGJpdCA3IGlzIHNldCB0byBv
bmUsIHRoZSB2YWx1ZSBvZiBiaXRzIDYtMCBhcmUgdW5kZWZpbmVkLCBhbmQgdGhlcmVmb3JlCj4g
IGNhbm5vdCBiZSBpbnRlcnByZXRlZCB0byBtZWFuIGFueXRoaW5nLiIKPgo+IEFuZCBzaW5jZSBF
RElEIDEuNCByZWRlZmluZXMgdGhhdCBiaXQgbGV0J3MgY29uc3VsdCBpdCBvbmx5IGZvcgo+IEVE
SUQgMS4zLgo+Cj4gQ2M6IE1hcmlvIEtsZWluZXIgPG1hcmlvLmtsZWluZXIuZGVAZ21haWwuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+CgpTZXJpZXMgaXM6ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8
IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMKPiBpbmRleCBkZDYwMWVkNmEzMGUuLmMzMjk2YTcyZmZmOSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jCj4gQEAgLTQ1NjksOCArNDU2OSw4IEBAIHUzMiBkcm1fYWRkX2Rpc3Bs
YXlfaW5mbyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBjb25zdCBzdHJ1Y3QgZWRp
ZCAqZWRpCj4gICAgICAgICAgKiB0ZWxscyB1cyB0byBhc3N1bWUgOCBicGMgY29sb3IgZGVwdGgg
aWYgdGhlIEVESUQgZG9lc24ndCBoYXZlCj4gICAgICAgICAgKiBleHRlbnNpb25zIHdoaWNoIHRl
bGwgb3RoZXJ3aXNlLgo+ICAgICAgICAgICovCj4gLSAgICAgICBpZiAoKGluZm8tPmJwYyA9PSAw
KSAmJiAoZWRpZC0+cmV2aXNpb24gPCA0KSAmJgo+IC0gICAgICAgICAgIChlZGlkLT5pbnB1dCAm
IERSTV9FRElEX0RJR0lUQUxfREZQXzFfWCkpIHsKPiArICAgICAgIGlmIChpbmZvLT5icGMgPT0g
MCAmJiBlZGlkLT5yZXZpc2lvbiA9PSAzICYmCj4gKyAgICAgICAgICAgZWRpZC0+aW5wdXQgJiBE
Uk1fRURJRF9ESUdJVEFMX0RGUF8xX1gpIHsKPiAgICAgICAgICAgICAgICAgaW5mby0+YnBjID0g
ODsKPiAgICAgICAgICAgICAgICAgRFJNX0RFQlVHKCIlczogQXNzaWduaW5nIERGUCBzaW5rIGNv
bG9yIGRlcHRoIGFzICVkIGJwYy5cbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBjb25u
ZWN0b3ItPm5hbWUsIGluZm8tPmJwYyk7Cj4gLS0KPiAyLjIxLjAKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
