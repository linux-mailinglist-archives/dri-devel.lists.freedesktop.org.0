Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEECE2AAF4E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 03:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB42C892D2;
	Mon,  9 Nov 2020 02:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD87B892D2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 02:17:27 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201109021725epoutp037c2f83c9c314a633a5f35bf6c39363e6~FtVtJBrnV1466714667epoutp03b
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 02:17:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201109021725epoutp037c2f83c9c314a633a5f35bf6c39363e6~FtVtJBrnV1466714667epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604888245;
 bh=GdZ3kpFsfFHZgYVX7DnIRuZtVyD7hKJ6UCvQcYxuNHo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=UbARA/R6sehtDEUoTlU6OyyAHfaZRpYdVkJsW/RdDR5Lt45KhtvNOHGN5SpR0/+Se
 rqY0q9DO3cdBNhT80RMx1Q0lWIHOxqU0cGfroPnEo3M0ste1PjCRYwKqb/1mkUR2sA
 62ocf78FkxSt/R70RWzVmh3/Y1RXtxhhJQNI5ah4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201109021724epcas1p21ee4582e75ec42f1c9780efc743de7a2~FtVsPtGOy1901519015epcas1p2C;
 Mon,  9 Nov 2020 02:17:24 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.152]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4CTvlR0d9qzMqYkg; Mon,  9 Nov
 2020 02:17:23 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 36.A5.09582.0B6A8AF5; Mon,  9 Nov 2020 11:17:20 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201109021720epcas1p1ad062afcbb0f4542933298bbd4fdf74a~FtVn602dv1912019120epcas1p1s;
 Mon,  9 Nov 2020 02:17:20 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201109021720epsmtrp1a2a547b68720a702aee663b713a58900~FtVn6CgEG1135411354epsmtrp1u;
 Mon,  9 Nov 2020 02:17:20 +0000 (GMT)
X-AuditID: b6c32a37-899ff7000000256e-e7-5fa8a6b07017
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B5.BB.08745.0B6A8AF5; Mon,  9 Nov 2020 11:17:20 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201109021720epsmtip190846264496f8a2443971f13d8f429ef~FtVnqLMyT1779217792epsmtip1y;
 Mon,  9 Nov 2020 02:17:20 +0000 (GMT)
Subject: Re: [PATCH v2 03/16] drm/exynos: use exynos_dsi as drvdata
To: Sam Ravnborg <sam@ravnborg.org>, Michael Tretter <m.tretter@pengutronix.de>
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <cce25c2b-5902-d267-4b1e-fd95b6f8a091@samsung.com>
Date: Mon, 9 Nov 2020 11:24:41 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20201107222425.GC1052534@ravnborg.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJJsWRmVeSWpSXmKPExsWy7bCmru6GZSviDY7eUra4te4cq8XGGetZ
 La58fc9m8eLeRRaLVVN3slicP7+B3aJz4hJ2ixnn9zFZbFsBVHeoL9pixc+tjBYzJr9ks5j3
 eSeTA6/H+xut7B47Z91l95jdMZPVY9OqTjaP+93HmTz6/xp4LJl2lc2jb8sqRo/Pm+QCOKOy
 bTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOAzlZSKEvM
 KQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFFgW6BUn5haX5qXrJefnWhkaGBiZAhUmZGf8
 fd/DVPCKueLTjqtsDYxNzF2MnBwSAiYSZ5+8BrK5OIQEdjBKHJjfBeV8YpT4NmkFlPOZUWJ1
 fzs7TMuRCa+ZIBK7GCWaH9+Ect4zSuw8NZsRpEpYwFli1f1eMFtEIFDi1ONbYAuZBTYwSWy+
 ZgFiswmoSkxccZ+ti5GDg1fATqJrhiRImEVAReLbo/tgraICERLHuyeDLeYVEJQ4OfMJC4jN
 CXTEq8O3GCFGikvcejKfCcKWl2jeOhvsagmBCxwSvTO6WCCudpGYcHwyK4QtLPHq+Baob6Qk
 Xva3sUM0NDNKTJxxmgnC6WCUuPv4OlS3scT+pZOZQC5lFtCUWL9LHyKsKLHz91yoK/gk3n3t
 YQUpkRDglehoE4IoUZI4dvEGI4QtIXFhyUQ2CNtD4uaZzYwTGBVnIfltFpJ/ZiH5ZxbC4gWM
 LKsYxVILinPTU4sNC4yRo3sTIzhNa5nvYJz29oPeIUYmDsZDjBIczEoivC0uy+KFeFMSK6tS
 i/Lji0pzUosPMZoCQ3sis5Rocj4wU+SVxBuaGhkbG1uYGJqZGhoqifP+0e6IFxJITyxJzU5N
 LUgtgulj4uCUamB6kB+w3npPwQppw8Mdxds3ftCPPOXInXsw5OOsCvXbiRdLShfl3OXO/73N
 9k5L59ZFh6ztvexCmw5uX3xIZr/7Blatd4bsnheXyXxse/eYyVFkW3mbxZtNvfeuc1517q/2
 CtDn55norcx3a9srv5CrzVLnEpasVCje+5hRasrZtM1HynfXhPE22Zd8EmN4EpvhEHdxzQKW
 x0dc1Vd/Y1OPuPLar3DCLqvvO1v4ewxy8ow/H7rDpujZ+6SIhW1m0pJc3XzBXv+1YUIzDga8
 3a94ueO6RdaC/YZFLTNzTNJ051kFh7UqTC46EvWz3OOvq5208aSPBgdDmi4HvF/evzqpLL1a
 a+Msvh9J9dvUlyixFGckGmoxFxUnAgCT+xYJXAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsWy7bCSnO6GZSviDbbf5ba4te4cq8XGGetZ
 La58fc9m8eLeRRaLVVN3slicP7+B3aJz4hJ2ixnn9zFZbFsBVHeoL9pixc+tjBYzJr9ks5j3
 eSeTA6/H+xut7B47Z91l95jdMZPVY9OqTjaP+93HmTz6/xp4LJl2lc2jb8sqRo/Pm+QCOKO4
 bFJSczLLUov07RK4Mv6+72EqeMVc8WnHVbYGxibmLkZODgkBE4kjE14zdTFycQgJ7GCU6F8y
 l6WLkQMoISGxZSsHhCkscfhwMUTJW0aJdw0TWUB6hQWcJVbd72UEsUUEAiVami6DxZkFNjBJ
 7F+RCtHwmVHi5edesGVsAqoSE1fcZwMZyitgJ9E1QxIkzCKgIvHt0X2wOaICERIt9/+wg9i8
 AoISJ2c+AZvJCXTnq8O3GCHmq0v8mXeJGcIWl7j1ZD4ThC0v0bx1NvMERqFZSNpnIWmZhaRl
 FpKWBYwsqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxgmNSS2sH455VH/QOMTJxMB5i
 lOBgVhLhbXFZFi/Em5JYWZValB9fVJqTWnyIUZqDRUmc9+ushXFCAumJJanZqakFqUUwWSYO
 TqkGptzqyRLvXkxXnLTxjk+jrnLFJYmjMW93GVgc1gp7v/ezneeJ9ynbHv2xt/cUKor/+n2y
 52x+k9fXBEUeX53y89wXo0nvlB0nRGs5Zs6tPNHQ1LbwcensY43Gpt+neTJP1phqkc8x8/jE
 ewHNz2YJMin8czJ/F5Dtb8M4Rf128CaZdT3KXB/TDsZlTZ69OMFHyJeLLcQge/VTVeFAh6Y7
 sTpTD1mdCJ7MGFAS8jEs2+2Lx3POSK5TfyecX7AyjKU8L0Ol9ZL8g4C7U1ZPj92f4/Ric//t
 /DMsR5TX8nXYH7F6dYCpwtnYVqHT+uiidjkxId/QI7GLVTqvLN5xOEgq1Chi4YKvTo+lcvwc
 XnRxKbEUZyQaajEXFScCAN8M3eI4AwAA
X-CMS-MailID: 20201109021720epcas1p1ad062afcbb0f4542933298bbd4fdf74a
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201107222432epcas1p3fa1c76cd2a4f4687e117cbcbf7bd90d6
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <20200911135413.3654800-4-m.tretter@pengutronix.de>
 <CGME20201107222432epcas1p3fa1c76cd2a4f4687e117cbcbf7bd90d6@epcas1p3.samsung.com>
 <20201107222425.GC1052534@ravnborg.org>
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
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 narmstrong@baylibre.com, b.zolnierkie@samsung.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, krzk@kernel.org,
 kernel@pengutronix.de, sylvester.nawrocki@gmail.com,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoyMC4gMTEuIDguIOyYpOyghCA3OjI07JeQIFNhbSBSYXZuYm9yZyDsnbQo6rCAKSDsk7Qg6riA
Ogo+IE9uIEZyaSwgU2VwIDExLCAyMDIwIGF0IDAzOjU0OjAwUE0gKzAyMDAsIE1pY2hhZWwgVHJl
dHRlciB3cm90ZToKPj4gVXNlIHRoZSBleHlub3NfZHNpIGFzIGRydmRhdGEgaW5zdGVhZCBvZiB0
aGUgZW5jb2RlciB0byBmdXJ0aGVyIGRlY291cGxlCj4+IHRoZSBkcml2ZXIgZnJvbSB0aGUgZW5j
b2Rlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBUcmV0dGVyIDxtLnRyZXR0ZXJAcGVu
Z3V0cm9uaXguZGU+Cj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KPiAKPiBMaWtld2lzZSwgdGhlIGV4eW5vcyBwZW9wbGUgYXJlIGV4cGVjdGVkIHRvIHBpY2sg
dGhpcyB1cC4KCkNsZWFudXAgcGF0Y2ggc28gcGlja2VkIGl0IHVwLgoKVGhhbmtzLApJbmtpIERh
ZQoKCj4gCj4gCVNhbQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
