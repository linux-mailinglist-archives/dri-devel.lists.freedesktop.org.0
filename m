Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 860FDB490D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 10:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54C76EB52;
	Tue, 17 Sep 2019 08:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275C56EB4F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 08:18:11 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id e11so1100871otl.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 01:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9aBAadc0dM/JQVde/IosFu9GDWEy6WahKAl2FnjfciY=;
 b=KfObkAe7P6fW7A6muESqQo4S+wO3+qmuZhAwNOdRmVwAL7f1pQegGKdhzHTlIV6gMF
 Fm7VXFwdy512QtkWOvxzE1xT8azKaIgsPQxFCcC0r52IX2XNYiHVDYjrNl8WA09CQvtf
 RaBx0R7MxpnNuNd/0LL4b7LdUW33GhaRH6HoVQ0Qf8gvVlj/df0kOXzdScD1t6u8EFFI
 7g28792b+8CMyPnAs+JAD9r83j9R3KkYf7+93Wf2CCCix16zVpbPAdctKKmM44XI3ReX
 kSlBucgHW2Q8NcgsdCgka+XQ9WxV1X/Dkgimx2zmiHmAUwluuqfrDdxkG14qdyBgYBEt
 jwpw==
X-Gm-Message-State: APjAAAWra6hdhmvWmCsMT6WTGxKRbY7poHCtezFuEpm0H64AuUr8BCyD
 NiNUgYEg0aguj2mSjYSKKICKxMnq7/mi7vB7fPf65w==
X-Google-Smtp-Source: APXvYqxUk4eJK4/7uLZjoMC61e5Cf4jAIRRyV+Y3bU44fne+SfGJzEQY9cIKANr46ndPNs6gdPToaFNZS9ztiezeWSM=
X-Received: by 2002:a05:6830:10d8:: with SMTP id
 z24mr1848408oto.281.1568708290296; 
 Tue, 17 Sep 2019 01:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
 <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
 <87woe7eanv.fsf@intel.com> <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
In-Reply-To: <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 17 Sep 2019 10:17:58 +0200
Message-ID: <CAKMK7uEj4FZ3YQqG-cCTa4EEaJoAk09Zaz398F9Hmo+mdXCKiw@mail.gmail.com>
Subject: Re: [PATCH] drm: add drm device name
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9aBAadc0dM/JQVde/IosFu9GDWEy6WahKAl2FnjfciY=;
 b=PehAG47I1mia6yDlsAHYxKUQxo+x8zx8aFLyfKhKACXR2zMRH5AevF8+WW6FbX12LE
 a9RnhzLNT20KNLdSSlnCdeywS6rj69ZUrP8/zlhl+E2BYtd9qh006fJ7na72MijYLoo2
 ULFwGx9Nsq3hlcR1rxB/nnEALXNP5K/zgZq8k=
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMTA6MTIgQU0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQW0gMTcuMDkuMTkgdW0gMDc6
NDcgc2NocmllYiBKYW5pIE5pa3VsYToKPiA+IE9uIE1vbiwgMTYgU2VwIDIwMTksIE1hcmVrIE9s
xaHDoWsgPG1hcmFlb0BnbWFpbC5jb20+IHdyb3RlOgo+ID4+IFRoZSBwdXJwb3NlIGlzIHRvIGdl
dCByaWQgb2YgYWxsIFBDSSBJRCB0YWJsZXMgZm9yIGFsbCBkcml2ZXJzIGluCj4gPj4gdXNlcnNw
YWNlLiAob3IgYXQgbGVhc3Qgc3RvcCB1cGRhdGluZyB0aGVtKQo+ID4+Cj4gPj4gTWVzYSBjb21t
b24gY29kZSBhbmQgbW9kZXNldHRpbmcgd2lsbCB1c2UgdGhpcy4KPiA+IEknZCB0aGluayB0aGlz
IHdvdWxkIHdhcnJhbnQgYSBoaWdoIGxldmVsIGRlc2NyaXB0aW9uIG9mIHdoYXQgeW91IHdhbnQK
PiA+IHRvIGFjaGlldmUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+Cj4gQW5kIG1heWJlIGV4cGxp
Y2l0bHkgY2FsbCBpdCB1YXBpX25hbWUgb3IgZXZlbiB1YXBpX2RyaXZlcl9uYW1lLgoKSWYgaXQn
cyB1YXBpX25hbWUsIHRoZW4gd2h5IGRvIHdlIG5lZWQgYSBuZXcgb25lIGZvciBldmVyeSBnZW5l
cmF0aW9uPwpVc2Vyc3BhY2UgZHJpdmVycyB0ZW5kIHRvIHNwYW4gYSBsb3QgbW9yZSB0aGFuIGp1
c3QgMSBnZW5lcmF0aW9uLiBBbmQKaWYgeW91IHdhbnQgdG8gaGF2ZSBwZXItZ2VuZXJhdGlvbiBk
YXRhIGZyb20gdGhlIGtlcm5lbCB0byB1c2Vyc3BhY2UsCnRoZW4gaW1vIHRoYXQncyBtdWNoIGJl
dHRlciBzdWl0ZWQgaW4gc29tZSBhbWRncHUgaW9jdGwsIGluc3RlYWQgb2YKdHJ5aW5nIHRvIGVu
Y29kZSB0aGF0IGludG8gdGhlIGRyaXZlciBuYW1lLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0
OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
