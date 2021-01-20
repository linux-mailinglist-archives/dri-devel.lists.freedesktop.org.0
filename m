Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D132FD04B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 13:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F95C6E090;
	Wed, 20 Jan 2021 12:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713D06E090
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 12:51:19 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v15so19343192wrx.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 04:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3RgS1hVIn/K2Y7RwcI+RKj6NyrqDqEjtXwVYHmx/p5o=;
 b=zafINneliVQnZeNIYJgjDBJE4N8QckFZ/IoatozlPl7lx6dkRlznUx3s+HSxkPD/S0
 BoOUtcOpwDJZMP1fbWpLx2Qy30vpoFkKOOwItEUe2KyuZvrwATti0mbSvTm1Lh/TZ2Tb
 JIOXtGqD7Sil7efwHMwjKRydd1FL5NZVFLrAVrH5mOB9ndsbZ9Rpk3jfyo6wSUBZIcKO
 2SGmrk583YPiLDqWLWBLPKGeuXiJij5s79PAXKefo38QM5WREtoZRZ+wlYgP7tzOkpb2
 xfjYHJ70oaHd/xFTDPck7wQlQtDV4GZwuJz3Qkl6ATHlsKTLc0fqiJTrHhZ5QkfTy8nw
 IIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3RgS1hVIn/K2Y7RwcI+RKj6NyrqDqEjtXwVYHmx/p5o=;
 b=eyEk+M5Q5KbRjNaio0w2sy3tVFHbIcx4tqBqRwNKvu0xexhR0pLJzCcS2xBfFO8YhW
 X16Tl/KO4MXRS0zsdMgHHNCLvhDTLjn74G6MCnZa2JKeKghmdp+ZxPNaf34urjRVC+3Z
 i1+6gBsBtw0/l+6aDdU7RHIONzMttl7KrrqeOh7tgkG32xFJMdRVGuu1Mf67dxbB664I
 HcUuzFDLsd2q6Ag+I9ArEZRvu9cJETNj7eHf/RUwdMKAZl0ThPFyQzZx/aVsbNv36CzP
 Se9ft+kr9P1Sh3xCkl+sR0VdhkumFywi/Uq9vLcFbrnLhBJIr7bIgUXQWhS5GnwZMuhS
 u8mw==
X-Gm-Message-State: AOAM531EBDacYN5Q937jdvY+LAQ8i/84NTOC8+oDR1KEwuREVJ9b8nYg
 aqIqS1iUqs9WLMx87VuwEaiYJw==
X-Google-Smtp-Source: ABdhPJy82V5OequyxrC6dVDVybzT6ls4DFqZ0hcfzj1nXxHK5thGX2HuxZvC2amcEpcLtCt7IVK7ZA==
X-Received: by 2002:adf:ef8b:: with SMTP id d11mr9338055wro.156.1611147078169; 
 Wed, 20 Jan 2021 04:51:18 -0800 (PST)
Received: from dell ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id g14sm4271743wru.45.2021.01.20.04.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 04:51:17 -0800 (PST)
Date: Wed, 20 Jan 2021 12:51:15 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] Immutable branch between Backlight Arm and SPI due for
 the v5.12 merge window
Message-ID: <20210120125115.GT4903@dell>
References: <20210118132322.7282-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210118132322.7282-1-linus.walleij@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5qb3khCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDVjOGZlNTgzY2NlNTQy
YWEwYjg0YWRjOTM5Y2U4NTI5M2RlMzZlNWU6CgogIExpbnV4IDUuMTEtcmMxICgyMDIwLTEyLTI3
IDE1OjMwOjIyIC0wODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6
CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9sZWUvYmFj
a2xpZ2h0LmdpdCBpYi1iYWNrbGlnaHQtYXJtLXNwaS12NS4xMgoKZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIDkzY2MyNmZhOGYzN2ZiZDMyMGYzNjUyNWJmZWRkNGIzZTJiM2UyYmE6Cgog
IGJhY2tsaWdodDogbG1zMjgzZ2YwNTogQ29udmVydCB0byBHUElPIGRlc2NyaXB0b3JzICgyMDIx
LTAxLTIwIDEyOjQ3OjExICswMDAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbW11dGFibGUgYnJhbmNoIGJldHdlZW4g
QmFja2xpZ2h0IEFybSBhbmQgU1BJIGR1ZSBmb3IgdGhlIHY1LjEyIG1lcmdlIHdpbmRvdwoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpMaW51cyBXYWxsZWlqICgxKToKICAgICAgYmFja2xpZ2h0OiBsbXMyODNnZjA1OiBDb252
ZXJ0IHRvIEdQSU8gZGVzY3JpcHRvcnMKCiBhcmNoL2FybS9tYWNoLXB4YS96Mi5jICAgICAgICAg
ICAgICAgfCAxMiArKysrKystLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbXMyODNnZjA1
LmMgfCA0MyArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvbGlu
dXgvc3BpL2xtczI4M2dmMDUuaCAgICAgICB8IDE2IC0tLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IGluY2x1ZGUvbGludXgvc3BpL2xtczI4M2dmMDUuaAoKLS0gCkxlZSBKb25lcyBb5p2O55C8
5pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZh
Y2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
