Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C986F6CB5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A3B6E827;
	Mon, 11 Nov 2019 02:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B5D6E32D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2019 14:38:30 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id w11so3326403qvu.13
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Nov 2019 06:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Qt2wMGdl1RipdnSLZNHfmX2yJVEaI/jqpdJ8zv3Tan0=;
 b=ZUOx9r3xdQfRx92nXOgskkyki6tPSqJrTW5n15n2fwTTwNYSLP1spZeVdGbdJ3TN74
 BK14TBFdEGgL3Ao7dmj+J2FHa6Q1F9fptzY3znQ48t/XZqwY7pu1JSHnRTIX+9wbSBfu
 rX1QY1hO/56P34zfY0wFzeQrZfd56EqJ0QIKWwpFqJIWb1oLYRmTlQP+t30kQ0o2FKoj
 Qy1e7dw87q26WoyU15C19s+qwuzHirDb4KIAIaFPajmGHgOXYsXCU3IzcuQedH3zwpbK
 VEFe9OwDZSpg2QQDN7bvIiohDYnTlNs49UkHiHMMKiIq2ezSjTGRyxQAUvO5pFe1uWAD
 BMMQ==
X-Gm-Message-State: APjAAAXwp2KFpos9eIdHt1LLHZ06mR2fCjUmD59twOfT6WuntLHZotem
 xZzJJ4ATkhEkvruegRi7ePIbig==
X-Google-Smtp-Source: APXvYqy9jfnfWQy6j7o3WmwE225s6tK525MnQ1epAwgeeSHhPZiSQg8kQza1zdWU/zrIz8j1HM773g==
X-Received: by 2002:ad4:4dce:: with SMTP id
 cw14mr15391384qvb.185.1573310309270; 
 Sat, 09 Nov 2019 06:38:29 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
 by smtp.gmail.com with ESMTPSA id j25sm4095431qkk.3.2019.11.09.06.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2019 06:38:28 -0800 (PST)
Message-ID: <1e716ce134c5444949a1fe9be032a5ca3566f6e3.camel@ndufresne.ca>
Subject: Re: Overlay support in the i.MX7 display
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>, Stefan
 Agner <stefan@agner.ch>
Date: Sat, 09 Nov 2019 09:38:27 -0500
In-Reply-To: <78b6262cf5f6e9f60746559314fc9f1912365912.camel@pengutronix.de>
References: <20191101084318.GA8428@pendragon.ideasonboard.com>
 <78b6262cf5f6e9f60746559314fc9f1912365912.camel@pengutronix.de>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Qt2wMGdl1RipdnSLZNHfmX2yJVEaI/jqpdJ8zv3Tan0=;
 b=t8+Alah8bysBpO6Bzd3hkiSznPxxGhApn7zKMQby5MIyMcN15w5bCKuMGisUCKr6aH
 IWCvtN7Sr0gyZluPct9ngNh4iIEkVYMQqXhE9hoGrocEXEMysk/7V2vo8MO+zXDZ3/Io
 InPygC0aj1sylUbRVxc+cns5Zp4Wi2CnedfRufUYY/bBYeCkYdXA7nJiWuZkd0KUOS7u
 RUD36hEQkEk8qKiZg9IndZZBhJoMVfSPAYol+Ho4v9jksXZgT19FKk8Mq3G9p0opE14J
 Q/Rc/hvuAesXZx2JBP1zY13MraXnd4rjdzq7nZrKNCtQej2QiBGA3r8qCh+ngOzjVRjT
 HKag==
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
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWFyZGkgMDUgbm92ZW1icmUgMjAxOSDDoCAxMDoxNyArMDEwMCwgUGhpbGlwcCBaYWJlbCBh
IMOpY3JpdCA6Cj4gSGkgTGF1cmVudCwKPiAKPiBPbiBGcmksIDIwMTktMTEtMDEgYXQgMTA6NDMg
KzAyMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBIZWxsbywKPiA+IAo+ID4gSSdtIGxv
b2tpbmcgYXQgdGhlIGF2YWlsYWJsZSBvcHRpb25zIHRvIHN1cHBvcnQgb3ZlcmxheXMgaW4gdGhl
IGRpc3BsYXkKPiA+IHBpcGVsaW5lIG9mIHRoZSBpLk1YNy4gVGhlIExDRElGIGl0c2VsZiB1bmZv
cnR1bmFsdGV5IGRvZXNuJ3Qgc3VwcG9ydAo+ID4gb3ZlcmxheXMsIHRoZSBmZWF0dXJlIGJlaW5n
IGltcGxlbWVudGVkIGluIHRoZSBQWFAuIEEgZHJpdmVyIGZvciB0aGUgUFhQCj4gPiBpcyBhdmFp
bGFibGUgYnV0IG9ubHkgc3VwcG9ydHMgb2xkZXIgU29DcyB3aG9zZSBQWFAgZG9lc24ndCBzdXBw
b3J0Cj4gPiBvdmVybGF5cy4gVGhpcyBkcml2ZXIgaXMgaW1wbGVtZW50ZWQgYXMgYSBWNEwyIG1l
bTJtZW0gZHJpdmVyLCB3aGljaAo+ID4gbWFrZXMgc3VwcG9ydCBvZiBhZGRpdGlvbmFsIGlucHV0
IGNoYW5uZWxzIGltcG9zc2libGUuCj4gPiAKPiA+IEhlcmUgYXJlIHRoZSBvcHRpb25zIEkgY2Fu
IGVudmlzaW9uOgo+ID4gCj4gPiAtIEV4dGVuZCB0aGUgZXhpc3RpbmcgUFhQIGRyaXZlciB0byBz
dXBwb3J0IG11bHRpcGxlIGNoYW5uZWxzLiBUaGlzIGlzCj4gPiAgIHRlY2huaWNhbGx5IGZlYXNp
YmxlLCBidXQgd2lsbCByZXF1aXJlIG1vdmluZyBhd2F5IGZyb20gdGhlIFY0TDIKPiA+ICAgbWVt
Mm1lbSBmcmFtZXdvcmssIHdoaWNoIHdvdWxkIGJyZWFrIHVzZXJzcGFjZS4gSSBkb24ndCB0aGlu
ayB0aGlzCj4gPiAgIHBhdGggY291bGQgbGVhZCBhbnl3aGVyZS4KPiAKPiBJIG1heSBiZSBiaWFz
ZWQsIGJ1dCBwbGVhc2UgZG9uJ3QgYnJlYWsgdGhlIFY0TDIgbWVtMm1lbSB1c2VjYXNlIDopCj4g
Cj4gPiAtIFdyaXRlIGEgbmV3IFBYUCBkcml2ZXIgZm9yIHRoZSBpLk1YNywgc3RpbGwgdXNpbmcg
VjRMMiwgYnV0IHdpdGgKPiA+ICAgbXVsdGlwbGUgdmlkZW8gbm9kZXMuIFRoaXMgd291bGQgYWxs
b3cgYmxlbmRpbmcgbXVsdGlwbGUgbGF5ZXJzLCBidXQKPiA+ICAgd291bGQgcmVxdWlyZSB3cml0
aW5nIHRoZSBvdXRwdXQgdG8gbWVtb3J5LCB3aGlsZSB0aGUgUFhQIGhhcyBzdXBwb3J0Cj4gPiAg
IGZvciBkaXJlY3QgY29ubmVjdGlvbnMgdG8gdGhlIExDRElGICh0aHJvdWdoIHNtYWxsIFNSQU0g
YnVmZmVycykuCj4gPiAgIFBlcmZvcm1hbmNlcyB3b3VsZCB0aHVzIGJlIHN1Ym9wdGltYWwuIFRo
ZSBBUEkgd291bGQgYWxzbyBiZSBhd2t3YXJkLAo+ID4gICBhcyB1c2luZyB0aGUgUFhQIGZvciBk
aXNwbGF5IHdvdWxkIHJlcXVpcmUgdXNhZ2Ugb2YgVjRMMiBpbgo+ID4gICBhcHBsaWNhdGlvbnMu
Cj4gCj4gSSdtIG5vdCBzdXJlIFY0TDIgaXMgdGhlIGJlc3QgQVBJIGZvciBtdWx0aS1wYXNzIDJE
IGNvbXBvc2l0aW9uLAo+IGVzcGVjaWFsbHkgYXMgdGhlIFBYUCBpcyBhYmxlIHRvIGJsaXQgYW4g
b3ZlcmxheSBvbnRvIGEgYmFja2dyb3VuZCBpbgo+IHBsYWNlLgoKVGhlcmUgd2FzIHNvbWUgdXNl
cnNwYWNlIChHU3RyZWFtZXIgZWxlbWVudCkgZG9pbmcgZXhhY3RseSB0aGF0IHdpdGgKdjRsMiBt
Mm0gdXNpbmcgdGhlIGlteDYgZHJpdmVyLiBUaGUgQVBJIHdhcyBmaW5lLCBldmVuIHRob3VnaCBm
ZW5jZXMKd291bGQgaGF2ZSBtYWRlIHByb2dyYW1taW5nIGl0IGVhc2llci4KCmh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9nc3RyZWFtZXIvZ3N0LXBsdWdpbnMtZ29vZC9pc3N1ZXMvMzA4
Cgoobm90IG1lcmdlIGFzIHdlIGRvbid0IGhhdmUgYW4gYWdyZWVtZW50IG9uIGtlcm5lbCBzaWRl
LCBub3RhYmx5IHdlCmRvbid0IGV2ZW4gaGF2ZSBhIHdheSB0byBjb250cm9sIHRoZSBibGVuZCBm
dW5jdGlvbiwgc28gdGhlIHJlc3VsdCBpcwpsaWtlbHkgZGVwZW5kYW50IG9uIHRoZSB1c2UgY2Fz
ZSB0aGUgZHJpdmVyIHdhcyB3cml0dGVuIGZvcikKClRoZSByZWFsIGxpbWl0YXRpb24gd2FzIHRo
YXQgdGhlc2UgSVAgdXN1YWxseSBzdXBwb3J0cyBtb3JlIHRoZW4ganVzdApibGl0L2JsZW5kIG92
ZXIgYW5vdGhlciBzdXJmYWNlLCBhbmQgYXMgeW91IHNhaWQsIHN1cHBvcnRzIGJhY2tncm91bmQu
CkFuZCB0byBzdXBwb3J0IHRoaXMgdXNlIGNhc2UsIHdlJ2QgbmVlZCBhbiBtMm0gZHJpdmVyIHdp
dGggbXVsdGlwbGUgcXVldWVzIHBlciBkaXJlY3Rpb24uIFRoYXQgd2FzIGRpc2N1c3NlZCBpbiB0
aGF0IGxhc3Qgd29ya3Nob3AgYXQgRUxDRSwgYW5kIGFwcGxpZXMgdG8gb3RoZXIgbTJtIElQIGxp
a2UgbXV4ZXJzIGFuZCBkZW11eGVycyB3aGljaCBleGlzdCBvbiBTVEIga2luZCBvZiBTb0MuCgo+
IAo+ID4gLSBFeHRlbmQgdGhlIG14c2ZiIGRyaXZlciB3aXRoIFBYUCBzdXBwb3J0LCBhbmQgZXhw
b3NlIHRoZSBQWFAgaW5wdXRzIGFzCj4gPiAgIEtNUyBwbGFuZXMuIFRoZSBQWFAgd291bGQgb25s
eSBiZSB1c2VkIHdoZW4gYXZhaWxhYmxlLCBhbmQgd291bGQgYmUKPiA+ICAgdHJhbnNwYXJlbnQg
dG8gYXBwbGljYXRpb25zLiBUaGlzIHdvdWxkIGhvd2V2ZXIgcHJldmVudCB1c2luZyBpdAo+ID4g
ICBzZXBhcmF0ZWx5IGZyb20gdGhlIGRpc3BsYXkgKHRvIHBlcmZvcm0gbXVsdGktcGFzcyBhbHBo
YSBibGVuZGluZyBmb3IKPiA+ICAgaW5zdGFuY2UpLgo+IAo+IEZvciB0aGUgU1JBTSBibG9jayBy
b3cgYnVmZmVyIHBhdGggdG8gdGhlIExDRElGLCBJIHRoaW5rIHRoZSBLTVMgcGxhbmUKPiBhYnN0
cmFjdGlvbiBpcyB0aGUgd2F5IHRvIGdvLiBUaGUgRFJNIGFuZCBWNEwyIGRyaXZlcnMgY291bGQg
YmUgbWFkZSB0bwo+IHVzZSBhIHNoYXJlZCBiYWNrZW5kLCBzdWNoIHRoYXQgb25seSBvbmUgb2Yg
cGxhbmUgY29tcG9zaXRpb24gYW5kIFY0TDIKPiBzY2FsaW5nL0NTQyBmdW5jdGlvbnMgY2FuIHdv
cmsgYXQgdGhlIHNhbWUgdGltZS4KPiAKPiA+IFdoYXQgd291bGQgYmUgdGhlIGJlc3Qgb3B0aW9u
IGdvaW5nIGZvcndhcmQgPyBXb3VsZCBhbnkgb2YgeW91LCBieSBhbnkKPiA+IGNoYW5jZSwgaGF2
ZSBhbHJlYWR5IHN0YXJ0ZWQgd29yayBpbiB0aGlzIGFyZWEgPwo+IAo+IEkgaGF2ZSBub3Qgd29y
a2VkIG9uIHRoaXMuCj4gCj4gcmVnYXJkcwo+IFBoaWxpcHAKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
