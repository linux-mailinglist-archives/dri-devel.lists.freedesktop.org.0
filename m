Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389117ADDC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 18:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCCE6E5C5;
	Tue, 30 Jul 2019 16:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8376D6E5C5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 16:35:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x1so16588695wrr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 09:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lyc51WkXJNXEf7PLA2dfjixI1bVxx3VXZxOPoEhVwHw=;
 b=QAnwnIRQTlO5yVOCQ22NFK7MiGKcadJ3MIzQpdtBIq6ZeJYI9FcVFBGWPdGnwPSnLk
 nCOZQz3IoIYRmz76b3F+c8oy8LvD7w0Ymh7iCddDip7jzeEvZQfAVfdkZvdVI67pwFX5
 evYqLxp/4SIzGSXihO+3i06HHzLK1VDdkRXEy3IXcOn5ZM2XIElaFCHUhvbPqZKI8lTP
 XRsConICayKyT4oXN1FZVDDIAuls+5ye+kbsL48am1dAuV8EtTxm+elG5y7x5CQaAyvD
 6yEguPib2AvFDGiPT+9RstEnRx9WDNu7VqhPzlQcqMdwUTp4GcGriqqmqLjRSx+/k4b3
 k/8Q==
X-Gm-Message-State: APjAAAVs3TerV+8rh+h5CHkzVCXP+SmoAc6T6Gl+cETxomzgfNOO/Vms
 3XLsKCI/QB9p6zZYbnscs7k=
X-Google-Smtp-Source: APXvYqxn6Gxs3bmN6B5BfzTbT6t3yxw3FD2FA+CpCJuDUKB7TspzSvMyxgmq/o4cW2P0GvYUBn9nMA==
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr37925880wrn.198.1564504540068; 
 Tue, 30 Jul 2019 09:35:40 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id g19sm73632663wmg.10.2019.07.30.09.35.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 09:35:39 -0700 (PDT)
Date: Tue, 30 Jul 2019 17:35:10 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Jerry Han <jerry.han.hq@gmail.com>
Subject: Re: [PATCH] [v9] drm/panel: Add Boe Himax8279d MIPI-DSI LCD panel
Message-ID: <20190730163510.GC14551@arch-x1c3>
References: <CA+quO7KJTrp_RpFJ8fpv6jCgKNv98uZLpU2sRe_ye-xTG6=4jA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+quO7KJTrp_RpFJ8fpv6jCgKNv98uZLpU2sRe_ye-xTG6=4jA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lyc51WkXJNXEf7PLA2dfjixI1bVxx3VXZxOPoEhVwHw=;
 b=pbDq8HGvKKpWwjG+E6tOgvaSHT1WqtQgRR8lw2Z3JFaqIgTK25HQkAQnqA0fBCAjIy
 cRuZycKg/kLXmSjav/Ib512GtA6bNTOWP4UwjyunflxNgk38lWuip12ldpWceKsZbiXx
 xU96sLllwKVuW3XJn6ZEEXgVjB4v96ooqM7otfgP8K5Fx3nFiNee1Bb7c6oO8HGf46rH
 OMtkwa2eMIrwKenq8R83eh0IRB5NqLM8JH6VAYAV/MjEbXHEWTKxX575izVdIcrC7N4k
 Bc79XmqA0EGl042p0ikVwb9p8RQ9GP5b4CP74yGeUJp8Dgwt0DFYsfZnaNU54bbNU/Uu
 WmEQ==
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
Cc: Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Derek Basehore <dbasehore@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rock wang <rock_wang@himax.com.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmVycnksCgpPbiAyMDE5LzA3LzI5LCBKZXJyeSBIYW4gd3JvdGU6Cj4gCj4gRnJvbSA5YzYz
ZWQ2NTQ2OWUwNzU0MzBhMDdmODkwMTJjZDExNmM0MjdiZDZmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQo+IEZyb206IEplcnJ5IEhhbiA8aGFueHU1QGh1YXFpbi5jb3JwLXBhcnRuZXIuZ29vZ2xl
LmNvbT4KPiBEYXRlOiBNb24sIDI5IEp1bCAyMDE5IDExOjMwOjQ4ICswODAwCj4gU3ViamVjdDog
W1BBVENIXSBbdjldIGRybS9wYW5lbDogQWRkIEJvZSBIaW1heDgyNzlkIE1JUEktRFNJIExDRCBw
YW5lbAo+IApQbGVhc2Ugc3VibWl0IHBhdGNoZXMgYXMgb3V0bGluZWQgaW4gdGhlIGRvY3VtZW50
YXRpb24gWzFdLgoKQXMgYSBub24gbmF0aXZlIEVuZ2xpc2ggc3BlYWtlciB0byBhbm90aGVyLCBJ
IHdvdWxkIHN1Z2dlc3QgY2FyZWZ1bGx5CnJlYWRpbmcgdGhyb3VnaCB0aGUgaW5zdHJ1Y3Rpb25z
LiBJIGZvdW5kIHRoZW0gdmVyeSB1c2VmdWwuCgpIVEgKRW1pbAoKWzFdIERvY3VtZW50YXRpb24v
cHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
