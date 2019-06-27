Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D3657AAF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 06:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745396E598;
	Thu, 27 Jun 2019 04:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DACE8982E;
 Thu, 27 Jun 2019 04:34:18 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p11so786119wre.7;
 Wed, 26 Jun 2019 21:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E7QHphyO5PnY4i5UMFD/blTa6mTFJJf0E1PIuwNj1uo=;
 b=Bx4ovM+nvXu+yrigkdiiA7KfSgiZTfo05p70MxciLn7XTqmwS2R8emICGjPmvJ6sPh
 buuDtmwS594CH4WuOd2Kb7SJF0oMm3SSCNa1+2P7uafAfjtpuoh+05BFCBbBR8CoWrOb
 47n+lFe1L+gpxXHCet4kvBfku+iwtI/eSo6DdR4lyjbhfThG5xVv6x53T06w/tCMeEUF
 ko7GvMXGC9bd2UmZrWznpTR8Uzr8nk2g879y0xMU40Oep0tI4JQKt/BNJVCi9GeHb6Uh
 tvXicXI6yZ0gai6Vei+YcpUCUQkMiJZUlhA7N0kV7TDIWhsLhCxQ/DlmMd2RBROjh97n
 iIoA==
X-Gm-Message-State: APjAAAWzThs4ZUNyx+Fb50y7soJwQAwF37pGjkONQA2YEuGudTMQloN9
 er9iEeSa3Z7vgIJoqPk2Sw9su+t6laMCeOnRzUQ=
X-Google-Smtp-Source: APXvYqxYLRW1sFcU9pZiZzP6dnH38+00jfMSQbSYnZSajM7ezaAYPUZ1yQkDPFs5Gjbay3iOHo9OdxuqZ9cwcxqjGJQ=
X-Received: by 2002:adf:e9c6:: with SMTP id l6mr1183346wrn.216.1561610056661; 
 Wed, 26 Jun 2019 21:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-10-Kenny.Ho@amd.com>
 <20190626162554.GU12905@phenom.ffwll.local>
In-Reply-To: <20190626162554.GU12905@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Thu, 27 Jun 2019 00:34:05 -0400
Message-ID: <CAOWid-dO5QH4wLyN_ztMaoZtLM9yzw-FEMgk3ufbh1ahHJ2vVg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 09/11] drm,
 cgroup: Add per cgroup bw measure and control
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E7QHphyO5PnY4i5UMFD/blTa6mTFJJf0E1PIuwNj1uo=;
 b=V5RV1ENXG2g7JfwKywkW8Gco79F4aTFWh0rqr8JLlEyOrDzXt4UYQd9iE0VWGxYInD
 pUEiUwKRnAL7Z8+f2IQy0w0v2K70595L62s/R/+3/SE3uAHPNnjm7SG79QGSvqg3hpn3
 YhNMG/cnXMMnptzlyW7wsjoQqt/2T5GpjIrldNXLaLsA1HtmkrCaqNZl9PE8H17bTNzD
 2auJQqGaGYXQ4kKivNt6lnAf4KvVf6oRfVQ5c8gF/Xfmo3K8TYE+6tAoajjphrUcr4Af
 swiqHK0zzEsteaufrOHOWQGzZ8RBIR6JhrH6StkkcgttRdlxcDC5V4+9FWx7Bop4MkF/
 a63Q==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, joseph.greathouse@amd.com,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTI6MjUgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDExOjA1OjIwQU0gLTA0
MDAsIEtlbm55IEhvIHdyb3RlOgo+ID4gVGhlIGJhbmR3aWR0aCBpcyBtZWFzdXJlZCBieSBrZWVw
aW5nIHRyYWNrIG9mIHRoZSBhbW91bnQgb2YgYnl0ZXMgbW92ZWQKPiA+IGJ5IHR0bSB3aXRoaW4g
YSB0aW1lIHBlcmlvZC4gIFdlIGRlZmluZWQgdHdvIHR5cGUgb2YgYmFuZHdpZHRoOiBidXJzdAo+
ID4gYW5kIGF2ZXJhZ2UuICBBdmVyYWdlIGJhbmR3aWR0aCBpcyBjYWxjdWxhdGVkIGJ5IGRpdmlk
aW5nIHRoZSB0b3RhbAo+ID4gYW1vdW50IG9mIGJ5dGVzIG1vdmVkIHdpdGhpbiBhIGNncm91cCBi
eSB0aGUgbGlmZXRpbWUgb2YgdGhlIGNncm91cC4KPiA+IEJ1cnN0IGJhbmR3aWR0aCBpcyBzaW1p
bGFyIGV4Y2VwdCB0aGF0IHRoZSBieXRlIGFuZCB0aW1lIG1lYXN1cmVtZW50IGlzCj4gPiByZXNl
dCBhZnRlciBhIHVzZXIgY29uZmlndXJhYmxlIHBlcmlvZC4KPgo+IFNvIEknbSBub3QgdG9vIHN1
cmUgZXhwb3NpbmcgdGhpcyBpcyBhIGdyZWF0IGlkZWEsIGF0IGxlYXN0IGRlcGVuZGluZyB1cG9u
Cj4gd2hhdCB5b3UncmUgdHJ5aW5nIHRvIGRvIHdpdGggaXQuIFRoZXJlJ3MgYSBmZXcgY29uY2Vy
bnMgaGVyZToKPgo+IC0gSSB0aGluayBibyBtb3ZlbWVudCBzdGF0cyBtaWdodCBiZSB1c2VmdWws
IGJ1dCB0aGV5J3JlIG5vdCB0ZWxsaW5nIHlvdQo+ICAgZXZlcnl0aGluZy4gQXBwbGljYXRpb25z
IGNhbiBhbHNvIGNvcHkgZGF0YSB0aGVtc2VsdmVzIGFuZCBwdXQgYnVmZmVycwo+ICAgd2hlcmUg
dGhleSB3YW50IHRoZW0sIGVzcGVjaWFsbHkgd2l0aCBtb3JlIGV4cGxpY2l0IGFwaXMgbGlrZSB2
ay4KPgo+IC0gd2hpY2gga2luZCBvZiBtb3ZlcyBhcmUgd2UgdGFsa2luZyBhYm91dCBoZXJlPyBF
dmljdGlvbiByZWxhdGVkIGJvIG1vdmVzCj4gICBzZWVtIG5vdCBjb3VudGVkIGhlcmUsIGFuZCBp
ZiB5b3UgaGF2ZSBsb3RzIG9mIGdwdXMgd2l0aCBmdW5ueQo+ICAgaW50ZXJjb25uZWN0cyB5b3Ug
bWlnaHQgYWxzbyBnZXQgb3RoZXIga2luZHMgb2YgbW92ZXMsIG5vdCBqdXN0IHN5c3RlbQo+ICAg
cmFtIDwtPiB2cmFtLgpFdmljdGlvbiBtb3ZlIGlzIGNvdW50ZWQgYnV0IEkgdGhpbmsgSSBwbGFj
ZWQgdGhlIGRlbGF5IGluIHRoZSB3cm9uZwpwbGFjZSAodGhlIHRyYWNraW5nIG9mIGJ5dGUgbW92
ZWQgaXMgaW4gcHJldmlvdXMgcGF0Y2ggaW4KdHRtX2JvX2hhbmRsZV9tb3ZlX21lbSwgd2hpY2gg
aXMgY29tbW9uIHRvIGFsbCBtb3ZlIGFzIGZhciBhcyBJIGNhbgp0ZWxsLikKCj4gLSBXaGF0IGhh
cHBlbnMgaWYgd2Ugc2xvdyBkb3duLCBidXQgc29tZW9uZSBlbHNlIG5lZWRzIHRvIGV2aWN0IG91
cgo+ICAgYnVmZmVycy9tb3ZlIHRoZW0gKHR0bSBpcyBhdG0gbm90IGdyZWF0IGF0IHRoaXMsIGJ1
dCBDaHJpc3RpYW4gS8O2bmlnIGlzCj4gICB3b3JraW5nIG9uIHBhdGNoZXMpLiBJIHRoaW5rIHRo
ZXJlJ3MgbG90cyBvZiBwcmlvcml0eSBpbnZlcnNpb24KPiAgIHBvdGVudGlhbCBoZXJlLgo+Cj4g
LSBJZiB0aGUgZ29hbCBpcyB0byBhdm9pZCB0aHJhc2hpbmcgdGhlIGludGVyY29ubmVjdHMsIHRo
ZW4gdGhpcyBpc24ndCB0aGUKPiAgIGZ1bGwgcGljdHVyZSBieSBmYXIgLSBhcHBzIGNhbiB1c2Ug
Y29weSBlbmdpbmVzIGFuZCBleHBsaWNpdCBwbGFjZW1lbnQsCj4gICBhZ2FpbiB0aGF0J3MgaG93
IHZ1bGthbiBhdCBsZWFzdCBpcyBzdXBwb3NlZCB0byB3b3JrLgo+Cj4gSSBndWVzcyB0aGVzZSBh
bGwgYm9pbCBkb3duIHRvOiBXaGF0IGRvIHlvdSB3YW50IHRvIGFjaGlldmUgaGVyZT8gVGhlCj4g
Y29tbWl0IG1lc3NhZ2UgZG9lc24ndCBleHBsYWluIHRoZSBpbnRlbmRlZCB1c2UtY2FzZSBvZiB0
aGlzLgpUaHJhc2hpbmcgcHJldmVudGlvbiBpcyB0aGUgaW50ZW50LiAgSSBhbSBub3QgZmFtaWxp
YXIgd2l0aCBWdWxrYW4gc28KSSB3aWxsIGhhdmUgdG8gZ2V0IGJhY2sgdG8geW91IG9uIHRoYXQu
ICBJIGRvbid0IGtub3cgaG93IHRob3NlCmV4cGxpY2l0IHBsYWNlbWVudCB0cmFuc2xhdGUgaW50
byB0aGUga2VybmVsLiAgQXQgdGhpcyBzdGFnZSwgSSB0aGluawppdCdzIHN0aWxsIHdvcnRoIHdo
aWxlIHRvIGhhdmUgdGhpcyBhcyBhIHJlc291cmNlIGV2ZW4gaWYgc29tZQphcHBsaWNhdGlvbnMg
YnlwYXNzIHRoZSBrZXJuZWwuICBJIGNlcnRhaW5seSB3ZWxjb21lIG1vcmUgZmVlZGJhY2sgb24K
dGhpcyB0b3BpYy4KClJlZ2FyZHMsCktlbm55Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
