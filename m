Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50402B25D4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 21:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D1A6E5C5;
	Fri, 13 Nov 2020 20:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48AC6E5C5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 20:50:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so11578149wrt.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 12:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=eOXlZj0XPFWz7dlYa6NqKCzhJqTiZPBQkJ27S51Z/uw=;
 b=lQXAKOz+VF1cNFLuf+oV/VqV7EySOBNChHjZD8juvCYoc+YJU+joPVRZEjC1j1jKph
 pgxq+cfxmcr+te3hKWQm6LbDC5iqTyGMX/WldcyDMkh5yr2Ih1qyqDi5HkXv+fn5uUci
 TxOcKlvgL5iDdjE8oZ2JRtkkdy2BMxoU3/H60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=eOXlZj0XPFWz7dlYa6NqKCzhJqTiZPBQkJ27S51Z/uw=;
 b=NRwT4eMh6/fpfjTncDO9LuGPs4lj2/FyB40Td4KeS/oc01+TTUTJi7qYFpQkx00TWr
 oGywRonjWtDz/WaRoxgQnDc+CovUgtSzzdpGTTc713wGzgOeSXPd064YnYshsd34gk1u
 UDv72kw0kzDh8QQXVS2+HUL6UTUay4ymbIlgNY3qTSXsWCMOA/+7KZasOWMdvL2iaj4a
 fH7bArO6o22wLVqdcv8md2ZsDVjd2t/H9MWQ+IWjp/LOvtlRTIfqNV7GcFg70cOGOTLX
 mMrprJuYrsEjPNEmgWW+1FVAeRH99DdJham4az6BfKs2ezH5YyftXB7gwBXxyH7uAkpP
 KpkA==
X-Gm-Message-State: AOAM532uBadhLX+HPS9uxEtNYhrojJiBfMh9ybeksAbCtCC+ATLMsW5t
 Y33Ga6EyOZLM2o6/iBtfb9YO8w==
X-Google-Smtp-Source: ABdhPJzkFfexeDsoa+Wk0hm/w8ujcFMdDiRRJOkwPpoJBqXarBaFF2qtiom4zSV7Fshbzm+lULW3Tw==
X-Received: by 2002:adf:a40c:: with SMTP id d12mr5851835wra.154.1605300602644; 
 Fri, 13 Nov 2020 12:50:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c2sm11589328wmf.47.2020.11.13.12.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 12:50:01 -0800 (PST)
Date: Fri, 13 Nov 2020 21:49:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 02/30] include: drm: drm_atomic: Artificially use 'crtc'
 to avoid 'not used' warning
Message-ID: <20201113204959.GW401619@phenom.ffwll.local>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 Lee Jones <lee.jones@linaro.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-3-lee.jones@linaro.org>
 <20201112202516.GA3340631@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112202516.GA3340631@ravnborg.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgMDk6MjU6MTZQTSArMDEwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIExlZSwKPiAKPiBPbiBUaHUsIE5vdiAxMiwgMjAyMCBhdCAwNzowMDoxMVBNICsw
MDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBUaGUgcHJlY2VkZW50IGhhcyBhbHJlYWR5IGJlZW4g
c2V0IGJ5IG90aGVyIG1hY3JvcyBpbiB0aGUgc2FtZSBmaWxlLgo+ID4gCj4gPiBGaXhlcyB0aGUg
Zm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiA+IAo+ID4gIGRyaXZlcnMv
Z3B1L2RybS92a21zL3ZrbXNfZHJ2LmM6NTU6MTk6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGNydGPi
gJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiA+ICA1NSB8
IHN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKPiA+ICB8IF5+fn4KPiA+IAo+ID4gQ2M6IE1hYXJ0ZW4g
TGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogTWF4
aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+ID4gQ2M6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiBDYzogUm9i
IENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+Cj4gCj4gQWxzbyBhcHBsaWVkIHRvIGRybS1taXNjLW5leHQuCj4gVGhpcyB3YXMgdGhl
IGxhc3QgcGF0Y2ggZnJvbSB0aGlzIGJhdGNoIEkgd2lsbCBwcm9jZXNzLgo+IFRoZSBvdGhlcnMg
YXJlIGxlZnQgZm9yIHRoZSBtYWludGFpbmVycyB0byBwaWNrIHVwLgoKYnR3IGZvciBwYXRjaGVz
IHRoYXQgbWFpbnRhaW5lcnMgZG9uJ3QgcGljayB1cCwgdGhlIHVzdWFsIHByb2Nlc3MgaXMgdGhh
dAp3ZSBnaXZlIHRoZW0gMiB3ZWVrcywgdGhlbiBqdXN0IG1hc3MgYXBwbHkuIE5vdyB5b3UncmUg
cHJvZHVjaW5nIGEgbG90IG9mCnBhdGNoZXMsIHRvbyBtdWNoIGZvciBtZSB0byBrZWVwIHRyYWNr
LCBzbyBwbGVhc2UganVzdCBwaW5nIG1lIHdpdGggYQpyZXNlbmQgZm9yIHRob3NlIHRoYXQgZXhw
aXJlZCBhbmQgSSdsbCBnbyB0aHJvdWdoIGFuZCBwaWNrIHRoZW0gYWxsIHVwLgoKQ2hlZXJzLCBE
YW5pZWwKCj4gCj4gCVNhbQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
