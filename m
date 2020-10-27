Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E86629CEB0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672626EB8D;
	Wed, 28 Oct 2020 08:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E6F6EC1A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:17:22 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i2so3076328ljg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/C50whZF34pC0udz/P6Ih/pyTCfScHf2ZVRt2NGzvgk=;
 b=Vl3rx+HQClDbLHSYq1a93jwJSQ2tiugR0jBtDlQ8dbID3MyxGvYQMOlXV/+sgmAS2Q
 FelZK1keaJqrIf5PuLjWm3iXvzxeNDzfKb9Yewhfr6Ye5QoJgkiu/GAlBdJZ/+39nvwb
 rv7XlBpzd6S4bnSGOLV93yWM53y0bqiaSj112Ov3FqlhQns/VJ8LCFS8UXO6a9QHpBR2
 LbEzV3nOidQUqqleCL45aDvf203vDVrZX7bJVcO0qcDBafpXfxYDv2MZEPsb47QRPdoI
 UgRe0/5aIsAxFt3iEWw0Xy1NvFysOro6p5VUAwwdjSUI2eu2bT1QAJV4h5ywPrtMVbrD
 4sAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/C50whZF34pC0udz/P6Ih/pyTCfScHf2ZVRt2NGzvgk=;
 b=uMzY7Hlhl1WP9I8EjArwVWGgb2jNhR6D7kWueosllPIoNFA6MFiPddglc/SIycAomO
 6+Bg0XVgibdIj7nz52deeZS7iZvsohiolV92XeyiWdE7+vxrqYvjAKK4WvW/hBAv1lDt
 VbVc/seTeuSkw7/03UOLKUL+vNv4580Qx3BSfIk6Yp9Chg7a9WIOxuvwrqase33WQZrs
 BhsERn3PIf52yK9VRgoP/VNeT5QkuXBxjtuypWJBBtZmAHPYvm7FNvuIQXcT84TYZtgL
 98XO7vPPteXYt4g+fAH2NPLL5DdfvkgvG7JNMBsgvnCtj+jqnaj/rWS68XdC0vaCzinf
 nshg==
X-Gm-Message-State: AOAM533f3MBC/384+A9WPwd9BGqI1PLkMcDlFUAMHYLQx3dRSjaYMAO4
 yBeZsgkpRafYoYELGVd2AZs=
X-Google-Smtp-Source: ABdhPJyJBOp+M2iGeg3Qte4VQ0b2gkUYbeG6b6mkEm81uMaOlTUWkyEjhgm8Hig7JbwI/bRQKxKwWg==
X-Received: by 2002:a2e:3c0b:: with SMTP id j11mr1573379lja.254.1603826241002; 
 Tue, 27 Oct 2020 12:17:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id 5sm96298lju.25.2020.10.27.12.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 12:17:20 -0700 (PDT)
Subject: Re: [PATCH v6 04/52] dt-bindings: memory: tegra20: emc: Document
 nvidia,memory-controller property
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-5-digetx@gmail.com> <20201027085417.GD4244@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <54191034-dcb9-7cab-333b-5bb2553f0ed1@gmail.com>
Date: Tue, 27 Oct 2020 22:17:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027085417.GD4244@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAxMTo1NCwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIE1v
biwgT2N0IDI2LCAyMDIwIGF0IDAxOjE2OjQ3QU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gVGVncmEyMCBFeHRlcm5hbCBNZW1vcnkgQ29udHJvbGxlciB0YWxrcyB0byBEUkFNIGNo
aXBzIGFuZCBpdCBuZWVkcyB0byBiZQo+PiByZXByb2dyYW1tZWQgd2hlbiBtZW1vcnkgZnJlcXVl
bmN5IGNoYW5nZXMuIFRlZ3JhIE1lbW9yeSBDb250cm9sbGVyIHNpdHMKPj4gYmVoaW5kIEVNQyBh
bmQgdGhlc2UgY29udHJvbGxlcnMgYXJlIHRpZ2h0bHkgY291cGxlZC4gVGhpcyBwYXRjaCBhZGRz
IHRoZQo+PiBuZXcgcGhhbmRsZSBwcm9wZXJ0eSB3aGljaCBhbGxvd3MgdG8gcHJvcGVybHkgZXhw
cmVzcyBjb25uZWN0aW9uIG9mIEVNQwo+PiBhbmQgTUMgaGFyZHdhcmUgaW4gYSBkZXZpY2UtdHJl
ZSwgaXQgYWxzbyBwdXQgdGhlIFRlZ3JhMjAgRU1DIGJpbmRpbmcgb24KPj4gcGFyIHdpdGggVGVn
cmEzMCsgRU1DIGJpbmRpbmdzLCB3aGljaCBpcyBoYW5keSB0byBoYXZlLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgLi4u
L2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEyMC1lbWMudHh0ICAgICAg
ICAgIHwgMiArKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9s
bGVycy9udmlkaWEsdGVncmEyMC1lbWMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEyMC1lbWMudHh0Cj4+IGluZGV4
IDU2N2NmZmQzN2YzZi4uMWIwZDQ0MTdhYWQ4IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252aWRpYSx0ZWdyYTIwLWVt
Yy50eHQKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1j
b250cm9sbGVycy9udmlkaWEsdGVncmEyMC1lbWMudHh0Cj4+IEBAIC0xMiw2ICsxMiw3IEBAIFBy
b3BlcnRpZXM6Cj4+ICAgIGlycmVzcGVjdGl2ZSBvZiByYW0tY29kZSBjb25maWd1cmF0aW9uLgo+
PiAgLSBpbnRlcnJ1cHRzIDogU2hvdWxkIGNvbnRhaW4gRU1DIEdlbmVyYWwgaW50ZXJydXB0Lgo+
PiAgLSBjbG9ja3MgOiBTaG91bGQgY29udGFpbiBFTUMgY2xvY2suCj4+ICstIG52aWRpYSxtZW1v
cnktY29udHJvbGxlciA6IFBoYW5kbGUgb2YgdGhlIE1lbW9yeSBDb250cm9sbGVyIG5vZGUuCj4g
Cj4gSXQgbG9va3MgbGlrZSB5b3UgYWRkaW5nIGEgcmVxdWlyZWQgcHJvcGVydHkgd2hpY2ggaXMg
YW4gQUJJIGJyZWFrLgpUaGUgVDIwIEVNQyBkcml2ZXIgaXMgdW51c2VkIHNvIGZhciBpbiB1cHN0
cmVhbSBhbmQgaXQgd2lsbCBiZWNvbWUgdXNlZApvbmx5IG9uY2UgdGhpcyBzZXJpZXMgaXMgYXBw
bGllZC4gSGVuY2UgaXQncyBmaW5lIHRvIGNoYW5nZSB0aGUgQUJJLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
