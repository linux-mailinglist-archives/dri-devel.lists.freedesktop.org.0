Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A49AE4A0C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 13:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209526E9A5;
	Fri, 25 Oct 2019 11:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC1C6E9A5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 11:34:41 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id e11so1854586otl.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 04:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FdnXWQrBWp11eHpW5nLjm/7o2FpjH0uI65tjveIQMxQ=;
 b=rgMdyOB6D2qZDiwsapcpYCDZNVYH4y90g6A6rNzUnh1dxaF0JNrEEtYIsxme6BcC/c
 p3V7AUILo/U0bU/nwWmPWQ5bc7ikDFcWtTZH5s4JoMK3zNXr5OiJNxxvLRCmX1A/1Giu
 O/q43zPQ0vvs7afkKv9aqRwzdn2bwwmy9IOMmjkPzCR+10tTMI6H5IyvGNG18nunjY9v
 4SUoZ2uiRprhv5JP1r2kDRW2b3O3lRo9IVXQfUmWmj8iDScNWWGqR6mIrmDycbdoeus/
 9QFbMU/J0ri+U5sjFxZy0XsBH4axE1vQ6JmJr8oJMepFnyD73QnUVudDaqZLUe6p90hA
 W4Fw==
X-Gm-Message-State: APjAAAXLYUl7jIJvLh+EuRlOFiFCAjjnFRe2pxbS4bKqiYtu7ghwl3/5
 ZyBFWgZKcegp7hu3vTduq3vWxp9V+s8Az990eZhTGw==
X-Google-Smtp-Source: APXvYqz4J5ScWj3iZZctdQ+jZmPezR1BazaXr3j4A2XTePYUVA9ELHNtDKlaIBDfwqHYJSmYM7CLFOE4j3Hu65GtSe8=
X-Received: by 2002:a9d:39a5:: with SMTP id y34mr2393532otb.36.1572003281036; 
 Fri, 25 Oct 2019 04:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191021190310.85221-1-john.stultz@linaro.org>
 <CAO_48GHk8b=7Rs2CYZvnki2EMpeo_4FRy+_3F0Mv_nAK42MpgQ@mail.gmail.com>
In-Reply-To: <CAO_48GHk8b=7Rs2CYZvnki2EMpeo_4FRy+_3F0Mv_nAK42MpgQ@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 25 Oct 2019 17:04:30 +0530
Message-ID: <CAO_48GGCaTPrZg1xWmojHHqXu2eioWsVJQtZmoXKCXX7Dg8KoQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] DMA-BUF Heaps (destaging ION)
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FdnXWQrBWp11eHpW5nLjm/7o2FpjH0uI65tjveIQMxQ=;
 b=GiYeg5EZVfgQNFeTasX4Dh5mPkqAM+PzcZgSQYy0fMXTVkHh2HSVMIYZtQOoT51SNS
 piObUpn70xttAIPr0K3W98IxImoYBnZhwvTqaxOIZ+R1twT9TEDxE9rZoKwWShX90++q
 Syrgqt13KJrLOmpnv9FSVPy/8eAmgGZzfEauq7dQEb6Q/u4ZiC1fEeS5iJZR0Z3Yc1xG
 T0KAJdJWoCp7uYXw4OHR0s7+JnWdE3wTsBFkP2FSw/JO0wHkYKDkpspZyGMjmBvmv26H
 c9qqxDTI24R6uxS5eEN90Atjz+w0x6TYU519oOMK5h9+73XhBpuba6LuPntEBvqa7NlA
 yD/Q==
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNSBPY3QgMjAxOSBhdCAxMToyNiwgU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxA
bGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBIaSBKb2huLAo+Cj4gT24gVHVlLCAyMiBPY3QgMjAxOSBh
dCAwMDozMywgSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+IHdyb3RlOgo+ID4K
PiA+IEx1Y2t5IG51bWJlciAxMyEgOikKPiA+Cj4gPiBMYXN0IHdlZWsgaW4gdjEyIEkgaGFkIHJl
LWFkZGVkIHNvbWUgc3ltYm9sIGV4cG9ydHMgdG8gc3VwcG9ydAo+ID4gbGF0ZXIgcGF0Y2hlcyBJ
IGhhdmUgcGVuZGluZyB0byBlbmFibGUgbG9hZGluZyBoZWFwcyBmcm9tCj4gPiBtb2R1bGVzLiBI
ZSByZW1pbmRlZCBtZSB0aGF0IGJhY2sgYXJvdW5kIHYzIChpdHMgYmVlbiBhd2hpbGUhKSBJCj4g
PiBoYWQgcmVtb3ZlZCB0aG9zZSBleHBvcnRzIGR1ZSB0byBjb25jZXJucyBhYm91dCB0aGUgZmFj
dCB0aGF0IHdlCj4gPiBkb24ndCBzdXBwb3J0IG1vZHVsZSByZW1vdmFsLgo+ID4KPiA+IFNvIEkn
bSByZXNwaW5uaW5nIHRoZSBwYXRjaGVzLCByZW1vdmluZyB0aGUgZXhwb3J0cyBhZ2Fpbi4gSSds
bAo+ID4gc3VibWl0IGEgcGF0Y2ggdG8gcmUtYWRkIHRoZW0gaW4gYSBsYXRlciBzZXJpZXMgZW5h
YmxpbmcgbW9kdWVscwo+ID4gd2hpY2ggY2FuIGJlIHJldmlld2VkIGluZGVwZW50bHkuCj4KPiBU
aGlzIGxvb2tzIGdvb2QgdG8gbWUsIGFuZCBoYXNuJ3Qgc2VlbiBhbnkgbW9yZSBjb21tZW50cywg
c28gSSBhbQo+IGdvaW5nIHRvIG1lcmdlIGl0IHZpYSBkcm0tbWlzYy1uZXh0IHRvZGF5LgpEb25l
OyBtZXJnZWQgdG8gZHJtLW1pc2MtbmV4dC4KCjxzbmlwPgoKQmVzdCwKU3VtaXQuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
