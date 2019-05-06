Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C69C14B0C
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 15:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1F289196;
	Mon,  6 May 2019 13:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EF189196
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:40:56 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190506134055euoutp02f7fca0603c160614013f4e96a91feb0b~cG7m8BO-z1477314773euoutp023
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:40:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190506134055euoutp02f7fca0603c160614013f4e96a91feb0b~cG7m8BO-z1477314773euoutp023
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190506134054eucas1p123148c2bffa6c8815f8bb8cfb9388fc8~cG7mOm9dA2713527135eucas1p1B;
 Mon,  6 May 2019 13:40:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B6.07.04298.66930DC5; Mon,  6
 May 2019 14:40:54 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190506134053eucas1p195aba8cfd6c18bae6745beb63f4f707e~cG7lUkeiJ2242322423eucas1p1W;
 Mon,  6 May 2019 13:40:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190506134053eusmtrp2d453a3947f68cc344f32b765dc626499~cG7lT8SnV1658616586eusmtrp2L;
 Mon,  6 May 2019 13:40:53 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-2e-5cd0396640d1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id FE.A2.04146.56930DC5; Mon,  6
 May 2019 14:40:53 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190506134053eusmtip180101566820a6ee694b68239805b1743~cG7ktPRjQ1286212862eusmtip1u;
 Mon,  6 May 2019 13:40:53 +0000 (GMT)
Subject: Re: [PATCH v2 13/79] docs: fb: convert docs to ReST and rename to
 *.rst
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <af457dc4-e9ca-4447-b6b6-88e73a095ac6@samsung.com>
Date: Mon, 6 May 2019 15:40:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <3c14d978f772b706f98158a1e6d0faac9c92f7c9.1555938376.git.mchehab+samsung@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUwTYRDl26sLWlwK6kSIaGMkYkBJVFZRooma/Yn+UKMkusJyX2k5RH5I
 NOEoCYLUKIiKohxFAVHLIQlYIqWAVAUFfxhUigXCJVg5DFTpQuTfmzfvZd5MhsZl4+QmOjwm
 XlDE8FFyyoHQts4ZvUL2vwvcPTznwb7v/02wpuZ0xPZYJij2WnEVxaqrJzH2Qdojgm3LniTZ
 7oZCip03YOzEVCbG1rU/xFn1Tz3ONneocfbJo0bEVpQPSA6v47pnRnGuvuCLhHte5snVaDIp
 rneuD+Oa7j6RcP1Zeowrzs4jucGbKooz9w9SXNWLjwQ3XbOZK7ptJQKkZx0OBgtR4YmCYpf/
 BYewn7p7ZFwmeclqfoVSUQahQvY0MHvA+LoXVyEHWsaUIagyapFY/EKgvtdJicU0AktxE75i
 0VhuL1tKEZSP6pZVYwj6P5skSypn5iS8LWyxOVyYfWDoemMT4UwjATOD87YGxRyA3HQNWsJS
 xh9GtRYbTzDbYNFQ+s9A0+uZM3C900OUOIEh32QLbs/wUNJlwJYwzrhD7VihLREw+TQ8LhpC
 YtSj8D3rGSZiZxjRv5CI2A2s9fcx0VCJYCFjaNldi6A0b5ESVX7Qon9PLqXAmR1Q1bBLpI/A
 RPu0jQbGEfrGnMQQjnBDewsXaSlkpMlE9XaoLqmmVsaq6suXr8iB5WUFmYO2FqxarWDVOgX/
 5xYhXIM2CgnK6FBB6RMjJHkr+WhlQkyod1BsdA3694Udi/qpOmT5cFGHGBrJ10o5uTFQRvKJ
 yuRoHQIal7tI+R9dgTJpMJ98WVDEnlckRAlKHXKlCflGaYrd13MyJpSPFyIFIU5QrHQx2n5T
 KooccfdVfzJV+jZL7JpKXHeEV/cdHzPnP33mdbTyBNdi1HoMj/Otd0Jyj5N0R8BCkCovrFub
 FVTWdWhnTursXr6yLfLbUL3JLcK4pfZqqaziZYQXwU6leCT6eIa3rkneMLmY4zdiiEtK82ug
 gnrGT1tPya9YNe662ZE/5mMRWQNyQhnG+3jiCiX/F/XcjZqBAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMIsWRmVeSWpSXmKPExsVy+t/xu7qplhdiDFavM7e4eP8bi8WTA+2M
 Fle+vmezaF68ns1iyoYPTBYL25awWJzo+8BqcXnXHDaLXyeZLN5/6mSy2HFqEbPFlI/HmS0O
 nJ7CbLFmyR5Gi9UrH7M78Htc/v6G2WPnrLvsHptXaHlsWtXJ5nH95w0mj/1z17B73O8+zuSx
 uG8yq8fTqV1sHs/vP2XzWL/lKovH501yHgtm/GcJ4I3SsynKLy1JVcjILy6xVYo2tDDSM7S0
 0DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy/h4aB5rQSdrxf/nuxkbGDtYuhg5OSQETCRW
 fZ3B3MXIxSEksJRR4sOxG2xdjBxACRmJ4+vLIGqEJf5c62KDqHnNKHHqVy8TSEJYIEji7JzD
 zCC2iICZxMlzR9lAbCGBF4wSs6b7gjQwC+xjkZiz4SFYEZuAlcTE9lWMIDavgJ3Em21fweIs
 AioS/04uB2sWFYiQuPUQ4jpeAUGJkzOfgNmcAokSy86dBFvMLKAu8WfeJWYIW15i+9s5zBMY
 BWchaZmFpGwWkrIFjMyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAiN827Gfm3cwXtoYfIhR
 gINRiYfXQ+l8jBBrYllxZe4hRgkOZiUR3sRn52KEeFMSK6tSi/Lji0pzUosPMZoCPTGRWUo0
 OR+YfPJK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTDmfNfnVDN3
 O9L0YkNj7iVnNav+5nMLjj7/dtlg5ikR2cBuc6FlSqddhT/X5xvlqZm0Wpuz2fzXUqz1U4/0
 +3/xhI7V/Ws8r05E+j/3u3g0KK7ZPkqgYLXOvWt8yTVFVn4aRSUPH+5KXPvmoKHDl2P2Ebs2
 MMi3S3V8eKCQeELJLfRxur/tcyWW4oxEQy3mouJEAOauWssGAwAA
X-CMS-MailID: 20190506134053eucas1p195aba8cfd6c18bae6745beb63f4f707e
X-Msg-Generator: CA
X-RootMTR: 20190422132822epcas1p4fbb9f0522bd66caf4a44ed9c49dfe9c7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190422132822epcas1p4fbb9f0522bd66caf4a44ed9c49dfe9c7
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
 <CGME20190422132822epcas1p4fbb9f0522bd66caf4a44ed9c49dfe9c7@epcas1p4.samsung.com>
 <3c14d978f772b706f98158a1e6d0faac9c92f7c9.1555938376.git.mchehab+samsung@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1557150055;
 bh=BhJSsfUlBYUeX6HHjMSaBwQYbzGepJg/qRNr5jUyxU4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=EwMgmO9+Fju1fJA+nnrv+Cbsl/iNH6FzZAasDxhzcVdL+UlNBwNOKxEdb40Ym+85c
 J4SL/WBOmjIG32yyuN8sJLktOpiUhCSKwxUf+FC0D6GTPSv8H11KhYVLosj118F5vJ
 RORdrWqTcXqXWQ4AvGAHcJHDOnAupOUklx+akEI0=
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
Cc: linux-fbdev@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Bernie Thompson <bernie@plugable.com>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Maik Broemme <mbroemme@libmpq.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Michal Januszewski <spock@gentoo.org>, Jiri Slaby <jslaby@suse.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA0LzIyLzIwMTkgMDM6MjcgUE0sIE1hdXJvIENhcnZhbGhvIENoZWhhYiB3cm90ZToKPiBU
aGUgY29udmVyc2lvbiBpcyBhY3R1YWxseToKPiAgIC0gYWRkIGJsYW5rIGxpbmVzIGFuZCBpZGVu
dGF0aW9uIGluIG9yZGVyIHRvIGlkZW50aWZ5IHBhcmFncmFwaHM7Cj4gICAtIGZpeCB0YWJsZXMg
bWFya3VwczsKPiAgIC0gYWRkIHNvbWUgbGlzdHMgbWFya3VwczsKPiAgIC0gbWFyayBsaXRlcmFs
IGJsb2NrczsKPiAgIC0gYWRqdXN0IHRpdGxlIG1hcmt1cHMuCj4gCj4gQXQgaXRzIG5ldyBpbmRl
eC5yc3QsIGxldCdzIGFkZCBhIDpvcnBoYW46IHdoaWxlIHRoaXMgaXMgbm90IGxpbmtlZCB0bwo+
IHRoZSBtYWluIGluZGV4LnJzdCBmaWxlLCBpbiBvcmRlciB0byBhdm9pZCBidWlsZCB3YXJuaW5n
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ft
c3VuZ0BrZXJuZWwub3JnPgoKQWNrZWQtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIu
em9sbmllcmtpZUBzYW1zdW5nLmNvbT4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xu
aWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25p
Y3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
