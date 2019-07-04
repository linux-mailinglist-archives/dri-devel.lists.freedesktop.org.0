Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 501F75F406
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438506E2D6;
	Thu,  4 Jul 2019 07:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555D86E2D6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 07:46:38 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190704074636euoutp014972e4d92351dc9911e89c35ac3bd179~uJKGGrN431070210702euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 07:46:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190704074636euoutp014972e4d92351dc9911e89c35ac3bd179~uJKGGrN431070210702euoutp01Y
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190704074636eucas1p22238c80a38a7b64e99dc14e804ad4f42~uJKFwGxVV0336803368eucas1p2G;
 Thu,  4 Jul 2019 07:46:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 37.FB.04325.CDEAD1D5; Thu,  4
 Jul 2019 08:46:36 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190704074635eucas1p1391ed25106f50ee6c42b1ab2572f4863~uJKFCrVk22425124251eucas1p17;
 Thu,  4 Jul 2019 07:46:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190704074635eusmtrp2f2a548162d9a73e6408f575faeb41d7f~uJKE0mMvY1513115131eusmtrp2r;
 Thu,  4 Jul 2019 07:46:35 +0000 (GMT)
X-AuditID: cbfec7f5-fbbf09c0000010e5-86-5d1daedc8032
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BD.6B.04140.BDEAD1D5; Thu,  4
 Jul 2019 08:46:35 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190704074635eusmtip1fe0cf36872cfdac6aa6e17d698554e50~uJKEaj62e2962529625eusmtip1u;
 Thu,  4 Jul 2019 07:46:35 +0000 (GMT)
Subject: Re: [PATCH -next] drm/bridge: sii902x: Make
 sii902x_audio_digital_mute static
To: YueHaibing <yuehaibing@huawei.com>, Laurent.pinchart@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch, jsarha@ti.com
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <b7f2d9cf-ee64-04a5-d303-272e1839c4a3@samsung.com>
Date: Thu, 4 Jul 2019 09:46:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190614153623.28708-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRmVeSWpSXmKPExsWy7djP87p31snGGpy+wG/Re+4kk8X/bROZ
 La58fc9m0d3ZwWrROXEJu8XlXXPYLO58fc7iwO6x99sCFo+WI29ZPWZ3zGT12P7tAavH/e7j
 TB7Hb2xn8vi8SS6APYrLJiU1J7MstUjfLoEr411rO3PBJo6KnQ9fszcwfmfrYuTkkBAwkfh9
 eT9rFyMXh5DACkaJp3sPsEE4XxglvhxbxQxSJSTwmVHi1YQomI6bb75BxZczSqxY4w1hv2WU
 uLPBD8QWFoiQePdxAguILSJQK7Fs0gJGEJtZwFHi5tRjrCA2m4CmxN/NN8Gu4BWwk3i9txds
 JouAisTs7avA6kWB5lzesosRokZQ4uTMJ2AzOQWsJXrnHmKDmCkvsf3tHGYIW1zi1pP5TCAP
 SAjsYpe4dOwaK8TRLhK9v58wQ9jCEq+Ob2GHsGUk/u8EaQCx6yXur2hhhmjuYJTYumEnVIO1
 xOHjF4EGcQBt0JRYv0sfIuwosWT3OjaQsIQAn8SNt4IQN/BJTNo2nRkizCvR0SYEUa0ocf/s
 VqiB4hJLL3xlm8CoNAvJZ7OQfDMLyTezEPYuYGRZxSieWlqcm55abJyXWq5XnJhbXJqXrpec
 n7uJEZiSTv87/nUH474/SYcYBTgYlXh4H2yRiRViTSwrrsw9xCjBwawkwvv9N1CINyWxsiq1
 KD++qDQntfgQozQHi5I4bzXDg2ghgfTEktTs1NSC1CKYLBMHp1QD44qzGYHl12OOt/hMnbLs
 zE/b/C+KCg5Vqfte/67uu3LVZPfWh4ay+6e5CuqW1upvlV/Wei/32OXpHHK1TE2rj4otbxCe
 HLmmzkXyfX1U7RWR1sCbKrzxoZpTHwhNzFn/u//V2xWN+z69n3o2z/hSvsOrivh7ThNm3w6b
 zHn86En9bRM3cbq7PFJiKc5INNRiLipOBAAV5KyKRQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7q318nGGjycJ2/Re+4kk8X/bROZ
 La58fc9m0d3ZwWrROXEJu8XlXXPYLO58fc7iwO6x99sCFo+WI29ZPWZ3zGT12P7tAavH/e7j
 TB7Hb2xn8vi8SS6APUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1
 J7MstUjfLkEv411rO3PBJo6KnQ9fszcwfmfrYuTkkBAwkbj55htzFyMXh5DAUkaJU7fPsUMk
 xCV2z3/LDGELS/y51sUGUfSaUeLl5eMsIAlhgQiJdx8nANkcHCICtRKneqNAwswCjhI3px5j
 hajvY5SYffMPWD2bgKbE3803wTbzCthJvN7bC7aARUBFYvb2VYwgtijQzL622VA1ghInZz4B
 6+UUsJbonXuIDWKBusSfeZeYIWx5ie1v50DZ4hK3nsxnmsAoNAtJ+ywkLbOQtMxC0rKAkWUV
 o0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYCRuO/Zzyw7GrnfBhxgFOBiVeHgfbJGJFWJNLCuu
 zD3EKMHBrCTC+/03UIg3JbGyKrUoP76oNCe1+BCjKdBzE5mlRJPzgUkiryTe0NTQ3MLS0NzY
 3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QDY1feDt3J4uwP/4RV87boii9uVgtctuu0
 dvrCK9crHTsLtwXbvDg81Ufgzq5CTjlZtqZs3/btX7j2cucfN3r1f83XiyYeRpY/trj+FL5q
 1av6a33FDKm/tkav09q1bBlDSufrfHx6fdeU2PKzZxjPZe1euqL3yosQmawleY9nsXRNEdzO
 uVLmvBJLcUaioRZzUXEiAIEMIvbaAgAA
X-CMS-MailID: 20190704074635eucas1p1391ed25106f50ee6c42b1ab2572f4863
X-Msg-Generator: CA
X-RootMTR: 20190614153645epcas1p31033b923528a79f6356d01f40ad129a6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190614153645epcas1p31033b923528a79f6356d01f40ad129a6
References: <CGME20190614153645epcas1p31033b923528a79f6356d01f40ad129a6@epcas1p3.samsung.com>
 <20190614153623.28708-1-yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562226396;
 bh=4UC6gdDWM7A5kpeQCVnHlWnkr4RWGuGbjJWamlwmHpo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=qr+3dDvSPd+YSD1isaQRN1rqLZrpGQ4NKkVIcz3+lHTY/X3+uWGlwuXCkmdILEOQp
 FKj1ftiweCB5EesKtSlJlCGi2wmQ5jieqo0DH3yemLMNywvAQMX7GuU7BgLxXQsqZX
 guxeEivoXpc6xeduy8mFulBKgcugp51+q/1zwWQc=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQuMDYuMjAxOSAxNzozNiwgWXVlSGFpYmluZyB3cm90ZToKPiBGaXggc3BhcnNlIHdhcm5p
bmc6Cj4KPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYzo2NjU6NTogd2FybmluZzoK
PiAgc3ltYm9sICdzaWk5MDJ4X2F1ZGlvX2RpZ2l0YWxfbXV0ZScgd2FzIG5vdCBkZWNsYXJlZC4g
U2hvdWxkIGl0IGJlIHN0YXRpYz8KPgo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lA
aHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdl
aS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIHwgMyArKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBpbmRleCBkZDdhYTQ2Li5jMmY5N2U1IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBAQCAtNjYyLDcgKzY2Miw4IEBAIHN0YXRpYyB2b2lkIHNp
aTkwMnhfYXVkaW9fc2h1dGRvd24oc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQo+ICAJ
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKHNpaTkwMngtPmF1ZGlvLm1jbGspOwo+ICB9Cj4gIAo+IC1p
bnQgc2lpOTAyeF9hdWRpb19kaWdpdGFsX211dGUoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpk
YXRhLCBib29sIGVuYWJsZSkKPiArc3RhdGljIGludCBzaWk5MDJ4X2F1ZGlvX2RpZ2l0YWxfbXV0
ZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gKwkJCQkgICAgICB2b2lkICpkYXRhLCBib29sIGVuYWJs
ZSkKPiAgewo+ICAJc3RydWN0IHNpaTkwMnggKnNpaTkwMnggPSBkZXZfZ2V0X2RydmRhdGEoZGV2
KTsKPiAgCgoKVGhhbmtzLAoKCkFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dC4KCgpSZWdhcmRzCgpB
bmRyemVqCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
