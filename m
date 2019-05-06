Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A9B14C98
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 16:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC8889930;
	Mon,  6 May 2019 14:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2108992E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 14:43:38 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w11so15594542edl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 07:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=vaAPp8PyjYHsdP1CZGhOGZcNrdzUmU4mz1az3gjIEag=;
 b=gHYv4YDz5Yoma/tkDGeUYt4feTtjj0Jt5y1bayIWzKiN4ya9WSLj9ckTxFVY063BNX
 FsywHJy78sv94R3Ib48gRJOemoG5GQE1O+wCqs4sWWwpl+InMNpm3tJy7fbokNDBHsd+
 j1zKGq9rgXuREltmNmILI1J0ie12DRr/hSvgQEWfV3rgpOfe0aDTldBtWtJBYZONFSg7
 TuIU9KiEDy3PCfVYLcAWzXkx1zs5RN2DSeXHTbGJTN2nLcrBp+AzB9OdNpFczW/Temr2
 +FSEdBJre9oUovNfiqRnlIVlUlFyRHdHEGW2x3wmkCEQo0yq6FjLke/hvy3bDIqvzwQq
 P+JA==
X-Gm-Message-State: APjAAAXksyNlZEHVdFroDhA91OJtVNxkusBbl5txYjQsTiQVTIvFgrdR
 7QGhRNTM9vGabitbOKDE05uoNw==
X-Google-Smtp-Source: APXvYqwtl5T/MpDTj7LbNirYR1SvYe+WhzHms3LVnX/pzSNP1kZnlocJBCYDhRieEoZXTXVwEMT6xg==
X-Received: by 2002:a50:be42:: with SMTP id b2mr27581867edi.228.1557153817556; 
 Mon, 06 May 2019 07:43:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id q18sm1602623ejp.56.2019.05.06.07.43.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 07:43:36 -0700 (PDT)
Date: Mon, 6 May 2019 16:43:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: jagdsh.linux@gmail.com
Subject: Re: [PATCH] gpu/drm: Remove duplicate headers
Message-ID: <20190506144334.GH17751@phenom.ffwll.local>
Mail-Followup-To: jagdsh.linux@gmail.com, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, bskeggs@redhat.com,
 hierry.reding@gmail.com, jcrouse@codeaurora.org,
 jsanka@codeaurora.org, skolluku@codeaurora.org,
 paul.burton@mips.com, jrdr.linux@gmail.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <1556906293-128921-1-git-send-email-jagdsh.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556906293-128921-1-git-send-email-jagdsh.linux@gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=vaAPp8PyjYHsdP1CZGhOGZcNrdzUmU4mz1az3gjIEag=;
 b=TeJLtrEe4JxAY6kU+FgDMqxxH774q5OmDnPgF4z1LCxJ0gA2hydu8AIgwxknkumsP+
 w+p3KFDudzEwfTQwrebwzQ8H7AFC6XnqlApAqm6znxrbNtpsSorAwrpuQTF7daJEPSte
 JtoM1vJiuvvMaYngrNIWUOuj8SndGJQPvePfs=
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, paul.burton@mips.com, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, hierry.reding@gmail.com, sean@poorly.run,
 skolluku@codeaurora.org, jrdr.linux@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMTE6Mjg6MTNQTSArMDUzMCwgamFnZHNoLmxpbnV4QGdt
YWlsLmNvbSB3cm90ZToKPiBGcm9tOiBKYWdhZGVlc2ggUGFnYWRhbGEgPGphZ2RzaC5saW51eEBn
bWFpbC5jb20+Cj4gCj4gUmVtb3ZlIGR1cGxpY2F0ZSBoZWFkZXJzIHdoaWNoIGFyZSBpbmNsdWRl
ZCB0d2ljZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWdhZGVlc2ggUGFnYWRhbGEgPGphZ2RzaC5s
aW51eEBnbWFpbC5jb20+CgpJIGNvbGxlY3RlZCBzb21lIGFja3MgZm9yIHRoZSBtc20gYW5kIG5v
dXZlYXUgcGFydHMgYW5kIHB1c2hlZCB0aGlzLiBGb3IKbmV4dCB0aW1lIGFyb3VuZCB3b3VsZCBi
ZSBncmVhdCBpZiB5b3Ugc3BsaXQgdGhlc2UgdXAgYWxvbmcgZHJpdmVyL21vZHVsZQpib3VuZGFy
aWVzLCBzbyB0aGF0IGVhY2ggbWFpbnRhaW5lciBjYW4gcGljayB0aGlzIHVwIGRpcmVjdGx5LgoK
VGhhbmtzIGZvciB5b3VyIHBhdGNoLgotRGFuaWVsCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfaHdfbG0uYyAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9idXMvbnYwNC5jICAgICAgICB8IDIgLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMgfCAxIC0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfbG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9od19sbS5jCj4gaW5kZXggMDE4ZGYyYy4uNDVhNWJjNiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfbG0uYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19sbS5jCj4gQEAgLTE1LDcgKzE1
LDYgQEAKPiAgI2luY2x1ZGUgImRwdV9od2lvLmgiCj4gICNpbmNsdWRlICJkcHVfaHdfbG0uaCIK
PiAgI2luY2x1ZGUgImRwdV9od19tZHNzLmgiCj4gLSNpbmNsdWRlICJkcHVfa21zLmgiCj4gIAo+
ICAjZGVmaW5lIExNX09QX01PREUgICAgICAgICAgICAgICAgICAgICAgICAweDAwCj4gICNkZWZp
bmUgTE1fT1VUX1NJWkUgICAgICAgICAgICAgICAgICAgICAgIDB4MDQKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYnVzL252MDQuYyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2J1cy9udjA0LmMKPiBpbmRleCBjODBiOTY3Li4y
YjQ0YmE1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2
L2J1cy9udjA0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9i
dXMvbnYwNC5jCj4gQEAgLTI2LDggKzI2LDYgQEAKPiAgCj4gICNpbmNsdWRlIDxzdWJkZXYvZ3Bp
by5oPgo+ICAKPiAtI2luY2x1ZGUgPHN1YmRldi9ncGlvLmg+Cj4gLQo+ICBzdGF0aWMgdm9pZAo+
ICBudjA0X2J1c19pbnRyKHN0cnVjdCBudmttX2J1cyAqYnVzKQo+ICB7Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jIGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMKPiBp
bmRleCAyYzljOTcyLi5jYWNmMmUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMKPiBAQCAtNTMsNyArNTMsNiBA
QAo+ICAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BtLmg+
Cj4gIAo+IC0jaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybVAu
aD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9taXBp
X2RzaS5oPgo+IC0tIAo+IDEuOC4zLjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
