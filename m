Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A49376FA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 16:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191CB89327;
	Thu,  6 Jun 2019 14:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3459089327
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:40:22 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id w196so1720621oie.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 07:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=JR1howfMezzmm6Y5vv6jRpqnyYbi/IlNlhyzdel9fnY=;
 b=BOYahksKcORhReaSk0wI2pdrZMHXYUI7kIek7ps3s0kM0KSABUXeetEAyuQOTp39QP
 vSx4b3prONLsJ453kJb43rt3qs1oWcV53ANmHe9b+MizlU7Z5Frjje1yfTaKXnLfiv/h
 2Tw4QPp8impgza+0XoZow3Iq574aSI/0SldiXOTDBOchJBRIshzVBubdxTt+rvcyVp+n
 HkRqDFejUST6p4P+vWWuvUXVvG1/rTpYj3s9X/SukU19pojC1uNsXxU27PvVXOxV9uFc
 RxFcO3AeoJ6Oo/rfMMZQJbeadrtX3doEY4drglPhFItgETSOJn7hmaUSEdcVcARssMj+
 zLFA==
X-Gm-Message-State: APjAAAWqQ+9zE6AVilK0nduQN2NJimd6HMQ+o30tgziRZ2D1ewdQMekb
 vetCB2Ahqy3BneC3DiLlzf6YonIwpdh9XTJp+oMmcLfx
X-Google-Smtp-Source: APXvYqwXpmhn0DCp0BwJW/DUGU2XJGD9Xscoi0ViKN40c8P0rhAwnMkt15FBBDzAqZa6odZRT6Fc32gzLYRFLsD1pAY=
X-Received: by 2002:aca:cd4f:: with SMTP id d76mr224935oig.147.1559832021173; 
 Thu, 06 Jun 2019 07:40:21 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?SGFubmVzIE3DtnNs?= <moesl.hannes@gmail.com>
Date: Thu, 6 Jun 2019 16:40:10 +0200
Message-ID: <CAMKn85t89DZwqagT21h+RqYiaPzcOXayXFK=MNcg5txWigFUgg@mail.gmail.com>
Subject: drm/imx: 'flip_done timed out' on i.MX6D+ and kernel v4.19.48
To: dri-devel@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=JR1howfMezzmm6Y5vv6jRpqnyYbi/IlNlhyzdel9fnY=;
 b=H3oTkNbTwIAC815ziKJgbgP5BM49FpKwvUZST6ieOFE1vQxeizmppuOG27rzMfMOwe
 8lJANOlIukgM99w0b7D6KLGgh3FEPf1ODWuvYSCNteyS0hP3G9V66yWX+3WkIEt+eU1+
 GrtOkFKULo5z85N/emQL6hMw7t/ShO2q4XhTg0v+xIHTADPWDMwKZ4z7TyXZcU7Rhx+T
 Z+gMz92b8XTN6TB5Xigtn7UVZHFnRvZCHcP1LaKC3ojXMjhm/t+5wMwD1OspguEKg+uA
 WBqdIJqdSO4xqYmHZN31fU6JxoIyLKfW4t4UY4Rdqdoww+CV3vAN682cFfSobZX6v77A
 6nyQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpXZSBvYnNlcnZlZCB0aGUgZm9sbG93aW5nIGVycm9yIG9uIGFuIGkuTVg2RCsgQ1BVIGR1
cmluZyBzdGFydCBvZiBYLgpBcyBhIHJlc3VsdCwgdGhlIHNjcmVlbiBnb2VzIGJsYW5rLgoKCi0t
LS0tLS0KClsgMzU5OS4yMDA4ODZdIFtkcm06ZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfZmxp
cF9kb25lXSAqRVJST1IqCltDUlRDOjMwOmNydGMtMF0gZmxpcF9kb25lIHRpbWVkIG91dAoKWyAz
NjEwLjA4MDg4NV0gW2RybTpkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl9kZXBlbmRlbmNpZXNd
ICpFUlJPUioKW0NSVEM6MzA6Y3J0Yy0wXSBmbGlwX2RvbmUgdGltZWQgb3V0CgpbIDM2MjAuMzIw
ODQ5XSBbZHJtOmRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX2RlcGVuZGVuY2llc10gKkVSUk9S
KgpbQ09OTkVDVE9SOjQ1OkxWRFMtMV0gZmxpcF9kb25lIHRpbWVkIG91dAoKWyAzNjMwLjU2MDg2
NF0gW2RybTpkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl9kZXBlbmRlbmNpZXNdICpFUlJPUioK
W1BMQU5FOjI4OnBsYW5lLTBdIGZsaXBfZG9uZSB0aW1lZCBvdXQKCi0tLS0tLS0KCgpUaGUgZXJy
b3IgaGFwcGVucyBxdWl0ZSByYW5kb21seSBidXQgaXQgY2FuIGJlIHJlbGlhYmx5IHJlcHJvZHVj
ZWQgYnkKcmVwZWF0ZWRseSByZXN0YXJ0aW5nIFggLiBPbiBvdXIgc3lzdGVtLCB0aGUgZXJyb3Ig
b2NjdXJzIHNvbWV3aGVyZQpiZXR3ZWVuIDgwIGFuZCAzMDAgcmVzdGFydHMgb2YgWC4KCldlIGZp
cnN0IG9ic2VydmVkIHRoZSBpc3N1ZSB1c2luZyBrZXJuZWwgNC4xNC4xMjMuIFVwZGF0aW5nIHRv
IDQuMTkuNDgKZGlkIG5vdCBzb2x2ZSB0aGUgaXNzdWUgdW5mb3J0dW5hdGVseS4KCgpDaGVlcnMs
Ckhhbm5lcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
