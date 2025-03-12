Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3056A5D4DC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 04:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A9910E03B;
	Wed, 12 Mar 2025 03:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="mDV81nO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4EB3310E5FA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 03:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=6XI4Slkoy1M0rqTSf35Ow6UKaNFOV3PAv3wPbD3wF3U=; b=m
 DV81nO3lQxMZpSA7zSkrPxZKLLfUMWvYOg+NmgJvjntqocjING6kNNYuuzdTFtqK
 MHg+KcKLSFQ3xHOfl0cYmGk4UzOo1T19veUDwMMniYKJpPPuOus2Pw13PxWg8cL0
 /G8jX7obo9v3pbOauvhrg3qccm/v12orF3K/EehGIo=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-123 (Coremail) ; Wed, 12 Mar 2025 11:51:58 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 12 Mar 2025 11:51:58 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Piotr Oniszczuk" <piotr.oniszczuk@gmail.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, devicetree@vger.kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org,
 "Andy Yan" <andy.yan@rock-chips.com>, krzk+dt@kernel.org,
 robh@kernel.org, linux-arm-kernel@lists.infradead.org,
 lumag@kernel.org, stephen@radxa.com
Subject: Re:Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <AD2A56F9-B4FB-406B-BE7C-49BB5DFD3BAD@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
 <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
 <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
 <1573D5D6-AFED-4D92-8112-B0C6BB52D5FF@gmail.com>
 <46c0d239.a4f5.1956b619b97.Coremail.andyshrk@163.com>
 <252BB2E2-4BC5-4402-953D-F7B30EA5DE14@gmail.com>
 <326B91E9-FB91-43C3-B98B-3EF079F313C6@gmail.com>
 <545cc438.7e3.1956e13a3e2.Coremail.andyshrk@163.com>
 <AD2A56F9-B4FB-406B-BE7C-49BB5DFD3BAD@gmail.com>
X-NTES-SC: AL_Qu2fA/uevk0q7iOYZOlSyjNW+7xfHKv6+qRChMQvQtsqqTHr9T0KcVtuP1XR3/9iWlV8euuspyqU8XtlMgI5
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4003289a.41da.195887b0462.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eygvCgCXPn_eBNFnxoN8AA--.19966W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAcOXmfQ-RqhAQAEsz
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIFBpb3RyLArlnKggMjAyNS0wMy0xMCAwNDo1Mzo1MO+8jCJQaW90ciBPbmlzemN6dWsiIDxw
aW90ci5vbmlzemN6dWtAZ21haWwuY29tPiDlhpnpgZPvvJoKPgo+Cj4+IFdpYWRvbW/Fm8SHIG5h
cGlzYW5hIHByemV6IEFuZHkgWWFuIDxhbmR5c2hya0AxNjMuY29tPiB3IGRuaXUgNyBtYXIgMjAy
NSwgbyBnb2R6LiAwMTo0ODoKPj4gCj4+IAo+PiBIaSBQaW90ciwKPj4g5ZyoIDIwMjUtMDMtMDYg
MjI6Mjg6MDjvvIwiUGlvdHIgT25pc3pjenVrIiA8cGlvdHIub25pc3pjenVrQGdtYWlsLmNvbT4g
5YaZ6YGT77yaCj4+PiAKPj4+IAo+PiAKPj4gQWxsIGR1bXAgaW5mb3JtYXRpb24gY3VycmVudGx5
IGFwcGVhcnMgdG8gYmUgY29ycmVjdCwgc28gSSdtIHRlbXBvcmFyaWx5IHVuc3VyZSB3aHkKPj4g
dGhlcmUgaXMgbm8gZGlzcGxheSBvbiB0aGUgbW9uaXRvci4KPj4gTWF5YmUgdHJ5IHNvbWUgcGx1
ZyBhbmQgdW5wbHVnIGZvciB0aGUgRFAgY2FibGUsIG9yIHRyeSBhbm90aGVyIGNhYmxlIG9yIG1v
bml0b3I/Cj4+IAo+PiBJdCBzZWVtcyB0aGF0IHRoaXMgYm9hcmQgdXNlcyBhIERQIHRvIEhETUkg
Y29udmVydGVyPyBEb2VzIHRoaXMgdHJhbnNtaXR0ZXIgbmVlZCBhIGRyaXZlcj8KPj4gCj4+IEkg
d29uJ3QgYmUgYXQgbXkgY29tcHV0ZXIgb3ZlciB0aGUgbmV4dCB0d28gb3IgdGhyZWUgZGF5cywg
c28gYW55IGZ1cnRoZXIgcmVwbGllcyB0byB5b3VyIGVtYWlsCj4+IG1pZ2h0IGhhdmUgdG8gd2Fp
dCB1bnRpbCBuZXh0IHdlZWsuCj4+IAo+PiAKPgo+QW5keSwKPkZZSToKPgo+SSBkb25lIHRlc3Qg
b24gbWluZSByb2NrNWEgd2l0aCBhcHBsaWVkIE5hb2tpIGRwMCBlbmFibGVtZW50IGluIGR0cyAo
YW5kIG9ubHkgaW4gZHRzKS4KPk5vIGFueSBjaGFuZ2VzIGluIGR3IGRwIGRyaXZlciAoc28gaeKA
mW0gb24gdmFuaWxsYSAgaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LXJvY2tjaGlwL2NvdmVyLzIwMjUwMjIzMTEzMDM2Ljc0MjUyLTEtYW5keXNocmtAMTYzLmNvbS8g
ICApCj4KPm9uIG1pbmUgcm9jazVhIHJhNjIwIGhkbWkgcG9ydCB3b3JrcyBvay4KPihJIGNvbnRh
Y3RlZCBhbHNvIFJhZHhhIGFib3V0IHJhNjIwIGFuZCB0aGV5IGNvbmZpcm1lZDogcmE2MjAgaXMg
anVzdCBEUC0+SERNSSBjb252ZXJ0ZXIuIE5vIGFueSBkcml2ZXIgbm9yIHNwZWNpYWwgcHJvZ3Jh
bW1pbmcvZW5hYmxlbWVudCBpcyBuZWVkZWQpCj4KPlRoaXMgdGVsbHMgbWUgdGhhdCBkcDAgKHJv
Y2s1YSkgd29ya3Mgb2sgd2hpbGUgZHAxIChyb2NrNWl0eCkgbm90LgoKCj5pIHN1c3BlY3QgaXNz
dWUgaXMgcHJvYmFibHkgaW4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xp
bnV4LXJvY2tjaGlwL2NvdmVyLzIwMjUwMjIzMTEzMDM2Ljc0MjUyLTEtYW5keXNocmtAMTYzLmNv
bS8gYW5kIGlzIHJlbGF0ZWQgdG8gZHAxIGhhbmRsaW5nPwoKV2l0aCBoZWxwIGZyb20gU3RlcGhl
biwgd2UgZG8gc29tZSBvbmxpbmUgZGVidWcsIHRoZSBEUDEgZGlzcGxheSBpcyAgb2sgb24gaGlz
IHJvY2s1aXR4IGJvYXJkIG5vd+OAggoKClRyeSB0aGUgcGF0Y2ggYXMgYmVsbG93OgoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYwppbmRleCA3NWEwM2U2YTg3NWMuLmQ5NDM0
MzEwYTE0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1k
cC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYwpAQCAtMzI5
LDcgKzMyOSw3IEBAIHN0cnVjdCBkd19kcCB7CiAKICAgICAgICBzdHJ1Y3QgZHdfZHBfbGluayBs
aW5rOwogICAgICAgIHN0cnVjdCBkd19kcF92aWRlbyB2aWRlbzsKLSAgICAgICBjb25zdCBzdHJ1
Y3QgZHdfZHBfcGxhdF9kYXRhICpwbGF0X2RhdGE7CisgICAgICAgc3RydWN0IGR3X2RwX3BsYXRf
ZGF0YSBwbGF0X2RhdGE7CgoKQEAgLTE5OTgsNyArMjAxMiw3IEBAIHN0cnVjdCBkd19kcCAqZHdf
ZHBfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwK
ICAgICAgICBkcC0+ZGV2ID0gZGV2OwogICAgICAgIGRwLT52aWRlby5waXhlbF9tb2RlID0gRFdf
RFBfTVBfUVVBRF9QSVhFTDsKIAotICAgICAgIGRwLT5wbGF0X2RhdGEgPSBwbGF0X2RhdGE7Cisg
ICAgICAgZHAtPnBsYXRfZGF0YS5tYXhfbGlua19yYXRlID0gcGxhdF9kYXRhLT5tYXhfbGlua19y
YXRlOwogICAgICAgIGJyaWRnZSA9ICZkcC0+YnJpZGdlOwogICAgICAgIG11dGV4X2luaXQoJmRw
LT5pcnFfbG9jayk7CiAgICAgICAgSU5JVF9XT1JLKCZkcC0+aHBkX3dvcmssIGR3X2RwX2hwZF93
b3JrKTsKIAoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBf
ZHJtX3ZvcDIuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5j
CmluZGV4IDE3YTk4ODQ1ZmQzMS4uMmNmNzlhMTQwOWFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwpAQCAtMjA4OSw5ICsyMDg5LDkgQEAgc3RhdGlj
IHVuc2lnbmVkIGxvbmcgcmszNTg4X3NldF9pbnRmX211eChzdHJ1Y3Qgdm9wMl92aWRlb19wb3J0
ICp2cCwgaW50IGlkLCB1MzIKICAgICAgICAgICAgICAgIGRpcCB8PSBGSUVMRF9QUkVQKFJLMzU4
OF9EU1BfSUZfUE9MX19EUDBfUElOX1BPTCwgcG9sZmxhZ3MpOwogICAgICAgICAgICAgICAgYnJl
YWs7CiAgICAgICAgY2FzZSBST0NLQ0hJUF9WT1AyX0VQX0RQMToKLSAgICAgICAgICAgICAgIGRp
ZSAmPSB+UkszNTg4X1NZU19EU1BfSU5GQUNFX0VOX01JUEkxX01VWDsKLSAgICAgICAgICAgICAg
IGRpZSB8PSBSSzM1ODhfU1lTX0RTUF9JTkZBQ0VfRU5fTUlQSTEgfAotICAgICAgICAgICAgICAg
ICAgICAgICAgICBGSUVMRF9QUkVQKFJLMzU4OF9TWVNfRFNQX0lORkFDRV9FTl9NSVBJMV9NVVgs
IHZwLT5pZCk7CisgICAgICAgICAgICAgICBkaWUgJj0gflJLMzU4OF9TWVNfRFNQX0lORkFDRV9F
Tl9EUDFfTVVYOworICAgICAgICAgICAgICAgZGllIHw9IFJLMzU4OF9TWVNfRFNQX0lORkFDRV9F
Tl9EUDEgfAorICAgICAgICAgICAgICAgICAgICAgICAgICBGSUVMRF9QUkVQKFJLMzU4OF9TWVNf
RFNQX0lORkFDRV9FTl9EUDFfTVVYLCB2cC0+aWQpOwogICAgICAgICAgICAgICAgZGlwICY9IH5S
SzM1ODhfRFNQX0lGX1BPTF9fRFAxX1BJTl9QT0w7CiAgICAgICAgICAgICAgICBkaXAgfD0gRklF
TERfUFJFUChSSzM1ODhfRFNQX0lGX1BPTF9fRFAxX1BJTl9QT0wsIHBvbGZsYWdzKTsKICAgICAg
ICAgICAgICAgIGJyZWFrOwoKCgo+Cj5CVFc6IHRoZXJlIHNlZW1zIHRvIGJlIGlzc3VlIHdpdGgg
dmlkZW8gbW9kZXMgaGFuZGxpbmcgb24gZHAwIHBvcnQ6IAo+LXBsYXlpbmcgdmlkZW8gMTkyMEAx
MDgwQDUwIC0gb2sKPi1wbGF5aW5nIHRoZW4gdmlkZW8xOTIwQDEwODBANTksNjQgaGFuZ3MgYm9h
cmTigKYuCj4KPmhkbWkwIHdvcmtzIG9rLiB2aWRlbyBtb2RlcyBpc3N1ZSBpcyBvbmx5IG9uIGRw
MApUaGUgZGNsayBmb3IgdnAyIGlzIGRlZmF1bHQgZnJvbSBHUExMLCBpdCBjYW4ndCBkaXZkZSBw
aXhlbCBjbG9jayBmb3Igc3VjaCBhIHJlZnJlc2ggcmF0ZXMsIApCdXQgaXQgc2hvdWxkIG5vdCBo
YW5nIHRoZSBib2FyZCwgU2ViYXN0aWFuLCBpdCBzZWVtcyB0aGUgZnJlcXVlbmNlIG9mICBHUExM
IGJlIGNoYW5nZWQ/CgoKUGxlc2FzZSB0cnkgaXQgbGlrZSB0aGlzOiBib25kIHRoZSBkY2xrIHNv
dXJjZSBmb3IgVlAyIGZyb20gVjBQTEwuCgorJnZvcCB7CisJYXNzaWduZWQtY2xvY2tzID0gPCZj
cnUgRENMS19WT1AyX1NSQz47CisJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmY3J1IFBMTF9W
MFBMTD47CisJc3RhdHVzID0gIm9rYXkiOworfTsKKwo+Cj4K
