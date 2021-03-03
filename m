Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC71232BF3D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 00:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CE6896ED;
	Wed,  3 Mar 2021 23:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4C9896ED
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 23:51:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF33964F41
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 23:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614815502;
 bh=4yS5iyJsfhsmr+JcD2q/iH0huGBVo0X7ndYyoZeb90s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Wcwfy2oLdCegFM+NSj5hIFVc7IO8f2MbMGQGKYiV4XONi62oteEtvl+UFt7TgUooX
 xiruDUU4P/IxGiiuoopVydls3hf2BifOFr2bt8yvypmBGYvhHvLEn6m6Ktj44nFMRj
 7ZOo6u6VD2EG9ooX02rLJ3SYXMg7kraYH/js/b7pXTTCo4o4Q8l5NPm7DhpBExYjrN
 IyFDCuHCiNN3XddxFZxvFnaBHSFfJyOjNp6dYsuCwvMxp3zL8ky0CqyQAa5uqaF/ls
 ST/IYm6MOPIVvf4xZ9X8MfzmxAy6Y0APTx5JZhlHvEuFTk+wD8xY8ix3gm1zdHZEsT
 gR9zYjPEVUKgQ==
Received: by mail-ej1-f50.google.com with SMTP id ci14so26738356ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 15:51:41 -0800 (PST)
X-Gm-Message-State: AOAM5338KiZvzU9qR9eJowINXjf+UbIgCl+5OMeF62A2aC23J0TXmfeC
 pOD2NJAIrrWdkOq2f+fAdQB1F5Z6QgDKOSA+0A==
X-Google-Smtp-Source: ABdhPJxjTF125VBav37vNTxcoNrEEtc96QdczKSVNaMWeC6x43SJnAkfM2Ubk2nF5FkmmMzIcHZNXpwWfscGCx+RprI=
X-Received: by 2002:a17:906:a106:: with SMTP id
 t6mr1209918ejy.63.1614815500452; 
 Wed, 03 Mar 2021 15:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20210223215057.125708-1-robh@kernel.org>
In-Reply-To: <20210223215057.125708-1-robh@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 4 Mar 2021 07:51:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-x2RTU9c0=ibRdiO8-o8F0GU0DNa5UDSeKsmboSJfHDw@mail.gmail.com>
Message-ID: <CAAOTY_-x2RTU9c0=ibRdiO8-o8F0GU0DNa5UDSeKsmboSJfHDw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek,
 dpi: Convert to use graph schema
To: Rob Herring <robh@kernel.org>
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
Cc: DTML <devicetree@vger.kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFJvYjoKClJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0MuaciDI0
5pelIOmAseS4iSDkuIrljYg1OjUx5a+r6YGT77yaCj4KPiBVcGRhdGUgdGhlIG1lZGlhdGVrLGRw
aSBiaW5kaW5nIHRvIHVzZSB0aGUgZ3JhcGggc2NoZW1hLiBNaXNzZWQKPiB0aGlzIG9uZSBmcm9t
IHRoZSBtYXNzIGNvbnZlcnNpb24gc2luY2UgaXQncyBub3QgcGFydCBvZiBkcm0tbWlzYy4KCkFw
cGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4Lmdp
dC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gQ2M6
IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IENjOiBQaGlsaXBwIFph
YmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IENjOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0
aGlhcy5iZ2dAZ21haWwuY29tPgo+IENjOiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+IENj
OiBKaXRhbyBzaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
IC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sICAgICAgIHwg
MTEgKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sCj4gaW5k
ZXggNmNkYjczNGM5MWE5Li5lYjg0YjUzY2FiYjEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlhbWwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkcGkueWFtbAo+IEBAIC01MCwxNSArNTAsMTAgQEAgcHJvcGVydGllczoKPiAg
ICAgICAgLSBjb25zdDogc2xlZXAKPgo+ICAgIHBvcnQ6Cj4gLSAgICB0eXBlOiBvYmplY3QKPiAr
ICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydAo+ICAgICAgZGVz
Y3JpcHRpb246Cj4gLSAgICAgIE91dHB1dCBwb3J0IG5vZGUgd2l0aCBlbmRwb2ludCBkZWZpbml0
aW9ucyBhcyBkZXNjcmliZWQgaW4KPiAtICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dyYXBoLnR4dC4gVGhpcyBwb3J0IHNob3VsZCBiZSBjb25uZWN0ZWQKPiAtICAgICAg
dG8gdGhlIGlucHV0IHBvcnQgb2YgYW4gYXR0YWNoZWQgSERNSSBvciBMVkRTIGVuY29kZXIgY2hp
cC4KPiAtCj4gLSAgICBwcm9wZXJ0aWVzOgo+IC0gICAgICBlbmRwb2ludDoKPiAtICAgICAgICB0
eXBlOiBvYmplY3QKPiArICAgICAgT3V0cHV0IHBvcnQgbm9kZS4gVGhpcyBwb3J0IHNob3VsZCBi
ZSBjb25uZWN0ZWQgdG8gdGhlIGlucHV0IHBvcnQgb2YgYW4KPiArICAgICAgYXR0YWNoZWQgSERN
SSBvciBMVkRTIGVuY29kZXIgY2hpcC4KPgo+ICByZXF1aXJlZDoKPiAgICAtIGNvbXBhdGlibGUK
PiAtLQo+IDIuMjcuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
