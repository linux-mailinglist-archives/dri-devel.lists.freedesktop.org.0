Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65902C9E3C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 10:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC6189D46;
	Tue,  1 Dec 2020 09:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA43A89D46
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 09:46:33 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k10so1840239wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 01:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yc69n6TYS8s8mnl2FbsGRORIwflmhq2kMj7KnUSbA8k=;
 b=j6J/Qqlfd872o2nRB+YDqXzI7k4zFcKHVgUFc5Ab63Wu7cMN64yIeAnt2k/a/xb53l
 MtWSIH6oUfi68e3zbL4zpM389zXYEFyuieUcGBkf+qtAUlDcQavpVG6qVzsf+NXRByD5
 SGogUzW8o7rpZh2HtMStj7vhHnblQQnpwwdqZRbJoPc7NZDm5/QlYlhroDNSsjpH8tTi
 U0whcFsBzSDBU7mpWG5Fk/ylTYb/IAwZJoztAb4RF4Qvs2byaDeKcdyUGIWwgOLQrrfG
 MP53rZxR6Ttla7TSW7GCFxnPLELTNL5XPtvRwH9sUYXcKTWkUZX2jGE+n5aoNz4WaD+C
 Dlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yc69n6TYS8s8mnl2FbsGRORIwflmhq2kMj7KnUSbA8k=;
 b=AXQLMW15LodaRNOCRqMdmGXzoGXo+7vf9lZFjMQA0dS61zpBZEcI4SReXpMGHecnFy
 ZZhru9wzivBm9OYVTwR7EVVJ6Vf5VMkNTReHayh6a1a+DXRrTDlhaT7HJpW5zU5scuV9
 kQtIA03oku1EcRXaiAxC2CBPofcc8Cix4vtQ4T7KYKBAXGWDq2MwIb/B/JG5tTMw4ICd
 L+5FxRkCuGqEveSs8HQFoJhARQivwhMirifFPyEH4X4xfw6k/vRPG46TDZaP7/PjtxkA
 sgJqnEIYAa5cQ/DO1HTeor1Tjww5PgXZjVt7/pVqq/l7b3sFTP2Aop1GkuRgTgNQrA4z
 ogxw==
X-Gm-Message-State: AOAM531VJItS43fA1KIZexAT7C7z/BMJe/0FzUkLF4rbq5YzAJsGORHQ
 zRWqP/sQ6oFazJbcZfI+9Oakfw==
X-Google-Smtp-Source: ABdhPJz89N1wsgduPoOJWxEC6lffQ1jGcCwQStOOlbZe4E9zySHh35HkIlQMklSS8+ephNH5LixsPQ==
X-Received: by 2002:a1c:55ca:: with SMTP id j193mr1816945wmb.87.1606815992493; 
 Tue, 01 Dec 2020 01:46:32 -0800 (PST)
Received: from dell ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id v7sm2028079wma.26.2020.12.01.01.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 01:46:31 -0800 (PST)
Date: Tue, 1 Dec 2020 09:46:29 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 13/28] video: fbdev: riva: Fix kernel-doc and set but
 not used warnings
Message-ID: <20201201094629.GG4801@dell>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-14-sam@ravnborg.org>
 <53f3e91e-d8da-bce6-878c-7842250a7a7c@suse.de>
 <20201130183549.GA1498572@ravnborg.org>
 <20201201084718.GF4801@dell>
 <20201201090745.GA1980788@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201090745.GA1980788@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Jani Nikula <jani.nikula@intel.com>,
 Aditya Pakki <pakki001@umn.edu>, Alexander Klimov <grandmaster@al2klimov.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peter Rosin <peda@axentia.se>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwMSBEZWMgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUsCj4gCj4g
PiAKPiA+IENvcC1vdXQhCj4gPiAKPiA+IERvIHdoYXQgSSBkbyBhbmQgbWFrZSBzb21ldGhpbmcg
dXAgKGpva2UpISA6J0QKPiAKPiBJZiBJIHRob3VnaHQgYW55b25lIHdvdWxkIGFjdHVhbGx5IHJl
YWQgdGhlIGNvbW1lbnRzIHRoZW4gbWF5YmUgeWVzLgo+IEJ1dCBJIGFzc3VtZSB0aGF0IGFwYXJ0
IGZyb20gdGhpcyB0aHJlYWQgbm8tb25lIHdpbGwgcmVhZCBpdC4KPiAKPiA+IAo+ID4gPiA+IFdl
bGwsIGl0IGZpeGVzIHRoZSB3YXJuaW5nIDspCj4gPiA+IAo+ID4gPiBZZWFoLCBJIGNvdWxkIG5v
dCBkaWcgdXAgYW55dGhpbmcgdXNlZnVsIHRvIHNheSBoZXJlLgo+ID4gPiBXYXMgdGVtcHRlZCB0
byBqdXN0IGRyb3AgYWxsIHRoZSBrZXJuZWwtZG9jIHN5bnRheCBidXQgdGhhdAo+ID4gPiB3YXMg
YSBsYXJnZXIgY2hhbmdlLgo+ID4gCj4gPiBEaWQgeW91IHRyYWNlIGl0IGZyb20gaXQncyBvcmln
aW4gZG93biB0byBpdCdzIGZpbmFsIHVzZT8KPiBZZWFoLCBidXQgbm90IHNvbWV0aGluZyB0aGF0
IHNlZW1lZCB1c2VmdWwuCj4gSSBjb3VsZCBoYXZlIGFkZGVkICJ0cmFuc2xhdGluZyBmcm9tIHBp
eGVscy0+Ynl0ZXMiIGFzIHRoZXkKPiBhcmUgZGVzY3JpYmVkIHNvbWV3aGVyZSBlbHNlLiBCdXQg
SSBjb3VsZCBub3QgY29udmluY2UgbXlzZWxmCj4gdGhpcyB3YXMgcmlnaHQgc28gSSBqdXN0IHNp
bGVuY2VkIHRoZSB3YXJuaW5nLgo+IAo+IFRoZSBvbmx5IHJlYXNvbiBJIGtlcHQgdGhlIGtlcm5l
bC1kb2MgaW4gdGhlIGZpcnN0IHBsYWNlIGlzCj4gdGhhdCBJIGFtIHRvbGQgc29tZSBlZGl0b3Jz
IHVzZSBpdC4KPiAKPiBUaGUgb25seSBlZmZlY3QgdGhlIGtlcm5lbC1kb2MgaW4gZmJkZXYgaGFz
IHJpZ2h0IG5vdyBpcyBidXJuaW5nCj4gZWZmb3J0IHRoYXQgY291bGQgaGF2ZSBiZWVuIHNwZW50
IChiZXR0ZXI/KSBzb21ld2hlcmUgZWxzZSwgYW5kCj4gSSB3b3VsZCBwZXJzb25hbGx5IHByZWZl
ciB0byBkcm9wIHRoZSBrZXJuZWwtZG9jIGFubm90YXRpb25zLgo+IAo+IEJ1dCBJIGFscmVhZHkg
ZGlzY3Vzc2VkIHRoaXMgaW4gYW5vdGhlciB0aHJlYWQgKG5vdCBmYmRldiByZWxhdGVkKQo+IGFu
ZCBJIHdhcyB0b2xkIGl0IHdhcyB1c2VmdWwgZm9yIHNvbWUsIHNvIGl0IGlzIGtlcHQuCgpJIHBl
cnNvbmFsbHkgdGhpbmsgdGhleSBzaG91bGQgYmUga2VwdC4gIERlc3BpdGUgbm90IGJlaW5nIHJl
ZmVyZW5jZWQKYnkgYW55IGtlcm5lbC1kb2M6OiBrZXktd29yZHMuICBBcyB5b3Ugc2F5LCBpdCBj
YW4gYmUgaGVscGZ1bCBhcyBhbgppbi1jb2RlIHJlZmVyZW5jZSBmb3IgZHJpdmVyIHdyaXRlcnMs
IHBlb3BsZSBkZWJ1Z2dpbmcgY29kZSwgZXQgYWwuCgpOb3Qgc3VyZSBJIHdvdWxkIGp1c3QgcmVw
ZWF0IHRoZSB2YXJpYWJsZSBuYW1lIGp1c3QgdG8gc2lsZW5jZSB0aGUKd2FybmluZyB0aG91Z2gg
LSB0aGF0IGlzIGRlZmluaXRlbHkgYSBoYWNrLiAgSW4gdGhlIHRob3VzYW5kcwoobGl0ZXJhbGx5
ISkgb2YgdGhlc2UgdGhhdCBJJ3ZlIGZpeGVkIHRodXMgZmFyLCBJIGhhdmVuJ3QgbmVlZGVkIHRv
IGRvCnRoYXQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVh
ZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
