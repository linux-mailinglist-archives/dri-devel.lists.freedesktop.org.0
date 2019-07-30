Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE277AA04
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5E089B4D;
	Tue, 30 Jul 2019 13:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76BC89B4D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:47:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 26A5021B74;
 Tue, 30 Jul 2019 09:47:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 30 Jul 2019 09:47:39 -0400
X-ME-Sender: <xms:eUpAXYuc_C2b661sgAmt2hNHqq4trdfXQtFqHRlE5VoxnD3GHOHfAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleefgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhuffvjgfkffgfgggtgfesthekredttdefjeenucfhrhhomheplfgrnhgpufgv
 sggrshhtihgrnhgpifpnthhtvgcuoehlihhnuhigsehjrghsvghgrdhnvghtqeenucfkph
 epiedtrdejuddrieefrdejheenucfrrghrrghmpehmrghilhhfrhhomheplhhinhhugies
 jhgrshgvghdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:eUpAXa-o9q3SBouyW__OkTaIUhfbEG7Sa32D9Yomvl_MIFz3YBadIg>
 <xmx:eUpAXcGjAVNkbCJ20Yru4iN1bd-mi-eglpiEnvCahetnywZD2HC8Pw>
 <xmx:eUpAXZTedMDQu-vGsIuCPkix2no6hhrE2rSmr9kzIBhp1gocDOOgMQ>
 <xmx:e0pAXSIkTxK-kahb7LL8IFgImFCB7jDl-ivGz2-BMlaJnHto9MTcxA>
Received: from [10.137.0.16] (softbank060071063075.bbtec.net [60.71.63.75])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9508180065;
 Tue, 30 Jul 2019 09:47:36 -0400 (EDT)
From: =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>
Subject: [PATCH 1/6] drm: tiny: gdepaper: add TINYDRM_GDEPAPER config option
To: dri-devel@lists.freedesktop.org
In-Reply-To: <3c8fccc9-63f7-18bb-dcb5-dcd0b9e151d2@jaseg.net>
Message-ID: <c802bc16-260a-d3d0-5f6a-a384ec4f47ed@jaseg.net>
Date: Tue, 30 Jul 2019 22:47:34 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jaseg.net; h=
 from:subject:to:cc:in-reply-to:message-id:date:mime-version
 :content-type:content-transfer-encoding; s=fm3; bh=uCERNq3R8GWVB
 iCt+rRgY2nM3IgsJiZuVTvKUacRcs4=; b=Wjq77XUvuTNsV8WNY9Sw+08BdXTYC
 nvLLfnwncUSjNNLSO8UhdHAnhLLgOCqO/5pX38RuLPSyWzvBive6qXESszBF+Cqb
 CWm+uaXRZ4lFEDdz2SL7aRGnXnfjfDCOwrOBPMFJMXkQ9bX7uqYgSu6zMPC69KAH
 WaA3qwBUhvlidbKb1gbdKoMGiSWpj06jSzcsmoMX2P3JrIOmd2xqjdZ04NBVIiC3
 emglnnHi1o6kaMzALOMNUX1PvSGJAfuS6sNDpYxjn3gzf6Y79qj9SqB2pKAB22Jd
 Pa/NdBmOvByIa5s/6vD5sGteS3SksXq62ISJoQIw+k0A7VgKwgBkDe4iQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=uCERNq3R8GWVBiCt+rRgY2nM3IgsJiZuVTvKUacRcs4=; b=JZ99dsGF
 qMNfUSnOy7MLFVkn1k5k7pl3RtAom/7wUagEstu2ctxUnacuJ7qyhxCeLtek2yzf
 ddeEOL9MI7t4GjQ0TCjVVyVadKoqsB90RRSmJP6QsqgAXIbyxjRO8FoLNDH0oEoJ
 lyeuxGcpHFUv4ToHtz/Qn2u/CP8fl1iVNEZ0OTxfud9BRswq4eXr1S4dvbAyk5Uy
 C77C1qPb2mwfGnYs+lnyBubJ7Jv3uPtmjVk6PsOShKsCGvQh91/Fngze92L/ydeA
 r6qOe4L5Cw63c7XfYCROpiHVzmYGy6ErQpdoTgQ574l1evwJ8wVnjI6QRBQYSx4h
 5b+vNxfpA9yhAQ==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogSmFuIFNlYmFzdGlhbiBHw7Z0dGUgPGxpbnV4QGphc2VnLm5ldD4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9LY29uZmlnICB8IDEwICsrKysrKysrKysKIGRyaXZl
cnMvZ3B1L2RybS90aW55ZHJtL01ha2VmaWxlIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZp
ZyBiL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL0tjb25maWcKaW5kZXggODc4MTljODJiY2NlLi40
MjdkMWU2MmU2M2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL0tjb25maWcK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZpZwpAQCAtNjUsNiArNjUsMTYgQEAg
Y29uZmlnIFRJTllEUk1fUkVQQVBFUgogCiAJICBJZiBNIGlzIHNlbGVjdGVkIHRoZSBtb2R1bGUg
d2lsbCBiZSBjYWxsZWQgcmVwYXBlci4KIAorY29uZmlnIFRJTllEUk1fR0RFUEFQRVIKKwl0cmlz
dGF0ZSAiRFJNIHN1cHBvcnQgZm9yIEdvb2QgRGlzcGxheSBFLVBhcGVyIERpc3BsYXkiCisJZGVw
ZW5kcyBvbiBEUk1fVElOWURSTSAmJiBTUEkKKwlzZWxlY3QgVElOWURSTV9NSVBJX0RCSQorCWhl
bHAKKwkgIERSTSBkcml2ZXIgZm9yIHRoZSBmb2xsb3dpbmcgR29vZCBEaXNwbGF5IEUtUGFwYXIg
ZGlzcGxheXM6CisJICAqIEdERVcwMjdDNDQgZGlzcGxheSAoMi43IGluY2gpCisKKwkgIElmIE0g
aXMgc2VsZWN0ZWQgdGhlIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCBnZGVwYXBlci4KKwogY29uZmln
IFRJTllEUk1fU1Q3NTg2CiAJdHJpc3RhdGUgIkRSTSBzdXBwb3J0IGZvciBTaXRyb25peCBTVDc1
ODYgZGlzcGxheSBwYW5lbHMiCiAJZGVwZW5kcyBvbiBEUk1fVElOWURSTSAmJiBTUEkKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJt
L3Rpbnlkcm0vTWFrZWZpbGUKaW5kZXggNDhlYzhlZDlkYzE2Li43MGY3OGM4YWIyNmUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS90aW55ZHJtL01ha2VmaWxlCkBAIC0xMCw1ICsxMCw2IEBAIG9iai0kKENPTkZJR19USU5Z
RFJNX0lMSTkyMjUpCQkrPSBpbGk5MjI1Lm8KIG9iai0kKENPTkZJR19USU5ZRFJNX0lMSTkzNDEp
CQkrPSBpbGk5MzQxLm8KIG9iai0kKENPTkZJR19USU5ZRFJNX01JMDI4M1FUKQkJKz0gbWkwMjgz
cXQubwogb2JqLSQoQ09ORklHX1RJTllEUk1fUkVQQVBFUikJCSs9IHJlcGFwZXIubworb2JqLSQo
Q09ORklHX1RJTllEUk1fR0RFUEFQRVIpCQkrPSBnZGVwYXBlci5vCiBvYmotJChDT05GSUdfVElO
WURSTV9TVDc1ODYpCQkrPSBzdDc1ODYubwogb2JqLSQoQ09ORklHX1RJTllEUk1fU1Q3NzM1UikJ
CSs9IHN0NzczNXIubwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
