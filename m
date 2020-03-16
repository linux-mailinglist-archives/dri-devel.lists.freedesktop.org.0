Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144BB186120
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 02:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B3D6E09E;
	Mon, 16 Mar 2020 01:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3366E09E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 01:04:52 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200316010450epoutp04431038a51317673147c593ebce6baf60~8o0YgSHIf1057510575epoutp04O
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 01:04:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200316010450epoutp04431038a51317673147c593ebce6baf60~8o0YgSHIf1057510575epoutp04O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584320690;
 bh=HwhpcH1Wgb6cRKyT3zCXEk0XyA2XROaQct1qZ62tPqk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=HXeeCx9YUILoqDFxtqv1VRKAW1PxNH/jGoXvq6v833vIfmAFiS5TPxXTSDYS4mK7C
 Q/LdZRCRiqvMgSHz+1Q4GIs3AVS9DeMpMatHpDeS0yrkHLT//khUTuv4EEFQsitLzJ
 oilkG9Y63thAMAYvEkJkQlSdSXRXhVn5nMuunmL0=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200316010450epcas1p2c54911c0d4480b61501db29f37a7731d~8o0YOTEHb1982019820epcas1p2K;
 Mon, 16 Mar 2020 01:04:50 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.154]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48gdPW0LBczMqYkj; Mon, 16 Mar
 2020 01:04:47 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 63.B3.04074.BA0DE6E5; Mon, 16 Mar 2020 10:04:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d~8o0RvO4Bl1042510425epcas1p3i;
 Mon, 16 Mar 2020 01:04:43 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200316010443epsmtrp11b02a751c320248b02cef03005016049~8o0RuoYam2938029380epsmtrp1Q;
 Mon, 16 Mar 2020 01:04:43 +0000 (GMT)
X-AuditID: b6c32a39-58bff70000000fea-a1-5e6ed0ab35c9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4E.FF.04158.BA0DE6E5; Mon, 16 Mar 2020 10:04:43 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200316010443epsmtip120d86e92784c8ea045d5fc650742ad2c~8o0Rl-g1d0278702787epsmtip1y;
 Mon, 16 Mar 2020 01:04:43 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie
Subject: [GIT PULL] exynos-drm-next
Date: Mon, 16 Mar 2020 10:09:17 +0900
Message-Id: <1584320957-9442-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAKsWRmVeSWpSXmKPExsWy7bCmvu7qC3lxBsc+q1j0njvJZHHl63s2
 ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
 DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
 LAv0ihNzi0vz0vWS83OtDA0MjEyBChOyM+5cfctesE6w4uI5rwbGbXxdjJwcEgImEg+W7mfs
 YuTiEBLYwSjRsHQrG4TziVFi7aYD7BDON0aJF/PfMsO0LHz+nBUisZdR4uLOk8wQzhdGiZ07
 nzGBVLEJqEpMXHGfDcQWERCROL7sL5jNLOAm8WfpWRYQW1hAWWL39X2sIDYLUP3WNbcYQWxe
 AWeJrncQtoSAnMTNc53MEHFBiZMzn7BAzJGXaN46G2yxhEAHm8Tkhp0sEA0uEhMevWSCsIUl
 Xh3fwg5hS0m87G9jh2hoZpSYOOM0E1Q3o8Tdx9ehuo0l9i+dDJTgAFqhKbF+lz5EWFFi5++5
 jBCb+STefe1hBSmREOCV6GgTgihRkjh28QbU0RISF5ZMZIOwPSTmP9gPdo+QQKzEgUPXWSYw
 ys9C8s8sJP/MQli8gJF5FaNYakFxbnpqsWGBKXK0bmIEpzYtyx2Mx875HGIU4GBU4uGVSMuL
 E2JNLCuuzD3EKMHBrCTC21GTHSfEm5JYWZValB9fVJqTWnyI0RQY3BOZpUST84FpN68k3tDU
 yNjY2MLE0MzU0FBJnHfq9Zw4IYH0xJLU7NTUgtQimD4mDk6pBsazZtWn3bjKrnz9phr/LvB/
 zouZLuaPZa/+9n1kLnOpfurnKnWl0ujA+k92D1yLNtv/q9oWySt6staeveP7mu8te7c7tj17
 EOOaJDc9rL+Vc1nfF66Q6SqMO/4VHXv6YQ/Py3yTlNLWBv5ZRjP1rjsu+NBkW+t7PFxH503D
 feFNE/o+GiqZNSuxFGckGmoxFxUnAgBQ5rPmgwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsWy7bCSnO7qC3lxBs87uC16z51ksrjy9T2b
 xYzz+5gcmD22f3vA6nG/+ziTx+dNcgHMUVw2Kak5mWWpRfp2CVwZd66+ZS9YJ1hx8ZxXA+M2
 vi5GTg4JAROJhc+fs3YxcnEICexmlPi3pJWpi5EDKCEhsWUrB4QpLHH4cDFEySdGib7Vl1lB
 etkEVCUmrrjPBmKLCIhIHF/2F8xmFvCQeL9nNTuILSygLLH7+j6wehag+q1rbjGC2LwCzhJd
 7yBsCQE5iZvnOpkh4oISJ2c+YQHZyyygLrF+nhDESHmJ5q2zmScw8s9CUjULoWoWkqoFjMyr
 GCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCA1JLawfjiRPxhxgFOBiVeHgl0vLihFgT
 y4orcw8xSnAwK4nwdtRkxwnxpiRWVqUW5ccXleakFh9ilOZgURLnlc8/FikkkJ5YkpqdmlqQ
 WgSTZeLglGpgdEvyabo5neWK5rozLEq3y1zWrZ5yl4GH5d3Gtgu359724DXJPrrvE/tbpWdb
 tm89mhvcJ7wm24YjdtPWKw6Jf+3bFyxYr6rEO99DL+zjsUwbY6fu/cuyHvr5xlWvOe+8v55h
 z4/g1TOm+4p7vFbhaBJb8+LeoabiODG1dEfdrEscTFaXz17pU2Ipzkg01GIuKk4EADd5eFJE
 AgAA
X-CMS-MailID: 20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d
References: <CGME20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d@epcas1p3.samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CUp1c3QgdHdvIGNsZWFudXBzIC0gb25lIGlzIHRvIG1hc2sgZW5jb2RlciBiaXRtYXNrIHVzaW5n
Cglkcm1fZW5jb2Rlcl9tYXNrKCksIGFuZCBvdGhlciBpcyB0byB1c2UgbW9kZS0+Y2xvY2sKCWlu
c3RlYWQgb2YgY2FsY3VsYXRpbmcgaXQgYWdhaW4uCgoJUGxlYXNlIGtpbmRseSBsZXQgbWUga25v
dyBpZiB0aGVyZSBpcyBhbnkgcHJvYmxlbS4KClRoYW5rcywKSW5raSBEYWUKClRoZSBmb2xsb3dp
bmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNjlkZGNlMDk3MGQ5ZDFkZTYzYmVkOWMyNGVlZmEwODE0
ZGIyOWE1YToKCiAgTWVyZ2UgdGFnICdhbWQtZHJtLW5leHQtNS43LTIwMjAtMDMtMTAnIG9mIGdp
dDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4IGludG8gZHJtLW5leHQgKDIw
MjAtMDMtMTMgMDk6MDk6MTEgKzEwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBnaXQgcmVwb3Np
dG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2RhZWlua2kvZHJtLWV4eW5vcyB0YWdzL2V4eW5vcy1kcm0tbmV4dC1mb3ItdjUuNwoKZm9yIHlv
dSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDBjOWE2MDljYTQ0NDI5OGU0MzhlZTljNmRhYWY1M2Mx
NDI3N2YxYWQ6CgogIGRybS9leHlub3M6IFVzZSBtb2RlLT5jbG9jayBpbnN0ZWFkIG9mIHJldmVy
c2UgY2FsY3VsYXRpbmcgaXQgZnJvbSB0aGUgdnJlZnJlc2ggKDIwMjAtMDMtMTYgMDk6NTA6Mjgg
KzA5MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tClR3byBjbGVhbnVwcwouIFJlcGxhY2UgdGhlIGhhbmQgcm9sbGVkIGVu
Y29kZXIgYml0bWFzayB0aGluZyB3aXRoIGRybV9lbmNvZGVyX21hc2soKQouIFVzZSBtb2RlLT5j
bG9jayBpbnN0ZWFkIG9mIHJldmVyc2UgY2FsY3VsYXRpbmcgaXQgZnJvbSB0aGUgdnJlZnJlc2gK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KSW5raSBEYWUgKDEpOgogICAgICBNZXJnZSB0YWcgJ2V4eW5vcy1kcm0tZml4ZXMt
Zm9yLXY1LjYtcmM1LXYyJyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy8uLi4vZGFlaW5raS9kcm0t
ZXh5bm9zIGludG8gZXh5bm9zLWRybS1uZXh0CgpNYXJlayBTenlwcm93c2tpICgxKToKICAgICAg
ZHJtL2V4eW5vczogRml4IGNsZWFudXAgb2YgSU9NTVUgcmVsYXRlZCBvYmplY3RzCgpWaWxsZSBT
eXJqw6Rsw6QgKDIpOgogICAgICBkcm0vZXh5bm9zOiBVc2UgZHJtX2VuY29kZXJfbWFzaygpCiAg
ICAgIGRybS9leHlub3M6IFVzZSBtb2RlLT5jbG9jayBpbnN0ZWFkIG9mIHJldmVyc2UgY2FsY3Vs
YXRpbmcgaXQgZnJvbSB0aGUgdnJlZnJlc2gKCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
czU0MzNfZHJtX2RlY29uLmMgfCAgNSArKystLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3M3X2RybV9kZWNvbi5jICAgIHwgIDcgKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX2RtYS5jICAgICAgIHwgMjggKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMgICAgICAgfCAgNSArKy0tLQog
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5oICAgICAgIHwgIDYgKysrKy0t
CiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltYy5jICAgICAgfCAgNSArKyst
LQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYyAgICAgIHwgIDUgKysr
LS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYyAgICAgICB8ICA1ICsr
Ky0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ3NjLmMgICAgICAgfCAgNSAr
KystLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3JvdGF0b3IuYyAgIHwgIDUg
KysrLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9zY2FsZXIuYyAgICB8ICA2
ICsrKystLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYyAgICAgICAgIHwg
IDcgKysrKystLQogMTIgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRp
b25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
