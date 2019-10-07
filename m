Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EE8CDC19
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373876E47B;
	Mon,  7 Oct 2019 07:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43AE6E082
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 09:33:56 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.114.140]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MIvbh-1iEa4s2gYr-002VfF; Sun, 06
 Oct 2019 11:33:27 +0200
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
Subject: Re: drm/imx: Checking a kmemdup() call in imx_pd_bind()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Message-ID: <540321eb-7699-1d51-59d5-dde5ffcb8fc4@web.de>
Date: Sun, 6 Oct 2019 11:33:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191004190938.15353-1-navid.emamdoost@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:9mEhHApvRLSLfrVaidVTASDIrRouu2LbdOnMIG6rWYMu+pdZgaW
 5LqTf5uN+peDd18uYxVPSaX1UbVhdoHy+aNcFMD7UZrSxUAUxm9V4k5RSP3Z7pL+utgAZi2
 kuBf7x5SZy/EWuRyYAmjXAb+7hMyfuBPd4/FdT+aOmA3LmjLCkmMftGwGedLMgAXEbQQaYk
 fFbvqe2eSc2BO0/zn0CEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+9qyh83oa28=:N9o4qbfKfvNblikgOLzyCp
 0Se1VG1t4md6rQ6Nl625v5sh814b5FaDF23ulz77km7/bFAUf0NIbOt/MMjXNLoCnS9WtPM7E
 dR9/+ei+o8SQlLkjPESQDY4mEY4SaqnD/eMZNTQz26Vtytsw2lFAyZb448W2O3zAEB5b5GuYx
 rPl6fMWiNLKs2alIqajdE9ZlnyDVC6xFSOcDjw0JzE3clgyKHOxfycDMoVtnAiN5aRMB/aWti
 ASCzWO660viQUg/0hAOGl0Iq3IzkKtZ9LPX+oRVXFG5nJWzFkr4ek7P/SobEQPGpB3kYUcYDm
 Pa3wYIWejcdaUO+yC0lq539DYUsXZ8z5Zw8GM5FSMA8564B7cRG4zsOvUQ72YcR6icQN+DNpF
 axHeD0H7U1dm5CixzDve8rH2I2NB3vFoZ4maN5kRUG1rt2LIclxGlDL5ckJOGcWC6BSf5U5yd
 SorcFi+PSf3rUey2bwMVgvoxc6Ot2QuosO8R3btSQ5OnUUSRxIPK2Z/OLV0j1aXjdPejTHUyn
 iWJIQ1LTsUoGmhLGOJdGWMvmW/Q7OYf47Gwj8smplyR17eTVxTf9iGXSdWqO55ATIFiN8Ww4d
 hMtuNtvSRusAHDXp63XVLVyFcLusYotQRob5YYbBVZZTikpLP2v4VfeqaCsdYJlh/zf3bqZko
 wct5X0DLbe+FYNu+nq8zb13YV42hp9ff0D+3v5HZskLk/WgVR17pcalY7Ow5WLfDbUAPXapPm
 /DQsXDnmh4Iz1swa67N025RZshvAM5fB3rVezNib6P9DfHr8+Gnxm9maBw9CRYhdp68+zcs6v
 tzAckWV6Cdioh2+X6fw1qYIaJWocL6l0xFeaQQhuAwxmZCO21WKEqD+HIpKPghAZ19r2If0Az
 DLdVa1imc45TWCyOwqMHNdKSyQxh8UF4ggNucPYiMjY43bHmRJTQDVxOnPj640PlsTPvrZhFW
 3+lMpMK8+UYla4obNNeZrSM+bLDjon9Zq0zdg/bK8uFfp3oQD7Mu3vclxehQkCbiVEydG80J8
 7Z+mbTxA4d02G3+jrxjiW2wb0/iE4yIf/bcUtPr+Vj5JxtMtlVG3Cb6XH5JaHgpU0LPZm0vYN
 n75vjfvjZAvCzpkUTyoHaASaB2R32EKCR1PTXnVZ3a3kN/ZLTbWL52Jx6ZG21+75o9oGtELFj
 0hS+IINjRiVqgjJXfbBl7FPNht4PSwXSreo39fwqJk5Hx0kWbp019EyRhBiXz/0sjrJkOggc9
 rm4Vk56pbilr2X+W9OLw/qmqOmmGso2XTsEIwhBjFYQ8J+C3pRagmoTmE6zI=
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1570354407;
 bh=NBS72s4G9mNZ3WzMI1DxdaMo0OErlqpG5qmV3BuMlZU=;
 h=X-UI-Sender-Class:Cc:References:Subject:From:To:Date:In-Reply-To;
 b=pZNF06AS/3DMU/K3SM8WQdRnpSQINzwQw1P/I20tfHdcpKf9vScrf4tFZn/y8Y8iD
 pP6nSUvqvEAOOuvw9DuAFbSLXvTbXtr/LCKUVlQwEHadC5T0fMk+EqQstg85j9JmjU
 npEA71wR1jQ7PCzpQ4rK2DUIdb/aOj2yI94IVOfU=
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
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBoYXZlIHRha2VuIGFub3RoZXIgbG9vayBhbHNvIGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0
aGUgZnVuY3Rpb24g4oCcaW14X3BkX2JpbmTigJ0uCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvZ3B1
L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jP2lkPTQzYjgxNWM2YThlN2RiY2NiNWI4YmQ5YzRi
MDk5YzI0YmMyMmQxMzUjbjE5NwpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS40
LXJjMS9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMjTDE5NwoK
Tm93IEkgZmluZCBhbiB1bmNoZWNrZWQgY2FsbCBvZiB0aGUgZnVuY3Rpb24g4oCca21lbWR1cOKA
nSBzdXNwaWNpb3VzLgpXaWxsIHRoaXMgZGV0YWlsIHRyaWdnZXIgZnVydGhlciBzb2Z0d2FyZSBk
ZXZlbG9wbWVudCBjb25zaWRlcmF0aW9ucz8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
