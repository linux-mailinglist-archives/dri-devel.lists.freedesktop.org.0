Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D1910DE7B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 19:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6146F89D6C;
	Sat, 30 Nov 2019 18:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97CF89D6C
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 18:04:11 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l18so6842519lfc.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 10:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KeWj67j7t721qCfI+6RxBQ+EmlY5X5BSvtw/QcsnMlI=;
 b=kMBLnfK3h/9ZYi4zj6DnwYli2lY2+v+4Le/dt0uUV/fkITZiSnmq9bjwd+wwWqs8gr
 fsX/30sjfsv5L5z9UQIpCKBq6sJDQYqOierDbX0A5X5lMx9co2oZXUw7SnK20LdzttCd
 7T3XU6SxTeWqLH6hbC9pC43S5p0H0nzSaoX24rhKD+k6HLoH7+JQKXs05Xj1rR7lcuGl
 h80Ww/oBeZ0HzdyOr2YITl3UvkM1ON3J6tXMxwCDq0VVvz7ML4JNzoE9XsOfBPzj1KhJ
 JoUFx87ewbBpMUvO9XR1Afmtt2+bAcwipluCL+06o0QeQbfxqHtVmn181fI2ODB2RCD1
 jFDg==
X-Gm-Message-State: APjAAAVtRWNFCMojnU6485zumYMLaVjvcaACoACNt0uP72kal0uRdf6L
 eWpYiCm4V+3GepzUp6TicECtCdiFumQ=
X-Google-Smtp-Source: APXvYqwlCvM1DSFU0oK447XCmCo5PyRxijGW2xNG7MqWAj/1zwb6uudnO+mAEDCPELpa+1mFhHYQHA==
X-Received: by 2002:ac2:5444:: with SMTP id d4mr15117479lfn.49.1575137049492; 
 Sat, 30 Nov 2019 10:04:09 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id d7sm11967223lfl.42.2019.11.30.10.04.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Nov 2019 10:04:08 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id a17so24839760lfi.13
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 10:04:08 -0800 (PST)
X-Received: by 2002:ac2:555c:: with SMTP id l28mr4691328lfk.52.1575137048166; 
 Sat, 30 Nov 2019 10:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20191125204248.GA2485@ziepe.ca>
In-Reply-To: <20191125204248.GA2485@ziepe.ca>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 30 Nov 2019 10:03:52 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
Message-ID: <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull hmm changes
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KeWj67j7t721qCfI+6RxBQ+EmlY5X5BSvtw/QcsnMlI=;
 b=XsL2lb1FqLtCS9t+CqPorBjTDZfJvIvGqBi0ylnknkqqXQseOaRQaOWu/tb9DhKJzR
 x7ytWVqaMqaxS+rJJogCAe5sHqKPDP9Yxts6Nqc2xTQdGcrm2XMQYmSAm7Z8PBly5old
 FXQc3INX/SwS53DN6wz/J5itJUXkelIOzYTsQ=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, David Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMTI6NDIgUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPiB3cm90ZToKPgo+IFlvdSB3aWxsIHByb2JhYmx5IGJlIG1vc3QgaW50ZXJlc3Rl
ZCBpbiB0aGUgcGF0Y2ggIm1tL21tdV9ub3RpZmllcjogYWRkIGFuCj4gaW50ZXJ2YWwgdHJlZSBu
b3RpZmllciIuCgpJJ20gdHJ5aW5nIHRvIHJlYWQgdGhhdCBwYXRjaCwgYW5kIEknbSBjb21wbGV0
ZWx5IHVuYWJsZSB0byBieSB0aGUKYWJzb2x1dGVseSAqaG9ycmlkKiB2YXJpYWJsZSBuYW1lcy4K
ClRoZXJlIGFyZSB6ZXJvIGV4Y3VzZXMgZm9yIG5hbWVzIGxpa2UgIm1tbl9tbSIuIFdURj8KCkkn
bGwgdHJ5IHRvIGZpZ3VyZSB0aGUgY29kZSBvdXQsIGJ1dCBteSBpbml0aWFsIHJlYWN0aW9uIHdh
cyAieWVhaCwKbm90IGluIG15IFZNIi4KCiAgICAgICAgICAgICAgICAgICBMaW51cwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
