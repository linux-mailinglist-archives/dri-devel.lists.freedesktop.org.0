Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21BD363C63
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 09:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE7C89F31;
	Mon, 19 Apr 2021 07:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC52689F31
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 07:22:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id g9so16797699wrx.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 00:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=SyHfgB6+zRTrv/Haj5bvpwPiVHLCQUxHRjTDe9iiH6E=;
 b=dU/4LDGRRx8nJXozQ+Zxr4ntLfl8eJOmmOdmXn29QZwsESpQ2dTw3PM0u45Vr9LIpr
 3tyvaCuWfV0joiMGdJrFXQ3Ga/UdF2t10SuyDvOVZwxxWVA6ZFtyuri5pN0Gwy/XLJJV
 8nXTPRk/sCWQfj7F0gjmd+gLMZ5Cuk2CPaUyDzT6PmoGLqdrcGfRS5LdMTr0aoGGIK5L
 EiZGvmreJlkSeVDdLGTuZvqfJsG7oD08F9/O4yRfrH3g53scMBan2Mrrkq3tUeupeI+w
 Lre0xFKk9J+sQFEpneE6rYGagHWsMSrNRNIyOpuW9M1AF3GCiNuNBD0V6Huwt4Xfrj3R
 iZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SyHfgB6+zRTrv/Haj5bvpwPiVHLCQUxHRjTDe9iiH6E=;
 b=DraEaVV8wa8gf66Oy2HEY9cA7KWqZBQTXBdwi61Uc9/yixLGzTuHXkxG0vm7o7RgT5
 SQ58yGMiH0tc1m8soMuICckE2DbWm5boxAqGFRBKF5ttxI+uUCCTkCKtssVyirBQi9SZ
 BPmzxM54kv/pstAj23I45+jP1Mcc9ek9MKVLeadJbQ+KUqlbvPXq4HJtncAT91Q/cFXo
 RkmyUajWlasWebwxzoEQUGWNlCbcEDR38t8Bd4vFWcssxlpuwbja1Gh0yw7Bxk/fowa4
 772C1KT74ahSZzMF5WFDdJ+s3OlW9sbyUdFuY0A20wscBhnRdy/CWzYITsNNBal3cWJg
 ASlQ==
X-Gm-Message-State: AOAM530mGcvnEp6dOKQJf6ClUXGJQ1aDoTxIlAnjmjQhTLHT2H0Cgp5K
 G5eKOMqz9PMEjVhJLdXINeCNVg==
X-Google-Smtp-Source: ABdhPJxh18Iex/zR5QdzoK6VikkBPDY8E2/oAyYW/dloMMublMlaJLI0hJSIcJwBfxJ2wTpMKDi89A==
X-Received: by 2002:adf:e650:: with SMTP id b16mr12543937wrn.273.1618816952381; 
 Mon, 19 Apr 2021 00:22:32 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id l7sm23627114wrb.35.2021.04.19.00.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:22:31 -0700 (PDT)
Date: Mon, 19 Apr 2021 08:22:29 +0100
From: Lee Jones <lee.jones@linaro.org>
To: ChiYuan Huang <u0084500@gmail.com>
Subject: Re: [PATCH v6 1/4] mfd: rt4831: Adds support for Richtek RT4831
Message-ID: <20210419072229.GA4869@dell>
References: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
 <CADiBU3-d3_L8RTeYCirnfjJdG=ea6UVenAi8O8GO_LvOaB7OdA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADiBU3-d3_L8RTeYCirnfjJdG=ea6UVenAi8O8GO_LvOaB7OdA@mail.gmail.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
 Mark Brown <broonie@kernel.org>, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxOSBBcHIgMjAyMSwgQ2hpWXVhbiBIdWFuZyB3cm90ZToKCj4gSGksIExpbnV4IG1m
ZCByZXZpZXdlcnM6Cj4gICAgSXQncyBiZWVuIHRocmVlIHdlZWtzIG5vdCB0byBnZXQgYW55IHJl
c3BvbnNlIGZyb20geW91Lgo+IElzIHRoZXJlIHNvbWV0aGluZyB3cm9uZyBhYm91dCB0aGlzIG1m
ZCBwYXRjaD8KPiBJZiB5ZXMsIHBsZWFzZSBmZWVsIGZyZWUgdG8gbGV0IG1lIGtub3cuCgpDb3Vw
bGUgb2YgdGhpbmdzOgoKRmlyc3QsIGlmIHlvdSB0aGluayBhIHBhdGNoIGhhZCBmYWxsZW4gdGhy
b3VnaCB0aGUgZ2Fwcywgd2hpY2ggZG9lcwpoYXBwZW4gc29tZXRpbWVzLCBpdCBpcyBnZW5lcmFs
bHkgY29uc2lkZXJlZCBhY2NlcHRhYmxlIHRvIHN1Ym1pdCBhCltSRVNFTkRdIH4yIHdlZWtzIGFm
dGVyIHRoZSBpbml0aWFsIHN1Ym1pc3Npb24uICBGWUk6IFRoaXMgd2FzIHN1Y2ggYQpwYXRjaC4g
IEl0IHdhcyBub3Qgb24sIG9yIGhhZCBmYWxsZW4gb2ZmIG9mIG15IHJhZGFyIGZvciBzb21lIHJl
YXNvbi4KClNlY29uZGx5LCB3ZSBhcmUgcmVhbGx5IGxhdGUgaW4gdGhlIHJlbGVhc2UgY3ljbGUu
ICAtcmM4IGhhcyBqdXN0IGJlZW4KcmVsZWFzZWQuICBRdWl0ZSBhIGZldyBtYWludGFpbmVycyBz
bG93IGRvd24gYXQgfi1yYzYuICBQYXJ0aWN1bGFybHkKZm9yIG5ldyBkcml2ZXJzLgoKTm8gbmVl
ZCB0byByZXN1Ym1pdCB0aGlzIGRyaXZlciB0aGlzIHRpbWUuICBJdCBpcyBub3cgb24gbXkgdG8t
cmV2aWV3Cmxpc3QgYW5kIEkgd2lsbCB0ZW5kIHRvIGl0IHNob3J0bHkuCgpUaGFua3MgZm9yIHlv
dXIgcGF0aWVuY2UuCgo+IGN5X2h1YW5nIDx1MDA4NDUwMEBnbWFpbC5jb20+IOaWvCAyMDIx5bm0
M+aciDI45pelIOmAseaXpSDkuIvljYgxMToyNOWvq+mBk++8mgo+ID4KPiA+IEZyb206IENoaVl1
YW4gSHVhbmcgPGN5X2h1YW5nQHJpY2h0ZWsuY29tPgo+ID4KPiA+IFRoaXMgYWRkcyBzdXBwb3J0
IFJpY2h0ZWsgUlQ0ODMxIGNvcmUuIEl0IGluY2x1ZGVzIGZvdXIgY2hhbm5lbCBXTEVEIGRyaXZl
cgo+ID4gYW5kIERpc3BsYXkgQmlhcyBWb2x0YWdlIG91dHB1dHMuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmljaHRlay5jb20+Cj4gPiAtLS0KPiA+IFRo
ZSBSVDQ4MzEgcmVndWxhdG9yIHBhdGNoZXMgYXJlIGFscmVhZHkgb24gbWFpbiBzdHJlYW0sIGFu
ZCBjYW4gYmUgcmVmZXJyZWQgdG8KPiA+IDkzNTFhYjhiMGNiNiByZWd1bGF0b3I6IHJ0NDgzMTog
QWRkcyBzdXBwb3J0IGZvciBSaWNodGVrIFJUNDgzMSBEU1YgcmVndWxhdG9yCj4gPiA5MzRiMDVl
ODE4NjIgcmVndWxhdG9yOiBydDQ4MzE6IEFkZHMgRFQgYmluZGluZyBkb2N1bWVudCBmb3IgUmlj
aHRlayBSVDQ4MzEgRFNWIHJlZ3VsYXRvcgo+ID4KPiA+IHNpbmNlIHY2Cj4gPiAtIFJlc3BpbiB0
aGUgZGF0ZSBmcm9tIDIwMjAgdG8gMjAyMS4KPiA+IC0gUm1vdmUgdGhlIHNodXRkb3duIHJvdXRp
bmUuCj4gPiAtIENoYW5nZSB0aGUgbWFjcm8gT0ZfTUZEX0NFTEwgdG8gTUZEX0NFTExfT0YuCj4g
Pgo+ID4KPiA+IHNpbmNlIHY1Cj4gPiAtIFJlbmFtZSBmaWxlIG5hbWUgZnJvbSBydDQ4MzEtY29y
ZS5jIHRvIHJ0NDgzMS5jCj4gPiAtIENoYW5nZSBSSUNIVEVLX1ZJRCB0byBSSUNIVEVLX1ZFTkRP
Ul9JRC4KPiA+IC0gQ2hhbmdlIGdwaW9fZGVzYyBuYW1laW5nIGZyb20gJ2VuYWJsZScgdG8gJ2Vu
YWJsZV9ncGlvJyBpbiBwcm9iZS4KPiA+IC0gQ2hhbmdlIHZhcmlhYmxlICd2YWwnIHRvIHRoZSBt
ZWFuaW5nZnVsIG5hbWUgJ2NoaXBfaWQnLgo+ID4gLSBSZWZpbmUgdGhlIGVycm9yIGxvZyB3aGVu
IHZlbmRvciBpZCBpcyBub3QgbWF0Y2hlZC4KPiA+IC0gUmVtb3ZlIG9mX21hdGNoX3B0ci4KPiA+
Cj4gPiBzaW5jZSB2Mgo+ID4gLSBSZWZpbmUgS2NvbmZpZyBkZXNjcmlwdGlvbnMuCj4gPiAtIEFk
ZCBjb3B5cmlnaHQuCj4gPiAtIFJlZmluZSBlcnJvciBsb2dzIGluIHByb2JlLgo+ID4gLSBSZWZp
bmUgY29tbWVudCBsaW5lcyBpbiByZW1vdmUgYW5kIHNodXRkb3duLgo+ID4gLS0tCj4gPiAgZHJp
dmVycy9tZmQvS2NvbmZpZyAgfCAgMTAgKysrKysKPiA+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSB8
ICAgMSArCj4gPiAgZHJpdmVycy9tZmQvcnQ0ODMxLmMgfCAxMTUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAx
MjYgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21mZC9ydDQ4
MzEuYwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBE
ZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
