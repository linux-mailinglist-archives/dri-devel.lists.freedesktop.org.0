Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0038A40
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B5E89DEC;
	Fri,  7 Jun 2019 12:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F410689DEC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:28:11 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607122810euoutp01095c6b60855f7cc06a320344d35b7adb~l6lONNvzP3070430704euoutp01e
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:28:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607122810euoutp01095c6b60855f7cc06a320344d35b7adb~l6lONNvzP3070430704euoutp01e
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190607122810eucas1p23d355b67172644319b33da983470fa7b~l6lN44hFl1570215702eucas1p2F;
 Fri,  7 Jun 2019 12:28:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 79.15.04298.9585AFC5; Fri,  7
 Jun 2019 13:28:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190607122809eucas1p1d770153cc51e01ee04c531d35d22e32b~l6lNBRerP2586425864eucas1p1B;
 Fri,  7 Jun 2019 12:28:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190607122808eusmtrp1b6c64dcb6fa45ee2bbdec3679166624a~l6lMr1xjQ0101101011eusmtrp1W;
 Fri,  7 Jun 2019 12:28:08 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-5f-5cfa5859e5f6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 4D.52.04140.8585AFC5; Fri,  7
 Jun 2019 13:28:08 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190607122808eusmtip196c285aad43a27f8e1d7abff8c48477f~l6lMNXgVS2223722237eusmtip1U;
 Fri,  7 Jun 2019 12:28:08 +0000 (GMT)
Subject: Re: [PATCH v2] video: fbdev: imxfb: add COMPILE_TEST support
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <73094ead-2fbc-ba3e-3760-01918673ba30@samsung.com>
Date: Fri, 7 Jun 2019 14:28:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <33fc4837-599d-0d5c-c530-58b283c4c095@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAKsWRmVeSWpSXmKPExsWy7djPc7qREb9iDE481LO48vU9m8XDq/4W
 q6buZLHY9Pgaq8WJvg+sFl2/VjJbXN41h83i7/ZNLBYvtohb3J44mdGBy2PnrLvsHptWdbJ5
 3O8+zuSxeUm9x8Z3O5g8+v8aeHzeJBfAHsVlk5Kak1mWWqRvl8CV8fjEY+aCm0wV2/++ZWtg
 nMfUxcjJISFgInHz/WfmLkYuDiGBFYwSX9s/giWEBL4wSvz6kQaR+Mwo0fbuGhtMx52L39kg
 EssZJV53TYBqf8sosW7rBrAqYQFXiYnbuplBbDYBK4mJ7asYQWwRAQeJKTcmsIM0MAtcZpI4
 /HMPWIJXwE7izcTFLCA2i4CKxN91J8HiogIREvePbWCFqBGUODnzCVgNp4C9xNtL88EWMAuI
 S9x6Mp8JwpaX2P52DthFEgLX2CVuTdkC1MAB5LhIXJ/mAfGCsMSr41vYIWwZidOTe1gg6tcx
 SvzteAHVvJ1RYvnkf1BPW0scPn6RFWQQs4CmxPpd+hBhR4kj/Z1MEPP5JG68FYS4gU9i0rbp
 zBBhXomONiGIajWJDcs2sMGs7dq5knkCo9IsJJ/NQvLNLCTfzELYu4CRZRWjeGppcW56arFh
 Xmq5XnFibnFpXrpecn7uJkZgujr97/inHYxfLyUdYhTgYFTi4fVg/xkjxJpYVlyZe4hRgoNZ
 SYS37MKPGCHelMTKqtSi/Pii0pzU4kOM0hwsSuK81QwPooUE0hNLUrNTUwtSi2CyTBycUg2M
 y1omdGhu9Ghd6vLlx99s2WDRJY837N+SUj+r6kr8lT+mBUwagYlPe7X/fHSJ3LpMNPgx3+Oc
 fWv7Fn78+rYhxfo2K99KQaG5NTumRDoZXZZ6pB/ze+rvy2FOS1dvO79is9Fv3YDSqd5/rM7P
 2R7+bm5ljmvh+jcur2b/Wxfgw8NZt77PrJ1XR4mlOCPRUIu5qDgRACW5sLdTAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsVy+t/xu7oREb9iDM6eNbG48vU9m8XDq/4W
 q6buZLHY9Pgaq8WJvg+sFl2/VjJbXN41h83i7/ZNLBYvtohb3J44mdGBy2PnrLvsHptWdbJ5
 3O8+zuSxeUm9x8Z3O5g8+v8aeHzeJBfAHqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdo
 bB5rZWSqpG9nk5Kak1mWWqRvl6CX8fjEY+aCm0wV2/++ZWtgnMfUxcjJISFgInHn4ne2LkYu
 DiGBpYwSlzufMnYxcgAlZCSOry+DqBGW+HOtiw3EFhJ4zSgx+48oiC0s4CoxcVs3M4jNJmAl
 MbF9FSOILSLgIDHlxgR2kJnMAleZJB7tX8gK0WwnsfnmDnYQmxfIfjNxMQuIzSKgIvF33Umw
 ZlGBCIkz71ewQNQISpyc+QTM5hSwl3h7aT7YMmYBdYk/8y5B2eISt57MZ4Kw5SW2v53DPIFR
 aBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwOjcduznlh2MXe+C
 DzEKcDAq8fDOYPoZI8SaWFZcmXuIUYKDWUmEt+zCjxgh3pTEyqrUovz4otKc1OJDjKZAz01k
 lhJNzgcmjrySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYx7K/9/
 NukVYVqdYlu9XSa6JOBE+3kBrbZb+uwlLEnCIgddHKWFD/mVS/IbSuitWPPuw+Nt3QL7nN7I
 /xGTP6Pp9zLxvO21Z7Ms+re4na5nv/LyW2BF6pF559brq3c8Spu+OzygJFB7TUbkYrZDE1bs
 2XprxW3rf4uzzHdrJQdPmLZ+3eYGp21KLMUZiYZazEXFiQDUMIby5AIAAA==
X-CMS-MailID: 20190607122809eucas1p1d770153cc51e01ee04c531d35d22e32b
X-Msg-Generator: CA
X-RootMTR: 20190607122809eucas1p1d770153cc51e01ee04c531d35d22e32b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607122809eucas1p1d770153cc51e01ee04c531d35d22e32b
References: <33fc4837-599d-0d5c-c530-58b283c4c095@samsung.com>
 <CGME20190607122809eucas1p1d770153cc51e01ee04c531d35d22e32b@eucas1p1.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559910490;
 bh=9ASUxj5X1jrQpmL6ymTtSaqw6S2iiehLeIZIb8+AUG0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=stzuUfiCzBPMrY/dOydbh/X7bUDcyYRE2aGiHbSXhWzJLgY75hG1onK2RiplkoE8q
 PbFjt4pLuJdH1QRbs3jGtb4UVDAt0NzLZWhO07aCcorai2AAa1KiyC4B/c5BERT+DW
 SuSb4Xe0Vo4IKBKFOrXKGAolkKrsoNrM+Ujg3NYM=
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
Cc: Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDUvMjEvMTkgMTI6NDcgUE0sIEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogd3JvdGU6Cj4g
QWRkIENPTVBJTEVfVEVTVCBzdXBwb3J0IHRvIGlteGZiIGRyaXZlciBmb3IgYmV0dGVyIGNvbXBp
bGUKPiB0ZXN0aW5nIGNvdmVyYWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9s
bmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KCkkgcXVldWVkIHRoZSBwYXRj
aCBmb3IgdjUuMy4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpT
YW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
