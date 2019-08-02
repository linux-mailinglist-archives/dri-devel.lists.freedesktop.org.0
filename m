Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA4681369
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D016E248;
	Mon,  5 Aug 2019 07:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C145A6E40F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 21:25:19 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id l21so36664219pgm.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 14:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ounmn3+2vrtLO87mBqUZUFIlPArGl+FnX3GM8A0g5iQ=;
 b=dlmxiSgUnbqzwGtm38V7s18TzuYbVSPniFEvS3WlzaNsDftogku3FJO+qrydQvSF/J
 YzuE5c45A7IOTHkr+LuoFRB3HKu1HxxpS3hLwYM3ipS7t9wdIBROT60+uchqLpwgQUwv
 KruTOAFJOz0+FGA0buMYd6dqNANu7MuLVExkOJo3ve7QoA4hq2GmN67/CWOmdxA5yncG
 pydRAYHMCB50usUQAVsESOSxtvkRWMBkPOIpr1VBA9X2k5SJBig03fa6GO/ol/mpb1Cx
 7Yrv+5a6fDHCOPn7SvcZPFUfwTIp+cEL6eWGfnde7aFCk4wK5Nvk4CGDGBkn7gyDVqFp
 4BPA==
X-Gm-Message-State: APjAAAWILQT5dsClY1xTWLRncQpZSESnyE+3CEi5tjt4XSsgZCvl4VuW
 qobtkhGUqkKBVQ8DqaWOsFE=
X-Google-Smtp-Source: APXvYqyGVCV5HJGm1XNWnr4gOx/zbXJ5CT4KwBYp0MHUEXjgEgcj0pHURHUcwFLN51nH9nwVHhp36w==
X-Received: by 2002:aa7:9210:: with SMTP id 16mr63424213pfo.11.1564781119305; 
 Fri, 02 Aug 2019 14:25:19 -0700 (PDT)
Received: from [192.168.1.219] (c-73-252-184-5.hsd1.ca.comcast.net.
 [73.252.184.5])
 by smtp.gmail.com with ESMTPSA id t6sm5463968pgu.23.2019.08.02.14.25.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 14:25:18 -0700 (PDT)
Subject: Re: [Bug 204407] New: Bad page state in process Xorg
To: Andrew Morton <akpm@linux-foundation.org>
References: <bug-204407-27@https.bugzilla.kernel.org/>
 <20190802132306.e945f4420bc2dcddd8d34f75@linux-foundation.org>
From: Petr Vandrovec <petr@vandrovec.name>
Message-ID: <dbc18e46-fe01-27a1-e531-cbc1161d394b@vandrovec.name>
Date: Fri, 2 Aug 2019 14:25:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 PostboxApp/7.0.0b3
MIME-Version: 1.0
In-Reply-To: <20190802132306.e945f4420bc2dcddd8d34f75@linux-foundation.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ounmn3+2vrtLO87mBqUZUFIlPArGl+FnX3GM8A0g5iQ=;
 b=G/mBVOBAXzvZJn9oR7C1invDeI1YxtKet2qnxDnbsDUXEpiXt0YUa2PPzxKQK5+6UX
 ONC8u2JfaskPMRmmZXTzF4+gYrS2SrjqSSf/54UQ7DnmxGtpqNgTh4RwORAF3iWzJ+in
 ChI8K5M9LzMnq1hDu4W7rS7eE/Y+G+47kU9vJwaXZGo/gP5wtTqRzE3wXJ49x0jwf1Gl
 bXlZ8q81lTr/qU4hAzC/9QCCFDujJYoSA9Xcftk6NEGcLBkV93l0E8p9VUDxCAudDSac
 /MAms025UMETpRqrdUKvyr6MQ1tPeuzh+K04iP+AKhKfPl6sJ1uu3h74eBsTjmeCmF2m
 vyXw==
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
Cc: David Airlie <airlied@linux.ie>, bugzilla-daemon@bugzilla.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kcmV3IE1vcnRvbiB3cm90ZSBvbiA4LzIvMjAxOSAxOjIzIFBNOgo+IChzd2l0Y2hlZCB0byBl
bWFpbC4gIFBsZWFzZSByZXNwb25kIHZpYSBlbWFpbGVkIHJlcGx5LXRvLWFsbCwgbm90IHZpYSB0
aGUKPiBidWd6aWxsYSB3ZWIgaW50ZXJmYWNlKS4KPiAKPiBPbiBUaHUsIDAxIEF1ZyAyMDE5IDIy
OjM0OjE2ICswMDAwIGJ1Z3ppbGxhLWRhZW1vbkBidWd6aWxsYS5rZXJuZWwub3JnIHdyb3RlOgo+
IAo+PiBbMjU5NzAxLjU0OTM4Ml0gQ29kZTogMTAgZTkgNjcgZmYgZmYgZmYgMGYgMWYgNDQgMDAg
MDAgNDggOGIgMTUgYjEgNmMgMGMgMDAgZjcKPj4gZDggNjQgODkgMDIgNDggYzcgYzAgZmYgZmYg
ZmYgZmYgZTkgNmIgZmYgZmYgZmYgYjggMGIgMDAgMDAgMDAgMGYgMDUgPDQ4PiAzZCAwMQo+PiBm
MCBmZiBmZiA3MyAwMSBjMyA0OCA4YiAwZCA4OSA2YyAwYyAwMCBmNyBkOCA2NCA4OSAwMSA0OAo+
PiBbMjU5NzAxLjU0OTM4Ml0gUlNQOiAwMDJiOjAwMDA3ZmZlNTI5ZGIxMzggRUZMQUdTOiAwMDAw
MDIwNiBPUklHX1JBWDoKPj4gMDAwMDAwMDAwMDAwMDAwYgo+PiBbMjU5NzAxLjU0OTM4Ml0gUkFY
OiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDU2NGE1ZWFiY2U3MCBSQ1g6Cj4+IDAwMDA3ZjUw
NGQwZWMxZDcKPj4gWzI1OTcwMS41NDkzODJdIFJEWDogMDAwMDdmZmU1MjlkYjE0MCBSU0k6IDAw
MDAwMDAwMDA0MDAwMDAgUkRJOgo+PiAwMDAwN2Y1MDQ0YjY1MDAwCj4+IFsyNTk3MDEuNTQ5Mzgy
XSBSQlA6IDAwMDA1NjRhNWVhZmU0NjAgUjA4OiAwMDAwMDAwMDAwMDAwMDBiIFIwOToKPj4gMDAw
MDAwMDEwMjgzZTAwMAo+PiBbMjU5NzAxLjU0OTM4Ml0gUjEwOiAwMDAwMDAwMDAwMDAwMDAxIFIx
MTogMDAwMDAwMDAwMDAwMDIwNiBSMTI6Cj4+IDAwMDA1NjRhNWU0NzViMDgKPj4gWzI1OTcwMS41
NDkzODJdIFIxMzogMDAwMDU2NGE1ZTQ3NWM4MCBSMTQ6IDAwMDA3ZmZlNTI5ZGIxOTAgUjE1Ogo+
PiAwMDAwMDAwMDAwMDAwYzgwCj4+IFsyNTk3MDEuNzA3MjM4XSBEaXNhYmxpbmcgbG9jayBkZWJ1
Z2dpbmcgZHVlIHRvIGtlcm5lbCB0YWludAo+IAo+IEkgYXNzdW1lIHRoZSBhYm92ZSBpcyBtaXNi
ZWhhdmlvdXIgaW4gdGhlIERSTSBjb2RlPwoKTW9zdCBwcm9iYWJseS4KCldoZW4gSSBzd2l0Y2hl
ZCBiYWNrIHRvIDUuMiwgY3Jhc2hlcyB3ZXJlIGdvbmUsIGJ1dCBsb2cgd2FzIGZpbGxlZCB3aXRo
IAoxMSBtaWxsaW9ucyBvZiBtZXNzYWdlcyBjb21wbGFpbmluZyBhYm91dCBhbGxvY19jb250aWdf
cmFuZ2UgcHJvYmxlbXM6CgpbMjIwNDIuMTA4MDQzXSBhbGxvY19jb250aWdfcmFuZ2U6IFsxMDZm
MTE4LCAxMDZmMTE5KSBQRk5zIGJ1c3kKWzIyMDQyLjExNDQwMF0gYWxsb2NfY29udGlnX3Jhbmdl
OiBbMTA2ZjExYywgMTA2ZjExZCkgUEZOcyBidXN5ClsyMjA0Mi4xMjA3ODddIGFsbG9jX2NvbnRp
Z19yYW5nZTogWzEwNmYxMWQsIDEwNmYxMWUpIFBGTnMgYnVzeQpbMjIwNDcuMDkzMDU3XSBhbGxv
Y19jb250aWdfcmFuZ2U6IDQ3OTYzIGNhbGxiYWNrcyBzdXBwcmVzc2VkClsyMjA0Ny4wOTMwNThd
IGFsbG9jX2NvbnRpZ19yYW5nZTogWzEwNmYxMTcsIDEwNmYxMTgpIFBGTnMgYnVzeQpbMjIwNDcu
MTA1NTc2XSBhbGxvY19jb250aWdfcmFuZ2U6IFsxMDZmMTE4LCAxMDZmMTE5KSBQRk5zIGJ1c3kK
WzIyMDQ3LjExMTkzN10gYWxsb2NfY29udGlnX3JhbmdlOiBbMTA2ZjExYywgMTA2ZjExZCkgUEZO
cyBidXN5ClsyMjA0Ny4xMTgzMjldIGFsbG9jX2NvbnRpZ19yYW5nZTogWzEwNmYxMWQsIDEwNmYx
MWUpIFBGTnMgYnVzeQoKSW4gdG90YWwgdGhlcmUgaXMgOTczNSBtZXNzYWdlcyBsb2dnZWQgaW5k
aXZpZHVhbGx5LCBhbmQgMTEgbWlsbGlvbiAKc3VwcHJlc3NlZDoKCnBldHItZGV2Mzp+JCBkbWVz
ZyB8IGdyZXAgYWxsb2NfY29udGlnLipQRk5zIHwgd2MgLWwKOTczNQpwZXRyLWRldjM6fiQgZXhw
ciBgZWNobyBcYGRtZXNnIHwgZ3JlcCBhbGxvY19jb250aWcuKmNhbGxiYWNrcyB8IGN1dCAtZCcg
CicgLWYzXGAgfCBzZWQgLWUgJ3MvIC8gKyAvJ2dgCjExMzMzNzIyCgpTbyBpdCBjb3VsZCBiZSBt
eSBwcm9ibGVtcyBhcmUgY2F1c2VkIGJ5IG5ldyBYb3JnIGRyaXZlci4KCkFmdGVyIEkgZGlzYWJs
ZWQgQ01BIHN5c3RlbSBpcyBzdGFibGUgb24gNS4yLiAgSSBkaWQgbm90IHRyeSA1LjMtcmMyIHll
dC4KClBldHIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
