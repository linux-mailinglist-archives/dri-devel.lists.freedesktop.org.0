Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231B696FE93
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 01:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2B810EB1D;
	Fri,  6 Sep 2024 23:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="ZDtKcfWf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E4310EAB2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 17:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1725642972; x=1757178972;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version:subject;
 bh=4xhWtc7CtkE+FLCLNhkR4IQuATgyvvDPBA+MoqFo+W0=;
 b=ZDtKcfWf3qCUNYR4FvpbeXPUqWpxAilZOjqW5yyr0mRwNo2zny5zgXv9
 Gm4LT7+s0/e9itY2LjWVWjNmW8rnos00gvqV6jzfD2LosvU3U+ISfZ83J
 WmfraDJ6NO2+AHriSu5hB9Tdkfv02EdWsPgj1IlCe9/bX40GPeC2NKSYJ 8=;
X-IronPort-AV: E=Sophos;i="6.10,208,1719878400"; d="scan'208";a="431739480"
Subject: Re: [PATCH v2] drm/panthor: Display FW version information
Thread-Topic: [PATCH v2] drm/panthor: Display FW version information
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 17:16:10 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.7.35:22519]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.242:2525]
 with esmtp (Farcaster)
 id b642eb28-c552-4ced-a703-cecb39d0e46d; Fri, 6 Sep 2024 17:16:09 +0000 (UTC)
X-Farcaster-Flow-ID: b642eb28-c552-4ced-a703-cecb39d0e46d
Received: from EX19D003AND001.ant.amazon.com (10.37.240.251) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Fri, 6 Sep 2024 17:16:08 +0000
Received: from EX19D037UWC001.ant.amazon.com (10.13.139.197) by
 EX19D003AND001.ant.amazon.com (10.37.240.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Fri, 6 Sep 2024 17:16:06 +0000
Received: from EX19D037UWC001.ant.amazon.com ([fe80::9936:96b9:2328:fd07]) by
 EX19D037UWC001.ant.amazon.com ([fe80::9936:96b9:2328:fd07%5]) with
 mapi id 15.02.1258.034; Fri, 6 Sep 2024 17:16:05 +0000
From: "Healy, Christopher" <healych@amazon.com>
To: Steven Price <steven.price@arm.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Zhong, Qinglong" <qingloz@amazon.com>
Thread-Index: AQHbAEDf8zOuA1c83kyB4gJ4DEO1LLJKiw6A
Date: Fri, 6 Sep 2024 17:16:05 +0000
Message-ID: <A30852B6-E4F1-45AA-89C5-D60651755BD8@amazon.com>
References: <20240906094025.638173-1-steven.price@arm.com>
In-Reply-To: <20240906094025.638173-1-steven.price@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.142.214.244]
Content-Type: text/plain; charset="utf-8"
Content-ID: <64DBCBDF14D74F4EA01F5C5343DA0030@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Sep 2024 23:45:00 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBsb29rcyBnb29kIG9uIGEgRzMxMCBiYXNlZCBwbGF0Zm9ybSB3aXRoIG9sZGVyIEZXIGZy
b20gTWFsaSBEREsgYW5kIFBhbnRob3IgZHJpdmVyLiAgT3V0cHV0IGxvb2tzIGFzIGZvbGxvd3M6
DQoNClsgICAgNS44OTY5OTRdIHBhbnRob3IgMTMwMDAwMDAubWFsaTogW2RybV0gRmlybXdhcmUg
Z2l0IHNoYTogYjQwMjcwYWMyMTkxNDY2ZmRlMTkwMWNhMGZiZTg5NTNkYmYxZDg1Yw0KDQoNCu+7
v09uIDkvNi8yNCwgMjo0MCBBTSwgIlN0ZXZlbiBQcmljZSIgPHN0ZXZlbi5wcmljZUBhcm0uY29t
IDxtYWlsdG86c3RldmVuLnByaWNlQGFybS5jb20+PiB3cm90ZToNCg0KVGhlIHZlcnNpb24gbnVt
YmVyIG91dHB1dCB3aGVuIGxvYWRpbmcgdGhlIGZpcm13YXJlIGlzIGFjdHVhbGx5IHRoZQ0KaW50
ZXJmYWNlIHZlcnNpb24gbm90IHRoZSB2ZXJzaW9uIG9mIHRoZSBmaXJtd2FyZSBpdHNlbGYuIFVw
ZGF0ZSB0aGUNCm1lc3NhZ2UgdG8gbWFrZSB0aGlzIGNsZWFyZXIuDQoNCg0KDQoNCg==
