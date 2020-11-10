Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEC92AE43E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF08B89D46;
	Tue, 10 Nov 2020 23:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC9989D46;
 Tue, 10 Nov 2020 23:42:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l1so344549wrb.9;
 Tue, 10 Nov 2020 15:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rx4+AnDnGG2uOUuYvCD2kX/y5IPcI9grqVLoFPnDhZs=;
 b=aUc15+h6S0MbpN1QvMk3vVOBRorNBNoGdQU0AckwRRIZRe2lGbFnRVBWKIhb3LxBps
 2m1ewRtGhI0hPHPvt9FCXpAAAn78wP7EBmgdQlxfswzLZvUADu3q8SUrFa4BqrW3TC5T
 7PhMhwp+p84rcQpVHILNwqnVRkkJEpzzuCxuQl1HR71NzVa2CYGpSemDlzoZjj3bNoU9
 4qhaXE6c4+s9Sl/lrDsKS4gBZO2E7EKYhlRHGSQkIp/9nbLLYInRcO64Z48cHexhAHBo
 zKecVlHHXC6M1eXy1Ww9Ncz8Vs520PqtihkJsa8S8ePk//5IwTeTxBT/nEpKyN1RtRx5
 9iHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rx4+AnDnGG2uOUuYvCD2kX/y5IPcI9grqVLoFPnDhZs=;
 b=Smha48HoEdGE1MwS7MmdnkQCW0wcKtRPRxDwvLPJCpT2e0G1aTDz1YNFmPnjR3BSEU
 NUzzMnyY03l5BEHtHwlefhYqPTxMIJyFMN2o4cOUeJ23dxLIA16NAGPhYeUNLUbhCvyr
 JKyVFoRdv7V5qA4oZay8In1ZAh2eUP1FEZv3JlooQQcILSv5z2r/0jCSZHi2Wch1PR5F
 pr73s2VokEU/ZNOE+peVAzxtNdN48QIY1lhz1Q1URuM8h0bzWH0q8Cuil5kM3Ru1eXEF
 WUOPL6ZzU00w6ZxzrztpeP/uQNdro5x/7leakXLgdXP4dcTayPVbme12T+npDjXKj4oz
 wnIA==
X-Gm-Message-State: AOAM530NSZOqFBbWf9B2vdEe9oPadEno//sALg8tnItyOnxhEJOuz/Di
 d0koZIvxaS/PrSmiTJm8rvitC4blNPM0IjEeWts=
X-Google-Smtp-Source: ABdhPJwjbq17rx2WoHZy+mm45mILPxwoMZE4g1kekeZ4ir+vZXwFa9KxgzHwN2TiC2o7hCUQrO5NkZGXiJFjcL2X1Sg=
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr26256999wrn.362.1605051735175; 
 Tue, 10 Nov 2020 15:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-9-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-9-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 18:42:03 -0500
Message-ID: <CADnq5_Ndta5KgCr9X9StdFD_SvATX_=kV6NynxjEbbj+XvX57Q@mail.gmail.com>
Subject: Re: [PATCH 08/30] drm/radeon/ci_dpm: Remove set but unused variable
 'dpm_event_src'
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMjozMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEFuZCB0aGUgcGllY2Ugb2YgY29kZSB0aGF0IGhhcyBuZXZlciBi
ZWVuIGV4ZWN1dGVkLgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaV9kcG0uYzogSW4gZnVuY3Rp
b24g4oCYY2lfc2V0X2RwbV9ldmVudF9zb3VyY2Vz4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL2NpX2RwbS5jOjEzNjk6Mjg6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGRwbV9ldmVudF9zcmPi
gJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+IENjOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4g
S8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBD
YzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9jaV9kcG0uYyB8IDEyIC0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaV9k
cG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lfZHBtLmMKPiBpbmRleCA4ODZlOTk1OTQ5
NmZlLi44MzI0YWNhNWZkMDA2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
Y2lfZHBtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2NpX2RwbS5jCj4gQEAgLTEz
NjYsNyArMTM2Niw2IEBAIHN0YXRpYyB2b2lkIGNpX3NldF9kcG1fZXZlbnRfc291cmNlcyhzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgdTMyIHNvdXJjZXMpCj4gIHsKPiAgICAgICAgIHN0cnVj
dCBjaV9wb3dlcl9pbmZvICpwaSA9IGNpX2dldF9waShyZGV2KTsKPiAgICAgICAgIGJvb2wgd2Fu
dF90aGVybWFsX3Byb3RlY3Rpb247Cj4gLSAgICAgICBlbnVtIHJhZGVvbl9kcG1fZXZlbnRfc3Jj
IGRwbV9ldmVudF9zcmM7Cj4gICAgICAgICB1MzIgdG1wOwo+Cj4gICAgICAgICBzd2l0Y2ggKHNv
dXJjZXMpIHsKPiBAQCAtMTM3NiwyOCArMTM3NSwxNyBAQCBzdGF0aWMgdm9pZCBjaV9zZXRfZHBt
X2V2ZW50X3NvdXJjZXMoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHUzMiBzb3VyY2VzKQo+
ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgKDEgPDwgUkFERU9OX0RQTV9B
VVRPX1RIUk9UVExFX1NSQ19USEVSTUFMKToKPiAgICAgICAgICAgICAgICAgd2FudF90aGVybWFs
X3Byb3RlY3Rpb24gPSB0cnVlOwo+IC0gICAgICAgICAgICAgICBkcG1fZXZlbnRfc3JjID0gUkFE
RU9OX0RQTV9FVkVOVF9TUkNfRElHSVRBTDsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAg
ICAgICBjYXNlICgxIDw8IFJBREVPTl9EUE1fQVVUT19USFJPVFRMRV9TUkNfRVhURVJOQUwpOgo+
ICAgICAgICAgICAgICAgICB3YW50X3RoZXJtYWxfcHJvdGVjdGlvbiA9IHRydWU7Cj4gLSAgICAg
ICAgICAgICAgIGRwbV9ldmVudF9zcmMgPSBSQURFT05fRFBNX0VWRU5UX1NSQ19FWFRFUk5BTDsK
PiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlICgoMSA8PCBSQURFT05fRFBN
X0FVVE9fVEhST1RUTEVfU1JDX0VYVEVSTkFMKSB8Cj4gICAgICAgICAgICAgICAoMSA8PCBSQURF
T05fRFBNX0FVVE9fVEhST1RUTEVfU1JDX1RIRVJNQUwpKToKPiAgICAgICAgICAgICAgICAgd2Fu
dF90aGVybWFsX3Byb3RlY3Rpb24gPSB0cnVlOwo+IC0gICAgICAgICAgICAgICBkcG1fZXZlbnRf
c3JjID0gUkFERU9OX0RQTV9FVkVOVF9TUkNfRElHSUFMX09SX0VYVEVSTkFMOwo+ICAgICAgICAg
ICAgICAgICBicmVhazsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgaWYgKHdhbnRfdGhlcm1hbF9w
cm90ZWN0aW9uKSB7Cj4gLSNpZiAwCj4gLSAgICAgICAgICAgICAgIC8qIFhYWDogbmVlZCB0byBm
aWd1cmUgb3V0IGhvdyB0byBoYW5kbGUgdGhpcyBwcm9wZXJseSAqLwo+IC0gICAgICAgICAgICAg
ICB0bXAgPSBSUkVHMzJfU01DKENHX1RIRVJNQUxfQ1RSTCk7Cj4gLSAgICAgICAgICAgICAgIHRt
cCAmPSBEUE1fRVZFTlRfU1JDX01BU0s7Cj4gLSAgICAgICAgICAgICAgIHRtcCB8PSBEUE1fRVZF
TlRfU1JDKGRwbV9ldmVudF9zcmMpOwo+IC0gICAgICAgICAgICAgICBXUkVHMzJfU01DKENHX1RI
RVJNQUxfQ1RSTCwgdG1wKTsKPiAtI2VuZGlmCj4gLQo+ICAgICAgICAgICAgICAgICB0bXAgPSBS
UkVHMzJfU01DKEdFTkVSQUxfUFdSTUdUKTsKPiAgICAgICAgICAgICAgICAgaWYgKHBpLT50aGVy
bWFsX3Byb3RlY3Rpb24pCj4gICAgICAgICAgICAgICAgICAgICAgICAgdG1wICY9IH5USEVSTUFM
X1BST1RFQ1RJT05fRElTOwo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
