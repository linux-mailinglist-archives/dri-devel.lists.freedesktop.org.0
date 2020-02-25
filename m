Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040FE16B6AF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 01:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438D06E884;
	Tue, 25 Feb 2020 00:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339E76E884
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:28:14 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200225002811epoutp01ef1b84115154773b0a613bf9386b9e0d~2farVA3DO1191711917epoutp01k
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:28:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200225002811epoutp01ef1b84115154773b0a613bf9386b9e0d~2farVA3DO1191711917epoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582590491;
 bh=ciZPUpj55R2Cx9NYXwTeRKIPpC16jNrSaNbOOvLqOos=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=GRAH5DShEeom6zMO9tL5WVOWD0fy1bxngMczpRXLmMPLUoCwjuXXpYqDVr+LDyrUU
 mcvOuf4DUDTX5EpbG/tpGxGFvC9iz6GqHmZP2eFmkMRK77K8y0hIy/1HxOaGW1Zbv0
 mdNIVI2aPS8c/KtTnavJwXytWUVMjmuMi6XtBGvQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200225002811epcas1p3a0e86a57fa4b848fa754cc72c8ae6c44~2farLK5h43175931759epcas1p37;
 Tue, 25 Feb 2020 00:28:11 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.157]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 48RKXT43JXzMqYm5; Tue, 25 Feb
 2020 00:28:09 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 03.45.48019.61A645E5; Tue, 25 Feb 2020 09:28:06 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200225002805epcas1p15e0422d92654560c097a129175eef03a~2fal4Jtg82619926199epcas1p1U;
 Tue, 25 Feb 2020 00:28:05 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200225002805epsmtrp2b425034ac7ea78bf3142f1df3020d301~2fal3oF651339413394epsmtrp2M;
 Tue, 25 Feb 2020 00:28:05 +0000 (GMT)
X-AuditID: b6c32a38-23fff7000001bb93-77-5e546a169b21
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C0.EB.10238.51A645E5; Tue, 25 Feb 2020 09:28:05 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200225002805epsmtip225b259c1430584acee6682dd12fd19e9~2falrxW3P2563625636epsmtip2Z;
 Tue, 25 Feb 2020 00:28:05 +0000 (GMT)
Subject: Re: [PATCH v3 3/7] drm/exynos: Use drm_encoder_mask()
From: Inki Dae <inki.dae@samsung.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <c3893280-fd81-c370-9bcc-89fa65d283c1@samsung.com>
Date: Tue, 25 Feb 2020 09:32:27 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <317360e1-0c76-1939-aa8b-e965288caae7@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDKsWRmVeSWpSXmKPExsWy7bCmvq5YVkicwZoWfosrX9+zWXz/t5DJ
 gclj3slAj/vdx5kCmKKybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1Nt
 lVx8AnTdMnOAxisplCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCiwL9IoTc4tL89L1
 kvNzrQwNDIxMgQoTsjPOfd7OXnBZoGJ/zyrWBsYmvi5GTg4JAROJA/N/MXcxcnEICexglGj7
 sJMFwvnEKPHh2haozDdGiefdD4AcDrCWbfNFIOJ7GSW+bTvHDuG8Z5ToP/+cHWSusICdxMZv
 x1hBbDYBVYmJK+6zgdgiAiES+883gtm8QDXL1u9iAbFZgGr2HfnGDrJAVCBC4vTXRIgSQYmT
 M5+AlXAK2Evcuz8HbCSzgLjErSfzmSBseYnmrbOZId6ZwSbx/pE0hO0icf3JOqi4sMSr41vY
 IWwpic/v9rJB2NUSEw7+B/tYQqCBUaL7aCdUkbHE/qWTmUDuYRbQlFi/Sx8irCix8/dcRoi9
 fBLvvvawQsKEV6KjTQiiREni2MUbjBC2hMSFJROhVnlITGh5zwQJqhYmiXubl7FMYFSYheTN
 WUhem4XktVkIVyxgZFnFKJZaUJybnlpsWGCCHNmbGMEpT8tiB+Oecz6HGAU4GJV4eCX2BscJ
 sSaWFVfmHmKU4GBWEuH1ZgyKE+JNSaysSi3Kjy8qzUktPsRoCoyEicxSosn5wHScVxJvaGpk
 bGxsYWJoZmpoqCTO+zBSM05IID2xJDU7NbUgtQimj4mDU6qB0ezWcVuPu21ysj4tPFwmOjc/
 S2xQ3twRePvjRdm3643b3ik9mzvrwemLPq3if2cEc4gtlftZe/zTr9POtkc3z3Azd5q648Hh
 x8b7Dh1bsLZL8OUq230cufNSQqzntASru9yJWMlx6tPSH5/62BrL8sOLagK0Ptn0Kij3sRow
 HDsSV8KUsmTeQSWW4oxEQy3mouJEANAtOc+PAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHLMWRmVeSWpSXmKPExsWy7bCSvK5oVkicwc1behZXvr5ns/j+byGT
 A5PHvJOBHve7jzMFMEVx2aSk5mSWpRbp2yVwZZz7vJ294LJAxf6eVawNjE18XYwcHBICJhLb
 5ot0MXJxCAnsZpRo2D+TESIuIbFlKweEKSxx+HAxRMlbRokZ914BlXByCAvYSWz8dowVxGYT
 UJWYuOI+G4gtIhAi0fDmETNEQwuTRNeHT0wgCV6ghmXrd7GA2CxADfuOfGMHsUUFIiSeb7/B
 CFEjKHFy5hOwGk4Be4l79+eALWAWUJf4M+8SM4QtLnHryXwmCFteonnrbOYJjIKzkLTPQtIy
 C0nLLCQtCxhZVjFKphYU56bnFhsWGOallusVJ+YWl+al6yXn525iBIeyluYOxstL4g8xCnAw
 KvHwHtgVHCfEmlhWXJl7iFGCg1lJhNebMShOiDclsbIqtSg/vqg0J7X4EKM0B4uSOO/TvGOR
 QgLpiSWp2ampBalFMFkmDk6pBsZZ8Z4Crru1dz+svHJCLfOG209zxt/Lbx/Id8o9v8LkycLV
 tyf4bLpzuK6b6eN2E8P9HpUnvm4J1buUovh4xQJp7RJpw+YJv++kb3z7LT3r88f2uR8Fcx3Y
 oy7UTiw7V/3qdeKrw7V3+dLKeftqJs45tO56Uu8UbutzznrXby/T0fu0oofBv99biaU4I9FQ
 i7moOBEA/xxZtmECAAA=
X-CMS-MailID: 20200225002805epcas1p15e0422d92654560c097a129175eef03a
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200211162228epcas1p48eaa9653725150cb21766b1ce950d1c7
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
 <CGME20200211162228epcas1p48eaa9653725150cb21766b1ce950d1c7@epcas1p4.samsung.com>
 <20200211162208.16224-4-ville.syrjala@linux.intel.com>
 <317360e1-0c76-1939-aa8b-e965288caae7@samsung.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoyMC4gMi4gMTcuIOyYpOyghCAxMToyN+yXkCBJbmtpIERhZSDsnbQo6rCAKSDsk7Qg6riAOgo+
IAo+IAo+IDIwLiAyLiAxMi4g7Jik7KCEIDE6MjLsl5AgVmlsbGUgU3lyamFsYSDsnbQo6rCAKSDs
k7Qg6riAOgo+PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgo+Pgo+PiBSZXBsYWNlIHRoZSBoYW5kIHJvbGxlZCBlbmNvZGVyIGJpdG1hc2sgdGhp
bmcgd2l0aCBkcm1fZW5jb2Rlcl9tYXNrKCkKPj4KPj4gQ2M6IElua2kgRGFlIDxpbmtpLmRhZUBz
YW1zdW5nLmNvbT4KPj4gQ2M6IEpvb255b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBzYW1zdW5nLmNv
bT4KPj4gQ2M6IFNldW5nLVdvbyBLaW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5jb20+Cj4+IENjOiBL
eXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tPgo+PiBBY2tlZC1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4+IFNpZ25lZC1vZmYtYnk6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gQWNrZWQt
Ynk6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KClNlZW1zIG5vIGFueSBkZXBlbmRl
bmN5IG9mIG90aGVyIHBhdGNoIHNvIEkgd2lsbCBwaWNrIGl0IHVwLgoKVGhhbmtzLApJbmtpIERh
ZQoKPiAKPiBUSGFua3MsCj4gSW5raSBEYWUKPiAKPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMgfCA1ICsrLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX2Rydi5jCj4+IGluZGV4IGJhMGY4NjhiMjQ3Ny4uNTdkZWZlYjQ0NTIyIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMKPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jCj4+IEBAIC0yNzAsNyAr
MjcwLDcgQEAgc3RhdGljIGludCBleHlub3NfZHJtX2JpbmQoc3RydWN0IGRldmljZSAqZGV2KQo+
PiAgCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKPj4gIAlzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtOwo+PiAgCXVuc2lnbmVkIGludCBjbG9uZV9tYXNrOwo+PiAtCWludCBjbnQsIHJldDsKPj4g
KwlpbnQgcmV0Owo+PiAgCj4+ICAJZHJtID0gZHJtX2Rldl9hbGxvYygmZXh5bm9zX2RybV9kcml2
ZXIsIGRldik7Cj4+ICAJaWYgKElTX0VSUihkcm0pKQo+PiBAQCAtMjkzLDEwICsyOTMsOSBAQCBz
dGF0aWMgaW50IGV4eW5vc19kcm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICAJZXh5bm9z
X2RybV9tb2RlX2NvbmZpZ19pbml0KGRybSk7Cj4+ICAKPj4gIAkvKiBzZXR1cCBwb3NzaWJsZV9j
bG9uZXMuICovCj4+IC0JY250ID0gMDsKPj4gIAljbG9uZV9tYXNrID0gMDsKPj4gIAlsaXN0X2Zv
cl9lYWNoX2VudHJ5KGVuY29kZXIsICZkcm0tPm1vZGVfY29uZmlnLmVuY29kZXJfbGlzdCwgaGVh
ZCkKPj4gLQkJY2xvbmVfbWFzayB8PSAoMSA8PCAoY250KyspKTsKPj4gKwkJY2xvbmVfbWFzayB8
PSBkcm1fZW5jb2Rlcl9tYXNrKGVuY29kZXIpOwo+PiAgCj4+ICAJbGlzdF9mb3JfZWFjaF9lbnRy
eShlbmNvZGVyLCAmZHJtLT5tb2RlX2NvbmZpZy5lbmNvZGVyX2xpc3QsIGhlYWQpCj4+ICAJCWVu
Y29kZXItPnBvc3NpYmxlX2Nsb25lcyA9IGNsb25lX21hc2s7Cj4+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vcHJvdGVjdDIuZmly
ZWV5ZS5jb20vdXJsP2s9MWQxZDA5MWEtNDBjOWI1NzItMWQxYzgyNTUtMGNjNDdhMzM1NmIyLTlh
NGQwZTVkZWQ3ZjZjYjgmdT1odHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
