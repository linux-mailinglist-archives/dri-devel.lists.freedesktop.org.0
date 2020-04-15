Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43271A98C3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 11:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BF96E921;
	Wed, 15 Apr 2020 09:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9198A6E921
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 09:25:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a25so18259343wrd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 02:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZWggYGy5+ypMqGqv3DNlvkeDC7Fwyk09CE6tJxrl9As=;
 b=yAETmibb8HvejiyM/sXx1gWJMBhdkYj+FhYy7xp+PelrTRoY6cWOI7vlWmSSyf3/r8
 Zs7zbY4OY0HkPENvC3MebqmtVYDArhkyX/g7FTCwfijd4SiDs1/6sbl1jq4MKLPElHnk
 9VKATFRT9sOJo4mRUK+WBMHugVTceCqQPi1zlKDZVNOSqDSOz+6uTukiwId07cKmWcgp
 XJxImHct6GIxxb7WyVTTlC6x3xy/LL9RImgVJnr1bV1Gk95SPry4pp++J2dF0JiCW1/i
 U/8iG7CmRO3gVZGqdupqmJQRzcbF2FVeyYIXOSA2bifkKrKSkYX5BoXstYm34gXq/2wL
 tN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZWggYGy5+ypMqGqv3DNlvkeDC7Fwyk09CE6tJxrl9As=;
 b=Sd9Ln4ARsgtBorAUkozPcQE+obPH0wSFRiFgR516PFt0sGkmjr/WIN47dHEjKtCMWx
 sruPwXOyZh0afpwr5ppeFASad9kqyEq6UlI07q0huEZATbc4BEwXMUCWRWUMKcArxph6
 EB4/kplfmL44i1zADlFCkCuctgD+fN0rfbHLsDnulGM3jXK8AbYX1kZBtdmocIjJeXvD
 r7Bhe/n00/MLJhOSnUDNK001lFqEGQhp1lA3xiOV2fPglpOcVO4TmjCruJcO4hVWJ8Ml
 9zmrgjp9o3eNbftg0IC7/tQ/K3dcVgqkFdzLOcAb7U82RwIcKNKQLz7pfUtPVmpOSnt9
 5FtA==
X-Gm-Message-State: AGi0PubUIorT4kre84VkN1iQWbHPKDgD6GCNNF4qGmUlKMENFfj5F2xf
 gJqeJebNefnD34KVqbU+tU7K9Q==
X-Google-Smtp-Source: APiQypIF43NYr8JHA746c2oer4jXDUVqBd6KdFR7FEBIeVOo3DZguLN98tLGGC6iP9SMBCFc+YgdsA==
X-Received: by 2002:a5d:658e:: with SMTP id q14mr29224669wru.92.1586942738248; 
 Wed, 15 Apr 2020 02:25:38 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id h16sm24769457wrw.36.2020.04.15.02.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 02:25:37 -0700 (PDT)
Date: Wed, 15 Apr 2020 10:26:38 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v11 10/12] backlight: pwm_bl: Use 64-bit division function
Message-ID: <20200415092638.GG2167633@dell>
References: <cover.1584667964.git.gurus@codeaurora.org>
 <17fc1dcf8b9b392d1e37dc7e3e67409e3c502840.1584667964.git.gurus@codeaurora.org>
 <20200320133123.GD5477@dell> <20200324110710.GL5477@dell>
 <20200324125735.2mjuvbxt5bpon2ft@pengutronix.de>
 <20200324130410.dwlg767ku6kwequv@holly.lan>
 <20200324142441.GD442973@dell>
 <20200324144307.kxhqzyjj4evrouqa@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324144307.kxhqzyjj4evrouqa@pengutronix.de>
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
Cc: Guru Das Srinagesh <gurus@codeaurora.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-pwm@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-fbdev@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNCBNYXIgMjAyMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IE9uIFR1ZSwg
TWFyIDI0LCAyMDIwIGF0IDAyOjI0OjQxUE0gKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiA+IE9u
IFR1ZSwgMjQgTWFyIDIwMjAsIERhbmllbCBUaG9tcHNvbiB3cm90ZToKPiA+IAo+ID4gPiBPbiBU
dWUsIE1hciAyNCwgMjAyMCBhdCAwMTo1NzozNVBNICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3
cm90ZToKPiA+ID4gPiBIZWxsbyBMZWUsCj4gPiA+ID4gCj4gPiA+ID4gT24gVHVlLCBNYXIgMjQs
IDIwMjAgYXQgMTE6MDc6MTBBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiA+ID4gT24g
RnJpLCAyMCBNYXIgMjAyMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
IE9uIFRodSwgMTkgTWFyIDIwMjAsIEd1cnUgRGFzIFNyaW5hZ2VzaCB3cm90ZToKPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+ID4gU2luY2UgdGhlIFBXTSBmcmFtZXdvcmsgaXMgc3dpdGNoaW5nIHN0
cnVjdCBwd21fc3RhdGUucGVyaW9kJ3MgZGF0YXR5cGUKPiA+ID4gPiA+ID4gPiB0byB1NjQsIHBy
ZXBhcmUgZm9yIHRoaXMgdHJhbnNpdGlvbiBieSB1c2luZyBkaXZfdTY0IHRvIGhhbmRsZSBhIDY0
LWJpdAo+ID4gPiA+ID4gPiA+IGRpdmlkZW5kIGluc3RlYWQgb2YgYSBzdHJhaWdodCBkaXZpc2lv
biBvcGVyYXRpb24uCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gQ2M6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiA+ID4gPiA+ID4gQ2M6IERhbmllbCBUaG9tcHNvbiA8
ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gPiA+ID4gPiA+ID4gQ2M6IEppbmdvbyBIYW4g
PGppbmdvb2hhbjFAZ21haWwuY29tPgo+ID4gPiA+ID4gPiA+IENjOiBCYXJ0bG9taWVqIFpvbG5p
ZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4gPiA+ID4gPiA+ID4gQ2M6IGxp
bnV4LXB3bUB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gPiA+ID4gPiBDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+ID4gPiA+ID4gPiA+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5l
bC5vcmcKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdXJ1IERh
cyBTcmluYWdlc2ggPGd1cnVzQGNvZGVhdXJvcmEub3JnPgo+ID4gPiA+ID4gPiA+IFJldmlld2Vk
LWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+ID4gPiA+
ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwu
YyB8IDMgKystCj4gPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IENhbiB0aGlzIHBhdGNoIGJl
IHRha2VuIG9uIGl0cyBvd24/Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IEhlbGxvb29vbyAuLi4KPiA+
ID4gPiAKPiA+ID4gPiBDb25jZXB0dWFsbHkgaXQgY2FuLiBBcyB0aGUgbGFzdCBwYXRjaCBkZXBl
bmRzIG9uIHRoaXMgb25lIChhbmQgdGhlCj4gPiA+ID4gb3RoZXJzKSBzb21lIGNvb3JkaW5hdGlv
biBtaWdodCBiZSBiZW5lZmljaWFsLiBCdXQgdGhhdCdzIHVwIHRvIFRoaWVycnkKPiA+ID4gPiB0
byBkZWNpZGUgaG93IChhbmQgaWYpIGhlIHdhbnQgdGhpcyBzZXJpZXMgdG8gYmUgYXBwbGllZC4K
PiA+ID4gCj4gPiA+IC4uLiBhbmQgb24gdGhlIGJhY2tsaWdodCBzaWRlIHdlIGRlZmluaXRlbHkg
bmVlZCB0byBrbm93IGFib3V0IHRoZSAiaWYiCj4gPiA+IG90aGVyd2lzZSB0aGVyZSdzIG5vIHBv
aW50IGluIHRha2luZyBpdC4KPiA+IAo+ID4gUmlnaHQuCj4gPiAKPiA+IEknbSBoYXBweSB0byB3
YWl0IGZvciBUaGllcnJ5LiAgQWx0aG91Z2ggdGhpcyBpc24ndCB0aGUgb25seSBzZXQgaGUncwo+
ID4gY3VycmVudGx5IGJsb2NraW5nLiAgSXMgaGUgb2theT8gIE9uIGhvbGlkYXkgcGVyaGFwcz8K
PiAKPiBUaGUgbmV3ZXN0IGNvbW1pdCBieSBoaW0gaW4gbmV4dCBpcyBmcm9tIGxhc3Qgd2Vlay4g
TXkgZ3Vlc3MgaXMgaGUKPiBqdXN0IGRpZG4ndCBjb21lIGFyb3VuZCB5ZXQgdG8gY2FyZSBmb3Ig
dGhlIFBXTSBkdXRpZXMuCgpMb29rcyBsaWtlIHdlIG1pc3NlZCB0aGUgbGFzdCByZWxlYXNlLgoK
TGV0J3MgaG9wZSB3ZSBkb24ndCBtaXNzIHRoZSBuZXh0IG9uZSBhbHNvLgoKLS0gCkxlZSBKb25l
cyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDi
lIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vi
b29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
