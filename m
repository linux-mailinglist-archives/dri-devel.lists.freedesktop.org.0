Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46461725D9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 06:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E1B6E430;
	Wed, 24 Jul 2019 04:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DB76E430
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 04:22:18 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k8so45832570eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 21:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xwge67L+3EQ2aFGxgAjJAjYtC8kh0cJgKbJ+VBbrRe4=;
 b=oLUeEH+ojTgX3fCRqxlsdHCRNdPSv0ovVmv02avyggk90FDgu+ap4SBYnNzXITNm0k
 sHLvmCwDEj2Ldnc7bgOm51c1bHyCZqQ97Z876txEYBNpS4010IbBPO0Z9rRIOEU/06LX
 29OONUiErihLQMfaUxTS38HGKlsXrb/zRfj927AKDtSCx3nRXuJmKgDGyBTnFvzUR5ar
 pvyJZxr7inxg+Fv4y9+7Aoci15l+m+QAYIdNTfJwA/JJBngStInGDukhuagxCnB0GvS/
 qsHRqb2F/3B5Yy0jbzJzP+xj02OppsJxKanSe6kcI2B8xRO5YyypVd7d5XTu/msmaLKO
 XBTQ==
X-Gm-Message-State: APjAAAVqG/ESwUyMRtL8F2neTxfpVQbvLfuWawdEP4WUEaypVQv6zafN
 bYf3e7gof0WAfDDsC8o+cCp8ERhVICtIEQ==
X-Google-Smtp-Source: APXvYqwmVlx2ojimDPiVbPLJ1yXl3syuhIC+5tcczBba4Unr7McLLfziS2UIbkwZenzfDuNjg9VzmQ==
X-Received: by 2002:a17:906:684e:: with SMTP id
 a14mr61847888ejs.156.1563942136761; 
 Tue, 23 Jul 2019 21:22:16 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47])
 by smtp.gmail.com with ESMTPSA id l2sm12019783edn.59.2019.07.23.21.22.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 21:22:15 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id s3so40403226wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 21:22:15 -0700 (PDT)
X-Received: by 2002:a05:600c:2111:: with SMTP id
 u17mr51303133wml.64.1563942134673; 
 Tue, 23 Jul 2019 21:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190723053421.179679-1-acourbot@chromium.org>
In-Reply-To: <20190723053421.179679-1-acourbot@chromium.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 24 Jul 2019 13:22:03 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CfCrKLVb9obuXcMpFzBUxyZhK4NAuUOEUTviN-mZ9H6w@mail.gmail.com>
Message-ID: <CAAFQd5CfCrKLVb9obuXcMpFzBUxyZhK4NAuUOEUTviN-mZ9H6w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: make imported PRIME buffers contiguous
To: Alexandre Courbot <acourbot@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xwge67L+3EQ2aFGxgAjJAjYtC8kh0cJgKbJ+VBbrRe4=;
 b=gKG79kqSGS6PE3wGKci7oDEWb0bB1oWWLWP3WcZ3h/yXwdEcjYTt2USKxZL7qtIF2b
 3yvROFrTrRnW/UtSz0F64CeWYyiN5EJVkayWZ8vb3JWPS+hkDGSh0ax2XxGfE8Elimpn
 Xy7Nc6wR7PzNyMrMzWW22EG102F/JzY5p9qUQ=
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMjozNCBQTSBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJi
b3RAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IFRoaXMgZHJpdmVyIHJlcXVpcmVzIGltcG9ydGVk
IFBSSU1FIGJ1ZmZlcnMgdG8gYXBwZWFyIGNvbnRpZ3VvdXNseSBpbgo+IGl0cyBJTyBhZGRyZXNz
IHNwYWNlLiBNYWtlIHN1cmUgdGhpcyBpcyB0aGUgY2FzZSBieSBzZXR0aW5nIHRoZSBtYXhpbXVt
Cj4gRE1BIHNlZ21lbnQgc2l6ZSB0byBhIGJldHRlciB2YWx1ZSB0aGFuIHRoZSBkZWZhdWx0IDY0
SyBvbiB0aGUgRE1BCj4gZGV2aWNlLCBhbmQgdXNlIHNhaWQgRE1BIGRldmljZSB3aGVuIGltcG9y
dGluZyBQUklNRSBidWZmZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIENvdXJib3Qg
PGFjb3VyYm90QGNocm9taXVtLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKystLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCB8ICAyICsrCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgoKUmV2aWV3ZWQtYnk6IFRvbWFz
eiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+CgpCZXN0IHJlZ2FyZHMsClRvbWFzegpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
