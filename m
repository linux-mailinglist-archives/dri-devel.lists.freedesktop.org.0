Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6A7368ECF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 10:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B546E0B8;
	Fri, 23 Apr 2021 08:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B706C6E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 08:27:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 q123-20020a1c43810000b029012c7d852459so5392943wma.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 01:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UGXDfU5CAuOew8JInuwwVL1OHr7a7FSfU2FNvlz4Ij4=;
 b=emp4dDwd9PW6Fg/HM2hVaJrFpWpn8ZtTqNcC7f9ehqJYLI8fs+GUqak1KpF0nzQ2K2
 gnf6KyeoYABc+RalTF278v+mawYXSueUhCdTCv3quN0nfdto/xkj6YCWpbp+/f3Wjy7W
 pk7yKGyJ0uRSkqCW7eHT953S8kjV9uKjTq6tfEqYEJIvq+JamAbsGOokScjXZU4dpWcu
 D8T+Cc4pDVbxBWDRATJ/zPB+Ea3MDgZEbyJi3JhyduV7VsmPNyJRfSKFkFo3VQqU2ooy
 wOyMnQ0dMvyuIzL1GzlnPZXLXZFoSqWu2i1F+BMjMkn8iUBg0NTJfwR7ebWt/azpQ/nX
 rcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UGXDfU5CAuOew8JInuwwVL1OHr7a7FSfU2FNvlz4Ij4=;
 b=DHh5WWSfnrvvGHHZM16gHRZipCLt7joHe7Hvm6xSxl6FeWSklRquhcBntFgHg4lv/r
 1eZxJVwSvrKBytb08CgqCuKRyRN/OhjCqqtXi0ZECaoiiItrGOXqI3bIOdPwLftkHlhA
 mCv6UXlxz2pD20LppKAIJ5NfeDqY4iGnovf+DVqQad9ZA2ByQYAe1HK+9E5/L+871eQc
 3gPI2NPmtsrfTyoEEbPPJUxFySyfidvd6d1MILHzKbpSoSe3n7VbkT3BnM2djNUkmtEm
 NSUHT9XEi6aUyjYmUR4qU75mXW654ltPW1EWjPBjhYBZGOO5W2ktZb6Xn6HcKWkDJ3W9
 J2mA==
X-Gm-Message-State: AOAM531N1WG51tXfuGEd84cabBAwOOJoEDiUjw7wwbPq5GECczzzje1P
 WX42ErgT+ZBz10B2vV+X2iztTA==
X-Google-Smtp-Source: ABdhPJzZ8uASD6Dq0I5Tj0ljrEATP/sYaFUzbpIiT4c4Z9o46Ssr3PF77tivFsnKAlb6yYXdeNjJPQ==
X-Received: by 2002:a1c:6a06:: with SMTP id f6mr2867470wmc.179.1619166469406; 
 Fri, 23 Apr 2021 01:27:49 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id s64sm7169435wmf.2.2021.04.23.01.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 01:27:48 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:27:46 +0100
From: Lee Jones <lee.jones@linaro.org>
To: ChiYuan Huang <u0084500@gmail.com>
Subject: Re: [PATCH v6 1/4] mfd: rt4831: Adds support for Richtek RT4831
Message-ID: <20210423082746.GC6446@dell>
References: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
 <CADiBU3-d3_L8RTeYCirnfjJdG=ea6UVenAi8O8GO_LvOaB7OdA@mail.gmail.com>
 <20210419072229.GA4869@dell> <20210419072317.GB4869@dell>
 <20210419072403.GC4869@dell>
 <CADiBU38bMuH00Bcx5hJas2=yAon00ffcGokT4u89vX-LJYuxNA@mail.gmail.com>
 <CADiBU39F4nHC5U+G+fJJemAJgeYxDimi0cXYkm25+YC8qO5yDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADiBU39F4nHC5U+G+fJJemAJgeYxDimi0cXYkm25+YC8qO5yDA@mail.gmail.com>
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

T24gRnJpLCAyMyBBcHIgMjAyMSwgQ2hpWXVhbiBIdWFuZyB3cm90ZToKCj4gSGksIExlZToKPiAK
PiBDaGlZdWFuIEh1YW5nIDx1MDA4NDUwMEBnbWFpbC5jb20+IOaWvCAyMDIx5bm0NOaciDE55pel
IOmAseS4gCDkuIvljYg1OjU15a+r6YGT77yaCj4gPgo+ID4gTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4g5pa8IDIwMjHlubQ05pyIMTnml6Ug6YCx5LiAIOS4i+WNiDM6MjTlr6vpgZPv
vJoKPiA+ID4KPiA+ID4gT24gTW9uLCAxOSBBcHIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgo+ID4g
Pgo+ID4gPiA+IE9uIE1vbiwgMTkgQXByIDIwMjEsIExlZSBKb25lcyB3cm90ZToKPiA+ID4gPgo+
ID4gPiA+ID4gT24gTW9uLCAxOSBBcHIgMjAyMSwgQ2hpWXVhbiBIdWFuZyB3cm90ZToKPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IEhpLCBMaW51eCBtZmQgcmV2aWV3ZXJzOgo+ID4gPiA+ID4gPiAgICBJ
dCdzIGJlZW4gdGhyZWUgd2Vla3Mgbm90IHRvIGdldCBhbnkgcmVzcG9uc2UgZnJvbSB5b3UuCj4g
PiA+ID4gPiA+IElzIHRoZXJlIHNvbWV0aGluZyB3cm9uZyBhYm91dCB0aGlzIG1mZCBwYXRjaD8K
PiA+ID4gPiA+ID4gSWYgeWVzLCBwbGVhc2UgZmVlbCBmcmVlIHRvIGxldCBtZSBrbm93Lgo+ID4g
PiA+ID4KPiA+ID4gPiA+IENvdXBsZSBvZiB0aGluZ3M6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gRmly
c3QsIGlmIHlvdSB0aGluayBhIHBhdGNoIGhhZCBmYWxsZW4gdGhyb3VnaCB0aGUgZ2Fwcywgd2hp
Y2ggZG9lcwo+ID4gPiA+ID4gaGFwcGVuIHNvbWV0aW1lcywgaXQgaXMgZ2VuZXJhbGx5IGNvbnNp
ZGVyZWQgYWNjZXB0YWJsZSB0byBzdWJtaXQgYQo+ID4gPiA+ID4gW1JFU0VORF0gfjIgd2Vla3Mg
YWZ0ZXIgdGhlIGluaXRpYWwgc3VibWlzc2lvbi4gIEZZSTogVGhpcyB3YXMgc3VjaCBhCj4gPiA+
ID4gPiBwYXRjaC4gIEl0IHdhcyBub3Qgb24sIG9yIGhhZCBmYWxsZW4gb2ZmIG9mIG15IHJhZGFy
IGZvciBzb21lIHJlYXNvbi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTZWNvbmRseSwgd2UgYXJlIHJl
YWxseSBsYXRlIGluIHRoZSByZWxlYXNlIGN5Y2xlLiAgLXJjOCBoYXMganVzdCBiZWVuCj4gPiA+
ID4gPiByZWxlYXNlZC4gIFF1aXRlIGEgZmV3IG1haW50YWluZXJzIHNsb3cgZG93biBhdCB+LXJj
Ni4gIFBhcnRpY3VsYXJseQo+ID4gPiA+ID4gZm9yIG5ldyBkcml2ZXJzLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IE5vIG5lZWQgdG8gcmVzdWJtaXQgdGhpcyBkcml2ZXIgdGhpcyB0aW1lLiAgSXQgaXMg
bm93IG9uIG15IHRvLXJldmlldwo+ID4gPiA+ID4gbGlzdCBhbmQgSSB3aWxsIHRlbmQgdG8gaXQg
c2hvcnRseS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0aWVuY2UuCj4g
PiA+ID4KPiA+ID4gPiBBbHNvIHlvdSBhcmUgbWlzc2luZyBhIERUIHJldmlldyBvbiBwYXRjaCA0
Lgo+ID4gPgo+ID4gPiAuLi4gbG9va3MgbGlrZSB5b3UgZm9yZ290IHRvIENjIHRoZW0hCj4gPiA+
Cj4gPiBZYXAsIHJlYWxseS4gSScnbGwgcmVzZW5kIHBhdGNoIDQgYW5kIGNjIHRoZW0uIFRoeC4K
PiAKPiBTaG91bGQgSSByZXNlbmQgdGhlIHBhdGNoIGFuZCBsb29wIERUIHJldmlld2Vycz8KClll
cywgcGxlYXNlLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExl
YWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
