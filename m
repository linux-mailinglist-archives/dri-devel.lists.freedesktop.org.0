Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C614F41E9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46586F89B;
	Fri,  8 Nov 2019 08:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5CB6F754
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 17:18:30 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.68.124]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LrK0u-1hlywX3QJ2-0134F4; Thu, 07
 Nov 2019 18:18:17 +0100
To: dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Anton Vasilyev <vasilyev@ispras.ru>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/qxl: Complete exception handling in qxl_device_init()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5e5ef9c4-4d85-3c93-cf28-42cfcb5b0649@web.de>
Date: Thu, 7 Nov 2019 18:18:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:QNCvayIa51CvXcpM8g3+4HUCna6J+3crHOpWHAhYyxU83kh2Ayr
 Zkdr9I0ipFahhUdE+KCfiWX39URBtwQEruzWTmRgZYODBgHoqKY4tlggSsyMv3zGto2XRd2
 lXVgCVEFPYlFS+bNKS1OzZwzm5F9JprX4ZxIaWlCCuEmj1kF+h84EbNdCJO2m7SiUOs/UmM
 VTT78geYLAIdL51ZeZOSw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bZkdP7F1+M0=:HZUcAjZx0cU4Wb+4hA4krd
 slySVDLTygrlD71nmfDjuipjMNrJoD0UR1IGCajbLaMuc6+MUNyvyeIGGsEoXM37PU4S/lwLk
 2svi/Qo+5jq21blhI+Jxfr6r/VxPKd79VtxUze5wkwEbvPF/T4g6YpgfKGYwVVtVuRKZXc26a
 VRUsNYximoWgbzL1JUqm96jyb/J1ZH/RLfhY1hvM16NdRbAA+lanfZJnIQukHr7gzGU6PcGlW
 2SVZLkOtSAHkUTu8u5ozbmwhyiN1YOOpBDVaO+Ss03wkL5W67f6yMoDrd1hKTIf1+Shw2FI5x
 OgR+0ZRjO2dy/Fc6qt5Y+sMLV27eMOFmf9pEx3YC+bfJL/zlP3z12xRnmKYOl8/iQoWKHQZIc
 AurmktfTpe0+2v5azJMnDW2Z2xAtSRXuVY5rSCCwzzXmDnJ7YADIPrxH7RGmR1qJRm6l6CbuT
 nl/0uOMHLEbCDrUgHOsgZgAx5fgQuucsjzQ8i5y3blAfw0Y18ZRsxr0j2Iarf5QJokMH8EgP4
 v8WWASs6YrwCxMSpnRV24q8Hb9/rJ8lez6/aY0tDSeSIHrx5dhAenRo1gBQdHJiRrriD7ugPd
 7c7zVnYcGL5DO5DKAkCwABtDNJIOfOc/B+jpec5wmtp4Nag2XHv8HLSw4YJnwk/tDGbT3Yn/w
 AXqQAfC2D0/gp0eNseQs22SgQnNUB5VUhKFDLpQDygDXsgAsoG3Ih/oIhq1QCirZ7eCBgEj1m
 HGXs+eM/xxjd43RwPky+bXSV5q2ujmaXvCe/gCjgao0J2KbAjHf43Vzdgde5gDag3lIId08iE
 jmLnzCydJNM3bDhE3qy3lzs6bnzAVMZXs0ufnDKIKKhBv7DRYTZM8soUHixMDQfObH5S0zIyT
 LYe9sMi2d+nGNnsZcS9zuIvuf1iuqt2iXF7t9wzxIsqXfVxghJVQIYeYwfD6RtCr7pD0y/yJR
 YfKTuZ8MWf+z38F1b9/gfAJPgepXJFqqSz5Y8NhunSFxwliBa5tx4l90KumFr7rVgo07eliMs
 w3ujtzPA6xqFsRd3IsjJzncCQXkhY/BDdVJLcTqyJCgq/FmCw3/L7kfM0GjhUsOt/CqcXr5qc
 fuUCcLSVt5Z5xFDq9IWBb8wQ8QnX2AeVur+hsYxiC+46K6xmh6kPLrEUMlvLTjt5IbSa3kMSm
 FXmuMe59CKzrqQkSMdIRFv7S1AA5pmd9bZg/MTIW/TQvn0DLe0ZSIBciICFyauGU5+iiSPq5a
 Fa3H83tFbXpnV2CM8vz20ZXE7ISt0mOL69KGhXXknjZJ+gudcpodlKk2l56Q=
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1573147098;
 bh=ZNw2cKTTPyc9vfPJkPsoHmlH3LWpf6arKv41vLwWhO0=;
 h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
 b=HW/cS8KEW6Sib2Ks7taV4ZB82hlkkG2XGbl4vX2KMHAQcqf3sQ5mJ+QaC8MtbGoQd
 zImTGmajFWirZJfisMEcLqEtfpW0giebH9IXN0HkKRuDHi3018PJX4ugdgfYD8fcK6
 NszqlIuS+CvtByOBE7+MW3ZDXodXTsw/q5VkwrIo=
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
Cc: kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBUaHUsIDcgTm92IDIwMTkgMTg6MDU6MDggKzAxMDAKCkEgY29jY2ljaGVjayBydW4gcHJvdmlk
ZWQgaW5mb3JtYXRpb24gbGlrZSB0aGUgZm9sbG93aW5nLgoKZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfa21zLmM6Mjk1OjEtNzogRVJST1I6IG1pc3NpbmcgaW91bm1hcDsKaW9yZW1hcCBvbiBsaW5l
IDE3OCBhbmQgZXhlY3V0aW9uIHZpYSBjb25kaXRpb25hbCBvbiBsaW5lIDE4NQoKR2VuZXJhdGVk
IGJ5OiBzY3JpcHRzL2NvY2NpbmVsbGUvZnJlZS9pb3VubWFwLmNvY2NpCgpBIGp1bXAgdGFyZ2V0
IHdhcyBzcGVjaWZpZWQgaW4gYW4gaWYgYnJhbmNoLiBUaGUgY29ycmVzcG9uZGluZyBmdW5jdGlv
bgpjYWxsIGRpZCBub3QgcmVsZWFzZSB0aGUgZGVzaXJlZCBzeXN0ZW0gcmVzb3VyY2UgdGhlbi4K
VGh1cyB1c2UgdGhlIGxhYmVsIOKAnHJvbV91bm1hcOKAnSBpbnN0ZWFkIHRvIGZpeCB0aGUgZXhj
ZXB0aW9uIGhhbmRsaW5nCmZvciB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uLgoKRml4ZXM6
IDUwNDMzNDhhNDk2OWFlMTY2MWMwMDhlZmU5MjlhYmQwZDc2ZTM3OTIgKCJkcm06IHF4bDogRml4
IGVycm9yIGhhbmRsaW5nIGF0IHF4bF9kZXZpY2VfaW5pdCIpClNpZ25lZC1vZmYtYnk6IE1hcmt1
cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vcXhsL3F4bF9rbXMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2tt
cy5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfa21zLmMKaW5kZXggNjExY2JlN2FlZTY5Li5i
ZmMxNjMxMDkzZTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2ttcy5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2ttcy5jCkBAIC0xODQsNyArMTg0LDcgQEAgaW50
IHF4bF9kZXZpY2VfaW5pdChzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwKCiAJaWYgKCFxeGxfY2hl
Y2tfZGV2aWNlKHFkZXYpKSB7CiAJCXIgPSAtRU5PREVWOwotCQlnb3RvIHN1cmZhY2VfbWFwcGlu
Z19mcmVlOworCQlnb3RvIHJvbV91bm1hcDsKIAl9CgogCXIgPSBxeGxfYm9faW5pdChxZGV2KTsK
LS0KMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
