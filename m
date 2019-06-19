Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9ED4B682
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCAA6E36B;
	Wed, 19 Jun 2019 10:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DB56E362;
 Wed, 19 Jun 2019 10:52:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n9so2901753wru.0;
 Wed, 19 Jun 2019 03:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KQwws1irqMdpiDP3Ri0kIVWQWXD8+cH6oAmigewJQMs=;
 b=qmqlRLqvOU2ZCkIyWXrdmIA4lQwGRzN8gRIDwhwCyiPII6pma5DRqNaxutgmR11Slc
 GabXte5dpkSW454jQmVOBuGfOpa71G/Fkf+HWSuutMe54sj+APLuf99qbpBerlOjSxbs
 c2UDso58hYVHOnoXfuNhdQUNDtS9zI2+YecumTDzlOEzVSkbEYDhcRdHKXwkfz3uTWlV
 MOIwsgBlERGuII7rBrBiP8vcxWOAWmxD6O3MGKQB2/PO1ROKvuxKUmfyI7/jL5kzL3jq
 qtnNbl6zTdhlQnmQ5jFe8/xBWuCzqZ/QaGyQx+kfJkdop4SQRaMe44asVtvwDNd92OXx
 9/CQ==
X-Gm-Message-State: APjAAAVxzl00QyAulN6QLXOMsv36/6CzTZEgy1o7yQAlyrkYGjS8iu89
 b9APbSWwPATLrVjpNFJ6Ccg=
X-Google-Smtp-Source: APXvYqwdWpjHnykhql7lRK11R6Vz2hgS+ldYjItkN8Hdra3FTB246qFYJMYy0Qy9OqN1VTKcsTQoVQ==
X-Received: by 2002:a5d:518f:: with SMTP id k15mr2414353wrv.321.1560941534948; 
 Wed, 19 Jun 2019 03:52:14 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id l1sm27775269wrf.46.2019.06.19.03.52.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 03:52:14 -0700 (PDT)
Date: Wed, 19 Jun 2019 11:50:10 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/prime: Update docs
Message-ID: <20190619105010.GD1896@arch-x1c3>
References: <20190614203615.12639-4-daniel.vetter@ffwll.ch>
 <20190618092038.17929-1-daniel.vetter@ffwll.ch>
 <20190618092038.17929-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618092038.17929-2-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KQwws1irqMdpiDP3Ri0kIVWQWXD8+cH6oAmigewJQMs=;
 b=W1Ru0lULgrFQvJgOR69imtD7zrklsMMadY7PgKrU24uPo4Hd7LoyP29UQy5fY1uHGq
 5Eda4CEiN+Kf0mFoz9OQj2AesGnhWvbsa89Q0NFuI/Jm2mGQgI/iftjDEgSVSOsXXUuO
 PYAFxiTrE5YXyTAfKWqUsi0KnKgKbSsZ9vGyszbjqHBVD/yy4FbYu7W3lJXvdU65YRpS
 GUWMLrGooYB9soHAuiv6+llL8SD8e88+0KBcnYMlR2LRxw9BjNa+9HWB4gNccSAvyukf
 JKKuFlEO43v9XgP0RAv1HTRpoAukcyso/9yMjrK6T5Esj5ocbJpI2CT7+ElaJBXxdPFD
 YL2g==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNi8xOCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBZZXMgdGhpcyBpcyBhIGJpdCBh
IGJpZyBwYXRjaCwgYnV0IHNpbmNlIGl0J3MgZXNzZW50aWFsbHkgYSBjb21wbGV0ZQo+IHJld3Jp
dGUgb2YgYWxsIHRoZSBwcmltZSBkb2NzIEkgZGlkbid0IHNlZSBob3cgdG8gYmV0dGVyIHNwbGl0
IGl0IHVwLgo+IAo+IENoYW5nZXM6Cj4gLSBDb25zaXN0ZW50bHkgcG9pbnQgdG8gZHJtX2dlbV9v
YmplY3RfZnVuY3MgYXMgdGhlIHByZWZlcnJlZCBob29rcywKPiAgIHdoZXJlIGFwcGxpY2FibGUu
Cj4gCj4gLSBEb2N1bWVudCBhbGwgdGhlIGhvb2tzIGluICZkcm1fZHJpdmVyIHRoYXQgbGFja2Vk
IGtlcm5lbGRvYy4KPiAKPiAtIENvbXBsZXRlbHkgbmV3IG92ZXJ2aWV3IHNlY3Rpb24sIHdoaWNo
IG5vdyBhbHNvIGluY2x1ZGVzIHRoZSBjbGVhbmVkCj4gICB1cCBsaWZldGltZS9yZWZlcmVuY2Ug
Y291bnRpbmcgc3ViY2hhcHRlci4gSSBhbHNvIG1lbnRpb25lZCB0aGUgd2Vhawo+ICAgcmVmZXJl
bmNlcyBpbiB0aGVyZSBkdWUgdG8gdGhlIGxvb2t1cCBjYWNoZXMuCj4gCj4gLSBDb21wbGV0ZWx5
IHJld3JpdHRlbiBoZWxwZXIgaW50cm8gc2VjdGlvbiwgaGlnaGxpZ2h0IHRoZQo+ICAgaW1wb3J0
L2V4cG9ydCByZWxhdGVkIGZ1bmN0aW9uYWxpdHkuCj4gCj4gLSBQb2xpc2ggZm9yIGFsbCB0aGUg
ZnVuY3Rpb25zIGFuZCBtb3JlIGNyb3NzIHJlZmVyZW5jZXMuCj4gCj4gSSBhbHNvIHNwcmlua2xl
ZCBhIGJ1bmNoIG9mIHRvZG9zIGFsbCBvdmVyLgo+IAo+IE1vc3QgaW1wb3J0YW50OiAwIGNvZGUg
Y2hhbmdlcyBpbiBoZXJlLiBUaGUgY2xlYW51cCBtb3RpdmF0ZWQgYnkKPiByZWFkaW5nIGFuZCBp
bXByb3ZpbmcgYWxsIHRoaXMgd2lsbCBmb2xsb3cgbGF0ZXIgb24uCj4gCj4gdjI6IEFjdHVhbGx5
IHVwZGF0ZSB0aGUgcHJpbWUgaGVscGVyIGRvY3MuIFBsdXMgYWRkIGEgZmV3IEZJWE1FcyB0aGF0
Cj4gSSB3b24ndCBhZGRyZXNzIHJpZ2h0IGF3YXkgaW4gc3Vic2VxdWVudCBjbGVhbnVwIHBhdGNo
ZXMuCj4gCj4gdjM6Cj4gLSBTcGxpdCBvdXQgdGhlIGZ1bmN0aW9uIG1vdmluZy4gVGhpcyBwYXRj
aCBpcyBub3cgZXhjbHVzaXZlbHkKPiAgIGRvY3VtZW50YXRpb24gY2hhbmdlcy4KPiAtIFR5cG9z
IGFuZCBuaXRzIChTYW0pLgo+IAo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
Cj4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4gQ2M6IEVtaWwgVmVsaWtvdiA8
ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQpIYWQgYSBxdWljayByZWFkIGFuZCBpdCBs
b29rcyByZWFzb25hYmxlLgpBY2tlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29s
bGFib3JhLmNvbT4KCkhUSApFbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
