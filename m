Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB2376C21
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 16:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9796ED9A;
	Fri, 26 Jul 2019 14:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6356ED9A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 14:55:17 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id p15so53504850eds.8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 07:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xt+fzgk2itKMyHMdFXgiwpB0mKWGAGBife6waDE7tvA=;
 b=N3NhTT87KB/WBbvk+kXTHg8Kb+Jz0ILXdaSJS+C7MzgnWiPw4gHrp6xDV6glQxTStC
 k8P07mJKySNRzx6EIssTXmB54VqGTZbLt5rgijFVtcQoEpCgJgx1zSnhv224OPa65zhD
 cQ/JbwCE3bkQkQKY9uA/1BI35bXiJ9NpxBqubjEtsIqeUpQJ7ixXfbil0YlJTudGGWah
 P63f/GufjxNYoly3qBgve5RCw4957wJIpiYxG4ipcMTKVhAAWY+Vg3prXOgHr5KQ75D4
 FZKM7nlTSxPZt5LZ6ojo0bk7s6LuZagsk+qU6O1JhM9av0EM3wWGe19MPfi2kP9Hq69O
 rutA==
X-Gm-Message-State: APjAAAVbjrVHLJqw1qglm7dJMEzO9VkL1kqa67O79NIuNs8u0db4KPHf
 xz5C20ezw2Ohf5YV0e7QLhw=
X-Google-Smtp-Source: APXvYqxUeNC4e1CdakX4BI7TvCB9fBXnh7C5o9RrIomiztmWP4BTNXMgCIrj/VnWHQ8MbyokEdP9TQ==
X-Received: by 2002:a50:d1d7:: with SMTP id i23mr84163785edg.151.1564152916389; 
 Fri, 26 Jul 2019 07:55:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f25sm13357029edm.83.2019.07.26.07.55.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 07:55:15 -0700 (PDT)
Date: Fri, 26 Jul 2019 16:55:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Controllers with several interface options - one or more drivers?
Message-ID: <20190726145513.GK15868@phenom.ffwll.local>
References: <20190304125033.28841-1-josef@lusticky.cz>
 <20190708145618.26031-1-josef@lusticky.cz>
 <20190726122510.GA14341@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726122510.GA14341@ravnborg.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xt+fzgk2itKMyHMdFXgiwpB0mKWGAGBife6waDE7tvA=;
 b=VYxtowvp3A47JZ/8Ys0oEDr5dM6qpjFXDZJ49jdjc0n3Z1uivGb6DHAJBoTuxr5dJS
 zcHZz/JX84VzGO0my/2GErynk9Uaq9hbJM1fGeGsV2PTjZ/DPGCmZ3w4q4Wc4fPNWLCg
 9FWCb3LJ7VFudTTpoRU6W9QQ4UNrpYnzn5MQs=
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 Josef Lusticky <josef@lusticky.cz>, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDI6MjU6MTBQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIEpvc2VmLCBEYW5pZWwgZXQgYWwuCj4gCj4gVGhlIGRyaXZlciB0aGF0IHRyaWdn
ZXJlZCB0aGlzIHJlcGx5IGlzIGEgZHJpdmVyIHRoYXQgYWRkcyBwYXJhbGxlbAo+IHN1cHBvcnQg
dG8gaWxpOTM0MSBpbiBhIGRlZGljYXRlZCBwYW5lbCBkcml2ZXIuCj4gVGhlIGlzc3VlIGhlcmUg
aXMgdGhhdCB3ZSBhbHJlYWR5IGhhdmUgYSB0aW55IGRyaXZlciB0aGF0IHN1cHBvcnRzIHRoZQo+
IGlsaTkzNDEgY29udHJvbGxlciAtIGJ1dCB3aXRoIGEgc2xpZ2h0bHkgZGlmZmVyZW50IGNvbmZp
Z3VyYXRpb24uCj4gCj4gVGhlIGlsaTkzNDEgc3VwcG9ydHMgc2V2ZXJhbCBpbnRlcmZhY2VzIC0g
ZnJvbSB0aGUgZGF0YXNoZWV0Ogo+ICAgICAiSUxJOTM0MSBzdXBwb3J0cyBwYXJhbGxlbCA4LS85
LS8xNi0vMTgtYml0IGRhdGEgYnVzCj4gICAgICBNQ1UgaW50ZXJmYWNlLCA2LS8xNi0vMTgtYml0
IGRhdGEgYnVzIFJHQiBpbnRlcmZhY2UgYW5kCj4gICAgICAzLS80LWxpbmUgc2VyaWFsIHBlcmlw
aGVyYWwgaW50ZXJmYWNlIChTUEkpIgo+IAo+IE5vcmFsZiAtIGluIGFub3RoZXIgbWFpbCBleHBs
YWluZWQ6Cj4gIgo+IFRoZSBNSVBJIEFsbGlhbmNlIGhhcyBsb3RzIG9mIHN0YW5kYXJkcyBzb21l
IHdydC4gZGlzcGxheSBjb250cm9sbGVyCj4gaW50ZXJmYWNlczoKPiAtIE1JUEkgREJJIC0gRGlz
cGxheSBCdXMgSW50ZXJmYWNlICh1c2VkIGZvciBjb21tYW5kcyBhbmQgb3B0aW9uYWxseSBwaXhl
bHMpCj4gLSBNSVBJIERQSSAtIERpc3BsYXkgUGl4ZWwgSW50ZXJmYWNlIChhbHNvIGNhbGxlZCBS
R0IgaW50ZXJmYWNlIG9yCj4gRE9UQ0xLIGludGVyZmFjZSkKPiAtIE1JUEkgRFNJIC0gRGlzcGxh
eSBTZXJpYWwgSW50ZXJmYWNlIChjb21tYW5kcyBhbmQgcGl4ZWxzKQo+IAo+IFRoZSBpbGk5MzQx
IHN1cHBvcnRzIGJvdGggTUlQSSBEQkkgYW5kIERQSS4KPiAiCj4gCj4gTUlQSSBEUEkgLSBpcyBh
IGdvb2QgZml0IGZvciBhIGRybV9wYW5lbCBkcml2ZXIuCj4gTUlQSSBEQkkgLSByZXF1aXJlcyBh
IGZ1bGwgZGlzcGxheSBjb250cm9sbGVyIGRyaXZlci4KPiAKPiBUaGVyZSBhcmUgbWFueSBvdGhl
ciBleGFtcGxlcyBvZiBkcml2ZXIgU29DIHRoYXQgaW4gdGhlIHNhbWUgd2F5Cj4gY2FuIGJlIHNl
ZW4gb25seSBhcyBhIHBhbmVsIG9yIGFzIGEgZnVsbCBkaXNwbGF5IGNvbnRyb2xsZXIgZHJpdmVy
Lgo+IAo+IFRoZSBvcGVuIHF1ZXN0aW9uIGhlcmUgaXMgaWYgd2Ugc2hvdWxkIHRyeSB0byBzdXBw
b3J0IGJvdGggY2FzZXMgaW4gdGhlCj4gc2FtZSBkcml2ZXIgLyBmaWxlLiBPciBzaGFsbCB3ZSBp
bXBsbWVudCB0d28gZGlmZmVyZW50IGRyaXZlcnMuCj4gT25lIGZvciB0aGUgcGFuZWwgdXNlLWNh
c2UuIEFuZCBvbmUgZm9yIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgdXNlY2FzZT8KPiAKPiBOb3Qg
c3VyZSAtIHNvIGFza2luZyBmb3IgZmVlZGJhY2suCgpJJ20gbm90IHN1cmUuIEN1cnJlbnRseSB3
ZSBkbyBoYXZlIERTSSBhbmQgZHVtYiBSR0IgcGFuZWxzIGFsbCBpbgpkcm0vcGFuZWwuIEkgZG9u
J3QgdGhpbmsgd2UgaGF2ZSBEQkkgcGFuZWxzIGluIHRoZXJlIHlldCwgYnV0IHRoZW4KZHJtL3Rp
bnkgaXMgdGhlIG9ubHkgb25lIHN1cHBvcnRpbmcgdGhlc2UuCgpJIGd1ZXNzIHdlIGNvdWxkIGxv
b2sgaW50byBtb3ZlIHNvbWUgb2YgdGhlIERCSSBwYW5lbCBkcml2ZXJzIGludG8gcGFuZWwKZHJp
dmVycywgYnV0IHRoYXQgbmVlZHMgYSBiaXQgbW9yZSBnbHVlIGFsbCBhcm91bmQuIEknbSBob25l
c3RseSBub3Qgc3VyZQpob3cgdGhlIGN1cnJlbnQgRFNJIGRyaXZlcnMgaW4gZHJtX3BhbmVsIHdv
cmsgZXhhY3RseSwgZXNwZWNpYWxseSBmb3IKY29tbWFuZCBtb2RlLgoKT3IgbWF5YmUgd2UgbmVl
ZCBhIG5ldyBpbnRlcmZhY2UgZm9yIGNvbW1hbmQgbW9kZS4KCldydCBzaGFyaW5nIGNvZGUgYmV0
d2VlbiBkcml2ZXJzIGZvciB0aGUgc2FtZSBjaGlwLCBidXQgZGlmZmVyZW50CmludGVyZmFjZXM6
IEkgd291bGRuJ3Qgd29ycnkgdG9vIG11Y2ggYWJvdXQgdGhhdC4gTWF5YmUgdHJ5IHRvIGhhdmUg
YQpzaGFyZWQgaGVhZGVyIGZpbGUgYXQgbGVhc3QgZm9yIHJlZ2lzdGVycy4gTG9uZyB0ZXJtIHdl
IGNvdWxkIGVuZCB1cCB3aXRoCm9uZSBkcml2ZXIgbW9kdWxlIHdoaWNoIGV4cG9zZXMgZGlmZmVy
ZW50IGZsYXZvdXJzIG9mIHRoZSBzYW1lIGNoaXAsIHNvCm11bHRpcGxlIGRybV9wYW5lbCBkcml2
ZXJzLCBvciBtYXliZSB3ZSdsbCBnZXQgc29tZXRoaW5nIG1vcmUgc3BlY2lmaWMgZm9yCmRzaS9k
YmkuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
