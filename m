Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98BA34DEC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 18:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0B789AA7;
	Tue,  4 Jun 2019 16:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0412889AA7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 16:46:57 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id r21so7710459otq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 09:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vxbfQ/QXlflSGADky7mvnbApcLRhuk3DusfIcSrIbNo=;
 b=cOp6EgZZFvDFKfCpVOSl+wZ8MU3G6pe5g2qya8KjKhvvojOmuSsEtwTjLAu6rwnb/F
 /T5lYcfrgiDM2JcB5VvBMpbEvA+9PjKUO8GxSmlbljo7FBzUeQJbPtyCqrp8XzXn97iW
 iGiAFWFgzvfFVhpGZ1/QxTy1Pd5rGz431X8mIrhy2D2E/B02l3sbYWmSUUchThdkYaQO
 /ERmqPjG1v5Dc48aB8e51aPFMBIKzGU1SN5Dfa/DshkwDbVpQDcg+aaGYJIVZwlf5IAk
 sINCLmYq+ylYFuV5qEtaxGjVb0DTWIZo+UW+NvqoJBIfLG/LbYqXrUlZLzaPjPZuiXFv
 fqWQ==
X-Gm-Message-State: APjAAAXNPfYe7zjAeo9ygNiBHGm0UjrmVmG+Zm0MeQkHG7dfMZGclvu4
 G925+fl99cSPlCLGjFpGSpe5NUFbJLsbkEFxCPh1gQ==
X-Google-Smtp-Source: APXvYqyIe7E6G/ma5mvkY6/hDtNFlt5qfcDGWRGhp+mmacfInK0kW46RcvIaMZxbpzN4UaKBoAhXFbvSTTX3zySRU0Y=
X-Received: by 2002:a9d:6e8d:: with SMTP id a13mr4543627otr.303.1559666816263; 
 Tue, 04 Jun 2019 09:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190529220944.14464-1-alexander.deucher@amd.com>
 <CAKMK7uFFB7ME=d1U-SpCUEtVbysAuW2H--=4EeKKJYofeggLoA@mail.gmail.com>
 <CADnq5_O42stLJBp71kknaoP=hPR828nbD5diC=HG-Wwag5--PA@mail.gmail.com>
In-Reply-To: <CADnq5_O42stLJBp71kknaoP=hPR828nbD5diC=HG-Wwag5--PA@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 4 Jun 2019 18:46:44 +0200
Message-ID: <CAKMK7uEji60+sCC+fzPFT3GLQcqYzgq=qB2MNzsdVCxMvQ6M7Q@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.3
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=vxbfQ/QXlflSGADky7mvnbApcLRhuk3DusfIcSrIbNo=;
 b=Ip2O73GeeW8PEY50CdddieJ1R7qRLtdJIEGRLfqTpZtpnvSFHH5CC3eH+504TJqDac
 oq72qMFY4AmBEkyvZmvg9SYwqeH+bdDON7Ifftb0E11FzC8Af7Tna15/iUpQNwce5sHY
 diYlI9WNE7Z20jsPDkwBKz/kgyOE99uRHZyh0=
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gNCwgMjAxOSBhdCA0OjQ2IFBNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDMsIDIwMTkgYXQgMTE6MzYgQU0gRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1
LCBNYXkgMzAsIDIwMTkgYXQgMTI6MDkgQU0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFp
bC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBEYXZlLCBEYW5pZWwsCj4gPiA+Cj4gPiA+IE5l
dyBzdHVmZiBmb3IgNS4zOgo+ID4gPiAtIEFkZCBuZXcgdGhlcm1hbCBzZW5zb3JzIGZvciB2ZWdh
IGFzaWNzCj4gPiA+IC0gVmFyaW91cyBSQVMgZml4ZXMKPiA+ID4gLSBBZGQgc3lzZnMgaW50ZXJm
YWNlIGZvciBtZW1vcnkgaW50ZXJmYWNlIHV0aWxpemF0aW9uCj4gPiA+IC0gVXNlIEhNTSByYXRo
ZXIgdGhhbiBtbXUgbm90aWZpZXIgZm9yIHVzZXIgcGFnZXMKPiA+ID4gLSBFeHBvc2UgeGdtaSB0
b3BvbG9neSB2aWEga2ZkCj4gPiA+IC0gU1ItSU9WIGZpeGVzCj4gPiA+IC0gRml4ZXMgZm9yIG1h
bnVhbCBkcml2ZXIgcmVsb2FkCj4gPiA+IC0gQWRkIHVuaXF1ZSBpZGVudGlmaWVyIGZvciB2ZWdh
IGFzaWNzCj4gPiA+IC0gQ2xlYW4gdXAgdXNlciBmZW5jZSBoYW5kbGluZyB3aXRoIFVWRC9WQ0Uv
VkNOIGJsb2Nrcwo+ID4gPiAtIENvbnZlcnQgREMgdG8gdXNlIGNvcmUgYnBjIGF0dHJpYnV0ZSBy
YXRoZXIgdGhhbiBhIGN1c3RvbSBvbmUKPiA+ID4gLSBBZGQgR1dTIHN1cHBvcnQgZm9yIEtGRAo+
ID4gPiAtIFZlZ2EgcG93ZXJwbGF5IGltcHJvdmVtZW50cwo+ID4gPiAtIEFkZCBDUkMgc3VwcG9y
dCBmb3IgRENFIDEyCj4gPiA+IC0gU1ItSU9WIHN1cHBvcnQgZm9yIG5ldyBzZWN1cml0eSBwb2xp
Y3kKPiA+ID4gLSBWYXJpb3VzIGNsZWFudXBzCj4gPgo+ID4gPiBDaHVubWluZyBaaG91ICgxKToK
PiA+ID4gICAgICAgZHJtL2FtZGdwdTogYWRkIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FIHRvIGFt
ZGdwdQo+ID4KPiA+IFRoaXMgdW5jb25kaXRpb25hbGx5IGVuYWJsZXMgdGltZWxpbmUgc3luY29i
aiBzdXBwb3J0LCBXaGljaCBJIHRob3VnaHQKPiA+IHdlJ3ZlIGRlY2lkZWQgdG8gaG9sZCBiYWNr
IGJlaGluZCBzb21lIG1vZHVsZV9wYXJhbV9uYW1lZF91bnNhZmUgb3IKPiA+IGV4cGVyaW1lbnRh
bCBLY29uZmlnLCBhdCBsZWFzdCB1bnRpbCBLSFIgcmF0aWZpZXMgdGhlIGV4dGVuc2lvbnMgYW5k
Cj4gPiBldmVyeW9uZSBjYW4gcHVibGlzaCB0aGUgbWVzYSBwYXRjaGVzLiBUaGlzIGlzIGtpbmRh
IHVhcGkgd2l0aG91dAo+ID4gdXNlcnNwYWNlIGFzLWlzIC4uLiBhbHNvIG5vdCBvbiB5b3VyIHN1
bW1hcnksIG9yIEknbSBibGluZC4KPgo+IFNvcnJ5LCBmb3Igc29tZSByZWFzb24gSSBoYWQgaXQg
aW4gbXkgaGVhZCB0aGF0IHdlIHdlcmUgZ29pbmcgdG8gc3RhcnQKPiBlbmFibGluZyB0aGlzIGlz
IDUuMy4gIE1heWJlIEkgd2FzIG1peGluZyBpdCB1cCB3aXRoIHNvbWV0aGluZyBlbHNlLgo+IEkg
bmVlZCB0byByZS1yZWFkIHRoZSB0aHJlYWQuICBJIGNhbiBzZW5kIGFuIHVwZGF0ZWQgcHVsbCB3
aXRoIGEKPiByZXZlcnQuCgpZZWFoIEkgdGhpbmsgdGhlIGlkZWEgd2FzIHRvIGdldCB0aGlzIGlu
LCBidXQgc29tZXdoZXJlIGhpZGRlbiB1bnRpbAppdCdzIHJlbGVhc2VkIGJ5IGtoci4gSSB0aGlu
ayBLY29uZmlnL21vZHVsZSBvcHRpb24vaWZkZWYgb3IganVzdCBub3QKeWV0IG1lcmdpbmcgdGhl
IHBhdGNoIHdpdGggdGhlIGRyaXZlciBmbGFnIHdoZXJlIGRpc2N1c3NlZC4gTGFzdCBvbmUgSQp0
aGluayBpcyB3aGF0IExpb25lbCBwbGFucyB0byBkbyBmb3IgaTkxNS4gRGF2ZSBhbHJlYWR5IG1l
cmdlZCB5b3VyCnB1bGwsIGJ1dCBpdCdzIC1uZXh0IGFuZCBmYXIgZnJvbSBtZXJnZSB3aW5kb3cg
c28gdG90YWxseSBmaW5lIGlmIHlvdQpvbmx5IHRha2UgY2FyZSBvZiB0aGlzIG9uIHRoZSBuZXh0
IHJlZ3VsYXIgZmVhdHVyZSBwdWxsIGltby4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
