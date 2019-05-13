Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 103241B9A6
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 17:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3243F89FDB;
	Mon, 13 May 2019 15:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A661589FDB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 15:14:10 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id l25so18077102eda.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 08:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=b3ZsxbY91h2byIdigyViRztW48WAaM07J61Fsufp2zg=;
 b=IjI1ibKOwJ4jhRr5296GCPFoLSBblzGQWbBjdgypm3oCF9CO90uTigD/w/EFe6JLkb
 RGUS1oxEGKoylgo38y+NZT4zfSOIgyaXfF6PsWhF7YgIiWVZ/0UZZg6LxZrnFy+aj/w9
 NQFjzDlGOmjW4eTIKbrcp/1nrWll1W24GkWiAYRwIHw71aR2UHJ0mqKmttwwEzMxWWbZ
 5gwAkpQrXI4oxuaZbFwtpWM+HoSWlTAmVhfM6ucmaL9h7dsPcLMlLnpPl4u/6QwsF/IJ
 LGEmkgsFZ/5rp0/cOVaVnRJHuz3TRuDmoOn88P1qMBOdVv4wvHc4/S0Dkp/e8igN5uAZ
 ufhQ==
X-Gm-Message-State: APjAAAW5Hvlzs+wF2ZQNbwpCEYQWzq6/ctvGKVorIwilanp05Mx1cpt1
 VwhhzFoRuVYQwI79UdzDGmL9EQ==
X-Google-Smtp-Source: APXvYqz90G91DTeR9OP/EpXrfldPUD2lfY202QZGhScBhFkopAxaDjX2LA1QA1yYZgJhko7DSYIOJg==
X-Received: by 2002:a17:906:4244:: with SMTP id
 r4mr8073761ejl.211.1557760449369; 
 Mon, 13 May 2019 08:14:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id gt16sm909611ejb.60.2019.05.13.08.14.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 08:14:08 -0700 (PDT)
Date: Mon, 13 May 2019 17:14:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: peron.clem@gmail.com
Subject: Re: [PATCH v4 0/8] Allwinner H6 Mali GPU support
Message-ID: <20190513151405.GW17751@phenom.ffwll.local>
Mail-Followup-To: peron.clem@gmail.com, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
References: <20190512174608.10083-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190512174608.10083-1-peron.clem@gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=b3ZsxbY91h2byIdigyViRztW48WAaM07J61Fsufp2zg=;
 b=Ytf5rDGs1k8Tv4JCFwOIHXj93yat5az5zLREOibB9Io7ACItmsO2sG1iDQpG8Qa9I1
 zSDszGlTwMs7OT8u2Y6VhPYJ5IcwuPJfsKri52BI1GSq3l5D4Sp15bYGVRl2/wVArCTL
 na9u1qZRUsjLMa5jtO89frg3gLnKi5Hwt+lBw=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgMTIsIDIwMTkgYXQgMDc6NDY6MDBQTSArMDIwMCwgcGVyb24uY2xlbUBnbWFp
bC5jb20gd3JvdGU6Cj4gRnJvbTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNv
bT4KPiAKPiBIaSwKPiAKPiBUaGUgQWxsd2lubmVyIEg2IGhhcyBhIE1hbGktVDcyMCBNUDIuIFRo
ZSBkcml2ZXJzIGFyZQo+IG91dC1vZi10cmVlIHNvIHRoaXMgc2VyaWVzIG9ubHkgaW50cm9kdWNl
IHRoZSBkdC1iaW5kaW5ncy4KCldlIGRvIGhhdmUgYW4gaW4tdHJlZSBtaWRnYXJkIGRyaXZlciBu
b3cgKHNpbmNlIDUuMikuIERvZXMgdGhpcyBzdHVmZiB3b3JrCnRvZ2V0aGVyIHdpdGggeW91ciBk
dCBjaGFuZ2VzIGhlcmU/Ci1EYW5pZWwKCj4gVGhlIGZpcnN0IHBhdGNoIGlzIGZyb20gTmVpbCBB
bXN0cm9uZyBhbmQgaGFzIGJlZW4gYWxyZWFkeQo+IG1lcmdlZCBpbiBsaW51eC1hbWxvZ2ljLiBJ
dCBpcyByZXF1aXJlZCBmb3IgdGhpcyBzZXJpZXMuCj4gCj4gVGhlIHNlY29uZCBwYXRjaCBpcyBm
cm9tIEljZW5vd3kgWmhlbmcgd2hlcmUgSSBjaGFuZ2VkIHRoZQo+IG9yZGVyIGhhcyByZXF1aXJl
ZCBieSBSb2IgSGVycmluZy4KPiBTZWU6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0
Y2gvMTA2OTk4MjkvCj4gCj4gVGhhbmtzLAo+IENsw6ltZW50Cj4gCj4gQ2hhbmdlcyBpbiB2NDoK
PiAgLSBBZGQgUm9iIEhlcnJpbmcgcmV2aWV3ZWQtYnkgdGFnCj4gIC0gUmVzZW50IHdpdGggY29y
cmVjdCBNYWludGFpbmVycwo+IAo+IENoYW5nZXMgaW4gdjMgKFRoYW5rcyB0byBNYXhpbWUgUmlw
YXJkKToKPiAgLSBSZWF1dGhvciBJY2Vub3d5IGZvciBoZXIgcGF0Y2gKPiAKPiBDaGFuZ2VzIGlu
IHYyIChUaGFua3MgdG8gTWF4aW1lIFJpcGFyZCk6Cj4gIC0gRHJvcCBHUFUgT1BQIFRhYmxlCj4g
IC0gQWRkIGNsb2NrcyBhbmQgY2xvY2stbmFtZXMgaW4gcmVxdWlyZWQKPiAKPiBDbMOpbWVudCBQ
w6lyb24gKDYpOgo+ICAgZHQtYmluZGluZ3M6IGdwdTogbWFsaS1taWRnYXJkOiBBZGQgSDYgbWFs
aSBncHUgY29tcGF0aWJsZQo+ICAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBBZGQgQVJNIE1hbGkg
R1BVIG5vZGUgZm9yIEg2Cj4gICBhcm02NDogZHRzOiBhbGx3aW5uZXI6IEFkZCBtYWxpIEdQVSBz
dXBwbHkgZm9yIFBpbmUgSDY0Cj4gICBhcm02NDogZHRzOiBhbGx3aW5uZXI6IEFkZCBtYWxpIEdQ
VSBzdXBwbHkgZm9yIEJlZWxpbmsgR1MxCj4gICBhcm02NDogZHRzOiBhbGx3aW5uZXI6IEFkZCBt
YWxpIEdQVSBzdXBwbHkgZm9yIE9yYW5nZVBpIEJvYXJkcwo+ICAgYXJtNjQ6IGR0czogYWxsd2lu
bmVyOiBBZGQgbWFsaSBHUFUgc3VwcGx5IGZvciBPcmFuZ2VQaSAzCj4gCj4gSWNlbm93eSBaaGVu
ZyAoMSk6Cj4gICBkdC1iaW5kaW5nczogZ3B1OiBhZGQgYnVzIGNsb2NrIGZvciBNYWxpIE1pZGdh
cmQgR1BVcwo+IAo+IE5laWwgQXJtc3Ryb25nICgxKToKPiAgIGR0LWJpbmRpbmdzOiBncHU6IG1h
bGktbWlkZ2FyZDogQWRkIHJlc2V0cyBwcm9wZXJ0eQo+IAo+ICAuLi4vYmluZGluZ3MvZ3B1L2Fy
bSxtYWxpLW1pZGdhcmQudHh0ICAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrCj4gIC4u
Li9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1iZWVsaW5rLWdzMS5kdHMgICB8ICA1ICsrKysKPiAg
Li4uL2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LW9yYW5nZXBpLTMuZHRzICAgIHwgIDUgKysrKwo+
ICAuLi4vZHRzL2FsbHdpbm5lci9zdW41MGktaDYtb3JhbmdlcGkuZHRzaSAgICAgfCAgNSArKysr
Cj4gIC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LXBpbmUtaDY0LmR0cyB8ICA1ICsr
KysKPiAgYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kgIHwgMTQg
KysrKysrKysrKwo+ICA2IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykKPiAKPiAtLSAK
PiAyLjE3LjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
