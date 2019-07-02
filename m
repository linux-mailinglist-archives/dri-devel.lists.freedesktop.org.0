Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E03D5D7B6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 23:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF8E89A4F;
	Tue,  2 Jul 2019 21:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C0589A72
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 21:04:08 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id z75so6088pgz.5
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 14:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a6DSR9zMVNSIPOHutOGYYowzxyygnNjjAgHH6t/fH3Q=;
 b=DItMSHBr1zu1IrVVqUxfZvAXL2uuNFNEN1wZJ52k/w+00sO0kITZtl4Cs7UVzesil5
 urnwmLAfaGVa7vqN/S+WYKBbqgE1+2dipRgtk7ssvL60wef6UjR15/2hicOQ8fMYHN0U
 yDfYC62v4lJKz7+3I/x8+dlIMHuaDUjsGf1WK+nL9rkX2nhESLLAWgtT+whzBvHxdnlm
 yFnC02u7C9G5SQRVnSkRWyIfMcd5PFZ+DasK+jv2McAUxGBHdfzuMqyhTVyCMP/pU8lU
 qDAvUaBVLR+ozReeJJHWTkKKXmlcf/XOHEKrio0UB5elRX9FXtmygcsAQ+7KMEP46In9
 /7DA==
X-Gm-Message-State: APjAAAWbKcAp9TBJr1nPWtwDcAU6H9RKgWHxVXdQs6hctY2mZj51RZWN
 SivO0Sj8tx+/S6ySUn3kwP2HiQ==
X-Google-Smtp-Source: APXvYqxbnDf0epA4zxEVMf+KQtiS47h5ZVi4HVl0lxeY8pfHVzHmCshNhotvWTcEjEQC+XEnSbkkRg==
X-Received: by 2002:a17:90a:b908:: with SMTP id
 p8mr7901348pjr.94.1562101447970; 
 Tue, 02 Jul 2019 14:04:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id g1sm52207pgg.27.2019.07.02.14.04.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 02 Jul 2019 14:04:03 -0700 (PDT)
Date: Tue, 2 Jul 2019 09:33:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH V2] include: linux: Regularise the use of FIELD_SIZEOF
 macro
Message-ID: <201907020931.2170BAB@keescook>
References: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
 <20190611134831.a60c11f4b691d14d04a87e29@linux-foundation.org>
 <6DCAE4F8-3BEC-45F2-A733-F4D15850B7F3@dilger.ca>
 <20190629142510.GA10629@avx2>
 <c3b83ba7f9b003dd4fb9cad885461ce93165dc04.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3b83ba7f9b003dd4fb9cad885461ce93165dc04.camel@perches.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=a6DSR9zMVNSIPOHutOGYYowzxyygnNjjAgHH6t/fH3Q=;
 b=ZMFtd4fnwBhjqDgEcmMPYqwTfM3scvxup6E9ES0eTl1QBLbkm4L+EYQQqrUrDt7I0f
 1W7i7K4qFAKEM9FkLZbBvOwEPA2KShqct0FnQuEtwjRtbN+49uyAwET1ta2fkPFntUdL
 d1HKAJ/XrkEjycdCCsfgQI1lqoOc8poLOC7Ys=
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
Cc: Andreas Dilger <adilger@dilger.ca>, bpf@vger.kernel.org,
 kvm@vger.kernel.org, kernel-hardening@lists.openwall.com,
 netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 devel@lists.orangefs.org, linux-kernel@vger.kernel.org,
 Shyam Saini <shyam.saini@amarulasolutions.com>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, intel-gvt-dev@lists.freedesktop.org,
 Alexey Dobriyan <adobriyan@gmail.com>, linux-arm-kernel@lists.infradead.org,
 mayhs11saini@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMjksIDIwMTkgYXQgMDk6NDU6MTBBTSAtMDcwMCwgSm9lIFBlcmNoZXMgd3Jv
dGU6Cj4gT24gU2F0LCAyMDE5LTA2LTI5IGF0IDE3OjI1ICswMzAwLCBBbGV4ZXkgRG9icml5YW4g
d3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAwMzowMDoxMFBNIC0wNjAwLCBBbmRy
ZWFzIERpbGdlciB3cm90ZToKPiA+ID4gT24gSnVuIDExLCAyMDE5LCBhdCAyOjQ4IFBNLCBBbmRy
ZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+ID4gPiBPbiBX
ZWQsIDEyIEp1biAyMDE5IDAxOjA4OjM2ICswNTMwIFNoeWFtIFNhaW5pIDxzaHlhbS5zYWluaUBh
bWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4gPiA+IEkgZGlkIGEgY2hlY2ssIGFuZCBGSUVM
RF9TSVpFT0YoKSBpcyB1c2VkIGFib3V0IDM1MHgsIHdoaWxlIHNpemVvZl9maWVsZCgpCj4gPiA+
IGlzIGFib3V0IDMweCwgYW5kIFNJWkVPRl9GSUVMRCgpIGlzIG9ubHkgYWJvdXQgNXguCj4gPiA+
IAo+ID4gPiBUaGF0IHNhaWQsIEknbSBtdWNoIG1vcmUgaW4gZmF2b3VyIG9mICJzaXplb2ZfZmll
bGQoKSIgb3IgInNpemVvZl9tZW1iZXIoKSIKPiA+ID4gdGhhbiBGSUVMRF9TSVpFT0YoKS4gIE5v
dCBvbmx5IGRvZXMgdGhhdCBiZXR0ZXIgbWF0Y2ggIm9mZnNldG9mKCkiLCB3aXRoCj4gPiA+IHdo
aWNoIGl0IGlzIGNsb3NlbHkgcmVsYXRlZCwgYnV0IGlzIGFsc28gY2xvc2VyIHRvIHRoZSBvcmln
aW5hbCAic2l6ZW9mKCkiLgo+ID4gPiAKPiA+ID4gU2luY2UgdGhpcyBpcyBhIHJhdGhlciB0cml2
aWFsIGNoYW5nZSwgaXQgY2FuIGJlIHNwbGl0IGludG8gYSBudW1iZXIgb2YKPiA+ID4gcGF0Y2hl
cyB0byBnZXQgYXBwcm92YWwvbGFuZGluZyB2aWEgc3Vic3lzdGVtIG1haW50YWluZXJzLCBhbmQg
dGhlcmUgaXMgbm8KPiA+ID4gaHVnZSB1cmdlbmN5IHRvIHJlbW92ZSB0aGUgb3JpZ2luYWwgbWFj
cm9zIHVudGlsIHRoZSB1c2VycyBhcmUgZ29uZS4gIEl0Cj4gPiA+IHdvdWxkIG1ha2Ugc2Vuc2Ug
dG8gcmVtb3ZlIFNJWkVPRl9GSUVMRCgpIGFuZCBzaXplb2ZfZmllbGQoKSBxdWlja2x5IHNvCj4g
PiA+IHRoZXkgZG9uJ3QgZ2FpbiBtb3JlIHVzZXJzLCBhbmQgdGhlIHJlbWFpbmluZyBGSUVMRF9T
SVpFT0YoKSB1c2VycyBjYW4gYmUKPiA+ID4gd2hpdHRsZWQgYXdheSBhcyB0aGUgcGF0Y2hlcyBj
b21lIHRocm91Z2ggdGhlIG1haW50YWluZXIgdHJlZXMuCj4gPiAKPiA+IFRoZSBzaWduYXR1cmUg
c2hvdWxkIGJlCj4gPiAKPiA+IAlzaXplb2ZfbWVtYmVyKFQsIG0pCj4gPiAKPiA+IGl0IGlzIHBy
b3BlciBFbmdsaXNoLAo+ID4gaXQgaXMgbG93ZXJjYXNlLCBzbyBpcyBlYXNpZXIgdG8gdHlwZSwK
PiA+IGl0IHVzZXMgc3RhbmRhcmQgdGVybSAobWVtYmVyLCBub3QgZmllbGQpLAo+ID4gaXQgYmxl
bmRzIGluIHdpdGggc3RhbmRhcmQgInNpemVvZiIgb3BlcmF0b3IsCj4gCj4geWVzIHBsZWFzZS4K
PiAKPiBBbHNvLCBhIHNpbXBsZSBzY3JpcHQgY29udmVyc2lvbiBhcHBsaWVkCj4gaW1tZWRpYXRl
bHkgYWZ0ZXIgYW4gcmMxIG1pZ2h0IGJlIGVhc2llc3QKPiByYXRoZXIgdGhhbiBpbmRpdmlkdWFs
IHBhdGNoZXMuCgpUaGlzIHNlZW1zIHJlYXNvbmFibGUgdG8gbWUuIEkgdGhpbmsgdGhlIHBhdGNo
IHN0ZXBzIHdvdWxkIGJlOgoKMSkgaW1wbGVtZW50IHNpemVvZl9tZW1iZXIoVCwgbSkgYXMgYSBz
dGFuZC1hbG9uZSBtYWNybwoyKSBkbyBhIHNjcmlwdGVkIHJlcGxhY2VtZW50IG9mIGFsbCBpZGVu
dGljYWwgbWFjcm9zLgozKSByZW1vdmUgYWxsIHRoZSBpZGVudGljYWwgbWFjcm9zLgoKU3RlcCAy
IGNhbiBiZSBhIHBhdGNoIHRoYXQgaW5jbHVkZXMgdGhlIHNjcmlwdCB1c2VkIHRvIGRvIHRoZQpy
ZXBsYWNlbWVudC4gVGhhdCB3YXkgTGludXMgY2FuIGNob29zZSB0byBqdXN0IHJ1biB0aGUgc2Ny
aXB0IGluc3RlYWQgb2YKdGFraW5nIHRoZSBwYXRjaC4KCi0tIApLZWVzIENvb2sKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
