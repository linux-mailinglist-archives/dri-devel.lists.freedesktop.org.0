Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BCF6A48B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 11:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A686E0DA;
	Tue, 16 Jul 2019 09:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A656E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 09:07:16 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id v15so18856001eds.9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 02:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=I9zYEq8OFEbVpJer2Tv3zWZvHxZnxrPEy9YXzm5hW3E=;
 b=uKQUBD3UnLbVtl0tlZl3syKw3pP3ixYfXNN8ZSYJmnyfvkMjpyqGBICTBf2Ll8DegG
 or/9MsYUoGTCI2LDAdFhnXSvYRe2tp0eIJiAVD+cdA8N5M3MujBhWxEK+LzhdkXliHmE
 ZMF9wuGRhAkXBEMQf6D24JO5codZzNIwd4Wjd3IgNlL6xvPaGmVxxEQMpw7BY4ZbxYp3
 d/MgWmhZHdAIBu1sE5wWzp82kEWXqLxmiQ7AzvlrnT12BBd/7+HWXH5iEIG6QNzogNNI
 XB5Q0/KX9pyCdWGxNGDSuYfzaJrsPNrQPZ4pLAbLCS+/aUsuJvmk3ohE3zKW7zUfG0qK
 AMLw==
X-Gm-Message-State: APjAAAV07vEh3oetZPzwmT1hdvkt083jzL1SlnlWj85tnSEQt2A/hfNG
 hWrIEambl3CE+3HK3WR7GmE=
X-Google-Smtp-Source: APXvYqz1SaqX3EV9WdhysWFHXB3kEpANL5IKDHtMYu6Pa12298jeoeX++0r54iCbKMiUhb8wR9JHPg==
X-Received: by 2002:a50:9918:: with SMTP id k24mr27533596edb.173.1563268035208; 
 Tue, 16 Jul 2019 02:07:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id q21sm4249063ejo.76.2019.07.16.02.07.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 02:07:14 -0700 (PDT)
Date: Tue, 16 Jul 2019 11:07:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: Re: [RFC] Expanding drm_mode_modeinfo flags
Message-ID: <20190716090712.GY15868@phenom.ffwll.local>
References: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=I9zYEq8OFEbVpJer2Tv3zWZvHxZnxrPEy9YXzm5hW3E=;
 b=jVSOIxdw446a+o8BYLVYYGg5IMs05dyf37q/ADNKTCwEod7L/7+EunPYbSghKFfkjc
 EPopEXJIpzE+x1mG2bSZNlUKHCXC5YZdxNsX4okhltRLNACQhPemH6fFpoNhEKJIsVH3
 0Yql/A2XGciBDq1AW8dhKO6q+tSEBCwdCo/kk=
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 pdhaval@codeaurora.org, seanpaul@chromium.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMTE6NDY6NDRBTSAtMDcwMCwgSmV5a3VtYXIgU2Fua2Fy
YW4gd3JvdGU6Cj4gICAgIEhlbGxvIEFsbCwgCj4gICAgIAlkcm1fbW9kZV9tb2RlaW5mbzo6Zmxh
Z3MgaXMgYSAzMiBiaXQgZmllbGQgY3VycmVudGx5IHVzZWQgdG8KPiAgICAgZGVzY3JpYmUgdGhl
IHByb3BlcnRpZXMgb2YgYSBjb25uZWN0b3IgbW9kZS4gSSBzZWUgdGhlIGxlYXN0IG9yZGVyIDIy
IGJpdHMKPiAgICAgYXJlIGFscmVhZHkgaW4gdXNlLiBQb3N0aW5nIHRoaXMgUkZDIHRvIGRpc2N1
c3Mgb24gYW55IHBvdGVudGlhbCBwbGFucyB0byAKPiAgICAgZXhwYW5kIHRoZSBiaXQgcmFuZ2Ug
c3VwcG9ydCBvZiB0aGlzIGZpZWxkIGZvciBncm93aW5nIG1vZGUgcHJvcGVydGllcyBhbmQgCj4g
ICAgIHdheXMgdG8gaGFuZGxlIG9uZSBzdWNoIHByb3BlcnR5IG5lZWRlZCBieSB0aGUgbXNtIGRw
dSBkcml2ZXIuCj4gCj4gICAgIG1zbSBkcml2ZXJzIHN1cHBvcnQgcGFuZWxzIHdoaWNoIGNhbiBk
eW5hbWljYWxseSBzd2l0Y2ggYmV0d2Vlbgo+ICAgICB2aWRlbyhhY3RpdmUpIGFuZCBjb21tYW5k
KHNtYXJ0KSBtb2Rlcy4gV2l0aGluIHZpZGVvIG1vZGUsIHRoZXkgYWxzbyBzdXBwb3J0Cj4gICAg
IHN3aXRjaGluZyBiZXR3ZWVuIHJlc29sdXRpb25zIHNlYW1sZXNzbHkgaS5lLiBnbGl0Y2ggZnJl
ZSByZXNvbHV0aW9uIHN3aXRjaC4KPiAgICAgQnV0IHRoZXkgY2Fubm90IGRvIGEgc2VhbWxlc3Mg
c3dpdGNoIGZyb20gYSByZXNvbHV0aW9ucyBmcm9tIHZpZGVvIHRvCj4gICAgIGNvbW1hbmQgb3Ig
dmljZSB2ZXJzYS4gQ2xpZW50cyBuZWVkIHRvIGJlIGF3YXJlIGZvciB0aGVzZSBjYXBhYmxpdGll
cyBiZWZvcmUKPiAgICAgdGhleSBzd2l0Y2ggYmV0d2VlbiB0aGUgcmVzb2x1dGlvbnMuIFNpbmNl
IHRoZXNlIGNhcGFiaWxpdGllcyBhcmUgaWRlbnRpZmllZAo+ICAgICBwZXIgZHJtX21vZGUsIHdl
IGFyZSBjb25zaWRlcmluZyB0aGUgYmVsb3cgdHdvIGFwcHJvYWNoZXMgdG8gaGFuZGxlIHRoaXMK
PiAgICAgdXNlIGNhc2UuCj4gCj4gICAgIE9wdGlvbiAxOgo+ICAgICBBdHRhY2hlZCBwYXRjaCBh
ZGRzIGZsYWcgdmFsdWVzIHRvIGFzc29jaWF0ZSBhIGRybV9tb2RlIHRvIHZpZGVvL2NvbW1hbmQK
PiAgICAgbW9kZSBhbmQgdG8gaW5kaWNhdGUgaXRzIGNhcGFiaWxpdHkgdG8gZG8gYSBzZWFtbGVz
cyBzd2l0Y2guCj4gCj4gICAgIE9wdGlvbiAyOgo+ICAgICBkcm1fbW9kZV9tb2RlaW5mbyBjYW4g
ZXhwb3NlIGEgbmV3ICJwcml2YXRlX2ZsYWdzIiBmaWVsZCB0byBoYW5kbGUgdmVuZG9yCj4gICAg
IHNwZWNpZmljIG1vZGUgZmxhZ3MuIEJlc2lkZXMgdGhlIGFib3ZlIG1lbnRpb25lZCB1c2UgY2Fz
ZSwgd2UgYXJlIGFsc28KPiAgICAgZXhwb2xvcmluZyBtZXRob2RzIHRvIGhhbmRsZSBzb21lIG9m
IG91ciBkaXNwbGF5IHBvcnQgcmVzb2x1dGlvbiBzd2l0Y2ggdXNlCj4gICAgIGNhc2VzIHdoZXJl
IHRoZSBEUCBwb3J0cyBjYW4gYmUgb3BlcmF0ZWQgaW4gYSB0aWxlZC9kZXRpbGVkIG1vZGVzLiBU
aGlzIAo+ICAgICBhcHByb2FjaCB3aWxsIHByb3ZpZGUgYSBzdGFuZGFyZCBjaGFubmVsIGZvciBk
cm0gZHJpdmVyIHZlbmRvcnMgZm9yIHRoZWlyIAo+ICAgICBncm93aW5nIG5lZWQgZm9yIGRybV9t
b2RlIHNwZWNpZmljIGNhcGFiaWxpdGllcy4KPiAKPiAgICAgUGxlYXNlIHByb3ZpZGUgeW91ciBp
bnB1dHMgb24gdGhlIG9wdGlvbnMgb3IgYW55IHVwc3RyZWFtIGZyaWVuZGx5Cj4gICAgIHJlY29t
bWVuZGF0aW9uIHRvIGhhbmRsZSBzdWNoIGN1c3RvbSB1c2UgY2FzZXMuCj4gCj4gICAgIFRoYW5r
cyBhbmQgUmVnYXJkcywKPiAgICAgSmV5a3VtYXIgUy4KPiAKPiBKZXlrdW1hciBTYW5rYXJhbiAo
MSk6Cj4gICBkcm06IGFkZCBtb2RlIGZsYWdzIGluIHVhcGkgZm9yIHNlYW1sZXNzIG1vZGUgc3dp
dGNoCgpJIHRoaW5rIHRoZSB1YXBpIGlzIHRoZSB0cml2aWFsIHBhcnQgaGVyZSwgdGhlIHJlYWwg
ZGVhbCBpcyBob3cgdXNlcnNwYWNlCnVzZXMgdGhpcy4gQ2FuIHlvdSBwbHMgcG9zdCB0aGUgcGF0
Y2hlcyBmb3IgeW91ciBjb21wb3NpdG9yPwoKQWxzbyBub3RlIHRoYXQgd2UgYWxyZWFkeSBhbGxv
dyB1c2Vyc3BhY2UgdG8gdGVsbCB0aGUga2VybmVsIHdoZXRoZXIKZmxpY2tlcmluZyBpcyBvayBv
ciBub3QgZm9yIGEgbW9kZXNldC4gbXNtIGRyaXZlciBjb3VsZCB1c2UgdGhhdCB0byBhdApsZWFz
dCB0ZWxsIHVzZXJzcGFjZSB3aGV0aGVyIGEgbW9kZXNldCBjaGFuZ2UgaXMgcG9zc2libGUuIFNv
IHlvdSBjYW4KYWxyZWFkeSBpbXBsZW1lbnQgZ2xpdGNoLWZyZWUgbW9kZXNldCBjaGFuZ2VzIGZv
ciBhdCBsZWFzdCB2aWRlbyBtb2RlLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
