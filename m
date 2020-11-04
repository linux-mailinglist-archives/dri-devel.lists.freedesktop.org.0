Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD5F2A61D9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 11:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6076E998;
	Wed,  4 Nov 2020 10:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F7D6E998
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 10:37:38 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20201104103727euoutp021a57372f56f8ca241ce058d9ede3abee~ER73CTTi12966029660euoutp02f
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 10:37:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20201104103727euoutp021a57372f56f8ca241ce058d9ede3abee~ER73CTTi12966029660euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604486247;
 bh=/FRHhipH0++LZ7DwDFHNxX1ifPoUb6bj7wyOz1N82q4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HNQcZCe0y2+pAHCThcumYv9rCGue5y3A5TbQNAZ3KHewmWhnIY50IbVEWgvDDM+UC
 M16I9OvnLUa5wP7fIPhfiJYPIYKi7qPqYceBfN6SJgzC4InYauMzOD8A56tuFWW/Uu
 Uc0aigxZrFvaYXnwgkIBTvS18b+sMuBVGriOgKMc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201104103727eucas1p1419756f7d67f72df4b1596005e515ba6~ER72xAL3m2673626736eucas1p11;
 Wed,  4 Nov 2020 10:37:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 4A.8F.06456.76482AF5; Wed,  4
 Nov 2020 10:37:27 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201104103726eucas1p248b51b25f5ee42898bf03e9cb2229c5d~ER72YMUwJ1141511415eucas1p2m;
 Wed,  4 Nov 2020 10:37:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201104103726eusmtrp15b3c784d0eb581c0cc5c77f1693c7036~ER72XcegN0620706207eusmtrp1C;
 Wed,  4 Nov 2020 10:37:26 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-1c-5fa28467056e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 67.64.06017.66482AF5; Wed,  4
 Nov 2020 10:37:26 +0000 (GMT)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201104103726eusmtip2cbd0e037625fc6dd810c4dccea497dee~ER71orAeJ1010110101eusmtip2k;
 Wed,  4 Nov 2020 10:37:26 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: georgi.djakov@linaro.org, cw00.choi@samsung.com, krzk@kernel.org
Subject: [PATCH v8 5/7] ARM: dts: exynos: Add interconnect properties to
 Exynos4412 bus nodes
Date: Wed,  4 Nov 2020 11:36:55 +0100
Message-Id: <20201104103657.18007-6-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104103657.18007-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjmO7cdpSPHdXuxSBoFJZVKBR8k5Q0ZUhj96EdWa9VhWZvGjmYa
 ZLE00xTRUDM1KytbpDbXkJUybF7KG1prmdWE7F5aeQEzZs6j5b/nfZ/n+d7ngY8l5Q7aj42L
 TxT08WqtgvGmLC0TXes1566rgmqzOOwqT0f4fnENjZ2jH2l81d5F4+djwwwuajAxON+VR+Hu
 7loZNr17QeNn1lIGj+TYES7ubiTwPfsbGe4/W8Xg9Aa7DD/+dp7GxQWfmVBfpcl4gVG+fvGI
 UbqyWwllXWWaMtdsRMoR04qdzB7vkMOCNu6EoA/cesD7SKejmj5u5k8WOHLRGXSVy0JeLPCb
 oM5pIzxYzlchaCk9lYW8p/EogrIiKyENIwh+ljvQnGPyxx2ZRNxGYO2tYP5ZpqqHZB4VwwdD
 TnPujGMRHwkZ78spj4jkM0mw1OeTHmIhrwK30zljoPjVcNv8kM5CLMvxW6DUcFS65g93a20z
 ci8+BHpGDDNyjveFJ5cHKQ8mpzWGB1dIz/vAT8igwXSfksyR0DjQQUt4IXxpNcskvBzaCy5S
 ksGA4OLDfpk05CFwtVbMFt0Cr7t+M55EJL8WaqyB0joM6ly3CM8aeB94+d1XCuED+ZYiUlpz
 kJkhl9SrYNJYREjYD7IHp2ajKeHmuJvIQytL5tUpmVen5P/dCkQa0VIhSdRpBDE4XkjeIKp1
 YlK8ZsOhBJ0JTX+2dnfrr3o01nuwCfEsUizgbJZrKjmtPiGm6JoQsKRiERfe2b5fzh1Wp6QK
 +gSVPkkriE1oGUsplnIbr3/eJ+c16kThmCAcF/RzLMF6+Z1B/lXhm2sSYx2X0t3bQqkYy9Nh
 +3Cnue90yPvnjd8jOnw0bW557GDI28pCh/FVik/dx7KvkRG2gcaYxLxB07qAnvpo7ZrJHanj
 0bvD+nqT28Kao2452e3ronQZv7q3HgpojnpcUVhdMrQkaPEH8QvRZ/WLTN2bVvZn1yctydy4
 m71aQYlH1MEBpF5U/wXJ/8veaAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xe7ppLYviDS5t1re4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbbHp8jdXi8q45bBafe48wWsw4v4/J
 Yu2Ru+wWtxtXsFm07j3CbnH4TTurxYzJL9kcBD02repk87hzbQ+bx/3u40wem5fUe/RtWcXo
 8XmTXABblJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5d
 gl7G2avrWAu2CFRMvtrH2MA4n7eLkZNDQsBE4veHlexdjFwcQgJLGSV2nX0K5HAAJaQk5rco
 QdQIS/y51sUGUfOJUeLH2YdsIAk2AUOJ3qN9jCC2iICHxKnWtawgNrPADGaJ07NMQeYIC8RK
 7NzGBxJmEVCVWL5lNytImFfAWmJOcxbEeHmJ1RsOMIPYnAI2Ehc/N7OD2EJAJYufn2MCsXkF
 BCVOznzCAtLKLKAusX6eEMQieYnmrbOZJzAKzkJSNQuhahaSqgWMzKsYRVJLi3PTc4uN9IoT
 c4tL89L1kvNzNzEC43TbsZ9bdjB2vQs+xCjAwajEw3tg28J4IdbEsuLK3EOMEhzMSiK8TmdP
 xwnxpiRWVqUW5ccXleakFh9iNAX6bCKzlGhyPjCF5JXEG5oamltYGpobmxubWSiJ83YIHIwR
 EkhPLEnNTk0tSC2C6WPi4JRqYFzukXgt4eepbzcY9A75r+7WMqzYsjvwgKJK7x7NF7/M78o9
 MWtZ5PrHKNN+lqlT/sTdgW0Rd4oyz6p+//g2oMtQYQKn7NrI0g1K1bPn7lvVxVO4W2gG/xUH
 jodvfLp/1y3cqX5T4l1HfuqK5knHuvwiv1zkq3q+72ZK6OJFngvm/ecRqfbQUFNiKc5INNRi
 LipOBADta0Q06QIAAA==
X-CMS-MailID: 20201104103726eucas1p248b51b25f5ee42898bf03e9cb2229c5d
X-Msg-Generator: CA
X-RootMTR: 20201104103726eucas1p248b51b25f5ee42898bf03e9cb2229c5d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201104103726eucas1p248b51b25f5ee42898bf03e9cb2229c5d
References: <20201104103657.18007-1-s.nawrocki@samsung.com>
 <CGME20201104103726eucas1p248b51b25f5ee42898bf03e9cb2229c5d@eucas1p2.samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 myungjoo.ham@samsung.com, dri-devel@lists.freedesktop.org,
 s.nawrocki@samsung.com, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllcyBmb3IgRXh5bm9zNDQxMiBp
bnRlcmNvbm5lY3QKYnVzIG5vZGVzOgogLSBpbnRlcmNvbm5lY3RzOiB0byBkZWNsYXJlIGNvbm5l
Y3Rpb25zIGJldHdlZW4gbm9kZXMgaW4gb3JkZXIgdG8KICAgZ3VhcmFudGVlIFBNIFFvUyByZXF1
aXJlbWVudHMgYmV0d2VlbiBub2RlcywKIC0gI2ludGVyY29ubmVjdC1jZWxsczogcmVxdWlyZWQg
YnkgdGhlIGludGVyY29ubmVjdCBmcmFtZXdvcmssCiAtIHNhbXN1bmcsZGF0YS1jbGstcmF0aW86
IHdoaWNoIGFsbG93cyB0byBzcGVjaWZ5IG1pbmltdW0gZGF0YSBjbG9jawogICBmcmVxdWVuY3kg
Y29ycmVzcG9uZGluZyB0byByZXF1ZXN0ZWQgYmFuZHdpZHRoIGZvciBlYWNoIGJ1cy4KCk5vdGUg
dGhhdCAjaW50ZXJjb25uZWN0LWNlbGxzIGlzIGFsd2F5cyB6ZXJvIGFuZCBub2RlIElEcyBhcmUg
bm90CmhhcmRjb2RlZCBhbnl3aGVyZS4KClNpZ25lZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxh
LnN3aWdvbkBzYW1zdW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVyIE5hd3JvY2tpIDxz
Lm5hd3JvY2tpQHNhbXN1bmcuY29tPgotLS0KQ2hhbmdlcyBmb3Igdjg6CiAtIG5vbmUuCgpDaGFu
Z2VzIGZvciB2NzoKIC0gYWRqdXN0ZWQgdG8gdGhlIERUIHByb3BlcnR5IGNoYW5nZXM6ICJpbnRl
cmNvbm5lY3RzIiBpbnN0ZWFkCiAgIG9mICJzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQiLCAi
c2Ftc3VuZyxkYXRhLWNsay1yYXRpbyIKICAgaW5zdGVhZCBvZiAiYnVzLXdpZHRoIi4KCkNoYW5n
ZXMgZm9yIHY2OgogLSBhZGRlZCBidXMtd2lkdGggcHJvcGVydHkgaW4gYnVzX2RtYyBub2RlLgoK
Q2hhbmdlcyBmb3IgdjU6CiAtIGFkanVzdCB0byByZW5hbWVkIGV4eW5vcyxpbnRlcmNvbm5lY3Qt
cGFyZW50LW5vZGUgcHJvcGVydHksCiAtIGFkZCBwcm9wZXJ0aWVzIGluIGNvbW1vbiBleHlub3M0
NDEyLmR0c2kgZmlsZSByYXRoZXIgdGhhbgogICBpbiBPZHJvaWQgc3BlY2lmaWMgb2Ryb2lkNDQx
Mi1vZHJvaWQtY29tbW9uLmR0c2kuCi0tLQogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5k
dHNpIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kgYi9hcmNoL2FybS9ib290L2R0
cy9leHlub3M0NDEyLmR0c2kKaW5kZXggZTc2ODgxZC4uNDk5OWU2OCAxMDA2NDQKLS0tIGEvYXJj
aC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4
eW5vczQ0MTIuZHRzaQpAQCAtMzgzLDYgKzM4Myw4IEBACiAJCQljbG9ja3MgPSA8JmNsb2NrIENM
S19ESVZfRE1DPjsKIAkJCWNsb2NrLW5hbWVzID0gImJ1cyI7CiAJCQlvcGVyYXRpbmctcG9pbnRz
LXYyID0gPCZidXNfZG1jX29wcF90YWJsZT47CisJCQlzYW1zdW5nLGRhdGEtY2xvY2stcmF0aW8g
PSA8ND47CisJCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+OwogCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKIAkJfTsKIApAQCAtNDUyLDYgKzQ1NCw4IEBACiAJCQljbG9ja3MgPSA8JmNsb2NrIENM
S19ESVZfR0RMPjsKIAkJCWNsb2NrLW5hbWVzID0gImJ1cyI7CiAJCQlvcGVyYXRpbmctcG9pbnRz
LXYyID0gPCZidXNfbGVmdGJ1c19vcHBfdGFibGU+OworCQkJaW50ZXJjb25uZWN0cyA9IDwmYnVz
X2RtYz47CisJCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+OwogCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKIAkJfTsKIApAQCAtNDY4LDYgKzQ3Miw4IEBACiAJCQljbG9ja3MgPSA8JmNsb2NrIENM
S19BQ0xLMTYwPjsKIAkJCWNsb2NrLW5hbWVzID0gImJ1cyI7CiAJCQlvcGVyYXRpbmctcG9pbnRz
LXYyID0gPCZidXNfZGlzcGxheV9vcHBfdGFibGU+OworCQkJaW50ZXJjb25uZWN0cyA9IDwmYnVz
X2xlZnRidXMgJmJ1c19kbWM+OworCQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKIAkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
