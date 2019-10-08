Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 632C1D07F0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2624C6E8F3;
	Wed,  9 Oct 2019 07:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx4.ucr.edu (mx4.ucr.edu [138.23.248.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411816E248
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 20:32:08 +0000 (UTC)
IronPort-SDR: UKjLB5cwNn0HnfW7SwRcqz9Vtd5sJhob34KF6ST9hZVr5ckCdtzYvU8W/g6T4ibDVOR2tebkch
 8d/8euNt/Ye8x1P1sIYNKuCoZh2baenqNKm0+/3mL4tfCA/2zftA5lfRZPenfNoj8CedejgPPh
 yQFXLRc249tKOsnXA73DAA8nWEcgPIIv/SphUUQeBML20Qb85f0D3cB2YL/HRuGC7bKWutX+e1
 qRNK2Fay2TTq5f2oMsABwmQz4Tw7uaB70Ou3xAN+a7q8JJg6kN2DxFFaNLLaJGyj270hmwIRK0
 qpA=
IronPort-PHdr: =?us-ascii?q?9a23=3AHfof+BKT7aTBsesQqNmcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgeI/jxwZ3uMQTl6Ol3ixeRBMOHsqkC1rud6v25EUU7or+5+EgYd5JNUx?=
 =?us-ascii?q?JXwe43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQ?=
 =?us-ascii?q?viPgRpOOv1BpTSj8Oq3Oyu5pHfeQpFiCezbL9oLBi7qQrdutQWjId/N6081g?=
 =?us-ascii?q?bHrnxUdupM2GhmP0iTnxHy5sex+J5s7SFdsO8/+sBDTKv3Yb02QaRXAzo6PW?=
 =?us-ascii?q?814tbrtQTYQguU+nQcSGQWnQFWDAXD8Rr3Q43+sir+tup6xSmaIcj7Rq06VD?=
 =?us-ascii?q?i+86tmTgLjhTwZPDAl7m7Yls1wjLpaoB2/oRx/35XUa5yROPZnY6/RYc8WSW?=
 =?us-ascii?q?9HU81MVSJOH5m8YpMAAOQBM+hWrJTzqUUSohalGQmgGPnixiNUinPq36A31f?=
 =?us-ascii?q?kqHwHc3AwnGtIDqHbbrNT0NacSTOC1y7TDwjbDb/xM2Df29Y/FcxAgoPGMR7?=
 =?us-ascii?q?1wcNbdxVUhGg7ek1WftZblMymL2esQrmiW9uxtXv+shW4/swx9vCSjy8M2ho?=
 =?us-ascii?q?TKho8Z0E7I+Tl6zYovONG1TE12bNi5G5VKrS6aLZF5QsY6TmFtvyY116MJtI?=
 =?us-ascii?q?agfCgP1JQn3xnfa+Gbc4SQ4hLsSuKRITBgiXJgYr2/hhKy/VGkyu3+S8W4yV?=
 =?us-ascii?q?hKojdBn9TPrHwN2BvT6s+ISvt54EitwyqA1wfW6u1cIEA0k7TUK4I5z7Iuip?=
 =?us-ascii?q?YetV7PEyz2lUnskqOaakYp9vK15+njYbjqvpqcOJV1igH6PKQugMu/AeEgPw?=
 =?us-ascii?q?kOXmmb+f6z1Lz/8UHlTrhHleA2nbXDsJzAO8sUu7O5DxdP0ok/8xa/Eyum0N?=
 =?us-ascii?q?MAkHYaNlJFeQuLgJX3NFHQPv/4Ceyyg1CtkDdw2/DGJaftApvXLnfdjrjuYK?=
 =?us-ascii?q?hy61VfyAovytBf/4hYCrYbIPL8CQfNs4nyBwUlNwuxwuvlQOd60oUfVHiMA6?=
 =?us-ascii?q?KGMajA+QuCoPAoJ++NaZUWuTvVMPEg/OPogjkynlpLOeGlx5pSZH2mE/BOJ0?=
 =?us-ascii?q?SCfWGqjM0MHGsHpQkiS/Ssj0eNFXZXZnCvT+cy7D02Fqq4AorZAIOgmrqM2G?=
 =?us-ascii?q?G8BJISLmRHDE2cVHTlbYOJX98SZy+IZMxsiDoJUf6mUYBy+wupsVrLyqhnM+?=
 =?us-ascii?q?2cyC0RtNq3xcp17uyLzUoa6DduScmRzjfeHClPgmoUSmpuj+hEqktnxwLGiP?=
 =?us-ascii?q?Agjg=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EcAwD98Jxdh8bQVdFmgkGEEIRNjmG?=
 =?us-ascii?q?FFwGGeIZxiDmBewEIAQEBDi8BAYcIIzYHDgIDCQEBBQEBAQEBBQQBAQIQAQE?=
 =?us-ascii?q?BCA0JCCmFQII6KQGDVRF8AwwCJgIkEgEFASIBNIMAggsFohKBAzyLJoEyiGY?=
 =?us-ascii?q?BCQ2BSBJ6KIwOgheEYYdSglgEgTkBAQGVL5ZXAQYCghAUjFSIRRuCKgGXFY4?=
 =?us-ascii?q?tmU8PI4E2A4IIMxolfwZngU9PEBSBaY5MJJFEAQE?=
X-IPAS-Result: =?us-ascii?q?A2EcAwD98Jxdh8bQVdFmgkGEEIRNjmGFFwGGeIZxiDmBe?=
 =?us-ascii?q?wEIAQEBDi8BAYcIIzYHDgIDCQEBBQEBAQEBBQQBAQIQAQEBCA0JCCmFQII6K?=
 =?us-ascii?q?QGDVRF8AwwCJgIkEgEFASIBNIMAggsFohKBAzyLJoEyiGYBCQ2BSBJ6KIwOg?=
 =?us-ascii?q?heEYYdSglgEgTkBAQGVL5ZXAQYCghAUjFSIRRuCKgGXFY4tmU8PI4E2A4IIM?=
 =?us-ascii?q?xolfwZngU9PEBSBaY5MJJFEAQE?=
X-IronPort-AV: E=Sophos;i="5.67,272,1566889200"; d="scan'208";a="81484237"
Received: from mail-lj1-f198.google.com ([209.85.208.198])
 by smtpmx4.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Oct 2019 13:32:05 -0700
Received: by mail-lj1-f198.google.com with SMTP id x13so4523393ljj.18
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 13:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Y5uvD0KVI1iYImauUvxo4V9KaiRqMOMx+KR5+x6L9WM=;
 b=OURuybUFD9zerHE/PNrEUoPLyS7xxfvJEmsQLPuRY3XKyk3uJsHx1wjSxIPkgZ3oiy
 +H3heoeFYyAbYxEQj4/gVo5L8QT4DqE/XiPLlN3e1+t3tYhhuStBZtbQ5Ove8CFNBqZo
 WEyE17sdisb2o5fMHe+yNp6BaGipFBeEliVB9NHHZtxUEQRZAgoaKbRDERSsyhlJSv26
 4tjJodbBujVBM665crCQLj/EeRES+XzR620TDKkR8uwUpdDT6iGolKp1OqCb7+FxitbD
 QLzhrDrYvNudvX9iuoh41csjYt22bwQmoGTSG+HDFu1c8Ssu+lw3IfBHciA+uEAKEFqV
 IK2Q==
X-Gm-Message-State: APjAAAWlEAeFhlwCtV8HsEHko5736wCIxKEqCNK4nrHZCSrMWbgND24z
 pT6dZMSY53yPR3QscxeEYzlX5aoor6EwQXSjaI2vU4wMvsQ3xiMZKmp/+LbbqpX9Ed7EaAlj303
 mE494uXDAk5opZn6sXLS7+zRy3spDw8tVQGGlX8mJjnrfIw==
X-Received: by 2002:ac2:44d2:: with SMTP id d18mr22257160lfm.67.1570566723358; 
 Tue, 08 Oct 2019 13:32:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzKXb5GhB8uOBl0EocLC+TY8jhaYV0Q9PE/EonJZ2i5JDTwYHHUoHWPpSFGT7Ou1l0SIUv9Vaan38rSSzyLys0=
X-Received: by 2002:ac2:44d2:: with SMTP id d18mr22257148lfm.67.1570566723127; 
 Tue, 08 Oct 2019 13:32:03 -0700 (PDT)
MIME-Version: 1.0
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Tue, 8 Oct 2019 13:32:45 -0700
Message-ID: <CABvMjLRE_Nxa1jC1o9uw_jsuAABdm+nE0ZNu-yh0hMzmfqEr_g@mail.gmail.com>
Subject: Uninitialized Variable Use in video: fbdev: pm3fb
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1570566728; x=1602102728;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ov+TaJEUL5MZ2MuVlEdFPUX9o96HuIazEg8XGXB2Y+Y=;
 b=Io2U/L2Z12TnCmbRETTMk4P7TdgnuiNfQEyn3VWh20ZxDMOX+iHvyEB6
 MQEWA2cXF3pHcJ27Js9VJ24HmM59c/lZSOpbpaEuEZkdLe6XwcHzq3zjh
 e4yp1QIN5n8POsbYCl/fdrOZLJrW679SP2j9jJaEQ3/oBfdsTSQnRLFMf
 jcjI99u46+VJvHJkkZamBl5XfUUdbQ99gd8B7rdiv/6hFlVZaTfrdp6cO
 4GLp4qKpmWs8nNgHXyoqHvumkqEwu0NJGpFTcOBATNGal2pA+m2sEtkqY
 lDfDbgogieDBA+EZcXH143KO44fimy3C7hoQSvjBeQEMTKSlVp6w0grLM
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxsOgoKZHJpdmVycy92aWRlby9mYmRldi9wbTNmYi5jOgoKSW5zaWRlIGZ1bmN0aW9uIHBt
M2ZiX3dyaXRlX21vZGUoKSwgIHZhcmlhYmxlICJtIiAibiIgInAiIGNvdWxkIGxlYXZlCnVuaW5p
dGlhbGl6ZWQgYWZ0ZXIgcG0zZmJfY2FsY3VsYXRlX2Nsb2NrKCksIGhvd2V2ZXIsIHRoZXkgYXJl
IHVzZWQKbGF0ZXIgaW4gUE0zX1dSSVRFX0RBQ19SRUcsIHdoaWNoIGlzIHBvdGVudGlhbGx5IHVu
c2FmZS4KCgotLSAKS2luZCBSZWdhcmRzLAoKWWl6aHVvIFpoYWkKCkNvbXB1dGVyIFNjaWVuY2Us
IEdyYWR1YXRlIFN0dWRlbnQKVW5pdmVyc2l0eSBvZiBDYWxpZm9ybmlhLCBSaXZlcnNpZGUKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
