Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B7C186840
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 10:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B74A89DFF;
	Mon, 16 Mar 2020 09:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DFF89DFF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 09:54:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r15so20338852wrx.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 02:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=zSC6oywTzGEcsERVAal6BgbGEUVylhtga/Ve0wR+QRc=;
 b=RRRaKsZunyqDMQVwDP9D6Nu+AmSqGr/H4565L2bBRQhll0tBF9qebcJGYMlHrB2gds
 h9Y1J9KgmKQy8VpoQ4FMYiIfSnhwuft5cTK+obEJAswssCVZ+kYxv6DWBlz4i07R9FCM
 6JIwhFd4Ew3+W57/EHzL40CxmKzFKvwJCHbeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=zSC6oywTzGEcsERVAal6BgbGEUVylhtga/Ve0wR+QRc=;
 b=mQZS7gAlqZhraOwVCxIRwPYqvsSouf9RA1A7b9iT6b7boWRVPCFDrd2WozZScWIbJI
 nbpA+xwl18bNvn5z/l28JC+CPhitK/y1qqWcV1ez7iFokv310YEHFEhEOcPZ8i3TIEHV
 XSlHqgWlxN21JHBL5TUa7uYykYGzS6LKQpNZWGh4Bmqh787xG1D0CcG9gOfl82YVlbKM
 d9BjXdDPPMdh8E7fYXinlK1+0P0OsOluNyuMygDS3AuI6OSNapPBiGkXik0kfXIR/3wH
 ZMnhSVQ1Dvp5XPgj6FDOpq9YDUytvYTcUMnvn43jbz/YeAcpP79E2CTJKcVoF593v+T+
 Dmpg==
X-Gm-Message-State: ANhLgQ1Yjq7tF0Ti1tczK44Z4r8vMesv4gwYgRGZt9o+UVMVi8X3q1Q7
 wp7nDocSTMIuIP6WrwGbpCCkFg==
X-Google-Smtp-Source: ADFU+vurrbpA/epmkOYU7s8Kn94q0u3aqT2RnagU7067QxIDTERhlXeUzcuowJp9G/4OzldwVyDHEg==
X-Received: by 2002:a5d:480a:: with SMTP id l10mr1681118wrq.178.1584352459668; 
 Mon, 16 Mar 2020 02:54:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a186sm29813829wmh.33.2020.03.16.02.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 02:54:18 -0700 (PDT)
Date: Mon, 16 Mar 2020 10:54:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] drm/edid: Distribute switch variables for
 initialization
Message-ID: <20200316095417.GJ2363188@phenom.ffwll.local>
Mail-Followup-To: Kees Cook <keescook@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 linux-kernel@vger.kernel.org
References: <202003060930.DDCCB6659@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202003060930.DDCCB6659@keescook>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMDk6MzI6MTNBTSAtMDgwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IFZhcmlhYmxlcyBkZWNsYXJlZCBpbiBhIHN3aXRjaCBzdGF0ZW1lbnQgYmVmb3JlIGFueSBj
YXNlIHN0YXRlbWVudHMKPiBjYW5ub3QgYmUgYXV0b21hdGljYWxseSBpbml0aWFsaXplZCB3aXRo
IGNvbXBpbGVyIGluc3RydW1lbnRhdGlvbiAoYXMKPiB0aGV5IGFyZSBub3QgcGFydCBvZiBhbnkg
ZXhlY3V0aW9uIGZsb3cpLiBXaXRoIEdDQydzIHByb3Bvc2VkIGF1dG9tYXRpYwo+IHN0YWNrIHZh
cmlhYmxlIGluaXRpYWxpemF0aW9uIGZlYXR1cmUsIHRoaXMgdHJpZ2dlcnMgYSB3YXJuaW5nIChh
bmQgdGhleQo+IGRvbid0IGdldCBpbml0aWFsaXplZCkuIENsYW5nJ3MgYXV0b21hdGljIHN0YWNr
IHZhcmlhYmxlIGluaXRpYWxpemF0aW9uCj4gKHZpYSBDT05GSUdfSU5JVF9TVEFDS19BTEw9eSkg
ZG9lc24ndCB0aHJvdyBhIHdhcm5pbmcsIGJ1dCBpdCBhbHNvCj4gZG9lc24ndCBpbml0aWFsaXpl
IHN1Y2ggdmFyaWFibGVzWzFdLiBOb3RlIHRoYXQgdGhlc2Ugd2FybmluZ3MgKG9yIHNpbGVudAo+
IHNraXBwaW5nKSBoYXBwZW4gYmVmb3JlIHRoZSBkZWFkLXN0b3JlIGVsaW1pbmF0aW9uIG9wdGlt
aXphdGlvbiBwaGFzZSwKPiBzbyBldmVuIHdoZW4gdGhlIGF1dG9tYXRpYyBpbml0aWFsaXphdGlv
bnMgYXJlIGxhdGVyIGVsaWRlZCBpbiBmYXZvciBvZgo+IGRpcmVjdCBpbml0aWFsaXphdGlvbnMs
IHRoZSB3YXJuaW5ncyByZW1haW4uCj4gCj4gVG8gYXZvaWQgdGhlc2UgcHJvYmxlbXMsIGxpZnQg
c3VjaCB2YXJpYWJsZXMgdXAgaW50byB0aGUgbmV4dCBjb2RlCj4gYmxvY2suCj4gCj4gZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmM6IEluIGZ1bmN0aW9uIOKAmGRybV9lZGlkX3RvX2VsZOKAmToK
PiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYzo0Mzk1Ojk6IHdhcm5pbmc6IHN0YXRlbWVudCB3
aWxsIG5ldmVyIGJlCj4gZXhlY3V0ZWQgWy1Xc3dpdGNoLXVucmVhY2hhYmxlXQo+ICA0Mzk1IHwg
ICAgIGludCBzYWRfY291bnQ7Cj4gICAgICAgfCAgICAgICAgIF5+fn5+fn5+fgo+IAo+IFsxXSBo
dHRwczovL2J1Z3MubGx2bS5vcmcvc2hvd19idWcuY2dpP2lkPTQ0OTE2Cj4gCj4gU2lnbmVkLW9m
Zi1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CgpUaGFua3MgZm9yIHlvdXIg
cGF0Y2gsIGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dC4KLURhbmllbAoKPiAtLS0KPiB2MjogbW92
ZSBpbnRvIGZ1bmN0aW9uIGJsb2NrIGluc3RlYWQgYmVpbmcgc3dpdGNoLWxvY2FsIChWaWxsZSBT
eXJqw6Rsw6QpCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgMyArLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZWRpZC5jCj4gaW5kZXggODA1ZmIwMDRjOGViLi40NmNlZTc4YmMxNzUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYwo+IEBAIC00MzgxLDYgKzQzODEsNyBAQCBzdGF0aWMgdm9pZCBkcm1fZWRpZF90b19lbGQo
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0IGVkaWQgKmVkaWQpCj4gIAo+
ICAJaWYgKGNlYV9yZXZpc2lvbihjZWEpID49IDMpIHsKPiAgCQlpbnQgaSwgc3RhcnQsIGVuZDsK
PiArCQlpbnQgc2FkX2NvdW50Owo+ICAKPiAgCQlpZiAoY2VhX2RiX29mZnNldHMoY2VhLCAmc3Rh
cnQsICZlbmQpKSB7Cj4gIAkJCXN0YXJ0ID0gMDsKPiBAQCAtNDM5Miw4ICs0MzkzLDYgQEAgc3Rh
dGljIHZvaWQgZHJtX2VkaWRfdG9fZWxkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Is
IHN0cnVjdCBlZGlkICplZGlkKQo+ICAJCQlkYmwgPSBjZWFfZGJfcGF5bG9hZF9sZW4oZGIpOwo+
ICAKPiAgCQkJc3dpdGNoIChjZWFfZGJfdGFnKGRiKSkgewo+IC0JCQkJaW50IHNhZF9jb3VudDsK
PiAtCj4gIAkJCWNhc2UgQVVESU9fQkxPQ0s6Cj4gIAkJCQkvKiBBdWRpbyBEYXRhIEJsb2NrLCBj
b250YWlucyBTQURzICovCj4gIAkJCQlzYWRfY291bnQgPSBtaW4oZGJsIC8gMywgMTUgLSB0b3Rh
bF9zYWRfY291bnQpOwo+IC0tIAo+IDIuMjAuMQo+IAo+IAo+IC0tIAo+IEtlZXMgQ29vawoKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
