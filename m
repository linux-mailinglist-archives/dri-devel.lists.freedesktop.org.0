Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58469A77E4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 02:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA15898E1;
	Wed,  4 Sep 2019 00:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4310E898E1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 00:32:12 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id d5so6883738lja.10
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 17:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qG45xekZHZpkcvzSkTy0dPGHkIJiijkN+hFSwaOOei0=;
 b=Vc0V37GmCD+l2pKOcgkuKWxkKCyUq7qcfH9ABBcnOyUmV4bt3ruU/NdG71tOKUvolE
 KrPLle50iDLH1oFMfb3U9WEk2VqCfrNwR7xxsSK5IukMCm56y/il3xl2kJgqRh/PnEBj
 kDyw2VCVB8bZ5v5XHZpTeRymxsSzndrwSXLN/3E8emoQIzz2IhMmn6rJBrgG1Dyl+HCp
 g+8mW92oRdXFvoM6o4JBiSZolTgA73xTOFF0gu2c43W02edsZrKgJR1GiNFY+YfE5nU7
 wY98ORQXlR5xhu7tMpXwR/W4uqMYyZ73G5WaVrUax0tqyK3NvcOCL4t9xpW3ojHCCnon
 eeYA==
X-Gm-Message-State: APjAAAV8vgR6upxMeoS9SfaZx5xWSOEPEfRVFIqI9BlCUMU6kADu1I9a
 Ebd1abWkiE7Hfh0iAfCJQdWl9QnT//2brPw0dpc=
X-Google-Smtp-Source: APXvYqwaBHrV0b+yxbEy68vmV6qKgUd0wtNgjr8HMuyYUChi7e1+sVQApjOOANO3mcdaA5T18FytxaSoH/JAZbJueHI=
X-Received: by 2002:a05:651c:154:: with SMTP id
 c20mr15019426ljd.240.1567557130580; 
 Tue, 03 Sep 2019 17:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5Cuk+t16bNFA+sm5=ZEdf+BNRtSpX27OCoQ==DbEyBtCw@mail.gmail.com>
 <ec11a377-fca3-ed12-2a05-abb3de936f8b@arm.com>
 <CAOMZO5BK0CJ8aA0CdBrYF75FRRHjqm0aOM4TpS9C+nHVuD8M_w@mail.gmail.com>
 <CAF6AEGtGXshOACrHYE7kkfvsBXRZ_ZF3xugJDOEFP9zr--vB5g@mail.gmail.com>
 <95ae3680-02c7-a1b8-5ea6-1a4d89293649@marek.ca>
 <CAOMZO5C7m6ZfFVXna18ZSZDgiggyTygK5VXZLxkx5Hg6Sy6G4w@mail.gmail.com>
 <CAF6AEGt5R34JBBY_X6kc5nSyGJexEy02ohijEtgoF=ff5o+-sQ@mail.gmail.com>
In-Reply-To: <CAF6AEGt5R34JBBY_X6kc5nSyGJexEy02ohijEtgoF=ff5o+-sQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 3 Sep 2019 21:31:59 -0300
Message-ID: <CAOMZO5Dt8km3AAUgT4Oci46T+sWkP-epLFbOzGajHS11+o-rgw@mail.gmail.com>
Subject: Re: Adreno crash on i.MX53 running 5.3-rc6
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qG45xekZHZpkcvzSkTy0dPGHkIJiijkN+hFSwaOOei0=;
 b=G1F0xfDj5Jo9IQ76EJOf+6hf7tGdZQZn7i35pRQtLXxBSS80yXoSPQwSohZZ7tfEpq
 B3bd9DyCKPseHIgsAri3aZSY4vpdUtZWBb55IpqdxHFVh1f2vQy0FScgkxpL3h9dPV1G
 F6Fzx7h09MdjFsuDLa86aXtfEJcyVuwVh8ZP1NKxiPs9oYb7niN3AQl3D6BM6ef2oMZg
 RJmKkER2YMvTPb8SxlESCb/zUYCgDrvgdQbXbwU0X5WAoIz/WKB9cgvW4kukemhL+33W
 FGHzDST8L0CYrirPRchb7mNBK2KRfLmP8if8unYXnBuFVFyBfkq9u5LZhEOHExYa9LWu
 yLGA==
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>, Chris Healy <cphealy@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gVHVlLCBTZXAgMywgMjAxOSBhdCA5OjEyIFBNIFJvYiBDbGFyayA8cm9iZGNs
YXJrQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEluIHRoZSBtZWFuIHRpbWUsIGl0IGlzIGEgYml0IHVn
bHksIGJ1dCBJIGd1ZXNzIHNvbWV0aGluZyBsaWtlIHRoaXMgc2hvdWxkIHdvcms6CgpZZXMsIHRo
aXMgd29ya3Mgb24gYSBpLk1YNTMgYm9hcmQsIHRoYW5rczoKClRlc3RlZC1ieTogRmFiaW8gRXN0
ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgoKSXMgdGhpcyBzb21ldGhpbmcgeW91IGNvdWxkIHN1
Ym1pdCBmb3IgNS4zPwoKVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
