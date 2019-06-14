Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 108B8458CA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 11:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3C8894E7;
	Fri, 14 Jun 2019 09:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF58C894E7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:34:54 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id q186so1520135oia.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 02:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IAxytmldJ+LQ9oXsinyPkN3ds2MZTOAfP2wyBRBDeRg=;
 b=fsU96ZtEeLxoFSg6qoBdmeqOJv7sKtooJmSvPlrH/bL3S1JS2mCs7RssP6wgKnrVBo
 4KfWItxNOkiLyzgGnL6NXHisv/YfQo0whTuMW97eXJyl++TqokXXaxkTuXXpIcxe+jjV
 l0iMQFNqwn7d1aikoAKR7OdH0/5BiOYip1f6JcO6D3+k3LUkbO9Td2VFGSLMQXA8o+nj
 7s2W/uTkPLupeIqcwU2Nat//PXcD8iDTN7verX1KQKAG5ES044nxTv3r+HDb8/OYWnTn
 AXcaBjvSWGC6GOQc/BHojdBBHy6+MtbJ8WmH/1QOHTRQVSwJuxACWr01fAtBTv50XYNI
 GgFA==
X-Gm-Message-State: APjAAAUQwP/t+HdCoQ0hNY/FQF1b3kRsHuw8NsaZS5Bp8c72fZeLV3Pb
 EmbEcRDYu1hQbSQNxYctYnWsv7Zv76ApM6UK6bBv9Q==
X-Google-Smtp-Source: APXvYqx0gEvUPXqD1kFmi82P0JHBq+bBkwG2UJTph0n99wSE1/UssVfy4El7T5U0s3E2JMVdYGMfQQOJu9WMwgcxsYc=
X-Received: by 2002:aca:f513:: with SMTP id t19mr1276030oih.76.1560504894070; 
 Fri, 14 Jun 2019 02:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190613223408.139221-1-fengc@google.com>
In-Reply-To: <20190613223408.139221-1-fengc@google.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 14 Jun 2019 15:04:42 +0530
Message-ID: <CAO_48GF1qzJFHavwt384MBcyyJRrFiZgYj1OHonUWMAcrm6DTw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Improve the dma-buf tracking
To: Chenbo Feng <fengc@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=IAxytmldJ+LQ9oXsinyPkN3ds2MZTOAfP2wyBRBDeRg=;
 b=znWyHu/m14+5GXaF3gP7yu7SWXJTq+Wsj2nJNhc8A0PpJXKWYMOxGBSzVgS3mNhdto
 pIVE++2S8C4JJTU4WjXsC1kHn7wjVXe46T1Q6kfftlp7QWt09aT1nNuG2RkrQEB/cwUE
 BN5szDO+xZfoBJzWbSPWpS/dcQxVeL1F9QpTJSU12unEdVDilC3LI0FWMn5LQa6QoF62
 IyLlVJD452ywDx+di8zbmOYrjVE0AYWCczQVyNnuNZbTqPg2w1bPhp5TGL+dG3+zm4vh
 Rnvs6oqsivrAR6bIwx8FKP6rEVsUh+jFuN9GlkQ8Jvs4KmgDFlinHxXOP+H4zL/k15fV
 XHhQ==
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
Cc: Android Kernel Team <kernel-team@android.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hlbmJvLAoKT24gRnJpLCAxNCBKdW4gMjAxOSBhdCAwNDowNCwgQ2hlbmJvIEZlbmcgPGZl
bmdjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gQ3VycmVudGx5LCBhbGwgZG1hLWJ1ZnMgc2hhcmUg
dGhlIHNhbWUgYW5vbnltb3VzIGlub2RlLiBXaGlsZSB3ZSBjYW4gY291bnQKPiBob3cgbWFueSBk
bWEtYnVmIGZkcyBvciBtYXBwaW5ncyBhIHByb2Nlc3MgaGFzLCB3ZSBjYW4ndCBnZXQgdGhlIHNp
emUgb2YKPiB0aGUgYmFja2luZyBidWZmZXJzIG9yIHRlbGwgaWYgdHdvIGVudHJpZXMgcG9pbnQg
dG8gdGhlIHNhbWUgZG1hLWJ1Zi4gQW5kCj4gaW4gZGVidWdmcywgd2UgY2FuIGdldCBhIHBlci1i
dWZmZXIgYnJlYWtkb3duIG9mIHNpemUgYW5kIHJlZmVyZW5jZSBjb3VudCwKPiBidXQgY2FuJ3Qg
dGVsbCB3aGljaCBwcm9jZXNzZXMgYXJlIGFjdHVhbGx5IGhvbGRpbmcgdGhlIHJlZmVyZW5jZXMg
dG8gZWFjaAo+IGJ1ZmZlci4KClRoYW5rcyBmb3IgdGhlIHNlcmllczsgYXBwbGllZCB0byBkcm0t
bWlzYy1uZXh0Lgo+CgpCZXN0LApTdW1pdC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
