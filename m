Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC13113CAD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 08:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8D66F5B2;
	Thu,  5 Dec 2019 07:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511286F5B2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 07:59:38 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-tT6gAh_qMPS77_AhuPBcsA-1; Thu, 05 Dec 2019 02:59:35 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34FBB800C76;
 Thu,  5 Dec 2019 07:59:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7E8119756;
 Thu,  5 Dec 2019 07:59:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E397916E08; Thu,  5 Dec 2019 08:59:32 +0100 (CET)
Date: Thu, 5 Dec 2019 08:59:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 1/4] udmabuf: use cache_sgt_mapping option
Message-ID: <20191205075932.snbhtituu36qg63t@sirius.home.kraxel.org>
References: <20191203013627.85991-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20191203013627.85991-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: tT6gAh_qMPS77_AhuPBcsA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575532777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zgb2a8Czrrq+vX+G6YMoU8aIdvJ7kkwEKHHtHla4/hc=;
 b=e9S4Si7H6K+5WF/uBHT4jIDg4iFhFqlCi7GwWrR3mjFvNpG7jimxAGDcnoo0GyE9w47UlV
 3KVLsUNmjZfvVlib650EnVVKJSFt0zgohAExrtizt+DPHPH26a4NScZuURSEvoex2Vufae
 cFrL8qhpnJzpHJ8EoDxdsR7Nu+MMMxE=
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
Cc: hch@lst.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMDU6MzY6MjRQTSAtMDgwMCwgR3VyY2hldGFuIFNpbmdo
IHdyb3RlOgo+IFRoZSBHRU0gcHJpbWUgaGVscGVycyBkbyBpdCwgc28gc2hvdWxkIHdlLiBJdCdz
IGFsc28gcG9zc2libGUgdG8gbWFrZQo+IGl0IG9wdGlvbmFsIGxhdGVyLgoKQWxsIDQgcHVzaGVk
IHRvIGRybS1taXNjLW5leHQuCgp0aGFua3MsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
