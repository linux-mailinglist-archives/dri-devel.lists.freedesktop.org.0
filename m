Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961D22C99D7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848F56E523;
	Tue,  1 Dec 2020 08:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68A16E4B7
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 08:47:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a6so1587592wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 00:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=W9tZXtjV5gZd9yQL3k71kPC77lVS3zwQx87dfhVC2Y0=;
 b=aL0K95uFWJ7uaTbCLsTWdDM5SOrx+owLJllv1IfR6wy1EtCzdNbQAzgRjcMEVoPDjK
 VL9GS/3eBAcqKeWwtgSuqD6ApVULZ6C1KClolU83fxc6OAiY3kdrfaH7LPPRsDNrr8so
 fzq5Oz1Im+db7Xmrg+pZ3wUVORHQEub9cEiP7lUanBcQ2+x4dqfKdlvXPZeQhWkG2Ntu
 FpCOAz6zKamUbAxno/JmkB5B0pZD4TnpUwdhVegpntsS5RUtYA0/YKVE8I9bMXwZ56OT
 2Ayl+L5MhTi4lXjLroG6Kr2CGhIsXEwgbMsHz0l95pjZ1Ql0kjrmVcx5hJV0p6erWTBO
 2ZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=W9tZXtjV5gZd9yQL3k71kPC77lVS3zwQx87dfhVC2Y0=;
 b=HGd/thrGvzmjGx9KuI8az/QSDo7yRZsu6xl2+9RGr26Ww1dlq+Ac6vJtybKlj6de+z
 kqoJK6RB+EP+DUCVyNCjkpt3V484YZgi/WHcSNbQpEQ5COLlDcpi3cgKqM4njc+3RYZu
 sW3AcRzt3Bask70zP6L1Awx5RXbj5yM5UafFh3SIG8/enN55oriCa4MzoOhRtZm4RGvI
 B9HYGdpRSYCfTxbQRmrDT7jICm6/SSJKd4/42WeJ5yI+lvKk25X2YbTje+O1I86bqxAb
 oJaYLnwDA0cO3vEsZch428V4VHcc0PG/K/GjxWw5rCD56bSZKNev78HvQUksyu3iCCVa
 3lvw==
X-Gm-Message-State: AOAM531OQntFqLf6xaFPxe4T67mvbiCQx8mjtmL6BmZhVRrfamvZmeFy
 eWUG2ioQdje4jQRAJDENVWpKUQ==
X-Google-Smtp-Source: ABdhPJylIAK+x6QT9XRKDB6QgkCHkbEGZBwv1vU+ri8O4FXofjLSukeW/8a5PnTnrNrXlCq9Ied3BQ==
X-Received: by 2002:a05:600c:211:: with SMTP id
 17mr1600527wmi.84.1606812441276; 
 Tue, 01 Dec 2020 00:47:21 -0800 (PST)
Received: from dell ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id u23sm1667281wmc.32.2020.12.01.00.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 00:47:20 -0800 (PST)
Date: Tue, 1 Dec 2020 08:47:18 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 13/28] video: fbdev: riva: Fix kernel-doc and set but
 not used warnings
Message-ID: <20201201084718.GF4801@dell>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-14-sam@ravnborg.org>
 <53f3e91e-d8da-bce6-878c-7842250a7a7c@suse.de>
 <20201130183549.GA1498572@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130183549.GA1498572@ravnborg.org>
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

T24gTW9uLCAzMCBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBPbiBNb24sIE5vdiAz
MCwgMjAyMCBhdCAwMToxNDo1MlBNICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPiA+
IAo+ID4gCj4gPiBBbSAyOC4xMS4yMCB1bSAyMzo0MCBzY2hyaWViIFNhbSBSYXZuYm9yZzoKPiA+
ID4gRml4IFc9MSB3YXJuaW5nczoKPiA+ID4gLSBGaXgga2VybmVsLWRvYwo+ID4gPiAtIERyb3Ag
dW51c2VkIHZhcmlhYmxlcy9jb2RlCj4gPiA+IAo+ID4gPiB2MjoKPiA+ID4gICAgLSBVcGRhdGVk
IHN1YmplY3QgKExlZSkKPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KPiA+ID4gQ2M6IEFudG9uaW5vIERhcGxhcyA8YWRhcGxhc0BnbWFp
bC5jb20+Cj4gPiA+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gQ2M6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgIGRyaXZlcnMv
dmlkZW8vZmJkZXYvcml2YS9mYmRldi5jICAgfCAgOSArKysrLS0tLS0KPiA+ID4gICBkcml2ZXJz
L3ZpZGVvL2ZiZGV2L3JpdmEvcml2YV9ody5jIHwgMjggKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ID4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRp
b25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9yaXZh
L2ZiZGV2LmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3JpdmEvZmJkZXYuYwo+ID4gPiBpbmRleCBj
ZTU1YjlkMmU4NjIuLjU1NTU0YjA0MzNjYiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy92aWRl
by9mYmRldi9yaXZhL2ZiZGV2LmMKPiA+ID4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9yaXZh
L2ZiZGV2LmMKPiA+ID4gQEAgLTQ2NCw3ICs0NjQsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcmV2
ZXJzZV9vcmRlcih1MzIgKmwpCj4gPiA+ICAgLyoqCj4gPiA+ICAgICogcml2YWZiX2xvYWRfY3Vy
c29yX2ltYWdlIC0gbG9hZCBjdXJzb3IgaW1hZ2UgdG8gaGFyZHdhcmUKPiA+ID4gLSAqIEBkYXRh
OiBhZGRyZXNzIHRvIG1vbm9jaHJvbWUgYml0bWFwICgxID0gZm9yZWdyb3VuZCBjb2xvciwgMCA9
IGJhY2tncm91bmQpCj4gPiA+ICsgKiBAZGF0YTg6IGFkZHJlc3MgdG8gbW9ub2Nocm9tZSBiaXRt
YXAgKDEgPSBmb3JlZ3JvdW5kIGNvbG9yLCAwID0gYmFja2dyb3VuZCkKPiA+ID4gICAgKiBAcGFy
OiAgcG9pbnRlciB0byBwcml2YXRlIGRhdGEKPiA+ID4gICAgKiBAdzogICAgd2lkdGggb2YgY3Vy
c29yIGltYWdlIGluIHBpeGVscwo+ID4gPiAgICAqIEBoOiAgICBoZWlnaHQgb2YgY3Vyc29yIGlt
YWdlIGluIHNjYW5saW5lcwo+ID4gPiBAQCAtODQzLDkgKzg0Myw5IEBAIHN0YXRpYyB2b2lkIHJp
dmFfdXBkYXRlX3ZhcihzdHJ1Y3QgZmJfdmFyX3NjcmVlbmluZm8gKnZhciwKPiA+ID4gICAvKioK
PiA+ID4gICAgKiByaXZhZmJfZG9fbWF4aW1pemUgLQo+ID4gPiAgICAqIEBpbmZvOiBwb2ludGVy
IHRvIGZiX2luZm8gb2JqZWN0IGNvbnRhaW5pbmcgaW5mbyBmb3IgY3VycmVudCByaXZhIGJvYXJk
Cj4gPiA+IC0gKiBAdmFyOgo+ID4gPiAtICogQG5vbToKPiA+ID4gLSAqIEBkZW46Cj4gPiA+ICsg
KiBAdmFyOiBzdGFuZGFyZCBrZXJuZWwgZmIgY2hhbmdlYWJsZSBkYXRhCj4gPiA+ICsgKiBAbm9t
OiBub20KPiA+ID4gKyAqIEBkZW46IGRlbgoKQ29wLW91dCEKCkRvIHdoYXQgSSBkbyBhbmQgbWFr
ZSBzb21ldGhpbmcgdXAgKGpva2UpISA6J0QKCj4gPiBXZWxsLCBpdCBmaXhlcyB0aGUgd2Fybmlu
ZyA7KQo+IAo+IFllYWgsIEkgY291bGQgbm90IGRpZyB1cCBhbnl0aGluZyB1c2VmdWwgdG8gc2F5
IGhlcmUuCj4gV2FzIHRlbXB0ZWQgdG8ganVzdCBkcm9wIGFsbCB0aGUga2VybmVsLWRvYyBzeW50
YXggYnV0IHRoYXQKPiB3YXMgYSBsYXJnZXIgY2hhbmdlLgoKRGlkIHlvdSB0cmFjZSBpdCBmcm9t
IGl0J3Mgb3JpZ2luIGRvd24gdG8gaXQncyBmaW5hbCB1c2U/CgotLSAKTGVlIEpvbmVzIFvmnY7n
kLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8u
b3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzog
RmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
