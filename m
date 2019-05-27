Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FAB2B57D
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B0F89E86;
	Mon, 27 May 2019 12:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275EB89E86
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 12:37:19 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u78so3164383wmu.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 05:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4mYDhgqAS3xAbtfNDBkSX+qj0lWBw+i5oKWpCDr8Rq8=;
 b=SrAzx6HCkiQBM0eCONYvXbeaezPOwUSIhNXM9yJ73nEPPIEh0ZwxOte906m5W6N0S+
 oD/QBrWCMg7UvNph164CXkqfeFSPaTmPldUXR4Q4LpFhtlN9xYOpByIysJNOYRtpiP+p
 E6jRHUmdL+BxBlgFm9Vqh6Fh0NhMd9qvjC5jY6pgBUjTHez2laV3ek/IlNec64j75z+p
 DM3XQnFyHtQ8UR8PRDU01lsk2DXiRcEwavNvMTqtowdHvEhArvRKPU5rdMOyyf4toHm/
 71cXU8PZ1MpH0S+ln57w77uATaYu87fLighIKinhf3Pk36TiwEu2EtpCwFhF3pyuAqU0
 diBQ==
X-Gm-Message-State: APjAAAVEIeosNtfhFJ4tueczhIggT4kpqETpfiMa8TPIWnElJflbM+e2
 sX7nxpsO91Tz98qGcQIcRYg=
X-Google-Smtp-Source: APXvYqxuBrhQ5sG3moM9i2eqHI4LIoFmIk6uQ2Mq4u3FNhElPHHSWZxwnsdJFge4XQz/8zWCdnPcIg==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr9689175wml.28.1558960637541;
 Mon, 27 May 2019 05:37:17 -0700 (PDT)
Received: from arch-x1c3 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net.
 [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id 6sm22815435wrd.51.2019.05.27.05.37.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 27 May 2019 05:37:16 -0700 (PDT)
Date: Mon, 27 May 2019 13:35:52 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
Message-ID: <20190527123552.GD15067@arch-x1c3>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
 <20190522164119.24139-4-emil.l.velikov@gmail.com>
 <a2ec4b6f529ffdc6146903decec6b5ba4cab0a1d.camel@vmware.com>
 <20190524121410.GB6233@arch-x1c3>
 <280025344d8590a4d10edfd9990d26d15a983264.camel@vmware.com>
 <20190524152648.GD8938@arch-x1c3>
 <27cb3f6d2002edcf45a4d50e6cef0854ba80766a.camel@vmware.com>
 <7dd79b21d58dc74b9b2d81d6aa812fe8d4564596.camel@vmware.com>
 <20190527090826.GA13920@arch-x1c3>
 <c12af67b4b730a0f8b7d61a349e8e5845b14be1d.camel@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c12af67b4b730a0f8b7d61a349e8e5845b14be1d.camel@vmware.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4mYDhgqAS3xAbtfNDBkSX+qj0lWBw+i5oKWpCDr8Rq8=;
 b=i+2sJTYeB5/zUcgrCFmss1MIb3hoEY1vAsHmg9MhleAIq9h88rNqVZNBJZRa6MOxRG
 qO3RVFrwTKj1n6aRJTAgieJHl0boNrvZv7CZkv8Uy5PFZAH7HaSo7v3RFIBrthr7bihl
 Lv+h2iBo4eb+JI5trxleQloxPNcHR+dUInuHGCUxB67It7cdYJZ/GARAe7KtwYA9WC1H
 UbU2GgDyr6zGdyozHfiLoEmsJ18LbHfjLWj2jvJkgC7cG/4hgNY6hlb/vZPlV1oLr9hD
 uhgd8TSPDUCkcSgrj1QlTH6ff8i6EhAnnmPWskJRxaV89pzr2s680+CaEcXgl6a7CZwP
 3s0w==
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
Cc: "kernel@collabora.com" <kernel@collabora.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKT24gMjAxOS8wNS8yNywgVGhvbWFzIEhlbGxzdHJvbSB3cm90ZToKCj4gPiBJ
IHRoaW5rIHdlIG1pZ2h0IGJlIHRhbGtpbmcgcGFzdCBlYWNoIG90aGVyLCBsZXQncyB0YWtlIGEg
c3RlcCBiYWNrOgo+ID4gCj4gPiAgLSBhcyBvZiBwcmV2aW91cyBwYXRjaCwgYWxsIG9mIHZtd2dm
eCBpb2N0bHMgc2l6ZSBpcyBjb25zaXN0ZW50bHkKPiA+IGhhbmRsZWQgYnkgdGhlIGNvcmUKPiAK
PiBJIGRvbid0IHRoaW5rIEkgZm9sbG93IHlvdSBoZXJlLCBBRkFJQ1QgcGF0Y2ggMy81IG9ubHkg
YWZmZWN0cyBhbmQKPiByZWxheGVzIHRoZSBleGVjYnVmIGNoZWNraW5nIChhbmQgaW4gZmFjdCBh
IGxpdHRsZSBtb3JlIHRoYW4gSSB3b3VsZAo+IGxpa2UpPwo+IApQcmVjaXNlbHksIGl0IG1ha2Vz
IGV4ZWNidWYgaW9jdGwgYmVoYXZlIGxpa2UgYWxsIG90aGVyIGlvY3RscyAtIGJvdGgKdm13Z2Z4
IGFuZCByZXN0IG9mIGRybS4KCj4gPiAgLSBoYW5kbGluZyBvZiBmZWF0dWUgZmxhZ3MsIGFzIGFs
d2F5cywgaXMgcmVzcG9uc2liaWxpdHkgb2YgdGhlCj4gPiBkcml2ZXIKPiA+IGlmc2VsZgo+ID4g
IC0gd2l0aCB0aGlzIHBhdGNoLCBpb2N0bCBkaXJlY3Rpb24gaXMgYWxzbyBoYW5kbGVkIGJ5IGNv
cmUuCj4gPiAKPiA+IEhlcmUgY29yZSBlbnN1cmVzIHdlIG9ubHkgY29weSBpbi9vdXQgYXMgbXVj
aCBkYXRhIGFzIHRoZSBrZXJuZWwKPiA+IGltcGxlbWVudGF0aW9uIGNhbiBoYW5kbGUuCj4gPiAK
PiA+IAo+ID4gTGV0J3MgY29uc2lkZXIgdGhlIGZvbGxvd2luZyByZWFsIHdvcmxkIGV4YW1wbGUg
LSBtc20gYW5kIHZpcnRpb19ncHUuCj4gPiAKPiA+IEFuIGluIGZpZWxkIG9mIGFuIF9JT1cgaW9j
dGwgYmVjb21lcyBpbi9vdXQgYWthIF9JT1JXIGlvY3RsLgo+ID4gIC0gd2UgYWRkIGEgZmxhZyB0
byBhbm5vdGF0ZS9yZXF1ZXN0IHRoZSBvdXQsIGFzIGFsd2F5cyBpbnZhbGlkIGZsYWdzCj4gPiBh
cmUgcmV0dXJuIC1FSU5WQUwKPiA+ICAtIHdlIGNoYW5nZSB0aGUgaW9jdGwgZW5jb2RpbmcKPiA+
IAo+ID4gQXMgY3VycmVudGx5IGhhbmRsZWQgYnkgY29yZSBEUk0sIG9sZCBrZXJuZWwvbmV3IHVz
ZXJzcGFjZSBhbmQKPiA+IHZpY2UtdmVyc2Egd29ya3MganVzdCBmaW5lLiBTYWRseSwgdm13Z2Z4
IHdpbGwgZXJyb3Igb3V0LCB3aGlsZSBpdAo+ID4gY291bGQKPiA+IGJlIGF2b2lkZWQuCj4gCj4g
SU1PIGJhc2ljYWxseSB3ZSBoYXZlIGEgdHJhZGVvZmYgYmV0d2VlbiBzdHJpY3QgY2hlY2tpbmcg
aW4gdGhpcyBjYXNlLAo+IGFuZCBuZXcgdXNlci1zcGFjZSB2cyBvbGQga2VybmVsICJoYXp6bGUt
ZnJlZSIgdHJhbnNpdGlvbiBpbiB0aGUKPiByZWxheGVkIGNhc2UuIAo+IApQcmVjaXNlbHkuIElm
IEkgcmVhZCB0aGUgY29kZSBjb3JyZWN0bHksIEFUTSBuZXcgdXNlcnNwYWNlIHdpbGwgZmFpbAph
Z2FpbnN0IG9sZCBrZXJuZWxzLiBVbmxlc3MgdXNlcnNwYWNlIHdyaXRlcyB0d28gdmVyc2lvbnMg
b2YgdGhlIGlvY3RsIC0Kd2l0aCB3aXRoIGVhY2ggZW5jb2RpbmcuCgo+ID4gCj4gPiBBcyBzYWlk
IGFib3ZlLCBJJ2xsIGdsYWRseSBhZGp1c3QgY29yZSBhbmQvb3Igb3RoZXJzLCBpZiB0aGlzIHJl
bGF4ZWQKPiA+IGFwcHJvYWNoIGNhdXNlcyBhbiBpc3N1ZSBzb21ld2hlcmUuIEEgc3BlY2lmaWMg
dXNlLWNhc2UsIHJlYWwgb3IKPiA+IGh5cG90aGV0aWNhbCB3aWxsIGJlIGFwcHJlY2lhdGVkLgo+
IAo+IFRvIG1lIHRoZXJlIGFyZSB0d28gaW1wb3J0YW50IHJlYXNvbnMgdG8ga2VlcCB0aGUgc3Ry
aWN0IGFwcHJvYWNoLgo+IAo+IDEpIEF2b2lkIHVzZXItc3BhY2UgbWlzdGFrZXMgZWFybHkgaW4g
dGhlIGRldmVsb3BtZW50IGN5Y2xlLiBXZSBjYW4ndAo+IGRpc3Rpbmd1aXNoIGJldHdlZW4gYnVn
Z3kgdXNlci1zcGFjZSBhbmQgIm5ldyIgdXNlci1zcGFjZS4gVGhpcyBpcwo+IGltcG9ydGFudCBi
ZWNhdXNlIG9mIFthXSkgYmVsb3cuCj4gCkNhbiB5b3UgcHJvdmlkZSBhIGNvbmNyZXRlIGV4YW1w
bGUsIHBsZWFzZT8KCj4gMikgQ2F0Y2ggYSBsb3Qgb2YgZnV6emVyIGNvbWJpbmF0aW9ucyBhbmQg
ZXJyb3Igb3V0IGVhcmx5IGluc3RlYWQgb2YKPiBmb3J3YXJkaW5nIHRoZW0gdG8gdGhlIGlvY3Rs
IGZ1bmN0aW9uIHdoZXJlIHRoZXkgbWF5IGNhdXNlIGhhcm0uCj4gClN0cnVnZ2xpbmcgdG8gc2Vl
IHdoeSB0aGlzIGlzIGEgcHJvYmxlbT8gQXQgc29tZSBwb2ludCB0aGUgZnV6emVyIHdpbGwKZ2V0
IHBhc3QgdGhpcyBmaXJzdCBsaW5lIG9mIGRlZmVuY2UsIHNvIHdlIHdhbnQgdG8gbWFrZSB0aGUg
cmVzdCBvZiB0aGUKaW9jdGwgaXMgcm9idXN0LgoKCj4gSSB0aGluayB0aGUgbmV3IHVzZXItc3Bh
Y2UgdnMgb2xkIGtlcm5lbCBjYW4gYmUgaGFuZGxlZCBuaWNlbHkgaW4gdXNlci0KPiBzcGFjZSB3
aXRoIGZlYXR1cmUgZmxhZ3Mgb3IgQVBJIHZlcnNpb25zLiBUaGF0J3MgdGhlIHdheSB3ZSd2ZSBo
YW5kbGVkCj4gdGhlbSB1cCB0byBub3c/Cj4gCkhvdyBpcyBhIGZlYXR1cmUgZmxhZyBkb2luZyB0
byBoZWxwIGlmIHRoZSBlbmNvZGluZyBjaGFuZ2VzIGZyb20gX0lPVwp0byBfSU9SVz8KCgpUaGFu
a3MKRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
