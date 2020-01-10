Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F6713646F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 01:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07B66E95A;
	Fri, 10 Jan 2020 00:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FF16E95A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 00:44:43 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200110004441epoutp04039efd2b7761514be9b3f0bad100ebaf~oX98malYx2335623356epoutp04E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 00:44:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200110004441epoutp04039efd2b7761514be9b3f0bad100ebaf~oX98malYx2335623356epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578617081;
 bh=1SoSvJCcBngtJocEuDjUkcPLiGhuUykcQzSrX2BRffk=;
 h=Date:From:Reply-To:To:CC:Subject:In-Reply-To:References:From;
 b=b+NxDj+88dO/GEdjY8/tF+BY0b+Nm6Hu/qzXwbHzvDWDtGSr2xG7QFzZqjF7gGu/G
 oIuCpkx3XSMW1RzMxIUADeq/EcIdK94Vtah218tNNTd5lOBtzGl0gEJmBm0hq3MvQA
 /dd75Jlamy4m8Jou9wAdcgpYoq7K75lkf1u8bs60=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200110004440epcas1p4caa0046c98caeb1ed6b9caf53e7e46c0~oX98Mupw73053330533epcas1p4_;
 Fri, 10 Jan 2020 00:44:40 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.152]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 47v44k08CLzMqYkW; Fri, 10 Jan
 2020 00:44:38 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 E4.20.57028.EE8C71E5; Fri, 10 Jan 2020 09:44:30 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200110004429epcas1p18088b8e596690b09764ba458bdd8f142~oX9x5PNrT0891908919epcas1p1R;
 Fri, 10 Jan 2020 00:44:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200110004429epsmtrp2bbab0cc93710727e1c60d190f33a777b~oX9x4m3DO1299012990epsmtrp2y;
 Fri, 10 Jan 2020 00:44:29 +0000 (GMT)
X-AuditID: b6c32a35-4f3ff7000001dec4-cf-5e17c8ee691f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 77.BA.10238.DE8C71E5; Fri, 10 Jan 2020 09:44:29 +0900 (KST)
Received: from [10.113.221.222] (unknown [10.113.221.222]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200110004429epsmtip2ebc511d8fb13078c13dc101240f40741~oX9xo3ctn2115721157epsmtip2l;
 Fri, 10 Jan 2020 00:44:29 +0000 (GMT)
Message-ID: <5E17C9AA.6010501@samsung.com>
Date: Fri, 10 Jan 2020 09:47:38 +0900
From: Seung-Woo Kim <sw0312.kim@samsung.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:16.0) Gecko/20121011
 Thunderbird/16.0.1
MIME-Version: 1.0
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] xf86drm: only include <sys/sysctl.h> for FreeBSD build
 case
In-Reply-To: <871rs8psjy.fsf@intel.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTmt3t3vYsWt1l6WA/XpSxtM29r6xaZQhaL/GMVSAVpF3dx4h6X
 3Wlq/VFEJdNe2mOtUjMjepGVloE2XQ+zogwrRAkTVmEPK8uyDGrbLfK/73zn+86Dc0hMVUao
 yTyHm3c5OBtNjMOv3UpI0g3ei81KPjSSwD4d/kiwF3vacPZM1yXEeisHCHbf/V+yNLmp6UO7
 zHSqeUBmqupYbeorC0V7G84hs3xD/hIrz1l4l4Z35DgteY7cFHrV2uxl2QZjMqNjFrELaY2D
 s/MpdHqGWbcizxZqTmsKOVtBiDJzokjPW7rE5Sxw8xqrU3Sn0LxgsQmLhCSRs4sFjtykHKd9
 MZOcPN8QEm7Kt149OIQJO8cXjVR78G2oV+FBChKoBeCpfx8VxiqqCcHpmiIPGhfCQwhKyx/K
 peAbgs4zj9A/R8fbx0hKtCA49KoWl4KPCGpPBkIWklRSifCiVRY24NQs6Kr4FDETlBb8daNy
 qZ0GOhu9RBhPpjLB27YvolFSE6HjaBAP40mUDi52ByMlMWor9Lxzhuloag209tfgYVpBzYbd
 naykSITm4IawAqPiYEfjMSw8GFBdBPSNvomSxk+H55+OyyUcDW/bG/7yavgy2EJIeAtc3/8j
 SjKXIijfvR2XEnrwn66USXgG3Bg9gaRuE2BwuDwyJlBKKN2lkiQz4cadCkKi1eCrXyvRJqj7
 fkG2H83wjdnX938D35gNahB2DsXwgmjP5UVGYMZe9wqKPGKioQkdfJQRQBSJ6PFKa3RslkrO
 FYrF9gACEqMnKe90x2SplBauuIR3ObNdBTZeDCBD6DQHMPXkHGforR3ubMYwX6/XswsYo4Fh
 6FglOfJko4rK5dx8Ps8LvOufT0Yq1NtQoX/OqChf3V6yJ+0IHtR6G87e8h82mp8+DrJmxfIP
 mqrffmNC77dnz6q15Pr+8xXGtmotK1w/q5u2Lt6+05J2l7w2PJw6xdN6W/sitezH1OmZUQNz
 0136Hu9Xggikriz1ve5X8Z+Xv7wad7MjPU7piaksagw8+FlxqbgvfrNwmcZFK8ckYi6R+wP2
 hFlUngMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSvO7bE+JxBuevGltc+fqezWLtrYMs
 Fssvr2e0mDH5JZtF/6k/TA6sHjveHmfyWLznJZPHvJOBHve7gby+LasYA1ijuGxSUnMyy1KL
 9O0SuDI2T/nEXNDKU/FjfhdLA+Ntzi5GTg4JAROJk6/OM3YxcnEICexmlPh9Yic7REJKYu63
 7UAJDiBbWOLw4WKImreMEvO2zgWL8wpoSdw9wARSziKgKnF50gdGEJtNQEdi/5LfrCC2kICC
 xIWtM9hAbFGBEIlfH6+AxXkFBCVOznzCAmKLCOhKrL3xBCzOLFAr8f71OrA5wgJBEgceLmCB
 2LuZUeLu6utMIHs5BdQl2i9YQNRrSEy+cpwFwpaXaN46m3kCo9AsJCtmISmbhaRsASPzKkbJ
 1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT83E2M4DjQ0tzBeHlJ/CFGAQ5GJR7eDGHxOCHWxLLi
 ytxDjBIczEoivEdviMUJ8aYkVlalFuXHF5XmpBYfYpTmYFES532adyxSSCA9sSQ1OzW1ILUI
 JsvEwSnVwCiTylV0UfjIMr6IlfLdO/ce8KzkzZ8Ys/NcymrVu75r1p9rt39Rscrjw95Is4LM
 OpPAHVcOL96myG3Qw7G4+qZz3vfOtx92dNvejkxr+iy/xn7vu701E+QueRW+a7m7N2/+s5UM
 z/kUy+w3b+uZwGT35wXb+R+i2Yuq+T6md/DMNpgs4pS1caUSS3FGoqEWc1FxIgAZRC/FfwIA
 AA==
X-CMS-MailID: 20200110004429epcas1p18088b8e596690b09764ba458bdd8f142
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200109092903epcas1p49de22b4892ff4c6e205fb098c83c76ae
References: <CGME20200109092903epcas1p49de22b4892ff4c6e205fb098c83c76ae@epcas1p4.samsung.com>
 <1578562330-25594-1-git-send-email-sw0312.kim@samsung.com>
 <871rs8psjy.fsf@intel.com>
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
Reply-To: sw0312.kim@samsung.com
Cc: eric.engestrom@intel.com, zeising@daemonic.se,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="euc-kr"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyMDIws+IgMDG/+SAxMMDPIDAwOjE4LCBKYW5pIE5pa3VsYSB3cm90ZToKPiBPbiBU
aHUsIDA5IEphbiAyMDIwLCBTZXVuZy1Xb28gS2ltIDxzdzAzMTIua2ltQHNhbXN1bmcuY29tPiB3
cm90ZToKPj4gVGhlIDxzeXMvc3lzY3RsLmg+IGhlYWRlciBpcyBvbmx5IHJlcXVpcmVkIEZyZWVC
U0QgYW5kIEdOVSBsaWJjCj4+IDIuMzAgc3RhcnRzIHRvIHdhcm4gYWJvdXQgTGludXggc3BlY2lm
aWMgPHN5cy9zeXNjdGwuaD4gaGVhZGVyCj4+IGRlcHJlY2F0aW9uLiBPbmx5IGluY2x1ZGUgPHN5
cy9zeXNjdGwuaD4gZm9yIEZyZWVCU0QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNldW5nLVdvbyBL
aW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5jb20+Cj4+IC0tLQo+PiAgeGY4NmRybU1vZGUuYyB8ICAg
IDIgKysKPj4gIDEgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGY4NmRybU1vZGUuYyBiL3hmODZkcm1Nb2RlLmMKPj4gaW5k
ZXggMjA3ZDdiZS4uZmYxZDMxZCAxMDA2NDQKPj4gLS0tIGEveGY4NmRybU1vZGUuYwo+PiArKysg
Yi94Zjg2ZHJtTW9kZS5jCj4+IEBAIC00Miw5ICs0MiwxMSBAQAo+PiAgI2luY2x1ZGUgPHN0ZGlu
dC5oPgo+PiAgI2luY2x1ZGUgPHN0ZGxpYi5oPgo+PiAgI2luY2x1ZGUgPHN5cy9pb2N0bC5oPgo+
PiArI2lmIGRlZmluZWQgKF9fRnJlZUJTRF9fKSB8fCBkZWZpbmVkIChfX0ZyZWVCU0Rfa2VybmVs
X18pCj4+ICAjaWZkZWYgSEFWRV9TWVNfU1lTQ1RMX0gKPiAKPiBOb3QgdGhhdCBJIGtub3cgYW55
dGhpbmcgYWJvdXQgdGhpcywgYnV0IHNob3VsZG4ndCB5b3UgaW5zdGVhZCBmaXgKPiBIQVZFX1NZ
U19TWVNDVExfSCBkZWZpbml0aW9uIGluIGNvbmZpZ3VyZSBzdGFnZSB0byBvbmx5IGJlIGVuYWJs
ZWQgb24KPiBGcmVlQlNEPwoKVGhhdCBzZWVtcyBiZXR0ZXIgZXZlbiBpbiB0aGUgeGY4NmRybU1v
ZGUuYywgPHN5cy9zeXNjdGwuaD4gaXMgcmVxdWlyZWQKZm9yIHN5c2N0bGJ5bmFtZSgpIGNhbGxl
ZCBmcm9tIGRybUNoZWNrTW9kZXNldHRpbmdTdXBwb3J0ZWQoKSB3aXRoCkZlZUJTRCBidWlsZCBt
YWNyby4KClVuZm9ydHVuYXRlbHksIEkgYW0gbm90IHRoZSBtZXNvbiBidWlsZCBleHBlcnQgc28g
aWYgdGhlcmUgaXMgc29tZW9uZSB0bwpmaXgsIHRoZW4gSSBhbSBva2F5LiBBbnl3YXksIEkgd2ls
bCB0cnkgdG8gZml4IHdpdGggSEFWRV9TWVNfU1lTQ1RMX0guCgpCZXN0IFJlZ2FyZHMsCi0gU2V1
bmctV29vIEtpbQoKPiAKPiBCUiwKPiBKYW5pLgo+IAo+PiAgI2luY2x1ZGUgPHN5cy9zeXNjdGwu
aD4KPj4gICNlbmRpZgo+PiArI2VuZGlmIC8qIGRlZmluZWQgKF9fRnJlZUJTRF9fKSB8fCBkZWZp
bmVkIChfX0ZyZWVCU0Rfa2VybmVsX18pICovCj4+ICAjaW5jbHVkZSA8c3RkaW8uaD4KPj4gICNp
bmNsdWRlIDxzdGRib29sLmg+Cj4gCgotLSAKU2V1bmctV29vIEtpbQpTYW1zdW5nIFJlc2VhcmNo
Ci0tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
