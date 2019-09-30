Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F47C1BD8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 08:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC6F6E38A;
	Mon, 30 Sep 2019 06:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx3.ucr.edu (mx3.ucr.edu [138.23.248.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19C389301
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 04:44:22 +0000 (UTC)
IronPort-SDR: A99GeUPY5wnoQYcewGvzvXDLgsPow7Yp62uT4NAlMf3Fzf2AdeRoOR4j+K0/3kHQq63pcRWzTq
 UsG5FPPBH55iAuNuGb29/fIXwxojoeKjHRtxpADr5wyaterYEaKAEVtK1iJSXiSH4SUJswboXI
 2SZtMBD2YI+Y63JRIPeGnUc+SihDRZ/nC2ZhhvxZJfPyOLMpmrf6pvPWqlXy5dATnO5ZlPlKen
 EeblvUV9Paf1Tol5ZdFzV1jO5JCMtzo0SmCOXJMdFucmj4TkEjIBB+2UM3y0Nc+D0VAUrMDIm5
 UaY=
IronPort-PHdr: =?us-ascii?q?9a23=3AYZNnARZvoT6Rd9ZOAbVbVkH/LSx+4OfEezUN45?=
 =?us-ascii?q?9isYplN5qZoMW9bnLW6fgltlLVR4KTs6sC17ON9fy5Ejxcqb+681k6OKRWUB?=
 =?us-ascii?q?EEjchE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAA?=
 =?us-ascii?q?jwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba58IRmsogjdq8YajIhtJ60s1h?=
 =?us-ascii?q?bHv3xEdvhMy2h1P1yThRH85smx/J5n7Stdvu8q+tBDX6vnYak2VKRUAzs6PW?=
 =?us-ascii?q?874s3rrgTDQhCU5nQASGUWkwFHDBbD4RrnQ5r+qCr6tu562CmHIc37SK0/VD?=
 =?us-ascii?q?q+46t3ThLjlTwKPCAl/m7JlsNwjbpboBO/qBx5347Ue5yeOP5ncq/AYd8WWW?=
 =?us-ascii?q?9NU8BUVyxAGYO8dIoPD+wOPe1FsYfzvkYFrRW/BQayAOPg1yJDinv40KEm1u?=
 =?us-ascii?q?gsFxzN0g49ENIUqHnarMv7OrocX+62y6fF1inPY+9M1Dvh8oXEbgwtrPeRVr?=
 =?us-ascii?q?xwa8rRzkwvGhvHgVWRqI3lPy6V1uMQuGWc7+thVOKvhHQmqw1tvjSiyNwhip?=
 =?us-ascii?q?TViYIP0FzL6zh2wJssKNC+VUV1YsakHYNOuy2GM4Z6WMAvTmFytCok17ELto?=
 =?us-ascii?q?S3cDUOxZkl3xLTdv2KfoyS7h79WuucIS10iGxkdb6lhRu//k6twfDmWMauyl?=
 =?us-ascii?q?ZFtC9Fn8HJtnAKyhPc9NCKSuB4/ke9wTaP0B3T6v1cLUA0i6XbL5khz6Y1lp?=
 =?us-ascii?q?UJsETDGjb6mF3yjKOLb0kk9PWk5uDlb7n8qZ+cMIh0ig76MqswgMCwHeM4Mg?=
 =?us-ascii?q?0WU2ia/+SzyqHj8FXnTLlWivA6iKrUvZDAKcgFu6K0DBVZ3psn5hu9Fzum1c?=
 =?us-ascii?q?4XnXgDLFJLYhKHiI3pNknOIfH5DfewmVWsnCt3y/3IJbDhH4nCLmLZnLj/YL?=
 =?us-ascii?q?l99lZQyBAvwtBH+5JUFrYBLeruVU/rtdzUFwI2PBKqw+n5DNVwzYceWWOUAq?=
 =?us-ascii?q?+FK6Peq1GI5vgxLOaSeYAapi39K/s55/7plX81g1gdfbOm3chfRmq/G6FXIl?=
 =?us-ascii?q?eZfH2k1sYTEW4L5lJlZPHhkhuPXSMFNCX6ZL41+jxuUNHuNozEXI34xePZ0Q?=
 =?us-ascii?q?=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FlCQD4hpFdgMXWVdFmHgEGEoFcC4N?=
 =?us-ascii?q?eTBCNHoVxUAEBAQaLJoEJhXqDC4UmgXsBCAEBAQwBAS0CAQGEQIM6IzYHDgI?=
 =?us-ascii?q?DCQEBBQEBAQEBBQQBAQIQAQEJDQkIJ4VCgjopgzULFhVSVj8BBQE1IjmCRwG?=
 =?us-ascii?q?BdhSfDoEDPIwlM4hcAQkNgUgJAQiBIoc1hFmBEIEHhGGEDYNWgkQEgS8BAQG?=
 =?us-ascii?q?NcIcrlkkBBgKCEBSBeJMHJ4Q5iT2LPwEtiiicawIKBwYPI4E2B4IDTSWBbAq?=
 =?us-ascii?q?BRFAQFIIGji0hM4EIjTKCVAE?=
X-IPAS-Result: =?us-ascii?q?A2FlCQD4hpFdgMXWVdFmHgEGEoFcC4NeTBCNHoVxUAEBA?=
 =?us-ascii?q?QaLJoEJhXqDC4UmgXsBCAEBAQwBAS0CAQGEQIM6IzYHDgIDCQEBBQEBAQEBB?=
 =?us-ascii?q?QQBAQIQAQEJDQkIJ4VCgjopgzULFhVSVj8BBQE1IjmCRwGBdhSfDoEDPIwlM?=
 =?us-ascii?q?4hcAQkNgUgJAQiBIoc1hFmBEIEHhGGEDYNWgkQEgS8BAQGNcIcrlkkBBgKCE?=
 =?us-ascii?q?BSBeJMHJ4Q5iT2LPwEtiiicawIKBwYPI4E2B4IDTSWBbAqBRFAQFIIGji0hM?=
 =?us-ascii?q?4EIjTKCVAE?=
X-IronPort-AV: E=Sophos;i="5.64,565,1559545200"; d="scan'208";a="83827057"
Received: from mail-pl1-f197.google.com ([209.85.214.197])
 by smtp3.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2019 21:44:21 -0700
Received: by mail-pl1-f197.google.com with SMTP id 70so4546598ple.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 21:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fhKI7ppyFFBgJ00SzX1cYxWJFEQpwUkMWFBN7vg0cLU=;
 b=i/0P+qWu9HXqHn+14aK4FERHRJxsZ1sYlEtSrsGLRdbRy23cDW4rkcd6fkYLgfjofK
 PSJd1UjQ4KKtbs+Cy+nOPcxYZTgGusRLflVJFpqHDa/9W8Rd+d/AVLJNxmZc5hA9Cl7b
 r8kDhSgwNWBKK49Yi2dWHaBlHtiJnQKkTQ3DHhn9Watc95tR6uB870uphbihjbRooIZb
 oUl+JvcJ+ewU7IdmT+0GLXpZzW+31upMC15Nvsl8t3liFM8QNu00j7rMV9FLtb0GFmEb
 6K9Q6CtX/8hC8RViGCbioiQMIypuZ1MXE650ePxLlM7dNDKuwChGfQjK1zf+jZY05uDg
 BE9A==
X-Gm-Message-State: APjAAAXEfTK8Ho1gVcSuORWoNypUHslnmnutXiMiEgK7NeXdbfsB0MIW
 /YXjH53qkN50QQuxk1F4Sx6L7fZ/HtDd8xJoukwD7qUw7Ayehsnm36JehePjgE+3cKlyAajYkf/
 qsYmK26aYvp79C5lPK9wA5xrySmLRSQ==
X-Received: by 2002:a17:90b:f11:: with SMTP id
 br17mr24362017pjb.80.1569818659822; 
 Sun, 29 Sep 2019 21:44:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBGNdeHonBgOxOoWJY4fFbB5KZPHMDaJknbxcnGpOV7mPBU4cMLjphMacZjFe9cDo/ydTknQ==
X-Received: by 2002:a17:90b:f11:: with SMTP id
 br17mr24362001pjb.80.1569818659475; 
 Sun, 29 Sep 2019 21:44:19 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
 by smtp.googlemail.com with ESMTPSA id
 dw19sm13079001pjb.27.2019.09.29.21.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2019 21:44:18 -0700 (PDT)
From: Yizhuo <yzhai003@ucr.edu>
To: 
Subject: [PATCH] drm/bridge: sii902x: Variable status in
 sii902x_connector_detect() could be uninitialized if regmap_read() fails
Date: Sun, 29 Sep 2019 21:45:02 -0700
Message-Id: <20190930044502.18734-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 30 Sep 2019 06:57:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1569818663; x=1601354663;
 h=from:to:cc:subject:date:message-id;
 bh=0SNQmcerQGYmCZ9l6DTTbRNgRMFVfVHcLeXs0PBRhRA=;
 b=EbRpjPMea6LdHEDPe5bZGq8Qn8pgYTj+mXCqRfNz/L2PZAkwJmmIFbMC
 2ZJoKppuT3DELtEfODP2EiZnVlfxitWYUlmStbEjvBzwW8hld6FD0W1Ck
 R2tAHS4FizRd5eEzemUgZpwuh3ux/6nzQEdO0C3Im+n/0S5BWsSH1Mdru
 iSKok64xO5rSKcpfxaKjWQ7q2Lq/7JImn3zj79sxfStxiL4VNZV16FUkT
 js9JrO1uNezMkhUTLmw7hmNCQzYKzmVftsQdyD0BG4q+FS88omLdfmmXg
 V5m3KssHmQ9vjOYP7dtGi90mdzMG1yeFeaAP1eyFjB1Wawcm0eC9rFXgx
 A==;
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
Cc: csong@cs.ucr.edu, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, zhiyunq@cs.ucr.edu,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yizhuo <yzhai003@ucr.edu>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZnVuY3Rpb24gc2lpOTAyeF9jb25uZWN0b3JfZGV0ZWN0KCksIHZhcmlhYmxlICJzdGF0dXMi
IGNvdWxkIGJlCmluaXRpYWxpemVkIGlmIHJlZ21hcF9yZWFkKCkgZmFpbHMuIEhvd2V2ZXIsICJz
dGF0dXMiIGlzIHVzZWQgdG8KZGVjaWRlIHRoZSByZXR1cm4gdmFsdWUsIHdoaWNoIGlzIHBvdGVu
dGlhbGx5IHVuc2FmZS4KClNpZ25lZC1vZmYtYnk6IFlpemh1byA8eXpoYWkwMDNAdWNyLmVkdT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4
LmMKaW5kZXggMzhmNzVhYzU4MGRmLi5hZmNlNjRmNTFmZjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lp
OTAyeC5jCkBAIC0yNDYsNyArMjQ2LDcgQEAgc3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0
dXMKIHNpaTkwMnhfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLCBib29sIGZvcmNlKQogewogCXN0cnVjdCBzaWk5MDJ4ICpzaWk5MDJ4ID0gY29ubmVjdG9y
X3RvX3NpaTkwMngoY29ubmVjdG9yKTsKLQl1bnNpZ25lZCBpbnQgc3RhdHVzOworCXVuc2lnbmVk
IGludCBzdGF0dXMgPSAwOwogCiAJbXV0ZXhfbG9jaygmc2lpOTAyeC0+bXV0ZXgpOwogCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
