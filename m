Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AC06088B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 17:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0F96E4D6;
	Fri,  5 Jul 2019 15:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83E96E4D6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 15:00:24 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id x4so10236366wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 08:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=0jqMvkDKWzCeqbUo/60+7SHSeiaN46RWC20HTXLgtwA=;
 b=NnOHgxXMGNs5bEC7UynrwQfYL44a/PD/ViLYz2NiaO2WCdjjfXYYgs1crafApbBFCD
 6QVtwKdDOdkUdx/o507dwFasjbq57tRN+M21KsACKfd8jNTv7AV9iSjcXDp7ve/2N1xJ
 UdMTNY6DHaAZNhNr4iM3OJJgP7pbJ0Zn/qzxRodvLoRRedrVCFm8VUxJONweIk14Zk+v
 tydNWsJ97P+T6Oe+C/4moSgcWKr5oXK7420hA44KD3y+I51IrtLHFpOXoMr080pAzplP
 +FeW72z3qJXBV9GeJFUHEaVVyT4bjVgvKrDIB0dMZhT74qDgeQ1bEVv/jugf/1XLTPyH
 +sIg==
X-Gm-Message-State: APjAAAXsQy3NcLW/25q+IGoffuI8F1PtBkYFryt2Xs1PbHHA8h7jbo0S
 7L0dZPAviPad2P3uGxYwcpKdXOuTh8A=
X-Google-Smtp-Source: APXvYqxh+gNw/+kEfJOA4VZSI43hjG1HUCco9lBaZQ+CICv1krynuWmYdj9k6NMT+/BTmZXKAieggw==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr4308206wrm.218.1562338823498; 
 Fri, 05 Jul 2019 08:00:23 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id n3sm916970wrt.31.2019.07.05.08.00.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 08:00:22 -0700 (PDT)
Date: Fri, 5 Jul 2019 14:59:43 +0000
From: sylvain.bertrand@gmail.com
To: dri-devel@lists.freedesktop.org
Subject: AMDGPU mesa3d ABI specs
Message-ID: <20190705145943.GA830@freedom>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=0jqMvkDKWzCeqbUo/60+7SHSeiaN46RWC20HTXLgtwA=;
 b=F9mhjJ4kDhzebL8UNYiaoJaMpAaH5sYoWQaziAZeRi6aPeFlkjjZxVjvUBdsxWvC7b
 poBlPfNg42Qyi1ZmX4AiAtSw+NiD6y/XzinW6bI5+ktaqS5yuof7mBG5AGfq82kDCDQ4
 BWIUxmuL86BG4vLiwIHvjPGCoERhgoM6CcK9PomtswmcVlom/PY56bxOUt2KZnny8c5U
 LQfKjY2c1P4HNk/wx0d4xW5tq6GKkrFQxJS0pn3vUfHSZcSgrwaEuO0QmZN7ddZ5DYas
 jar0KXcgQChbqDWxu3VXDKTu3HRjIUGCLVSYmDDBdgxyoLslloulkWR9+cB45m86RsAz
 HeXw==
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

SGksCgpJcyB0aGVyZSBhIGRvY3VtZW50IHdoaWNoIGRlc2NyaWJlcywgd2l0aCBpbXBsZW1lbnRh
dC1hYmxlIGFjY3VyYWN5LCB0aGUgbWVzYTNkIEFCSSBmb3IgYW1kZ3B1PwoKTmFtZWx5LCBwcm9w
ZXIgZG9jdW1lbnQgdG8gZ2VuZXJhdGUgYSBtZXNhM2QgbG9hZGFibGUgRUxGIG9iamVjdCwgYW5k
IHdoYXQgR1BVIHN0YXRlCnNoYWRlciBjb2RlIGNhbiBleHBlY3QgdG8gcnVuLgoKcmVnYXJkcywK
Ci0tIApTeWx2YWluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
