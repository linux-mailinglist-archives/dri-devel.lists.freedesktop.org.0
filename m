Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A2273096
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 19:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B3A6E4FF;
	Mon, 21 Sep 2020 17:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780CD6E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 17:06:08 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d15so14839262lfq.11
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 10:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8wJgx44R5NKEt8ZxeLzaDEWfeS0v7G2Y9ErgN5IEyXg=;
 b=mNzQWgo+B1fYnaeTLARkCvewjZg9HcnUglJrVlEkdaZTsCBIwUdVhKu5NsKRipjeQl
 +1Wb3BXlWXspQ2UTLhPpdoU9WPdPtcVRDOjY1+OHzOIPtdUKC3zdTjFu8H9kkPgrxw7z
 2EcpQhxo/HWFLZuFnAdTDEcWg9CAwLZU8KXlDofQqam3nJYziheaG1pj/UunWc8rNMio
 abvFCVFfgLLT6dMxNQacRIhRtFiYHhHIcjWuS6yhs3ZjH87yQMtBVelNSq13ro/Zai38
 0fqd0ADEiyc4SFMVvin6lcxWOWmCnUl5oWu34M0fJozt9u0cvg2ZG8TIraFXcnL3jIhu
 UqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8wJgx44R5NKEt8ZxeLzaDEWfeS0v7G2Y9ErgN5IEyXg=;
 b=IVuTYxf0RZwN/tn74x0YJ2jART3lOe35bOTZ1aoOGh2JRjw1yyoTDZTI8sHx8bF8/8
 3wUcNT56mpMbKCNgOOljFY6VvveyrXINd2hOYyM5TGgVc+jW2Q/Uq2JleWisKkv4SXzz
 vAfru8bbUbjBr0abxI+KlKYNdfvzAO4JSu3dc97ful5dRib/mLXy2nTd91GWfQuFCYq6
 AJ/50dQIgv4/nP+KJkB0bPV7X32fipgVy6bpqU4BqYu7Zn/z7mJXF18T/Ei0H9+dr+7n
 6ns9Uo4dDC342yRA87ZVDuyFOspItUuQyvjHTKy2bMbCvrCeSFb8PT75s6jGCcgpF5Kf
 /7Hg==
X-Gm-Message-State: AOAM530iZdqbiieW4XB9fPZPvKrBBAv/StOrveNKheD6Q/fNyZ6OuSAZ
 yKdGYNzIAoXzjPkUhW1thixIQyaqB0Fw0WETvEc=
X-Google-Smtp-Source: ABdhPJy8Jx5FwPowb4x2/95hAu/YP49gaxE6kf58oAxWBlMcnqfEtK51ywXCEko0zW0B8PeMXMJkQu5o+HuhTqI2OmY=
X-Received: by 2002:a19:820c:: with SMTP id e12mr262729lfd.215.1600707966915; 
 Mon, 21 Sep 2020 10:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600707235.git.agx@sigxcpu.org>
 <71a9108f3472ba9af4bead01b1b770d1e73eb08e.1600707235.git.agx@sigxcpu.org>
In-Reply-To: <71a9108f3472ba9af4bead01b1b770d1e73eb08e.1600707235.git.agx@sigxcpu.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Sep 2020 14:05:55 -0300
Message-ID: <CAOMZO5B5ECcConvKej=RcaF8wvOxgq7nUzKJ-ad0aSAOzUqtbQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/3] dt-binding: display: Require two rests on
 mantix panel
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8sCgpPbiBNb24sIFNlcCAyMSwgMjAyMCBhdCAxOjU2IFBNIEd1aWRvIEfDvG50aGVy
IDxhZ3hAc2lneGNwdS5vcmc+IHdyb3RlOgo+Cj4gV2UgbmVlZCB0byByZXNldCBib3RoIGZvciB0
aGUgcGFuZWwgdG8gc2hvdyBhbiBpbWFnZS4KClRoZXJlIGlzIGEgdHlwbyBpbiAicmVzZXRzIiBp
biB0aGUgU3ViamVjdCBsaW5lLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
