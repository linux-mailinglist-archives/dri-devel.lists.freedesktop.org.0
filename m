Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA09131C3FF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 23:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A7A6E935;
	Mon, 15 Feb 2021 22:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F211E89EBB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 20:46:41 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id x3so5726348qti.5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 12:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=3vnbyd+FSQ7JLkQZLcxkUBRVmalOAVC3JmRRBLUbqks=;
 b=esWzugW0DKNBhrEoOD3RZZJolEW7Ikdy5h5A40L1tqevvbAOT0V/axZemZNOQYOsnx
 ZqD3ZNUy7by/NGsHl09vQs2I9j3jVNSSq/5jppK8df5zAjh2YbuB92wVmlkE6owxZt6Z
 fwPkbPpOrOtuUOH/tqvvcYAUJ7p8hpPxFMCbkziFPOS2od1Xdv+xAzbaRryT395mvWIA
 QyyYXiKXhyZNlxJBfjOYZS5ljhuVQqbKjm+x0+mXk6Y6fxHbxD/TWeJerjITehGHcVPB
 pxTKBBtJtVVSfRfx3vwnolnX6XUXAf2UOCCWDeKRGFqpkPkgkyir6U39VbeZbqeRFUQ0
 u1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=3vnbyd+FSQ7JLkQZLcxkUBRVmalOAVC3JmRRBLUbqks=;
 b=kaIJpqpxkZcHZpZX6vdaYVl5XGpDje1tYUedLnpuHO0GeJcjtXOL/gHDn56c3vK10E
 RiGdeMt4NtSohtT+MdEDLPNYNsvG5wTCy4KmwR5R1NeDTaW0fJRyUUYSdAZ76StydgJ1
 X7YJsxRwKCStSTu7QSvwOW3dH/2DcqsP5JVcQd+WJMeBFPjkECghbdbjd4THNhOXOIM8
 sjb6VwJuIQXhxvDXEY5qonCnJjejXzU1+S8Cd1mhRCZIfk73vjE54IXXxsaSsa0Sdii2
 Y5lwO2EFMuCjWvtLxJRPCko2k6HilOS01Zd2Llt7bCMrQ/u41aJBAA1dc8xxgG+2ZXdc
 3Oqg==
X-Gm-Message-State: AOAM533fyNhJeIahI2s4B+jYCozwhN+aMsBUyW74gY8Oa6BZJi/EmPBV
 UlyGI6Ug8EBjMjsHWVezBqbIvw==
X-Google-Smtp-Source: ABdhPJxFh3xw6PwIlF1Y7XPVhEvBoCKjuezA7yM/mz2kCLQ8EzJp2uMSCiO+RZLY6uXhugkk3quoNg==
X-Received: by 2002:ac8:1009:: with SMTP id z9mr15996768qti.347.1613422001232; 
 Mon, 15 Feb 2021 12:46:41 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168])
 by smtp.gmail.com with ESMTPSA id k187sm13020361qkc.74.2021.02.15.12.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 12:46:40 -0800 (PST)
Message-ID: <6e107811295b7fdd96525453ea5587ee6adc1b06.camel@ndufresne.ca>
Subject: Re: DMA-buf and uncached system memory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, linux-media
 <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, lkml <linux-kernel@vger.kernel.org>
Date: Mon, 15 Feb 2021 15:46:39 -0500
In-Reply-To: <80c42ce0-6df1-71ab-81ec-e46cc56840ba@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <e6897f92-4c61-cd42-2822-43c50a744d4c@suse.de>
 <302e06ad-f979-dc77-5d84-fa0923aa4632@suse.de>
 <80c42ce0-6df1-71ab-81ec-e46cc56840ba@amd.com>
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Feb 2021 22:24:30 +0000
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbHVuZGkgMTUgZsOpdnJpZXIgMjAyMSDDoCAxMzoxMCArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyBhIMOpY3JpdMKgOgo+IAo+IAo+IEFtIDE1LjAyLjIxIHVtIDEzOjAwIHNjaHJpZWIgVGhvbWFz
IFppbW1lcm1hbm46Cj4gPiBIaQo+ID4gCj4gPiBBbSAxNS4wMi4yMSB1bSAxMDo0OSBzY2hyaWVi
IFRob21hcyBaaW1tZXJtYW5uOgo+ID4gPiBIaQo+ID4gPiAKPiA+ID4gQW0gMTUuMDIuMjEgdW0g
MDk6NTggc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+ID4gPiA+IEhpIGd1eXMsCj4gPiA+ID4g
Cj4gPiA+ID4gd2UgYXJlIGN1cnJlbnRseSB3b3JraW5nIGFuIEZyZWVzeW5jIGFuZCBkaXJlY3Qg
c2NhbiBvdXQgZnJvbSBzeXN0ZW0gCj4gPiA+ID4gbWVtb3J5IG9uIEFNRCBBUFVzIGluIEErQSBs
YXB0b3BzLgo+ID4gPiA+IAo+ID4gPiA+IE9uIHByb2JsZW0gd2Ugc3R1bWJsZWQgb3ZlciBpcyB0
aGF0IG91ciBkaXNwbGF5IGhhcmR3YXJlIG5lZWRzIHRvIAo+ID4gPiA+IHNjYW4gb3V0IGZyb20g
dW5jYWNoZWQgc3lzdGVtIG1lbW9yeSBhbmQgd2UgY3VycmVudGx5IGRvbid0IGhhdmUgYSAKPiA+
ID4gPiB3YXkgdG8gY29tbXVuaWNhdGUgdGhhdCB0aHJvdWdoIERNQS1idWYuCj4gPiAKPiA+IFJl
LXJlYWRpbmcgdGhpcyBwYXJhZ3JhaCwgaXQgc291bmRzIG1vcmUgYXMgaWYgeW91IHdhbnQgdG8g
bGV0IHRoZSAKPiA+IGV4cG9ydGVyIGtub3cgd2hlcmUgdG8gbW92ZSB0aGUgYnVmZmVyLiBJcyB0
aGlzIGFub3RoZXIgY2FzZSBvZiB0aGUgCj4gPiBtaXNzaW5nLXBpbi1mbGFnIHByb2JsZW0/Cj4g
Cj4gTm8sIHlvdXIgb3JpZ2luYWwgaW50ZXJwcmV0YXRpb24gd2FzIGNvcnJlY3QuIE1heWJlIG15
IHdyaXRpbmcgaXMgYSBiaXQgCj4gdW5zcGVjaWZpYy4KPiAKPiBUaGUgcmVhbCB1bmRlcmx5aW5n
IGlzc3VlIGlzIHRoYXQgb3VyIGRpc3BsYXkgaGFyZHdhcmUgaGFzIGEgcHJvYmxlbSAKPiB3aXRo
IGxhdGVuY3kgd2hlbiBhY2Nlc3Npbmcgc3lzdGVtIG1lbW9yeS4KPiAKPiBTbyB0aGUgcXVlc3Rp
b24gaXMgaWYgdGhhdCBhbHNvIGFwcGxpZXMgdG8gZm9yIGV4YW1wbGUgSW50ZWwgaGFyZHdhcmUg
b3IgCj4gb3RoZXIgZGV2aWNlcyBhcyB3ZWxsIG9yIGlmIGl0IGlzIGp1c3Qgc29tZXRoaW5nIEFN
RCBzcGVjaWZpYz8KCkkgZG8gYmVsaWV2ZSB0aGF0IHRoZSBhbnN3ZXIgaXMgeWVzLCBJbnRlbCBk
aXNwbGF5IGhhdmUgc2ltaWxhciBpc3N1ZSB3aXRoCmxhdGVuY3ksIGhlbmNlIHJlcXVpcmVzIHVu
LWNhY2hlZCBtZW1vcnkuCgo+IAo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+IAo+ID4gCj4gPiBC
ZXN0IHJlZ2FyZHMKPiA+IFRob21hcwo+ID4gCj4gPiA+ID4gCj4gPiA+ID4gRm9yIG91ciBzcGVj
aWZpYyB1c2UgY2FzZSBhdCBoYW5kIHdlIGFyZSBnb2luZyB0byBpbXBsZW1lbnQgCj4gPiA+ID4g
c29tZXRoaW5nIGRyaXZlciBzcGVjaWZpYywgYnV0IHRoZSBxdWVzdGlvbiBpcyBzaG91bGQgd2Ug
aGF2ZSAKPiA+ID4gPiBzb21ldGhpbmcgbW9yZSBnZW5lcmljIGZvciB0aGlzPwo+ID4gPiAKPiA+
ID4gRm9yIHZtYXAgb3BlcmF0aW9ucywgd2UgcmV0dXJuIHRoZSBhZGRyZXNzIGFzIHN0cnVjdCBk
bWFfYnVmX21hcCwgCj4gPiA+IHdoaWNoIGNvbnRhaW5zIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24g
YWJvdXQgdGhlIG1lbW9yeSBidWZmZXIuIEluIAo+ID4gPiB2cmFtIGhlbHBlcnMsIHdlIGhhdmUg
dGhlIGludGVyZmFjZSBkcm1fZ2VtX3ZyYW1fb2Zmc2V0KCkgdGhhdCAKPiA+ID4gcmV0dXJucyB0
aGUgb2Zmc2V0IG9mIHRoZSBHUFUgZGV2aWNlIG1lbW9yeS4KPiA+ID4gCj4gPiA+IFdvdWxkIGl0
IGJlIGZlYXNpYmxlIHRvIGNvbWJpbmUgYm90aCBjb25jZXB0cyBpbnRvIGEgZG1hLWJ1ZiAKPiA+
ID4gaW50ZXJmYWNlIHRoYXQgcmV0dXJucyB0aGUgZGV2aWNlLW1lbW9yeSBvZmZzZXQgcGx1cyB0
aGUgYWRkaXRpb25hbCAKPiA+ID4gY2FjaGluZyBmbGFnPwo+ID4gPiAKPiA+ID4gVGhlcmUnZCBi
ZSBhIHN0cnVjdHVyZSBhbmQgYSBnZXR0ZXIgZnVuY3Rpb24gcmV0dXJuaW5nIHRoZSBzdHJ1Y3R1
cmUuCj4gPiA+IAo+ID4gPiBzdHJ1Y3QgZG1hX2J1Zl9vZmZzZXQgewo+ID4gPiDCoMKgwqDCoMKg
Ym9vbCBjYWNoZWQ7Cj4gPiA+IMKgwqDCoMKgwqB1NjQgYWRkcmVzczsKPiA+ID4gfTsKPiA+ID4g
Cj4gPiA+IC8vIHJldHVybiBvZmZzZXQgaW4gKm9mZgo+ID4gPiBpbnQgZG1hX2J1Zl9vZmZzZXQo
c3RydWN0IGRtYV9idWYgKmJ1Ziwgc3RydWN0IGRtYV9idWZfb2ZmICpvZmYpOwo+ID4gPiAKPiA+
ID4gV2hhdGV2ZXIgc2V0dGluZ3MgYXJlIHJldHVybmVkIGJ5IGRtYV9idWZfb2Zmc2V0KCkgYXJl
IHZhbGlkIHdoaWxlIAo+ID4gPiB0aGUgZG1hX2J1ZiBpcyBwaW5uZWQuCj4gPiA+IAo+ID4gPiBC
ZXN0IHJlZ2FyZHMKPiA+ID4gVGhvbWFzCj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IEFmdGVyIGFs
bCB0aGUgc3lzdGVtIG1lbW9yeSBhY2Nlc3MgcGF0dGVybiBpcyBhIFBDSWUgZXh0ZW5zaW9uIGFu
ZCAKPiA+ID4gPiBhcyBzdWNoIHNvbWV0aGluZyBnZW5lcmljLgo+ID4gPiA+IAo+ID4gPiA+IFJl
Z2FyZHMsCj4gPiA+ID4gQ2hyaXN0aWFuLgo+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
ID4gPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+ID4gPiAKPiA+
ID4gCj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+ID4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo+ID4gPiAKPiA+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
