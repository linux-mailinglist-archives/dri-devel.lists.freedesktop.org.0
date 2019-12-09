Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8F211790F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F9D6E560;
	Mon,  9 Dec 2019 22:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9310C6E560
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:09:31 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id z124so7783054pgb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 14:09:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=aH72KfB+jd8LoZ9WTIWQOhLHCco482dBV+3OetYANfk=;
 b=VX2mlnPOUQ7m1S8KdikgTn4TpYg2vfMq1bPjxk9cWcDC9qnqsPc64hpxeZb0BPq5QT
 hiWyezb2ld0O2JZU4Lp3Uj0g/c4CBTQxBllrneEDtN3bBvLK+l0d2GcUAkF0hvYAuQo3
 lXIDt4YJdn0Nrteo0enjJRCo6QpK+bZ82JO7dD6Jtf/u3o36cmO73V1IGnom9dvduzEd
 wB85BptsiNTD4SJXa4x2qjQI0RRzCMen6ybtTrNrwrFI23n5sy/khII4VjVQxG7UN5GX
 eBwPt3Z7fa9+h9HpIk6r0zBXv8aNOWWd0z+82AnKC+m7RXNR9n78E1zVGXDs9x9qEbuZ
 sxXw==
X-Gm-Message-State: APjAAAXAplkZMvZLqf3eRG5T+d9bwmVYw+czL7QQ9glcZZOJKGLhwfzJ
 +F9YM0Qnhy/2EXxWe/V0wIG8vQ==
X-Google-Smtp-Source: APXvYqw9VHnx8+RwX5no7IWuPVs1FzEgFK1TIEbb0vRSourFalI7XV39vudP3wtb+25GxinvpiQYEw==
X-Received: by 2002:a62:8456:: with SMTP id k83mr17928443pfd.29.1575929371147; 
 Mon, 09 Dec 2019 14:09:31 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id j14sm501754pgs.57.2019.12.09.14.09.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 14:09:30 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/9] drm/meson: add AFBC support
In-Reply-To: <20191021091509.3864-1-narmstrong@baylibre.com>
References: <20191021091509.3864-1-narmstrong@baylibre.com>
Date: Mon, 09 Dec 2019 14:09:30 -0800
Message-ID: <7hk175rw11.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=aH72KfB+jd8LoZ9WTIWQOhLHCco482dBV+3OetYANfk=;
 b=yqoI3WedmSPPH5+3eZ7ga+cYHKCC4gNQ3D5kXpyDlprI0f6kbGLO4sdxrvrd0bN8k6
 H9qxWAzCI63pOPBlXKaTLeqU5rDqkz+dDqurJLkSfXa5POqq7j7/3RCRlj3SWjbYfYlj
 V6fgcjE05Z6hk/oqlEos0KLQXDYHS5i8jbMMcwI/6LZbiYj8f/bEqhulSs28L8lYz78u
 3palGsGJGhkY3UHlFO+5WmaNEN26K/BQ+1wS+TOLDS0qIjD9erVYn15kMlV+PhJjo/Kw
 lJFkuo6zDnOlNNAD8C9OmuvUXdiBHsPiRwOonBcrcwrbyUwcuozDGVu4y0jM8K4xGXOf
 1ekA==
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
Cc: linux-amlogic@lists.infradead.org, ayan.halder@arm.com,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IFRoaXMg
YWRkcyBzdXBwb3J0IGZvciB0aGUgQVJNIEZyYW1lYnVmZmVyIENvbXByZXNzaW9uIGRlY29kZXJz
IGZvdW5kCj4gaW4gdGhlIEFtbG9naWMgR1hNIGFuZCBHMTJBIFNvQ3MuCj4KPiBUaGlzIHBhdGNo
c2V0IGlzIGEgbWVyZ2Ugb2YgdjIgImRybS9tZXNvbjogYWRkIEFGQkMgc3VwcG9ydCIgYXQgWzNd
IGFuZCB2Mgo+ICJkcm0vbWVzb246IGltcGxlbWVudCBSRE1BIGZvciBBRkJDIHJlc2V0IG9uIHZz
eW5jIiBhdCBbNF0uCgpPb3BzLCByZXBsaWVkIHRvIHRoZSB3cm9uZyBzZXJpZXMgZWFybGllci4u
LgoKPiBUaGUgVlBVIGVtYmVkcyBhICJSZWdpc3RlciBETUEiIHRoYXQgY2FuIHdyaXRlIGEgc2Vx
dWVuY2Ugb2YgcmVnaXN0ZXJzCj4gb24gdGhlIFZQVSBBSEIgYnVzLCBlaXRoZXIgbWFudWFsbHkg
b3IgdHJpZ2dlcmVkIGJ5IGFuIGludGVybmFsIElSUQo+IGV2ZW50IGxpa2UgVlNZTkMgb3IgYSBs
aW5lIGlucHV0IGNvdW50ZXIuCj4KPiBUaGUgQW1sb2dpYyBHWE0gYW5kIEcxMkEgQUZCQyBkZWNv
ZGVyIGFyZSB0b3RhbGx5IGRpZmZlcmVudCwgdGhlIEdYTSBvbmx5Cj4gaGFuZGxpbmcgb25seSB0
aGUgQUZCQyB2MS4wIG1vZGVzIGFuZCB0aGUgRzEyQSBkZWNvZGVyIGhhbmRsaW5nIHRoZQo+IEFG
QkMgdjEuMiBtb2Rlcy4KPgo+IFRoZSBHMTJBIEFGQkMgZGVjb2RlciBpcyBhbiBleHRlcm5hbCBJ
UCBpbnRlZ3JhdGVkIGluIHRoZSB2aWRlbyBwaXBlbGluZSwKPiBhbmQgdGhlIEdYTSBBRkJDIGRl
Y29kZXIgc2VlbXMgdG8gdGhlIGFuIEFtbG9naWMgY3VzdG9tIGRlY29kZXIgbW9yZQo+IHRpZ2hs
eSBpbnRlZ3JhdGVkIGluIHRoZSB2aWRlbyBwaXBlbGluZS4KPgo+IFRoZSBHWE0gQUZCQyBkZWNv
ZGVyIGNhbiBoYW5kbGUgb25seSBvbmUgQUZCQyBwbGFuZSBmb3IgMiBhdmFpbGFibGUKPiBPU0Qg
cGxhbmVzIGF2YWlsYWJsZSBpbiBIVywgYW5kIHRoZSBHMTJBIEFGQkMgZGVjb2RlciBjYW4gaGFu
ZGxlIHVwCj4gdG8gNCBBRkJDIHBsYW5lcyBmb3IgdXAgdG8gMyBPU0QgcGxhbmVzIGF2YWlsYWJs
ZSBpbiBIVy4KPgo+IFRoZSBBbWxvZ2ljIEdYTSBzdXBwb3J0cyAxNngxNiBTUEFSU0UgYW5kIDE2
eDE2IFNQTElUIEFGQkMgYnVmZmVycyB1cAo+IHRvIDRrLgo+Cj4gT24gdGhlIG90aGVyIHNpZGUs
IGZvciBHMTJBIFNQTElUIGlzIG1hbmRhdG9yeSBpbiAxNngxNiBibG9jayBtb2RlLCBidXQKPiBm
b3IgNGsgbW9kZXMgMzJ4OCtTUExJVCBBRkJDIGJ1ZmZlcnMgaXMgbWFuYWRhdG9yeSBmb3IgcGVy
Zm9ybWFuY2VzIHJlYXNvbnMuCj4KPiBUaGUgQW1sb2dpYyBHWE0gYW5kIEcxMkEgQUZCQyBkZWNv
ZGVycyBhcmUgaW50ZWdyYXRlZCB2ZXJ5IGRpZmZlcmVudGx5Lgo+Cj4gVGhlIEFtbG9naWMgR1hN
IGhhcyBhIGRpcmVjdCBvdXRwdXQgcGF0aCB0byB0aGUgT1NEMSBWSVUgcGl4ZWwgaW5wdXQsCj4g
YmVjYXVzZSB0aGUgR1hNIEFGQkMgZGVjb2RlciBzZWVtIHRvIGJlIGEgY3VzdG9tIElQIGRldmVs
b3BlZCBieSBBbWxvZ2ljLgo+Cj4gT24gdGhlIG90aGVyIHNpZGUsIHRoZSBBbWxvZ2ljIEcxMkEg
QUZCQyBkZWNvZGVyIHNlZW1zIHRvIGJlIGFuIGV4dGVybmFsCj4gSVAgdGhhdCBlbWl0IHBpeGVs
cyBvbiBhbiBBWEkgbWFzdGVyIGhvb2tlZCB0byBhICJNYWxpIFVucGFjayIgYmxvY2sKPiBmZWVk
aW5nIHRoZSBPU0QxIFZJVSBwaXhlbCBpbnB1dC4KPiBUaGlzIHVzZXMgYSB3ZWlyZCAiMHgxMDAw
MDAwIiBpbnRlcm5hbCBIVyBwaHlzaWNhbCBhZGRyZXNzIG9uIGJvdGgKPiBzaWRlcyB0byB0cmFu
c2ZlciB0aGUgcGl4ZWxzLgo+Cj4gRm9yIEFtbG9naWMgR1hNLCB0aGUgc3VwcG9ydGVkIHBpeGVs
IGZvcm1hdHMgYXJlIHRoZSBzYW1lIGFzIHRoZSBub3JtYWwKPiBsaW5lYXIgT1NEMSBtb2RlLgo+
Cj4gT24gdGhlIG90aGVyIHNpZGUsIEFtbG9naWMgYWRkZWQgc3VwcG9ydCBmb3IgYWxsIEFGQkMg
djEuMiBmb3JtYXRzIGZvcgo+IHRoZSBHMTJBIEFGQkMgaW50ZWdyYXRpb24uCj4KPiBUaGUgaW5p
dGlhbCBSRE1BIGltcGxlbWVudGF0aW9uIGhhbmRsZXMgYSBzaW5nbGUgY2hhbm5lbCAob3ZlciA4
KSwgdHJpZ2dlcmVkCj4gYnkgdGhlIFZTWU5DIGlycSBhbmQgZG9lcyBub3QgaGFuZGxlIHRoZSBS
RE1BIGlycS4KPgo+IFRoZSBSRE1BIHdpbGwgYmUgdXNlZnVsbCB0byByZXNldCBhbmQgcHJvZ3Jh
bSB0aGUgQUZCQyBkZWNvZGVyIHVuaXQKPiBvbiBlYWNoIHZzeW5jIHdpdGhvdXQgaW52b2x2aW5n
IHRoZSBpbnRlcnJ1cHQgaGFuZGxlciB0aGF0IGNhbgo+IGJlIG1hc2tlZCBmb3IgYSBsb25nIHBl
cmlvZCBvZiB0aW1lLCBwcm9kdWNpbmcgZGlzcGxheSBnbGl0Y2hlcy4KPgo+IEZvciB0aGlzIHdl
IHVzZSB0aGUgbWVzb25fcmRtYV93cml0ZWxfc3luYygpIHdoaWNoIGFkZHMgdGhlIHJlZ2lzdGVy
Cj4gd3JpdGUgdHVwbGUgKFZQVSByZWdpc3RlciBvZmZzZXQgYW5kIHJlZ2lzdGVyIHZhbHVlKSB0
byB0aGUgUkRNQSBidWZmZXIKPiBhbmQgd3JpdGUgdGhlIHZhbHVlIHRvIHRoZSBIVy4KPgo+IFdo
ZW4gZW5hYmxlZCwgdGhlIFJETUEgaXMgZW5hYmxlZCB0byByZXdyaXR0ZSB0aGUgc2FtZSBzZXF1
ZW5jZSBhdCB0aGUKPiBuZXh0IFZTWU5DIGV2ZW50LCB1bnRpbCBhIG5ldyBidWZmZXIgaXMgY29t
bWl0dGVkIHRvIHRoZSBPU0QgcGxhbmUuCj4KPiBGb3IgdGVzdGluZywgdGhlIG9ubHkgYXZhaWxh
YmxlIEFGQkMgYnVmZmVyIGdlbmVyYXRpb24gaXMgdGhlIEFuZHJvaWQKPiBZdWthd2EgRHZhbGlu
IEFuZHJvaWQgTWFsaSBibG9icyBmb3VuZCBhdCBbMV0uCj4KPiBCb3RoIFNvQ3MgaGFzIGJlZW4g
dGVzdGVkIHVzaW5nIGJ1ZmZlcnMgZ2VuZXJhdGVkIHVuZGVyIEFPU1AsIGJ1dCBvbmx5Cj4gRzEy
QSB3YXMgdGVzdGVkIHVzaW5nIGEgcnVudGltZSBzdHJlYW0gb2YgQUZCQyBidWZmZXJzLCBHWE0g
d2FzIG9ubHkKPiB0ZXN0ZWQgdXNpbmcgc3RhdGljIGJ1ZmZlcnMgbG9hZGVkIGZyb20gZmlsZXMu
CgpSZXZpZXdlZC1ieTogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KCktldmlu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
