Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9EA2C1F90
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2A76E28A;
	Tue, 24 Nov 2020 08:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B9B89BE8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 12:14:01 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a9so23426311lfh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 04:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DjiKfHQ2jA3vM7VGaFaknOPs7Hmg3cHuudIyVF1TtFs=;
 b=CMfi6MciH6bpfSGoN1TGnqSBqrbvk/WZCOthEzuu9kuAVb40YeAebEnZp99bo2UFmd
 WXhO1JkJr6Ntj7U6OlHe0/8Ra8ZfP3TULXSL2Nhg53rfU58FNNnQH9q5ZVxbl6n3mzVl
 YrwKpxuF+/QVYrG/s2ZyNaM7PK6sVLn6o7uFmy+LriMggqgsEUpfq3u6QTa2JtXNZfbI
 w7Y25cmZaCGAV0Ea1Ok2CrOd0mZOIychroyvv0aluwM1tQpSGFYto3uAtlV5GmE28b/G
 q6L8xgGglgvoBt3wYGu7DtpdxIO1tycjMwR7H8f5OK/FQAZ25F/MMzYffMBMDem0Ccc3
 ud/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DjiKfHQ2jA3vM7VGaFaknOPs7Hmg3cHuudIyVF1TtFs=;
 b=EtaBJOrTJnxpo9DLh3rs1Y9E9Gv0xZi+43m3f1lbdTkmRa90fXJI7AmOwgp4XuAQeZ
 vUMx1dk+0IFTJqFMZlcbbIC+Mf3z24MYdzDyii5FFfv3eARd5tEVqeZRPLZV7fMGBDLA
 QEc2SX+tx/X2XNoJjGOiyQmZESc5y9FNm/G4xmqNANkYOc0nPO2vlO1rIC55Cx5Rp7jm
 wvH+58u/oMpCGIA7Lc6aGULhTYPBMX54/iqBloajhFhP5WQ8CIwOw7WIFA+1qr/VgHhd
 3cybgV9jmb8aOs05UxdAylXBIEbQTL8+pc28D141gp9jpWq2HaV7h2UKgO2wKmKyucJE
 IUsQ==
X-Gm-Message-State: AOAM5330P9lbWOp0ZPHuJBGsFb9B6bfd3MAJYQ6jzMsESYMPWoZCz6Vc
 gQvvEJQJ64FPZhcscKmbJ6TlrQPRIYg=
X-Google-Smtp-Source: ABdhPJz3EId7FG3SbCnHwZXerIiqFBWY6qT1WhZ9hmI2Ye3Y0OmzOJDJsnE3s7GTG/1UUT7pazvjjQ==
X-Received: by 2002:ac2:5503:: with SMTP id j3mr14199009lfk.94.1606133639740; 
 Mon, 23 Nov 2020 04:13:59 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id w15sm1366488lfn.297.2020.11.23.04.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 04:13:59 -0800 (PST)
Subject: Re: [PATCH v10 00/19] Introduce memory interconnect for NVIDIA Tegra
 SoCs
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201123002723.28463-1-digetx@gmail.com>
 <20201123061734.mpmkdxzullrh52o7@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1bfbeb36-29b3-30c2-899f-faa5b0682bd7@gmail.com>
Date: Mon, 23 Nov 2020 15:13:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201123061734.mpmkdxzullrh52o7@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMTEuMjAyMCAwOToxNywgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMjMtMTEtMjAs
IDAzOjI3LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFRoaXMgc2VyaWVzIGJyaW5ncyBpbml0
aWFsIHN1cHBvcnQgZm9yIG1lbW9yeSBpbnRlcmNvbm5lY3QgdG8gVGVncmEyMCwKPj4gVGVncmEz
MCBhbmQgVGVncmExMjQgU29Dcy4KPj4KPj4gRm9yIHRoZSBzdGFydGVyIG9ubHkgZGlzcGxheSBj
b250cm9sbGVycyBhbmQgZGV2ZnJlcSBkZXZpY2VzIGFyZSBnZXR0aW5nCj4+IGludGVyY29ubmVj
dCBBUEkgc3VwcG9ydCwgb3RoZXJzIGNvdWxkIGJlIHN1cHBvcnRlZCBsYXRlciBvbi4gVGhlIGRp
c3BsYXkKPj4gY29udHJvbGxlcnMgaGF2ZSB0aGUgYmlnZ2VzdCBkZW1hbmQgZm9yIGludGVyY29u
bmVjdCBBUEkgcmlnaHQgbm93IGJlY2F1c2UKPj4gZHluYW1pYyBtZW1vcnkgZnJlcXVlbmN5IHNj
YWxpbmcgY2FuJ3QgYmUgZG9uZSBzYWZlbHkgd2l0aG91dCB0YWtpbmcgaW50bwo+PiBhY2NvdW50
IGJhbmR3aWR0aCByZXF1aXJlbWVudCBmcm9tIHRoZSBkaXNwbGF5cy4gSW4gcGFydGljdWxhciB0
aGlzIHNlcmllcwo+PiBmaXhlcyBkaXN0b3J0ZWQgZGlzcGxheSBvdXRwdXQgb24gVDMwIE91eWEg
YW5kIFQxMjQgVEsxIGRldmljZXMuCj4+Cj4+IENoYW5nZWxvZzoKPj4KPj4gdjEwIC0gSW4gYSBs
b25nZXIgcnVuIGl0IHdpbGwgYmUgbXVjaCBuaWNlciBpZiB3ZSBjb3VsZCBzdXBwb3J0IEVNQwo+
PiAgICAgICBoYXJkd2FyZSB2ZXJzaW9uaW5nIG9uIFRlZ3JhMjAgYW5kIGl0J3Mgbm90IGxhdGUg
dG8gc3VwcG9ydCBpdCBub3cuCj4+ICAgICAgIEhlbmNlIEkgYWRkZWQgdGhlc2UgbmV3IHBhdGNo
ZXM6Cj4+Cj4+ICAgICAgICAgZHQtYmluZGluZ3M6IG1lbW9yeTogdGVncmEyMDogZW1jOiBEb2N1
bWVudCBvcHAtc3VwcG9ydGVkLWh3IHByb3BlcnR5Cj4+ICAgICAgICAgbWVtb3J5OiB0ZWdyYTIw
OiBTdXBwb3J0IGhhcmR3YXJlIHZlcnNpb25pbmcgYW5kIGNsZWFuIHVwIE9QUCB0YWJsZSBpbml0
aWFsaXphdGlvbgo+Pgo+PiAgICAgLSBSZW1vdmVkIGVycm9yIG1lc3NhZ2UgZnJvbSB0ZWdyYTMw
LWRldmZyZXEgZHJpdmVyIGFib3V0IG1pc3NpbmcgT1BQCj4+ICAgICAgIHByb3BlcnRpZXMgaW4g
YSBkZXZpY2UtdHJlZSBiZWNhdXNlIEVNQyBkcml2ZXIgYWxyZWFkeSBwcmludHMgdGhhdAo+PiAg
ICAgICBtZXNzYWdlIGFuZCBpdCB1c2VzIE9QUCBBUEkgZXJyb3IgY29kZSBpbnN0ZWFkIG9mIGNo
ZWNraW5nIERUIGRpcmVjdGx5LAo+PiAgICAgICB3aGljaCBpcyBhIG1vcmUgY29ycmVjdCB3YXkg
b2YgZG9pbmcgdGhhdC4KPiAKPiBMb29rcyBnb29kIHRvIG1lIChmcm9tIE9QUCBBUElzIHVzYWdl
IHBlcnNwZWN0aXZlKS4gVGhhbmtzIGZvcgo+IGNvbnRpbnVpbmcgd2l0aCB0aGlzIGFuZCBmaXhp
bmcgYWxsIHRoZSBpc3N1ZXMgRG1pdHJ5Lgo+IAoKSGVsbG8gVmlyZXNoLAoKVGhhbmsgeW91IGZv
ciBhbGwgdGhlIGNsYXJpZmljYXRpb25zIGFuZCBmb3IgcmV2aWV3aW5nIG9mIHRoZSBwYXRjaGVz
IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
