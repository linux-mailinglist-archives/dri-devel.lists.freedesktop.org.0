Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917742E1B27
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907CC6E919;
	Wed, 23 Dec 2020 10:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2A66E175
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 19:16:48 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id s26so34456725lfc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 11:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8LCUpi0Bv6VHRO4Owbo1wWhzpbnTDyEyoeExPvlxMpw=;
 b=vFetG7ZFiwo/yl2NVh6oxZB18mV9BShqVa3lTahkF2pbDbu5TcdQOVLTO9/MLdYMgq
 ooq3rs8c9z/DAR+8w42Ilbyxx83xu3+IFmczYSfH6ENb9n1NSjmJWRJkERDT1Mn7Nh08
 viagp2OH5JNp9vScykSOW3b1eELwwOeCGJKHk9bSrw3vI9f1Oe0sV7kdYwZ/GEYDeU/1
 sjMuyUiPHcViXdEjn92uDcql0QBnLolR1Q5Z+wcG75qtWKugSe4EDgBeaAWR7gBHBV1I
 24OG3co9a+ITHYeJZuGofzuBloji4Hh9BlFFjnWrNFKEJrcHVtx2QGEbFA50Clag2TUP
 ySFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8LCUpi0Bv6VHRO4Owbo1wWhzpbnTDyEyoeExPvlxMpw=;
 b=D0cV+hsJl/ZEoIiEUj/C++OhMPab3/b1TfYQTftpvt+dSyQ+fj0olqQ7Y4K0soHmcE
 dFdxv2WfdOIeY15nS+M03EHwAUEwdA3Bv/pQPk+j1Df5+tuarhRbUgg5ackX05xmXYR6
 3g0sV/ItBJvCo3O4Svq2k5XVkv9tignbHxlLn6ZKNvayjFpR6S0AHQEKGIsqeW8IiprC
 dULoTl59yLhLbJaF1P5ag9ch8JPZZWasS3lum7dF9ua/eIoQkhXeU48wHXpbZ5DOgYEv
 lB4z5JI+GGkgPnZo1a+XMclFe2b7So7UU6oUfXUE/5L2U58J2h/Sw4Bko6MuGyL0AmBX
 1phQ==
X-Gm-Message-State: AOAM531ptYsN81fMEhWMZgIXcIVqqTInJVpTHTE49IIrzM2gpm55UpjL
 EMEefg7kvqZjiOVAuvbAnwY=
X-Google-Smtp-Source: ABdhPJzESFVQASn+ZGQhw50PNtNWOiEZe3+iV8slMZ9kttc1xtTyrnY0QBd85AxyTY+oYzyLIPm/3Q==
X-Received: by 2002:ac2:44ba:: with SMTP id c26mr9218189lfm.132.1608664607240; 
 Tue, 22 Dec 2020 11:16:47 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id s25sm2944290ljo.106.2020.12.22.11.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 11:16:46 -0800 (PST)
Subject: Re: [PATCH v2 02/48] dt-bindings: memory: tegra30: emc: Replace core
 regulator with power domain
To: Rob Herring <robh@kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-3-digetx@gmail.com>
 <20201221225405.GA723611@robh.at.kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <048f9453-c57a-0e42-2684-327781435085@gmail.com>
Date: Tue, 22 Dec 2020 22:16:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201221225405.GA723611@robh.at.kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjIuMTIuMjAyMCAwMTo1NCwgUm9iIEhlcnJpbmcg0L/QuNGI0LXRgjoKPiBPbiBUaHUsIERlYyAx
NywgMjAyMCBhdCAwOTowNTo1MlBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFBv
d2VyIGRvbWFpbiBmaXRzIG11Y2ggYmV0dGVyIHRoYW4gYSB2b2x0YWdlIHJlZ3VsYXRvciBpbiBy
ZWdhcmRzIHRvCj4+IGEgcHJvcGVyIGhhcmR3YXJlIGRlc2NyaXB0aW9uIGFuZCBmcm9tIGEgc29m
dHdhcmUgcGVyc3BlY3RpdmUgYXMgd2VsbC4KPj4gSGVuY2UgcmVwbGFjZSB0aGUgY29yZSByZWd1
bGF0b3Igd2l0aCB0aGUgcG93ZXIgZG9tYWluLiBOb3RlIHRoYXQgdGhpcwo+PiBkb2Vzbid0IGFm
ZmVjdCBhbnkgZXhpc3RpbmcgRFRCcyBiZWNhdXNlIHdlIGhhdmVuJ3Qgc3RhcnRlZCB0byB1c2Ug
dGhlCj4+IHJlZ3VsYXRvciB5ZXQsIGFuZCB0aHVzLCBpdCdzIG9rYXkgdG8gY2hhbmdlIGl0Lgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+
IC0tLQo+PiAgLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEzMC1l
bWMueWFtbCAgICAgfCA2ICsrKy0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMzAtZW1jLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252
aWRpYSx0ZWdyYTMwLWVtYy55YW1sCj4+IGluZGV4IDBhMmUyYzBkMGZkZC4uN2I0YWY5MTY5YjBi
IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5
LWNvbnRyb2xsZXJzL252aWRpYSx0ZWdyYTMwLWVtYy55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMzAt
ZW1jLnlhbWwKPj4gQEAgLTM5LDkgKzM5LDkgQEAgcHJvcGVydGllczoKPj4gICAgICBkZXNjcmlw
dGlvbjoKPj4gICAgICAgIFBoYW5kbGUgb2YgdGhlIE1lbW9yeSBDb250cm9sbGVyIG5vZGUuCj4+
ICAKPj4gLSAgY29yZS1zdXBwbHk6Cj4+ICsgIHBvd2VyLWRvbWFpbnM6Cj4+ICAgICAgZGVzY3Jp
cHRpb246Cj4+IC0gICAgICBQaGFuZGxlIG9mIHZvbHRhZ2UgcmVndWxhdG9yIG9mIHRoZSBTb0Mg
ImNvcmUiIHBvd2VyIGRvbWFpbi4KPj4gKyAgICAgIFBoYW5kbGUgdG8gdGhlIFNvQyAiY29yZSIg
cG93ZXIgZG9tYWluLgo+IAo+IHBvd2VyLWRvbWFpbnMgbmVlZHMgdG8gZGVmaW5lIGhvdyBtYW55
IChtYXhJdGVtcykuCgpPa2F5LCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
