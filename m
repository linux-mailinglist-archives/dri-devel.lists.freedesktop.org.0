Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAC659821
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 12:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC686E8C5;
	Fri, 28 Jun 2019 10:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459D36E8C5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:04:33 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id s49so10244068edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 03:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t+VA5z/mW9Ayu9Ng5EOCGgNeX9M3JKHAtmp8uRGg6BA=;
 b=jJ5DFXubHHpsxvnQFRQLJlF3kdcvkrvSk4UQd0Tkg9404GzF4IHYBxWzfazmKbd3KN
 lJKom6Tr5wGa4xOQz8cwcb06nkKnEZB6wE4FL8PtJfeLs9fjlFTSInI1rYPfWeWqdp7h
 z6BcSvV4KNlmnqRB8S9/cVM2EWW2q7drHFShJjESQReZ36MdkLvaTZcCg+A8BprE4MLU
 84nDdkyQ3obU+Z7G1EK3bKxvi4DPWdX/2lzjvDEZKsAKlX0mw5wqdEkIJguwJDzSiygU
 Zs+Hqf3VF/z0vWkYQpS8LjNEo+FpmMOxqUr6lMIK+wNnWBkbAUquP+LiHO3ycWdBPuCX
 2tlA==
X-Gm-Message-State: APjAAAURtmvOifMJtiOi6emPFEIb8h2WBkd0FnnjmV+/fEVkso2TZURy
 +iFwFGQB9nX44aMB0OEtv7itOOqTwuI=
X-Google-Smtp-Source: APXvYqxQ1KwJKHe0B0pVybtm68QrQcM/YdV57k1xYy4DEmquvl+tW1Im5pKkpOQZLFrdhsUEqJxlLg==
X-Received: by 2002:a50:89a2:: with SMTP id g31mr10203636edg.93.1561716271502; 
 Fri, 28 Jun 2019 03:04:31 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id z9sm553380edd.53.2019.06.28.03.04.30
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 03:04:30 -0700 (PDT)
Subject: Re: [PATCH 0/1] drm: panel-orientation-quirks: Add extra quirk table
 entry GPD MicroPC
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <seanpaul@chromium.org>
References: <20190624154014.8557-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5215f91a-377a-78f1-dc73-7f9ae7531d56@redhat.com>
Date: Fri, 28 Jun 2019 12:04:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190624154014.8557-1-hdegoede@redhat.com>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKT24gMjQtMDYtMTkgMTc6NDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4gSGkgQWxs
LAo+IAo+IEdvb2QgbmV3cyBJIGhhdmUgYSBjb250YWN0IGluc2lkZSBHUEQgbm93IGFuZCBmcm9t
IG5vdyBvbiB0aGVpciBCSU9TLWVzCj4gd2lsbCBoYXZlIHByb3BlciBzeXNfdmVuZG9yIGFuZCBw
cm9kdWN0X25hbWUgRE1JIHN0cmluZ3MuIFRoaXMgbWVhbnMgdGhhdAo+IHdlIG5vIGxvbmdlciBu
ZWVkIHRvIGRvIEJJT1MgZGF0ZSBtYXRjaGVzIGFuZCBhZGQgYSBuZXcgQklPUyBkYXRlIHRvCj4g
ZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jIGZvciBlYWNoIEJJT1MgdXBkYXRlLgo+IAo+
IFRoZSBzZWNvbmQgYmF0Y2ggb2YgR1BEIE1pY3JvUEMtcyBiZWluZyBkZWxpdmVyZWQgdG8gdXNl
cnMgYWxyZWFkeSB1c2VzCj4gdGhlc2UgbmV3IHN0cmluZ3MsIHRoaXMgcGF0Y2ggYWRkcyBhIHF1
aXJrIGZvciB0aGUgOTAgZGVncmVlIG1vdW50ZWQKPiBMQ0QgcGFuZWwgdXNpbmcgdGhlIG5ldyBE
TUkgc3RyaW5ncy4KPiAKPiBJdCB3b3VsZCBiZSBuaWNlIHRvIGdldCB0aGlzIGludG8gNS4yLCBi
dXQgaXQgaXMgbm90IHRoYXQgdXJnZW50LCBzbwo+IEkgYmVsaWV2ZSB0aGF0IGl0IGlzIGJlc3Qg
dG8gcHVzaCB0aGlzIHRvIGRybS1taXNjLW5leHQtZml4ZXMgYW5kIHRoZW4KPiBpdCBjYW4gZ2V0
IGFkZGVkIHRvIDUuMi55IG9uY2UgaXQgaGl0cyBUb3J2YWxkJ3MgdHJlZS4KPiAKPiBJZiBzb21l
b25lIGNhbiBnaXZlIHRoaXMgYSByZXZpZXcgKGl0IGlzIGEgdHJpdmlhbCBwYXRjaCByZWFsbHkp
IGFuZAo+IGdpdmUgbWUgYW4gQWNrZWQtYnkgdGhlbiBJJ2xsIHB1c2ggdGhpcyB0byBkcm0tbWlz
Yy1uZXh0LWZpeGVzLgoKTWFhcnRlbiwgTWF4aW1lLCBwaW5nPyBDYW4gSSBnZXQgYW4gQWNrZWQt
YnkgKG9yIFJldmlld2VkLWJ5KSBmb3IgdGhpcwpwbGVhc2Ugc28gdGhhdCBJIGNhbiBwdXNoIGl0
IHRvIGRybS1taXNjLW5leHQtZml4ZXMgPwoKVGhhbmtzLAoKSGFucwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
